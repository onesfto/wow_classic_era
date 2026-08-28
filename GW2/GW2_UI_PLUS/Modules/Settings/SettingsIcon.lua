local _, addonTable = ...
local SETTINGS_ICON =
    "Interface/AddOns/GW2_UI/textures/Auction/tabicon_sell.png"
local function ApplyProfileTabIcon(settingsWindow)
    if not settingsWindow or not settingsWindow.tabButtons then return false end
    for _, button in ipairs(settingsWindow.tabButtons) do
        if button.panelName == "GwSettingsProfilePanel" and button.icon then
            button.icon:SetTexture(SETTINGS_ICON)
            return true
        end
    end
    return false
end
addonTable.ApplyProfileTabIcon = ApplyProfileTabIcon
