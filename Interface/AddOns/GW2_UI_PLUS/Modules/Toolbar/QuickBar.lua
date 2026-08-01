local _, addonTable = ...
local Toolbar = addonTable.Toolbar
if not Toolbar then return end
local QuickBar = {}
Toolbar.quickBar = QuickBar
local BUTTON_SIZE = 24
local BUTTON_GAP = 3
local BAR_PADDING = 3
local BUTTON_ORDER = {
    "leave",
    "teleport",
    "convert",
    "reset",
    "timer",
    "role",
    "ready",
    "countdown",
}
local ICONS = {
    leave = "Interface/Buttons/UI-GroupLoot-Pass-Up",
    teleport = "Interface/Icons/Spell_Arcane_TeleportStormWind",
    convert = "Interface/Icons/INV_Misc_GroupLooking",
    reset = "Interface/Icons/Spell_Holy_Resurrection",
    timer = "Interface/Icons/INV_Misc_PocketWatch_01",
    role = 136815,
    ready = 136814,
    countdown = 516773,
}
local TOOLTIPS = {
    leave = "左键：离开队伍\n右键：离开随机副本队伍",
    teleport = "进入或离开随机副本",
    convert = "小队与团队互相转换",
    reset = "重置所有副本",
    timer = "左键：重置战斗计时\n右键：打开时间设置",
    role = "发起职责确认",
    ready = "发起就位确认",
    countdown = "左键：按默认时长倒计时\n右键：选择倒计时时长",
}
local PRESET_SECONDS = {3, 5, 10, 30, 60, 180, 300, 600}
local loginStartedAt = GetServerTime()
local instanceStartedAt = GetServerTime()
local combatElapsed = 0
local inCombat = InCombatLockdown and InCombatLockdown() or false
local updateElapsed = 0
local function IsGroupController()
    return UnitIsGroupLeader("player")
        or UnitIsGroupAssistant("player")
        or (IsInGroup() and not IsInRaid())
end
local function SetButtonEnabled(button, enabled)
    button:SetEnabled(enabled)
    button.icon:SetDesaturated(not enabled)
    button:SetAlpha(enabled and 1 or 0.45)
end
local function FormatElapsed(seconds)
    seconds = math.max(0, math.floor(seconds or 0))
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor(seconds / 60) % 60
    local remain = seconds % 60
    if hours > 0 then
        return string.format("%02d:%02d:%02d", hours, minutes, remain)
    end
    return string.format("%02d:%02d", minutes, remain)
end
local function StartCountdown(seconds)
    if C_PartyInfo and C_PartyInfo.DoCountdown then
        C_PartyInfo.DoCountdown(seconds)
    elseif _G.DoCountdown then
        _G.DoCountdown(seconds)
    end
end
QuickBar.StartCountdown = StartCountdown
local function LeaveGroup(mouseButton)
    if mouseButton == "RightButton" and ConfirmOrLeaveLFGParty then
        ConfirmOrLeaveLFGParty()
    elseif C_PartyInfo and C_PartyInfo.LeaveParty then
        C_PartyInfo.LeaveParty()
    elseif _G.LeaveParty then
        _G.LeaveParty()
    end
end
local function TeleportDungeon()
    if not IsAllowedToUserTeleport or not IsAllowedToUserTeleport() then return end
    if IsInLFDBattlefield and IsInLFDBattlefield() then
        local _, instanceType = IsInInstance()
        if instanceType ~= "arena" and instanceType ~= "pvp" then
            LFGTeleport(false)
        end
    elseif IsInLFGDungeon and IsInLFGDungeon() then
        LFGTeleport(true)
    else
        LFGTeleport(false)
    end
end
local function ConvertGroup()
    if IsInRaid() then
        if C_PartyInfo and C_PartyInfo.ConvertToParty then
            C_PartyInfo.ConvertToParty()
        elseif _G.ConvertToParty then
            _G.ConvertToParty()
        end
    elseif IsInGroup() then
        if C_PartyInfo and C_PartyInfo.ConvertToRaid then
            C_PartyInfo.ConvertToRaid()
        elseif _G.ConvertToRaid then
            _G.ConvertToRaid()
        end
    end
end
local function UpdateTimerText()
    local button = QuickBar.buttons and QuickBar.buttons.timer
    if not button or not button.timerText then return end
    local mode = Toolbar.InitDB().quickBar.timerMode
    if mode == "CLOCK" or (mode == "DYNAMIC" and not inCombat) then
        button.timerText:SetText(GameTime_GetLocalTime())
        button.timerText:SetTextColor(0.3, 1, 0.45)
    else
        button.timerText:SetText(FormatElapsed(combatElapsed))
        button.timerText:SetTextColor(
            inCombat and 1 or 0.3,
            inCombat and 0.85 or 1,
            0.2)
    end
end
local function ResetCombatTimer()
    combatElapsed = 0
    UpdateTimerText()
end
local function OpenTimeManager()
    if TimeManagerClockButton_OnClick and TimeManagerClockButton then
        TimeManagerClockButton_OnClick(TimeManagerClockButton)
    elseif ToggleTimeManager then
        ToggleTimeManager()
    end
