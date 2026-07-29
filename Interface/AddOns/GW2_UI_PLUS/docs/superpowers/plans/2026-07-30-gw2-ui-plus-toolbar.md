# GW2_UI_PLUS 工具条实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 在“附加组件 → 工具条”中加入队伍管理、快捷条、标记条和性能条，并把四个运行框分别注册到 GW2_UI 编辑界面。

**Architecture:** `Toolbar/Core.lua` 统一管理默认值、存档、mover 和恢复默认，其余四个运行时模块互不直接依赖，只通过 `addonTable.Toolbar` 公共接口读取设置。`Toolbar/Options.lua` 只构建设置控件；运行时模块负责即时应用。PIG 仅作为行为参考，PLUS 不调用 PIG 全局对象、不读取或改写 PIG 存档。

**Tech Stack:** WoW Classic Era Lua 5.1、GW2_UI `GW.RegisterMovableFrame`、安全状态驱动和安全宏按钮、GW2_UI `GwSettingsPanelTmpl`、Lua 静态测试。

---

## 文件结构

- Create: `Toolbar/Core.lua` — 默认配置、存档补全、mover 注册、恢复默认、战斗队列和设置控件刷新。
- Create: `Toolbar/GroupManage.lua` — 接管 GW2_UI 队伍管理入口，仅在组队时显示。
- Create: `Toolbar/QuickBar.lua` — 八按钮快捷条、时间模式、倒计时菜单和读秒。
- Create: `Toolbar/MarkerBar.lua` — 八种目标标记与清除按钮。
- Create: `Toolbar/PerformanceBar.lua` — FPS、本地延迟和世界延迟。
- Create: `Toolbar/Options.lua` — “附加组件 → 工具条”单页四分组设置。
- Create: `tests/ToolbarRuntime_test.lua` — 默认值、运行模块、按钮清单、mover 和 Classic 限制。
- Create: `tests/ToolbarSettings_test.lua` — 设置结构、名称、依赖、TOC 和 `core.lua` 注册。
- Modify: `GW2_UI_PLUS.toc` — 按依赖顺序加载工具条文件。
- Modify: `core.lua` — 将“工具条”加入“附加组件”子页。
- Modify: `README.md` — 记录工具条功能和存档键。

## 固定名称与保存键

运行框名称：

```lua
local MOVER_NAMES = {
    groupManage = "队伍管理",
    quickBar = "快捷条",
    markerBar = "标记条",
    performanceBar = "性能条",
}
```

GW2_UI mover 保存键：

```lua
local MOVER_SETTINGS = {
    groupManage = "GW2PlusToolbarGroupManagePos",
    quickBar = "GW2PlusToolbarQuickBarPos",
    markerBar = "GW2PlusToolbarMarkerBarPos",
    performanceBar = "GW2PlusToolbarPerformanceBarPos",
}
```

默认坐标：

```lua
local MOVER_DEFAULTS = {
    groupManage = {
        point = "TOPLEFT", relativePoint = "TOPLEFT",
        xOfs = 1, yOfs = -60, hasMoved = false,
    },
    quickBar = {
        point = "TOP", relativePoint = "TOP",
        xOfs = 0, yOfs = -40, hasMoved = false,
    },
    markerBar = {
        point = "TOP", relativePoint = "TOP",
        xOfs = 0, yOfs = -70, hasMoved = false,
    },
    performanceBar = {
        point = "TOPRIGHT", relativePoint = "TOPRIGHT",
        xOfs = -20, yOfs = -20, hasMoved = false,
    },
}
```

---

### Task 1: 公共存档和 mover 基础

**Files:**
- Create: `Toolbar/Core.lua`
- Create: `tests/ToolbarRuntime_test.lua`
- Modify: `GW2_UI_PLUS.toc`

- [ ] **Step 1: 写入失败的默认值与 mover 静态测试**

创建 `tests/ToolbarRuntime_test.lua`：

```lua
local function Read(path)
    local file = assert(io.open(path, "r"))
    local source = file:read("*a")
    file:close()
    return source
end

local core = Read("Toolbar/Core.lua")
local toc = Read("GW2_UI_PLUS.toc")

for _, moduleName in ipairs({
    "groupManage", "quickBar", "markerBar", "performanceBar",
}) do
    assert(core:find(moduleName, 1, true),
        "公共默认值缺少模块：" .. moduleName)
end

assert(core:match(
        "groupManage%s*=%s*{%s*enabled%s*=%s*true"),
    "队伍管理必须默认启用")
for _, disabled in ipairs({"quickBar", "markerBar", "performanceBar"}) do
    assert(core:match(
            disabled .. "%s*=%s*{%s*enabled%s*=%s*false"),
        disabled .. " 必须默认关闭")
end

for _, moverName in ipairs({
    "队伍管理", "快捷条", "标记条", "性能条",
}) do
    assert(core:find('"' .. moverName .. '"', 1, true),
        "缺少 mover 名称：" .. moverName)
end

assert(core:find("GW.RegisterMovableFrame", 1, true),
    "公共模块必须统一注册 GW2_UI mover")
assert(core:find("GW.ToggleMover", 1, true),
    "模块启停必须同步 mover 可用状态")
assert(core:find("GW.globalDefault.profile", 1, true)
    and core:find("GW.settings", 1, true),
    "注册 mover 前必须补齐默认和当前配置")

local coreAt = assert(toc:find("Toolbar/Core.lua", 1, true))
local existingCoreAt = assert(toc:find("core.lua", 1, true))
assert(coreAt < existingCoreAt,
    "工具条公共模块必须在设置注册 core.lua 前加载")

print("ToolbarRuntime_test: OK")
```

