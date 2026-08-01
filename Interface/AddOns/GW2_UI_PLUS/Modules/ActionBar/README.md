# ActionBar 模块

动作条扩展功能：全局渐隐、按钮尺寸调整、法师专用条。

## 文件结构

### 核心逻辑（已拆分）

**ActionBar.lua 原文件 (932行) 已拆分为 4 个模块：**

- **ActionBar_Core.lua** (166行) - 常量定义与存档初始化
  - MAINBAR_DEFAULT_SIZE, GLOBE_*, MULTIBARS 配置表
  - InitDB() 存档初始化函数
  - AB 模块表基础定义

- **ActionBar_Mover.lua** (632行) - Mover 管理与选项面板
  - Mover 位置管理函数
  - 主动作条 Mover 注册
  - Mover 选项面板（滑块、下拉框）

- **ActionBar_Layout.lua** (591行) - 布局与尺寸管理
  - 多动作条尺寸管理
  - 主动作条布局与文本
  - 施法条和地球仪缩放
  - 玩家框架与地球仪风格管理

- **ActionBar.lua** (96行) - 主入口与初始化
  - Init 函数
  - SafeRun 错误处理
  - 事件注册

### 其他模块

- `Layout.lua` - 布局计算与应用
- `Equipment.lua` - 装备管理
- `MageBar.lua` - 法师动作条（传送、传送门、造食物/水）
- `Fader.lua` - 全局渐隐效果

### 设置面板（已拆分）

- `Options_Utils.lua` (343行) - 面板创建、布局、刷新等底层工具函数
- `Options_General.lua` (116行) - GW2 UI 动作条总开关、全局渐隐设置
- `Options.lua` (1037行) - 主入口 + 各动作条详细设置

## 拆分说明

### ActionBar.lua 拆分
原文件 932 行，职责混杂，已拆分为：
1. **Core** - 基础设施（常量、存档、AB表）
2. **Mover** - 编辑框管理
3. **Layout** - 布局与尺寸
4. **主入口** - 初始化与协调

拆分后单文件最大 632 行，总计 1485 行（增加 553 行模块声明与注释），职责清晰。

### Options.lua 拆分
原文件 1410 行，已拆分为：
1. **Utils** - 可复用的面板基础设施
2. **General** - 全局开关与渐隐
3. **主文件** - 各动作条具体设置

## 加载顺序

必须按以下顺序加载（已在 `GW2_UI_PLUS.toc` 中配置）：
1. `ActionBar_Core.lua` - 初始化 AB 表和常量
2. `ActionBar_Mover.lua` - Mover 管理（依赖 Core）
3. `ActionBar_Layout.lua` - 布局函数（依赖 Core）
4. `ActionBar.lua` - 主入口（依赖以上所有）
5. `Layout.lua` / `Equipment.lua` / `MageBar.lua` / `Fader.lua` - 其他模块
6. `Options_Utils.lua` - 工具函数（被 Options_General 和 Options 依赖）
7. `Options_General.lua` - 通用设置（被 Options 引用）
8. `Options.lua` - 主设置面板
