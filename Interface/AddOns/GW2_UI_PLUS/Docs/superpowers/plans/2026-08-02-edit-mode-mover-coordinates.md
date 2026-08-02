# 编辑模式移动坐标 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 在 HUD 编辑模式选中组件后，于“移动”标题实时显示当前锚点的整数 X、Y 偏移，未选中时保持原行为。

**Architecture:** 新增一个独立的设置模块，仅通过 GW2_UI 已公开的移动器和面板对象挂接刷新，不修改依赖插件。刷新函数负责无副作用地读取、校验、取整和更新标题；事件挂接负责选中、拖拽结束、按钮微调及 0.1 秒节流刷新。

**Tech Stack:** World of Warcraft Classic Era Lua 5.1、GW2_UI Frame API、POSIX shell 回归脚本。

---

### Task 1: 建立坐标标题回归检查

**Files:**
- Create: `tests/edit_mode_mover_coordinates_regression.sh`

- [ ] **Step 1: 写入会失败的回归测试**

创建可记录 `HookScript`、`SetText` 和 `GetPoint` 的最小 Frame mock，加载尚不存在的坐标模块，并验证以下行为：未选中时标题仍为“移动”；选中后立即显示 `移动  X: 13  Y: -8`；0.1 秒节流刷新坐标；无效坐标不覆盖标题。

```sh
#!/bin/sh
set -eu

lua - <<'LUA'
local function NewFrame()
    local frame = {scripts = {}}
    function frame:RegisterEvent() end
    function frame:SetScript(name, callback) self.scripts[name] = callback end
    function frame:HookScript(name, callback)
        local original = self.scripts[name]
        self.scripts[name] = function(...)
            if original then original(...) end
            callback(...)
        end
    end
    function frame:GetText() return self.text end
    function frame:SetText(text) self.text = text end
    return frame
end

CreateFrame = function() return NewFrame() end
NPE_MOVE = "移动"
unpack = unpack or table.unpack

local title = NewFrame()
title.text = "移动"
local movers = NewFrame()
movers.title = title
local options = {movers = movers, default = NewFrame()}
local settings = {options = options}
local container = {moverSettingsFrame = settings}

_G.GW2_ADDON = {
    MoveHudScaleableFrame = container,
    MOVABLE_FRAMES = {},
    RoundInt = function(value) return math.floor(value + 0.5) end,
}

local addonTable = {}
assert(loadfile("Modules/Settings/EditModeMoverCoordinates.lua"))(
    "GW2_UI_PLUS", addonTable)
addonTable.SetupEditModeMoverCoordinates()

assert(title.text == "移动", "未选中组件时不应改写标题")

local mover = NewFrame()
mover.point = {"CENTER", UIParent, "CENTER", 12.6, -8.2}
function mover:GetPoint() return unpack(self.point) end
settings.childMover = mover
_G.GW2_ADDON.MOVABLE_FRAMES[1] = mover
addonTable.SetupEditModeMoverCoordinates()
mover.scripts.OnClick(mover)
assert(title.text == "移动  X: 13  Y: -8")

mover.point[4], mover.point[5] = 20.2, 30.6
movers.scripts.OnUpdate(movers, 0.05)
assert(title.text == "移动  X: 13  Y: -8", "刷新必须节流")
movers.scripts.OnUpdate(movers, 0.05)
assert(title.text == "移动  X: 20  Y: 31")

mover.point[4] = nil
addonTable.UpdateEditModeMoverCoordinates()
assert(title.text == "移动  X: 20  Y: 31", "无效坐标不应覆盖标题")
LUA

printf '%s\n' '编辑模式移动坐标回归检查通过'
```

- [ ] **Step 2: 运行测试并确认它因模块不存在而失败**

Run: `sh tests/edit_mode_mover_coordinates_regression.sh`

Expected: FAIL，包含 `cannot open Modules/Settings/EditModeMoverCoordinates.lua`。

- [ ] **Step 3: 提交失败测试**

```bash
git add tests/edit_mode_mover_coordinates_regression.sh
git commit -m "test: 添加编辑模式移动坐标回归检查"
```

### Task 2: 实现实时坐标标题

**Files:**
- Create: `Modules/Settings/EditModeMoverCoordinates.lua`
- Modify: `GW2_UI_PLUS.toc:85`
- Test: `tests/edit_mode_mover_coordinates_regression.sh`

- [ ] **Step 1: 新增独立坐标增强模块**