- [ ] **Step 2: 运行测试并确认失败**

Run:

```bash
lua tests/ToolbarRuntime_test.lua
```

Expected: FAIL，错误为无法打开 `Toolbar/Core.lua`。

- [ ] **Step 3: 创建公共模块**

在 `Toolbar/Core.lua` 中实现：

```lua
local _, addonTable = ...
local GW = _G.GW2_ADDON

local Toolbar = {}
addonTable.Toolbar = Toolbar
_G.GW2Plus_Toolbar = Toolbar

Toolbar.defaults = {
    groupManage = { enabled = true, scale = 1 },
    quickBar = {
        enabled = false,
        scale = 1,
        buttons = {
            leave = true,
            teleport = true,
            convert = true,
            reset = true,
            timer = true,
            role = true,
            ready = true,
            countdown = true,
        },
        timerMode = "COMBAT",
        use24Hour = false,
        hideTimerBackground = false,
        countdownSeconds = 10,
        countdownVoice = true,
        voiceType = 0,
    },
    markerBar = {
        enabled = false,
        scale = 1,
        hideNoTarget = true,
        hideSolo = false,
        hideNoPermission = true,
    },
    performanceBar = {
        enabled = false,
        width = 210,
        height = 24,
        showFPS = true,
        showHome = true,
        showWorld = true,
    },
}

Toolbar.moverNames = {
    groupManage = "队伍管理",
    quickBar = "快捷条",
    markerBar = "标记条",
    performanceBar = "性能条",
}

Toolbar.moverSettings = {
    groupManage = "GW2PlusToolbarGroupManagePos",
    quickBar = "GW2PlusToolbarQuickBarPos",
    markerBar = "GW2PlusToolbarMarkerBarPos",
    performanceBar = "GW2PlusToolbarPerformanceBarPos",
}

Toolbar.moverDefaults = {
    groupManage = {
        point = "TOPLEFT", relativePoint = "TOPLEFT",
        xOfs = 1, yOfs = -60, hasMoved = false,
    },
    quickBar = {
        point = "TOP", relativePoint = "TOP",
        xOfs = 0, yOfs = -40, hasMoved = false,
    },
    markerBar = {
        point = "TOP", relativePoint = "TOP",
        xOfs = 0, yOfs = -70, hasMoved = false,
    },
    performanceBar = {
        point = "TOPRIGHT", relativePoint = "TOPRIGHT",
        xOfs = -20, yOfs = -20, hasMoved = false,
    },
}

local function MergeDefaults(target, defaults)
    for key, value in pairs(defaults) do
        if type(value) == "table" then
            if type(target[key]) ~= "table" then target[key] = {} end
            MergeDefaults(target[key], value)
        elseif target[key] == nil then
            target[key] = value
        end
    end
end

function Toolbar.InitDB()
    GW2_UI_PLUS_SV = GW2_UI_PLUS_SV or {}
    GW2_UI_PLUS_SV.Toolbar = GW2_UI_PLUS_SV.Toolbar or {}
    MergeDefaults(GW2_UI_PLUS_SV.Toolbar, Toolbar.defaults)
    Toolbar.db = GW2_UI_PLUS_SV.Toolbar
    return Toolbar.db
end

function Toolbar.EnsureMoverSetting(moduleKey)
    if not GW or not GW.settings then return false end
    local setting = Toolbar.moverSettings[moduleKey]
    local default = Toolbar.moverDefaults[moduleKey]
    if GW.globalDefault and GW.globalDefault.profile
        and not GW.globalDefault.profile[setting] then
        GW.globalDefault.profile[setting] = GW.CopyTable(default)
    end
    local saved = rawget(GW.settings, setting)
    if not saved then
        GW.settings[setting] = GW.CopyTable(default)
        saved = GW.settings[setting]
    end
    for key, value in pairs(default) do
        if saved[key] == nil then saved[key] = value end
    end
    return true
end

function Toolbar.RegisterMover(moduleKey, frame, tags)
    if not frame or frame.gwMover then return frame and frame.gwMover end
    if not Toolbar.EnsureMoverSetting(moduleKey) then return end
    GW.RegisterMovableFrame(
        frame,
        Toolbar.moverNames[moduleKey],
        Toolbar.moverSettings[moduleKey],
        tags or "Widgets",
        nil,
        {"default"})
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", frame.gwMover, "TOPLEFT")
    return frame.gwMover
end

function Toolbar.SetMoverEnabled(moduleKey, enabled)
    local module = Toolbar[moduleKey]
    local mover = module and module.frame and module.frame.gwMover
    if mover and GW.ToggleMover then
        GW.ToggleMover(mover, enabled)
    end
end

function Toolbar.ResetMover(moduleKey)
    local module = Toolbar[moduleKey]
    local frame = module and module.frame
    local mover = frame and frame.gwMover
    local default = Toolbar.moverDefaults[moduleKey]
    if not mover or not default then return end

    local function Apply()
        local setting = Toolbar.moverSettings[moduleKey]
        local saved = GW.settings[setting] or {}
        for key, value in pairs(default) do saved[key] = value end
        GW.settings[setting] = saved
        mover.savedPoint = GW.CopyTable(saved)
        mover:ClearAllPoints()
        mover:SetPoint(
            default.point, UIParent, default.relativePoint,
            default.xOfs, default.yOfs)
        frame.isMoved = false
        frame:SetAttribute("isMoved", false)
    end

    if InCombatLockdown() and GW.CombatQueue then
        GW.CombatQueue:Queue(
            "GW2PlusToolbarReset" .. moduleKey, Apply, {})
    else
        Apply()
    end
end

function Toolbar.RedrawSlider(optionName)
    local widget = GW.FindSettingsWidgetByOption
        and GW.FindSettingsWidgetByOption(optionName)
    if not widget or widget.optionType ~= "slider" or not widget.get then return end
    local value = widget.get()
    if widget.slider then widget.slider:SetValue(value) end
    if widget.inputFrame and widget.inputFrame.input then
        widget.inputFrame.input:SetText(string.format(
            "%." .. (widget.decimalNumbers or 0) .. "f", value))
    end
end

Toolbar.InitDB()
```

