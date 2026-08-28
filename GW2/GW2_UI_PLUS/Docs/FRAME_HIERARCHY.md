# 六类界面框体层级

本文只整理以下六类界面：动作条、头像框、任务日志、人物信息、设置面板、专业面板。

## 读法

- `父框` 是 `CreateFrame` 创建时的 parent，或代码后续通过 `SetParent` 改成的 parent。
- `锚点` 只表示位置参考，不等于父子关系。
- `FrameStrata` 从低到高为：`BACKGROUND < LOW < MEDIUM < HIGH < DIALOG < FULLSCREEN < FULLSCREEN_DIALOG < TOOLTIP`。
- 同一 `FrameStrata` 内，`FrameLevel` 越大越靠上。文档中写“未显式设置”时，表示本插件源码没有固定值，运行时使用 WoW 默认值。
- 没有在本插件中创建的框体标为“GW2_UI/暴雪原生”，这里只记录本插件对它们的父框、锚点或层级修改。

## 1. 动作条

### 父子结构

```text
UIParent
├─ GwPlusPetBarHolder                         [本插件，Frame，MEDIUM]
│  └─ GwPlayerPetFrame.buttons[i]             [GW2_UI，运行时 SetParent(holder)]
├─ GwPlusMageBarHandler                       [本插件，SecureHandlerBaseTemplate]
├─ GwPlusMageBar                              [本插件，Frame]
│  └─ GwPlusMageBarButton[i]                  [本插件，CheckButton]
│     └─ GwPlusMageBarButton[i]PopupBar       [本插件，Frame，DIALOG]
└─ GwPlusActionBarFader                       [本插件，Frame，全屏覆盖]
```

### 具体层级

| 框体 | 父框 | Strata | FrameLevel | 说明 | 源码 |
|---|---|---|---|---|---|
| `GwPlusPetBarHolder` | `UIParent` | `MEDIUM` | 未显式设置 | `SecureHandlerStateTemplate`，承载宠物动作按钮 | `Modules/ActionBar/Layout.lua:425` |
| `GwPlusMageBarHandler` | `UIParent` | 未显式设置 | 未显式设置 | 法师动作条的安全控制器 | `Modules/ActionBar/MageBar.lua:477` |
| `GwPlusMageBar` | `UIParent` | 未显式设置 | 未显式设置 | 法师动作条根框 | `Modules/ActionBar/MageBar.lua:483` |
| `GwPlusMageBarButton[i]` | `GwPlusMageBar` | 未显式设置 | 未显式设置 | `ActionButtonTemplate, SecureActionButtonTemplate` | `Modules/ActionBar/MageBar.lua:201` |
| `GwPlusMageBarButton[i]PopupBar` | 对应主按钮 | `DIALOG` | 调用 `Raise()` | 法术弹出条 | `Modules/ActionBar/MageBar.lua:238-239` |
| `GwPlusActionBarFader` | `UIParent` | 未显式设置 | 未显式设置 | 覆盖 `UIParent`，用于动作条渐隐 | `Modules/ActionBar/Fader.lua:366` |

### 被接管的原生动作条

以下框体不是本插件创建的根框，而是由 `GW2_UI`/暴雪提供，本插件只调整布局或父框：

```text
MainActionBar
GwMultiBarBottomLeft
GwMultiBarBottomRight
GwMultiBarRight
GwMultiBarLeft
GwMultiBar5
GwMultiBar6
GwMultiBar7
GwStanceBar
GwTotemBar
GwPlayerPetFrame
```

- 姿态动作按钮运行时挂到 `GwStanceBar.container` 或 `GwStanceBar`。
- 宠物动作按钮运行时挂到 `GwPlusPetBarHolder`。
- 渐隐功能启用时，目标动作条/按钮可能临时挂到 `GwPlusActionBarFader`；恢复时返回原父框或 `UIParent`。
- `GwPlusMageBar` 的普通按钮在根框下，弹出条使用 `DIALOG`，所以会压在普通动作条内容上方。

## 2. 头像框

### 父子结构