end
local function SpeakCountdown(number)
    local db = Toolbar.InitDB().quickBar
    if not db.countdownVoice
        or not C_TTSSettings
        or not C_TTSSettings.GetVoiceOptionID
        or not C_VoiceChat
        or not C_VoiceChat.SpeakText then
        return
    end
    local voiceID = C_TTSSettings.GetVoiceOptionID(db.voiceType or 0)
    if not voiceID then return end
    pcall(
        C_VoiceChat.SpeakText,
        voiceID,
        tostring(number),
        2,
        100,
        true)
end
QuickBar.SpeakCountdown = SpeakCountdown
local function ShowCountdownMenu(button)
    if not MenuUtil or not MenuUtil.CreateContextMenu then return end
    MenuUtil.CreateContextMenu(button, function(_, rootDescription)
        rootDescription:SetTag("GW2_PLUS_TOOLBAR_COUNTDOWN")
        for _, seconds in ipairs(PRESET_SECONDS) do
            local presetSeconds = seconds
            rootDescription:CreateButton(
                Toolbar.FormatDuration(presetSeconds),
                function() StartCountdown(presetSeconds) end)
        end
    end)
end
local function HandleButtonClick(key, mouseButton)
    if key == "leave" then
        LeaveGroup(mouseButton)
    elseif key == "teleport" then
        TeleportDungeon()
    elseif key == "convert" then
        ConvertGroup()
    elseif key == "reset" then
        StaticPopup_Show("CONFIRM_RESET_INSTANCES")
    elseif key == "timer" then
        if mouseButton == "RightButton" then
            OpenTimeManager()
        else
            ResetCombatTimer()
        end
    elseif key == "role" then
        InitiateRolePoll()
    elseif key == "ready" then
        DoReadyCheck()
    elseif key == "countdown" then
        if mouseButton == "RightButton" then
            ShowCountdownMenu(QuickBar.buttons.countdown)
        else
            StartCountdown(Toolbar.InitDB().quickBar.countdownSeconds)
        end
    end
end
local function TimerTooltip(tooltip)
    tooltip:AddLine("本次登录：" .. FormatElapsed(
        GetServerTime() - loginStartedAt), 0.8, 0.8, 0.8)
    if IsInInstance() then
        tooltip:AddLine("本次进本：" .. FormatElapsed(
            GetServerTime() - instanceStartedAt), 0.8, 0.8, 0.8)
    end
end
local function CreateButton(key)
    local button = Toolbar.CreateIconButton(QuickBar.frame, BUTTON_SIZE)
    button.key = key
    button.tooltip = TOOLTIPS[key]
    button.icon:SetTexture(ICONS[key])
    button:SetScript("OnClick", function(_, mouseButton)
        HandleButtonClick(key, mouseButton)
    end)
    if key == "timer" then
        button.timerText = button:CreateFontString(nil, "OVERLAY")
        button.timerText:SetFont(
            UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 9, "OUTLINE")
        button.timerText:SetPoint("CENTER", 0, 0)
        button.icon:SetAlpha(0.18)
        button.tooltipExtra = TimerTooltip
    end
    return button