在 `GW2_UI_PLUS.toc` 的 `alaGearMan/alaGearMan.xml` 后加入：

```text
Toolbar/Core.lua
```

- [ ] **Step 4: 验证公共模块**

Run:

```bash
luac -p Toolbar/Core.lua tests/ToolbarRuntime_test.lua
lua tests/ToolbarRuntime_test.lua
```

Expected: 语法检查通过，测试输出 `ToolbarRuntime_test: OK`。

- [ ] **Step 5: 提交公共基础**

```bash
git add GW2_UI_PLUS.toc Toolbar/Core.lua tests/ToolbarRuntime_test.lua
git commit -m "功能：建立工具条公共配置与移动框"
```

---

### Task 2: 接管队伍管理

**Files:**
- Create: `Toolbar/GroupManage.lua`
- Modify: `tests/ToolbarRuntime_test.lua`
- Modify: `GW2_UI_PLUS.toc`

- [ ] **Step 1: 扩展失败测试**

在 `tests/ToolbarRuntime_test.lua` 末尾追加：

```lua
local groupManage = Read("Toolbar/GroupManage.lua")

assert(groupManage:find("GW.CreateRaidControlFrame", 1, true),
    "队伍管理应确保 GW2_UI 原框体已经创建")
assert(groupManage:find("GwManageGroupButton", 1, true)
    and groupManage:find("GwGroupManage", 1, true),
    "队伍管理必须接管入口按钮和面板")
assert(groupManage:find("RegisterStateDriver", 1, true)
    and groupManage:find("[group]", 1, true),
    "单人隐藏必须由安全组队状态驱动")
assert(groupManage:find(
        'Toolbar.RegisterMover("groupManage"', 1, true),
    "队伍管理必须注册独立 mover")
assert(groupManage:find("SetScale", 1, true),
    "队伍管理必须支持设置页缩放")
```

- [ ] **Step 2: 运行测试并确认失败**

Run:

```bash
lua tests/ToolbarRuntime_test.lua
```

Expected: FAIL，错误为无法打开 `Toolbar/GroupManage.lua`。

- [ ] **Step 3: 实现 holder、安全显隐和缩放**

`Toolbar/GroupManage.lua` 必须：

1. 在 `PLAYER_LOGIN` 后调用 `GW.CreateRaidControlFrame()`；该函数自身有重复创建保护。
2. 创建 `GwPlusToolbarGroupManageHolder`，尺寸 `262 × 320`。
3. 将 `GwManageGroupButton` 锚到 holder 左上角，将 `GwGroupManage` 锚到 holder 左上角 `62, 0`。
4. 将 holder 注册为“队伍管理” mover。
5. 创建 `SecureHandlerStateTemplate` 状态控制器，并设置入口按钮和面板为 frame ref。
6. 使用 `[group] grouped; solo` 自定义状态驱动。`solo` 时收起面板、重置双方 `state="closed"` 并隐藏入口；`grouped` 时仅显示入口，不自动展开面板。
7. 禁用设置时隐藏入口和面板，并通过 `Toolbar.SetMoverEnabled` 移除编辑界面 mover。
8. 缩放 holder；GW2_UI 的 `SetScale` hook 自动同步 mover。

模块初始化时必须先登记自身，供公共 mover 和配置档逻辑访问：

```lua
local GroupManage = {}
Toolbar.groupManage = GroupManage
```

安全状态片段使用：

```lua
controller:SetAttribute("_onstate-groupstate", [=[
    local button = self:GetFrameRef("GroupButton")
    local panel = self:GetFrameRef("GroupPanel")
    if newstate == "grouped" then
        button:Show()
    else
        panel:Hide()
        button:Hide()
        button:SetAttribute("state", "closed")
        panel:SetAttribute("state", "closed")
    end
]=])
RegisterStateDriver(
    controller, "groupstate", "[group] grouped; solo")
```

模块公开以下即时设置接口：

```lua
function GroupManage.SetEnabled(value)
function GroupManage.SetScale(value)
function GroupManage.Reset()
function GroupManage.Refresh()
```

`Reset()` 恢复 `enabled=true`、`scale=1` 和 mover 默认位置。

- [ ] **Step 4: 加入 TOC**

紧随 `Toolbar/Core.lua` 加入：

```text
Toolbar/GroupManage.lua
```

- [ ] **Step 5: 验证队伍管理**

Run:

```bash
luac -p Toolbar/GroupManage.lua
lua tests/ToolbarRuntime_test.lua
```

Expected: 全部通过。

- [ ] **Step 6: 提交队伍管理**

```bash
git add GW2_UI_PLUS.toc Toolbar/GroupManage.lua tests/ToolbarRuntime_test.lua
git commit -m "功能：接管并限制队伍管理显示"
```

---

### Task 3: 创建八按钮快捷条

