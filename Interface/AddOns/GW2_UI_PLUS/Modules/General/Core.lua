local _, addonTable = ...

local General = addonTable.General or {}
addonTable.General = General

local defaults = {
    autoAcceptQuests = false,
    autoTurnInQuests = false,
    autoDialogueTurnIn = false,
    autoDismount = true,
    blockLowLevelTrade = false,
    batchBuy = true,
    fastLoot = false,
    antiCensorship = false,
    weatherDensity = 1,
    violenceLevel = 3,
    fullScreenGlow = false,
    deathEffect = false,
    hideLuaErrors = false,
    maxCameraDistance = false,
    showGuildNames = true,
    showPlayerTitles = true,
    newTabTargeting = true,
    detailedTooltips = false,
}

local cvarCache = {}

function General.GetDB()
    _G.GW2_UI_PLUS_SV = _G.GW2_UI_PLUS_SV or {}
    local db = _G.GW2_UI_PLUS_SV.general
    if type(db) ~= "table" then
        db = {}
        _G.GW2_UI_PLUS_SV.general = db
    end
    if db.fullScreenGlow == nil and db.disableGlow ~= nil then
        db.fullScreenGlow = not db.disableGlow
    end
    if db.deathEffect == nil and
        (db.disableScreenEffects ~= nil or db.disableDeathEffect ~= nil) then
        db.deathEffect = not (db.disableScreenEffects or db.disableDeathEffect)
    end
    for key, value in pairs(defaults) do
        if db[key] == nil then
            db[key] = value
        end
    end
    return db
end

function General.GetDefault(key)
    return defaults[key]
end

function General.GetCVar(name)
    if type(name) ~= "string" then return nil end
    local getter = _G.C_CVar and _G.C_CVar.GetCVar or _G.GetCVar
    if type(getter) ~= "function" then return nil end
    local ok, value = pcall(getter, name)
    if ok then return value end
    return nil
end

function General.GetCVarDefault(name)
    if type(name) ~= "string" then return nil end
    local getter = _G.C_CVar and _G.C_CVar.GetCVarDefault or _G.GetCVarDefault
    if type(getter) ~= "function" then return nil end
    local ok, value = pcall(getter, name)
    if ok then return value end
    return nil
end

function General.IsCVarSupported(name)
    return General.GetCVar(name) ~= nil or General.GetCVarDefault(name) ~= nil
end

function General.SetCVar(name, value)
    if type(name) ~= "string" or value == nil then return false end
    local setter = _G.C_CVar and _G.C_CVar.SetCVar or _G.SetCVar
    if type(setter) ~= "function" then return false end
    local ok = pcall(setter, name, tostring(value))
    return ok
end

function General.RememberCVar(cacheKey, cvarName)
    if cvarCache[cacheKey] == nil then
        cvarCache[cacheKey] = General.GetCVar(cvarName)
    end
end

function General.RestoreCVar(cacheKey, cvarName)
    local value = cvarCache[cacheKey]
    if value ~= nil then
        General.SetCVar(cvarName, value)
        cvarCache[cacheKey] = nil
        return true
    end
    return false
end

function General.ApplyAll()
    local db = General.GetDB()
    if General.Automation and General.Automation.Apply then
        General.Automation.Apply(db)
    end
    if General.Merchant and General.Merchant.Apply then
        General.Merchant.Apply(db)
    end
    if General.FastLoot and General.FastLoot.Apply then
        General.FastLoot.Apply(db.fastLoot)
    end
    if General.Visual and General.Visual.Apply then
        General.Visual.Apply(db)
    end
end

function General.SetSetting(key, value)
    if defaults[key] == nil then return end
    General.GetDB()[key] = value
    General.ApplyAll()
end
