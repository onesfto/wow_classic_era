# GW2 UI Plus 动作条设置排版与法师条修复 Implementation Plan

> 本文档随 GW2 UI Plus 插件保存。

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 统一动作条设置排版、补齐文字字号和主条宏名称设置，并恢复法师动作条施法与中文显示。

**Architecture:** 保留现有顶级动作条设置页，在自定义渲染器上增加通用列数元数据；布局模块继续作为按钮文字应用的唯一入口。法师按钮只修正安全点击注册，硬编码英文由 Plus 运行时翻译层处理。

**Tech Stack:** World of Warcraft Classic Lua、GW2 UI 设置模板、SecureActionButtonTemplate、Lua 独立回归测试。

---

### Task 1: 设置结构与默认值

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/tests/SettingsStructure_test.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/tests/ActionBarFollowup_test.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/ActionBar.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua`

- [ ] **Step 1: 写失败测试**

断言设置源码包含通用 `gwPlusColumns` 分栏、完整行恢复按钮、简化标签、文字字号字段、法师职业禁用元数据和法师五列布局。

- [ ] **Step 2: 运行失败测试**

Run: `lua tests/SettingsStructure_test.lua && lua tests/ActionBarFollowup_test.lua`

Expected: FAIL，指出新布局或字段尚不存在。

- [ ] **Step 3: 实现默认值与设置结构**

新增主条宏名称、多条快捷键/宏名称字号、姿态条和宠物条快捷键字号默认值；滑块最多标记为 2 列，法师复选框标记为 5 列并简化名称。

- [ ] **Step 4: 实现通用行渲染**

按每行第一个选项的 `gwPlusColumns` 聚合连续同列数项；标题行使用原生高度和 8 像素后间距；恢复按钮保持 550×40 整行。

- [ ] **Step 5: 运行设置测试**

Run: `lua tests/SettingsStructure_test.lua && lua tests/ActionBarFollowup_test.lua`

Expected: 两项均输出 `OK`。

### Task 2: 文字字号和主条宏名称

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/tests/ActionBarLayout_test.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/ActionBar.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/Layout.lua`

- [ ] **Step 1: 写失败测试**

断言多动作条快捷键与宏名称、姿态条和宠物条快捷键能应用指定字体大小，并验证主动作条宏名称偏移和字号。

- [ ] **Step 2: 运行失败测试**

Run: `lua tests/ActionBarLayout_test.lua`

Expected: FAIL，文字对象未收到 `SetFont` 或主条宏名称配置未应用。

- [ ] **Step 3: 实现字体应用**

读取 FontString 当前字体文件和 flags，仅替换字号；主条布局循环同步宏名称显示、位置和字号。

- [ ] **Step 4: 运行布局测试**

Run: `lua tests/ActionBarLayout_test.lua`

Expected: `ActionBarLayout_test: OK`。

### Task 3: 法师安全按钮与职业限制

**Files:**
- Create: `Interface/AddOns/GW2_UI_PLUS/tests/MageBar_test.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/MageBar.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/ActionBar.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua`

- [ ] **Step 1: 写失败测试**

以最小按钮桩验证创建法师按钮会注册 `AnyUp` 和 `AnyDown`；静态断言非 法师页面存在且选项具有禁用标记。

- [ ] **Step 2: 运行失败测试**

Run: `lua tests/MageBar_test.lua && lua tests/SettingsStructure_test.lua`

Expected: FAIL，当前仅注册 `AnyUp` 或页面仅对法师创建。

- [ ] **Step 3: 修复按钮与职业默认值**

将按钮注册改为 `RegisterForClicks("AnyUp", "AnyDown")`；迁移旧存档时非 法师强制关闭法师条，法师保持已保存选择；页面始终创建，非 法师控件禁用。

- [ ] **Step 4: 运行法师条测试**

Run: `lua tests/MageBar_test.lua && lua tests/SettingsStructure_test.lua`

Expected: 两项均输出 `OK`。

### Task 4: HUD 英文运行时翻译

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/tests/ActionBarFollowup_test.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/locale/Hardcoded.lua`

- [ ] **Step 1: 写失败测试**

断言 Plus 翻译层包含布局、占位符、网格和锁定 HUD 的中文映射，并在 HUD 框体创建后应用。

- [ ] **Step 2: 运行失败测试**

Run: `lua tests/ActionBarFollowup_test.lua`

Expected: FAIL，缺少 HUD 英文映射。

- [ ] **Step 3: 实现运行时翻译**

只修改已知 HUD 控件 FontString/Button 文本，不按全局文本值模糊匹配，避免再次影响单位框体“目标”。

- [ ] **Step 4: 运行翻译测试**

Run: `lua tests/ActionBarFollowup_test.lua`

Expected: `ActionBarFollowup_test: OK`。

### Task 5: 完整验证

**Files:**
- Test: `Interface/AddOns/GW2_UI_PLUS/tests/*_test.lua`

- [ ] **Step 1: 运行 Lua 语法检查**

Run: `for file in ActionBar/*.lua locale/Hardcoded.lua; do luac -p "$file"; done`

Expected: exit 0，无输出。

- [ ] **Step 2: 运行全部 Plus 测试**

Run: `for test in tests/*_test.lua; do lua "$test"; done`

Expected: 每项输出 `OK`，exit 0。

- [ ] **Step 3: 静态确认未修改 GW2 UI**

Run: `git status --short -- Interface/AddOns/GW2_UI Interface/AddOns/GW2_UI_PLUS`

Expected: 本任务新增改动只位于 `GW2_UI_PLUS`。