end
local function EnsureFrame()
    if QuickBar.frame then return true end
    local frame = Toolbar.CreateBarFrame(
        "GwPlusToolbarQuickBar",
        BAR_PADDING * 2 + #BUTTON_ORDER * BUTTON_SIZE
            + (#BUTTON_ORDER - 1) * BUTTON_GAP,
        BUTTON_SIZE + BAR_PADDING * 2)
    QuickBar.frame = frame
    QuickBar.buttons = {}
    for _, key in ipairs(BUTTON_ORDER) do
        QuickBar.buttons[key] = CreateButton(key)
    end
    Toolbar.RegisterMover("quickBar", frame, "Group,Widgets")
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")
    frame:RegisterEvent("GROUP_ROSTER_UPDATE")
    frame:RegisterEvent("PLAYER_REGEN_DISABLED")
    frame:RegisterEvent("PLAYER_REGEN_ENABLED")
    frame:RegisterEvent("START_PLAYER_COUNTDOWN")
    frame:SetScript("OnEvent", function(_, event)
        if event == "PLAYER_REGEN_DISABLED" then
            inCombat = true
            combatElapsed = 0
        elseif event == "PLAYER_REGEN_ENABLED" then
            inCombat = false
            combatElapsed = 0
        elseif event == "PLAYER_ENTERING_WORLD" then
            instanceStartedAt = GetServerTime()
        elseif event == "START_PLAYER_COUNTDOWN" then
            QuickBar.StartVoiceWatcher()
        end
        QuickBar.Refresh()
    end)
    frame:SetScript("OnUpdate", function(_, elapsed)
        if inCombat then combatElapsed = combatElapsed + elapsed end
        updateElapsed = updateElapsed + elapsed
        if updateElapsed >= 0.25 then
            updateElapsed = 0
            UpdateTimerText()
        end
    end)
    return true
end
function QuickBar.StartVoiceWatcher()
    if not QuickBar.voiceWatcher then
        QuickBar.voiceWatcher = CreateFrame("Frame")
    end
    local spoken = {}
    QuickBar.voiceWatcher:SetScript("OnUpdate", function(self)
        local timer = _G.TimerTrackerTimer1
        local timeLeft = timer and timer.time
        if not timeLeft then
            self:SetScript("OnUpdate", nil)
            return
        end
        local number = math.floor(timeLeft + 0.5)
        if number >= 1 and number <= 5 and not spoken[number] then
            spoken[number] = true
            SpeakCountdown(number)
        end
    end)
end
function QuickBar.Layout()
    if not EnsureFrame() then return end
    local db = Toolbar.InitDB().quickBar
    local previous
    local visibleCount = 0
    for _, key in ipairs(BUTTON_ORDER) do
        local button = QuickBar.buttons[key]
        button:ClearAllPoints()
        button:SetShown(db.buttons[key] ~= false)
        if button:IsShown() then
            visibleCount = visibleCount + 1
            if previous then
                button:SetPoint("LEFT", previous, "RIGHT", BUTTON_GAP, 0)
            else
                button:SetPoint(
                    "LEFT", QuickBar.frame, "LEFT", BAR_PADDING, 0)
            end
            previous = button
        end
    end
    local width = BAR_PADDING * 2
        + math.max(1, visibleCount) * BUTTON_SIZE
        + math.max(0, visibleCount - 1) * BUTTON_GAP
    QuickBar.frame:SetSize(width, BUTTON_SIZE + BAR_PADDING * 2)
end
function QuickBar.Refresh()
    if not EnsureFrame() then return end
    local db = Toolbar.InitDB().quickBar
    QuickBar.frame:SetScale(db.scale)
    QuickBar.Layout()
    QuickBar.frame:SetShown(db.enabled)
    Toolbar.SetMoverEnabled("quickBar", db.enabled)
    SetCVar("timeMgrUseMilitaryTime", db.use24Hour and "1" or "0")
    local grouped = IsInGroup()
    local controller = grouped and IsGroupController()
    SetButtonEnabled(QuickBar.buttons.leave, grouped)
    SetButtonEnabled(QuickBar.buttons.convert, grouped and UnitIsGroupLeader("player"))
    SetButtonEnabled(QuickBar.buttons.role, controller)
    SetButtonEnabled(QuickBar.buttons.ready, controller)
    SetButtonEnabled(QuickBar.buttons.countdown, controller)
    local canTeleport = IsAllowedToUserTeleport
        and IsAllowedToUserTeleport()
    SetButtonEnabled(QuickBar.buttons.teleport, canTeleport == true)
    QuickBar.buttons.convert.tooltip = IsInRaid()
        and "转换为小队" or "转换为团队"
    QuickBar.buttons.timer:SetBackdropColor(
        0.08, 0.12, 0.1,
        db.hideTimerBackground and 0 or 0.85)
    UpdateTimerText()
end
function QuickBar.SetEnabled(value)
    Toolbar.InitDB().quickBar.enabled = value == true
    QuickBar.Refresh()
end
function QuickBar.SetScale(value)
    local db = Toolbar.InitDB().quickBar
    db.scale = tonumber(value) or 1
    QuickBar.Refresh()
end
function QuickBar.SetButtonShown(key, value)
    local db = Toolbar.InitDB().quickBar
    if db.buttons[key] == nil then return end
    db.buttons[key] = value == true
    QuickBar.Layout()
end
function QuickBar.SetTimerMode(value)
    if value ~= "COMBAT" and value ~= "CLOCK" and value ~= "DYNAMIC" then
        value = "COMBAT"
    end
    Toolbar.InitDB().quickBar.timerMode = value
    UpdateTimerText()
end
function QuickBar.SetUse24Hour(value)
    Toolbar.InitDB().quickBar.use24Hour = value == true
    QuickBar.Refresh()
end
function QuickBar.SetHideTimerBackground(value)
    Toolbar.InitDB().quickBar.hideTimerBackground = value == true
    QuickBar.Refresh()
end
function QuickBar.SetCountdownSeconds(value)
    Toolbar.InitDB().quickBar.countdownSeconds =
        math.max(3, math.min(180, math.floor(tonumber(value) or 10)))
end
function QuickBar.SetCountdownVoice(value)
    Toolbar.InitDB().quickBar.countdownVoice = value == true
end
function QuickBar.SetVoiceType(value)
    Toolbar.InitDB().quickBar.voiceType = tonumber(value) or 0
end
function QuickBar.PreviewVoice()
    SpeakCountdown(5)
end
function QuickBar.Reset()
    local db = Toolbar.InitDB().quickBar
    local defaults = Toolbar.defaults.quickBar
    for key, value in pairs(defaults) do
        db[key] = type(value) == "table"
            and Toolbar.CopyTable(value) or value
    end
    Toolbar.ResetMover("quickBar")
    QuickBar.Refresh()
end
local driver = CreateFrame("Frame")
driver:RegisterEvent("PLAYER_LOGIN")
driver:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    QuickBar.Refresh()
end)