**Files:**
- Create: `Toolbar/QuickBar.lua`
- Modify: `tests/ToolbarRuntime_test.lua`
- Modify: `GW2_UI_PLUS.toc`

- [ ] **Step 1: 扩展快捷条失败测试**

追加测试：

```lua
local quickBar = Read("Toolbar/QuickBar.lua")

for _, buttonKey in ipairs({
    "leave", "teleport", "convert", "reset",
    "timer", "role", "ready", "countdown",
}) do
    assert(quickBar:find(buttonKey, 1, true),
        "快捷条缺少按钮：" .. buttonKey)
end
assert(not quickBar:find("COMBATLOG", 1, true)
    and not quickBar:find("advancedCombatLogging", 1, true),
    "快捷条不得包含战斗记录")
assert(quickBar:find('Toolbar.RegisterMover("quickBar"', 1, true),
    "快捷条必须注册独立 mover")
assert(quickBar:find("MenuUtil.CreateContextMenu", 1, true),
    "倒计时预设必须使用当前客户端菜单 API")
```

- [ ] **Step 2: 运行测试并确认失败**

Run: `lua tests/ToolbarRuntime_test.lua`

Expected: FAIL，无法打开 `Toolbar/QuickBar.lua`。

- [ ] **Step 3: 实现按钮描述表和基础框体**

在 `Toolbar/QuickBar.lua` 中定义固定顺序：

```lua
local QuickBar = {}
Toolbar.quickBar = QuickBar

local BUTTON_ORDER = {
    "leave", "teleport", "convert", "reset",
    "timer", "role", "ready", "countdown",
}
```

每个按钮描述包含 `tooltip`、`texture`、`onClick` 和可选 `update`。按钮尺寸固定 `24 × 24`，间距 `3`，框体高度 `28`，宽度按当前启用按钮数量实时计算。

基础点击行为：

```lua
leave = function(_, mouseButton)
    if mouseButton == "RightButton" and ConfirmOrLeaveLFGParty then
        ConfirmOrLeaveLFGParty()
    elseif C_PartyInfo and C_PartyInfo.LeaveParty then
        C_PartyInfo.LeaveParty()
    else
        LeaveParty()
    end
end

teleport = function()
    if not IsAllowedToUserTeleport or not IsAllowedToUserTeleport() then return end
    if IsInLFGDungeon and IsInLFGDungeon() then
        LFGTeleport(true)
    else
        LFGTeleport(false)
    end
end

convert = function()
    if IsInRaid() then
        if C_PartyInfo and C_PartyInfo.ConvertToParty then
            C_PartyInfo.ConvertToParty()
        else
            ConvertToParty()
        end
    elseif IsInGroup() then
        if C_PartyInfo and C_PartyInfo.ConvertToRaid then
            C_PartyInfo.ConvertToRaid()
        else
            ConvertToRaid()
        end
    end
end

reset = function()
    StaticPopup_Show("CONFIRM_RESET_INSTANCES")
end

role = function()
    InitiateRolePoll()
end

ready = function()
    DoReadyCheck()
end
```

注册：

- `PLAYER_LOGIN`
- `PLAYER_ENTERING_WORLD`
- `GROUP_ROSTER_UPDATE`
- `PLAYER_ROLES_ASSIGNED`

刷新时：

- 单人状态禁用离队、转换、职责确认和就位确认。
- 不能传送时禁用进出副本。
- 非队长或助理时禁用职责确认、就位确认和倒计时。
- 转换按钮根据当前队伍类型切换图标和提示。

公开：

```lua
function QuickBar.SetEnabled(value)
function QuickBar.SetScale(value)
function QuickBar.SetButtonShown(buttonKey, value)
function QuickBar.Layout()
function QuickBar.Refresh()
function QuickBar.Reset()
```

- [ ] **Step 4: 实现基础样式和 mover**

- 使用 GW2_UI 深色半透明背景，不提供外观设置。
- frame 注册为“快捷条” mover。
- `SetEnabled` 同步实际显示和 `GW.ToggleMover`。
- `SetScale` 范围由设置页限制为 `0.6～2.0`。
- `Reset` 恢复默认启用状态、所有按钮显示、缩放和 mover 坐标。

- [ ] **Step 5: 加入 TOC 并验证**

在 `Toolbar/GroupManage.lua` 后加入：

```text
Toolbar/QuickBar.lua
```

Run:

```bash
luac -p Toolbar/QuickBar.lua
lua tests/ToolbarRuntime_test.lua
```

Expected: 通过。

- [ ] **Step 6: 提交快捷条基础**

```bash
git add GW2_UI_PLUS.toc Toolbar/QuickBar.lua tests/ToolbarRuntime_test.lua
git commit -m "功能：添加八按钮快捷条"
```

---

### Task 4: 完成时间、倒计时和读秒

**Files:**
- Modify: `Toolbar/QuickBar.lua`
- Modify: `tests/ToolbarRuntime_test.lua`

- [ ] **Step 1: 写时间和倒计时失败测试**

追加：

```lua
for _, timerMode in ipairs({"COMBAT", "CLOCK", "DYNAMIC"}) do
    assert(quickBar:find('"' .. timerMode .. '"', 1, true),
        "快捷条缺少时间模式：" .. timerMode)
end
for _, seconds in ipairs({3, 5, 10, 30, 60, 180, 300, 600}) do
    assert(quickBar:find(tostring(seconds), 1, true),
        "倒计时菜单缺少预设：" .. seconds)
end
assert(quickBar:find("C_VoiceChat.SpeakText", 1, true),
    "读秒必须使用客户端系统语音，不能依赖 PIG 音频")
assert(quickBar:find("C_TTSSettings.GetVoiceOptionID", 1, true),
    "读秒必须解析保存的系统语音类型")
```

