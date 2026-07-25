# GW2 UI 源码结构说明

由于未指定 Markdown 文件的具体内容需求，本文件基于 `GW2_UI_1.15.9` 源码目录结构，自动生成代码库的基础说明。如需特定功能分析或开发设计文档，请明确补充需求。

## 1. 基础信息
*   **插件名称**：GW2 UI
*   **核心功能**：HUD 界面替换（UI Overhaul）
*   **存储变量**：
    *   全局：`GW2UI_SETTINGS_PROFILES`、`GW2UI_STORAGE2`、`GW2UI_LAYOUTS`、`GW2UI_DATABASE`、`GW2UI_PRIVATE_DB`
    *   角色：`GW2UI_PRIVATE_SETTINGS`、`GW2UI_PRIVATE_LAYOUTS`、`GW2UI_QUEST_WATCH_DB`

## 2. 核心目录结构
*   **`core/`**：插件的核心逻辑代码（初始化、核心框架）。
*   **`Games/`**：针对不同魔兽世界客户端版本（如 Classic）的差异化适配代码。
*   **`Libs/`**：插件依赖的第三方代码库。
*   **`locales/`**：多语言本地化文件存放目录。
*   **`settings/`**：插件设置面板及相关配置逻辑代码。
*   **`Textures/`、`fonts/`、`sounds/`**：UI 界面使用的材质贴图、字体和音效等静态资源。

## 3. 配置文件 (TOC)
插件通过不同的 TOC 文件来适配魔兽世界的不同服务器版本：
*   `GW2_UI_Vanilla.toc`：经典旧世（Classic Era）
*   `GW2_UI_TBC.toc`：燃烧的远征（TBC）
*   `GW2_UI_Wrath.toc`：巫妖王之怒（WotLK）
*   `GW2_UI_Mists.toc`：熊猫人之谜（MoP）
*   `GW2_UI_Mainline.toc`：正式服（Retail）

## 4. 架构与开发原则
*   **源码只读保护**：`GW2_UI_1.15.9` 为官方原始代码目录，禁止直接修改。
*   **外挂式修改**：所有相关的汉化、Bug 修复（如法术书 Bug）、二次开发必须在外部模块（例如通过 Python 脚本或同级独立目录）进行拦截与覆写，以保证原版插件的可升级性。
