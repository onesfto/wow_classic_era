local _, addonTable = ...
local Auras = {}
addonTable.PlusPlayerAuras = Auras
local SETTING_KEYS = {
    buff = "playerBuffAurasEnabled",
    debuff = "playerDebuffAurasEnabled",
}
local FRAME_NAMES = {
    buff = "GW2UIPlayerBuffs",
    debuff = "GW2UIPlayerDebuffs",
}
local eventFrame = CreateFrame("Frame")
function Auras.InitDB()
    GW2_UI_PLUS_SV = GW2_UI_PLUS_SV or {}
    local inherited = not (
        GW2_ADDON
        and GW2_ADDON.settings
        and GW2_ADDON.settings.PLAYER_BUFFS_ENABLED == false)
    for _, key in pairs(SETTING_KEYS) do
        if GW2_UI_PLUS_SV[key] == nil then
            GW2_UI_PLUS_SV[key] = inherited
        end
    end
    return GW2_UI_PLUS_SV
end
function Auras.GetEnabled(kind)
    local key = assert(SETTING_KEYS[kind])
    return Auras.InitDB()[key] == true
end
function Auras.ApplyVisibility()
    if InCombatLockdown and InCombatLockdown() then
        eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
        return false
    end
    eventFrame:UnregisterEvent("PLAYER_REGEN_ENABLED")
    for kind, frameName in pairs(FRAME_NAMES) do
        local frame = _G[frameName]
        if frame then
            frame:SetShown(Auras.GetEnabled(kind))
        end
    end
    return true
end
function Auras.SetEnabled(kind, enabled)
    local key = assert(SETTING_KEYS[kind])
    Auras.InitDB()[key] = enabled == true
    local settings = GW2_ADDON and GW2_ADDON.settings
    if enabled and settings and not settings.PLAYER_BUFFS_ENABLED then
        settings.PLAYER_BUFFS_ENABLED = true
        if GW2_ADDON.updateSettingsFrameSettingsValue then
            GW2_ADDON.updateSettingsFrameSettingsValue(
                "PLAYER_BUFFS_ENABLED", true, false)
        end
        if StaticPopup_Show then
            StaticPopup_Show("GW2_UI_PLUS_RELOAD")
        end
        return false
    end
    return Auras.ApplyVisibility()
end
function Auras.CreateToggleOption(panel, kind)
    local key = assert(SETTING_KEYS[kind])
    local option = panel:AddOption(
        "启用",
        kind == "buff" and "显示玩家增益光环。"
            or "显示玩家减益光环。",
        {
            getter = function()
                return Auras.GetEnabled(kind)
            end,
            setter = function(value)
                Auras.SetEnabled(kind, value)
            end,
            getDefault = function()
                return true
            end,
            isMasterToggle = true,
        })
    if option then
        option.optionName = key
    end
    return option
end
eventFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
        self:UnregisterEvent(event)
        if C_Timer and C_Timer.After then
            C_Timer.After(0, Auras.ApplyVisibility)
        else
            Auras.ApplyVisibility()
        end
    elseif event == "PLAYER_REGEN_ENABLED" then
        Auras.ApplyVisibility()
    end
end)
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
