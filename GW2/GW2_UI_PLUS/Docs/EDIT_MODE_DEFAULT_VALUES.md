# 编辑模式框体默认值

**文档用途**：单独记录编辑模式中各移动框体的默认参数和默认位置。

**最后更新**：2026-08-04

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
| Y | `yOfs` | `180` |

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

## 减益光环

### 参数默认值

| 参数 | 配置键 | 默认值 |
|---|---|---:|
| 启用 | `playerDebuffAurasEnabled` | `true`（勾选） |
| 角色负面光环朝向 | `PlayerDebuffs.GrowDirection` | `UP`（行：向左，向上换行） |
| 排序方式 | `PlayerDebuffs.SortMethod` | `INDEX`（索引） |
| 排序方向 | `PlayerDebuffs.SortDir` | `+`（升序） |
| 分离 | `PlayerDebuffs.Seperate` | `0`（不排序） |
| 每排光环数量 | `PlayerDebuffs.WrapAfter` | `1` |
| 水平间距 | `PlayerDebuffs.HorizontalSpacing` | `0` |
| 垂直间距 | `PlayerDebuffs.VerticalSpacing` | `10` |
| 最大换行数 | `PlayerDebuffs.MaxWraps` | `16` |
| 大小 | `PlayerDebuffs.IconSize` | `32` |
| 高度 | `PlayerDebuffs.IconHeight` | `32`（保持宽高比时跟随大小） |
| 保持宽高比 | `PlayerDebuffs.KeepSizeRatio` | `true`（勾选） |
| 动画 | `PlayerDebuffs.NewAuraAnimation` | `true`（勾选） |
| 缩放指数 | `PlayerDebuffFrame_scale` | `1`（始终固定为 `1`） |

### 位置默认值

| 位置参数 | 配置字段 | 默认值 |
|---|---|---:|
| 屏幕锚点 | `PlayerDebuffFrame.relativePoint` | `CENTER`（中） |
| 框体锚点 | `PlayerDebuffFrame.point` | `CENTER`（中） |
| X | `PlayerDebuffFrame.xOfs` | `-308` |
| Y | `PlayerDebuffFrame.yOfs` | `100` |

## 职业资源条

### 参数默认值

| 参数 | 配置键 | 默认值 |
|---|---|---:|
| 启用 | `CLASS_POWER` | `true`（勾选） |
| 在条上显示数值 | `CLASSPOWER_SHOW_VALUE` | `true`（勾选） |
| 锚点 | `CLASSPOWER_ANCHOR_MODE` | `DEFAULT`（默认） |
| 侧边 | `CLASSPOWER_CUSTOMRESOURCEBAR_SIDE` | `AUTO`（自动） |
| X 偏移 | `CLASSPOWER_ANCHOR_OFFSET_X` | `0` |
| Y 偏移 | `CLASSPOWER_ANCHOR_OFFSET_Y` | `0` |
| 间距 | `CLASSPOWER_CUSTOMRESOURCEBAR_GAP` | `4` |
| 仅在战斗中显示 | `CLASSPOWER_ONLY_SHOW_IN_COMBAT` | `false`（不勾选） |
| 宽度 | `resourceBarWidth` | `300` |
| 高度 | 不提供独立配置 | 按当前资源条形态的原始宽高比随宽度自动计算 |
| 缩放指数 | `ClasspowerBar_pos_scale` | `1`（始终固定为 `1`） |

### 位置默认值

| 位置参数 | 配置字段 | 默认值 |
|---|---|---:|
| 屏幕锚点 | `ClasspowerBar_pos.relativePoint` | `CENTER`（中） |
| 框体锚点 | `ClasspowerBar_pos.point` | `CENTER`（中） |
| X | `ClasspowerBar_pos.xOfs` | `0` |
| Y | `ClasspowerBar_pos.yOfs` | `-160` |

## 玩家框体

### 参数默认值