- [ ] **Step 2: 运行测试并确认失败**

Run: `lua tests/ToolbarRuntime_test.lua`

Expected: FAIL，缺少时间模式或系统语音调用。

- [ ] **Step 3: 实现三种时间模式**

维护：

```lua
local loginStartedAt = GetServerTime()
local instanceStartedAt = GetServerTime()
local combatElapsed = 0
local inCombat = InCombatLockdown()
```

每 `0.1` 秒累积战斗时间，每秒更新文字。显示规则：

- `COMBAT`：始终显示本次战斗时长，脱战后停表，左键清零。
- `CLOCK`：显示 `GameTime_GetLocalTime()`。
- `DYNAMIC`：战斗中显示战斗时长，脱战显示当前时间。

监听 `PLAYER_REGEN_DISABLED`、`PLAYER_REGEN_ENABLED`、`PLAYER_ENTERING_WORLD`。提示追加本次登录时长和本次进本时长。

- [ ] **Step 4: 实现倒计时预设菜单**

左键调用：

```lua
local function StartCountdown(seconds)
    if C_PartyInfo and C_PartyInfo.DoCountdown then
        C_PartyInfo.DoCountdown(seconds)
    elseif DoCountdown then
        DoCountdown(seconds)
    end
end
```

右键：

```lua
MenuUtil.CreateContextMenu(button, function(_, rootDescription)
    rootDescription:SetTag("GW2_PLUS_TOOLBAR_COUNTDOWN")
    for _, seconds in ipairs({3, 5, 10, 30, 60, 180, 300, 600}) do
        rootDescription:CreateButton(
            Toolbar.FormatDuration(seconds),
            function() StartCountdown(seconds) end)
    end
end)
```

`Toolbar.FormatDuration` 对小于60秒显示“倒数N秒”，60秒及以上显示“倒数N分钟”。

- [ ] **Step 5: 实现系统语音读秒**

监听 `START_PLAYER_COUNTDOWN`，以 `TimerTrackerTimer1.time` 为真源；仅在整数5～1首次出现时播报。

```lua
local function SpeakCountdown(number)
    local db = Toolbar.InitDB().quickBar
    if not db.countdownVoice then return end
    if not C_TTSSettings or not C_VoiceChat then return end
    local voiceID = C_TTSSettings.GetVoiceOptionID(db.voiceType or 0)
    if not voiceID then return end
    C_VoiceChat.SpeakText(
        voiceID, tostring(number), 2, 100, true)
end
```

保存 `voiceType=0` 或 `1`；若备用语音不可用，设置页只提供主语音。试听按钮调用 `SpeakCountdown(5)`。

- [ ] **Step 6: 验证并提交**

Run:

```bash
luac -p Toolbar/QuickBar.lua
lua tests/ToolbarRuntime_test.lua
```

Expected: 通过。

```bash
git add Toolbar/QuickBar.lua tests/ToolbarRuntime_test.lua
git commit -m "功能：补全快捷条计时与倒计时"
```

---

### Task 5: 创建 Classic 目标标记条

**Files:**
- Create: `Toolbar/MarkerBar.lua`
- Modify: `tests/ToolbarRuntime_test.lua`
- Modify: `GW2_UI_PLUS.toc`

- [ ] **Step 1: 写标记条失败测试**

追加：

```lua
local markerBar = Read("Toolbar/MarkerBar.lua")

assert(markerBar:find("SecureActionButtonTemplate", 1, true),
    "经典标记按钮必须使用安全动作按钮")
assert(markerBar:find('"/tm " .. info.index', 1, true),
    "标记条必须按描述表生成 /tm 0～8 安全宏")
for _, label in ipairs({
    "骷髅", "十字", "方块", "月亮", "三角",
    "菱形", "圆圈", "星星", "清除标记",
}) do
    assert(markerBar:find('label = "' .. label .. '"', 1, true),
        "标记条缺少按钮：" .. label)
end
assert(not markerBar:find("worldmarker", 1, true)
    and not markerBar:find("PlaceRaidMarker", 1, true),
    "Classic Era 标记条不得创建地面标记")
for _, option in ipairs({
    "hideNoTarget", "hideSolo", "hideNoPermission",
}) do
    assert(markerBar:find(option, 1, true),
        "标记条缺少显隐规则：" .. option)
end
assert(markerBar:find('Toolbar.RegisterMover("markerBar"', 1, true),
    "标记条必须注册独立 mover")
```

- [ ] **Step 2: 运行并确认失败**

Run: `lua tests/ToolbarRuntime_test.lua`

Expected: FAIL，无法打开 `Toolbar/MarkerBar.lua`。

- [ ] **Step 3: 实现九个安全宏按钮**

创建 `GwPlusToolbarMarkerBar`，按钮顺序为标记8到1，最后为0：

```lua
local MarkerBar = {}
Toolbar.markerBar = MarkerBar

local MARKERS = {
    {index = 8, label = "骷髅"},
    {index = 7, label = "十字"},
    {index = 6, label = "方块"},
    {index = 5, label = "月亮"},
    {index = 4, label = "三角"},
    {index = 3, label = "菱形"},
    {index = 2, label = "圆圈"},
    {index = 1, label = "星星"},
    {index = 0, label = "清除标记"},
}
```

每个按钮：

```lua
local button = CreateFrame(
    "Button", nil, frame, "SecureActionButtonTemplate")
button:RegisterForClicks("AnyUp", "AnyDown")
button:SetAttribute("type", "macro")
button:SetAttribute("macrotext", "/tm " .. info.index)
```

