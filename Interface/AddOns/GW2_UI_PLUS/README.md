# GW2 UI Plus —— 交接文档

GW2_UI 的外挂式扩展包。所有对 GW2_UI 的定制都住在这里，**GW2_UI 本体保持与上游逐字节一致**，
升级时直接删目录解压新版即可，不需要合并、不需要跑脚本。

具体每处改动是从本体哪里搬来的、怎么搬的，见 [MIGRATION.md](MIGRATION.md)。
本文档讲的是搬完之后这个插件长什么样、怎么继续往下做。

---

## 〇、最重要的一条规矩

**永远不要改 `Interface/AddOns/GW2_UI/` 里的任何文件。**

想验证有没有破例，随时跑：

```bash
cd "Interface/AddOns"
diff -rq --strip-trailing-cr \
  "Onesfto/Modules/GW2_UI/GW2_UI_1.15.9" "GW2_UI" | grep -v .DS_Store
```

无输出 = 本体干净。（`GW2_UI_1.15.9` 是纯净的上游 10.14.3 副本，升级本体后要同步换成新版纯净副本。）

---

## 一、两个文件夹

| 文件夹 | 加载时机 | 干什么 |
|---|---|---|
| `!GW2_UI_PLUS_Early/` | **GW2_UI 之前** | 只做汉化词条注册 |
| `GW2_UI_PLUS/` | GW2_UI 之后 | 其余全部 |

### 为什么要拆成两个

经典旧世下 GW2_UI 在**它自己的 `ADDON_LOADED`** 里就跑完了 `evPlayerLogin`
（`core/GW2_ui.lua:955-959`，作者为了规避硬核服的脚本预算故意提前的），
那一步就把整个设置窗口连同几百条 `L["..."]` 文本一次性建好了。

而本插件声明了 `## Dependencies: GW2_UI`，必然更晚加载——那时再往 `L` 表里补词条，
界面上的字早就定死成英文了。**这是之前「汉化不生效」的唯一原因。**

所以词条挪进一个 `!` 开头的文件夹（`!` 排序在字母前，保证先加载），
赶在 GW2_UI 之前用 AceLocale 注册。它自带 LibStub 与 AceLocale-3.0 副本（共 184 行，与 GW2_UI 同版本）：
LibStub 按版本去重，两边共用同一张 `AceLocale.apps` 注册表；
而默认语言包 enUS 用的 `writedefaultproxy` **明确拒绝覆盖已有值**，所以先写进去的中文能保住。

---

## 二、文件清单

```
!GW2_UI_PLUS_Early/
├── Libs/LibStub/LibStub.lua
├── Libs/AceLocale-3.0/AceLocale-3.0.lua
└── zhCN.lua                    380 条补充汉化词条

GW2_UI_PLUS/
├── locale/Hardcoded.lua        3 处不走语言包的写死英文
├── fixes/Fixes.lua             6 组本体 bug 修复
├── fixes/Spellbook.lua         法术书点击失效 + 翻页跳回
├── fixes/Diagnostics.lua       /gw2plus 诊断命令
├── alaGearMan/                 内嵌的一键换装插件（第三方原样打包）
├── Toolbar/                    队伍管理、快捷条、标记条、性能条
├── ChatBar/                    频道按钮条（见 ChatBar/README.md）
├── ChatWindow/                 聊天窗位置大小、外观、消息过滤（见 ChatWindow/README.md）
├── ActionBar/                  全局渐隐、动作条尺寸、法师动作条（见 ActionBar/README.md）
├── social/                     社交窗口六件套 + 驱动
├── skins/TradeSkill.lua        专业与制造面板皮肤（自建，上游没有）
├── skins/Mail.lua              邮件皮肤
├── skins/QuestLog.lua          任务日志双栏布局
├── skins/Options.lua           三个被上游挡掉的开关
├── skins/Core.lua              第三方插件皮肤引擎（见 skins/SKIN_STANDARD.md）
├── skins/NovaWorldBuffs.lua    NWB 皮肤
├── skins/NovaWorldBuffs_zhCN.lua  NWB 补充汉化
└── core.lua                    设置面板汇总
```

