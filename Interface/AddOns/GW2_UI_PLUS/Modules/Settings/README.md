# Settings 模块

设置面板管理和原生设置隐藏。

## 文件
- `Settings.lua` - 主设置标签页逻辑，构建"框体"标签页（BuildMainMenuTab、ArrangeSettingsTabs）
- `HideNativeSettings.lua` - 隐藏和过滤 GW2_UI 原生设置面板（PrepareUnitFrameSettings）
- `SettingsIcon.lua` - 设置图标管理

## 功能
- 构建自定义的"框体"设置标签页，集成玩家、目标、队伍等单位框架设置
- 隐藏 GW2_UI 原生的重复或被替代的设置面板
- 管理玩家光环视图（增益/减益分开显示）
- 排列设置窗口的标签顺序

## 架构说明
- `Settings.lua` 负责构建新的设置标签页，导出 `BuildMainMenuTab` 和 `ArrangeSettingsTabs`
- `HideNativeSettings.lua` 负责隐藏原生面板，导出 `PrepareUnitFrameSettings`
- 两个文件通过 `addonTable` 共享 `PreparePlayerAuraPanel` 等函数
