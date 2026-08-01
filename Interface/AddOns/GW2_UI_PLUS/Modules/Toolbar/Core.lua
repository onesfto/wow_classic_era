local _, addonTable = ...
local GW = _G.GW2_ADDON
local Toolbar = {}
addonTable.Toolbar = Toolbar
_G.GW2Plus_Toolbar = Toolbar
Toolbar.defaults = {
    groupManage = {
        enabled = true,
        scale = 1,
    },
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
        point = "TOPLEFT",
        relativePoint = "TOPLEFT",
        xOfs = 1,
        yOfs = -60,
        hasMoved = false,
    },
    quickBar = {
        point = "TOP",
        relativePoint = "TOP",
        xOfs = 0,
        yOfs = -40,
        hasMoved = false,
    },
    markerBar = {
        point = "TOP",
        relativePoint = "TOP",
        xOfs = 0,
        yOfs = -70,
        hasMoved = false,
    },
    performanceBar = {
        point = "TOPRIGHT",
        relativePoint = "TOPRIGHT",
        xOfs = -260,
        yOfs = -20,
        hasMoved = false,
    },
}
local function CopyTableFallback(source)
    local target = {}
    for key, value in pairs(source) do
        target[key] = type(value) == "table"
            and CopyTableFallback(value) or value
    end
    return target
end
function Toolbar.CopyTable(source)
    if GW and GW.CopyTable then return GW.CopyTable(source) end
    return CopyTableFallback(source)
end
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
function Toolbar.QueueOutOfCombat(key, callback, args)
    if InCombatLockdown and InCombatLockdown() then
        if GW and GW.CombatQueue then
            GW.CombatQueue:Queue(key, callback, args or {})
            return true
        end
        return false
    end
    callback(unpack(args or {}))
    return true
end
function Toolbar.EnsureMoverSetting(moduleKey)
    if not GW or not GW.settings then return false end
    local setting = Toolbar.moverSettings[moduleKey]
    local default = Toolbar.moverDefaults[moduleKey]
    if not setting or not default then return false end
    if GW.globalDefault and GW.globalDefault.profile
        and not GW.globalDefault.profile[setting] then
        GW.globalDefault.profile[setting] = Toolbar.CopyTable(default)
    end
    local saved = rawget(GW.settings, setting)
    if not saved then
        GW.settings[setting] = Toolbar.CopyTable(default)
        saved = GW.settings[setting]
    end
    for key, value in pairs(default) do
        if saved[key] == nil then saved[key] = value end
    end
    if moduleKey == "performanceBar"
        and saved.hasMoved == false
        and saved.point == "TOPRIGHT"
        and saved.relativePoint == "TOPRIGHT"
        and saved.xOfs == -20
        and saved.yOfs == -20 then
        saved.xOfs = default.xOfs
    end
    return true
end
local function AnchorFrameToMover(frame)
    if not frame or not frame.gwMover or frame.gwPlusAnchoring then return end
    frame.gwPlusAnchoring = true
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", frame.gwMover, "TOPLEFT")
    frame.gwPlusAnchoring = nil
end
function Toolbar.RegisterMover(moduleKey, frame, tags)
    if not frame then return end
    if frame.gwMover then return frame.gwMover end
    if not Toolbar.EnsureMoverSetting(moduleKey)
        or not GW.RegisterMovableFrame then
        return
    end
    GW.RegisterMovableFrame(
        frame,
        Toolbar.moverNames[moduleKey],
        Toolbar.moverSettings[moduleKey],
        tags or "Widgets",
        nil,
        {"default"})
    AnchorFrameToMover(frame)
    hooksecurefunc(frame, "SetPoint", function(_, _, relativeTo)
        if frame.gwPlusAnchoring or relativeTo == frame.gwMover then return end
        AnchorFrameToMover(frame)
    end)
    return frame.gwMover
end
function Toolbar.SetMoverEnabled(moduleKey)
    local module = Toolbar[moduleKey]
    local mover = module and module.frame and module.frame.gwMover
    if mover and GW and GW.ToggleMover then
        GW.ToggleMover(mover, true)
    end
end
function Toolbar.ResetMover(moduleKey)
    local module = Toolbar[moduleKey]
    local frame = module and module.frame
    local mover = frame and frame.gwMover
    local default = Toolbar.moverDefaults[moduleKey]
    if not mover or not default or not GW or not GW.settings then return end
    local function Apply()
        local setting = Toolbar.moverSettings[moduleKey]
        local saved = GW.settings[setting] or {}
        for key, value in pairs(default) do saved[key] = value end
        GW.settings[setting] = saved
        mover.savedPoint = Toolbar.CopyTable(saved)
        mover:ClearAllPoints()
        mover:SetPoint(
            default.point, UIParent, default.relativePoint,
            default.xOfs, default.yOfs)
        frame.isMoved = false
        frame:SetAttribute("isMoved", false)
    end
    Toolbar.QueueOutOfCombat(
        "GW2PlusToolbarReset" .. moduleKey, Apply)