### `fixes/Fixes.lua` 里的六件事

| 修的问题 | 挂在哪 |
|---|---|
| ESC 键失灵 | `GossipFrame` / `GwPopupFrame1..4` / `GwImmersiveQuestFrame` 的 OnShow/OnHide，恢复 `SetPropagateKeyboardInput(true)` |
| 左键误取消 buff | `hooksecurefunc("GwAuraTmpl_OnLoad")`，清掉 `type`、改挂 `type2="cancelaura"` |
| Questie 等级前缀重复（`[60] [60R] 任务名`） | `hooksecurefunc(GwQuestLogBlockMixin, "UpdateBlock")`，剥掉 GW2 前缀后面多出来的那个方括号 |
| 按需加载窗口 `/reload` 后整个看不见 | 包装 `GW.CreateFrameHeaderWithBody`，窗口本来就可见时把开场遮罩推到位 |
| `GW.SkinBagSearchBox` 缺失 | 上游只在正式服/TBC/WLK/MoP 导出，Classic 分支漏了。**BetterBags 的 gw2 主题和本体的 whoList 皮肤都要用**，缺了会报错 |
| 中文标题被截断 | 遍历设置窗口所有面板，统一 `header:SetWidth(GetStringWidth() + 10)`。一段代码覆盖上游散落在 9 个 `panel_*.lua` 里的 30 处 |

### `ChatWindow/` 六个文件

| 文件 | 干什么 | 抄谁 |
|---|---|---|
| `ChatWindow.lua` | 位置与大小，配置表与默认值都在这儿 | NDui |
| `MsgTrim.lua` | 重复符号 / 叠字 / 叠句裁减算法 | CChatFilter（整文件搬迁） |
| `Filter.lua` | 黑名单、进出频道、裁减的挂接 | CChatFilter（重写） |
| `ClassColor.lua` | 发言人名字按职业着色 | Leatrix Plus |
| `EditBox.lua` | 输入栏移到聊天窗顶端 | Leatrix Plus |
| `Options.lua` | 设置面板 | 本项目 ChatBar |

细节见 [ChatWindow/README.md](ChatWindow/README.md)。这里只记三条最容易踩的：

- **位置靠 `hooksecurefunc(ChatFrame1, "SetPoint")` 守住**，而 `Apply` 自己就要调
  `SetPoint` 和 `FCF_DockUpdate`——**必须全程持锁**，不然无限递归。
  `EditBox.lua` 对输入框是同一套路数、同样要锁。
- **默认下边距 46 不是随手填的**：GW2_UI 把输入框锚在聊天窗**下方**
  （`chatframe.lua:728`），留 0 的话输入框会落到屏幕外。开了「输入栏移到顶部」才能调到 0。
- **「界面错误太多」那条提示是 BugGrabber 自己 `print` 的**
  （`!BugGrabber/BugGrabber.lua:325`），不是暴雪发的，也不走事件过滤器。
  它响起来说明有插件每秒报错几十次，且 BugGrabber 此时**已经停止记录**了——
  屏蔽的只是提示，不是错误。

---

## 三、toc 加载顺序（不可随意调换）