| 参数 | 配置键 | 默认值 |
|---|---|---:|
| 启用 | `HEALTHGLOBE_ENABLED` | `true`（勾选） |
| 显示另一种背景材质 | `PLAYER_AS_TARGET_FRAME_ALT_BACKGROUND` | `true`（勾选） |
| 显示职业颜色 | `player_CLASS_COLOR` | `true`（勾选） |
| PvP 指示器 | `PLAYER_SHOW_PVP_INDICATOR` | `true`（勾选） |
| 显示生命值数值 | `PLAYER_UNIT_HEALTH` | `VALUE`（数值） |
| 生命条材质 | `playerFrameHealthBarTexture` | `GW2_UI_2_DEFAULT` |
| 缩放指数 | `player_pos_scale` | `1` |
| 条宽度 | `playerFrameHealthBarSize.width` | `240` |
| 生命条高度 | `playerFrameHealthBarSize.height` | `13` |
| 生命条文本 X 偏移 | `playerFrameHealthBarTextOffset.x` | `5` |
| 生命条文本 Y 偏移 | `playerFrameHealthBarTextOffset.y` | `0` |
| 能量条高度 | `playerFramePowerBarSize.height` | `3` |
| 能量条文本 X 偏移 | `playerFramePowerBarTextOffset.x` | `5` |
| 能量条文本 Y 偏移 | `playerFramePowerBarTextOffset.y` | `0` |

### 位置默认值

| 位置参数 | 配置字段 | 默认值 |
|---|---|---:|
| 屏幕锚点 | `player_pos.relativePoint` | `CENTER`（中） |
| 框体锚点 | `player_pos.point` | `CENTER`（中） |
| X | `player_pos.xOfs` | `-315` |
| Y | `player_pos.yOfs` | `-160` |

## 目标框体

### 参数默认值

| 参数 | 配置键 | 默认值 |
|---|---|---:|
| 启用 | `TARGET_ENABLED` | `true`（勾选） |
| 施法条 | `target_SHOW_CASTBAR` | `true`（勾选） |
| 显示生命值数值 | `target_HEALTH_VALUE_ENABLED` | `true`（勾选） |
| 生命值百分比 | `target_HEALTH_VALUE_TYPE` | `true`（勾选） |
| 仇恨值百分比 | `target_THREAT_VALUE_ENABLED` | `true`（勾选） |
| 职业颜色 | `target_CLASS_COLOR` | `true`（勾选） |
| 连击点数 | `target_HOOK_COMBOPOINTS` | `true`（勾选） |
| 高级施法条 | `target_CASTINGBAR_DATA` | `false`（不勾选） |
| 头像框显示伤害 | `target_FLOATING_COMBAT_TEXT` | `true`（勾选） |
| 反转选取目标框架 | `target_FRAME_INVERT` | `true`（勾选） |
| 显示另一种背景材质 | `target_FRAME_ALT_BACKGROUND` | `true`（勾选） |
| 生命条材质 | `targetFrameHealthBarTexture` | `GW2_UI_2_DEFAULT` |
| 缩放指数 | `target_pos_scale` | `1` |
| 条宽度 | `targetFrameHealthBarSize.width` | `240` |
| 生命条高度 | `targetFrameHealthBarSize.height` | `13` |
| 生命条文本 X 偏移 | `targetFrameHealthBarTextOffset.x` | `5` |
| 生命条文本 Y 偏移 | `targetFrameHealthBarTextOffset.y` | `0` |
| 能量条高度 | `targetFramePowerBarSize.height` | `3` |

### 位置默认值

| 位置参数 | 配置字段 | 默认值 |
|---|---|---:|
| 屏幕锚点 | `target_pos.relativePoint` | `CENTER`（中） |
| 框体锚点 | `target_pos.point` | `CENTER`（中） |
| X | `target_pos.xOfs` | `315` |
| Y | `target_pos.yOfs` | `-160` |

## 队伍与团队

以下页面中属于框体启用开关的默认值全部为关闭。其他队伍和团队参数不在本次默认值记录范围内。

| 页面 | 选项 | 配置键 | 默认值 |
|---|---|---|---:|
| 队伍 - 小队 | 启用 | `PARTY_FRAMES` | `true`（勾选） |
| 团队 | 启用 | `RAID_FRAMES` | `false`（不勾选） |
| 团队 | 10 人团队启用 | `RAID10_ENABLED` | `false`（不勾选） |
| 团队 | 25 人团队启用 | `RAID25_ENABLED` | `false`（不勾选） |
| 团队 | 主坦克框启用 | `RAID_MAINTANK_FRAMES_ENABLED` | `false`（不勾选） |
| 团队 | 团队宠物启用 | `RAID_PET_FRAMES` | `false`（不勾选） |
| 团队 | 队伍样式启用 | `RAID_STYLE_PARTY` | `false`（不勾选） |
| 团队 | 小队宠物启用 | `PARTY_PET_FRAMES_ENABLED` | `false`（不勾选） |

