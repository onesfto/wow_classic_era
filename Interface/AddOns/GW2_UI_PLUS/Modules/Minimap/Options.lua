local _, addonTable = ...
-- 注意：不在顶层检查 GW2_ADDON，因为此时它可能还未初始化

local function BuildMinimapAddonFlyoutPanel(parent)
    -- 延迟检查，确保在调用时才验证依赖
    local GW = _G.GW2_ADDON
    if not GW or not GW.GetSettingsTabFrame then return end
    local Flyout = addonTable.MinimapAddonFlyout
    if not Flyout then return end

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
    local positionOption = panel:AddOptionDropdown(
        "位置",
        "插件悬浮入口位于小地图的哪个方向；切换后立即生效。",
        {
            optionsList = {
                "TOPLEFT", "TOP", "TOPRIGHT", "LEFT",
                "RIGHT", "BOTTOMLEFT", "BOTTOM", "BOTTOMRIGHT",
            },
            optionNames = {
                "左上", "上", "右上", "左中",
                "右中", "左下", "下", "右下",
            },
            getter = Flyout.GetPosition,
            setter = function(value)
                Flyout.SetPosition(value)
            end,
            getDefault = function() return "LEFT" end,
            dependence = {
                ["GW2PlusMinimapAddonFlyout_Enable"] = true,
            },
        })
    if positionOption then
        positionOption.optionName =
            "GW2PlusMinimapAddonFlyout_Position"
    end
    return panel
end
addonTable.BuildMinimapAddonFlyoutPanel =
    BuildMinimapAddonFlyoutPanel
