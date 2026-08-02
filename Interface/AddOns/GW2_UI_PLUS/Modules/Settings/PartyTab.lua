local _, addonTable = ...

local ICON_PATH =
    "Interface/AddOns/GW2_UI_PLUS/Assets/icons/tabs/tabicon_raid.png"

local HOVER_TEXTURE =
    "Interface/AddOns/GW2_UI/textures/character/menu-hover.png"

local RAID_SUB_PANELS = {
    {name = "综合", panelId = "raid_general"},
    {name = "团队:40", panelId = "raid40"},
    {name = "团队:25", panelId = "raid25"},
    {name = "团队:10", panelId = "raid10"},
    {name = "团队:宠物", panelId = "raid_pet"},
    {name = "主坦克", panelId = "raid_maintank"},
    {name = "小队", panelId = "raid_party"},
    {name = "小队:宠物", panelId = "party_pet"},
}

local function BuildPartyTab(settingsTab, settingsWindow)
    if not settingsWindow or settingsWindow.gwPlusPartyTab then return end
    local pages = addonTable.PlusNativePages
    if not pages or not pages.party_general then return end

    local CaptureFrame = addonTable.CaptureFrame
    local RestoreFrame = addonTable.RestoreFrame
    if not CaptureFrame or not RestoreFrame then return end

    local tab = CreateFrame(
        "Frame", nil, settingsWindow, "GwSettingsSettingsTabTemplate")
    tab.name = "GwSettingsParty"
    tab.headerBreadcrumbText = "队伍"
    tab.menu.search:Hide()
    tab.menu.ScrollBox:Hide()
    tab.menu.ScrollBar:Hide()

    local menuEntries = {}
    local currentFrame, currentState
    local originalStates = {}
    local raidExpanded = false

    local function HideCurrent()
        if currentFrame and currentState then
            RestoreFrame(currentFrame, currentState)
            currentFrame:Hide()
        end
        currentFrame = nil
        currentState = nil
    end

    local function RestoreAll()
        HideCurrent()
        for frame, state in pairs(originalStates) do
            RestoreFrame(frame, state)
        end
        originalStates = {}
    end

    local function ShowPage(targetFrame)
        if not targetFrame then return end
        HideCurrent()
        local state = originalStates[targetFrame]
        if not state then
            state = CaptureFrame(targetFrame)
            originalStates[targetFrame] = state
        end
        currentFrame = targetFrame
        currentState = state
        targetFrame:Hide()
        targetFrame:SetParent(tab)
        targetFrame:ClearAllPoints()
        targetFrame:SetPoint("TOPLEFT", tab, "TOPLEFT", 0, 0)
        targetFrame:SetPoint("BOTTOMRIGHT", tab, "BOTTOMRIGHT", 0, 0)
        targetFrame:Show()
        for _, entry in ipairs(menuEntries) do
            entry.button.activeTexture:SetShown(entry.frame == targetFrame)
        end
    end

    local function SetPanelText(panel, header, breadcrumb, sub)
        if not panel then return end
        addonTable.SetPanelTitle(panel, header, breadcrumb)
        if panel.sub then
            panel.sub:SetText(sub)
        end
    end

    local function LayoutButtons()
        local yOffset = -8
        for _, entry in ipairs(menuEntries) do
            local visible = not entry.isRaidChild or raidExpanded
            entry.button:SetShown(visible)
            if visible then
                entry.button:ClearAllPoints()
                entry.button:SetPoint("TOPLEFT", tab.menu, "TOPLEFT", 0, yOffset)
                yOffset = yOffset - 36
            end
        end
        -- 更新团队父项箭头旋转
        if menuEntries[2] and menuEntries[2].button.arrow then
            menuEntries[2].button.arrow:SetRotation(raidExpanded and -1.5707 or 0)
        end
    end

    local function AddMenuEntry(label, frame, isRaidParent, isRaidChild)
        local index = #menuEntries + 1
        local button = CreateFrame(
            "Button", nil, tab.menu,
            "GwSettingsSettingsTabMenuButtonTemplate")
        button:SetSize(221, 36)
        button.text:SetPoint(
            "LEFT", button, "LEFT",
            20 + (isRaidChild and 10 or 0), 0)
        button.text:SetText(label)
        button.hover:SetTexture(HOVER_TEXTURE)

        if isRaidParent then
            button.arrow:ClearAllPoints()
            button.arrow:SetPoint("LEFT", 5, 0)
            button.arrow:SetTexture(
                "Interface/AddOns/GW2_UI/textures/uistuff/arrow_right.png")
            button.arrow:SetSize(16, 16)
            button.arrow:Show()
        else
            button.arrow:Hide()
        end

        local entry = {
            button = button,
            frame = frame,
            isRaidChild = isRaidChild
        }
        menuEntries[index] = entry

        button:SetScript("OnClick", function()
            if isRaidParent then
                raidExpanded = not raidExpanded
                LayoutButtons()
                -- 展开后自动选中"综合"面板
                if raidExpanded and menuEntries[3] and menuEntries[3].frame then
                    ShowPage(menuEntries[3].frame)
                end
            else
                ShowPage(frame)
            end
        end)
    end

    -- 队伍页下的第一个子菜单是小队。
    AddMenuEntry("小队", pages.party_general, false, false)

    -- 团队父项（无关联面板，仅用于展开/折叠）
    AddMenuEntry("团队", nil, true, false)

    -- 团队子面板
    for _, subPanel in ipairs(RAID_SUB_PANELS) do
        local frame = pages[subPanel.panelId]
        if frame then
            AddMenuEntry(subPanel.name, frame, false, true)
            SetPanelText(frame, "团队", subPanel.name, "编辑团队设置。")
        end
    end

    local partyPanel = pages.party_general
    SetPanelText(partyPanel, "小队", "", "编辑小队设置。")

    tab:SetScript("OnShow", function()
        ShowPage(pages.party_general)
    end)
    tab.callbackOnClose = RestoreAll

    LayoutButtons()

    settingsWindow:AddTab(ICON_PATH, tab)
    table.insert(settingsWindow.tabs, tab)
    settingsWindow.gwPlusPartyTab = tab
    tab:Hide()
end

addonTable.BuildPartyTab = BuildPartyTab
