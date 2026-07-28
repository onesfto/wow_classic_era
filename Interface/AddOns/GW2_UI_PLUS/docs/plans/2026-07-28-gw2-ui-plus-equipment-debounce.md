# GW2 UI Plus Equipment Debounce Implementation Plan

> 本文档随 GW2 UI Plus 插件保存。

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 不修改 GW2 UI 源码，由 Plus 将一批连续换装事件合并为一次动作按钮装备边框扫描。

**Architecture:** 新增独立 `ActionBar/Equipment.lua`。初始化时通过匿名框体及事件注册指纹识别 GW2 UI 动作条事件框体，只取消其装备事件；Plus 自己注册该事件，并在最后一次事件静默 0.1 秒后执行原等价扫描。

**Tech Stack:** World of Warcraft Lua API、`EnumerateFrames`、`C_Timer.NewTimer`、Lua mock 回归测试。

---

### Task 1: 回归测试

**Files:**
- Create: `Interface/AddOns/GW2_UI_PLUS/tests/EquipmentDebounce_test.lua`

- [ ] 创建带事件注册表的框体 mock、可取消计时器及动作按钮。
- [ ] 加载 `ActionBar/Equipment.lua` 并初始化。
- [ ] 断言只从匹配框体取消 `PLAYER_EQUIPMENT_CHANGED`，其他事件仍注册。
- [ ] 连续触发三次装备事件，断言前两个计时器取消且扫描尚未执行。
- [ ] 执行最后一个计时器，断言按钮只扫描一次且装备边框变绿。
- [ ] 运行 `lua tests/EquipmentDebounce_test.lua`，确认实现前失败。

### Task 2: 防抖模块

**Files:**
- Create: `Interface/AddOns/GW2_UI_PLUS/ActionBar/Equipment.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/ActionBar.lua`

- [ ] 实现 GW2 UI 动作条事件框体指纹识别。
- [ ] 只取消匹配框体的 `PLAYER_EQUIPMENT_CHANGED`。
- [ ] Plus 注册装备事件并以 0.1 秒可取消计时器防抖。
- [ ] 在计时器完成时执行一次 8×12 按钮装备状态扫描。
- [ ] 从动作条统一初始化入口用 `SafeRun` 调用模块初始化。
- [ ] 将模块加入 TOC，保证在核心文件之后加载。

### Task 3: 验证

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/README.md`

- [ ] 记录运行时事件接管和失败回退行为。
- [ ] 运行 `lua tests/EquipmentDebounce_test.lua`。
- [ ] 运行 `lua tests/FaderBling_test.lua`。
- [ ] 运行 `luac -p ActionBar/Equipment.lua ActionBar/ActionBar.lua ActionBar/Fader.lua tests/EquipmentDebounce_test.lua tests/FaderBling_test.lua`。
- [ ] 游戏内 `/reload` 后复测整套换装。
