# GW2 UI Plus 动作条文字位置功能交接

> 本文档随 GW2 UI Plus 插件保存。

## 当前状态

- 所有实现均位于 `GW2_UI_PLUS`，没有修改 `GW2_UI` 源码。
- **本功能当前未完成，下面四个问题经用户实机确认仍然全部存在。**
- 快捷键和宏名称虽然共用 `Layout.ApplyTextPosition`，但当前实现没有产生正确的游戏内效果。
- 按用户要求，开发过程中没有运行 Lua 测试；游戏内验证由用户完成，且结果为未通过。

## 当前未解决问题

### 1. 显示宏名称会改变按钮大小

- 操作：在动作条设置中开启“显示宏名称”。
- 实际表现：游戏内动作按钮会变大。
- 预期表现：只显示或隐藏宏名称文字，按钮尺寸、动作条尺寸和布局都不得变化。
- 已尝试但未解决：
  - 将宏名称相关设置改成文字专用刷新，避免主动执行整条动作条重排。
  - 将文字层限制为按钮大小并关闭换行。

### 2. 快捷键和宏名称的位置仍然无效

- 操作：切换“左上、上、右上、居中、左下、下、右下”。
- 实际表现：文字位置不移动，七个选项没有正确反映到游戏按钮。
- 预期表现：每个位置都应以按钮对应锚点为 `0,0`，X/Y 偏移再从该锚点计算。
- 已尝试但未解决：
  - 双锚点定位。
  - 单锚点加按钮宽度。
  - 与按钮同宽高的固定文字层加水平/垂直对齐。
  - 与按钮同宽高的文字层加七个真实锚点。
  - 对 `SetPoint`、`SetJustifyH/V`、`SetWidth/Height` 增加后处理。

用户提供的 `/gw2plus hotkey` 诊断表明：

- 存档值正确。
- `gwPlusTextPosition` 应用值正确。
- 水平和垂直对齐值正确。
- 文字宽度与按钮宽度一致。
- 当时所有文字层的最终锚点仍显示为 `TOPLEFT > TOPLEFT (0,0)`。
- 姿态条快捷键显示 `应用=nil`，仍是 GW2 UI 原生 `CENTER > BOTTOM (0,5)`。

因此问题不在下拉框存档，而在实际 FontString、GW2 UI 后续刷新覆盖或当前操作的文字对象并非最终可见对象。

### 3. 当前动作条“恢复默认”仍会带动其他动作条

- 操作：在任一动作条页面点击“恢复默认”。
- 实际表现：其他动作条仍会发生移动或可见刷新。
- 预期表现：只恢复当前页面对应动作条，其他动作条的位置、尺寸、布局和透明度都不变化。
- 已尝试但未解决：
  - 多动作条从 `ApplyMultiBars()` 改成只调用当前 `ApplyMultiBar(index)`。
  - 主动作条恢复时不再调用完整 `ApplyLayout()`。
  - 血球缩放改为只更新血球，不调用 GW2 UI 的全 HUD 缩放。
  - 不再调用 GW2 UI 的通用 mover 重置函数。

后续需要继续追踪 `RefreshPanel`、HUD mover 面板刷新、渐隐刷新以及 GW2 UI 的安全钩子，确认是哪一个后续调用仍在触碰其他动作条。

### 4. 恢复默认位置不是稳定的 GW2 UI 原始位置

- 操作：动作条 2、3 点击“恢复默认”，然后 `/reload`。
- 实际表现：动作条 2、3 的 Y 轴再次发生偏移；其他动作条尚未全部确认。
- 预期表现：恢复默认后应回到 GW2 UI 原始初始位置，重载前后坐标完全一致。
- 已尝试但未解决：
  - 默认坐标改为读取 `GW.globalDefault.profile`。
  - 复刻 GW2 UI 根据经验条和球状血条样式对动作条 2、3 的动态偏移。
  - 将基础存档坐标和运行时显示坐标分开，尝试避免重载时重复计算动态偏移。

最新用户反馈确认上述处理后问题仍存在。后续不能继续假设只是“动态偏移写入存档”，需要同时记录以下三层坐标并比较：

1. 点击恢复前后的 `GW.settings[MultiBarBottomLeft/Right]`。
2. mover 的 `savedPoint`、`defaultPoint` 和实际 `GetPoint()`。
3. `/reload` 后 GW2 UI 完成 `updateMultiBar` 与布局管理器处理前后的实际坐标。

## 功能范围

支持完整文字位置设置：

- 主动作条：快捷键和宏名称。
- 动作条 2–8：快捷键和宏名称。
- 姿态条：快捷键。
- 宠物动作条：快捷键。

法师动作条不增加快捷键、宏名称或间距设置。

每个文字分组的设置顺序：

1. 显示开关单独一行。
2. 位置和字体大小同一行。
3. X 偏移和 Y 偏移同一行。

## 七点位置模型

| 界面名称 | 存档值 | 水平对齐 | 垂直对齐 |
| --- | --- | --- | --- |
| 左上 | `TOPLEFT` | `LEFT` | `TOP` |
| 上 | `TOP` | `CENTER` | `TOP` |
| 右上 | `TOPRIGHT` | `RIGHT` | `TOP` |
| 居中 | `CENTER` | `CENTER` | `MIDDLE` |
| 左下 | `BOTTOMLEFT` | `LEFT` | `BOTTOM` |
| 下 | `BOTTOM` | `CENTER` | `BOTTOM` |
| 右下 | `BOTTOMRIGHT` | `RIGHT` | `BOTTOM` |

坐标规则：