```text
GW2_UI 原生框
├─ GwPlayerUnitFrame
│  ├─ GwPlayerUnitFrame.powerbar
│  └─ GwPlayerPowerBar
├─ GwPlayerPetFrame
│  └─ buttons[i] -> GwPlusPetBarHolder       [动作条布局接管]
├─ Gw2ManaTicker / Gw2EnergyTicker            [GW2_UI 原生]
└─ 其他玩家、目标、宠物子框体                 [GW2_UI 原生]

UIParent
├─ GW2PlusManaTickerMirror                    [本插件，MEDIUM]
│  └─ statusBar                                [StatusBar]
├─ GW2PlusEnergyTickerMirror                  [本插件，MEDIUM]
│  └─ statusBar                                [StatusBar]
├─ GwPlusPetHappiness                         [本插件，Frame，MEDIUM]
└─ GwPlusPetFeed                              [本插件，Button，MEDIUM，安全按钮]
```

### 具体层级

| 框体 | 父框 | Strata | FrameLevel | 说明 | 源码 |
|---|---|---|---|---|---|
| `GW2PlusManaTickerMirror` | 初始为 `UIParent`，随后为玩家框/能量框 | `MEDIUM` | 未显式设置 | 镜像 `Gw2ManaTicker` 的资源跳动 | `Modules/UnitFrames/EnergyTicker.lua:35-42,109` |
| `GW2PlusEnergyTickerMirror` | 初始为 `UIParent`，随后为玩家框/能量框 | `MEDIUM` | 未显式设置 | 镜像 `Gw2EnergyTicker` 的资源跳动 | `Modules/UnitFrames/EnergyTicker.lua:35-42,109` |
| `statusBar` | 对应 ticker mirror | 继承父框上下文 | 未显式设置 | 镜像内部的状态条 | `Modules/UnitFrames/EnergyTicker.lua:42` |
| `GwPlusPetHappiness` | `UIParent` | `MEDIUM` | 未显式设置 | 宠物欢乐度图标 | `Modules/UnitFrames/PetFrame.lua:313-315` |
| `GwPlusPetFeed` | `UIParent` | `MEDIUM` | 未显式设置 | `SecureActionButtonTemplate`，宠物喂食按钮 | `Modules/UnitFrames/PetFrame.lua:316-320` |

头像主体 `GwPlayerUnitFrame`、`GwPlayerPetFrame`、`GwPlayerPowerBar` 等由 `GW2_UI` 创建，本插件没有在这些文件中重新指定它们的根 `FrameStrata`。插件新增的资源镜像和宠物辅助图标统一使用 `MEDIUM`。

## 3. 任务日志

### 父子和锚点结构

```text
QuestLogFrame                                      [暴雪原生根框]
├─ QuestLogListScrollFrame                         [暴雪原生，锚定到 QuestLogFrame]
│  └─ QuestLogTitle[i]                              [本插件补建的列表按钮，parent=QuestLogFrame]
├─ QuestLogDetailScrollFrame                       [暴雪原生，锚定到 QuestLogFrame]
├─ QuestLogFrameAbandonButton                       [暴雪原生]
├─ QuestFramePushQuestButton                        [暴雪原生]
└─ QuestLogFrameCloseButton                         [暴雪原生]

QuestFrame                                           [暴雪原生任务对话根框]
├─ QuestFrameGreetingPanel
├─ QuestFrameProgressPanel
├─ QuestFrameRewardPanel
└─ QuestFrameDetailPanel
```

### 具体层级

| 框体 | 父框/关系 | Strata | FrameLevel | 说明 | 源码 |
|---|---|---|---|---|---|
| `QuestLogTitle[i]` | `QuestLogFrame` | 未显式设置 | 未显式设置 | 当原生列表数量不够时补建，`QuestLogTitleButtonTemplate` | `Modules/Skins/QuestLog.lua:107-113` |
| 任务条目 `item` | 原生任务条目父框 | 未显式设置 | 原值 `+2` | 让任务条目内容压过其基础内容 | `Modules/Skins/QuestLog.lua:55` |
| `QuestLogFrame` 的标题栏 | 由 `GW.CreateFrameHeaderWithBody` 生成 | 由 `GW2_UI` 决定 | 由 `GW2_UI` 决定 | 本插件只传入 `QuestLogFrame`、列表框和详情框 | `Modules/Skins/QuestLog.lua:471` |

