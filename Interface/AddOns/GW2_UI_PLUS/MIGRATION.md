# GW2_UI 改动外迁记录 —— 交接文档

2026-07-27/28 把原先直接改在 `GW2_UI` 本体里的 35 处改动全部搬进插件，本体已回归与上游
**10.14.3 逐字节一致**。以后更新 GW2_UI 直接删目录、解压新版即可，不需要任何手工合并或脚本。

验证命令（应无输出）：

```bash
cd "Interface/AddOns"
diff -rq --strip-trailing-cr \
  "Onesfto/Modules/GW2_UI/GW2_UI_1.15.9" "GW2_UI" | grep -v .DS_Store
```

原始改动的逐文件补丁存在 `Onesfto/Modules/GW2_UI/patches/`，
改动版整目录备份在仓库外：`~/wow-addon-backups/GW2_UI-10.14.3-modified-20260727.zip`。

---

## 两个插件文件夹，各自干什么

### `!GW2_UI_PLUS_Early/` —— 先行加载

只有一件事：**在 GW2_UI 之前**用 AceLocale 注册 380 条补充汉化词条。

为什么必须单独一个文件夹：经典旧世下 GW2_UI 在它**自己的 ADDON_LOADED** 里就跑完了
`evPlayerLogin`，把整个设置窗口连同几百条 `L["..."]` 文本一次性建好。而 `GW2_UI_PLUS`
声明了 `Dependencies: GW2_UI`，必然更晚加载——那时再往 L 表里补词条，界面文字早就定死成
英文了。`!` 开头保证排序在 `GW2_UI` 之前。

自带 LibStub 与 AceLocale-3.0 的副本（共 184 行，与 GW2_UI 里的同版本）。LibStub 会按版本
去重，两边共用同一个 `AceLocale.apps` 注册表；而默认语言包 enUS 用的 `writedefaultproxy`
**明确拒绝覆盖已有值**，所以我们先写进去的中文能保住。

### `GW2_UI_PLUS/` —— 主插件

| 文件 | 原来在哪 | 怎么外挂的 |
|---|---|---|
| `locale/Hardcoded.lua` | advanced_stats.lua / talents.xml / panel_objectives.lua | 三处不走语言包的写死英文，改成建好之后覆盖文本 |
| `fixes/Fixes.lua` | gossip / popupFrame / ImmersiveQuestingFrame / aurabar / objectives / utils / inventory / 9 个 panel_* | 见下 |
| `fixes/Spellbook.lua` | spellbook.lua | 事后重设翻页 snippet 与按钮施法属性 |
| `fixes/Diagnostics.lua` | slashcommands.lua | `/gw2 escdebug` 改成 `/gw2plus escdebug` |
| `social/*.lua`（6+1） | Games/Shared/Social/*.lua | 整体搬迁，覆盖 `GW.LoadSocialFrame` 等 6 个公开函数，自行驱动 |
| `skins/TradeSkill.lua` | 自建的 tradeskill.lua（上游没有这个文件） | 原样搬家，开关改用 `GW2_UI_PLUS_SV` |
| `skins/Mail.lua` | Games/Shared/Immersive/Skins/mail.lua | 整文件搬迁，自行驱动 |
| `skins/QuestLog.lua` | Games/Classic/Immersive/Skins/questLog.lua | 整文件搬迁，覆盖 `GW.LoadQuestLogFrameSkin`，由上游调用 |
| `skins/Options.lua` | panel_skins.lua / panel_interface_features.lua | 三个被上游 hidden 挡掉的开关，在 PLUS 面板重开 |

`fixes/Fixes.lua` 里的六件事：ESC 键失灵（三个窗口）、光环改右键取消、Questie 等级前缀去重、
按需加载窗口 `/reload` 后整个看不见、补上游 Classic 分支漏掉的 `GW.SkinBagSearchBox`、
设置面板中文标题被截断（一段遍历覆盖上游散落的 30 处）。

---

## 三条让外挂成立的关键事实

1. **`GW2_ADDON = GW`**（`GW2_UI/core/init.lua:7`）——整个命名空间全局可读可写，
   `function GW.XXX()` 写在 PLUS 里就等于覆盖上游同名函数。
2. **`Gw*` 皮肤方法挂在 widget 元表上**（`core/API/toolkit.lua` 的 `addapi()`）——
   任意插件的任意 frame 都能直接 `:GwSkinButton()`。
3. **官方外部设置面板 API**（`GW2_UI/AddonSettingIntegrationReadMe.md`）——
   `GW.GetSettingsTabFrame()` + `AddSettingsPanel`，PLUS 的设置面板走的就是这条。

## 一个必须记住的时序陷阱

经典旧世下 `evPlayerLogin` 在 GW2_UI **自己的 ADDON_LOADED** 就跑了
（`core/GW2_ui.lua:955-959`，为了规避硬核服的脚本预算），**早于 PLUS 的任何代码**。
所以：

- `GW.LoadCharacter()`（法术书、天赋、角色窗口）、`GW.BuildSettingsWindow()`（全部设置面板）
  在 PLUS 加载前就建好了 → 只能事后修，不能覆盖构建函数
- 但 `evLoadSkins` 走 PLAYER_LOGIN 里的 `C_Timer.After(0, ...)`，比 PLUS 晚 →
  皮肤类函数（questLog 等）可以放心覆盖，上游会调到我们的版本

判断「能不能覆盖」时先查这个函数是在 `evPlayerLogin` 还是 `evLoadSkins` 里被调用的。

## 为什么不会双跑

`LoadSocialFrame` / `LoadMailSkin` 上游在经典旧世被 `if GW.Retail or GW.TBC` 这类条件挡住，
**从来不会被调用**，PLUS 覆盖后自己驱动，只跑一次。
`LoadQuestLogFrameSkin` 上游会调用，所以 PLUS 只覆盖、不自己驱动。
改动这块时务必确认清楚是哪一种，否则会跑两遍。

---

## 有意放弃的两处

- `panel_skins.lua` 里把邮件开关从 general 组挪到 gameFrames 组：纯 UI 位置调整，
  外部只能「隐藏旧控件 + 新增一个」，会破坏面板自动排版和搜索索引，不值当。
  功能性效果（经典旧世启用邮件皮肤）由 `skins/Mail.lua` 保证，开关放在 PLUS 自己的面板。
- 往 GW2_UI 原生「皮肤」面板里插入新开关：`XXX_SKIN_ENABLED` 是 `defaults2.lua` 里的
  硬编码表，没有给外部留注册接口。所以专业面板的开关用 `GW2_UI_PLUS_SV` 自己存。

## 升级 GW2_UI 之后要复验什么

10.15.0 做了**背包与银行的完全重构**，重点看：

1. `fixes/Fixes.lua` 里的 `GW.SkinBagSearchBox` 兜底实现——它是照抄上游 Classic 分支的
   `reskinSearchBox`，如果上游重写了搜索框，这段要跟着更新。
   消费者是 `BetterBags/themes/gw2.lua` 和 GW2_UI 自己的 whoList 皮肤。
2. `core/GW2_ui.lua` 的 `evPlayerLogin` / `evLoadSkins` 分工有没有变（见上面的时序陷阱）。
3. `social/` 和 `skins/Mail.lua` 是整文件搬迁的，上游若改了这些文件，
   需要拿新版重新走一遍搬迁（改文件头 + 加驱动），而不是继续用旧副本。
   对比基线换成新版本的纯净副本即可。
