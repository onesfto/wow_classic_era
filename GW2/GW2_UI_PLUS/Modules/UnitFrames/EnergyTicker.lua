local _, addonTable = ...
local GW = _G.GW2_ADDON
local AB = addonTable.PlusActionBar
if not GW or not AB then return end
local Ticker = {}
addonTable.PlusEnergyTicker = Ticker
local UPDATE_INTERVAL = 0.05
local TEXTURE_BACKGROUND =
    "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar-bg.png"
local TEXTURE_STATUS =
    "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar.png"
local mirrors = {}
local function HasEnergyOwner()
    local normalEnabled = AB.IsNormalPlayerFrameEnabled()
        and _G.GwPlayerUnitFrame ~= nil
    local extraEnabled = GW.settings
        and GW.settings.POWERBAR_ENABLED
        and _G.GwPlayerPowerBar ~= nil
    return normalEnabled or extraEnabled
end
local function CombatVisibilityAllows()
    return not GW.settings
        or not GW.settings.PLAYER_ENERGY_MANA_TICK_HIDE_OFC
        or InCombatLockdown()
end
local function EnforceCombatVisibility()
    if CombatVisibilityAllows() then return end
    if _G.Gw2ManaTicker then _G.Gw2ManaTicker:Hide() end
    if _G.Gw2EnergyTicker then _G.Gw2EnergyTicker:Hide() end
    for _, mirror in pairs(mirrors) do
        mirror:Hide()
    end
end
local function CreateMirror(name)
    local frame = CreateFrame("Frame", name, UIParent)
    frame:Hide()
    frame:SetSize(316, 1)
    frame:SetFrameStrata("MEDIUM")
    frame.background = frame:CreateTexture(nil, "BACKGROUND")
    frame.background:SetTexture(TEXTURE_BACKGROUND)
    frame.background:SetAllPoints(frame)
    frame.statusBar = CreateFrame("StatusBar", nil, frame)
    frame.statusBar:SetPoint("LEFT", frame, "LEFT", 0, 0)
    frame.statusBar:SetPoint("RIGHT", frame, "RIGHT", -1, 0)
    frame.statusBar:SetHeight(1)
    frame.statusBar:SetMinMaxValues(0, 5)
    frame.statusBar:SetValue(0)
    frame.statusBar:SetStatusBarTexture(TEXTURE_STATUS)
    frame.statusBar.label =
        frame.statusBar:CreateFontString(nil, "OVERLAY")
    frame.statusBar.label:GwSetFontTemplate(
        DAMAGE_TEXT_FONT, GW.Enum.TextSizeType.Small, "", -4)
    frame.statusBar.label:SetPoint("CENTER", 0, 0)
    frame.statusBar.label:SetTextColor(1, 1, 1)
    return frame
end
local function UpdateMirror(mirror)
    local source = mirror.source
    local enabled = HasEnergyOwner()
        and GW.settings
        and GW.settings.PLAYER_ENERGY_MANA_TICK
        and CombatVisibilityAllows()
    if not enabled or not source or not source.statusBar
        or not source:IsShown() then
        mirror:Hide()
        return
    end
    local minimum, maximum = source.statusBar:GetMinMaxValues()
    mirror.statusBar:SetMinMaxValues(minimum, maximum)
    mirror.statusBar:SetValue(source.statusBar:GetValue())
    mirror.statusBar:SetStatusBarColor(
        source.statusBar:GetStatusBarColor())
    mirror.statusBar.label:SetText(
        source.statusBar.label
            and source.statusBar.label:GetText() or "")
    mirror:Show()
