-- GW2_UI_PLUS 插件悬浮按钮设置

local _, addonTable = ...

local GW = _G.GW2_ADDON
local Flyout = addonTable.MinimapAddonFlyout
if not GW or not GW.GetSettingsTabFrame or not Flyout then return end

local function BuildMinimapAddonFlyoutPanel(parent)
    Flyout.InitDB()

    local panel =
        CreateFrame("Frame", nil, parent, "GwSettingsPanelTmpl")
    panel.panelId = "gw2_ui_plus_minimap_addon_flyout"

    if panel.header then
        panel.header:SetFont(
            DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 20)
        if GW.Colors and GW.Colors.TextColors then
            panel.header:SetTextColor(
                GW.Colors.TextColors.LightHeader:GetRGB())
        end
        panel.header:SetText("附加组件")
        panel.header:SetWidth(panel.header:GetStringWidth() + 10)
    end
    if panel.breadcrumb then
        panel.breadcrumb:SetFont(
            DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
        if GW.Colors and GW.Colors.TextColors then
            panel.breadcrumb:SetTextColor(
                GW.Colors.TextColors.LightHeader:GetRGB())
        end
        panel.breadcrumb:SetText("插件悬浮按钮")
    end
    if panel.sub then
        panel.sub:SetFont(
            UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
        panel.sub:SetTextColor(
            181 / 255, 160 / 255, 128 / 255)
        panel.sub:SetText(
            "独立收纳小地图周围的第三方插件按钮")
    end

    local option = panel:AddOption(
        "启用",
        "收纳小地图周围的插件按钮；此设置不受 GW2_UI 小地图开关影响。",
        {
            getter = Flyout.IsEnabled,
            setter = function(value)
                Flyout.SetEnabled(value)
            end,
            getDefault = function() return true end,
            isMasterToggle = true,
        })
    if option then
        option.optionName =
            "GW2PlusMinimapAddonFlyout_Enable"
    end

    return panel
end

addonTable.BuildMinimapAddonFlyoutPanel =
    BuildMinimapAddonFlyoutPanel