## 目标的目标

### 参数默认值

| 参数 | 配置键 | 默认值 |
|---|---|---:|
| 启用 | `target_TARGET_ENABLED` | `true`（勾选） |
| 施法条 | `target_TARGET_SHOW_CASTBAR` | `true`（勾选） |
| 生命条材质 | `targettargetFrameHealthBarTexture` | `GW2_UI_2_DEFAULT` |
| 缩放指数 | `targettarget_pos_scale` | `1` |
| 条宽度 | `targettargetFrameHealthBarSize.width` | `100` |
| 生命条高度 | `targettargetFrameHealthBarSize.height` | `13` |
| 能量条高度 | `targettargetFramePowerBarSize.height` | `3` |

### 位置默认值

| 位置参数 | 配置字段 | 默认值 |
|---|---|---:|
| 屏幕锚点 | `targettarget_pos.relativePoint` | `CENTER`（中） |
| 框体锚点 | `targettarget_pos.point` | `CENTER`（中） |
| X | `targettarget_pos.xOfs` | `344` |
| Y | `targettarget_pos.yOfs` | `-100` |

## 微缩地图

### 参数默认值

| 参数 | 配置键 | 默认值 |
|---|---|---:|
| 启用 | `MINIMAP_ENABLED` | `true`（勾选） |
| 小地图右下显示帧率 | `MINIMAP_FPS` | `false`（不勾选） |
| 停用 FPS 提示 | `MINIMAP_FPS_TOOLTIP_DISABLED` | `false`（不勾选） |
| 在小地图上显示坐标 | `MINIMAP_COORDS_TOGGLE` | `false`（不勾选） |
| 小地图显示：时钟 | `MINIMAP_ALWAYS_SHOW_HOVER_DETAILS.CLOCK` | `false`（不勾选） |
| 小地图显示：区域 | `MINIMAP_ALWAYS_SHOW_HOVER_DETAILS.ZONE` | `false`（不勾选） |
| 小地图显示：坐标 | `MINIMAP_ALWAYS_SHOW_HOVER_DETAILS.COORDS` | `false`（不勾选） |
| 小地图缩放 | `MinimapScale` | `1` |
| 重置缩放 | `MinimapResetZoom` | `0` |
| 小地图大小 | `MINIMAP_SIZE` | `160` |
| 高度百分比 | `Minimap.HeightPercentage` | `100`（保持宽高比时不可用） |
| 保持宽高比 | `Minimap.KeepSizeRatio` | `true`（勾选） |

### 位置默认值

| 位置参数 | 配置字段 | 默认值 |
|---|---|---:|
| 屏幕锚点 | `relativePoint` | `TOPRIGHT`（右上） |
| 框体锚点 | `point` | `TOPRIGHT`（右上） |
| X | `xOfs` | `0` |
| Y | `yOfs` | `0` |
| 移动器缩放指数 | `MinimapPos_scale` | `1` |

## 经验槽

### 参数默认值

| 参数 | 配置键 | 默认值 |
|---|---|---:|
| 启用 | `XPBAR_ENABLED` | 角色等级小于 `60` 级时为 `true`（勾选），`60` 级及以上为 `false`（不勾选） |
| 任务经验值百分比 | `QUEST_XP_PERCENT` | `false`（不勾选） |

## 动作条

本节记录当前确认的动作条默认值。宠物动作条的参数和位置不写入默认 Plus 配置，加载默认 Plus 配置时会保留当前宠物动作条设置。

### 参数默认值：原生动作条设置