```
locale/Hardcoded.lua      ← 其它模块可能读 L
fixes/Fixes.lua           ← SkinBagSearchBox 兜底必须早于任何皮肤
fixes/Spellbook.lua
fixes/Diagnostics.lua
alaGearMan/alaGearMan.xml
Toolbar/Core.lua          ← 存档、mover 与公共控件
Toolbar/GroupManage.lua   ← 接管 GW2_UI 原生队伍管理
Toolbar/QuickBar.lua      ← 八按钮快捷条（无战斗记录）
Toolbar/MarkerBar.lua     ← Classic Era 目标标记条
Toolbar/PerformanceBar.lua ← FPS、本地/世界延迟
Toolbar/Options.lua       ← 工具条设置页
ChatBar/ChatBar.lua       ← 必须在 Options.lua 之前
ChatBar/Options.lua       ┐
ChatWindow/ChatWindow.lua │ 定义 ChatWindow 表与 InitDB，必须最先
ChatWindow/MsgTrim.lua    │ Filter 加载时就要读它导出的裁减函数
ChatWindow/Filter.lua     │
ChatWindow/ClassColor.lua │
ChatWindow/EditBox.lua    │
ChatWindow/Options.lua    │ 同样：本体必须在自己的 Options.lua 之前
ActionBar/ActionBar.lua   │ 定义 AB 表与 InitDB，另外三个都依赖它
ActionBar/MageBar.lua     │
ActionBar/Fader.lua       │
ActionBar/Options.lua     │
social/*.lua ×6           │
social/Social.lua         │ 六个文件必须在 Social.lua 之前
skins/TradeSkill.lua      │ 需要往设置面板加选项的模块
skins/Mail.lua            │ 都必须在 core.lua 之前
skins/QuestLog.lua        │
skins/Options.lua         ┘
core.lua                  ← 汇总构建设置面板
skins/Core.lua            ← 皮肤引擎，第三方皮肤在它之后
skins/NovaWorldBuffs.lua
skins/NovaWorldBuffs_zhCN.lua
```

`core.lua` 在 `PLAYER_ENTERING_WORLD` 里汇总构建面板，所以只要在它之前加载、
把构建函数挂到 `addonTable` 上就行。

---

## 四、存档变量

| 变量 | 归谁 | 存什么 |
|---|---|---|
| `GW2_UI_PLUS_SV` | 本插件 | `TRADESKILL_SKIN_ENABLED`、`alaGearMan_Enable`，以及 `Toolbar` 下四个工具条的启用、缩放、尺寸和功能选项（悬浮按钮与缩放那两项其实是直接读写 `alaGearManSV`） |
| `GW2_UI_PLUS_ChatBarSV` | ChatBar | 见 `ChatBar/README.md` |
| `GW2_UI_PLUS_ChatWindowSV` | ChatWindow | 位置大小、职业颜色、输入栏置顶、过滤器四项与关键词 |
| `GW2_UI_PLUS_ActionBarSV` | ActionBar | 渐隐全部选项、主动作条尺寸、血球缩放、法师动作条全部选项 |
| `alaGearManSV` | alaGearMan | 第三方插件自己的 |
| `GW.settings.*` | **GW2_UI 本体** | `USE_SOCIAL_WINDOW`、`MAIL_SKIN_ENABLED`、`MAILBOX_POSITION`、`SOCIAL_POSITION`、`CHAT_BUTTONS_POSITION`；另外 ActionBar 用到 `MultiBarXXX.size`（动作条 2-8 尺寸）、`castingbar_pos_scale`（施法条缩放）、`MageBar_pos` 与 `MainActionBar_pos`（法师条 / 主条位置），Toolbar 用四个 `GW2PlusToolbar*Pos` 键保存编辑界面位置 |

最后一行值得注意：社交窗口和邮件的开关、位置记忆用的都是 **GW2_UI 自己的存档**，
不是我们的。这是有意的——它们本来就是本体的功能，只是上游用 `hidden` 把经典旧世的开关挡住了，
我们只是在自己的面板里重开一个入口，读写的仍是同一个值。切换配置文件时行为和本体一致。

反过来，专业面板皮肤是我们自建的功能，GW2_UI 的 `XXX_SKIN_ENABLED` 是
`defaults2.lua` 里的硬编码表、没有给外部留注册接口，所以用 `GW2_UI_PLUS_SV` 自己存。

---

## 五、设置面板

位置：GW2_UI 设置窗口 → **附加组件**

