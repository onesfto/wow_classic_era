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
            -- 主开关
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

            -- 面板里的选项统一走 alaGearMan 自己的 drop_handler，副作用（重建按钮、删宏等）与原下拉菜单完全一致。
            local dep = { ["alaGearMan_Enable"] = true }
            local function ApplyGearOpt(key, value)
                if __ala_meta__ and __ala_meta__.gear and __ala_meta__.gear.func and __ala_meta__.gear.func.drop_handler then
                    __ala_meta__.gear.func.drop_handler(nil, nil, { key, value })
                end
            end

            -- ========== 换装栏 ==========
            gearManFrame:AddGroupHeader("换装栏")

            local opt_btn = gearManFrame:AddOption("显示换装栏", "在界面上显示快速换装按钮栏", {
                getter = function() return alaGearManSV and alaGearManSV.useBar end,
                setter = function(value) ApplyGearOpt("useBar", value) end,
                getDefault = function() return true end,
                dependence = dep,
            })
            if opt_btn then opt_btn.optionName = "alaGearMan_ShowButton" end

            gearManFrame:AddOption("按钮分多行", "将快速切换按钮排列成多行", {
                getter = function() return alaGearManSV and alaGearManSV.multi_lines end,
                setter = function(value) ApplyGearOpt("multi_lines", value) end,
                getDefault = function() return false end,
                dependence = dep,
            })

            local opt_slider = gearManFrame:AddOptionSlider("缩放指数", "调整换装栏的大小", {
                min = 10,
                max = 40,
                step = 1,
                decimalNumbers = 0,
                getter = function() return alaGearManSV and alaGearManSV.quickSize or 18 end,
                setter = function(value)
                    if alaGearManSV then
                        alaGearManSV.quickSize = value
                        if __ala_meta__ and __ala_meta__.gear and __ala_meta__.gear.ui and __ala_meta__.gear.ui.secure then
                            __ala_meta__.gear.ui.secure:Update()
                        end
                    end
                end,
                dependence = dep,
            })
            if opt_slider then opt_slider.optionName = "alaGearMan_Scale" end

            gearManFrame:AddOptionDropdown("按钮风格", "快速切换按钮的显示样式", {
                optionsList = { "TC", "T", "C" },
                optionNames = { "文字+图标", "图标", "文字" },
                getter = function() return alaGearManSV and alaGearManSV.quickStyle or "C" end,
                setter = function(value) ApplyGearOpt("quickStyle", value) end,
                getDefault = function() return "C" end,
                dependence = dep,
            })

            gearManFrame:AddOptionButton("重置换装栏位置", "把换装栏移回默认位置", {
                callback = function()
                    if not alaGearManSV then return end
                    alaGearManSV.quickPos = { "TOP", 0, 0 }
                    if alaGearManSV.quickPosChar then
                        alaGearManSV.quickPosChar[UnitGUID("player")] = nil
                    end
                    local secure = __ala_meta__ and __ala_meta__.gear and __ala_meta__.gear.ui and __ala_meta__.gear.ui.secure
                    if secure then
                        secure:ClearAllPoints()
                        secure:SetPoint(unpack(alaGearManSV.quickPos))
                    end
                end,
                dependence = dep,
            })

            -- ========== 一键脱光 ==========
            gearManFrame:AddGroupHeader("一键脱光")

            gearManFrame:AddOption("脱光时一并卸下戒指、饰品、披风及耐久为 0 的装备", "勾选后一键脱光会连同这些部位一起卸下", {
                getter = function() return alaGearManSV and alaGearManSV.takeoffAll_include_neck_finger_and_trinket end,
                setter = function(value) ApplyGearOpt("takeoffAll_include_neck_finger_and_trinket", value) end,
                getDefault = function() return false end,
                dependence = dep,
            })

            gearManFrame:AddOptionDropdown("一键脱光按钮位置", "一键脱光按钮位于换装栏的哪一侧", {
                optionsList = { "LEFT", "RIGHT" },
                optionNames = { "左边", "右边" },
                getter = function() return alaGearManSV and alaGearManSV.takeoffAll_pos or "RIGHT" end,
                setter = function(value) ApplyGearOpt("takeoffAll_pos", value) end,
                getDefault = function() return "RIGHT" end,
                dependence = dep,
            })

            -- ========== 其他 ==========
            gearManFrame:AddGroupHeader("其他")

            gearManFrame:AddOption("自动创建宏", "为每套装备自动创建切换宏", {
                getter = function() return alaGearManSV and alaGearManSV.UseMacro end,
                setter = function(value) ApplyGearOpt("UseMacro", value) end,
                getDefault = function() return false end,
                dependence = dep,
            })

            gearManFrame:AddOption("在物品提示中显示套装信息", "鼠标悬停装备时，提示该装备属于哪套已保存的套装", {
                getter = function() return alaGearManSV and alaGearManSV.show_outfit_in_tooltip end,
                setter = function(value) ApplyGearOpt("show_outfit_in_tooltip", value) end,
                getDefault = function() return true end,
                dependence = dep,
            })
        end
    -- Register the new panel under settings.
    local subPanels = { {name = "一键换装", frame = gearManFrame, icon = "Interface\\Icons\\INV_Misc_Bag_08"} }

    if addonTable.BuildChatBarPanel then
        local chatBarFrame = addonTable.BuildChatBarPanel(p)
        table.insert(subPanels, {name = "频道按钮", frame = chatBarFrame, icon = "Interface\\Icons\\INV_Letter_15"})
    end

    if addonTable.BuildChatWindowPanel then
        local chatWindowFrame = addonTable.BuildChatWindowPanel(p)
        table.insert(subPanels, {name = "聊天窗口", frame = chatWindowFrame, icon = "Interface\\Icons\\INV_Scroll_03"})
    end

    if addonTable.BuildSkinsPanel then
        local skinsFrame = addonTable.BuildSkinsPanel(p)
        table.insert(subPanels, {name = "界面皮肤", frame = skinsFrame, icon = "Interface\\Icons\\Trade_Engineering"})
    end

    if addonTable.BuildMinimapAddonFlyoutPanel then
        local minimapFlyoutFrame =
            addonTable.BuildMinimapAddonFlyoutPanel(p)
        table.insert(subPanels, {
            name = "插件悬浮按钮",
            frame = minimapFlyoutFrame,
            icon = "Interface\\AddOns\\GW2_UI\\textures\\icons\\addondropout.png",
        })
    end

    settingsTab:AddSettingsPanel(p, "附加组件", "额外附加组件", subPanels, true)

    if addonTable.BuildActionBarTab then
        addonTable.BuildActionBarTab(settingsTab, _G.GwSettingsWindow)
    end

    if addonTable.PrepareUnitFrameSettings then
        addonTable.PrepareUnitFrameSettings(settingsTab)
    end

    if addonTable.BuildMainMenuTab then
        addonTable.BuildMainMenuTab(settingsTab, _G.GwSettingsWindow)
    end

    if addonTable.ApplyProfileTabIcon then
        addonTable.ApplyProfileTabIcon(_G.GwSettingsWindow)
    end

    if addonTable.ArrangeSettingsTabs then
        addonTable.ArrangeSettingsTabs(_G.GwSettingsWindow)
    end

    end)
else
    if not GW2_ADDON then
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: GW2_ADDON is nil!")
    elseif not GW2_ADDON.GetSettingsTabFrame then
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: GetSettingsTabFrame is nil!")
    end
end
