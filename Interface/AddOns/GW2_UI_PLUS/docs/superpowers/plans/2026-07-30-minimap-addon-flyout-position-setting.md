# 插件悬浮入口位置设置实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 在插件悬浮按钮设置页增加立即生效的八方向位置下拉框，默认选择小地图左侧正中。

**Architecture:** `Minimap/AddonFlyout.lua` 保存和校验语义位置值，并通过单一锚点映射表定位 `GwAddonToggle`。`Minimap/Options.lua` 只负责展示八个中文选项和调用运行模块接口，不直接操作游戏框体。

**Tech Stack:** World of Warcraft Classic Lua API、GW2_UI 设置面板 API、独立 Lua 测试、Lua 5.5/`luac`

---

## 文件职责

- `Minimap/AddonFlyout.lua`：位置默认值、有效值校验、锚点映射、即时刷新接口。
- `Minimap/Options.lua`：八方向位置下拉设置。
- `tests/MinimapAddonFlyout_test.lua`：位置保存、回退、八个锚点和即时生效测试。
- `tests/MinimapAddonFlyoutOptions_test.lua`：设置页结构和选项测试。

### 任务 1：运行模块支持八方向位置

**Files:**
- Modify: `tests/MinimapAddonFlyout_test.lua`
- Modify: `Minimap/AddonFlyout.lua`

- [ ] **步骤 1：写入默认位置和无效值回退测试**

在 `Flyout.InitDB()` 的现有断言后增加：

```lua
assert(db.minimapAddonFlyoutPosition == "LEFT",
    "插件悬浮入口首次应默认位于左中")
assert(Flyout.GetPosition() == "LEFT",
    "默认位置接口应返回左中")
GW2_UI_PLUS_SV.minimapAddonFlyoutPosition = "INVALID"
assert(Flyout.GetPosition() == "LEFT",
    "无效位置保存值应回退到左中")
GW2_UI_PLUS_SV.minimapAddonFlyoutPosition = "LEFT"
```

- [ ] **步骤 2：把首次入口锚点预期改为左中**

将当前右中断言改为：

```lua
local togglePoint, toggleRelativeTo, toggleRelativePoint,
    toggleX, toggleY = firstToggle:GetPoint(1)
assert(togglePoint == "RIGHT" and toggleRelativeTo == Minimap
    and toggleRelativePoint == "LEFT"
    and toggleX == -4 and toggleY == 0,
    "悬浮入口默认应位于小地图左侧正中")
```

- [ ] **步骤 3：写入八方向即时定位测试**

在默认锚点断言后增加位置映射：

```lua
local positionCases = {
    TOPLEFT = {"TOPRIGHT", "TOPLEFT", -4, 0},
    TOP = {"BOTTOM", "TOP", 0, 4},
    TOPRIGHT = {"TOPLEFT", "TOPRIGHT", 4, 0},
    LEFT = {"RIGHT", "LEFT", -4, 0},
    RIGHT = {"LEFT", "RIGHT", 4, 0},
    BOTTOMLEFT = {"BOTTOMRIGHT", "BOTTOMLEFT", -4, 0},
    BOTTOM = {"TOP", "BOTTOM", 0, -4},
    BOTTOMRIGHT = {"BOTTOMLEFT", "BOTTOMRIGHT", 4, 0},
}

for position, expected in pairs(positionCases) do
    Flyout.SetPosition(position)
    local point, relativeTo, relativePoint, x, y =
        firstToggle:GetPoint(1)
    assert(GW2_UI_PLUS_SV.minimapAddonFlyoutPosition == position,
        position .. " 应立即保存")
    assert(point == expected[1] and relativeTo == Minimap
        and relativePoint == expected[2]
        and x == expected[3] and y == expected[4],
        position .. " 应立即应用正确锚点")
end

Flyout.SetPosition("INVALID")
assert(Flyout.GetPosition() == "LEFT",
    "接口收到无效位置时应回退到左中")
```

- [ ] **步骤 4：运行测试并确认失败**

Run:

```bash
lua tests/MinimapAddonFlyout_test.lua
```