菜单是按注册顺序排的（`BuildFlatMenuData` 不做排序），本插件比本体晚加载，所以自然落在最后。
`AddSettingsPanel` 最后那个 `isAddon = true` 管的不是排序，而是注册后立刻刷新菜单数据源
（本体自己的面板是批量建完再统一刷的，外部插件晚到，得自己触发一次）。

```
附加组件
├── 一键换装      alaGearMan 全部选项（换装栏 / 一键脱光 / 其他 三组）  core.lua 内联
├── 动作条        全局渐隐 / 按钮尺寸 / 血球与施法条 / 法师动作条  ActionBar/Options.lua
├── 频道按钮      ChatBar 全部选项                      ChatBar/Options.lua
├── 聊天窗口      位置大小 / 外观 / 消息过滤            ChatWindow/Options.lua
├── 界面皮肤      专业面板 / 邮件界面 / 社交窗口        skins/Options.lua
├── 插件悬浮按钮  小地图第三方插件按钮收纳              Minimap/Options.lua
└── 工具条
    ├── 队伍管理  原生入口，仅组队时显示
    ├── 快捷条    离队、传送、转换、重置、时间、职责、就位、倒计时
    ├── 标记条    八种目标标记与清除
    └── 性能条    FPS、本地延迟、世界延迟
```

走的是 GW2_UI 的官方外部面板 API，文档在 `GW2_UI/AddonSettingIntegrationReadMe.md`。
新增一个子面板：写个返回 panel 的 `BuildXxxPanel(parent)`，挂到 `addonTable`，
再在 `core.lua` 的 `subPanels` 里 `table.insert` 一条。

「一键换装」面板里那些选项原本藏在悬浮窗齿轮的下拉菜单里，现在悬浮窗齿轮
（`alaGearMan.lua` 的 `func.setting`）改成直接 `GW2_ADDON.GetSettingsTabFrame():OpenSettingsToPanel("gw2_ui_plus_gearman")`
跳到这个面板。面板里的 setter 统一转调 alaGearMan 自己的 `func.drop_handler`
（经 `__ala_meta__.gear.func` 拿到），副作用（重建按钮、删宏、ReArrange 等）与原菜单完全一致，是唯一的真源。

### 三个坑（ChatBar 那边踩过，这里同样适用）

**1. 重载提示要放 `callback`，不能放 `setter`** —— GW2_UI 的 `WrapReloadTracking` 只包装 `callback`。

```lua
setter   = function(value) db.enable = value end,
callback = function() GW.ShowRlPopup = true end,   -- 必须在这里
```

**2. 改了配置值，滑块显示不会自己跟着变** —— 需要重置的滑块要设 `optionName`，
再用 `GW.FindSettingsWidgetByOption()` 找到 widget 手动 `SetValue`。

**3. 下拉框会吃掉它下一行右半列复选框的点击** —— 面板是两列布局，
`boolean` 两两配对，`dropdown` / `slider` / `text` 独占整行
（`settingsWindowSettingsTab.lua:32` 的 `optionTypes`）。
下拉按钮靠右摆、宽 260（x 约 288–548），而 `GwHandleDropDownBox` 给它
`SetFrameLevel(+2)`（`core/API/toolkit.lua:686`），正好压住下一行右列复选框的方块
（x 约 292–308）——**勾点不动，但标题文字还能点**，因为文字不在按钮底下。

所以**下拉框要放在一组的最后**，让它下面只剩分组标题这种不可点击的行。
ChatWindow 的「聊天按钮位置」就是为此排在「外观」组末尾的。

---

## 六、动本体功能之前，先搞清楚这几件事

### 1. 时序：这个函数是在哪一步被调用的

经典旧世下 GW2_UI 分**三个阶段**，差别极大：

