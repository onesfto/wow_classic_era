local _, addonTable = ...

local ICON_PATH =
    "Interface/AddOns/GW2_UI_PLUS/Assets/icons/tabs/tabicon_chat.png"

local HOVER_TEXTURE =
    "Interface/AddOns/GW2_UI/textures/character/menu-hover.png"

local function SetPanelTitle(panel, breadcrumb)
    if not panel then return end
    addonTable.SetPanelTitle(panel, "聊天", breadcrumb)
end

local function BuildChatTab(settingsTab, settingsWindow)
    if not settingsWindow or settingsWindow.gwPlusChatTab then return end

    local pages = addonTable.PlusNativePages
    local sourcePanels = addonTable.PlusChatPanels
    local BuildChatCategoryPanels = addonTable.BuildChatCategoryPanels
    if not pages or not pages.chat_general or not sourcePanels
        or not sourcePanels.chatBar or not sourcePanels.chatWindow
        or not BuildChatCategoryPanels then
        return
    end

    local CaptureFrame = addonTable.CaptureFrame
    local RestoreFrame = addonTable.RestoreFrame
    if not CaptureFrame or not RestoreFrame then return end

    local chatPanels = BuildChatCategoryPanels(
        pages.chat_general, sourcePanels.chatWindow, sourcePanels.chatBar)
    if not chatPanels or not chatPanels.enhancement
        or not chatPanels.layout or not chatPanels.chatBar
        or not chatPanels.messages then
        return
    end

    local tab = CreateFrame(
        "Frame", nil, settingsWindow, "GwSettingsSettingsTabTemplate")
    tab.name = "GwSettingsChat"
    tab.headerBreadcrumbText = "聊天"
    tab.menu.search:Hide()
    tab.menu.ScrollBox:Hide()
    tab.menu.ScrollBar:Hide()

    local menuEntries = {}
    local currentFrame, currentState

    local function RestoreCurrent()
        if currentFrame and currentState then
            RestoreFrame(currentFrame, currentState)
        end
        currentFrame = nil
        currentState = nil
    end

    local function ShowPage(targetFrame)
        if not targetFrame then return end
        RestoreCurrent()
        currentFrame = targetFrame
        currentState = CaptureFrame(targetFrame)
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

    local function AddMenuEntry(label, frame)
        local index = #menuEntries + 1
        local button = CreateFrame(
            "Button", nil, tab.menu,
            "GwSettingsSettingsTabMenuButtonTemplate")
        button:SetSize(221, 36)
        button:SetPoint("TOPLEFT", tab.menu, "TOPLEFT", 0, -8 - ((index - 1) * 36))
        button.text:SetPoint("LEFT", button, "LEFT", 20, 0)
        button.text:SetText(label)
        button.hover:SetTexture(HOVER_TEXTURE)
        button.arrow:Hide()
        button:SetScript("OnClick", function() ShowPage(frame) end)

        menuEntries[index] = {button = button, frame = frame}
    end

    SetPanelTitle(chatPanels.enhancement, "聊天增强")
    SetPanelTitle(chatPanels.layout, "窗口布局")
    SetPanelTitle(chatPanels.chatBar, "频道按钮")
    SetPanelTitle(chatPanels.messages, "消息管理")

    AddMenuEntry("聊天增强", chatPanels.enhancement)
    AddMenuEntry("窗口布局", chatPanels.layout)
    AddMenuEntry("频道按钮", chatPanels.chatBar)
    AddMenuEntry("消息管理", chatPanels.messages)

    tab:SetScript("OnShow", function()
        ShowPage(chatPanels.enhancement)
    end)
    tab.callbackOnClose = RestoreCurrent

    settingsWindow:AddTab(ICON_PATH, tab)
    table.insert(settingsWindow.tabs, tab)
    settingsWindow.gwPlusChatTab = tab
    tab:Hide()
end

addonTable.BuildChatTab = BuildChatTab
