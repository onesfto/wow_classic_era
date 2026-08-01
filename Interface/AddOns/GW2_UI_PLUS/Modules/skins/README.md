# Skins 模块

第三方插件与原生窗口换肤，统一为 GW2 风格。

## 文件结构

### 核心引擎
- `Core.lua` - 皮肤引擎核心，管理皮肤加载与注册
- `Options.lua` - 设置面板，控制各皮肤的开关

### 原生窗口皮肤
- **TradeSkill（专业/制造面板）** - 已拆分为 4 个文件
  - `TradeSkill_Utils.lua` (476行) - 工具函数与常量
  - `TradeSkill_Layout.lua` (286行) - 布局计算函数
  - `TradeSkill_Skin.lua` (230行) - 主皮肤函数（SkinTradeSkillFrame, SkinCraftFrame）
  - `TradeSkill.lua` (66行) - 主入口与初始化
- `Mail.lua` (709行) - 邮件窗口皮肤
- `QuestLog.lua` (686行) - 任务日志皮肤

### 第三方插件皮肤
- `BugSack.lua` (101行) - BugSack 插件皮肤
- `SimpleRaidTargetIcons.lua` (192行) - 团队标记插件皮肤
- `Myslot.lua` (246行) - Myslot 插件皮肤
- `MailLogger.lua` (627行) - MailLogger 插件皮肤
- `NovaWorldBuffs.lua` (462行) - NovaWorldBuffs 插件皮肤
- `NovaWorldBuffs_zhCN.lua` (25行) - NovaWorldBuffs 中文化

## TradeSkill 拆分说明

原 `TradeSkill.lua` 为 1014 行超长文件，已拆分为 4 个模块：

### 1. Utils（工具层）
- 常量定义（面板尺寸、布局位置、颜色等）
- 通用工具函数（HideRegion, ShowRegion, SkinCloseButton 等）
- 可被其他皮肤模块复用

### 2. Layout（布局层）
- `LayoutTradeSkillFrame` - 专业面板布局计算
- `LayoutCraftFrame` - 制造/附魔面板布局计算
- 按钮扩展和队列管理

### 3. Skin（皮肤层）
- `SkinTradeSkillFrame` - 专业面板主皮肤函数
- `SkinCraftFrame` - 制造/附魔面板主皮肤函数

### 4. 入口（主文件）
- `LoadTradeSkillFrameSkin` - 模块初始化
- 事件注册和按需加载管理

拆分后单文件最大 476 行，职责清晰分离，便于维护和扩展。

## 加载顺序

必须按以下顺序加载（已在 `GW2_UI_PLUS.toc` 中配置）：
1. `TradeSkill_Utils.lua` - 工具函数（被 Layout 和 Skin 依赖）
2. `TradeSkill_Layout.lua` - 布局函数（被 Skin 依赖）
3. `TradeSkill_Skin.lua` - 皮肤函数（被主入口调用）
4. `TradeSkill.lua` - 主入口
5. 其他皮肤文件...
6. `Core.lua` - 皮肤引擎核心（必须在所有皮肤之后加载）

## 相关文档

- [换肤规范](../../Docs/modules/skins-SKIN_STANDARD.md) - 皮肤模块开发规范
- [MailLogger 皮肤详解](../../Docs/modules/skins-MailLogger.md) - MailLogger 皮肤实现细节
