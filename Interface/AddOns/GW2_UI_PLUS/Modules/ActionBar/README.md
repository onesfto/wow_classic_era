# ActionBar 模块

ActionBar 扩展 GW2_UI 的动作条布局、尺寸、渐隐和职业专用动作条。

## 文件职责

```text
ActionBar_Core.lua       默认值、SavedVariables、动作条常量
ActionBar_Mover.lua      动作条 mover 和位置恢复
ActionBar_Layout.lua     动作条尺寸、布局和文本位置
ActionBar.lua            主入口和初始化
Layout.lua               共享布局计算
Equipment.lua            装备变化后的布局处理
MageBar.lua              法师传送、传送门、食物和宝石按钮
Fader.lua                全局渐隐
Options_*.lua            设置页控件和选项来源
```

TOC 中的加载顺序必须先完成 `ActionBar_Core.lua`、mover、layout，再加载主入口和选项文件。

## 设置范围

- GW2_UI 动作条总开关；
- 主动作条和多动作条的尺寸、按钮数、列数和间距；
- 快捷键和宏名称显示；
- 全局渐隐、战斗/目标/施法/生命状态下的保持显示；
- 法师动作条、姿态条、宠物条和图腾条；
- 施法条尺寸、玩家资源和地球仪缩放。

设置入口位于 `/gw2` → **组件** → **动作条**；部分玩家资源入口位于 `/gw2` → **框体** → **玩家**。

## 共享接口

`addonTable.PlusActionBar` 提供 `InitDB()`、`QueueOutOfCombat()`、`SetFontStringSize()`、`defaults` 和动作条常量。设置控件复用 `addonTable.ActionBarOptionsUtils` 创建、刷新和恢复默认。

新增选项时：

1. 在 `ActionBar_Core.lua` 的 `defaults` 增加默认值。
2. 在对应 `Options_*.lua` 创建 getter、setter 和默认值回调。
3. 布局或尺寸变化通过现有 `Layout`、`Fader` 或 mover 方法应用。
4. 受保护的动作条操作交给 `QueueOutOfCombat()`。

## 注意事项

- 不要在设置文件中重新定义默认值。
- 不要直接移动 GW2_UI 已注册的动作条 Frame，优先使用现有 mover。
- 修改主动作条尺寸时，同时检查玩家资源、施法条和地球仪的关联布局。
