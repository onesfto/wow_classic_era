local _, addonTable = ...
local Toolbar = addonTable.Toolbar
if not Toolbar then return end
local MarkerBar = {}
Toolbar.markerBar = MarkerBar
local BUTTON_SIZE = 24
local BUTTON_GAP = 3
local BAR_PADDING = 3
local MARKERS = {
    {index = 8, label = "骷髅", icon = "Interface/TargetingFrame/UI-RaidTargetingIcon_8"},
    {index = 7, label = "十字", icon = "Interface/TargetingFrame/UI-RaidTargetingIcon_7"},
    {index = 6, label = "方块", icon = "Interface/TargetingFrame/UI-RaidTargetingIcon_6"},
    {index = 5, label = "月亮", icon = "Interface/TargetingFrame/UI-RaidTargetingIcon_5"},
    {index = 4, label = "三角", icon = "Interface/TargetingFrame/UI-RaidTargetingIcon_4"},
    {index = 3, label = "菱形", icon = "Interface/TargetingFrame/UI-RaidTargetingIcon_3"},
    {index = 2, label = "圆圈", icon = "Interface/TargetingFrame/UI-RaidTargetingIcon_2"},
    {index = 1, label = "星星", icon = "Interface/TargetingFrame/UI-RaidTargetingIcon_1"},
    {index = 0, label = "清除标记", icon = "Interface/Buttons/UI-GroupLoot-Pass-Up"},
}
local function HasPermission()
    if not IsInGroup() then return true end
    if not IsInRaid() then return true end
    return UnitIsGroupLeader("player") or UnitIsGroupAssistant("player")
end
local function ShouldShow()
    local db = Toolbar.InitDB().markerBar
    return db.enabled == true
end
local function ApplyVisibility()
    if not MarkerBar.frame then return end
    local canUse = UnitExists("target") and HasPermission()
    for _, button in pairs(MarkerBar.buttons) do
        button:SetEnabled(canUse)
        button.icon:SetDesaturated(not canUse)
        button:SetAlpha(canUse and 1 or 0.45)
    end
    MarkerBar.frame:SetShown(ShouldShow())
end
local function EnsureFrame()
    if MarkerBar.frame then return true end
    local width = BAR_PADDING * 2 + #MARKERS * BUTTON_SIZE
        + (#MARKERS - 1) * BUTTON_GAP
    local frame = Toolbar.CreateBarFrame(
        "GwPlusToolbarMarkerBar", width, BUTTON_SIZE + BAR_PADDING * 2)
    MarkerBar.frame = frame
    MarkerBar.buttons = {}
    local previous
    for _, info in ipairs(MARKERS) do
        local markerLabel = info.label
        local button = CreateFrame(
            "Button", nil, frame,
            "SecureActionButtonTemplate,BackdropTemplate")
        button:SetSize(BUTTON_SIZE, BUTTON_SIZE)
        button:RegisterForClicks("AnyUp")
        button:SetAttribute("type", "macro")
        button:SetAttribute("macrotext", "/tm " .. info.index)
        button:SetBackdrop({
            bgFile = "Interface/Buttons/WHITE8X8",
            edgeFile = "Interface/Buttons/WHITE8X8",
            edgeSize = 1,
        })
        button:SetBackdropColor(0.08, 0.12, 0.1, 0.85)
        button:SetBackdropBorderColor(0.22, 0.35, 0.3, 0.9)
        local icon = button:CreateTexture(nil, "ARTWORK")
        icon:SetPoint("TOPLEFT", 2, -2)
        icon:SetPoint("BOTTOMRIGHT", -2, 2)
        icon:SetTexture(info.icon)
        button.icon = icon
        button:SetScript("OnEnter", function(self)
            self:SetBackdropBorderColor(0.45, 0.85, 0.68, 1)
            GameTooltip:SetOwner(self, "ANCHOR_BOTTOMLEFT")
            GameTooltip:SetText(markerLabel)
            GameTooltip:AddLine("给当前目标设置团队标记", 0.8, 0.8, 0.8)
            GameTooltip:Show()
        end)
        button:SetScript("OnLeave", function(self)
            self:SetBackdropBorderColor(0.22, 0.35, 0.3, 0.9)
            GameTooltip:Hide()
        end)
        if previous then
            button:SetPoint("LEFT", previous, "RIGHT", BUTTON_GAP, 0)
        else
            button:SetPoint("LEFT", frame, "LEFT", BAR_PADDING, 0)
        end
        previous = button
        MarkerBar.buttons[info.index] = button
    end
    Toolbar.RegisterMover("markerBar", frame, "Group,Widgets")
    frame:RegisterEvent("PLAYER_TARGET_CHANGED")
    frame:RegisterEvent("GROUP_ROSTER_UPDATE")
    frame:RegisterEvent("PARTY_LEADER_CHANGED")
    frame:RegisterEvent("PLAYER_REGEN_ENABLED")
    frame:SetScript("OnEvent", function()
        MarkerBar.Refresh()
    end)
    return true
end
function MarkerBar.Refresh()
    if not EnsureFrame() then return end
    local db = Toolbar.InitDB().markerBar
    Toolbar.QueueOutOfCombat(
        "GW2PlusToolbarMarkerBarScale",
        function() MarkerBar.frame:SetScale(db.scale) end)
    Toolbar.SetMoverEnabled("markerBar", db.enabled)
    Toolbar.QueueOutOfCombat(
        "GW2PlusToolbarMarkerBarVisibility", ApplyVisibility)
end
function MarkerBar.SetEnabled(value)
    Toolbar.InitDB().markerBar.enabled = value == true
    MarkerBar.Refresh()
end
function MarkerBar.SetScale(value)
    Toolbar.InitDB().markerBar.scale = tonumber(value) or 1
    MarkerBar.Refresh()
end
function MarkerBar.Reset()
    local db = Toolbar.InitDB().markerBar
    local defaults = Toolbar.defaults.markerBar
    for key, value in pairs(defaults) do db[key] = value end
    Toolbar.ResetMover("markerBar")
    MarkerBar.Refresh()
end
local driver = CreateFrame("Frame")
driver:RegisterEvent("PLAYER_LOGIN")
driver:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    MarkerBar.Refresh()
end)