1～8使用 `Interface/TargetingFrame/UI-RaidTargetingIcons` 纹理坐标；0使用 `Interface/Buttons/UI-GroupLoot-Pass-Up`。

- [ ] **Step 4: 实现自动显隐**

根据 `hideNoTarget` 和 `hideSolo` 构建状态驱动：

```lua
local function BuildVisibilityDriver(db)
    if db.hideNoTarget and db.hideSolo then
        return "[group,@target,exists] show; hide"
    elseif db.hideNoTarget then
        return "[@target,exists] show; hide"
    elseif db.hideSolo then
        return "[group] show; hide"
    end
    return "show"
end
```

`hideNoPermission` 通过 `UnitIsGroupLeader("player")`、`UnitIsGroupAssistant("player")` 和非团队小队状态计算。权限变化发生在战斗中时，将重新注册驱动排入 `GW.CombatQueue`，不直接修改受保护框体。

监听：

- `PLAYER_LOGIN`
- `GROUP_ROSTER_UPDATE`
- `RAID_ROSTER_UPDATE`
- `PLAYER_TARGET_CHANGED`
- `RAID_TARGET_UPDATE`
- `PLAYER_REGEN_ENABLED`

公开启用、缩放、三项显隐设置、刷新和恢复默认接口。

- [ ] **Step 5: 加入 TOC、验证和提交**

在 `Toolbar/QuickBar.lua` 后加入：

```text
Toolbar/MarkerBar.lua
```

Run:

```bash
luac -p Toolbar/MarkerBar.lua
lua tests/ToolbarRuntime_test.lua
```

Expected: 通过。

```bash
git add GW2_UI_PLUS.toc Toolbar/MarkerBar.lua tests/ToolbarRuntime_test.lua
git commit -m "功能：添加经典目标标记条"
```

---

### Task 6: 创建可调宽高的性能条

**Files:**
- Create: `Toolbar/PerformanceBar.lua`
- Modify: `tests/ToolbarRuntime_test.lua`
- Modify: `GW2_UI_PLUS.toc`

- [ ] **Step 1: 写性能条失败测试**

追加：

```lua
local performanceBar = Read("Toolbar/PerformanceBar.lua")

for _, key in ipairs({"showFPS", "showHome", "showWorld"}) do
    assert(performanceBar:find(key, 1, true),
        "性能条缺少项目：" .. key)
end
assert(performanceBar:find("GetFramerate", 1, true),
    "性能条必须读取 FPS")
assert(performanceBar:find("GetNetStats", 1, true),
    "性能条必须读取本地和世界延迟")
assert(performanceBar:find("SetSize", 1, true),
    "性能条必须即时应用宽高")
assert(not performanceBar:find("SetScale", 1, true),
    "性能条不得提供缩放")
assert(performanceBar:find(
        'Toolbar.RegisterMover("performanceBar"', 1, true),
    "性能条必须注册独立 mover")
```

- [ ] **Step 2: 运行并确认失败**

Run: `lua tests/ToolbarRuntime_test.lua`

Expected: FAIL，无法打开 `Toolbar/PerformanceBar.lua`。

- [ ] **Step 3: 实现数据刷新和等宽布局**

创建三个 FontString 单元：

```lua
local PerformanceBar = {}
Toolbar.performanceBar = PerformanceBar

local CELLS = {
    {key = "showFPS", label = "FPS"},
    {key = "showHome", label = "本地"},
    {key = "showWorld", label = "世界"},
}
```

每0.25秒：

```lua
local _, _, homeLatency, worldLatency = GetNetStats()
fpsText:SetFormattedText("FPS: %.0f", GetFramerate())
homeText:SetFormattedText("本地: %d", homeLatency)
worldText:SetFormattedText("世界: %d", worldLatency)
```

布局时：

1. 收集当前启用单元。
2. 保证至少一个启用；试图关闭最后一项时返回 `false`。
3. `cellWidth = db.width / enabledCount`。
4. 各单元水平等宽排列。
5. `frame:SetSize(db.width, db.height)`；GW2_UI hook 自动同步 mover 尺寸。
6. 模块关闭时移除 `OnUpdate`，开启时恢复。

公开：

```lua
function PerformanceBar.SetEnabled(value)
function PerformanceBar.SetItemShown(key, value) -- 返回是否接受
function PerformanceBar.SetWidth(value)
function PerformanceBar.SetHeight(value)
function PerformanceBar.Layout()
function PerformanceBar.Reset()
```

- [ ] **Step 4: 加入 TOC、验证和提交**

在 `Toolbar/MarkerBar.lua` 后加入：

```text
Toolbar/PerformanceBar.lua
```

Run:

```bash
luac -p Toolbar/PerformanceBar.lua
lua tests/ToolbarRuntime_test.lua
```

Expected: 通过。

```bash
git add GW2_UI_PLUS.toc Toolbar/PerformanceBar.lua tests/ToolbarRuntime_test.lua
git commit -m "功能：添加可调宽高性能条"
```

---

### Task 7: 构建“附加组件 → 工具条”设置页

**Files:**
- Create: `Toolbar/Options.lua`
- Create: `tests/ToolbarSettings_test.lua`
- Modify: `GW2_UI_PLUS.toc`
- Modify: `core.lua`

- [ ] **Step 1: 写设置结构失败测试**

创建 `tests/ToolbarSettings_test.lua`：

