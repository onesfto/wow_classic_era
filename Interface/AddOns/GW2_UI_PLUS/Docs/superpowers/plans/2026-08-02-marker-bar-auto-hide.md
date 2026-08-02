# 标记条自动隐藏 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 为标记条提供无权限、无目标和单人状态下的独立自动隐藏开关。

**Architecture:** 在 `Toolbar.defaults.markerBar` 中保存三个默认开启的布尔配置；`MarkerBar.ShouldShow` 将组件启用状态与已启用的自动隐藏条件合并。设置页直接读写这些配置，继续通过 `MarkerBar.Refresh()` 走既有的非战斗显示刷新路径。

**Tech Stack:** WoW Classic Era Lua 5.1、现有 GW2_UI 设置控件、POSIX shell + Lua 回归脚本。

---

### Task 1: 为自动隐藏行为建立回归测试

**Files:**

- Create: `tests/marker_bar_auto_hide_regression.sh`

- [ ] **Step 1: 写入会失败的回归测试**

创建脚本，先检查三个配置项、设置项与重置项，并用最小 WoW API 替身加载真实 `Modules/Toolbar/MarkerBar.lua`，断言：默认单人隐藏、团队无权限隐藏、无目标隐藏、条件关闭后显示、团队队长且有目标时显示。测试核心断言如下：

```lua
assert(not bar.shown, "默认单人状态必须隐藏")
db.hideWhenSolo = false
Toolbar.markerBar.Refresh()
assert(bar.shown, "关闭单人隐藏后必须显示")
db.hideWhenSolo = true
inGroup, inRaid, hasTarget = true, true, false
Toolbar.markerBar.Refresh()
assert(not bar.shown, "默认无目标状态必须隐藏")
db.hideWhenNoTarget = false
Toolbar.markerBar.Refresh()
assert(bar.shown, "关闭无目标隐藏后必须显示")
db.hideWhenNoTarget = true
hasTarget = true
Toolbar.markerBar.Refresh()
assert(not bar.shown, "团队无权限时必须隐藏")
isLeader = true
Toolbar.markerBar.Refresh()
assert(bar.shown, "团队队长且有目标时必须显示")
```

脚本还须检查 `Options.lua` 出现三个中文选项和三个对应的 `SetHideWhen...` 调用，确保设置控件不会只停留在配置层。

- [ ] **Step 2: 运行测试，确认因功能尚未实现而失败**

Run: `sh tests/marker_bar_auto_hide_regression.sh`

Expected: 失败并指出缺少 `hideWhenNoPermission`、`hideWhenNoTarget` 或 `hideWhenSolo` 配置项。

- [ ] **Step 3: 提交测试基线**

```bash
git add tests/marker_bar_auto_hide_regression.sh
git commit -m "test: 覆盖标记条自动隐藏"
```

### Task 2: 实现配置与显示判定

**Files:**

- Modify: `Modules/Toolbar/Core.lua:30-35`
- Modify: `Modules/Toolbar/MarkerBar.lua:25-39,116-128`

- [ ] **Step 1: 在默认配置中加入三个默认开启的开关**

将 `markerBar` 默认配置扩展为：

```lua
markerBar = {
    enabled = false,
    scale = 1,
    hideBackground = false,
    hideWhenNoPermission = true,
    hideWhenNoTarget = true,
    hideWhenSolo = true,
},
```

- [ ] **Step 2: 让显示逻辑仅根据已启用条件隐藏**

在 `MarkerBar.lua` 添加以下判断，并在 `ApplyVisibility()` 使用它而非只检查 `db.enabled`：

```lua
local function ShouldShow()
    local db = Toolbar.InitDB().markerBar
    if not db.enabled then return false end
    if db.hideWhenSolo and not IsInGroup() then return false end
    if db.hideWhenNoTarget and not UnitExists("target") then return false end
    if db.hideWhenNoPermission and not HasPermission() then return false end
    return true
end
```