任务日志中的列表框和详情框主要是重新 `SetPoint` 到 `QuestLogFrame`，不是本插件重新 `SetParent`。本插件没有给 `QuestLogFrame` 设置固定 `FrameStrata`。

## 4. 人物信息

这里包含人物面板和随插件一起加载的 `alaGearMan` 装备方案窗口。

### 父子结构

```text
GwCharacterWindow 或 PaperDollFrame                    [GW2_UI/暴雪原生]
├─ alaGearMan.ui.open                                    [Button，FrameLevel=9999]
└─ alaGearMan.ui.gearWin                                [Frame，FULLSCREEN]
   ├─ ui.scroll                                          [滚动框，parent=gearWin]
   ├─ ui.save                                             [Button，parent=gearWin]
   ├─ ui.equip                                            [Button，parent=gearWin]
   ├─ ui.setting                                          [Button，parent=gearWin]
   └─ ui.custom                                           [Frame，FULLSCREEN]
      ├─ ui.customEdit                                    [EditBox]
      ├─ ui.customOK                                      [Button]
      ├─ ui.customCancel                                  [Button]
      └─ 自定义图标按钮[i]                                 [Button，parent=custom]

UIParent
├─ alaGearMan.ui.pdf_menu                                 [Frame，FULLSCREEN_DIALOG，parent=PaperDollFrame]
├─ alaGearMan.ui.quick                                    [Frame，未传 parent，默认 UIParent]
│  └─ alaGearMan_Quick[i]                                 [Button，parent=quick]
└─ alaGearMan.ui.secure                                   [Frame，parent=UIParent]
   └─ secure quick buttons[i]                             [CheckButton，parent=secure]
```

### 具体层级

| 框体 | 父框 | Strata | FrameLevel | 说明 | 源码 |
|---|---|---|---|---|---|
| `ui.open` | `GwCharacterWindow` 或 `PaperDollFrame` | 未显式设置 | `9999` | 人物面板上的装备方案入口按钮 | `Libs/alaGearMan/alaGearMan.lua:961-964` |
| `ui.gearWin` | `GwCharacterWindow` 或 `PaperDollFrame` | `FULLSCREEN` | 未显式设置 | 装备方案主窗口 | `Libs/alaGearMan/alaGearMan.lua:1000-1001` |
| `ui.custom` | `ui.gearWin` | `FULLSCREEN` | 未显式设置 | 自定义装备方案窗口 | `Libs/alaGearMan/alaGearMan.lua:1698-1699` |
| `ui.pdf_menu` | `PaperDollFrame` | `FULLSCREEN_DIALOG` | 未显式设置 | 人物面板装备操作菜单 | `Libs/alaGearMan/alaGearMan.lua:460-461` |
| `ui.quick` | 默认 `UIParent` | 未显式设置 | 未显式设置 | 快速装备条根框 | `Libs/alaGearMan/alaGearMan.lua:1123` |
| `ui.secure` | `UIParent` | 未显式设置 | 未显式设置 | 安全装备按钮容器 | `Libs/alaGearMan/alaGearMan.lua:1340` |

`FULLSCREEN` 的 `ui.gearWin` 会压过普通人物面板；`ui.pdf_menu` 使用更高的 `FULLSCREEN_DIALOG`；入口按钮再通过 `FrameLevel=9999` 保证在其父人物框内可点击。

## 5. 设置面板

### 总体父子结构

```text
Gw2SettingsWindow / GwSettingsWindow                   [GW2_UI 原生窗口]
├─ GwSettingsActionBar                                  [本插件 tab]
│  └─ tab.menu
│     └─ 菜单按钮[i]                                    [parent=tab.menu]
├─ GwSettingsUnitFrames                                 [本插件 tab]
│  └─ tab.menu
│     └─ 菜单按钮[i]                                    [parent=tab.menu]
├─ GwSettingsChat                                        [本插件 tab]
│  └─ tab.menu
│     └─ 菜单按钮[i]                                    [parent=tab.menu]
├─ GwSettingsParty                                       [本插件 tab]
│  └─ tab.menu
│     └─ 菜单按钮[i]                                    [parent=tab.menu]
├─ GwSettingsComponents                                  [本插件 tab]
├─ GwSettingsEditMode                                    [本插件 tab]
└─ 当前显示的原生设置页                                 [运行时 SetParent(tab)]

settingsTab                                               [GW2_UI 原生设置页]
└─ p                                                       [GwSettingsPanelTmpl，附加组件根面板]
   └─ gearManFrame                                         [GwSettingsPanelTmpl，装备管理子面板]
```