end
local controller = CreateFrame("Frame")
controller.elapsed = 0
controller:SetScript("OnUpdate", function(self, elapsed)
    self.elapsed = self.elapsed + (tonumber(elapsed) or 0)
    if self.elapsed < UPDATE_INTERVAL then return end
    self.elapsed = 0
    EnforceCombatVisibility()
    for _, mirror in pairs(mirrors) do
        UpdateMirror(mirror)
    end
end)
local function GetOwners()
    local normalFrame = _G.GwPlayerUnitFrame
    local normalEnabled = AB.IsNormalPlayerFrameEnabled()
        and normalFrame ~= nil
    local extraBar = _G.GwPlayerPowerBar
    local extraEnabled = GW.settings
        and GW.settings.POWERBAR_ENABLED
        and extraBar ~= nil
    return normalFrame, normalEnabled, extraBar, extraEnabled
end
local function AnchorTicker(frame, owner, normalFrame)
    if not frame or not owner then return end
    local anchor = owner == normalFrame and normalFrame.powerbar or owner
    local width = anchor and anchor:GetWidth() or 316
    if width <= 0 then
        width = owner == normalFrame
            and (GW.settings.playerFrameHealthBarSize
                and GW.settings.playerFrameHealthBarSize.width or 316)
            or 316
    end
    frame:SetParent(owner)
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -2)
    if frame.UpdateWidth then
        frame:UpdateWidth(width)
    else
        frame:SetSize(width, 1)
        if frame.background then frame.background:SetSize(width, 20) end
        if frame.statusBar then frame.statusBar:SetWidth(width - 1) end
    end
end
local function GetPrimaryOwner(
    source, normalFrame, normalEnabled, extraBar, extraEnabled)
    local parent = source and source:GetParent()
    if parent == normalFrame and normalEnabled then
        return normalFrame
    end
    if parent == extraBar and extraEnabled then
        return extraBar
    end
    if normalEnabled then return normalFrame end
    if extraEnabled then return extraBar end
end
local function RefreshPair(sourceName, mirrorName)
    local source = _G[sourceName]
    local mirror = mirrors[sourceName]
    if not source then
        if mirror then mirror:Hide() end
        return
    end
    local normalFrame, normalEnabled, extraBar, extraEnabled = GetOwners()
    local primary = GetPrimaryOwner(
        source, normalFrame, normalEnabled, extraBar, extraEnabled)
    if not primary then
        source:Hide()
        if mirror then mirror:Hide() end
        return
    end
    if source:GetParent() ~= primary then
        AnchorTicker(source, primary, normalFrame)
    end
    local secondary
    if normalEnabled and extraEnabled then
        secondary = primary == normalFrame and extraBar or normalFrame
    end
    if not secondary then
        if mirror then mirror:Hide() end
        return
    end
    if not mirror then
        mirror = CreateMirror(mirrorName)
        mirrors[sourceName] = mirror
    end
    mirror.source = source
    AnchorTicker(mirror, secondary, normalFrame)
end
function Ticker.Refresh()
    if not GW.settings then return end
    local enabled = HasEnergyOwner()
        and GW.settings.PLAYER_ENERGY_MANA_TICK
    if enabled and not _G.Gw2ManaTicker and GW.Load5SR then
        local normalFrame = AB.IsNormalPlayerFrameEnabled()
            and _G.GwPlayerUnitFrame or nil
        GW.Load5SR(normalFrame)
    end
    if GW.Update5SrHot then GW.Update5SrHot() end
    if enabled and _G.Gw2EnergyTicker then
        local handler = _G.Gw2EnergyTicker:GetScript("OnEvent")
        if handler then
            handler(_G.Gw2EnergyTicker, "UPDATE_SHAPESHIFT_FORM")
        end
    end
    RefreshPair("Gw2ManaTicker", "GW2PlusManaTickerMirror")
    RefreshPair("Gw2EnergyTicker", "GW2PlusEnergyTickerMirror")
    EnforceCombatVisibility()
    if not enabled then
        if _G.Gw2ManaTicker then _G.Gw2ManaTicker:Hide() end
        if _G.Gw2EnergyTicker then _G.Gw2EnergyTicker:Hide() end
        for _, mirror in pairs(mirrors) do mirror:Hide() end
    end
end