| 参数 | 配置键 | 默认值 |
|---|---|---:|
| 启用动作条 | `ACTIONBARS_ENABLED` | `true` |
| 仅在已使用按键上显示标签 | `BUTTON_ASSIGNMENTS_USED_ONLY` | `false` |
| 空槽透明度 | `ACTIONBAR_BACKGROUND_ALPHA` | `0.4` |
| 主动作条间距 | `MAINBAR_MARGIIN` | `5` |
| 多动作条间距 | `MULTIBAR_MARGIIN` | `2` |
| 范围提示 | `MAINBAR_RANGEINDICATOR` | `RED_INDICATOR`（红点） |
| 显示快捷键 | `BUTTON_ASSIGNMENTS` | `true` |
| 显示宏名称 | `SHOWACTIONBAR_MACRO_NAME_ENABLED` | `false` |

### 参数默认值：全局渐隐

| 参数 | 配置键 | 默认值 |
|---|---|---:|
| 启用 | `fadeEnable` | `false` |
| 淡出后透明度 | `fadeAlpha` | `0.3` |
| 淡出延迟 | `fadeDelay` | `0` |
| 战斗中不渐隐 | `keepInCombat` | `true` |
| 主动作条参与渐隐 | `fadeBar1` | `false` |
| 动作条 2 到 8 参与渐隐 | `fadeBar2` 到 `fadeBar8` | 全部 `false` |
| 姿态条参与渐隐 | `fadeStanceBar` | `false` |
| 图腾条参与渐隐 | `fadeTotemBar` | `false` |
| 法师动作条参与渐隐 | `fadeMageBar` | `false` |
| 普通玩家框体开关 | `normalPlayerFrameEnabled` | `true` |
| 玩家框体附加缩放 | `globeScale` | `1` |

### 参数默认值：主动作条

| 参数 | 配置键 | 默认值 |
|---|---|---:|
| 显示 | `mainBarShown` | `true` |
| 按钮尺寸 | `mainBarSize` | `42` |
| 按钮数 | `mainBarCount` | `12` |
| 行按钮数 | `mainBarColumns` | `12` |
| 中间空隙 | `mainBarGlobeGap` | `130` |
| 显示快捷键 | `mainBarShowHotkey` | `true` |
| 快捷键位置 | `mainBarHotkeyPosition` | `BOTTOM`（下） |
| 快捷键 X 偏移 | `mainBarHotkeyX` | `0` |
| 快捷键 Y 偏移 | `mainBarHotkeyY` | `0` |
| 快捷键字号 | `mainBarHotkeySize` | `12` |
| 显示宏名称 | `mainBarShowMacro` | `false` |
| 宏名称位置 | `mainBarMacroPosition` | `TOP`（上） |
| 宏名称 X 偏移 | `mainBarMacroX` | `0` |
| 宏名称 Y 偏移 | `mainBarMacroY` | `0` |
| 宏名称字号 | `mainBarMacroSize` | `12` |

### 参数默认值：动作条 2 到 8

| 动作条 | 显示 | 按钮数 | 行按钮数 | 间距 | 显示快捷键 | 快捷键位置 | 显示宏名称 | 宏名称位置 |
|---|---:|---:|---:|---:|---:|---|---:|---|
| 动作条 2 | `true` | `12` | `6` | `2` | `true` | `TOPLEFT`（左上） | `false` | `BOTTOM`（下） |
| 动作条 3 | `true` | `12` | `6` | `2` | `true` | `TOPLEFT`（左上） | `false` | `BOTTOM`（下） |
| 动作条 4 | `false` | `12` | `1` | `2` | `true` | `TOPLEFT`（左上） | `false` | `BOTTOM`（下） |
| 动作条 5 | `false` | `12` | `1` | `2` | `true` | `TOPLEFT`（左上） | `false` | `BOTTOM`（下） |
| 动作条 6 | `false` | `12` | `1` | `2` | `true` | `TOPLEFT`（左上） | `false` | `BOTTOM`（下） |
| 动作条 7 | `false` | `12` | `1` | `2` | `true` | `TOPLEFT`（左上） | `false` | `BOTTOM`（下） |
| 动作条 8 | `false` | `12` | `1` | `2` | `true` | `TOPLEFT`（左上） | `false` | `BOTTOM`（下） |

动作条 2 到 8 的快捷键和宏名称的 X/Y 偏移均为 `0`，字号均为 `12`。对应配置键分别为 `barNShown`、`barNCount`、`barNColumns`、`barNSpacing`、`barNShowHotkey`、`barNHotkeyPosition`、`barNHotkeyX`、`barNHotkeyY`、`barNHotkeySize`、`barNShowMacro`、`barNMacroPosition`、`barNMacroX`、`barNMacroY`、`barNMacroSize`。