Expected: FAIL，首先出现“插件悬浮入口首次应默认位于左中”或 `GetPosition` 不存在，证明运行模块尚未支持位置保存。

- [ ] **步骤 5：增加位置常量和锚点映射**

在 `Minimap/AddonFlyout.lua` 的局部状态后增加：

```lua
local defaultPosition = "LEFT"

local positionAnchors = {
    TOPLEFT = {"TOPRIGHT", "TOPLEFT", -4, 0},
    TOP = {"BOTTOM", "TOP", 0, 4},
    TOPRIGHT = {"TOPLEFT", "TOPRIGHT", 4, 0},
    LEFT = {"RIGHT", "LEFT", -4, 0},
    RIGHT = {"LEFT", "RIGHT", 4, 0},
    BOTTOMLEFT = {"BOTTOMRIGHT", "BOTTOMLEFT", -4, 0},
    BOTTOM = {"TOP", "BOTTOM", 0, -4},
    BOTTOMRIGHT = {"BOTTOMLEFT", "BOTTOMRIGHT", 4, 0},
}
```

- [ ] **步骤 6：初始化并校验保存值**

在 `Flyout.InitDB()` 中初始化：

```lua
if GW2_UI_PLUS_SV.minimapAddonFlyoutPosition == nil then
    GW2_UI_PLUS_SV.minimapAddonFlyoutPosition =
        defaultPosition
end
```

在 `Flyout.IsEnabled()` 前增加：

```lua
function Flyout.GetPosition()
    local position =
        Flyout.InitDB().minimapAddonFlyoutPosition
    if not positionAnchors[position] then
        return defaultPosition
    end
    return position
end
```

- [ ] **步骤 7：让入口使用保存的锚点**

将 `EnsureToggle()` 中硬编码的 `SetPoint` 替换为：

```lua
if Minimap then
    local anchor = positionAnchors[Flyout.GetPosition()]
    toggle:ClearAllPoints()
    toggle:SetPoint(
        anchor[1], Minimap, anchor[2],
        anchor[3], anchor[4])
end
```

- [ ] **步骤 8：增加即时生效接口**

在 `Flyout.SetEnabled()` 前增加：

```lua
function Flyout.SetPosition(position)
    if not positionAnchors[position] then
        position = defaultPosition
    end
    Flyout.InitDB().minimapAddonFlyoutPosition = position
    Flyout.Refresh()
end
```

- [ ] **步骤 9：运行测试并确认通过**

Run:

```bash
lua tests/MinimapAddonFlyout_test.lua
```

Expected: PASS，并输出 `MinimapAddonFlyout_test: OK`。

- [ ] **步骤 10：提交运行模块**

```bash
git add Minimap/AddonFlyout.lua tests/MinimapAddonFlyout_test.lua
git commit -m "功能：支持插件悬浮入口八方向定位"
```

### 任务 2：设置页增加位置下拉框

**Files:**
- Modify: `tests/MinimapAddonFlyoutOptions_test.lua`
- Modify: `Minimap/Options.lua`

- [ ] **步骤 1：写入设置页失败测试**

在 `tests/MinimapAddonFlyoutOptions_test.lua` 的主开关断言后增加：

```lua
assert(options:find('AddOptionDropdown(', 1, true)
    and options:find('"位置"', 1, true),
    "设置页应提供插件悬浮入口位置下拉框")
for _, value in ipairs({
    "TOPLEFT", "TOP", "TOPRIGHT", "LEFT",
    "RIGHT", "BOTTOMLEFT", "BOTTOM", "BOTTOMRIGHT",
}) do
    assert(options:find('"' .. value .. '"', 1, true),
        "位置下拉框缺少保存值 " .. value)
end
for _, name in ipairs({
    "左上", "上", "右上", "左中",
    "右中", "左下", "下", "右下",
}) do
    assert(options:find('"' .. name .. '"', 1, true),
        "位置下拉框缺少显示名称 " .. name)
end
assert(options:find("Flyout.GetPosition", 1, true)
    and options:find("Flyout.SetPosition(value)", 1, true),
    "位置下拉框应通过运行模块接口立即读写")
assert(options:find("dependence = {", 1, true)
    and options:find(
        '["GW2PlusMinimapAddonFlyout_Enable"] = true',
        1, true),
    "位置下拉框应依赖插件悬浮按钮主开关")
assert(options:find(
        "GW2PlusMinimapAddonFlyout_Position", 1, true),
    "位置下拉框应提供稳定的设置项名称")
```