```lua
local function Read(path)
    local file = assert(io.open(path, "r"))
    local source = file:read("*a")
    file:close()
    return source
end

local options = Read("Toolbar/Options.lua")
local core = Read("core.lua")
local toc = Read("GW2_UI_PLUS.toc")

assert(options:find("BuildToolbarPanel", 1, true),
    "设置模块必须导出工具条面板构建函数")
for _, groupName in ipairs({
    "队伍管理", "快捷条", "标记条", "性能条",
}) do
    assert(options:find('AddGroupHeader("' .. groupName .. '")', 1, true),
        "工具条页面缺少分组：" .. groupName)
end
assert(core:find("BuildToolbarPanel", 1, true)
    and core:find('name = "工具条"', 1, true),
    "附加组件分类必须注册工具条页面")

local _, lockCount = options:gsub('"锁定"', "")
assert(lockCount == 0, "四个模块都不得提供锁定选项")

local performanceSection = options:match(
    'AddGroupHeader%("性能条"%)%s*(.-)%s*return panel')
assert(performanceSection
    and performanceSection:find('"宽度"', 1, true)
    and performanceSection:find('"高度"', 1, true),
    "性能条必须提供宽度和高度")
assert(not performanceSection:find('"缩放"', 1, true),
    "性能条不得提供缩放")

assert(not options:find("战斗记录", 1, true),
    "快捷条设置不得出现战斗记录")
for _, optionName in ipairs({
    "GW2PlusToolbarGroupManageEnable",
    "GW2PlusToolbarQuickBarEnable",
    "GW2PlusToolbarMarkerBarEnable",
    "GW2PlusToolbarPerformanceBarEnable",
}) do
    assert(options:find(optionName, 1, true),
        "缺少稳定设置名：" .. optionName)
end

local runtimeAt = assert(toc:find("Toolbar/PerformanceBar.lua", 1, true))
local optionsAt = assert(toc:find("Toolbar/Options.lua", 1, true))
local coreAt = assert(toc:find("core.lua", 1, true))
assert(runtimeAt < optionsAt and optionsAt < coreAt,
    "TOC 必须先加载运行时，再加载设置页和核心注册")

print("ToolbarSettings_test: OK")
```

- [ ] **Step 2: 运行并确认失败**

Run:

```bash
lua tests/ToolbarSettings_test.lua
```

Expected: FAIL，无法打开 `Toolbar/Options.lua`。

- [ ] **Step 3: 创建单页四分组设置**

`Toolbar/Options.lua` 创建 panel：

```lua
local panel = CreateFrame(
    "Frame", nil, parent, "GwSettingsPanelTmpl")
panel.panelId = "gw2_ui_plus_toolbar"
panel.header:SetText("附加组件")
panel.breadcrumb:SetText("工具条")
panel.sub:SetText("队伍管理、快捷功能、目标标记与性能信息")
```

四组设置：

**队伍管理**

- 启用：默认 `true`，调用 `GroupManage.SetEnabled`。
- 缩放：`0.6～2.0`，步长 `0.01`。
- 恢复默认：调用 `GroupManage.Reset` 并刷新缩放控件。

**快捷条**

- 启用：默认 `false`。
- 八个按钮开关；不创建战斗记录开关。
- 缩放：`0.6～2.0`。
- 时间模式下拉：战斗计时、当前时间、动态。
- 24小时制。
- 隐藏计时背景。
- 默认倒数：`3～180`秒。
- 启用读秒。
- 系统语音下拉：主语音；检测到 `GetVoiceOptionID(1)` 时追加备用语音。
- 试听按钮。
- 恢复默认。

**标记条**

- 启用：默认 `false`。
- 缩放：`0.6～2.0`。
- 无目标隐藏。
- 单人隐藏。
- 无权限隐藏。
- 恢复默认。

**性能条**

- 启用：默认 `false`。
- FPS、本地延迟、世界延迟三个开关。
- 宽度：`120～600`，步长1。
- 高度：`18～60`，步长1。
- 恢复默认。
- `SetItemShown` 拒绝关闭最后一项时，调用设置 widget 的 `SetChecked(true)` 恢复界面。

所有从属项使用稳定 `optionName` 和 `dependence`。恢复默认按钮使用 `isNegativeButton=true`，并通过 `Toolbar.RedrawSlider` 刷新滑块。

- [ ] **Step 4: 注册设置页**

在 `GW2_UI_PLUS.toc` 中，运行时模块之后、`core.lua` 之前加入：

```text
Toolbar/Options.lua
```

在 `core.lua` 的 `subPanels` 注册区加入：

```lua
if addonTable.BuildToolbarPanel then
    local toolbarFrame = addonTable.BuildToolbarPanel(p)
    table.insert(subPanels, {
        name = "工具条",
        frame = toolbarFrame,
        icon = "Interface\\Icons\\INV_Misc_EngGizmos_27",
    })
end
```

只注册一个“工具条”子页；四个名称是页内分组，不能伪造 GW2_UI 不支持的三级菜单。

- [ ] **Step 5: 验证设置页**

Run:

```bash
luac -p Toolbar/Options.lua tests/ToolbarSettings_test.lua
lua tests/ToolbarSettings_test.lua
lua tests/ToolbarRuntime_test.lua
```

Expected: 全部通过。

- [ ] **Step 6: 提交设置页**

```bash
git add GW2_UI_PLUS.toc core.lua Toolbar/Options.lua \
    tests/ToolbarSettings_test.lua
git commit -m "设置：添加附加组件工具条页面"
```

---

### Task 8: 配置档切换、恢复默认和最终验证