保留 `canUse` 对每个按钮的禁用、去色和透明度设置，避免关闭某项隐藏开关后失去不可用提示。

- [ ] **Step 3: 为每个新开关增加最小的设置方法**

```lua
function MarkerBar.SetHideWhenNoPermission(value)
    Toolbar.InitDB().markerBar.hideWhenNoPermission = value == true
    MarkerBar.Refresh()
end

function MarkerBar.SetHideWhenNoTarget(value)
    Toolbar.InitDB().markerBar.hideWhenNoTarget = value == true
    MarkerBar.Refresh()
end

function MarkerBar.SetHideWhenSolo(value)
    Toolbar.InitDB().markerBar.hideWhenSolo = value == true
    MarkerBar.Refresh()
end
```

- [ ] **Step 4: 运行新增回归测试，确认通过**

Run: `sh tests/marker_bar_auto_hide_regression.sh`

Expected: 输出 `标记条自动隐藏回归检查通过` 并以状态码 0 退出。

- [ ] **Step 5: 提交功能实现**

```bash
git add Modules/Toolbar/Core.lua Modules/Toolbar/MarkerBar.lua
git commit -m "feat: 标记条支持自动隐藏"
```

### Task 3: 增加设置页面控件并验证完整回归

**Files:**

- Modify: `Modules/Toolbar/Options.lua:361-382`
- Modify: `tests/toolbar_layout_regression.sh:206-217`

- [ ] **Step 1: 为三个开关增加设置控件**

在 `AddMarkerBarOptions(panel)` 中，按现有 `hideBackground` 选项的模式增加以下选项，使用对应 setter 与默认值：

```lua
local hideWhenNoPermission = panel:AddOption("无权限时隐藏", nil, {
    getter = function()
        return Toolbar.InitDB().markerBar.hideWhenNoPermission
    end,
    setter = function(value)
        Toolbar.markerBar.SetHideWhenNoPermission(value)
    end,
    getDefault = function()
        return Toolbar.defaults.markerBar.hideWhenNoPermission
    end,
})
SetInline(SetOptionName(
    hideWhenNoPermission, "GW2PlusToolbarMarkerBarHideWhenNoPermission"))
```

对“无目标时隐藏”和“单人时隐藏”使用同样结构与键名 `hideWhenNoTarget`、`hideWhenSolo`，并把三个选项与背景隐藏选项排为两行双列。把三个 option name 放入标记条的 `AddReset` 列表。

- [ ] **Step 2: 更新工具条布局测试的标记条选项计数**

将 `expectedColumns["标记条"]` 更新为：

```lua
["标记条"] = {false, false, 2, 2, 2, 2, 2, 2, 2},
```

并在其 Lua 断言中查找三个 option name，依次调用 setter 后断言 `Toolbar.InitDB().markerBar` 的对应值发生变化。

- [ ] **Step 3: 运行完整相关回归测试与 Lua 语法检查**

Run: `sh tests/marker_bar_auto_hide_regression.sh && sh tests/toolbar_layout_regression.sh && luac -p Modules/Toolbar/Core.lua Modules/Toolbar/MarkerBar.lua Modules/Toolbar/Options.lua`

Expected: 两个脚本均输出通过信息，`luac` 无输出且以状态码 0 退出。

- [ ] **Step 4: 审查精确改动范围**

Run: `git diff --check && git diff -- Modules/Toolbar/Core.lua Modules/Toolbar/MarkerBar.lua Modules/Toolbar/Options.lua tests/marker_bar_auto_hide_regression.sh tests/toolbar_layout_regression.sh`

Expected: 无空白错误；改动仅涉及标记条配置、显示判断、设置控件与对应测试。

- [ ] **Step 5: 提交设置与回归测试**

```bash
git add Modules/Toolbar/Options.lua tests/toolbar_layout_regression.sh tests/marker_bar_auto_hide_regression.sh
git commit -m "feat: 增加标记条自动隐藏设置"
```