end
function Toolbar.RebindMover(moduleKey)
    local module = Toolbar[moduleKey]
    local mover = module and module.frame and module.frame.gwMover
    if not mover or not Toolbar.EnsureMoverSetting(moduleKey) then return end
    local function Apply()
        local setting = Toolbar.moverSettings[moduleKey]
        local point = GW.settings[setting]
        mover.savedPoint = point
        mover:ClearAllPoints()
        mover:SetPoint(
            point.point, UIParent, point.relativePoint,
            point.xOfs, point.yOfs)
    end
    Toolbar.QueueOutOfCombat(
        "GW2PlusToolbarRebind" .. moduleKey, Apply)
end
function Toolbar.RefreshAll()
    Toolbar.InitDB()
    for _, moduleKey in ipairs({
        "groupManage", "quickBar", "markerBar", "performanceBar",
    }) do
        Toolbar.RebindMover(moduleKey)
        local module = Toolbar[moduleKey]
        if module and module.Refresh then module.Refresh() end
    end
end
function Toolbar.RedrawOption(optionName)
    local widget = GW and GW.FindSettingsWidgetByOption
        and GW.FindSettingsWidgetByOption(optionName)
    if not widget or not widget.get then return end
    local value = widget.get()
    if widget.optionType == "slider" then
        if widget.slider then widget.slider:SetValue(value) end
        if widget.inputFrame and widget.inputFrame.input then
            widget.inputFrame.input:SetText(string.format(
                "%." .. (widget.decimalNumbers or 0) .. "f", value))
        end
    elseif widget.SetChecked then
        widget:SetChecked(value)
    elseif widget.checkButton then
        widget.checkButton:SetChecked(value)
    end
end
function Toolbar.FormatDuration(seconds)
    if seconds >= 60 and seconds % 60 == 0 then
        return string.format("倒数%d分钟", seconds / 60)
    end
    return string.format("倒数%d秒", seconds)
end
function Toolbar.CreateBarFrame(name, width, height)
    local frame = CreateFrame("Frame", name, UIParent, "BackdropTemplate")
    frame:SetSize(width, height)
    frame:SetFrameStrata("LOW")
    frame:SetBackdrop({
        bgFile = "Interface/Buttons/WHITE8X8",
        edgeFile = "Interface/Buttons/WHITE8X8",
        edgeSize = 1,
    })
    frame:SetBackdropColor(0.03, 0.05, 0.045, 0.86)
    frame:SetBackdropBorderColor(0.2, 0.32, 0.27, 0.95)
    return frame
end
function Toolbar.CreateIconButton(parent, size)
    local button = CreateFrame("Button", nil, parent, "BackdropTemplate")
    button:SetSize(size, size)
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button:SetBackdrop({
        bgFile = "Interface/Buttons/WHITE8X8",
        edgeFile = "Interface/Buttons/WHITE8X8",
        edgeSize = 1,
    })
    button:SetBackdropColor(0.08, 0.12, 0.1, 0.85)
    button:SetBackdropBorderColor(0.22, 0.35, 0.3, 0.9)
    button.icon = button:CreateTexture(nil, "ARTWORK")
    button.icon:SetPoint("TOPLEFT", 2, -2)
    button.icon:SetPoint("BOTTOMRIGHT", -2, 2)
    button:SetScript("OnEnter", function(self)
        self:SetBackdropBorderColor(0.45, 0.85, 0.68, 1)
        if self.tooltip then
            GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
            GameTooltip:SetText(self.tooltip)
            if self.tooltipExtra then self.tooltipExtra(GameTooltip) end
            GameTooltip:Show()
        end
    end)
    button:SetScript("OnLeave", function(self)
        self:SetBackdropBorderColor(0.22, 0.35, 0.3, 0.9)
        GameTooltip:Hide()
    end)
    return button
end
Toolbar.InitDB()
local profileDriver = CreateFrame("Frame")
profileDriver:RegisterEvent("PLAYER_LOGIN")
profileDriver:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    if GW and GW.globalSettings and GW.globalSettings.RegisterCallback then
        GW.globalSettings.RegisterCallback(
            Toolbar, "OnProfileChanged", Toolbar.RefreshAll)
    end
end)
local worldDriver = CreateFrame("Frame")
worldDriver:RegisterEvent("PLAYER_ENTERING_WORLD")
worldDriver:SetScript("OnEvent", function()
    Toolbar.RefreshAll()
end)
