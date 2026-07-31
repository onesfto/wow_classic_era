# GW2_UI 改动外迁与拦截原理 —— 核心交接文档

本项目将所有对 `GW2_UI` 的定制、Bug 修复和国服汉化补充全部剥离为了独立的外挂插件。**本体（`GW2_UI`）保持与上游逐字节一致。**

本指南主要讲解：**当我们需要干预一个封装好的巨型插件时，我们是如何在不动它源码的前提下，通过外部拦截达到目的的。**

---

## 一、主插件 (`GW2_UI_PLUS`) 文件搬迁来源

以下是我们从原先的“源码魔改版”中抽离出来的核心修改点，以及它们现在在外挂插件中的存放位置：

| 新外挂位置 | 原来在本体的哪里 | 拦截/搬迁策略 |
|---|---|---|
| `locale/Hardcoded.lua` | advanced_stats.lua / talents.xml 等 | **事后文本覆盖**：三处写死英文、不走语言包的文本。等界面建好之后强行覆盖文本。 |
| `Core/Fixes.lua` | gossip / aurabar / objectives 等 | **生命周期极早的 Hook**：ESC 失灵修复、光环改右键取消、中文标题被截断等 6 处底层补丁。 |
| `Core/Spellbook.lua` | spellbook.lua | **事后重设属性**：法术书点击失效修复。等本体建好法术书后，重设翻页 snippet 与按钮的 secure 属性。 |
| `Core/Diagnostics.lua` | slashcommands.lua | **覆盖注册**：把 `/gw2 escdebug` 改成 `/gw2plus escdebug`。 |
| `Modules/social/*.lua` | Games/Shared/Social/*.lua | **整目录搬迁与拦截**：拦截并覆盖 `GW.LoadSocialFrame` 等公开函数，由我们的脚本自行驱动。 |
| `Modules/skins/Mail.lua` | Games/Shared/Immersive/Skins/mail.lua | **整文件搬迁**：拦截并自行驱动原生邮件皮肤（因为原版被锁死了不在旧世生效）。 |
| `Modules/skins/QuestLog.lua`| Games/Classic/Immersive/Skins/questLog.lua | **整文件搬迁（被动加载）**：覆盖 `GW.LoadQuestLogFrameSkin`，但**不自行驱动**，等待上游来调用我们的版本。 |
| `Modules/skins/Options.lua` | panel_skins.lua 等 | **重新注册开关**：三个被上游 hidden 挡掉的开关，在我们的面板重开独立设置项。 |

---

## 二、让“外挂”成立的三根支柱

我们之所以能不碰源码就魔改 GW2_UI，全靠以下三个后门：

1. **`GW2_ADDON = GW`**（`core/init.lua:7`）：整个插件的命名空间是**全局暴露可写的**。我们在 PLUS 里写 `function GW.LoadSocialFrame()`，就等同于覆盖了上游的同名函数。
2. **`Gw*` 皮肤方法挂在元表上**（`core/API/toolkit.lua`）：任意插件的任意 Frame，都能直接调用 `:GwSkinButton()`，这意味着我们可以随意创建新皮肤而不需要引入它的工具库。
3. **官方外部设置面板 API**：`GW.GetSettingsTabFrame():AddSettingsPanel(...)` 允许我们将 PLUS 的所有设置无缝嵌入到原生设置窗口中。

---

## 三、最大的深坑：时序陷阱 (`evPlayerLogin` vs `evLoadSkins`)

在决定用哪种方式干预本体时，**你必须先查明你想改的那个原生函数是在哪一步被调用的。** 经典旧世的 GW2_UI 加载时序极其反直觉：

| 阶段 | 触发时机 | 相对本外挂加载期 | 典型内容 | 拦截策略 |
|---|---|---|---|---|
| **`evPlayerLogin`** | **GW2_UI 自己的 ADDON_LOADED** | **早于我们**（拦截不到）| 设置面板构建、法术书、角色窗口、宠物框体。 | **【事后修改】** 框体在我们的代码执行前就已经建好了。只能等它建完，我们再去 `SetPoint` 或重写属性（例如 `Core/Spellbook.lua`）。 |
| **`evPlayerLoginLate`**| `PLAYER_LOGIN` 事件 | **晚于我们** | 所有的**动作条**（主条、姿态条、微型菜单）、聊天窗。 | **【事件等待】** 我们的代码加载时，动作条还不存在。必须用 `PLAYER_ENTERING_WORLD` 延后执行我们的修改（例如 `Modules/ActionBar`）。 |
| **`evLoadSkins`** | `PLAYER_LOGIN` 中的 `C_Timer.After(0)` | **最晚执行** | 大部分皮肤（questLog、gossip、世界地图）。 | **【直接覆盖函数】** 在文件加载期直接 `function GW.XXX = 我们自己的函数`。因为执行得很晚，它一定会调到我们盖过的版本。 |

*注：作者之所以把 `evPlayerLogin` 提早到 `ADDON_LOADED` 阶段，是为了规避硬核服（Hardcore）严格的脚本运算时间预算（Script Execution Time Budget）。*

### 怎么防止“双跑”（代码跑两遍）？
覆盖同名函数之前，一定要确认上游在旧世版本**到底会不会调用它**：
- `LoadSocialFrame`：上游用 `if GW.Retail or GW.TBC` 挡住了，**永远不会被调用**。所以我们覆盖后，必须**自己驱动**。
- `LoadQuestLogFrameSkin`：上游**会调用**。所以我们**只覆盖，绝对不能自己驱动**，否则就会挂载两遍导致报错。

---

## 四、“常数够不着，但结果够得着”的艺术

如果在本体文件里有一个 `local SIZE = 48` 导致我们无法修改它，该怎么办？
答案是：**只要它最终是通过某个导出函数写进框体的，我们就让本体先按它的老规矩跑完，然后再把结果强行“掰回来”。**

例如 `Modules/ActionBar` 修改主动作条的尺寸：
1. 本体调用了 `ApplyMainBarLayout()`，使用了死板的 48 像素。
2. 我们用 `hooksecurefunc(按钮, "SetPoint")` 挂载一个监听。
3. 一旦发现它被设置成了错误的位置或大小，我们就立刻拦截并重新赋予我们在面板中设定的尺寸，配上一个布尔锁防止递归死循环。
4. 这个套路只适用于**只影响外观（尺寸、位置、颜色）**的常数。如果它影响了逻辑分支（比如决定注册哪个事件），那就只能走“整文件搬迁”了。

---

## 五、升级 GW2_UI 之后的复验工作

当你下载了全新的 GW2_UI 覆盖后（注意删除旧的整个目录再解压，切勿直接覆盖文件）：

1. **背包与银行检查**：`Core/Fixes.lua` 里的 `GW.SkinBagSearchBox` 兜底实现是照抄旧版的。如果上游重写了搜索框，这段要跟着更新，否则 BetterBags 会报错。
2. **生命周期检查**：检查 `core/GW2_ui.lua` 里的三个生命周期函数（上面第三节）分工有没有巨变。
3. **原生皮肤**：看上游有没有新增 `Games/Classic/Immersive/Skins/tradeskill.lua`。如果原作者做了专业面板皮肤，我们 `Modules/skins/TradeSkill.lua` 就可以光荣退休了。
4. **硬编码校验**：`Modules/ActionBar` 抄了本体主条换行的像素魔法常数 `108`。如果上游改了排版，这里需要跟着调。

### 验收清单表

| 模块 | 验收标准 |
|---|---|
| **汉化** | 属性提示框显示“未命中率”；天赋面板显示“天赋预览”；设置菜单正常。 |
| **ESC 退出** | 对话 NPC、弹窗、沉浸任务窗，关掉后按 ESC 还能开出原生的主菜单。 |
| **光环** | 左键点击自己身上的 buff 不会取消，必须右键才能取消。 |
| **法术书** | 带等级法术左键能施放；连续翻页不跳回第一页；战斗中打开法术书无报错。 |
| **聊天窗口** | 改滑块尺寸即时生效；`/reload` 后仍在原位；输入栏置顶正常；黑名单生效。 |
| **动作条** | 主条尺寸滑块即时生效且血球空隙正常；全局渐隐正常。 |
| **专业面板** | 成为双栏宽面板，且标题栏可拖动。 |
