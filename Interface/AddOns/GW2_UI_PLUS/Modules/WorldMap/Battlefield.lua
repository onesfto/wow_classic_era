local _, addonTable = ...

local WorldMap = addonTable.WorldMap
if not WorldMap then return end

WorldMap.Battlefield = WorldMap.Battlefield or {}
local Battlefield = WorldMap.Battlefield
local initialized = false

function Battlefield.Initialize()
    if initialized or not _G.BattlefieldMapFrame then return end
    initialized = true
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
    BattlefieldMapFrame:SetWidth(WorldMap.Get("battlefieldSize"))
    BattlefieldMapFrame:SetHeight(WorldMap.Get("battlefieldSize") / 1.5)
    BattlefieldMapFrame:SetAlpha(WorldMap.Get("battlefieldOpacity"))
end
