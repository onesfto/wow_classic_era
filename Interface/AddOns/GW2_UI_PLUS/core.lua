local _, addonTable = ...

DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: Core.lua is evaluating!")
StaticPopupDialogs["GW2_UI_PLUS_RELOAD"] = {
    text = "更改“启用”状态需要重新加载界面才能生效。现在重新加载吗？",
    button1 = ACCEPT,
    button2 = CANCEL,
    OnAccept = function()
        ReloadUI()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
}
if GW2_ADDON and GW2_ADDON.GetSettingsTabFrame then
    DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: Dependencies satisfied!")
    local f = CreateFrame("Frame")
    f:RegisterEvent("PLAYER_ENTERING_WORLD")
    f:SetScript("OnEvent", function(self)
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: PLAYER_ENTERING_WORLD fired!")
        local settingsTab = GW2_ADDON.GetSettingsTabFrame()
        if not settingsTab then 
            DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: settingsTab is nil!")
            return 
        end
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: settingsTab found!")
        
        -- Create the parent panel (Category: 附加组件)
        local p = CreateFrame("Frame", nil, settingsTab, "GwSettingsPanelTmpl")
        p.panelId = "gw2_ui_plus_general"
        
        if p.header then
            p.header:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 20)
            if GW2_ADDON.Colors and GW2_ADDON.Colors.TextColors then
                p.header:SetTextColor(GW2_ADDON.Colors.TextColors.LightHeader:GetRGB())
            end
            p.header:SetText("附加组件")
        end
        
        if p.sub then
            p.sub:SetFont(UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
            p.sub:SetTextColor(181 / 255, 160 / 255, 128 / 255)
            p.sub:SetText("其他插件设置")
        end

        -- Create the GearMan sub-panel
        local gearManFrame = CreateFrame("Frame", nil, p, "GwSettingsPanelTmpl")
        gearManFrame.panelId = "gw2_ui_plus_gearman"
        
        if gearManFrame.header then
            gearManFrame.header:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 20)
            if GW2_ADDON.Colors and GW2_ADDON.Colors.TextColors then
                gearManFrame.header:SetTextColor(GW2_ADDON.Colors.TextColors.LightHeader:GetRGB())
            end
            gearManFrame.header:SetText("附加组件")
            -- adjust width for breadcrumb
            gearManFrame.header:SetWidth(gearManFrame.header:GetStringWidth() + 10)
        end
        
        if gearManFrame.breadcrumb then
            gearManFrame.breadcrumb:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
            if GW2_ADDON.Colors and GW2_ADDON.Colors.TextColors then
                gearManFrame.breadcrumb:SetTextColor(GW2_ADDON.Colors.TextColors.LightHeader:GetRGB())
            end
            gearManFrame.breadcrumb:SetText("一键换装")
        end
        
        if gearManFrame.sub then
            gearManFrame.sub:SetFont(UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
            gearManFrame.sub:SetTextColor(181 / 255, 160 / 255, 128 / 255)
            gearManFrame.sub:SetText("alaGearMan")
        end

        -- Make sure saved variable is init
        GW2_UI_PLUS_SV = GW2_UI_PLUS_SV or {
            alaGearMan_Enable = false,
            alaGearMan_ShowButton = true,
            alaGearMan_Scale = 1.0,
        }

        if gearManFrame.AddOption then
            -- 1. Enable (Master Toggle)
            local opt_enable = gearManFrame:AddOption("启用", "启用或禁用 alaGearMan 插件", {
                getter = function() return GW2_UI_PLUS_SV["alaGearMan_Enable"] end,
                setter = function(value) 
                    GW2_UI_PLUS_SV["alaGearMan_Enable"] = value
                    StaticPopup_Show("GW2_UI_PLUS_RELOAD")
                end,
                getDefault = function() return false end,
                isMasterToggle = true
            })
            if opt_enable then opt_enable.optionName = "alaGearMan_Enable" end

            -- 2. Show quick button
            local opt_btn = gearManFrame:AddOption("显示悬浮按钮", "在界面上显示快速换装按钮", {
                getter = function() 
                    return alaGearManSV and alaGearManSV.useBar
                end,
                setter = function(value)
                    if alaGearManSV then
                        alaGearManSV.useBar = value
                        if __ala_meta__ and __ala_meta__.gear and __ala_meta__.gear.ui and __ala_meta__.gear.ui.secure then
                            if value then
                                __ala_meta__.gear.ui.secure:Show()
                            else
                                __ala_meta__.gear.ui.secure:Hide()
                            end
                        end
                    end
                end,
                dependence = { ["alaGearMan_Enable"] = true }
            })
            if opt_btn then opt_btn.optionName = "alaGearMan_ShowButton" end

            -- 3. Size of button
            local opt_slider = gearManFrame:AddOptionSlider("缩放指数", "调整一键换装悬浮窗的大小", {
                min = 10,
                max = 40,
                step = 1,
                decimalNumbers = 0,
                getter = function() 
                    return alaGearManSV and alaGearManSV.quickSize or 18
                end,
                setter = function(value)
                    if alaGearManSV then
                        alaGearManSV.quickSize = value
                        if __ala_meta__ and __ala_meta__.gear and __ala_meta__.gear.ui and __ala_meta__.gear.ui.secure then
                            __ala_meta__.gear.ui.secure:Update()
                        end
                    end
                end,
                dependence = { ["alaGearMan_Enable"] = true }
            })
            if opt_slider then opt_slider.optionName = "alaGearMan_Scale" end
        end
    -- Register the new panel under settings.
    local subPanels = { {name = "一键换装", frame = gearManFrame, icon = "Interface\\Icons\\INV_Misc_Bag_08"} }

    if addonTable.BuildChatBarPanel then
        local chatBarFrame = addonTable.BuildChatBarPanel(p)
        table.insert(subPanels, {name = "频道按钮", frame = chatBarFrame, icon = "Interface\\Icons\\INV_Letter_15"})
    end

    settingsTab:AddSettingsPanel(p, "附加组件", "额外附加组件", subPanels, true)

    end)
else
    if not GW2_ADDON then
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: GW2_ADDON is nil!")
    elseif not GW2_ADDON.GetSettingsTabFrame then
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: GetSettingsTabFrame is nil!")
    end
end
