local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local MOVE_LABEL = NPE_MOVE or "移动"
local REFRESH_INTERVAL = 0.1
local COMPACT_PANEL_WIDTH = 240
local EXPANDED_PANEL_WIDTH = 480
local SETTINGS_REGION_WIDTH = 240
local MOVER_CONTENT_WIDTH = 220
local MOVER_TITLE_WIDTH = 200
local MOVER_SLIDER_WIDTH = 170
local LAYOUT_REGION_WIDTH = 240
local LAYOUT_CONTENT_WIDTH = 220
local LAYOUT_DESC_WIDTH = LAYOUT_CONTENT_WIDTH
local LAYOUT_DROPDOWN_WIDTH = LAYOUT_REGION_WIDTH - 30
local LAYOUT_BUTTON_WIDTH = 104
local FILTER_LABEL_WIDTH = 50
local elapsedSinceRefresh = 0

local function GetCoordinateWidgets()
    local container = GW.MoveHudScaleableFrame
    local settings = container and container.moverSettingsFrame
    local options = settings and settings.options
    local movers = options and options.movers
    return settings, movers, movers and movers.title
end

local function ApplyEditModePanelWidth()
    local container = GW.MoveHudScaleableFrame
    if not container then return end

    local width = container.layoutViewShown
        and EXPANDED_PANEL_WIDTH or COMPACT_PANEL_WIDTH
    container:SetWidth(width)
    if container.moverFrame then
        container.moverFrame:SetWidth(width)
    end

    local settings = container.moverSettingsFrame
    if settings then
        settings:SetWidth(SETTINGS_REGION_WIDTH)

        local options = settings.options
        if options then
            options:SetWidth(MOVER_CONTENT_WIDTH)
            for _, key in ipairs({"scaleSlider", "heightSlider", "movers", "default"}) do
                local row = options[key]
                if row then
                    row:SetWidth(MOVER_CONTENT_WIDTH)
                    if row.title then row.title:SetWidth(MOVER_TITLE_WIDTH) end
                end
            end
            for _, key in ipairs({"scaleSlider", "heightSlider"}) do
                local row = options[key]
                if row and row.slider then
                    row.slider:SetWidth(MOVER_SLIDER_WIDTH)
                end
            end
        end

        local defaultButtons = settings.defaultButtons
        if defaultButtons then
            defaultButtons:SetWidth(MOVER_CONTENT_WIDTH)
            if defaultButtons.seperator then
                defaultButtons.seperator:SetWidth(MOVER_CONTENT_WIDTH)
            end
            if defaultButtons.tagDropdown then
                defaultButtons.tagDropdown:SetWidth(
                    MOVER_CONTENT_WIDTH - FILTER_LABEL_WIDTH)
                if defaultButtons.tagDropdown.title then
                    defaultButtons.tagDropdown.title:SetWidth(FILTER_LABEL_WIDTH)
                    if defaultButtons.tagDropdown.title.SetNonSpaceWrap then
                        defaultButtons.tagDropdown.title:SetNonSpaceWrap(false)
                    end
                    if defaultButtons.tagDropdown.title.SetWordWrap then
                        defaultButtons.tagDropdown.title:SetWordWrap(false)
                    end
                end
            end
            for _, key in ipairs({"hidePlaceholder", "showGrid", "lockHud", "gridSlider"}) do
                if defaultButtons[key] then
                    defaultButtons[key]:SetWidth(MOVER_CONTENT_WIDTH)
                end
            end
        end
    end

    local layoutView = container.layoutView
    if layoutView then
        layoutView:SetWidth(LAYOUT_REGION_WIDTH)
        layoutView:ClearAllPoints()
        layoutView:SetPoint(
            "TOPLEFT", container, "TOPLEFT", SETTINGS_REGION_WIDTH, 0)
        if layoutView.desc then
            layoutView.desc:SetWidth(LAYOUT_DESC_WIDTH)
        end
        if layoutView.savedLayoutDropDown then
            layoutView.savedLayoutDropDown:SetWidth(LAYOUT_DROPDOWN_WIDTH)
        end
        if layoutView.specsDropDown then
            layoutView.specsDropDown:SetWidth(LAYOUT_CONTENT_WIDTH)
        end
        for _, key in ipairs({"new", "delete"}) do
            if layoutView[key] then
                layoutView[key]:SetWidth(LAYOUT_BUTTON_WIDTH)
            end
        end
    end

    if container.seperator then
        container.seperator:ClearAllPoints()
        container.seperator:SetPoint(
            "TOPLEFT", container, "TOPLEFT", SETTINGS_REGION_WIDTH, 0)
    end
