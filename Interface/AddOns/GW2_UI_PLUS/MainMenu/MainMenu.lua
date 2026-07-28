-- GW2_UI_PLUS 单位框体设置标签
-- 复用 GW2_UI 原生的单位框体页面和设置项，不复制设置逻辑。

local _, addonTable = ...

local MAIN_MENU_ICON =
    "Interface/AddOns/GW2_UI/textures/uistuff/tabicon_profiles.png"

local REQUIRED_PAGE_IDS = {
    "player_general",
    "player_classpower",
    "player_aura",
    "target_general",
    "target_of_target",
    "player_pet",
    "party_general",
}

local PLAYER_PAGE_DEFINITIONS = {
    {"综合", "player_general"},
    {"状态条", "player_classpower"},
    {"增益光环", "player_buff_aura"},
    {"减益光环", "player_debuff_aura"},
}

local AURA_VIEW_DEFINITIONS = {
    player_buff_aura = {
        kind = "buff",
        group = "PlayerBuffs",
        breadcrumb = "增益光环",
        sub = "调整玩家增益光环。",
    },
    player_debuff_aura = {
        kind = "debuff",
        group = "PlayerDebuffs",
        breadcrumb = "减益光环",
        sub = "调整玩家减益光环。",
    },
}

local TAB_ORDER = {
    "GwSettingsUnitFrames",
    "GwSettingsActionBar",
    "GwSettingsSettings",
    "GwSettingsOverview",
    "GwSettingsProfilePanel",
}

local function RemoveArrayValue(list, value)
    if not list then return end
    for index = #list, 1, -1 do
        if list[index] == value then
            table.remove(list, index)
        end
    end
end

local function RemoveWidgetFromRegistry(widget)
    local registry = GW2_ADDON.SettingsWidgetRegistry
    local entry = widget and widget.__gwRegEntry
    if not registry or not entry then return end

    RemoveArrayValue(registry.list, entry)
    local bucket = registry.byPanel and registry.byPanel[entry.panel]
    if bucket then
        RemoveArrayValue(bucket.entries, entry)
    end
    if entry.optionName and registry.byOptionName then
        local entries = registry.byOptionName[entry.optionName]
        RemoveArrayValue(entries, entry)
        if entries and #entries == 0 then
            registry.byOptionName[entry.optionName] = nil
        end
    end
    widget.__gwRegEntry = nil
end

local function IsFaderOption(option, faderLabel)
    return option and (
        (option.optionType == "header" and option.name == faderLabel)
        or option.groupHeaderName == faderLabel)
end

