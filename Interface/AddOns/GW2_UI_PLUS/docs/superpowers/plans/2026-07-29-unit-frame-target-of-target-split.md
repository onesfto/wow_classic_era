# 框体菜单“目标的目标”拆分实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将 GW2_UI_PLUS“框体”设置中的“目标的目标”从“目标”页面拆出，作为独立原生页面入口，同时保持小队页面完全不变。

**Architecture:** 继续复用 GW2_UI 原生设置页面和现有页面迁移机制，不复制设置控件。移除 `target_of_target` 向 `target_general` 的数据源合并，在菜单中直接映射原生 `target_of_target` 页面，并分别过滤两个目标页面的“隐藏器”分组。

**Tech Stack:** Lua 5.1、World of Warcraft Classic Era AddOn API、GW2_UI 设置页面 API、源码结构断言测试。

---

## 文件结构

- 修改 `MainMenu/MainMenu.lua`：删除目标设置合并函数，独立准备和显示 `target_of_target` 原生页面。
- 修改 `tests/SettingsStructure_test.lua`：锁定独立菜单顺序、取消合并、两个页面隐藏“隐藏器”以及小队设置不处理。

本功能不需要新增运行时代码文件、SavedVariables 或迁移逻辑。

### Task 1: 用结构测试描述独立页面行为

**Files:**
- Modify: `tests/SettingsStructure_test.lua:8-27`
- Test: `tests/SettingsStructure_test.lua`

- [ ] **Step 1: 写入会失败的结构测试**

在 `local mainMenu = Read("MainMenu/MainMenu.lua")` 后加入：

```lua
local targetMenuPos = assert(mainMenu:find(
    'CreateMenuButton("目标", "target_general", false, false)',
    1, true), "框体菜单必须包含目标入口")
local targetOfTargetMenuPos = assert(mainMenu:find(
    'CreateMenuButton("目标的目标", "target_of_target", false, false)',
    1, true), "框体菜单必须包含独立的目标的目标入口")
local petMenuPos = assert(mainMenu:find(
    'CreateMenuButton("宠物", "player_pet", false, false)',
    1, true), "框体菜单必须包含宠物入口")
assert(targetMenuPos < targetOfTargetMenuPos
    and targetOfTargetMenuPos < petMenuPos,
    "目标的目标必须排列在目标与宠物之间")
assert(not mainMenu:find("MergeTargetOfTargetSettings", 1, true),
    "目标页面不能继续合并目标的目标设置")
assert(mainMenu:find(
        "HideEmbeddedFader(embeddedPanels.target_general, faderLabel)",
        1, true)
    and mainMenu:find(
        "HideEmbeddedFader(embeddedPanels.target_of_target, faderLabel)",
        1, true),
    "目标与目标的目标页面都必须隐藏原生隐藏器")
assert(not mainMenu:find("RAID_STYLE_PARTY_AND_FRAMES", 1, true),
    "框体菜单不能处理小队的同时显示队伍和团队框架设置")
```

- [ ] **Step 2: 运行测试并确认它因缺少独立菜单而失败**

Run:

```bash
lua tests/SettingsStructure_test.lua
```

Expected: FAIL，错误包含 `框体菜单必须包含独立的目标的目标入口`。

- [ ] **Step 3: 暂不提交失败测试**

失败测试与下一任务的最小实现放在同一个功能提交中，避免主分支保留不可运行的提交。

### Task 2: 拆分目标的目标原生设置页

**Files:**
- Modify: `MainMenu/MainMenu.lua:129-185`
- Modify: `MainMenu/MainMenu.lua:390-398`
- Modify: `MainMenu/MainMenu.lua:580-583`
- Test: `tests/SettingsStructure_test.lua`

- [ ] **Step 1: 删除设置合并函数**

完整删除以下函数：

```lua
local function MergeTargetOfTargetSettings(
    targetPanel, targetOfTargetPanel, faderLabel)
    -- 删除整个函数体
end
```

删除范围从函数声明开始，到对应的最后一个 `end` 为止，不修改相邻的 `HideEmbeddedFader` 或 `CopyMap`。

- [ ] **Step 2: 分别过滤两个目标页面的隐藏器**

把 `PrepareUnitFrameSettings` 中的：

```lua
HideEmbeddedFader(embeddedPanels.target_general, faderLabel)
HideEmbeddedFader(embeddedPanels.player_pet, faderLabel)
MergeTargetOfTargetSettings(
    embeddedPanels.target_general,
    embeddedPanels.target_of_target,
    faderLabel)
```

替换为：

```lua
HideEmbeddedFader(embeddedPanels.target_general, faderLabel)
HideEmbeddedFader(embeddedPanels.target_of_target, faderLabel)
HideEmbeddedFader(embeddedPanels.player_pet, faderLabel)
```

不要读取、过滤或修改 `party_general`，也不要加入 `RAID_STYLE_PARTY_AND_FRAMES`。

- [ ] **Step 3: 增加独立菜单按钮**

把：

```lua
CreateMenuButton("目标", "target_general", false, false)
CreateMenuButton("宠物", "player_pet", false, false)
```

替换为：

```lua
CreateMenuButton("目标", "target_general", false, false)
CreateMenuButton(
    "目标的目标", "target_of_target", false, false)
CreateMenuButton("宠物", "player_pet", false, false)
```

`SelectPage` 已能按 `pages[panelId]` 解析普通原生页面，因此不增加新的页面分支或状态字段。

- [ ] **Step 4: 运行结构测试并确认通过**

Run:

```bash
lua tests/SettingsStructure_test.lua
```

Expected: 输出 `SettingsStructure_test: OK`，退出码为 0。

- [ ] **Step 5: 检查 Lua 语法**

Run:

```bash
luac -p MainMenu/MainMenu.lua tests/SettingsStructure_test.lua
```

Expected: 无输出，退出码为 0。

- [ ] **Step 6: 提交功能改动**

```bash
git add MainMenu/MainMenu.lua tests/SettingsStructure_test.lua
git commit -m "框体：拆分目标的目标设置页"
```

### Task 3: 回归验证与游戏内验收

**Files:**
- Verify: `MainMenu/MainMenu.lua`
- Verify: `tests/SettingsStructure_test.lua`

- [ ] **Step 1: 运行插件全部自动测试**

Run:

```bash
for test_file in tests/*_test.lua; do
    lua "$test_file" || exit 1
done
```

Expected: 每个测试打印对应的 `OK` 信息，最终退出码为 0。

- [ ] **Step 2: 检查补丁格式**

Run:

```bash
git diff --check HEAD^ -- MainMenu/MainMenu.lua \
    tests/SettingsStructure_test.lua
```

Expected: 无输出，退出码为 0。

- [ ] **Step 3: 游戏内验证菜单和页面**

重载界面后打开 `GW2_UI → 设置 → 框体`，依次验证：

1. 菜单顺序为“玩家、目标、目标的目标、宠物、小队”。
2. “目标”页不再出现“目标的目标”设置。
3. “目标的目标”页显示原生设置，且不显示“隐藏器”分组。
4. 修改“目标”及“目标的目标”设置后，原生保存值和回调正常。
5. “小队”页与改动前完全一致，“同时显示队伍和团队框架”保持原有显示与行为。

- [ ] **Step 4: 记录手工验证限制**

如果当前环境不能启动游戏，在交付说明中明确写出“自动测试已通过，游戏内手工验证待用户完成”，不得声称已经完成游戏内验证。