| 阶段 | 什么时候 | 相对本插件 | 典型内容 |
|---|---|---|---|
| `evPlayerLogin` | GW2_UI 自己的 ADDON_LOADED（作者为规避硬核服脚本预算故意提前的） | **早于本插件** | `LoadCharacter()`（法术书/天赋/角色窗口）、`BuildSettingsWindow()`（全部设置面板）、`LoadObjectivesTracker()`、`LoadPetFrame()` |
| `evPlayerLoginLate` | PLAYER_LOGIN | **晚于本插件** | **动作条**（`LoadActionBars` → 主条、7 条 multibar、姿态条）、聊天窗、小地图 |
| `evLoadSkins` | PLAYER_LOGIN 里的 `C_Timer.After(0, ...)` | **晚于本插件** | 各种皮肤：questLog、gossip、worldmap…… |

- 落在 `evLoadSkins` 的 → 直接 `function GW.XXX()` 覆盖同名函数，上游会调到我们这版
- 落在 `evPlayerLogin` 的 → 来不及接管构建过程，只能**事后重设**已经建好的框体
- 落在 `evPlayerLoginLate` 的 → 本插件的**文件加载期框体还不存在**，
  得等 PLAYER_LOGIN 之后（用 `PLAYER_ENTERING_WORLD` 最省事）再动手

`skins/QuestLog.lua` 是第一类（覆盖即可，不用自己驱动）；
`fixes/Spellbook.lua` 是第二类（法术书早建好了，只能事后改属性）；
`ActionBar/` 是第三类——所以它那三个模块都只定义函数，
统一由 `ActionBar/ActionBar.lua` 末尾那个 PEW 驱动。

**注意第一、二阶段的分界很反直觉**：设置面板比本插件**早**（所以汉化词条要塞进
`!GW2_UI_PLUS_Early/`，见第一节），而动作条比本插件**晚**。同一个登录流程里，
一个赶不上、一个等得到。

### 2. 会不会双跑

覆盖同名函数之前，先确认上游在经典旧世**到底会不会调用它**：

| 函数 | 上游经典旧世 | 我们的做法 |
|---|---|---|
| `GW.LoadSocialFrame` | 被 `if GW.Retail or GW.TBC` 挡住，不调用 | 覆盖 + `social/Social.lua` 自己驱动 |
| `GW.LoadMailSkin` | 被 `if not (GW.Classic or GW.TBC)` 挡住，不调用 | 覆盖 + `skins/Mail.lua` 结尾自己驱动 |
| `GW.LoadQuestLogFrameSkin` | **会调用** | 只覆盖，**不要**自己驱动 |

搞反了就会跑两遍。

### 3. 要改的东西够不够得着

外部能改的前提是有全局名或挂在 `GW` 表上。三根支柱：

- **`GW2_ADDON = GW`**（`GW2_UI/core/init.lua:7`）—— 整个命名空间全局可读可写，
  在本插件里写 `function GW.XXX()` 就等于覆盖上游同名函数
- **`Gw*` 皮肤方法挂在 widget 元表上**（`core/API/toolkit.lua` 的 `addapi()`）——
  任意插件的任意 frame 都能直接 `:GwSkinButton()` / `:GwCreateBackdrop()` / `:GwSetFontTemplate()`
- **官方外部设置面板 API** —— `GW.GetSettingsTabFrame()` + `AddSettingsPanel`

够不着的典型（这类只能整文件搬迁）：

- **文件级 upvalue** —— `mail.lua` 开头那几个 `local MailFrame = _G.MailFrame`
  在文件解析时就绑定了，外部永远碰不到
- **纯 local 的子函数** —— `hooksecurefunc` 无从下手
- **Mixin 值拷贝** —— `Mixin(frame, mixin)` 是把函数拷进 frame 表的，
  hook mixin 表只对**之后**创建的对象生效（所以 `fixes/Fixes.lua` 里那个 Questie 前缀修复
  必须在文件加载期就挂上，不能等到 PLAYER_ENTERING_WORLD）
- **文件级 local 常数** —— `actionbars.lua` 的 `MAIN_MENU_BAR_BUTTON_SIZE = 48`
  和排到第 6 个按钮后加的那个 `108`，改不了

