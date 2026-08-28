local _, addonTable = ...

local ICON_PATH =
    "Interface/AddOns/GW2_UI_PLUS/Assets/icons/tabs/tabicon_addon.png"

local HOVER_TEXTURE =
    "Interface/AddOns/GW2_UI/textures/character/menu-hover.png"

local MENU_BACKGROUND =
    "Interface/AddOns/GW2_UI/textures/character/menu-bg.png"

local CHAT_PANEL_NAMES = {
    ["频道按钮"] = true,
    ["聊天窗口"] = true,
}

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
    tab.menu.ScrollBox:ClearAllPoints()
    tab.menu.ScrollBox:SetPoint("TOPLEFT", tab.menu, "TOPLEFT", 0, 0)
    tab.menu.ScrollBox:SetPoint("BOTTOMRIGHT", tab.menu, "BOTTOMRIGHT", 0, 10)

    local menuEntries = {}
    local currentFrame, currentState
    local RefreshMenu

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
        RefreshMenu()
    end

    local function AddMenuEntry(label, frame, children, parent)
        if not frame and not children then return end
        local index = #menuEntries + 1
        local entry = {
            frame = frame,
            label = label,
            index = index,
            children = children,
            parent = parent,
            expanded = false,
        }
        menuEntries[index] = entry
        return entry
    end

    local function InitializeMenuButton(button, entry)
        if entry.index % 2 == 1 then
            button:SetNormalTexture(MENU_BACKGROUND)
        else
            button:ClearNormalTexture()
        end
        if entry.children then
            button.arrow:ClearAllPoints()
            button.arrow:SetPoint("LEFT", 5, 0)
            button.arrow:SetTexture(
                "Interface/AddOns/GW2/textures/uistuff/arrow_right.png")
            button.arrow:SetSize(16, 16)
            button.arrow:SetRotation(entry.expanded and -1.5707 or 0)
            button.arrow:Show()
        else
            button.arrow:Hide()
        end
        button.text:ClearAllPoints()
        button.text:SetPoint(
            "LEFT", button, "LEFT", entry.parent and 30 or 20, 0)
        button.text:SetText(entry.label)
        button.hover:SetTexture(HOVER_TEXTURE)
        button.activeTexture:SetShown(entry.frame == currentFrame)
        button:SetScript("OnClick", function()
            if entry.children then
                entry.expanded = not entry.expanded
                if entry.expanded and entry.firstChild then
                    ShowPage(entry.firstChild.frame)
                else
                    RefreshMenu()
                end
            else
                ShowPage(entry.frame)
            end
        end)
    end

    -- 综合菜单必须固定为组件页首项。
    AddMenuEntry("综合", addonTable.PlusGeneralPanel)

    -- 微型系统菜单、微缩地图、世界地图（原生面板）
    if pages then
        AddMenuEntry("微型系统菜单", pages.hud_microbar)
        AddMenuEntry("微缩地图", pages.hud_minimap)
        AddMenuEntry("世界地图", pages.hud_worldmap)
    end

    -- 附加组件子面板
    if addonSubPanels then
        for _, entry in ipairs(addonSubPanels) do
            if not CHAT_PANEL_NAMES[entry.name] then
                local parent = AddMenuEntry(entry.name, entry.frame, entry.children)
                for _, child in ipairs(entry.children or {}) do
                    local childEntry = AddMenuEntry(
                        child.name, child.frame or child.panel, nil, parent)
                    if parent and not parent.firstChild then
                        parent.firstChild = childEntry
                    end
                end
            end
        end
    end

    local view = CreateScrollBoxListLinearView()
    view:SetElementExtentCalculator(function() return 36 end)
    view:SetElementInitializer(
        "GwSettingsSettingsTabMenuButtonTemplate", InitializeMenuButton)
    ScrollUtil.InitScrollBoxListWithScrollBar(
        tab.menu.ScrollBox, tab.menu.ScrollBar, view)
    local GW = _G.GW2_ADDON
    if GW then
        GW.HandleTrimScrollBar(tab.menu.ScrollBar)
        GW.HandleScrollControls(tab.menu)
    end
    tab.menu.ScrollBar:SetHideIfUnscrollable(true)

    RefreshMenu = function()
        local provider = CreateDataProvider()
        for _, entry in ipairs(menuEntries) do
            if not entry.parent or entry.parent.expanded then
                provider:Insert(entry)
            end
        end
        tab.menu.ScrollBox:SetDataProvider(
            provider, ScrollBoxConstants.RetainScrollPosition)
    end

    tab:SetScript("OnShow", function()
        if menuEntries[1] then ShowPage(menuEntries[1].frame) end
    end)
    tab.callbackOnClose = RestoreCurrent
    RefreshMenu()

    settingsWindow:AddTab(ICON_PATH, tab)
    table.insert(settingsWindow.tabs, tab)
    settingsWindow.gwPlusComponentsTab = tab
    tab:Hide()
end

addonTable.BuildComponentsTab = BuildComponentsTab
