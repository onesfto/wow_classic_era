-- GW2_UI_PLUS 小地图插件悬浮按钮
-- 独立保存和控制，不读取 GW2_UI 的小地图启用状态。

local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local Flyout = {}
addonTable.MinimapAddonFlyout = Flyout
_G.GW2Plus_MinimapAddonFlyout = Flyout

local unpackValues = unpack or table.unpack
local managedButtons = {}
local buttonStates = {}
local pendingRefresh = false

local ignoreButtonLookup = {
    GameTimeFrame = true,
    HelpOpenWebTicketButton = true,
    MiniMapVoiceChatFrame = true,
    TimeManagerClockButton = true,
    BattlefieldMinimap = true,
    ButtonCollectFrame = true,
    QueueStatusMinimapButton = true,
    GarrisonLandingPageMinimapButton = true,
    MiniMapMailFrame = true,
    MiniMapTracking = true,
    MinimapZoomIn = true,
    MinimapZoomOut = true,
    RecipeRadarMinimapButtonFrame = true,
    InstanceDifficultyFrame = true,
    GwMapFPS = true,
    GwMapCoords = true,
    GwMapTime = true,
    GwMiniMapTrackingFrame = true,
}

local genericIgnore = {
    "Archy",
    "GatherMatePin",
    "GatherNote",
    "GuildInstance",
    "HandyNotesPin",
    "MiniMap",
    "Spy_MapNoteList_mini",
    "ZGVMarker",
    "poiMinimap",
    "GuildMap3Mini",
    "LibRockConfig-1.0_MinimapButton",
    "NauticusMiniIcon",
    "WestPointer",
    "Cork",
    "DugisArrowMinimapPoint",
    "QuestieFrame",
    "ElvConfigToggle",
}

local partialIgnore = {
    "Node",
    "Note",
    "Pin",
    "POI",
    "TTMinimapButton",
}

local removeTextureID = {
    [136430] = true,
    [136467] = true,
    [136468] = true,
    [130924] = true,
    [136477] = true,
}

local removeTextureFile = {
    ["interface/minimap/minimap-trackingborder"] = true,
    ["interface/minimap/ui-minimap-border"] = true,
    ["interface/minimap/ui-minimap-background"] = true,
}

local function IsIgnoredTexture(texture)
    if not texture or texture == "" then return false end

    local lower = tostring(texture):lower():gsub("\\", "/")
    if removeTextureFile[lower] then return true end

    return lower:find("interface/characterframe", 1, true)
        or (lower:find("interface/minimap", 1, true)
            and not lower:find(
                "interface/minimap/tracking/", 1, true))
        or lower:find("border", 1, true)
        or lower:find("background", 1, true)
        or lower:find("alphamask", 1, true)
        or lower:find("highlight", 1, true)
end

local lockedMethods = {
    "SetParent",
    "ClearAllPoints",
    "SetPoint",
    "SetSize",
    "SetScale",
    "SetFrameStrata",
    "SetFrameLevel",
}

local function IsBlocked()
    return InCombatLockdown()
        or (C_PetBattles and C_PetBattles.IsInBattle())
end

local driver = CreateFrame("Frame")

local function QueueRefresh()
    pendingRefresh = true
    driver:RegisterEvent("PLAYER_REGEN_ENABLED")
    driver:RegisterEvent("PET_BATTLE_CLOSE")
end

local function CapturePoints(button)
    local points = {}
    for index = 1, button:GetNumPoints() do
        points[index] = {button:GetPoint(index)}
    end
    return points
end

local function RestoreMethods(button, state)
    for _, methodName in ipairs(lockedMethods) do
        button[methodName] = state.methods[methodName]
    end
end

local function LockMethods(button)
    for _, methodName in ipairs(lockedMethods) do
        button[methodName] = GW.NoOp
    end
end

local function RestoreButton(button, state)
    RestoreMethods(button, state)
    button:SetParent(state.parent)
    button:ClearAllPoints()
    for _, point in ipairs(state.points) do
        button:SetPoint(unpackValues(point))
    end
    button:SetSize(state.width, state.height)
    button:SetScale(state.scale)
    button:SetFrameStrata(state.strata)
    button:SetFrameLevel(state.level)
end

