# GW2_UI_PLUS

GW2_UI 的 Classic Era 增强插件，补充动作条、聊天、设置面板、工具条、世界地图和界面皮肤功能。

## 功能范围

- 动作条：尺寸、布局、渐隐、法师动作条和相关 HUD 控件。
- 聊天：频道按钮、聊天窗口布局、消息过滤和聊天增强。
- 设置：将 GW2_UI 原生设置整理为框体、聊天、队伍、组件和编辑模式入口。
- 工具与地图：快捷栏、标记条、性能条、小地图插件收纳和世界地图增强。
- 皮肤与辅助：专业面板、邮件、任务日志、第三方插件皮肤以及通用便利功能。

## 安装与入口

1. 将 `GW2_UI_PLUS` 放入 `World of Warcraft/_classic_era_/Interface/AddOns/`。
2. 确保 `GW2_UI` 已安装并启用。
3. 启动游戏，在 `/gw2` 设置窗口中进入对应标签页。

常用命令：

- `/gw2`：打开 GW2_UI 设置窗口。
- `/gwcb`：打开频道按钮条命令入口。
- `/dcp`、`/cooldownpulse`：打开冷却脉冲命令入口。

## 目录

```text
GW2_UI_PLUS/
├── Core/                 核心辅助与设置基础设施
├── Libs/                 第三方库
├── Locale/               本地化文本
├── Docs/                 项目文档
└── Modules/
    ├── General/          通用便利功能
    ├── Toolbar/          工具条
    ├── Minimap/          小地图插件收纳
    ├── ChatBar/          频道按钮条
    ├── ChatWindow/       聊天窗口
    ├── ActionBar/        动作条
    ├── UnitFrames/       单位框体
    ├── WorldMap/         世界地图
    ├── Settings/         设置面板
    ├── Social/           社交面板
    └── Skins/            界面皮肤
```

## 文档

- [文档中心](Docs/README.md)
- [配置说明](Docs/CONFIGURATION.md)
- [API 文档](Docs/API.md)
- [迁移说明](Docs/MIGRATION.md)
- [设置系统架构](Docs/SETTINGS_ARCHITECTURE.md)
- [设置界面排版规范](Docs/SETTINGS_LAYOUT_GUIDE.md)

## 依赖与兼容

- 必须依赖 `GW2_UI`。
- `BetterBags`、`BugSack`、`MailLogger`、`NovaWorldBuffs` 等插件皮肤按实际安装状态启用。
- 代码按 Classic Era 客户端 API 编写，模块加载顺序以 `GW2_UI_PLUS.toc` 为准。

## 许可

与 GW2_UI 本体保持一致。