### 具体层级

| 框体 | 父框 | 模板/层级 | 说明 | 源码 |
|---|---|---|---|---|
| `p` | `settingsTab` | `GwSettingsPanelTmpl` | “附加组件”根面板 | `core.lua:30` |
| `gearManFrame` | `p` | `GwSettingsPanelTmpl` | 装备管理设置子面板 | `core.lua:53` |
| `GwSettingsActionBar` | `settingsWindow` | `GwSettingsSettingsTabTemplate` | 动作条设置 tab | `Modules/ActionBar/Options.lua:266-267` |
| `GwSettingsUnitFrames` | `settingsWindow` | `GwSettingsSettingsTabTemplate` | 头像框设置 tab | `Modules/Settings/Settings.lua:1900-1902` |
| `GwSettingsChat` | `settingsWindow` | `GwSettingsSettingsTabTemplate` | 聊天设置 tab | `Modules/Settings/ChatTab.lua:38-40` |
| `GwSettingsParty` | `settingsWindow` | `GwSettingsSettingsTabTemplate` | 队伍设置 tab | `Modules/Settings/PartyTab.lua:29-31` |
| `GwSettingsComponents` | `settingsWindow` | `GwSettingsSettingsTabTemplate` | 组件设置 tab | `Modules/Settings/ComponentsTab.lua:27-29` |
| `GwSettingsEditMode` | `settingsWindow` | `GwSettingsSettingsTabTemplate` | 编辑模式设置 tab | `Modules/Settings/EditModeTab.lua:11-13` |
| tab 菜单按钮 | 对应 `tab.menu` | `GwSettingsSettingsTabMenuButtonTemplate` | 各 tab 的左侧菜单项 | `Modules/Settings/Settings.lua:2047-2049` 等 |
| 当前设置页 | 原始 parent -> 对应 `tab` | 运行时变更 | 打开某菜单项时嵌入 tab，关闭后恢复 | `Modules/Settings/Settings.lua:2009`、`Modules/Settings/ChatTab.lua:63`、`Modules/Settings/PartyTab.lua:70`、`Modules/Settings/ComponentsTab.lua:53` |

### `GwSettingsPanelTmpl` 面板工厂

以下模块创建的 `panel`/`root` 都使用 `GwSettingsPanelTmpl`，实际父框由调用方传入，通常是 `settingsTab` 或某个设置分类页：

```text
Modules/ActionBar/Options.lua
Modules/ActionBar/Options_Utils.lua
Modules/Toolbar/Options.lua
Modules/ChatBar/Options.lua
Modules/ChatWindow/Options.lua
Modules/CooldownPulse/Options.lua
Modules/General/Options.lua
Modules/Minimap/Options.lua
Modules/Settings/ChatCategories.lua
Modules/Skins/Options.lua
Modules/UnitFrames/PlayerResources.lua
```

这些面板源码没有显式设置 `FrameStrata` 或 `FrameLevel`。

## 6. 专业面板

### 专业制作面板

`TradeSkillFrame` 和 `CraftFrame` 是暴雪 `Blizzard_TradeSkillUI` 的原生根框，本插件不重新创建根框，只调整尺寸、锚点、皮肤和关闭按钮。

