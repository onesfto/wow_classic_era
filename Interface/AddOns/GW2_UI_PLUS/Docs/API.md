# GW2_UI_PLUS API 文档

## 模块系统

所有模块通过 `addonTable` 导出：

```lua
local _, addonTable = ...
local MyModule = addonTable.ModuleName
```

## 公共工具 (Common)

### Performance

性能优化工具模块。

#### Throttle

节流器，限制函数调用频率。

```lua
local Perf = addonTable.Performance

Perf.Throttle("updateUI", 0.1, function()
    -- 最多每 0.1 秒执行一次
end)
```

**参数**:
- `key` (string): 唯一标识
- `interval` (number): 间隔秒数
- `func` (function): 要执行的函数

**返回**: (boolean) 是否执行了函数

#### Debounce

防抖器，延迟执行直到停止调用。

```lua
Perf.Debounce("search", 0.3, function()
    -- 停止调用 0.3 秒后执行
end)
```

**参数**:
- `key` (string): 唯一标识
- `delay` (number): 延迟秒数
- `func` (function): 要执行的函数

#### CacheGlobal

缓存全局变量查找。

```lua
local UnitHealth = Perf.CacheGlobal("UnitHealth", "UnitHealth")
local health = UnitHealth("player")
```

**参数**:
- `key` (string): 缓存键
- `globalName` (string): 全局变量名

**返回**: 缓存的全局变量

#### ClearCache

清空所有缓存。

```lua
Perf.ClearCache()
```

## 动作条 (ActionBar)

### PlusActionBar

动作条主模块。

#### InitDB

初始化存档。

```lua
local AB = addonTable.PlusActionBar
local db = AB.InitDB()
```

**返回**: (table) 存档数据

#### ApplyMainBarLayout

应用主动作条布局。

```lua
AB.ApplyMainBarLayout()
```

#### ApplyMultiBarSizes

应用多动作条尺寸。

```lua
AB.ApplyMultiBarSizes()
```

#### GetMultiBarSize

获取多动作条尺寸。

```lua
local size = AB.GetMultiBarSize(2)  -- 动作条 2 的尺寸
```

**参数**:
- `index` (number): 动作条索引 (2-8)

**返回**: (number) 按钮尺寸

#### SetMultiBarSize

设置多动作条尺寸。

```lua
AB.SetMultiBarSize(2, 36)  -- 设置动作条 2 尺寸为 36
```

**参数**:
- `index` (number): 动作条索引 (2-8)
- `size` (number): 按钮尺寸

#### ApplyGlobeScale

应用地球仪缩放。

```lua
AB.ApplyGlobeScale()
```

#### ApplyCastbarSize

应用施法条尺寸。

```lua
AB.ApplyCastbarSize()
```

### ActionBarOptionsUtils

设置面板工具函数。

#### RedrawSlider

刷新滑块显示值。

```lua
local Utils = addonTable.ActionBarOptionsUtils
Utils.RedrawSlider("optionName")
```

#### RefreshPanel

刷新面板所有控件。

```lua
Utils.RefreshPanel(panel)
```

**参数**:
- `panel` (frame): 面板框架

#### ApplyFader

应用渐隐设置。

```lua
Utils.ApplyFader()
```

#### ApplyLayout

应用布局设置。

```lua
Utils.ApplyLayout()
```

## 换肤系统 (Skins)

### TradeSkillSkinUtils

专业/制造面板皮肤工具。

#### 常量

```lua
local Utils = addonTable.TradeSkillSkinUtils

local icon = Utils.ICON
local width = Utils.PANEL_WIDTH
local height = Utils.PANEL_HEIGHT
```

#### HideRegion

隐藏区域。

```lua
Utils.HideRegion(region)
```

#### ShowRegion

显示区域。

```lua
Utils.ShowRegion(region)
```

#### SkinCloseButton

换肤关闭按钮。

```lua
Utils.SkinCloseButton(button, parentFrame)
```

## 渐隐系统 (Fader)

### PlusFader

全局渐隐模块。

#### Init

初始化渐隐系统。

```lua
local Fader = addonTable.PlusFader
Fader.Init()
```

#### Refresh

刷新渐隐效果。

```lua
Fader.Refresh()
```

## 事件系统

模块使用标准 WoW 事件系统：

```lua
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event, ...)
    -- 处理事件
end)
```

## 存档系统

各模块使用独立的 SavedVariables：

- `GW2_UI_PLUS_SV` - 全局设置
- `GW2_UI_PLUS_ActionBarSV` - 动作条
- `GW2_UI_PLUS_ChatBarSV` - 频道按钮条
- `GW2_UI_PLUS_ChatWindowSV` - 聊天窗口
- `GW2_UI_PLUS_PlayerStatusSV` - 玩家状态
- `GW2_UI_PLUS_CooldownPulseSV` - 技能冷却

## 钩子与覆盖

使用 `hooksecurefunc` 安全钩子：

```lua
hooksecurefunc("FunctionName", function(...)
    -- 原函数执行后调用
end)
```

避免直接覆盖全局函数，除非必要。

## 性能最佳实践

1. **使用节流器**: 高频更新使用 `Performance.Throttle`
2. **缓存全局变量**: 使用 `Performance.CacheGlobal`
3. **避免频繁创建**: 重用框架和表
4. **延迟加载**: 按需加载模块
5. **合理使用 OnUpdate**: 尽量使用事件驱动

## 调试

使用 `/console scriptErrors 1` 启用错误显示。

使用 BugSack 插件捕获错误。

## 更多信息

查看各模块 README 了解详细信息。