local function IsCandidate(button)
    if not button or buttonStates[button] then return false end
    if button.IsForbidden and button:IsForbidden() then return false end

    local width = button.GetWidth and button:GetWidth() or 0
    if width < 15 or width > 40 then return false end
    if not button.IsObjectType
        or not (button:IsObjectType("Button")
            or button:IsObjectType("Frame")) then
        return false
    end

    local name = button.GetName and button:GetName()
    if not name or ignoreButtonLookup[name] then return false end

    for _, prefix in ipairs(genericIgnore) do
        if name:sub(1, #prefix) == prefix then return false end
    end

    if not name:find("LibDBIcon", 1, true) then
        for _, part in ipairs(partialIgnore) do
            if name:find(part) then return false end
        end
    end
    return true
end

local function SkinButton(button)
    button:SetSize(25, 25)
    if button.__gwPlusFlyoutSkinned then return end

    for index = 1, button:GetNumRegions() do
        local region = select(index, button:GetRegions())
        if region and region.IsObjectType
            and region:IsObjectType("Texture") then
            local textureID = region.GetTextureFileID
                and region:GetTextureFileID()
            local texture = region.GetTexture
                and region:GetTexture()

            if textureID and removeTextureID[textureID] then
                region:SetTexture(nil)
                region:SetAlpha(0)
            elseif IsIgnoredTexture(texture) then
                region:SetTexture(nil)
                region:SetAlpha(0)
            else
                region:ClearAllPoints()
                region:SetDrawLayer("ARTWORK")
                region:SetPoint(
                    "TOPLEFT", button, "TOPLEFT", 2, -2)
                region:SetPoint(
                    "BOTTOMRIGHT", button, "BOTTOMRIGHT", -2, 2)
            end
        end
    end

    if button.GwCreateBackdrop and GW.BackdropTemplates then
        button:GwCreateBackdrop(
            GW.BackdropTemplates.DefaultWithSmallBorder)
    end
    button.__gwPlusFlyoutSkinned = true
end

local function CaptureButton(button, restoreToMinimap)
    if restoreToMinimap then
        for _, methodName in ipairs(lockedMethods) do
            if button[methodName] == GW.NoOp then
                button[methodName] = nil
            end
        end
    end

    local methods = {}
    for _, methodName in ipairs(lockedMethods) do
        methods[methodName] = button[methodName]
    end

    local points = CapturePoints(button)
    local parent = button:GetParent()
    local width = button:GetWidth()
    local height = button.GetHeight and button:GetHeight()
        or width
    if restoreToMinimap and Minimap then
        local restoreIndex = #managedButtons
        parent = Minimap
        points = {{
            "TOPLEFT", Minimap, "TOPLEFT",
            (restoreIndex % 6) * 26,
            -math.floor(restoreIndex / 6) * 26,
        }}
        width = 32
        height = 32
    end

    local state = {
        parent = parent,
        points = points,
        width = width,
        height = height,
        scale = button:GetScale(),
        strata = button:GetFrameStrata(),
        level = button:GetFrameLevel(),
        methods = methods,
    }
    buttonStates[button] = state
    managedButtons[#managedButtons + 1] = button
    SkinButton(button)
end

local function ScanFrameChildren(frame, restoreToMinimap)
    if not frame or not frame.GetChildren then return end
    for _, child in ipairs({frame:GetChildren()}) do
        if IsCandidate(child) then
            CaptureButton(child, restoreToMinimap)
        end
    end
end

local function ScanButtons()
    ScanFrameChildren(Minimap, false)
end

local function ScanToggleButtons(toggle)
    ScanFrameChildren(toggle and toggle.container, true)
    ScanFrameChildren(toggle, true)
end

local function SetToggleVisible(toggle, visible)
    local alpha = visible and 1 or 0
    local normal = toggle.GetNormalTexture
        and toggle:GetNormalTexture()
    local highlight = toggle.GetHighlightTexture
        and toggle:GetHighlightTexture()
    local pushed = toggle.GetPushedTexture
        and toggle:GetPushedTexture()
    if normal then normal:SetAlpha(alpha) end
    if highlight then highlight:SetAlpha(alpha) end
    if pushed then pushed:SetAlpha(alpha) end
    toggle:EnableMouse(visible)
end

local function UpdateButtons(toggle)
    local shownButtons = {}
    for _, button in ipairs(managedButtons) do
        if button:IsShown() then
            shownButtons[#shownButtons + 1] = button
        end
    end

    local shownCount = #shownButtons
    local rowCount = shownCount > 0
        and math.ceil(shownCount / 8) or 0
    local maxColumns = math.min(shownCount, 8)

    for index, button in ipairs(shownButtons) do
        local state = buttonStates[button]
        local zeroIndex = index - 1
        local column = zeroIndex % 8
        local row = math.floor(zeroIndex / 8)
        local yOffset =
            ((rowCount - 1) * 27 / 2) - (row * 27)

        RestoreMethods(button, state)
        button:SetParent(toggle.container)
        button:ClearAllPoints()
        button:SetPoint(
            "RIGHT", toggle.container, "RIGHT",
            -5 - (column * 27), yOffset)
        button:SetScale(1)
        button:SetFrameStrata("MEDIUM")
        button:SetFrameLevel(toggle.container:GetFrameLevel() + 1)
        LockMethods(button)
    end

    toggle.container:SetWidth(
        shownCount > 0 and (maxColumns * 27 + 10) or 10)
    toggle.container:SetHeight(
        shownCount > 0 and (rowCount * 27 + 10) or 10)
    toggle.gw_Showing = shownCount > 0
    if shownCount > 0 then
        toggle:Show()
        SetToggleVisible(toggle, true)
    else
        toggle.container:Hide()
        toggle:Hide()
    end
end

local function ToggleContainer(toggle)
    Flyout.Refresh()
    if toggle.container:IsShown() then
        toggle.container:Hide()
    else
        toggle.container:Show()
    end
end

local function EnsureToggle()
    local toggle = _G.GwAddonToggle
    if not toggle then
        toggle = CreateFrame(
            "Button", "GwAddonToggle", UIParent, "GwAddonToggle")
    end
    if not toggle or not toggle.container then return nil end

    if not toggle.__gwPlusFlyoutOwned then
        toggle:SetScript("OnClick", ToggleContainer)
        toggle:SetScript("OnEvent", nil)
        toggle.__gwPlusFlyoutOwned = true
        toggle.gw_Showing = false
        if toggle.container.GwCreateBackdrop
            and GW.BackdropTemplates then
            toggle.container:GwCreateBackdrop(
                GW.BackdropTemplates.DefaultWithSmallBorder, true)
        end
    end

    if Minimap then
        toggle:ClearAllPoints()
        toggle:SetPoint(
            "LEFT", Minimap, "RIGHT", 4, 0)
    end
    return toggle
end

function Flyout.InitDB()
    GW2_UI_PLUS_SV = GW2_UI_PLUS_SV or {}
    if GW2_UI_PLUS_SV.minimapAddonFlyoutEnabled == nil then
        GW2_UI_PLUS_SV.minimapAddonFlyoutEnabled = true
    end
    return GW2_UI_PLUS_SV
end

function Flyout.IsEnabled()
    return Flyout.InitDB().minimapAddonFlyoutEnabled ~= false
end

function Flyout.GetToggle()
    return _G.GwAddonToggle
end

function Flyout.Disable()
    if IsBlocked() then
        QueueRefresh()
        return
    end

    local toggle = Flyout.GetToggle()
    ScanToggleButtons(toggle)
    for _, button in ipairs(managedButtons) do
        local state = buttonStates[button]
        if state then RestoreButton(button, state) end
        buttonStates[button] = nil
    end
    managedButtons = {}

    if toggle then
        if toggle.container then toggle.container:Hide() end
        toggle.gw_Showing = false
        SetToggleVisible(toggle, false)
        toggle:Hide()
    end
end

function Flyout.Apply()
    local toggle = EnsureToggle()
    if not toggle then return end
    if not Flyout.IsEnabled() then
        Flyout.Disable()
        return
    end
    if IsBlocked() then
        QueueRefresh()
        return
    end

    ScanToggleButtons(toggle)
    ScanButtons()
    UpdateButtons(toggle)
end

function Flyout.Refresh()
    if Flyout.IsEnabled() then
        Flyout.Apply()
    else
        Flyout.Disable()
    end
end

function Flyout.SetEnabled(enabled)
    Flyout.InitDB().minimapAddonFlyoutEnabled = enabled == true
    Flyout.Refresh()
end

GW.CreateMinimapButtonsSack = Flyout.Apply
GW.UpdateMinimapButtonsSack = Flyout.Refresh

driver:RegisterEvent("PLAYER_LOGIN")
driver:RegisterEvent("ADDON_LOADED")
driver:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_REGEN_ENABLED"
        or event == "PET_BATTLE_CLOSE" then
        if pendingRefresh and not IsBlocked() then
            pendingRefresh = false
            self:UnregisterEvent("PLAYER_REGEN_ENABLED")
            self:UnregisterEvent("PET_BATTLE_CLOSE")
            Flyout.Refresh()
        end
    elseif event == "PLAYER_LOGIN" then
        self:UnregisterEvent(event)
        C_Timer.After(0, Flyout.Refresh)
    elseif Flyout.IsEnabled() then
        C_Timer.After(1, Flyout.Refresh)
        C_Timer.After(5, Flyout.Refresh)
    end
end)
