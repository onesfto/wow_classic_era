# GW2_UI_PLUS

GW2_UI 的增强插件，提供额外功能和优化。

## 功能特性

### 动作条 (ActionBar)
- 全局渐隐效果
- 可调整按钮尺寸
- 法师专用动作条（传送、传送门、造食物/水、魔法宝石）
- 灵活的 Mover 编辑

### 聊天增强 (ChatBar & ChatWindow)
- 频道快速切换按钮条
- 消息自动修剪
- 职业颜色高亮
- 可拖动聊天标签

### 社交面板 (Social)
- 好友列表换肤
- 公会列表优化
- 忽略列表
- 团队列表
- Who 列表

### 换肤系统 (Skins)
- 专业/制造面板 GW2 风格
- 邮件窗口
- 任务日志
- 第三方插件支持（BugSack, MailLogger, NovaWorldBuffs 等）

### 工具条 (Toolbar)
- 快捷栏
- 性能监控条

### 其他
- 小地图增强
- 主菜单优化
- 技能冷却脉冲效果

## 安装

1. 将 `GW2_UI_PLUS` 文件夹放入 `World of Warcraft/_classic_era_/Interface/AddOns/`
2. 确保已安装 GW2_UI 本体
3. 启动游戏，启用插件

## 配置

游戏内输入 `/gw2` 打开 GW2_UI 设置面板，在「附加组件」分类下找到各模块设置。

### 斜杠命令
- `/gwcb` - ChatBar 设置
- `/dcp` 或 `/cooldownpulse` - 技能冷却脉冲设置

## 目录结构

```
GW2_UI_PLUS/
├── Assets/           资源文件
├── Core/             核心模块
├── Libs/             第三方库
├── Locale/           本地化
├── Docs/             文档
└── Modules/          功能模块
    ├── AddonsSettings/ 附加组件设置
    ├── ActionBar/      动作条
    ├── ChatBar/        频道按钮条
    ├── ChatWindow/     聊天窗口
    ├── Common/         公共工具
    ├── CooldownPulse/  技能冷却
    ├── General/        通用功能
    ├── Minimap/        小地图
    ├── Settings/       设置面板
    ├── Skins/          换肤
    ├── Social/         社交面板
    ├── Toolbar/        工具条
    ├── UnitFrames/     单位框体
    └── WorldMap/       世界地图
```

## 开发文档

- [API 文档](Docs/API.md) - 模块接口说明
- [开发指南](Docs/DEVELOPMENT.md) - 开发规范与流程
- [配置说明](Docs/CONFIGURATION.md) - 配置项详解
- [WoW Lua 开发规范](Docs/DEV-GAME-WOW-LUA-GUIDE-GENERAL.md)
- [迁移指南](Docs/MIGRATION.md)

## 代码质量

- **代码行数**: 14,938 行
- **文件数量**: 61 个
- **平均文件**: 244 行
- **最大文件**: 727 行
- **模块健康度**: 9/10 达到 A-B 级

## 性能

- OnUpdate 事件合理节流
- 全局变量缓存机制
- 防抖/节流工具
- 无明显性能瓶颈

## 贡献

欢迎提交 Issue 和 Pull Request。

## 许可

与 GW2_UI 本体保持一致。

## 鸣谢

- GW2_UI 作者及社区
- 所有贡献者