### 4. 常数够不着，但结果够得着

上面最后一类不一定要搬文件。**只要那个常数最终是通过某个导出函数写进框体的，
就可以让本体先按它的老规矩跑完，我们再把结果覆盖掉**——`ActionBar/` 的按钮尺寸
就是这么做的（`ApplyMainBarLayout` 复刻排布，把 48 换成设定值）。

这条路上有两个坑，两个都得堵：

**坑一：包装导出函数只能拦住「延迟查表」的调用者。**

```lua
callback = function() GW.UpdateMainBarHot() end   -- 调用时才查表 → 走我们的包装 ✓
callback = GW.UpdateMainBarHot                    -- 建面板时就取了函数值 → 拿到原版 ✗
```

本体设置面板是在 `evPlayerLogin`（比我们早）里建的，所以第二种写法拿到的
永远是原版，包装拦不住。`panel_actionbar.lua` 里两种写法混着用。

**坑二：所以还需要一层「结果被改了就纠正回来」。**

给框体/按钮的 `SetPoint` 挂 `hooksecurefunc`，发现位置不是我们要的就拉回来，
配一个布尔锁防递归。本体自己对 multibar 按钮用的就是这个套路
（`actionbars.lua:906`），照抄即可。

判断标准：如果那个常数只影响**外观结果**（尺寸、位置、颜色），走这条路；
如果它参与**逻辑分支**（比如决定注册哪个事件），那就只能搬文件。

---

## 七、法术书那块是试验性的

`fixes/Spellbook.lua` 是唯一一处推翻了「必须改源码」旧结论的地方，需要实测确认。

原来的判断是：翻页用的是暴雪安全沙箱 snippet，外部干预必定 Taint，只能改源码。
实际上不用碰那两个 local 函数——要改的全都够得着：

- `GwSpellbookContainerTab{1..6}` 有全局名，
  `.left` / `.right` / `.attrDummy` / `.container1..7` / `.tabs` / `.buttons` 都是它的 parentKey
- 按钮上还存着 `.spellbookIndex` / `.booktype` / `.isFuture` / `.isFlyout`，
  能原样复刻 `setButtonStyle` 里那段分支判断，不用猜

做法是非战斗时重设这些属性——和 GW2_UI 自己做的事完全一样，不涉及暴雪的受保护框体。

**验收标准**：带等级法术左键能施放；连续翻页不跳回第一页；
BugSack 无 taint / "action blocked"；战斗中开合法术书、战斗中学新技能均无报错。

不达标就回退到源码补丁方案：把
`Onesfto/Modules/GW2_UI/patches/Games_Classic_Character_spellbook.lua.patch` 打回本体，
同时删掉 `fixes/Spellbook.lua`（两套并存会互相盖属性）。
原理和当初为什么认定「只能改源码」，见 `Onesfto/Modules/GW2_UI/法术书/法术书修复原理说明.md`
（那份文档提到的 `修复GW2法术书Bug.py` 已经不在仓库里了，只剩说明和上面这个 patch）。
真要走回头路，请在这份文档里写明「这是唯一允许碰本体的地方及原因」。

### 已知的覆盖盲区

法术书每次刷新（`updateSpellbookTab`）都会重设按钮属性，所以我们得在刷新之后再补一遍。
补跑挂在：法术书窗口与各页容器的 `OnShow`、以及 `SPELLS_CHANGED` 等几个事件
（`GwSpellbookMenu` 注册得比我们早，所以它先刷新、我们后补）。

唯一漏网的是上游 `PLAYER_ENTERING_WORLD` 里那次 `C_Timer.After(0.1, updateSpellbookTab)`——
用 `C_Timer.After(0.3, ApplyAll)` 兜住了。这不是在猜插件加载时机，是在等上游一个已知的延时刷新。
真正要点按钮时一定会经过 `OnShow`，所以即使这条失效也不影响使用。

---

## 八、升级 GW2_UI 之后要做什么