- [ ] **步骤 2：运行测试并确认失败**

Run:

```bash
lua tests/MinimapAddonFlyoutOptions_test.lua
```

Expected: FAIL，出现“设置页应提供插件悬浮入口位置下拉框”。

- [ ] **步骤 3：实现位置下拉框**

在 `Minimap/Options.lua` 的启用开关之后、`return panel` 之前增加：

```lua
local positionOption = panel:AddOptionDropdown(
    "位置",
    "插件悬浮入口位于小地图的哪个方向；切换后立即生效。",
    {
        optionsList = {
            "TOPLEFT", "TOP", "TOPRIGHT", "LEFT",
            "RIGHT", "BOTTOMLEFT", "BOTTOM", "BOTTOMRIGHT",
        },
        optionNames = {
            "左上", "上", "右上", "左中",
            "右中", "左下", "下", "右下",
        },
        getter = Flyout.GetPosition,
        setter = function(value)
            Flyout.SetPosition(value)
        end,
        getDefault = function() return "LEFT" end,
        dependence = {
            ["GW2PlusMinimapAddonFlyout_Enable"] = true,
        },
    })
if positionOption then
    positionOption.optionName =
        "GW2PlusMinimapAddonFlyout_Position"
end
```

- [ ] **步骤 4：运行设置页及运行时测试**

Run:

```bash
lua tests/MinimapAddonFlyoutOptions_test.lua
lua tests/MinimapAddonFlyout_test.lua
```

Expected: 两项均 PASS，并输出对应的 `OK`。

- [ ] **步骤 5：提交设置页**

```bash
git add Minimap/Options.lua tests/MinimapAddonFlyoutOptions_test.lua
git commit -m "设置：添加插件悬浮入口位置选项"
```

### 任务 3：完整验证

**Files:**
- Verify: `Minimap/AddonFlyout.lua`
- Verify: `Minimap/Options.lua`
- Verify: `tests/MinimapAddonFlyout_test.lua`
- Verify: `tests/MinimapAddonFlyoutOptions_test.lua`

- [ ] **步骤 1：运行相关测试**

```bash
lua tests/MinimapAddonFlyout_test.lua
lua tests/MinimapAddonFlyoutOptions_test.lua
```

Expected: 两项均 PASS。

- [ ] **步骤 2：运行完整测试并统计失败**

```bash
position_test_failures=0
for test_file in tests/*_test.lua; do
    if ! lua "$test_file"; then
        position_test_failures=$((position_test_failures + 1))
        printf 'FAILED_TEST %s\n' "$test_file"
    fi
done
printf 'TOTAL_FAILED_TESTS %s\n' "$position_test_failures"
```

Expected: 本功能相关测试全部通过；完整测试仅允许保留已确认的 `tests/SettingsStructure_test.lua:104` 动作条既有失败。

- [ ] **步骤 3：运行语法和差异检查**

```bash
luac -p Minimap/AddonFlyout.lua Minimap/Options.lua \
    tests/MinimapAddonFlyout_test.lua \
    tests/MinimapAddonFlyoutOptions_test.lua
git diff --check HEAD
git status --short -- \
    Minimap/AddonFlyout.lua Minimap/Options.lua \
    tests/MinimapAddonFlyout_test.lua \
    tests/MinimapAddonFlyoutOptions_test.lua
```

Expected: `luac` 和 `git diff --check` 退出码为 0；涉及文件已提交且状态为空。

- [ ] **步骤 4：核对需求**

逐项确认：

- 设置页按要求显示八个中文位置。
- 默认选择左中。
- 切换位置立即生效。
- 八个方向的入口锚点均位于小地图外侧 4 像素。
- 无效保存值回退到左中。
- 原有材质、统一尺寸、八列换行和关闭恢复行为不变。