end

local function ScheduleEditModePanelWidth()
    if C_Timer and C_Timer.After then
        C_Timer.After(0, ApplyEditModePanelWidth)
    else
        ApplyEditModePanelWidth()
    end
end

local function SetupEditModePanelWidth()
    local container = GW.MoveHudScaleableFrame
    if not container then return end

    if not container.gwPlusPanelWidthHooked then
        container.gwPlusPanelWidthHooked = true
        if container.layoutToggle and container.layoutToggle.HookScript then
            container.layoutToggle:HookScript(
                "OnClick", ScheduleEditModePanelWidth)
        end
        if GW.moveHudObjects then
            hooksecurefunc(GW, "moveHudObjects",
                ScheduleEditModePanelWidth)
        end
    end

    ApplyEditModePanelWidth()
end

local function UpdateEditModeMoverCoordinates()
    local settings, _, title = GetCoordinateWidgets()
    local mover = settings and settings.childMover
    if not mover or not title or not mover.GetPoint then return end

    local _, _, _, x, y = mover:GetPoint()
    if type(x) ~= "number" or type(y) ~= "number" then return end

    x = GW.RoundInt and GW.RoundInt(x) or math.floor(x + 0.5)
    y = GW.RoundInt and GW.RoundInt(y) or math.floor(y + 0.5)
    local text = string.format("%s  X: %d  Y: %d", MOVE_LABEL, x, y)
    if not title.GetText or title:GetText() ~= text then
        title:SetText(text)
    end
end

local function HookRefresh(target, scriptName, marker)
    if not target or not target.HookScript or target[marker] then return end
    target[marker] = true
    target:HookScript(scriptName, UpdateEditModeMoverCoordinates)
end

local function SetupEditModeMoverCoordinates()
    SetupEditModePanelWidth()
    local settings, movers = GetCoordinateWidgets()
    if not settings or not movers then return end

    if not movers.gwPlusCoordinateUpdateHooked then
        movers.gwPlusCoordinateUpdateHooked = true
        movers:HookScript("OnUpdate", function(_, elapsed)
            if not settings.childMover then return end
            elapsedSinceRefresh = elapsedSinceRefresh + elapsed
            if elapsedSinceRefresh < REFRESH_INTERVAL then return end
            elapsedSinceRefresh = 0
            UpdateEditModeMoverCoordinates()
        end)
    end

    HookRefresh(settings.options.default, "OnClick",
        "gwPlusCoordinateClickHooked")
    for _, button in ipairs({movers.left, movers.right, movers.up, movers.down}) do
        HookRefresh(button, "OnClick", "gwPlusCoordinateClickHooked")
    end
    for _, mover in ipairs(GW.MOVABLE_FRAMES or {}) do
        HookRefresh(mover, "OnClick", "gwPlusCoordinateClickHooked")
        HookRefresh(mover, "OnDragStop", "gwPlusCoordinateDragHooked")
    end

    UpdateEditModeMoverCoordinates()
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    SetupEditModeMoverCoordinates()
end)

addonTable.UpdateEditModeMoverCoordinates = UpdateEditModeMoverCoordinates
addonTable.SetupEditModeMoverCoordinates = SetupEditModeMoverCoordinates
