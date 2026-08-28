local _, addonTable = ...

addonTable.WorldMap = addonTable.WorldMap or {}
local WorldMap = addonTable.WorldMap

WorldMap.defaults = {
    showExploration = true,
    explorationTint = {1, 1, 1, 1},
    showPoiDungeons = true,
    showPoiFriendlyTravel = true,
    showPoiOpposingTravel = false,
    showPoiSpiritHealers = true,
    showPoiZoneCrossings = true,
    showZoneLevels = true,
    showFishingLevels = true,
    autoChangeZones = false,
    stationaryOpacity = 1,
    movingOpacity = 0.5,
    useStationaryOpacityOnHover = true,
    classIcons = true,
    hideTownCityIcons = true,
    showCoordinates = true,
    battlefieldEnabled = false,
    battlefieldSize = 300,
    battlefieldOpacity = 1,
    battlefieldMaxZoom = 1,
}

local function CopyDefault(value)
    if type(value) ~= "table" then return value end
    local copy = {}
    for key, entry in pairs(value) do
        copy[key] = CopyDefault(entry)
    end
    return copy
end

function WorldMap.GetDB()
    _G.GW2_UI_PLUS_SV = _G.GW2_UI_PLUS_SV or {}
    local db = _G.GW2_UI_PLUS_SV.worldMap
    if not db then
        db = {}
        _G.GW2_UI_PLUS_SV.worldMap = db
    end
    for key, value in pairs(WorldMap.defaults) do
        if db[key] == nil then db[key] = CopyDefault(value) end
    end
    return db
end

function WorldMap.Normalize(key, value)
    if key == "stationaryOpacity" or key == "movingOpacity"
        or key == "battlefieldOpacity" then
        return math.max(0.1, math.min(1, tonumber(value) or 1))
    elseif key == "battlefieldMaxZoom" then
        return math.max(1, math.min(6, tonumber(value) or 1))
    elseif key == "battlefieldSize" then
        return math.max(150, math.min(1200, tonumber(value) or 300))
    end
    return value
end

function WorldMap.Get(key)
    local tintKey = ({
        explorationTintRed = 1,
        explorationTintGreen = 2,
        explorationTintBlue = 3,
        explorationTintAlpha = 4,
    })[key]
    if tintKey then return WorldMap.GetDB().explorationTint[tintKey] end
    return WorldMap.GetDB()[key]
end

function WorldMap.Set(key, value)
    local tintKey = ({
        explorationTintRed = 1,
        explorationTintGreen = 2,
        explorationTintBlue = 3,
        explorationTintAlpha = 4,
    })[key]
    if tintKey then
        WorldMap.GetDB().explorationTint[tintKey] = math.max(0, math.min(1, tonumber(value) or 1))
    else
        WorldMap.GetDB()[key] = WorldMap.Normalize(key, value)
    end
end
