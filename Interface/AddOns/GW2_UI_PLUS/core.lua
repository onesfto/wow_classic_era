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
        if chatBarFrame then
            table.insert(subPanels, {name = "频道按钮", frame = chatBarFrame, icon = "Interface\\Icons\\INV_Letter_15"})
        else
            DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: BuildChatBarPanel 返回 nil")
        end
    end

    if addonTable.BuildCooldownPulsePanel then
        local cooldownPulseFrame = addonTable.BuildCooldownPulsePanel(p)
        if cooldownPulseFrame then
            table.insert(subPanels, {name = "冷却闪烁", frame = cooldownPulseFrame, icon = "Interface\\Icons\\Spell_Nature_Earthbind"})
        else
            DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: BuildCooldownPulsePanel 返回 nil")
        end
    end

    if addonTable.BuildChatWindowPanel then
        local chatWindowFrame = addonTable.BuildChatWindowPanel(p)
        if chatWindowFrame then
            table.insert(subPanels, {name = "聊天窗口", frame = chatWindowFrame, icon = "Interface\\Icons\\INV_Scroll_03"})
        else
            DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: BuildChatWindowPanel 返回 nil")
        end
    end

    if addonTable.BuildSkinsPanel then
        local skinsFrame = addonTable.BuildSkinsPanel(p)
        if skinsFrame then
            table.insert(subPanels, {name = "界面皮肤", frame = skinsFrame, icon = "Interface\\Icons\\Trade_Engineering"})
        else
            DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: BuildSkinsPanel 返回 nil")
        end
    end

    if addonTable.BuildMinimapAddonFlyoutPanel then
        local minimapFlyoutFrame = addonTable.BuildMinimapAddonFlyoutPanel(p)
        if minimapFlyoutFrame then
            table.insert(subPanels, {
                name = "插件悬浮按钮",
                frame = minimapFlyoutFrame,
                icon = "Interface\\AddOns\\GW2_UI\\textures\\icons\\addondropout.png",
            })
        else
            DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: BuildMinimapAddonFlyoutPanel 返回 nil")
        end
    end

    if addonTable.BuildToolbarPanel then
        local toolbarFrame = addonTable.BuildToolbarPanel(p)
        if toolbarFrame then
            table.insert(subPanels, {
                name = "工具条",
                frame = toolbarFrame,
                icon = "Interface\\Icons\\INV_Misc_Tool_01",
            })
        else
            DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: BuildToolbarPanel 返回 nil")
        end
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

    if GW2_ADDON and GW2_ADDON.GetSettingsTabFrame then
        local FORCE_NEW_LINE_TYPES = {
            slider = true, dropdown = true, list = true, text = true,
            button = true, colorPicker = true, header = true, subHeader = true
        }

        local function ResolveForceNewLine(option)
            if option.forceNewLine ~= nil then return option.forceNewLine end
            if option.optionType == "dropdown" and option.noNewLine ~= nil then return not option.noNewLine end
            return FORCE_NEW_LINE_TYPES[option.optionType] == true
        end

        local function IsMasterToggle(option)
            return option and option.isMasterToggle == true
        end

        local function PackOptionsIntoRows(options)
            local rows, index = {}, 1
            local function AddMasterToggleSeparatorIfNeeded(lastIndex)
                if IsMasterToggle(options[lastIndex]) and options[lastIndex + 1] and not IsMasterToggle(options[lastIndex + 1]) then
                    rows[#rows + 1] = {kind = "masterToggleSeparator"}
                end
            end
            while index <= #options do
                local left = options[index]
                if ResolveForceNewLine(left) then
                    rows[#rows + 1] = {cols = {left}}
                    AddMasterToggleSeparatorIfNeeded(index)
                    index = index + 1
                else
                    local right = options[index + 1]
                    if right and not ResolveForceNewLine(right) and IsMasterToggle(left) == IsMasterToggle(right) then
                        rows[#rows + 1] = {cols = {left, right}}
                        AddMasterToggleSeparatorIfNeeded(index + 1)
                        index = index + 2
                    else
                        rows[#rows + 1] = {cols = {left}}
                        AddMasterToggleSeparatorIfNeeded(index)
                        index = index + 1
                    end
                end
            end
            return rows
        end

        local function BuildOptionsDataProvider(panel)
            local provider = CreateDataProvider()
            for index, row in ipairs(PackOptionsIntoRows(panel.gwOptions or {})) do
                provider:Insert({index = index, kind = row.kind, cols = row.cols, panel = panel})
            end
            return provider
        end

        local function ProcessSettings()
            if not _G.GwSettingsWindow or not _G.GwSettingsWindow.settingsTab or not _G.GwSettingsWindow.settingsTab.AddSettingsPanel then return end
            local menuItems = nil
            local i = 1
            while true do
                local name, val = debug.getupvalue(_G.GwSettingsWindowSettingsTabMixin.AddSettingsPanel, i)
                if not name then break end
                if name == "menuItems" then
                    menuItems = val
                    break
                end
                i = i + 1
            end
            
            if not menuItems then return end
            
            local hudPanel, unitframesPanel, hudGeneralFrame
            for _, main in ipairs(menuItems) do
                if main.subFrameData then
                    for _, sub in ipairs(main.subFrameData) do
                        if sub.frame then
                            if sub.frame.panelId == "hud_microbar" then
                                hudPanel = main
                            elseif sub.frame.panelId == "unitframes_general" then
                                unitframesPanel = main
                            elseif sub.frame.panelId == "hud_general" then
                                hudGeneralFrame = sub.frame
                            end
                        end
                    end
                end
            end
            
            if hudGeneralFrame and hudGeneralFrame.gwOptions then
                local optToRemove = {
                    HUD_BACKGROUND = true,
                    HUD_SPELL_SWAP = true,
                    XPBAR_ENABLED = true,
                    QUEST_XP_PERCENT = true
                }
                
                local kept = {}
                local removedAny = false
                for _, option in ipairs(hudGeneralFrame.gwOptions) do
                    if not optToRemove[option.optionName] then
                        kept[#kept + 1] = option
                    else
                        removedAny = true
                    end
                end
                
                if removedAny then
                    hudGeneralFrame.gwOptions = kept
                    local dp = hudGeneralFrame.scroll and hudGeneralFrame.scroll.ScrollBox and hudGeneralFrame.scroll.ScrollBox:GetDataProvider()
                    if dp then
                        local toRemoveRows = {}
                        dp:ForEach(function(row)
                            if row.cols then
                                local c1 = row.cols[1]
                                local c2 = row.cols[2]
                                if (c1 and optToRemove[c1.optionName]) or (c2 and optToRemove[c2.optionName]) then
                                    if c1 and c2 then
                                        if optToRemove[c1.optionName] and optToRemove[c2.optionName] then
                                            table.insert(toRemoveRows, row)
                                        elseif optToRemove[c1.optionName] then
                                            row.cols[1] = row.cols[2]
                                            row.cols[2] = nil
                                            local w1 = GW2_ADDON.FindSettingsWidgetByOption and GW2_ADDON.FindSettingsWidgetByOption(c1.optionName)
                                            if w1 then w1:Hide() end
                                        else
                                            row.cols[2] = nil
                                            local w2 = GW2_ADDON.FindSettingsWidgetByOption and GW2_ADDON.FindSettingsWidgetByOption(c2.optionName)
                                            if w2 then w2:Hide() end
                                        end
                                    else
                                        table.insert(toRemoveRows, row)
                                    end
                                end
                            end
                        end)
                        for _, r in ipairs(toRemoveRows) do
                            dp:Remove(r)
                            if r.cols then
                                for i=1,2 do
                                    if r.cols[i] then
                                        local w = GW2_ADDON.FindSettingsWidgetByOption and GW2_ADDON.FindSettingsWidgetByOption(r.cols[i].optionName)
                                        if w then w:Hide() end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            
            for _, main in ipairs(menuItems) do
                if main.subFrameData then
                    local toRemove = { 
                        player_general = true, player_castbar = true, player_aura = true, player_classpower = true,
                        hud_microbar = true, hud_minimap = true, hud_worldmap = true,
                        player_totem = true, player_fader = true
                    }
                    local newSubFrames = {}
                    for _, sub in ipairs(main.subFrameData) do
                        if sub.frame and toRemove[sub.frame.panelId] then
                            -- skip inserting to effectively remove from native menu
                        else
                            newSubFrames[#newSubFrames + 1] = sub
                        end
                    end
                    main.subFrameData = newSubFrames
                end
            end
            
            if _G.GwSettingsWindow.settingsTab.menu and _G.GwSettingsWindow.settingsTab.menu.ScrollBox then
                    local flatData = {}
                    for _, main in ipairs(menuItems) do
                        flatData[#flatData + 1] = { isSubCat = false, itemData = main }
                        if main.isExpanded and main.hasSubFrames then
                            for _, sub in ipairs(main.subFrameData) do
                                flatData[#flatData + 1] = { isSubCat = true, itemData = sub }
                            end
                        end
                    end
                    _G.GwSettingsWindow.settingsTab.menu.ScrollBox:SetDataProvider(CreateDataProvider(flatData), ScrollBoxConstants and ScrollBoxConstants.RetainScrollPosition or 1)
                end
        end
        ProcessSettings()
    end

    end)
else
    if not GW2_ADDON then
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: GW2_ADDON is nil!")
    elseif not GW2_ADDON.GetSettingsTabFrame then
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS: GetSettingsTabFrame is nil!")
    end
end