1. 删掉 `GW2_UI/` 整个目录，解压新版
2. 把 `Onesfto/Modules/GW2_UI/GW2_UI_1.15.9/` 换成新版的纯净副本（用来做第〇节那个 diff 校验）
3. 按下面清单复验

**10.15.0 做了背包与银行的完全重构**，重点看：

- `fixes/Fixes.lua` 里的 `GW.SkinBagSearchBox` 兜底实现是照抄上游 Classic 分支的
  `reskinSearchBox` 的。上游若重写了搜索框，这段要跟着更新，
  否则 BetterBags 的 gw2 主题和「谁在线」面板会报错
- `core/GW2_ui.lua` 里 `evPlayerLogin` / `evLoadSkins` 的分工有没有变（见第六节第 1 条）
- 上游有没有新增 `Games/Classic/Immersive/Skins/tradeskill.lua`——
  如果作者自己做了专业面板皮肤，我们这份自建的就该退休了

**`ActionBar/` 抄了本体三个写死的数**，升级后要跟着核对（都在
`ActionBar/README.md` 第三节）：

- `Games/Classic/Actionbar/actionbars.lua` 的 `MAIN_MENU_BAR_BUTTON_SIZE = 48`
  和主条排到第 6 个按钮后加的 `108`（我们按 `88 × 1.1 + 11` 反推的）
- `Games/Shared/Units/healthglobe.lua` 的 `GW.RegisterScaleFrame(hg, 1.1)`
- `UpdateMainBarHot` / `UpdateMultibarButtons` 还在不在 `GW` 表上（我们包了一层）

**`social/` 六个文件和 `skins/Mail.lua` 是整文件搬迁的副本。**
上游若改了这些文件，不要继续用旧副本——拿新版重走一遍搬迁流程
（改文件头的 `local GW = select(2, ...)` → `local GW = _G.GW2_ADDON`，再补上驱动代码）。

### 复验清单

| 项 | 怎么看 |
|---|---|
| 汉化 | 设置面板基本无残余英文；角色属性提示框显示「未命中率」；天赋面板显示「天赋预览」；设置菜单里那项叫「任务目标」 |
| 设置面板 | 中文标题不被截断；「附加组件」下五个子面板都在 |
| ESC | 对话 NPC、GW2 弹窗、沉浸任务窗，关掉后 ESC 还能开游戏菜单 |
| 光环 | 左键点 buff 不取消，右键才取消 |
| 任务追踪 | Questie 开着时标题是 `[60] 任务名` 而不是 `[60] [60R] 任务名` |
| 任务日志 | 双栏宽面板，列表 22 行 |
| 社交窗口 | 好友/公会/屏蔽/谁在线/团队五个标签页都正常 |
| 邮件 | 收件箱、写信、读信界面正常 |
| 专业面板 | 专业/附魔窗口是双栏宽面板，标题栏可拖动 |
| 聊天窗口 | 登录后主聊天窗是设定的尺寸和位置；改滑块即时生效；`/reload` 后仍在原位 |
| 聊天外观 | 职业颜色开关即时生效；输入栏置顶后背景不塌、密语窗口也在顶端；聊天按钮位置三档都正常 |
| 聊天过滤 | 黑名单命中的消息不显示；进出频道信息被屏蔽；复读消息被压掉且物品链接完好 |
| 背包 | BetterBags 的 gw2 主题搜索框正常 |
| 动作条 | 尺寸滑块即时生效；改主条尺寸血球不动、空隙仍包住血球；全局渐隐与本体每条的「显示」下拉共存不打架；法师条在 HUD 编辑界面里可拖动。详见 `ActionBar/README.md` 第七节 |
| 法术书 | 见第七节验收标准 |
| `/reload` | 设置窗口开着时重载，窗口不会整个消失 |
| 诊断 | `/gw2plus escdebug`、`/gw2plus fader`、`/gw2plus magebar` 有输出 |

全程盯 BugSack 有没有报错。
