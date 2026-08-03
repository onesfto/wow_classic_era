# GW2_UI_PLUS API 文档

本文档只记录模块之间实际复用的接口。`addonTable` 上的对象属于插件内部 API，不承诺为其他插件提供长期兼容的外部 API。

## 模块访问

```lua
local _, addonTable = ...
local Performance = addonTable.Performance
```

新模块通过 `addonTable` 共享对象，不创建新的全局表。文件加载顺序由 `GW2_UI_PLUS.toc` 决定。

## Common

### `addonTable.Performance`

- `Throttle(key, interval, func)`：在间隔内只执行一次 `func`，返回本次是否执行。
- `Debounce(key, delay, func)`：取消同键的待执行回调，延迟后执行最新回调。
- `CacheGlobal(key, globalName)`：缓存 `_G[globalName]`。
- `ClearCache()`：清空全局函数缓存。

```lua
local Perf = addonTable.Performance

Perf.Throttle("refresh", 0.1, Refresh)
local UnitHealth = Perf.CacheGlobal("UnitHealth", "UnitHealth")
```

### `addonTable.SetPanelTitle`

```lua
addonTable.SetPanelTitle(panel, title, breadcrumb)
```

统一设置 GW2_UI 设置面板的标题和面包屑文本。`panel` 为空时直接返回。

## 动作条接口

### `addonTable.PlusActionBar`

主要供动作条、玩家资源和设置模块复用：

- `InitDB()`：初始化并返回 `GW2_UI_PLUS_ActionBarSV`。
- `QueueOutOfCombat(name, func)`：战斗中暂存需要脱战执行的操作；成功排队时返回真值。
- `SetFontStringSize(fontString, size)`：保留字体路径与样式，只修改字号。
- `defaults`：动作条默认配置。
- `MULTIBARS`、`SIZE_MIN`、`SIZE_MAX`：动作条布局常量。

### `addonTable.PlusFader`

- `Init()`：初始化动作条渐隐。
- `Refresh()`：根据当前配置刷新目标动作条。
- `PrintDiagnostics()`：输出当前渐隐状态，供本模块排查问题使用。

### `addonTable.ActionBarOptionsUtils`

这是设置模块使用的控件工具层，不是外部插件接口。当前主要入口包括：

- `CreatePanel(parent, panelId, breadcrumb, description)`
- `CreateOptionWidget(panel, option)`
- `InitializePanel(panel)`
- `RefreshPanel(panel)`
- `AddResetButton(panel, callback)`
- `ApplyFader()`、`ApplyLayout()`

新增动作条设置时，应复用这套工具，不要复制一套选项控件实现。

## 皮肤接口

### `addonTable.Skin`

皮肤模块共享基础控件样式，包括 `SkinFrame`、`SkinButton`、`SkinFont`、`SkinCheckBox`、`SkinScrollBar` 和 `SkinDropDown`。具体参数以 `Modules/Skins/Core.lua` 为准。

### `addonTable.TradeSkillSkinUtils`

专业/制造面板内部工具。它负责区域显隐、控件换肤、窗口尺寸和布局辅助；其他模块不应直接依赖其中的布局常量。

## 设置面板构建器

设置页面构建器由 `core.lua` 和 `Modules/Settings/` 调用，例如：

- `BuildGeneralPanel`
- `BuildChatBarPanel`
- `BuildChatWindowPanel`
- `BuildToolbarPanel`
- `BuildSkinsPanel`
- `BuildWorldMapOptions`
- `BuildMainMenuTab`
- `BuildChatTab`
- `BuildPartyTab`
- `BuildComponentsTab`

这些函数是加载顺序和设置窗口的内部连接点。修改名称或返回的 Frame 结构时，需要同步检查调用方。

## SavedVariables

插件清单当前声明的存档入口：

```text
alaGearManSV
GW2_UI_PLUS_SV
GW2_UI_PLUS_ChatBarSV
GW2_UI_PLUS_ChatWindowSV
GW2_UI_PLUS_ActionBarSV
GW2_UI_PLUS_PlayerStatusSV
GW2_UI_PLUS_PlayerFaderSV
GW2_UI_PLUS_TargetFaderSV
GW2_UI_PLUS_CooldownPulseSV
```

新增配置必须登记在 `GW2_UI_PLUS.toc`，并在对应模块初始化时补齐默认值。

## 变更边界

- 不直接覆盖 GW2_UI 的公共函数，优先使用其注册接口或 `hooksecurefunc`。
- 不在多个模块复制同一份默认配置或设置控件。
- 涉及受保护框体的操作必须遵守战斗锁定规则。
- 修改内部接口时，同时更新调用方和本目录文档。
