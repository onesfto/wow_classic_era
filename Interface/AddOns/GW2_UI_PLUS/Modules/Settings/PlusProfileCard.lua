local _, addonTable = ...

local CARD_GAP = 7
local LIST_HEIGHT = 328
local ICON_PATH =
    "Interface/AddOns/GW2_UI_PLUS/Assets/gwlogo-red.png"
local PROFILE_FONT = UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF"

local function StyleCard(card)
    card.name:SetFont(PROFILE_FONT, 14)
    card.desc:SetFont(PROFILE_FONT, 10)
    card.desc:SetTextColor(0.49, 0.49, 0.49)
    card.background:SetTexCoord(0, 1, 0, 0.5)
    card.activeProfile:Hide()

    card.activateButton.icon:SetTexture(ICON_PATH)
    card.activateButton.icon:SetTexCoord(0, 1, 0, 1)
    card.defaultSettings:Show()
    card.defaultSettings:SetText("加载")
    card.defaultSettings:GwSkinNegativeButton()

    card.hasOptions = false
    card.canDelete = false
    card.canExport = false
    card.canChangeIcon = false
    card.canRename = false
    card.canCopy = false
    card.canActivate = false
end

local function GetProfilePanel()
    return _G.GW2ProfileSettingsView
end

local function ApplyPlusDefaults()
    if InCombatLockdown and InCombatLockdown() then
        local GW = _G.GW2_ADDON
        if GW and GW.Notice then
            GW.Notice("战斗中无法加载默认 Plus 配置。")
        end
        return
    end

    local defaults = addonTable.PlusProfileDefaults
    if not defaults or not defaults.Apply then return end
    if defaults.Apply() and C_UI and C_UI.Reload then
        C_UI.Reload()
    end
end

local function CreateCard(settingsProfile)
    if not settingsProfile or settingsProfile.gwPlusDefaultCard then
        return settingsProfile and settingsProfile.gwPlusDefaultCard
    end

    local nativeCard = settingsProfile.resetToDefaultFrame
    local scrollBox = settingsProfile.ScrollBox
    if not nativeCard or not scrollBox then return end

    local card = CreateFrame(
        "Button", nil, settingsProfile, "GwProfileItemTmpl")
    card:SetPoint("TOPLEFT", nativeCard, "BOTTOMLEFT", 0, -CARD_GAP)
    card:SetSize(nativeCard:GetSize())
    StyleCard(card)
    card.name:SetText("默认 Plus 配置")
    card.desc:SetText(
        "覆盖当前配置及 Plus 独立设置，然后重新加载界面。")
    card.defaultSettings:SetScript("OnClick", ApplyPlusDefaults)
    card:Show()
    card:Raise()

    scrollBox:ClearAllPoints()
    scrollBox:SetPoint("TOPLEFT", card, "BOTTOMLEFT", 0, -CARD_GAP)
    scrollBox:SetHeight(LIST_HEIGHT)

    settingsProfile.gwPlusDefaultCard = card
    return card
end

local function Install()
    return CreateCard(GetProfilePanel()) ~= nil
end

local function HookSettingsBuild()
    local GW = _G.GW2_ADDON
    if not GW then return end

    if GW.LoadSettingsProfileTab and not GW.gwPlusProfileTabBuildHooked then
        GW.gwPlusProfileTabBuildHooked = true
        hooksecurefunc(GW, "LoadSettingsProfileTab", function()
            if C_Timer and C_Timer.After then
                C_Timer.After(0, Install)
            else
                Install()
            end
        end)
    end

    if GW.BuildSettingsWindow and not GW.gwPlusProfileBuildHooked then
        GW.gwPlusProfileBuildHooked = true
        hooksecurefunc(GW, "BuildSettingsWindow", function()
            if C_Timer and C_Timer.After then
                C_Timer.After(0, Install)
            else
                Install()
            end
        end)
    end
end

local installAttempts = 0
local function TryInstall()
    HookSettingsBuild()
    if Install() then return true end
    installAttempts = installAttempts + 1
    if installAttempts < 40 and C_Timer and C_Timer.After then
        C_Timer.After(0.5, TryInstall)
    end
    return false
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:RegisterEvent("PLAYER_LOGIN")
events:RegisterEvent("PLAYER_ENTERING_WORLD")
events:SetScript("OnEvent", function(self, event, addonName)
    if event == "ADDON_LOADED"
        and addonName ~= "GW2_UI"
        and addonName ~= "GW2_UI_PLUS" then
        return
    end

    if TryInstall() then
        self:UnregisterAllEvents()
    end
end)

HookSettingsBuild()
TryInstall()
