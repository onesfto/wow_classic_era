-- GW2_UI 动作条换装刷新防抖
--
-- GW2_UI 每收到一次 PLAYER_EQUIPMENT_CHANGED 都会扫描 8×12 个动作按钮。
-- 更换整套装备时事件会按装备栏连续到达；这里在运行时接管该事件，等这一批事件
-- 静默 0.1 秒后只扫描一次。只改变事件处理频率，不修改 GW2_UI 源码。

local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW or not addonTable.PlusActionBar then return end
local AB = addonTable.PlusActionBar

local Equipment = {}
addonTable.PlusEquipmentDebounce = Equipment

local DEBOUNCE_TIME = 0.1
local RESTORE_INTERVAL = 0.1
local ACTION_BARS = {
    {barKey = "bar3", prefix = "MultiBarBottomRightButton"},
    {barKey = "bar2", prefix = "MultiBarBottomLeftButton"},
    {barKey = "bar4", prefix = "MultiBarRightButton"},
    {barKey = "bar5", prefix = "MultiBarLeftButton"},
    {barKey = "bar1", prefix = "ActionButton"},
    {barKey = "bar6", prefix = "MultiBar5Button"},
    {barKey = "bar7", prefix = "MultiBar6Button"},
    {barKey = "bar8", prefix = "MultiBar7Button"},
}

-- GW2_UI 的匿名动作条事件框体所注册的独特事件组合。
local EVENT_SIGNATURE = {
    "PLAYER_EQUIPMENT_CHANGED",
    "ACTION_RANGE_CHECK_UPDATE",
    "PLAYER_REGEN_ENABLED",
    "PLAYER_REGEN_DISABLED",
    "PLAYER_LEVEL_UP",
    "PLAYER_SPECIALIZATION_CHANGED",
}

local debounceTimer
local restoreTimer
local initialized = false
local pendingEventCount = 0
local hasSuspendedTargets = false
local pendingSuspendedCount = 0

local function RestoreNextTarget()
    restoreTimer = nil

    local fader = addonTable.PlusFader
    if fader and fader.RestoreNextSuspendedTarget and fader.RestoreNextSuspendedTarget() then
        restoreTimer = C_Timer.NewTimer(RESTORE_INTERVAL, RestoreNextTarget)
    end
end

local function IsActionBarEventFrame(frame)
    if not frame or not frame.IsEventRegistered or not frame.GetScript then return false end
    if frame.GetName and frame:GetName() then return false end
    if not frame:GetScript("OnEvent") then return false end

    for _, event in ipairs(EVENT_SIGNATURE) do
        if not frame:IsEventRegistered(event) then
            return false
        end
    end
    return true
end

local function FindActionBarEventFrame()
    local frame = EnumerateFrames()
    while frame do
        if IsActionBarEventFrame(frame) then
            return frame
        end
        frame = EnumerateFrames(frame)
    end
end

local function UpdateEquippedBorders()
    debounceTimer = nil
    local eventCount = pendingEventCount
    local suspendedCount = pendingSuspendedCount
    pendingEventCount = 0
    pendingSuspendedCount = 0

    for _, entry in ipairs(ACTION_BARS) do
        local active
        if AB.IsBarActive then
            active = AB.IsBarActive(entry.barKey)
        else
            active = not AB.IsBarShown or AB.IsBarShown(entry.barKey)
        end
        if active then
            for i = 1, 12 do
                local button = _G[entry.prefix .. i]
                if button and IsEquippedAction(button.action) then
                    local border = _G[entry.prefix .. i .. "Border"]
                    if border then
                        border:SetVertexColor(0, 1, 0, 1)
                    end
                end
            end
        end
    end

    local Notice = GW.Notice or function(message)
        DEFAULT_CHAT_FRAME:AddMessage(message)
    end
    Notice(("GW2_UI_PLUS：本次换装收到 PLAYER_EQUIPMENT_CHANGED × %d，实际动作条扫描 × 1，临时移出 × %d")
        :format(eventCount, suspendedCount))

    if hasSuspendedTargets then
        hasSuspendedTargets = false
        restoreTimer = C_Timer.NewTimer(RESTORE_INTERVAL, RestoreNextTarget)
    end
end

local function QueueEquipmentUpdate()
    pendingEventCount = pendingEventCount + 1

    if restoreTimer then
        restoreTimer:Cancel()
        restoreTimer = nil
    end

    local fader = addonTable.PlusFader
    if fader and fader.SuspendExtraTargets then
        local suspendedCount = fader.SuspendExtraTargets(3)
        if suspendedCount > 0 then
            hasSuspendedTargets = true
            pendingSuspendedCount = math.max(pendingSuspendedCount, suspendedCount)
        end
    end

    if debounceTimer then
        debounceTimer:Cancel()
    end
    debounceTimer = C_Timer.NewTimer(DEBOUNCE_TIME, UpdateEquippedBorders)
end

function Equipment.Init()
    if initialized then return true end

    local sourceFrame = FindActionBarEventFrame()
    if not sourceFrame then return false end

    sourceFrame:UnregisterEvent("PLAYER_EQUIPMENT_CHANGED")
    Equipment.sourceFrame = sourceFrame

    local eventFrame = CreateFrame("Frame", "GwPlusEquipmentDebounce")
    eventFrame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
    eventFrame:SetScript("OnEvent", QueueEquipmentUpdate)
    Equipment.eventFrame = eventFrame

    initialized = true
    return true
end