- FontString 使用与按钮相同的固定宽度和高度，不允许宏名称换行扩展。
- FontString 保持按钮大小，并使用七个真实锚点配合水平/垂直对齐。
- `X=0、Y=0` 表示所选锚点的准确位置。
- X/Y 不叠加 GW2 UI 原生隐藏偏移。

默认位置：

- 主动作条快捷键：`BOTTOM`。
- 主动作条宏名称：`TOP`。
- 动作条 2–8 快捷键：`TOPLEFT`。
- 动作条 2–8 宏名称：`BOTTOM`。
- 姿态条和宠物动作条快捷键：`TOPRIGHT`。

## 尺寸、间距和命名

- 所有“列数”显示文字改为“行按钮数”，存档字段仍使用 `Columns`。
- 所有尺寸范围为 `12–64`。
- 主动作条恢复默认尺寸为 `48`。
- 动作条 2–8、姿态条、宠物动作条和法师动作条恢复默认尺寸为 `36`。
- 所有已有间距滑块范围为 `0–20`。
- 宠物动作条新增 `petBarSize`，只改变宠物动作按钮，不修改宠物头像和血量框。

## 存档字段

存档继续使用 `GW2_UI_PLUS_ActionBarSV`。

主动作条：

- `mainBarShowHotkey`
- `mainBarHotkeyPosition`
- `mainBarHotkeyX` / `mainBarHotkeyY`
- `mainBarHotkeySize`
- `mainBarMacroPosition`

动作条 2–8：

- `bar2HotkeyPosition`～`bar8HotkeyPosition`
- `bar2MacroPosition`～`bar8MacroPosition`

其他：

- `stanceBarHotkeyPosition`
- `petBarHotkeyPosition`
- `petBarSize`

初始化只补缺失字段，不覆盖已有用户值。点击页面“恢复默认”时才写入对应的新默认值。

## 实现结构

主要文件：

- `Interface/AddOns/GW2_UI_PLUS/ActionBar/ActionBar.lua`
- `Interface/AddOns/GW2_UI_PLUS/ActionBar/Layout.lua`
- `Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua`
- `Interface/AddOns/GW2_UI_PLUS/fixes/Diagnostics.lua`

`Layout.ApplyTextPosition(fontString, button, position, x, y)`：

1. 校验七点位置，无效值回退为 `TOPRIGHT`。
2. 保存按钮、位置和偏移到 FontString 的 `gwPlusText*` 字段。
3. 将文字层固定为与按钮相同的宽高，并关闭文字换行。
4. 清除旧锚点，使用所选位置对应的真实锚点。
5. 应用水平和垂直对齐。
6. 通过 `SetPoint`、`SetWidth/Height` 和水平/垂直对齐后处理，防止 GW2 UI 刷新覆盖位置。

`Layout.ApplyHotkeyPosition` 保留为 `Layout.ApplyTextPosition` 的兼容别名。

`UPDATE_BINDINGS`、多动作条刷新、姿态变化和宠物条刷新后，Plus 会重新应用对应布局。受保护按钮的修改继续使用现有脱战队列。

文字选项使用独立的轻量刷新：

- 显示/隐藏宏名称、快捷键、位置、偏移和字号不再执行按钮重排。
- 因此切换“显示宏名称”不会连带调用 `SetSize`，也不会改变按钮大小。

恢复默认使用局部刷新：

- 多动作条只刷新当前选中的动作条，不再调用 `ApplyMultiBars()` 重排 2–8。
- 主动作条恢复血球缩放时只缩放血球，不再调用 GW2 UI 的全 HUD 缩放刷新。
- mover 重置只写当前 mover 的坐标字段，保留原生配置表中的尺寸、行按钮数和倒序排列等字段。
- 动作条 2、3 的默认坐标沿用 GW2 UI 对经验条和球状血条样式的动态偏移，其余动作条直接使用 `GW.globalDefault.profile` 中的原始位置。
- 动作条 2、3 的动态偏移只应用到当前 mover，不写入存档，避免重载时被 GW2 UI 重复偏移。

## 诊断

输入：

```text
/gw2plus hotkey
```

诊断会输出主动作条和动作条 2–8 的快捷键、宏名称，以及姿态条和宠物条快捷键的：

- 存档位置。
- 实际应用位置。
- 水平/垂直对齐。
- 文字宽度与按钮宽度。
- 最终锚点和 X/Y。

## 待修复后的实机验收

1. `/reload`。
2. 点击各页面“恢复默认”，确认主动作条尺寸为 `48`，其他动作条尺寸为 `36`。
3. 确认设置页只显示“行按钮数”，间距可以设置到 `20`。
4. 主动作条快捷键 `0,0` 位于“下”，宏名称 `0,0` 位于“上”。
5. 动作条 2–8 快捷键 `0,0` 位于“左上”，宏名称 `0,0` 位于“下”。
6. 分别选择左上、上、右上、居中、左下、下、右下，确认七项位置互不重合。
7. 修改 X/Y，确认偏移从当前所选锚点计算。
8. 修改按键绑定，确认文字位置不被恢复成 GW2 UI 原生位置。
9. 调整宠物动作条尺寸，确认宠物动作按钮改变，宠物头像和血量框不变。
10. 战斗中修改设置，确认脱战后只应用最终值。
11. 再次 `/reload`，确认配置持久化。

## 工作区注意事项

当前工作区包含大量与本功能无关的用户修改，且 `GW2_UI_PLUS/ActionBar` 目录可能显示为未跟踪。不得使用 `git reset --hard`、宽范围 `git checkout --` 或删除未跟踪目录。