### 参数默认值：姿态条、图腾条和法师动作条

| 框体 | 参数 | 配置键 | 默认值 |
|---|---|---|---:|
| 姿态条 | 显示 | `stanceBarShown` | `true` |
| 姿态条 | 按钮数 | `stanceBarCount` | `10` |
| 姿态条 | 行按钮数 | `stanceBarColumns` | `10` |
| 姿态条 | 收纳按钮 | `stanceBarCollapseButton` | `hover`（悬停显示） |
| 姿态条 | 显示快捷键 | `stanceBarShowHotkey` | `true` |
| 姿态条 | 快捷键位置 | `stanceBarHotkeyPosition` | `BOTTOM`（下） |
| 姿态条 | 快捷键 X/Y 偏移 | `stanceBarHotkeyX` / `stanceBarHotkeyY` | `0` / `0` |
| 姿态条 | 快捷键字号 | `stanceBarHotkeySize` | `12` |
| 姿态条 | 增长方向 | `StanceBar.growDirection` | `UP`（向上） |
| 姿态条 | 按钮尺寸 | `StanceBar.buttonSize` | `36` |
| 姿态条 | 间距 | `StanceBar.spacing` | `2` |
| 姿态条 | 透明度 | `StanceBar.alpha` | `1` |
| 姿态条 | 鼠标悬停 | `StanceBar.mouseOver` | `false` |
| 姿态条 | 显示方式 | `StanceBar.visibility` | `show` |
| 姿态条 | 容器状态 | `StanceBar.containerState` | `open` |
| 图腾条 | 显示 | `TotemBar.enabled` | `true` |
| 图腾条 | 增长方向 | `TotemBar.growDirection` | `HORIZONTAL`（水平） |
| 图腾条 | 排序方向 | `TotemBar.sortDirection` | `ASC`（升序） |
| 图腾条 | 按钮尺寸 | `TotemBar.buttonSize` | `36` |
| 图腾条 | 间距 | `TotemBar.spacing` | `2` |
| 法师动作条 | 显示 | `mageBarEnable` | `true` |
| 法师动作条 | 按钮尺寸 | `mageBarSize` | `36` |
| 法师动作条 | 竖向排列 | `mageBarVertical` | `true` |
| 法师动作条 | 传送 | `mageBarTeleport` | `true` |
| 法师动作条 | 传送门 | `mageBarPortal` | `true` |
| 法师动作条 | 造食物 | `mageBarFood` | `false` |
| 法师动作条 | 造水 | `mageBarWater` | `false` |
| 法师动作条 | 魔法宝石 | `mageBarGem` | `false` |
### 位置默认值

| 框体 | 屏幕锚点（`relativePoint`） | 框体锚点（`point`） | X（`xOfs`） | Y（`yOfs`） | 缩放 |
|---|---|---|---:|---:|---:|
| 主动作条 | `BOTTOM`（下） | `BOTTOM`（下） | `0` | `0` | `MainActionBar_pos_scale = 1` |
| 动作条 2 | `BOTTOM`（下） | `BOTTOM`（下） | `-225` | `45` | `MultiBarBottomLeft_scale = 1` |
| 动作条 3 | `BOTTOM`（下） | `BOTTOM`（下） | `225` | `45` | `MultiBarBottomRight_scale = 1` |
| 动作条 4 | `TOPRIGHT`（右上） | `TOPRIGHT`（右上） | `0` | `-160` | `MultiBarRight_scale = 1` |
| 动作条 5 | `TOPRIGHT`（右上） | `TOPRIGHT`（右上） | `-36` | `-160` | `MultiBarLeft_scale = 1` |
| 动作条 6 | `TOPRIGHT`（右上） | `TOPRIGHT`（右上） | `-72` | `-160` | `MultiBar5_scale = 1` |
| 动作条 7 | `TOPRIGHT`（右上） | `TOPRIGHT`（右上） | `-108` | `-160` | `MultiBar6_scale = 1` |
| 动作条 8 | `TOPRIGHT`（右上） | `TOPRIGHT`（右上） | `-144` | `-160` | `MultiBar7_scale = 1` |
| 姿态条 | `BOTTOM`（下） | `BOTTOM`（下） | `0` | `200` | `StanceBar_pos_scale = 1` |
| 图腾条 | `BOTTOM`（下） | `BOTTOM`（下） | `0` | `230` | `TotemBar_pos_scale = 1` |
| 法师动作条 | `BOTTOMRIGHT`（右下） | `BOTTOMRIGHT`（右下） | `-300` | `0` | `MageBar_pos_scale = 1` |

