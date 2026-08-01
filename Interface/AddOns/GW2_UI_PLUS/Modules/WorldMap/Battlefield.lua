local _, addonTable = ...

local WorldMap = addonTable.WorldMap
if not WorldMap then return end

WorldMap.Battlefield = WorldMap.Battlefield or {}
local Battlefield = WorldMap.Battlefield
local initialized, elapsed = false, 0

local function ApplyPins()
    if not _G.BattlefieldMapFrame then return end
    for pin in BattlefieldMapFrame:EnumeratePinsByTemplate("GroupMembersPinTemplate") do
        local provider = pin.dataProvider
        if provider then
            local sizes = provider:GetUnitPinSizesTable()
            sizes.party = WorldMap.Get("battlefieldGroupIconSize")
            sizes.raid = WorldMap.Get("battlefieldGroupIconSize")
            sizes.player = WorldMap.Get("battlefieldPlayerArrowSize")
            pin:SynchronizePinSizes()
        end
    end
end

local function CenterOnPlayer(_, delta)
    if not WorldMap.Get("battlefieldEnabled") or not WorldMap.Get("battlefieldCenterOnPlayer") then return end
    elapsed = elapsed + delta
    if elapsed < 2 or IsShiftKeyDown() or BattlefieldMapFrame.ScrollContainer:IsPanning() then return end
    elapsed = 0
    local position = C_Map.GetPlayerMapPosition(BattlefieldMapFrame.mapID, "player")
    if position then BattlefieldMapFrame.ScrollContainer:SetPanTarget(position.x, position.y) end
end

function Battlefield.Initialize()
    if initialized or not _G.BattlefieldMapFrame then return end
    initialized = true
    BattlefieldMapFrame:SetMovable(true)
    BattlefieldMapFrame:SetResizable(true)
    BattlefieldMapFrame:HookScript("OnUpdate", CenterOnPlayer)
    hooksecurefunc(BattlefieldMapFrame.ScrollContainer, "CreateZoomLevels", function(container)
        if not WorldMap.Get("battlefieldEnabled") then return end
        local multiplier = WorldMap.Get("battlefieldMaxZoom")
        if multiplier <= 1 then return end
        for _, level in ipairs(container.zoomLevels or {}) do level.scale = level.scale * multiplier end
    end)
end

function Battlefield.Apply()
    if not _G.BattlefieldMapFrame then return end
    Battlefield.Initialize()
    if not WorldMap.Get("battlefieldEnabled") then return end
    BattlefieldMapOptions.showPlayers = true
    BattlefieldMapFrame:SetWidth(WorldMap.Get("battlefieldSize"))
    BattlefieldMapFrame:SetHeight(WorldMap.Get("battlefieldSize") / 1.5)
    BattlefieldMapFrame:SetAlpha(WorldMap.Get("battlefieldOpacity"))
    BattlefieldMapFrame:SetMovable(WorldMap.Get("battlefieldUnlocked"))
    BattlefieldMapFrame:SetResizable(WorldMap.Get("battlefieldUnlocked"))
    ApplyPins()
end
