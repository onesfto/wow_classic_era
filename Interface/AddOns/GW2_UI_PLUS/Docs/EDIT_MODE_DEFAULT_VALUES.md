# 编辑模式框体默认值

**文档用途**：单独记录编辑模式中各移动框体的默认参数和默认位置。

**最后更新**：2026-08-03

## 记录规则

每个框体分为“参数”和“位置”两部分。位置默认值以需求确认值为准，不使用 GW2_UI 原始文件中的旧位置覆盖本表。

## 施法条

### 参数默认值

| 参数 | 配置键 | 默认值 |
|---|---|---:|
| 启用 | `CASTINGBAR_ENABLED` | `true` |
| 跳数 | `showPlayerCastBarTicks` | `true` |
| 高级施法条 | `CASTINGBAR_DATA` | `false` |
| 显示法术队列窗口 | `PLAYER_CASTBAR_SHOW_SPELL_QUEUEWINDOW` | `true` |
| 宽度 | `castbarWidth` | `300` |
| 高度 | `castbarHeight` | `15` |
| 缩放指数 | `castingbar_pos_scale` | `1`（始终固定为 `1`） |

### 位置默认值

| 位置参数 | 配置字段 | 默认值 |
|---|---|---:|
| 屏幕锚点 | `relativePoint` | `BOTTOM`（下） |
| 框体锚点 | `point` | `BOTTOM`（下） |
| X | `xOfs` | `0` |
| Y | `yOfs` | `200` |

## 额外能量条

### 参数默认值

| 参数 | 配置键 | 默认值 |
|---|---|---:|
| 启用 | `POWERBAR_ENABLED` | `true` |
| 在条上显示数字 | `energyBarShowValue` | `true` |
| 宽度 | `energyBarWidth` | `300` |
| 高度 | `energyBarHeight` | `15` |
| 缩放指数 | `PowerBar_pos_scale` | `1`（始终固定为 `1`） |
| 能量/法力回复提示 | `PLAYER_ENERGY_MANA_TICK` | `true` |
| 5 秒规则显示剩余时间 | `PLAYER_5SR_TIMER` | `true` |
| 仅在战斗中显示回复提示 | `PLAYER_ENERGY_MANA_TICK_HIDE_OFC` | `false` |

### 位置默认值

| 位置参数 | 配置字段 | 默认值 |
|---|---|---:|
| 屏幕锚点 | `relativePoint` | `BOTTOM`（下） |
| 框体锚点 | `point` | `BOTTOM`（下） |
| X | `xOfs` | `0` |
| Y | `yOfs` | `150` |

## 增益光环

以下值为需求确认默认值，以截图和明确需求为准，不使用 GW2_UI 原生文件中的旧默认值覆盖。

### 参数默认值

| 参数 | 配置键 | 默认值 |
|---|---|---:|
| 启用 | `PLAYER_BUFFS_ENABLED` / `playerBuffAurasEnabled` | `true`（勾选） |
| 角色增益光环朝向 | `PlayerBuffs.GrowDirection` | `DOWN`（行：向左，向下换行） |
| 排序方式 | `PlayerBuffs.SortMethod` | `INDEX`（索引） |
| 排序方向 | `PlayerBuffs.SortDir` | `+`（升序） |
| 分离 | `PlayerBuffs.Seperate` | `0`（不排序） |
| 每排光环数量 | `PlayerBuffs.WrapAfter` | `10` |
| 水平间距 | `PlayerBuffs.HorizontalSpacing` | `0` |
| 垂直间距 | `PlayerBuffs.VerticalSpacing` | `10` |
| 最大换行数 | `PlayerBuffs.MaxWraps` | `3` |
| 大小 | `PlayerBuffs.IconSize` | `32` |
| 高度 | `PlayerBuffs.IconHeight` | `32` |
| 保持宽高比 | `PlayerBuffs.KeepSizeRatio` | `true`（勾选） |
| 动画 | `PlayerBuffs.NewAuraAnimation` | `true`（勾选） |
| 缩放指数 | `PlayerBuffFrame_scale` | `1`（始终固定为 `1`） |

### 位置默认值

| 位置参数 | 配置字段 | 默认值 |
|---|---|---:|
| 屏幕锚点 | `PlayerBuffFrame.relativePoint` | `TOPRIGHT`（右上） |
| 框体锚点 | `PlayerBuffFrame.point` | `TOPRIGHT`（右上） |
| X | `PlayerBuffFrame.xOfs` | `-160` |
| Y | `PlayerBuffFrame.yOfs` | `0` |

## 相关实现

- [`Modules/ActionBar/ActionBar_Layout.lua`](../Modules/ActionBar/ActionBar_Layout.lua)：编辑模式施法条、能量条选项和锚点控件。
- [`Modules/UnitFrames/PlayerResources.lua`](../Modules/UnitFrames/PlayerResources.lua)：施法条和额外能量条参数默认值。
- [`Modules/UnitFrames/PlayerAuras.lua`](../Modules/UnitFrames/PlayerAuras.lua)：PLUS 增益光环启用开关。
- [`Modules/Settings/EditModeMoverCoordinates.lua`](../Modules/Settings/EditModeMoverCoordinates.lua)：编辑模式面板宽度和内容区布局。