以上为经验条关闭时的基础默认位置。经验条启用时，如果框体仍处于默认位置（`hasMoved ~= true`），主动作条、动作条 2、动作条 3、法师动作条的 Y 坐标分别在基础值上增加 `15`；已经手动移动过的框体不做任何处理。

## 其他框体

以下位置是当前确认的默认 Plus 位置。`relativePoint` 为屏幕锚点，`point` 为框体锚点。所有默认值写入后使用 `hasMoved = false`，用户手动移动后则保留手动位置。

### 任务目标框参数默认值

| 参数 | 配置键 | 默认值 |
|---|---|---:|
| 高度 | `QuestTracker_pos_height` | `600` |

| 框体 | 配置键 | 屏幕锚点（`relativePoint`） | 框体锚点（`point`） | X（`xOfs`） | Y（`yOfs`） |
|---|---|---|---|---:|---:|
| BnetFrame | `BNToastPos` | `TOPLEFT`（左上） | `TOPLEFT`（左上） | `350` | `-26` |
| 标记条 | `GW2PlusToolbarMarkerBarPos` | `TOP`（上） | `TOP`（上） | `0` | `0` |
| 快捷条 | `GW2PlusToolbarQuickBarPos` | `TOP`（上） | `TOP`（上） | `0` | `-30` |
| 任务目标 | `QuestTracker_pos` | `RIGHT`（右） | `RIGHT`（右） | `-182` | `130` |
| 任务计时 | `QUEST_TIMERS_FRAME_POSITION` | `TOPRIGHT`（右上） | `TOPRIGHT`（右上） | `-318` | `-100` |
| 队伍框 | `party_pos` | `CENTER`（中） | `CENTER`（中） | `435` | `40` |
| Tooltip 框 | `GameTooltipPos` | `BOTTOMRIGHT`（右下） | `BOTTOMRIGHT`（右下） | `0` | `360` |
| 飞行请求终止框 | `GW2PlusVehicleLeaveButton_pos` | `CENTER`（中） | `CENTER`（中） | `0` | `180` |
| 团队框架 40 人 | `raid_pos` | `LEFT`（左） | `LEFT`（左） | `0` | `50` |
| 团队框架 25 人 | `raid25_pos` | `LEFT`（左） | `LEFT`（左） | `0` | `50` |
| 团队框架 10 人 | `raid10_pos` | `LEFT`（左） | `LEFT`（左） | `0` | `50` |
| 小队网格 | `raid_party_pos` | `LEFT`（左） | `LEFT`（左） | `0` | `-32` |
| 主坦克框 | `raidMaintank_pos` | `LEFT`（左） | `LEFT`（左） | `0` | `245` |
| 小队宠物网格 | `party_pet_pos` | `LEFT`（左） | `LEFT`（左） | `0` | `252` |
| 团队宠物网格 | `raid_pet_pos` | `TOPLEFT`（左上） | `TOPLEFT`（左上） | `120` | `252` |
| 微缩地图 | `MinimapPos` | `TOPRIGHT`（右上） | `TOPRIGHT`（右上） | `0` | `0` |

## 相关实现

- [`Modules/ActionBar/ActionBar_Layout.lua`](../Modules/ActionBar/ActionBar_Layout.lua)：编辑模式施法条、能量条选项和锚点控件。
- [`Modules/UnitFrames/PlayerResources.lua`](../Modules/UnitFrames/PlayerResources.lua)：施法条和额外能量条参数默认值。
- [`Modules/UnitFrames/PlayerAuras.lua`](../Modules/UnitFrames/PlayerAuras.lua)：PLUS 增益/减益光环启用开关。
- [`Modules/Settings/EditModeMoverCoordinates.lua`](../Modules/Settings/EditModeMoverCoordinates.lua)：编辑模式面板宽度和内容区布局。
