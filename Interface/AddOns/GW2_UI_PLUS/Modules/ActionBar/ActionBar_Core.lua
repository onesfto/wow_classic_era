local _, addonTable = ...
local GW = _G.GW2_ADDON
if not GW then return end
local AB = {}
_G.GW2Plus_ActionBar = AB
local MAINBAR_DEFAULT_SIZE = 48
local GLOBE_BASE_SCALE = 1.1
local GLOBE_GAP_PADDING = 11
local GLOBE_DEFAULT_GAP = 108
local MULTIBARS = {
    [2] = {setting = "MultiBarBottomLeft",  frame = "GwMultiBarBottomLeft",  button = "MultiBarBottomLeftButton"},
    [3] = {setting = "MultiBarBottomRight", frame = "GwMultiBarBottomRight", button = "MultiBarBottomRightButton"},
    [4] = {setting = "MultiBarRight",       frame = "GwMultiBarRight",       button = "MultiBarRightButton"},
    [5] = {setting = "MultiBarLeft",        frame = "GwMultiBarLeft",        button = "MultiBarLeftButton"},
    [6] = {setting = "MultiBar5",           frame = "GwMultiBar5",           button = "MultiBar5Button"},
    [7] = {setting = "MultiBar6",           frame = "GwMultiBar6",           button = "MultiBar6Button"},
    [8] = {setting = "MultiBar7",           frame = "GwMultiBar7",           button = "MultiBar7Button"},
}
AB.MULTIBARS = MULTIBARS
AB.SIZE_MIN = 12
AB.SIZE_MAX = 64
local defaults = {
    fadeEnable = false,
    fadeAlpha = 0.2,
    fadeDelay = 0.5,
    keepInCombat = true,
    fadeBar1 = true,
    fadeBar2 = true,
    fadeBar3 = true,
    fadeBar4 = true,
    fadeBar5 = true,
    fadeBar6 = true,
    fadeBar7 = true,
    fadeBar8 = true,
    fadeStanceBar = true,
    fadePetBar = true,
    fadeMageBar = true,
    mainBarSize = MAINBAR_DEFAULT_SIZE,
    mainBarCount = 12,
    mainBarColumns = 12,
    mainBarGlobeGap = 108,
    mainBarShowHotkey = true,
    mainBarHotkeyPosition = "BOTTOM",
    mainBarHotkeyX = 0,
    mainBarHotkeyY = 0,
    mainBarHotkeySize = 12,
    mainBarShowMacro = false,
    mainBarMacroPosition = "TOP",
    mainBarMacroX = 0,
    mainBarMacroY = 0,
    mainBarMacroSize = 12,
    castbarWidth = 300,
    castbarHeight = 15,
    globeScale = 1.0,
    normalPlayerFrameEnabled = true,
    mageBarEnable = true,
    mageBarSize = 36,
    mageBarVertical = false,
    mageBarTeleport = true,
    mageBarPortal = true,
    mageBarFood = false,
    mageBarWater = false,
    mageBarGem = false,
    petBarMiddleGap = 0,
    petBarGapPosition = "MIDDLE",
}
AB.defaults = defaults
local function InitDB()
    GW2_UI_PLUS_ActionBarSV = GW2_UI_PLUS_ActionBarSV or {}
    local db = GW2_UI_PLUS_ActionBarSV
    for k, v in pairs(defaults) do
        if db[k] == nil then
            db[k] = v
        end
    end
    if type(db.mainBarGlobeGap) == "boolean" then
        db.mainBarGlobeGap = db.mainBarGlobeGap and 108 or 0
    end
    return db
end
AB.InitDB = InitDB
function AB.SetFontStringSize(fontString, size)
    if not fontString or not fontString.GetFont or not fontString.SetFont then return end
    local path, _, flags = fontString:GetFont()
    if path then fontString:SetFont(path, size or 12, flags) end
end
local pending = {}
local combatWatcher = CreateFrame("Frame")
combatWatcher:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_REGEN_ENABLED")
    local queued = pending
    pending = {}
    for _, func in pairs(queued) do
        func()
    end
end)
local function QueueOutOfCombat(name, func)
    if not InCombatLockdown() then
        return false
    end
    pending[name] = func
    combatWatcher:RegisterEvent("PLAYER_REGEN_ENABLED")
    return true
end
AB.QueueOutOfCombat = QueueOutOfCombat
AB.InitDB = InitDB
addonTable.PlusActionBar = AB
