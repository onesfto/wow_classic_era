# GW2 UI Plus 主聊天窗口编辑框设计

> 本文档随 GW2 UI Plus 插件保存。

## 目标

把 `ChatFrame1` 加入 GW2 UI 的“移动界面”编辑模式，使它像
`ActionBar/ActionBar.lua` 中的动作条 1 一样，通过 GW2 UI 原生 mover 拖动。

本次只处理 `ChatFrame1`。停靠在主聊天窗口上的标签随主窗口移动；被单独拖出的聊天窗口
不处理。编辑模式只负责位置，宽度和高度继续由“附加组件 → 聊天窗口”中的现有滑块控制。

## 实现方式

实现严格沿用动作条 1 的接入模式：

1. 为聊天窗口定义独立的 GW2 UI mover 设置名和默认位置。
2. 在 `GW.globalDefault.profile` 与当前 `GW.settings` 中补齐位置数据。
3. 调用 `GW.RegisterMovableFrame` 注册“主聊天窗口”，只启用 `default` 选项，
   不启用缩放或高度选项。
4. 将 `ChatFrame1` 的 `BOTTOMLEFT` 锚到 mover 的 `BOTTOMLEFT`。
5. 用 `SetPoint` 钩子阻止暴雪或其他代码把聊天窗口从 mover 上移走。

聊天模块现有的宽高应用、暴雪位置保存、标签重排和延时重应用逻辑继续保留。

## 位置同步

GW2 UI mover 的位置是编辑模式中的权威位置；现有
`GW2_UI_PLUS_ChatWindowSV.offsetX/offsetY` 继续作为设置页显示值和兼容数据。

- 首次创建 mover 时，以现有 `offsetX/offsetY` 作为默认位置。
- 编辑模式拖动结束后，根据 mover 的实际位置计算屏幕左、下边距，同步写回
  `offsetX/offsetY`，并调用暴雪的聊天窗口位置保存函数。
- 设置页修改左边距或下边距时，移动 mover，并同步更新当前 GW2 UI 配置中的 mover 位置。

这样既保留 GW2 UI 的布局保存与恢复默认能力，也避免现有位置滑块和 mover 各管一套位置。

## 生命周期与兼容

注册动作安排在 `PLAYER_ENTERING_WORLD`，与聊天窗口当前初始化时机一致，此时
`ChatFrame1` 和 GW2 UI mover API 均已可用。重复进入世界时不重复注册。

如果框体已经存在 mover，则不重复接管；如果 mover API 或 GW 设置尚不可用，则继续使用
当前 `offsetX/offsetY` 固定位置逻辑，避免聊天窗口失去位置。

## 验收标准

1. 打开 `/gw2` 的“移动界面”后能看到“主聊天窗口”拖动框。
2. 拖动后退出编辑模式，`ChatFrame1` 停留在新位置；重载界面后位置不变。
3. 设置页的左边距、下边距仍可移动聊天窗口，并与 mover 位置一致。
4. 宽度、高度滑块行为不变；编辑模式不显示聊天窗口缩放项。
5. 停靠标签跟随 `ChatFrame1`；独立聊天窗口不受影响。

## 测试

增加静态 Lua 回归测试，验证聊天模块：

- 使用独立 mover 设置名；
- 补齐 GW 默认值与当前配置；
- 调用 `GW.RegisterMovableFrame` 且仅声明 `default`；
- 将 `ChatFrame1` 锚到 mover；
- 注册拖动后的同步回调；
- 不启用 `scaleable` 或 `height`。

最后运行现有全部 Lua 测试，确认动作条和设置面板没有回归。
