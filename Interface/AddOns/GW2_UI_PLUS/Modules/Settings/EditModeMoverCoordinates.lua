local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local MOVE_LABEL = NPE_MOVE or "移动"
local REFRESH_INTERVAL = 0.1
local elapsedSinceRefresh = 0

local function GetCoordinateWidgets()
    local container = GW.MoveHudScaleableFrame
    local settings = container and container.moverSettingsFrame
    local options = settings and settings.options
    local movers = options and options.movers
    return settings, movers, movers and movers.title
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
