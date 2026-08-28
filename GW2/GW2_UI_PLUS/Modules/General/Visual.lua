local _, addonTable = ...

local General = addonTable.General
if not General then return end

local Visual = {}
General.Visual = Visual

local frame = CreateFrame("Frame")

local function SetIfSupported(cvar, value)
    if General.IsCVarSupported(cvar) then
        General.SetCVar(cvar, value)
    end
end

local function SetToggle(cvar, enabled)
    SetIfSupported(cvar, enabled and "1" or "0")
end

local function Clamp(value, minimum, maximum, fallback)
    value = tonumber(value)
    if not value then return fallback end
    return math.min(maximum, math.max(minimum, math.floor(value)))
end

local function ApplyCameraDistance(enabled)
    local cvar = "cameraDistanceMaxZoomFactor"
    if not General.IsCVarSupported(cvar) then return end
    if enabled then
        General.RememberCVar("cameraDistanceMaxZoomFactor", cvar)
        General.SetCVar(cvar, "2.6")
    elseif not General.RestoreCVar("cameraDistanceMaxZoomFactor", cvar) then
        local default = General.GetCVarDefault(cvar)
        if default ~= nil then General.SetCVar(cvar, default) end
    end
end

function Visual.Apply(db)
    db = type(db) == "table" and db or General.GetDB()
    if db.antiCensorship then
        SetIfSupported("overrideArchive", "0")
    else
        SetIfSupported("overrideArchive", "1")
    end

    local weather = Clamp(db.weatherDensity, 0, 3, 1)
    SetIfSupported("weatherDensity", weather)
    SetIfSupported("RAIDweatherDensity", weather)
    SetIfSupported("violenceLevel", Clamp(db.violenceLevel, 0, 5, 3))
    SetToggle("ffxGlow", db.fullScreenGlow)
    SetToggle("ffxDeath", db.deathEffect)
    ApplyCameraDistance(db.maxCameraDistance)
    SetToggle("UnitNamePlayerGuild", db.showGuildNames)
    SetToggle("UnitNamePlayerPVPTitle", db.showPlayerTitles)
    SetToggle("autoDismount", db.autoDismount)
    SetToggle("scriptErrors", not db.hideLuaErrors)
    SetToggle("TargetNearestUseNew", db.newTabTargeting)
    SetToggle("UberTooltips", db.detailedTooltips)
    frame:RegisterEvent("PLAYER_ENTERING_WORLD")
end

frame:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_ENTERING_WORLD" and General.GetDB().maxCameraDistance then
        SetIfSupported("cameraDistanceMaxZoomFactor", "2.6")
    end
end)