```lua
local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local MOVE_LABEL = NPE_MOVE or "移动"
local REFRESH_INTERVAL = 0.1
local elapsedSinceRefresh = 0

local function GetCoordinateWidgets()
    local container = GW.MoveHudScaleableFrame
    local settings = container and container.moverSettingsFrame
    local options = settings and settings.options
    local movers = options and options.movers
    return settings, movers, movers and movers.title
end

local function UpdateEditModeMoverCoordinates()
    local settings, _, title = GetCoordinateWidgets()
    local mover = settings and settings.childMover
    if not mover or not title or not mover.GetPoint then return end

    local _, _, _, x, y = mover:GetPoint()
    if type(x) ~= "number" or type(y) ~= "number" then return end

    x = GW.RoundInt and GW.RoundInt(x) or math.floor(x + 0.5)
    y = GW.RoundInt and GW.RoundInt(y) or math.floor(y + 0.5)
    local text = string.format("%s  X: %d  Y: %d", MOVE_LABEL, x, y)
    if not title.GetText or title:GetText() ~= text then
        title:SetText(text)
    end
end

local function HookRefresh(target, scriptName, marker)
    if not target or not target.HookScript or target[marker] then return end
    target[marker] = true
    target:HookScript(scriptName, UpdateEditModeMoverCoordinates)
end

local function SetupEditModeMoverCoordinates()
    local settings, movers = GetCoordinateWidgets()
    if not settings or not movers then return end

    if not movers.gwPlusCoordinateUpdateHooked then
        movers.gwPlusCoordinateUpdateHooked = true
        movers:HookScript("OnUpdate", function(_, elapsed)
            if not settings.childMover then return end
            elapsedSinceRefresh = elapsedSinceRefresh + elapsed
            if elapsedSinceRefresh < REFRESH_INTERVAL then return end
            elapsedSinceRefresh = 0
            UpdateEditModeMoverCoordinates()
        end)
    end

    HookRefresh(settings.options.default, "OnClick",
        "gwPlusCoordinateClickHooked")
    for _, button in ipairs({movers.left, movers.right, movers.up, movers.down}) do
        HookRefresh(button, "OnClick", "gwPlusCoordinateClickHooked")
    end
    for _, mover in ipairs(GW.MOVABLE_FRAMES or {}) do
        HookRefresh(mover, "OnClick", "gwPlusCoordinateClickHooked")
        HookRefresh(mover, "OnDragStop", "gwPlusCoordinateDragHooked")
    end

    UpdateEditModeMoverCoordinates()
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    SetupEditModeMoverCoordinates()
end)

addonTable.UpdateEditModeMoverCoordinates = UpdateEditModeMoverCoordinates
addonTable.SetupEditModeMoverCoordinates = SetupEditModeMoverCoordinates
```

- [ ] **Step 2: 将模块加入 TOC**

在 `Modules/Settings/EditModeTab.lua` 后追加：

```toc
Modules/Settings/EditModeMoverCoordinates.lua
```

- [ ] **Step 3: 运行定向测试并确认通过**

Run: `sh tests/edit_mode_mover_coordinates_regression.sh`

Expected: PASS，输出 `编辑模式移动坐标回归检查通过`。

- [ ] **Step 4: 运行已有移动器回归检查**

Run: `sh tests/actionbar_mover_regression.sh`

Expected: PASS，输出 `动作条移动器回归检查通过`。

- [ ] **Step 5: 提交实现**

```bash
git add GW2_UI_PLUS.toc Modules/Settings/EditModeMoverCoordinates.lua
git commit -m "feat: 在编辑模式显示移动坐标"
```

### Task 3: 完整验证

**Files:**
- Verify: `Modules/Settings/EditModeMoverCoordinates.lua`
- Verify: `tests/edit_mode_mover_coordinates_regression.sh`

- [ ] **Step 1: 执行 Lua 语法检查**

Run: `luac -p Modules/Settings/EditModeMoverCoordinates.lua`

Expected: PASS，无输出。

- [ ] **Step 2: 执行全部项目回归脚本**

Run: `for test_file in tests/*_regression.sh; do sh "$test_file"; done`

Expected: 所有脚本退出码均为 0。

- [ ] **Step 3: 检查差异质量和作用域**

Run: `git diff --check HEAD^ -- GW2_UI_PLUS.toc Modules/Settings/EditModeMoverCoordinates.lua tests/edit_mode_mover_coordinates_regression.sh`

Expected: PASS，无空白错误；差异只包含坐标模块、TOC 注册与对应测试。
