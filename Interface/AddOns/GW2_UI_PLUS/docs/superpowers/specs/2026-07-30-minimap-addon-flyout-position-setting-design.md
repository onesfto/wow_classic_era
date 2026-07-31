# 插件悬浮入口位置设置设计

## 背景

“插件悬浮按钮”目前把入口固定在小地图右侧正中，用户无法从设置页选择其他位置。需要在现有独立设置页中增加八方向位置选项，并立即更新游戏内入口。

## 目标

- 在“附加组件 > 插件悬浮按钮”设置页增加“位置”下拉框。
- 依次提供：左上、上、右上、左中、右中、左下、下、右下。
- 默认位置为左中。
- 切换后立即生效，不需要重载界面。
- 登录、插件刷新或 GW2_UI 再次调整入口后，继续应用保存的位置。
- 保持现有点击、展开、收起、按钮顺序和八列换行行为。

## 保存值与接口

在 `GW2_UI_PLUS_SV` 中增加：

```lua
minimapAddonFlyoutPosition = "LEFT"
```

运行模块导出以下接口：

- `Flyout.GetPosition()`：返回经过校验的位置；无值或无效值时返回 `LEFT`。
- `Flyout.SetPosition(value)`：保存有效位置并调用 `Flyout.Refresh()`，使设置立即生效。

允许的保存值为：

```lua
{
    "TOPLEFT",
    "TOP",
    "TOPRIGHT",
    "LEFT",
    "RIGHT",
    "BOTTOMLEFT",
    "BOTTOM",
    "BOTTOMRIGHT",
}
```

设置页只通过接口读写保存值，不直接操作 `GwAddonToggle`。

## 锚点映射

入口按钮位于小地图边框外侧，间距为 4 像素：

| 设置 | 入口锚点 | 小地图锚点 | X | Y |
|---|---|---|---:|---:|
| 左上 | `TOPRIGHT` | `TOPLEFT` | -4 | 0 |
| 上 | `BOTTOM` | `TOP` | 0 | 4 |
| 右上 | `TOPLEFT` | `TOPRIGHT` | 4 | 0 |
| 左中 | `RIGHT` | `LEFT` | -4 | 0 |
| 右中 | `LEFT` | `RIGHT` | 4 | 0 |
| 左下 | `BOTTOMRIGHT` | `BOTTOMLEFT` | -4 | 0 |
| 下 | `TOP` | `BOTTOM` | 0 | -4 |
| 右下 | `BOTTOMLEFT` | `BOTTOMRIGHT` | 4 | 0 |

`EnsureToggle()` 每次取得入口时清除旧锚点，并使用当前保存值查表定位。这样可以覆盖 GW2_UI Classic 初始化或后续刷新写入的顶部位置。

## 设置页

在启用开关之后增加 `AddOptionDropdown("位置", ...)`：

- `optionsList` 使用八个稳定保存值。
- `optionNames` 使用八个中文名称。
- `getter` 调用 `Flyout.GetPosition`。
- `setter` 调用 `Flyout.SetPosition`。
- `getDefault` 返回 `LEFT`。
- 依赖现有主开关 `GW2PlusMinimapAddonFlyout_Enable`，关闭功能时位置选项不可用。

## 验证

扩展现有测试并执行 RED-GREEN：

- 首次初始化的位置默认值为 `LEFT`。
- 无效保存值回退到 `LEFT`。
- 默认锚点为小地图左侧正中。
- 八个位置分别产生正确的 `SetPoint` 参数。
- `SetPosition()` 会保存值并立即重新定位现有入口。
- 设置页包含八个选项、中文名称、默认值、主开关依赖和稳定设置项名称。
- 原有换肤、八列换行、关闭恢复及延迟刷新测试继续通过。

最后运行相关测试、完整 Lua 测试和 `luac -p`。完整测试中的既有 `SettingsStructure_test.lua:104` 动作条失败单独报告，不纳入本功能回归判断。