**Files:**
- Modify: `Toolbar/Core.lua`
- Modify: `Toolbar/GroupManage.lua`
- Modify: `Toolbar/QuickBar.lua`
- Modify: `Toolbar/MarkerBar.lua`
- Modify: `Toolbar/PerformanceBar.lua`
- Modify: `tests/ToolbarRuntime_test.lua`
- Modify: `README.md`

- [ ] **Step 1: 写配置档刷新失败测试**

追加：

```lua
assert(core:find("OnProfileChanged", 1, true),
    "工具条 mover 必须处理 GW2_UI 配置档切换")
assert(core:find("mover.savedPoint", 1, true)
    and core:find("GW.settings[setting]", 1, true),
    "配置档切换后必须重新绑定 mover 保存表")
assert(core:find("RefreshAll", 1, true),
    "公共模块必须提供四模块统一刷新入口")
```

- [ ] **Step 2: 运行并确认失败**

Run: `lua tests/ToolbarRuntime_test.lua`

Expected: FAIL，缺少配置档切换或统一刷新逻辑。

- [ ] **Step 3: 实现配置档切换同步**

在 `Toolbar/Core.lua` 增加：

```lua
function Toolbar.RebindMover(moduleKey)
    local module = Toolbar[moduleKey]
    local mover = module and module.frame and module.frame.gwMover
    if not mover or not Toolbar.EnsureMoverSetting(moduleKey) then return end
    local setting = Toolbar.moverSettings[moduleKey]
    local point = GW.settings[setting]
    mover.savedPoint = point
    mover:ClearAllPoints()
    mover:SetPoint(
        point.point, UIParent, point.relativePoint,
        point.xOfs, point.yOfs)
end

function Toolbar.RefreshAll()
    for _, moduleKey in ipairs({
        "groupManage", "quickBar", "markerBar", "performanceBar",
    }) do
        Toolbar.RebindMover(moduleKey)
        local module = Toolbar[moduleKey]
        if module and module.Refresh then module.Refresh() end
    end
end
```

使用：

```lua
if GW.globalSettings and GW.globalSettings.RegisterCallback then
    GW.globalSettings.RegisterCallback(
        Toolbar, "OnProfileChanged", Toolbar.RefreshAll)
end
```

确保 `InitDB()` 不覆盖已有字段；四模块 `Refresh()` 从当前 DB 重新应用启用、尺寸和缩放。

- [ ] **Step 4: 更新 README**

在设置面板树中加入：

```text
附加组件
└── 工具条
    ├── 队伍管理
    ├── 快捷条
    ├── 标记条
    └── 性能条
```

记录：

- 默认只有队伍管理启用。
- 四个模块位置在编辑界面调整。
- 队伍管理单人隐藏。
- 快捷条没有战斗记录按钮。
- 标记条仅为 Classic 目标标记。
- 性能条使用宽度和高度，不使用缩放。
- 配置存于 `GW2_UI_PLUS_SV.Toolbar`，位置存于四个 `GW.settings` mover 键。

- [ ] **Step 5: 运行静态全量验证**

Run:

```bash
luac -p Toolbar/Core.lua Toolbar/GroupManage.lua \
    Toolbar/QuickBar.lua Toolbar/MarkerBar.lua \
    Toolbar/PerformanceBar.lua Toolbar/Options.lua \
    tests/ToolbarRuntime_test.lua tests/ToolbarSettings_test.lua
lua tests/ToolbarRuntime_test.lua
lua tests/ToolbarSettings_test.lua
for test_file in tests/*_test.lua; do
    lua "$test_file" || exit 1
done
```

Expected: 语法检查和全部测试通过。

- [ ] **Step 6: 游戏内验收**

在 Classic Era 中逐项验证：

1. 单人登录：队伍管理按钮不显示。
2. 打开编辑界面：启用的模块 mover 可见且可保存、取消、恢复默认。
3. 加入小队：队伍管理入口出现，邀请、离队、标记、职责、就位、倒计时和转换按钮按权限工作。
4. 离开小队：队伍管理立即收起并隐藏。
5. 启用快捷条：八个按钮均存在，没有战斗记录。
6. 快捷条时间三模式、左键重置、右键时间入口工作。
7. 倒计时左键默认秒数、右键八种预设和最后五秒读秒工作。
8. 启用标记条：八种目标标记和清除按钮工作；三项自动隐藏分别生效。
9. 启用性能条：FPS、本地延迟、世界延迟刷新；关闭最后一项被拒绝；宽高即时生效。
10. 三个缩放模块缩放后 mover 尺寸一致；性能条 mover 随宽高一致。
11. 切换 GW2_UI 配置档后四个 mover 读取新配置位置。
12. 禁用 PIG 后功能无报错；启用 PIG 时 PLUS 不改写 `PIGA`。
13. 战斗中加入/离开队伍、切换标记显隐设置，不出现受保护操作错误。

- [ ] **Step 7: 检查改动边界**

Run:

```bash
git status --short -- GW2_UI_PLUS.toc core.lua Toolbar tests \
    README.md docs/superpowers
git diff --check
git diff --stat HEAD~7 -- GW2_UI_PLUS.toc core.lua Toolbar tests README.md
```

Expected: 只出现本计划涉及的文件，无 PIG、WTF 或其他插件改动。

- [ ] **Step 8: 提交最终联调**

```bash
git add Toolbar/Core.lua Toolbar/GroupManage.lua Toolbar/QuickBar.lua \
    Toolbar/MarkerBar.lua Toolbar/PerformanceBar.lua \
    tests/ToolbarRuntime_test.lua README.md
git commit -m "完善：同步工具条配置档与运行状态"
```