local function HideEmbeddedFader(panel, faderLabel)
    if not panel or not panel.gwOptions then return end

    local hidden = {}
    local kept = {}
    for _, option in ipairs(panel.gwOptions) do
        if IsFaderOption(option, faderLabel) then
            hidden[option] = true
            if option.__widget then
                option.__widget:Hide()
                RemoveWidgetFromRegistry(option.__widget)
            end
        else
            kept[#kept + 1] = option
        end
    end
    panel.gwOptions = kept

    local scrollBox = panel.scroll and panel.scroll.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not provider then return end

    local filtered = CreateDataProvider()
    local rowIndex = 0
    provider:ForEach(function(data)
        local cols = {}
        for _, option in ipairs(data.cols or {}) do
            if not hidden[option] then
                cols[#cols + 1] = option
            end
        end
        if data.kind or #cols > 0 then
            rowIndex = rowIndex + 1
            filtered:Insert({
                index = rowIndex,
                kind = data.kind,
                cols = data.kind and data.cols or cols,
                panel = data.panel,
            })
        end
    end)
    scrollBox:SetDataProvider(
        filtered, ScrollBoxConstants.RetainScrollPosition)
end

local function MergeTargetOfTargetSettings(
    targetPanel, targetOfTargetPanel, faderLabel)
    if not targetPanel or not targetOfTargetPanel
        or targetPanel.__gwPlusTargetOfTargetMerged then
        return
    end

    local targetScrollBox = targetPanel.scroll
        and targetPanel.scroll.ScrollBox
    local targetProvider = targetScrollBox
        and targetScrollBox:GetDataProvider()
    local sourceScrollBox = targetOfTargetPanel.scroll
        and targetOfTargetPanel.scroll.ScrollBox
    local sourceProvider = sourceScrollBox
        and sourceScrollBox:GetDataProvider()
    if not targetProvider or not sourceProvider then return end

    targetPanel.gwOptions = targetPanel.gwOptions or {}
    for _, option in ipairs(targetOfTargetPanel.gwOptions or {}) do
        if not IsFaderOption(option, faderLabel) then
            targetPanel.gwOptions[#targetPanel.gwOptions + 1] = option
        end
    end

    local merged = CreateDataProvider()
    local rowIndex = 0
    targetProvider:ForEach(function(data)
        rowIndex = rowIndex + 1
        merged:Insert({
            index = rowIndex,
            kind = data.kind,
            cols = data.cols,
            panel = targetPanel,
        })
    end)
    sourceProvider:ForEach(function(data)
        local cols = {}
        for _, option in ipairs(data.cols or {}) do
            if not IsFaderOption(option, faderLabel) then
                cols[#cols + 1] = option
            end
        end
        if data.kind or #cols > 0 then
            rowIndex = rowIndex + 1
            merged:Insert({
                index = rowIndex,
                kind = data.kind,
                cols = data.kind and data.cols or cols,
                panel = targetPanel,
            })
        end
    end)

    targetScrollBox:SetDataProvider(
        merged, ScrollBoxConstants.RetainScrollPosition)
    targetPanel.__gwPlusTargetOfTargetMerged = true
end

local function CopyMap(source)
    if not source then return nil end
    local copy = {}
    for key, value in pairs(source) do
        copy[key] = value
    end
    return copy
end

local function SetOptionDependencies(option, dependencies)
    option.dependence = CopyMap(dependencies)
    if option.__widget then
        option.__widget.dependence = CopyMap(dependencies)
    end
end

local function BuildAuraView(panel, toggle, definition)
    local wanted = {}
    local groupName
    local prefix = definition.group .. "."

    for _, option in ipairs(panel.__gwPlusAuraOriginalOptions) do
        local optionName = option.optionName
        if optionName
            and optionName:sub(1, #prefix) == prefix then
            wanted[option] = true
            groupName = groupName or option.groupHeaderName
        end
    end
    for _, option in ipairs(panel.__gwPlusAuraOriginalOptions) do
        if option.optionType == "header"
            and option.name == groupName then
            wanted[option] = true
        end
    end

    local viewOptions = {toggle}
    for _, option in ipairs(panel.__gwPlusAuraOriginalOptions) do
        if wanted[option] then
            viewOptions[#viewOptions + 1] = option
        end
    end

    local filtered = CreateDataProvider()
    local rowIndex = 1
    filtered:Insert({
        index = rowIndex,
        cols = {toggle},
        panel = panel,
    })
    rowIndex = rowIndex + 1
    filtered:Insert({
        index = rowIndex,
        kind = "masterToggleSeparator",
        panel = panel,
    })

    panel.__gwPlusAuraOriginalProvider:ForEach(function(data)
        if data.kind then return end

        local cols = {}
        for _, option in ipairs(data.cols or {}) do
            if wanted[option] then
                cols[#cols + 1] = option
            end
        end
        if #cols > 0 then
            rowIndex = rowIndex + 1
            filtered:Insert({
                index = rowIndex,
                cols = cols,
                panel = panel,
            })
        end
    end)

    return {
        provider = filtered,
        options = viewOptions,
        nativeOptions = wanted,
    }
end

local function PreparePlayerAuraPanel(panel)
    if not panel or panel.__gwPlusAuraPrepared then return end

    local auras = addonTable.PlusPlayerAuras
    local scrollBox = panel.scroll and panel.scroll.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not auras or not provider then return end

    panel.__gwPlusAuraOriginalProvider = provider
    panel.__gwPlusAuraOriginalOptions = {}
    panel.__gwPlusAuraOriginalDependencies = {}
    for _, option in ipairs(panel.gwOptions or {}) do
        panel.__gwPlusAuraOriginalOptions[
            #panel.__gwPlusAuraOriginalOptions + 1] = option
        panel.__gwPlusAuraOriginalDependencies[option] =
            CopyMap(option.dependence) or false
    end
    panel.__gwPlusAuraOriginalBreadcrumb =
        panel.breadcrumb:GetText()
    panel.__gwPlusAuraOriginalSub = panel.sub:GetText()

    local toggles = {
        buff = auras.CreateToggleOption(panel, "buff"),
        debuff = auras.CreateToggleOption(panel, "debuff"),
    }
    panel.__gwPlusAuraViews = {
        buff = BuildAuraView(
            panel, toggles.buff,
            AURA_VIEW_DEFINITIONS.player_buff_aura),
        debuff = BuildAuraView(
            panel, toggles.debuff,
            AURA_VIEW_DEFINITIONS.player_debuff_aura),
    }
    panel.__gwPlusAuraPrepared = true
end

local function ShowPlayerAuraPanelView(panel, definition)
    PreparePlayerAuraPanel(panel)
    if not panel or not panel.__gwPlusAuraViews then return end

    local view = panel.__gwPlusAuraViews[definition.kind]
    local dependencyKey = definition.kind == "buff"
        and "playerBuffAurasEnabled"
        or "playerDebuffAurasEnabled"
    for option in pairs(view.nativeOptions) do
        local original =
            panel.__gwPlusAuraOriginalDependencies[option]
        local dependencies = original == false
            and nil or CopyMap(original)
        if dependencies
            and dependencies.PLAYER_BUFFS_ENABLED ~= nil then
            local expected = dependencies.PLAYER_BUFFS_ENABLED
            dependencies.PLAYER_BUFFS_ENABLED = nil
            dependencies[dependencyKey] = expected
        end
        SetOptionDependencies(option, dependencies)
    end

    panel.gwOptions = view.options
    panel.scroll.ScrollBox:SetDataProvider(
        view.provider, ScrollBoxConstants.RetainScrollPosition)
    panel.breadcrumb:SetText(definition.breadcrumb)
    panel.sub:SetText(definition.sub)
    if GW2_ADDON.CheckDependencies then
        GW2_ADDON.CheckDependencies()
    end
end

local function RestorePlayerAuraPanel(panel)
    if not panel or not panel.__gwPlusAuraPrepared then return end

    for option, original in pairs(
        panel.__gwPlusAuraOriginalDependencies) do
        SetOptionDependencies(
            option, original == false and nil or original)
    end
    panel.gwOptions = panel.__gwPlusAuraOriginalOptions
    panel.scroll.ScrollBox:SetDataProvider(
        panel.__gwPlusAuraOriginalProvider,
        ScrollBoxConstants.RetainScrollPosition)
    panel.breadcrumb:SetText(
        panel.__gwPlusAuraOriginalBreadcrumb)
    panel.sub:SetText(panel.__gwPlusAuraOriginalSub)
    if GW2_ADDON.CheckDependencies then
        GW2_ADDON.CheckDependencies()
    end
end

local function PrepareUnitFrameSettings(settingsTab)
    local scrollBox = settingsTab and settingsTab.menu
        and settingsTab.menu.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not provider then return end

    local embeddedPanels = {}
    local filtered = CreateDataProvider()
    provider:ForEach(function(data)
        local frame = data.isSubCat and data.itemData
            and data.itemData.frame
        if frame and (frame.panelId == "player_general"
            or frame.panelId == "player_classpower"
            or frame.panelId == "player_castbar"
            or frame.panelId == "player_aura"
            or frame.panelId == "target_general"
            or frame.panelId == "target_of_target"
            or frame.panelId == "player_pet") then
            embeddedPanels[frame.panelId] = frame
        end
        if frame and frame.panelId == "player_fader" then
            if GW2_ADDON.SettingsWidgetRegistry
                and GW2_ADDON.SettingsWidgetRegistry.byPanel then
                GW2_ADDON.SettingsWidgetRegistry.byPanel[frame] = nil
            end
        else
            filtered:Insert(data)
        end
    end)
    scrollBox:SetDataProvider(
        filtered, ScrollBoxConstants.RetainScrollPosition)

    local faderLabel = GW2_ADDON.L and GW2_ADDON.L["Fader"]
        or "隐藏器"
    HideEmbeddedFader(embeddedPanels.target_general, faderLabel)
    HideEmbeddedFader(embeddedPanels.player_pet, faderLabel)
    MergeTargetOfTargetSettings(
        embeddedPanels.target_general,
        embeddedPanels.target_of_target,
        faderLabel)
    PreparePlayerAuraPanel(embeddedPanels.player_aura)
    if addonTable.PreparePlayerResourcePanel then
        local panel = addonTable.PreparePlayerResourcePanel(
            embeddedPanels.player_general,
            embeddedPanels.player_classpower,
            embeddedPanels.player_castbar)
        if panel then
            settingsTab.gwPlusPlayerStatusPanel = panel
        end
    end
end

addonTable.PrepareUnitFrameSettings = PrepareUnitFrameSettings

local function FindNativePages(settingsTab)
    local found = {}
    local scrollBox = settingsTab and settingsTab.menu
        and settingsTab.menu.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not provider then return end

    provider:ForEach(function(data)
        local frame = data.isSubCat and data.itemData
            and data.itemData.frame
        if frame and frame.panelId then
            found[frame.panelId] = frame
        end
    end)

    if settingsTab.gwPlusPlayerStatusPanel then
        found.player_classpower = settingsTab.gwPlusPlayerStatusPanel
    end

    for _, panelId in ipairs(REQUIRED_PAGE_IDS) do
        if not found[panelId] then return end
    end
    return found
end

local function CaptureFrame(frame)
    local state = {
        parent = frame:GetParent(),
        shown = frame:IsShown(),
        points = {},
    }
    for index = 1, frame:GetNumPoints() do
        state.points[index] = {frame:GetPoint(index)}
    end
    return state
end

local function RestoreFrame(frame, state)
    frame:Hide()
    frame:SetParent(state.parent)
    frame:ClearAllPoints()
    for _, point in ipairs(state.points) do
        frame:SetPoint(unpack(point))
    end
    frame:SetShown(state.shown)
end

local function BuildMainMenuTab(settingsTab, settingsWindow)
    if not settingsWindow or settingsWindow.gwPlusMainMenuTab then return end

    local pages = FindNativePages(settingsTab)
    if not pages then
        if DEFAULT_CHAT_FRAME then
            DEFAULT_CHAT_FRAME:AddMessage(
                "GW2_UI_PLUS: 框体未找到完整的原生设置页面。")
        end
        return
    end

    local tab = CreateFrame(
        "Frame", nil, settingsWindow, "GwSettingsSettingsTabTemplate")
    tab.name = "GwSettingsUnitFrames"
    tab.headerBreadcrumbText = "框体"
    tab.menu.search:Hide()
    tab.menu.ScrollBox:Hide()
    tab.menu.ScrollBar:Hide()

    local menuEntries = {}
    local currentFrame
    local currentState
    local currentAuraPanel
    local selectedPanelId = "player_general"
    local playerExpanded = true

    local function RestoreCurrent()
        if currentAuraPanel then
            RestorePlayerAuraPanel(currentAuraPanel)
            currentAuraPanel = nil
        end
        if currentFrame and currentState then
            RestoreFrame(currentFrame, currentState)
        end
        currentFrame = nil
        currentState = nil
    end

    local function LayoutButtons()
        local visibleIndex = 0
        for _, entry in ipairs(menuEntries) do
            local visible = not entry.isPlayerChild or playerExpanded
            entry.button:SetShown(visible)
            if visible then
                entry.button:ClearAllPoints()
                entry.button:SetPoint(
                    "TOPLEFT", tab.menu, "TOPLEFT",
                    0, -8 - (visibleIndex * 36))
                visibleIndex = visibleIndex + 1
            end
        end

        local playerEntry = menuEntries[1]
        if playerEntry then
            playerEntry.button.arrow:SetRotation(
                playerExpanded and -1.5707 or 0)
        end
    end

    local function ResolvePage(panelId)
        local auraView = AURA_VIEW_DEFINITIONS[panelId]
        return auraView and pages.player_aura
            or pages[panelId], auraView
    end

    local function SelectPage(panelId)
        RestoreCurrent()
        selectedPanelId = panelId
        playerExpanded = panelId == "player_general"
            or panelId == "player_classpower"
            or panelId == "player_buff_aura"
            or panelId == "player_debuff_aura"

        local frame, auraView = ResolvePage(panelId)
        currentFrame = frame
        currentState = CaptureFrame(frame)

        frame:Hide()
        frame:SetParent(tab)
        frame:ClearAllPoints()
        frame:SetPoint("TOPLEFT", tab, "TOPLEFT", 0, 0)
        frame:SetPoint("BOTTOMRIGHT", tab, "BOTTOMRIGHT", 0, 0)
        if auraView then
            ShowPlayerAuraPanelView(frame, auraView)
            currentAuraPanel = frame
        end
        frame:Show()

        for _, entry in ipairs(menuEntries) do
            entry.button.activeTexture:SetShown(
                entry.panelId == panelId)
        end
        LayoutButtons()
    end

    local function CreateMenuButton(
        text, panelId, isPlayerParent, isPlayerChild)
        local button = CreateFrame(
            "Button", nil, tab.menu,
            "GwSettingsSettingsTabMenuButtonTemplate")
        button:SetSize(221, 36)
        button.text:SetPoint(
            "LEFT", button, "LEFT",
            20 + (isPlayerChild and 10 or 0), 0)
        button.text:SetText(text)
        button.hover:SetTexture(
            "Interface/AddOns/GW2_UI/textures/character/menu-hover.png")

        if isPlayerParent then
            button.arrow:ClearAllPoints()
            button.arrow:SetPoint("LEFT", 5, 0)
            button.arrow:SetTexture(
                "Interface/AddOns/GW2_UI/textures/uistuff/arrow_right.png")
            button.arrow:SetSize(16, 16)
            button.arrow:Show()
        else
            button.arrow:Hide()
        end

        button:SetScript("OnClick", function()
            if isPlayerParent then
                SelectPage("player_general")
            else
                SelectPage(panelId)
            end
        end)

        menuEntries[#menuEntries + 1] = {
            button = button,
            panelId = panelId,
            isPlayerChild = isPlayerChild,
        }
    end

    CreateMenuButton("玩家", nil, true, false)
    for _, definition in ipairs(PLAYER_PAGE_DEFINITIONS) do
        CreateMenuButton(definition[1], definition[2], false, true)
    end
    CreateMenuButton("目标", "target_general", false, false)
    CreateMenuButton("宠物", "player_pet", false, false)
    CreateMenuButton("小队", "party_general", false, false)

    tab:SetScript("OnShow", function()
        SelectPage(selectedPanelId)
    end)
    tab.callbackOnClose = RestoreCurrent

    settingsWindow:AddTab(MAIN_MENU_ICON, tab)
    local tabButton = settingsWindow.tabButtons[#settingsWindow.tabButtons]
    if tabButton and tabButton.icon then
        tabButton.icon:SetTexCoord(0.505, 1, 0, 0.625)
    end
    table.insert(settingsWindow.tabs, tab)
    settingsWindow.gwPlusMainMenuTab = tab
    tab:Hide()
end

addonTable.BuildMainMenuTab = BuildMainMenuTab

local function ArrangeSettingsTabs(settingsWindow)
    if not settingsWindow or not settingsWindow.tabButtons then return end

    local byName = {}
    for _, button in ipairs(settingsWindow.tabButtons) do
        byName[button.panelName] = button
    end

    local ordered = {}
    local included = {}
    for _, panelName in ipairs(TAB_ORDER) do
        local button = byName[panelName]
        if button then
            ordered[#ordered + 1] = button
            included[button] = true
        end
    end
    for _, button in ipairs(settingsWindow.tabButtons) do
        if not included[button] then
            ordered[#ordered + 1] = button
        end
    end

    settingsWindow.tabButtons = ordered
    for index, button in ipairs(ordered) do
        button:ClearAllPoints()
        button:SetPoint(
            "TOPRIGHT", settingsWindow.tabBar, "TOPRIGHT",
            1, -32 + (-40 * (index - 1)))
    end
end

addonTable.ArrangeSettingsTabs = ArrangeSettingsTabs