```text
TradeSkillFrame                                      [暴雪原生根框]
├─ TradeSkillListScrollFrame                         [原生，锚定到 TradeSkillFrame]
│  └─ TradeSkillSkill[i]                             [本插件补建，parent=TradeSkillFrame]
├─ TradeSkillDetailScrollFrame                       [原生，锚定到 TradeSkillFrame]
│  └─ TradeSkillSkillIcon                             [运行时 SetParent(detailFrame)]
├─ TradeSkillRankFrame                               [原生，锚定到 TradeSkillFrame]
├─ TradeSkillSubClassDropDown / TradeSkillInvSlotDropDown
├─ TradeSkillFrameCloseButton                         [原生，FrameLevel=TradeSkillFrame+20]
└─ GWTradeSkillCloseButton                            [本插件 fallback，DIALOG，parent=TradeSkillFrame]

CraftFrame                                           [暴雪原生根框]
├─ CraftListScrollFrame                               [原生，锚定到 CraftFrame]
│  └─ Craft[i]                                        [本插件补建，parent=CraftFrame]
├─ CraftDetailScrollFrame                             [原生，锚定到 CraftFrame]
│  └─ CraftIcon                                        [运行时 SetParent(detailFrame)]
├─ CraftRankFrame                                     [原生，锚定到 CraftFrame]
├─ CraftFrameFilterDropDown                           [原生，锚定到 CraftFrame]
├─ CraftFrameCloseButton                              [原生，FrameLevel=CraftFrame+20]
└─ GWCraftCloseButton                                 [本插件 fallback，DIALOG，parent=CraftFrame]
```

### 具体层级

| 框体 | 父框/关系 | Strata | FrameLevel | 说明 | 源码 |
|---|---|---|---|---|---|
| `TradeSkillSkill[i]` | `TradeSkillFrame` | 未显式设置 | 未显式设置 | 补足专业列表按钮，最多扩展到 19 个 | `Modules/Skins/TradeSkill_Layout.lua:59` |
| `Craft[i]` | `CraftFrame` | 未显式设置 | 未显式设置 | 补足制造列表按钮，最多扩展到 19 个 | `Modules/Skins/TradeSkill_Layout.lua:87` |
| `TradeSkillFrameCloseButton` | 原生 parent | 未修改 | `TradeSkillFrame + 20` | 现有关闭按钮提升层级 | `Modules/Skins/TradeSkill_Utils.lua:63-74` |
| `CraftFrameCloseButton` | 原生 parent | 未修改 | `CraftFrame + 20` | 现有关闭按钮提升层级 | `Modules/Skins/TradeSkill_Utils.lua:63-74` |
| `GWTradeSkillCloseButton` | `TradeSkillFrame` | `DIALOG` | `TradeSkillFrame + 100` | 找不到原生关闭按钮时创建 | `Modules/Skins/TradeSkill_Utils.lua:77-98` |
| `GWCraftCloseButton` | `CraftFrame` | `DIALOG` | `CraftFrame + 100` | 找不到原生关闭按钮时创建 | `Modules/Skins/TradeSkill_Utils.lua:77-98` |
| `TradeSkillSkillIcon` | 运行时改为 `TradeSkillDetailScrollFrame` | 未显式设置 | 未显式设置 | 生产物品图标移动到详情区 | `Modules/Skins/TradeSkill_Utils.lua:358-364` |
| `CraftIcon` | 运行时改为 `CraftDetailScrollFrame` | 未显式设置 | 未显式设置 | 制造物品图标移动到详情区 | `Modules/Skins/TradeSkill_Utils.lua:358-364` |

专业面板的列表区、详情区、等级条和下拉框主要是重新 `SetPoint` 到各自根框；源码没有给 `TradeSkillFrame` 或 `CraftFrame` 设置固定 `FrameStrata`。

## 结论

- 动作条中明确抬高的是法师弹出条：`DIALOG`。
- 头像框新增资源镜像和宠物辅助图标统一是 `MEDIUM`。
- 任务日志根框没有本插件固定的 `Strata`，列表按钮挂在 `QuestLogFrame` 下。
- 人物信息中 `alaGearMan.ui.gearWin`/`ui.custom` 是 `FULLSCREEN`，入口按钮是 `FrameLevel=9999`。
- 设置面板主要是 `settingsWindow -> tab -> tab.menu -> menu button`，设置页打开时临时挂到当前 tab。
- 专业面板只把关闭按钮明确抬到 `DIALOG`，并将 fallback 关闭按钮设置为根框 `FrameLevel + 100`。
