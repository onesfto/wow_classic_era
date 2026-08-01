local _, addonTable = ...

local ICON_PATH =
    "Interface/AddOns/GW2_UI_PLUS/Assets/icons/tabs/tabicon_addon.png"

local HOVER_TEXTURE =
    "Interface/AddOns/GW2_UI/textures/character/menu-hover.png"

local MENU_BACKGROUND =
    "Interface/AddOns/GW2_UI/textures/character/menu-bg.png"

local function BuildComponentsTab(settingsTab, settingsWindow)
    if not settingsWindow or settingsWindow.gwPlusComponentsTab then return end

    local CaptureFrame = addonTable.CaptureFrame
    local RestoreFrame = addonTable.RestoreFrame
    if not CaptureFrame or not RestoreFrame then return end

    local pages = addonTable.PlusNativePages
    local addonSubPanels = addonTable.PlusAddonSubPanels

    local tab = CreateFrame(
        "Frame", nil, settingsWindow, "GwSettingsSettingsTabTemplate")
    tab.name = "GwSettingsComponents"
    tab.headerBreadcrumbText = "组件"
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
        if not frame then return end
        local index = #menuEntries + 1
        local button = CreateFrame(
            "Button", nil, tab.menu,
            "GwSettingsSettingsTabMenuButtonTemplate")
        button:SetSize(221, 36)
        button:SetPoint(
            "TOPLEFT", tab.menu, "TOPLEFT",
            0, -8 - (index - 1) * 36)
        if index % 2 == 1 then
            button:SetNormalTexture(MENU_BACKGROUND)
        else
            button:ClearNormalTexture()
        end
        button.arrow:Hide()
        button.text:SetPoint("LEFT", button, "LEFT", 20, 0)
        button.text:SetText(label)
        button.hover:SetTexture(HOVER_TEXTURE)
        local entry = {button = button, frame = frame}
        menuEntries[index] = entry
        button:SetScript("OnClick", function() ShowPage(frame) end)
    end

    -- 微型系统菜单、微缩地图、世界地图（原生面板）
    if pages then
        AddMenuEntry("微型系统菜单", pages.hud_microbar)
        AddMenuEntry("微缩地图", pages.hud_minimap)
        AddMenuEntry("世界地图", pages.hud_worldmap)
    end

    -- 附加组件子面板
    if addonSubPanels then
        for _, entry in ipairs(addonSubPanels) do
            AddMenuEntry(entry.name, entry.frame)
        end
    end

    tab:SetScript("OnShow", function()
        if menuEntries[1] then ShowPage(menuEntries[1].frame) end
    end)
    tab.callbackOnClose = RestoreCurrent

    settingsWindow:AddTab(ICON_PATH, tab)
    table.insert(settingsWindow.tabs, tab)
    settingsWindow.gwPlusComponentsTab = tab
    tab:Hide()
end

addonTable.BuildComponentsTab = BuildComponentsTab
