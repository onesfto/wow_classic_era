local _, addonTable = ...

local PLUS_DEFAULT_SOURCE_KEY = "GW2_UI_PLUS_DEFAULT_SOURCE"
local PLUS_DEFAULT_SOURCE = "plus"
local IsPlusProfileDefault
local EXPERIENCE_BAR_OFFSET = 15
local EXPERIENCE_BAR_OFFSET_SETTINGS = {
    MainActionBar_pos = true,
    MultiBarBottomLeft = true,
    MultiBarBottomRight = true,
    MageBar_pos = true,
}

local PROFILE_DEFAULTS = {
    CASTINGBAR_ENABLED = true,
    showPlayerCastBarTicks = true,
    CASTINGBAR_DATA = false,
    PLAYER_CASTBAR_SHOW_SPELL_QUEUEWINDOW = true,
    castingbar_pos = {
        point = "BOTTOM",
        relativePoint = "BOTTOM",
        xOfs = 0,
        yOfs = 180,
        hasMoved = false,
    },
    castingbar_pos_scale = 1,

    POWERBAR_ENABLED = true,
    PLAYER_ENERGY_MANA_TICK = true,
    PLAYER_5SR_TIMER = true,
    PLAYER_ENERGY_MANA_TICK_HIDE_OFC = false,
    PowerBar_pos = {
        point = "BOTTOM",
        relativePoint = "BOTTOM",
        xOfs = 0,
        yOfs = 150,
        hasMoved = false,
    },
    PowerBar_pos_scale = 1,

    PLAYER_BUFFS_ENABLED = true,
    PlayerBuffs = {
        Seperate = 0,
        SortDir = "+",
        SortMethod = "INDEX",
        IconSize = 32,
        IconHeight = 32,
        KeepSizeRatio = true,
        GrowDirection = "DOWN",
        HorizontalSpacing = 0,
        VerticalSpacing = 10,
        MaxWraps = 3,
        WrapAfter = 10,
        NewAuraAnimation = true,
    },
    PlayerBuffFrame = {
        point = "TOPRIGHT",
        relativePoint = "TOPRIGHT",
        xOfs = -160,
        yOfs = 0,
        hasMoved = false,
    },
    PlayerBuffFrame_scale = 1,

    PlayerDebuffs = {
        Seperate = 0,
        SortDir = "+",
        SortMethod = "INDEX",
        IconSize = 32,
        IconHeight = 32,
        KeepSizeRatio = true,
        GrowDirection = "UP",
        HorizontalSpacing = 0,
        VerticalSpacing = 10,
        MaxWraps = 16,
        WrapAfter = 1,
        NewAuraAnimation = true,
    },
    PlayerDebuffFrame = {
        point = "CENTER",
        relativePoint = "CENTER",
        xOfs = -308,
        yOfs = 100,
        hasMoved = false,
    },
    PlayerDebuffFrame_scale = 1,

    CLASS_POWER = true,
    CLASSPOWER_SHOW_VALUE = true,
    CLASSPOWER_ANCHOR_MODE = "DEFAULT",
    CLASSPOWER_CUSTOMRESOURCEBAR_SIDE = "AUTO",
    CLASSPOWER_ANCHOR_OFFSET_X = 0,
    CLASSPOWER_ANCHOR_OFFSET_Y = 0,
    CLASSPOWER_CUSTOMRESOURCEBAR_GAP = 4,
    CLASSPOWER_ONLY_SHOW_IN_COMBAT = false,
    ClasspowerBar_pos = {
        point = "CENTER",
        relativePoint = "CENTER",
        xOfs = 0,
        yOfs = -160,
        hasMoved = false,
    },
    ClasspowerBar_pos_scale = 1,

    HEALTHGLOBE_ENABLED = true,
    PLAYER_AS_TARGET_FRAME_ALT_BACKGROUND = true,
    player_CLASS_COLOR = true,
    PLAYER_SHOW_PVP_INDICATOR = true,
    PLAYER_UNIT_HEALTH = "VALUE",
    playerFrameHealthBarTexture = "GW2_UI_2_DEFAULT",
    player_pos = {
        point = "CENTER",
        relativePoint = "CENTER",
        xOfs = -315,
        yOfs = -160,
        hasMoved = false,
    },
    player_pos_scale = 1,
    playerFrameHealthBarSize = {
        width = 240,
        height = 13,
    },
    playerFrameHealthBarTextOffset = {
        x = 5,
        y = 0,
    },
    playerFramePowerBarSize = {
        height = 3,
    },
    playerFramePowerBarTextOffset = {
        x = 5,
        y = 0,
    },

    TARGET_ENABLED = true,
    target_SHOW_CASTBAR = true,
    target_HEALTH_VALUE_ENABLED = true,
    target_HEALTH_VALUE_TYPE = true,
    target_THREAT_VALUE_ENABLED = true,
    target_CLASS_COLOR = true,
    target_HOOK_COMBOPOINTS = true,
    target_CASTINGBAR_DATA = false,
    target_FLOATING_COMBAT_TEXT = true,
    target_FRAME_INVERT = true,
    target_FRAME_ALT_BACKGROUND = true,
    targetFrameHealthBarTexture = "GW2_UI_2_DEFAULT",
    target_pos = {
        point = "CENTER",
        relativePoint = "CENTER",
        xOfs = 315,
        yOfs = -160,
        hasMoved = false,
    },
    target_pos_scale = 1,
    targetFrameHealthBarSize = {
        width = 240,
        height = 13,
    },
    targetFrameHealthBarTextOffset = {
        x = 5,
        y = 0,
    },
    targetFramePowerBarSize = {
        height = 3,
    },

    PARTY_FRAMES = true,
    RAID_FRAMES = false,
    RAID10_ENABLED = false,
    RAID25_ENABLED = false,
    RAID_MAINTANK_FRAMES_ENABLED = false,
    RAID_PET_FRAMES = false,
    RAID_STYLE_PARTY = false,
    PARTY_PET_FRAMES_ENABLED = false,

    target_TARGET_ENABLED = true,
    target_TARGET_SHOW_CASTBAR = true,
    targettargetFrameHealthBarTexture = "GW2_UI_2_DEFAULT",
    targettargetFrameHealthBarSize = {
        width = 100,
        height = 13,
    },
    targettargetFramePowerBarSize = {
        height = 3,
    },

    MINIMAP_ENABLED = true,
    MINIMAP_FPS = false,
    MINIMAP_FPS_TOOLTIP_DISABLED = false,
    MINIMAP_COORDS_TOGGLE = false,
    MINIMAP_ALWAYS_SHOW_HOVER_DETAILS = {
        CLOCK = false,
        ZONE = false,
        COORDS = false,
    },
    MinimapScale = 1,
    MinimapResetZoom = 0,
    MINIMAP_SIZE = 160,
    Minimap = {
        HeightPercentage = 100,
        KeepSizeRatio = true,
    },
    MinimapPos_scale = 1,

    targettarget_pos = {
        point = "CENTER",
        relativePoint = "CENTER",
        xOfs = 344,
        yOfs = -100,
        hasMoved = false,
    },
    targettarget_pos_scale = 1,

    BNToastPos = {
        point = "TOPLEFT",
        relativePoint = "TOPLEFT",
        xOfs = 350,
        yOfs = -26,
        hasMoved = false,
    },
    BNToastPos_scale = 1,

    GW2PlusToolbarMarkerBarPos = {
        point = "TOP",
        relativePoint = "TOP",
        xOfs = 0,
        yOfs = 0,
        hasMoved = false,
    },
    GW2PlusToolbarQuickBarPos = {
        point = "TOP",
        relativePoint = "TOP",
        xOfs = 0,
        yOfs = -30,
        hasMoved = false,
    },

    QuestTracker_pos = {
        point = "RIGHT",
        relativePoint = "RIGHT",
        xOfs = -182,
        yOfs = 130,
        hasMoved = false,
    },
    QuestTracker_pos_height = 600,
    QUEST_TIMERS_FRAME_POSITION = {
        point = "TOPRIGHT",
        relativePoint = "TOPRIGHT",
        xOfs = -318,
        yOfs = -100,
        hasMoved = false,
    },
    GameTooltipPos = {
        point = "BOTTOMRIGHT",
        relativePoint = "BOTTOMRIGHT",
        xOfs = 0,
        yOfs = 360,
        hasMoved = false,
    },
    GW2PlusVehicleLeaveButton_pos = {
        point = "CENTER",
        relativePoint = "CENTER",
        xOfs = 0,
        yOfs = 180,
        hasMoved = false,
    },

    party_pos = {
        point = "CENTER",
        relativePoint = "CENTER",
        xOfs = 435,
        yOfs = 40,
        hasMoved = false,
    },
    raid_pos = {
        point = "LEFT",
        relativePoint = "LEFT",
        xOfs = 0,
        yOfs = 50,
        hasMoved = false,
    },
    raid25_pos = {
        point = "LEFT",
        relativePoint = "LEFT",
        xOfs = 0,
        yOfs = 50,
        hasMoved = false,
    },
    raid10_pos = {
        point = "LEFT",
        relativePoint = "LEFT",
        xOfs = 0,
        yOfs = 50,
        hasMoved = false,
    },
    raid_party_pos = {
        point = "LEFT",
        relativePoint = "LEFT",
        xOfs = 0,
        yOfs = -32,
        hasMoved = false,
    },
    raidMaintank_pos = {
        point = "LEFT",
        relativePoint = "LEFT",
        xOfs = 0,
        yOfs = 245,
        hasMoved = false,
    },
    party_pet_pos = {
        point = "LEFT",
        relativePoint = "LEFT",
        xOfs = 0,
        yOfs = 252,
        hasMoved = false,
    },
    raid_pet_pos = {
        point = "TOPLEFT",
        relativePoint = "TOPLEFT",
        xOfs = 120,
        yOfs = 252,
        hasMoved = false,
    },
    MinimapPos = {
        point = "TOPRIGHT",
        relativePoint = "TOPRIGHT",
        xOfs = 0,
        yOfs = 0,
        hasMoved = false,
    },

}

local ACTIONBAR_PROFILE_DEFAULTS = {
    ACTIONBARS_ENABLED = true,
    BUTTON_ASSIGNMENTS_USED_ONLY = false,
    ACTIONBAR_BACKGROUND_ALPHA = 0.4,
    MAINBAR_MARGIIN = 5,
    MAINBAR_RANGEINDICATOR = "RED_INDICATOR",
    MULTIBAR_MARGIIN = 2,
    BUTTON_ASSIGNMENTS = true,
    SHOWACTIONBAR_MACRO_NAME_ENABLED = false,
    TotemBar = {
        enabled = true,
        growDirection = "HORIZONTAL",
        sortDirection = "ASC",
        buttonSize = 36,
        spacing = 2,
    },
    StanceBar = {
        enabled = true,
        growDirection = "UP",
        buttonSize = 36,
        spacing = 2,
        alpha = 1,
        mouseOver = false,
        visibility = "show",
        containerState = "open",
    },
}

local ACTIONBAR_POSITION_DEFAULTS = {
    MainActionBar_pos = {
        point = "BOTTOM",
        relativePoint = "BOTTOM",
        xOfs = 0,
        yOfs = 0,
        hasMoved = false,
    },
    MultiBarBottomLeft = {
        point = "BOTTOM",
        relativePoint = "BOTTOM",
        xOfs = -225,
        yOfs = 45,
        hasMoved = false,
    },
    MultiBarBottomRight = {
        point = "BOTTOM",
        relativePoint = "BOTTOM",
        xOfs = 225,
        yOfs = 45,
        hasMoved = false,
    },
    MultiBarRight = {
        point = "TOPRIGHT",
        relativePoint = "TOPRIGHT",
        xOfs = 0,
        yOfs = -160,
        hasMoved = false,
    },
    MultiBarLeft = {
        point = "TOPRIGHT",
        relativePoint = "TOPRIGHT",
        xOfs = -36,
        yOfs = -160,
        hasMoved = false,
    },
    MultiBar5 = {
        point = "TOPRIGHT",
        relativePoint = "TOPRIGHT",
        xOfs = -72,
        yOfs = -160,
        hasMoved = false,
    },
    MultiBar6 = {
        point = "TOPRIGHT",
        relativePoint = "TOPRIGHT",
        xOfs = -108,
        yOfs = -160,
        hasMoved = false,
    },
    MultiBar7 = {
        point = "TOPRIGHT",
        relativePoint = "TOPRIGHT",
        xOfs = -144,
        yOfs = -160,
        hasMoved = false,
    },
    StanceBar_pos = {
        point = "BOTTOM",
        relativePoint = "BOTTOM",
        xOfs = 0,
        yOfs = 200,
        hasMoved = false,
    },
    TotemBar_pos = {
        point = "BOTTOM",
        relativePoint = "BOTTOM",
        xOfs = 0,
        yOfs = 230,
        hasMoved = false,
    },
    MageBar_pos = {
        point = "BOTTOMRIGHT",
        relativePoint = "BOTTOMRIGHT",
        xOfs = -300,
        yOfs = 0,
        hasMoved = false,
    },
    PetBar_pos = {
        point = "BOTTOM",
        relativePoint = "BOTTOM",
        xOfs = 0,
        yOfs = 100,
        hasMoved = false,
    },
    PetHappiness_pos = {
        point = "BOTTOM",
        relativePoint = "BOTTOM",
        xOfs = -285,
        yOfs = 205,
        hasMoved = false,
    },
    PetFeed_pos = {
        point = "BOTTOM",
        relativePoint = "BOTTOM",
        xOfs = -315,
        yOfs = 205,
        hasMoved = false,
    },
}

local function BuildActionBarSavedDefaults()
    local defaults = {
        fadeEnable = false,
        fadeAlpha = 0.3,
        fadeDelay = 0,
        keepInCombat = true,
        normalPlayerFrameEnabled = true,
        globeScale = 1,
        mainBarShown = true,
        mainBarSize = 42,
        mainBarCount = 12,
        mainBarColumns = 12,
        mainBarGlobeGap = 130,
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
        stanceBarShown = true,
        stanceBarCount = 10,
        stanceBarColumns = 10,
        stanceBarCollapseButton = "hover",
        stanceBarShowHotkey = true,
        stanceBarHotkeyPosition = "BOTTOM",
        stanceBarHotkeyX = 0,
        stanceBarHotkeyY = 0,
        stanceBarHotkeySize = 12,
        mageBarEnable = true,
        mageBarSize = 36,
        mageBarVertical = true,
        mageBarTeleport = true,
        mageBarPortal = true,
        mageBarFood = false,
        mageBarWater = false,
        mageBarGem = false,
        castbarWidth = 300,
        castbarHeight = 15,
    }

    for index = 1, 8 do
        defaults["fadeBar" .. index] = false
    end
    defaults.fadeStanceBar = false
    defaults.fadeTotemBar = false
    defaults.fadeMageBar = false

    for index = 2, 8 do
        local prefix = "bar" .. index
        defaults[prefix .. "Shown"] = index <= 3
        defaults[prefix .. "Count"] = 12
        defaults[prefix .. "Columns"] = index <= 3 and 6 or 1
        defaults[prefix .. "Spacing"] = 2
        defaults[prefix .. "ShowHotkey"] = true
        defaults[prefix .. "HotkeyPosition"] = "TOPLEFT"
        defaults[prefix .. "HotkeyX"] = 0
        defaults[prefix .. "HotkeyY"] = 0
        defaults[prefix .. "HotkeySize"] = 12
        defaults[prefix .. "ShowMacro"] = false
        defaults[prefix .. "MacroPosition"] = "BOTTOM"
        defaults[prefix .. "MacroX"] = 0
        defaults[prefix .. "MacroY"] = 0
        defaults[prefix .. "MacroSize"] = 12
    end

    return defaults
end

local ACTIONBAR_SAVED_DEFAULTS = BuildActionBarSavedDefaults()

local SAVED_VARIABLE_DEFAULTS = {
    GW2_UI_PLUS_SV = {
        playerBuffAurasEnabled = true,
        playerDebuffAurasEnabled = true,
        petFrame = {
            portraitPosition = "RIGHT",
            portraitSize = 60,
            portraitOffsetX = 0,
            portraitOffsetY = 0,
            healthWidth = 230,
            healthHeight = 16,
            powerHeight = 2,
            happinessEnabled = true,
            feedEnabled = true,
        },
    },
    GW2_UI_PLUS_PlayerStatusSV = {
        energyBarShowValue = true,
        energyBarWidth = 300,
        energyBarHeight = 15,
        resourceBarShowValue = true,
        resourceBarWidth = 300,
    },
    GW2_UI_PLUS_ActionBarSV = ACTIONBAR_SAVED_DEFAULTS,
}

local MOVER_DEFAULTS = {
    {frame = "GwCastingBarPlayer", setting = "castingbar_pos"},
    {frame = "GwPlayerPowerBar", setting = "PowerBar_pos"},
    {frame = "GwPlayerClassPower", setting = "ClasspowerBar_pos"},
    {frame = "GW2UIPlayerBuffs", setting = "PlayerBuffFrame"},
    {frame = "GW2UIPlayerDebuffs", setting = "PlayerDebuffFrame"},
    {frame = "GwPlayerUnitFrame", setting = "player_pos"},
    {frame = "GwTargetUnitFrame", setting = "target_pos"},
    {frame = "GwTargetTargetUnitFrame", setting = "targettarget_pos"},
    {frame = "BNToastFrame", setting = "BNToastPos"},
    {frame = "GwPlusToolbarMarkerBar", setting = "GW2PlusToolbarMarkerBarPos"},
    {frame = "GwPlusToolbarQuickBar", setting = "GW2PlusToolbarQuickBarPos"},
    {frame = "GwQuestTracker", setting = "QuestTracker_pos"},
    {frame = "QuestTimerFrame", setting = "QUEST_TIMERS_FRAME_POSITION"},
    {frame = "GameTooltip", setting = "GameTooltipPos"},
    {frame = "GW2PlusVehicleLeaveButton", setting = "GW2PlusVehicleLeaveButton_pos"},
    {frame = "GwPartyFrame1", setting = "party_pos"},
    {frame = "GW2_Raid40GridContainer", setting = "raid_pos"},
    {frame = "GW2_Raid25GridContainer", setting = "raid25_pos"},
    {frame = "GW2_Raid10GridContainer", setting = "raid10_pos"},
    {frame = "GW2_PartyGridContainer", setting = "raid_party_pos"},
    {frame = "GW2_MaintankGridContainer", setting = "raidMaintank_pos"},
    {frame = "GW2_PartyPetGridContainer", setting = "party_pet_pos"},
    {frame = "GW2_RaidPetGridContainer", setting = "raid_pet_pos"},
    {frame = "Minimap", setting = "MinimapPos"},
    {frame = "MainActionBar", setting = "MainActionBar_pos"},
    {frame = "GwMultiBarBottomLeft", setting = "MultiBarBottomLeft"},
    {frame = "GwMultiBarBottomRight", setting = "MultiBarBottomRight"},
    {frame = "GwMultiBarRight", setting = "MultiBarRight"},
    {frame = "GwMultiBarLeft", setting = "MultiBarLeft"},
    {frame = "GwMultiBar5", setting = "MultiBar5"},
    {frame = "GwMultiBar6", setting = "MultiBar6"},
    {frame = "GwMultiBar7", setting = "MultiBar7"},
    {frame = "GwStanceBar", setting = "StanceBar_pos"},
    {frame = "GwTotemBar", setting = "TotemBar_pos"},
    {frame = "GwPlusMageBar", setting = "MageBar_pos"},
    {frame = "GwPlusPetBarHolder", setting = "PetBar_pos"},
    {frame = "GwPlusPetHappiness", setting = "PetHappiness_pos"},
    {frame = "GwPlusPetFeed", setting = "PetFeed_pos"},
}
local NATIVE_MOVER_DEFAULTS = {}

local function CopyValue(value)
    if type(value) ~= "table" then return value end
    local copy = {}
    for key, child in pairs(value) do
        copy[key] = CopyValue(child)
    end
    return copy
end

do
    local GW = _G.GW2_ADDON
    local profile = GW and GW.globalDefault and GW.globalDefault.profile
    if profile then
        for _, moverInfo in ipairs(MOVER_DEFAULTS) do
            if profile[moverInfo.setting] then
                NATIVE_MOVER_DEFAULTS[moverInfo.setting] =
                    CopyValue(profile[moverInfo.setting])
            end
        end
    end
end

local function ApplyTableDefaults(target, defaults)
    for key, value in pairs(defaults) do
        target[key] = CopyValue(value)
    end
end

local function GetPathValue(root, path)
    local value = root
    for key in string.gmatch(path, "[^%.]+") do
        if type(value) ~= "table" then return nil end
        value = value[key]
    end
    return value
end

local function GetActionBarDefault(key)
    local value = ACTIONBAR_SAVED_DEFAULTS[key]
    if value == nil then
        value = GetPathValue(ACTIONBAR_PROFILE_DEFAULTS, key)
    end
    return value ~= nil and CopyValue(value) or nil
end

local function GetMoverDefault(setting)
    local value = ACTIONBAR_POSITION_DEFAULTS[setting]
        or PROFILE_DEFAULTS[setting]
    if not value then return nil end

    value = CopyValue(value)
    if setting == "MainActionBar_pos" then
        value.xOfs = 0
        value.yOfs = 0
    end

    local GW = _G.GW2_ADDON
    if EXPERIENCE_BAR_OFFSET_SETTINGS[setting]
        and GW and GW.settings and GW.settings.XPBAR_ENABLED then
        value.yOfs = (value.yOfs or 0) + EXPERIENCE_BAR_OFFSET
    end
    return value
end

local function GetNativeMoverDefault(setting)
    local value = NATIVE_MOVER_DEFAULTS[setting]
    if value then return CopyValue(value) end
    local GW = _G.GW2_ADDON
    local profile = GW and GW.globalDefault and GW.globalDefault.profile
    value = profile and profile[setting]
    return value and CopyValue(value) or nil
end

local ApplyMoverDefault

local function RefreshMoverDefaults()
    local GW = _G.GW2_ADDON
    if not GW or not GW.settings then return end
    local plus = IsPlusProfileDefault and IsPlusProfileDefault()

    for _, moverInfo in ipairs(MOVER_DEFAULTS) do
        local default = plus and GetMoverDefault(moverInfo.setting)
            or GetNativeMoverDefault(moverInfo.setting)
        if default then
            local frame = _G[moverInfo.frame]
            local mover = frame and frame.gwMover
            if mover then mover.defaultPoint = CopyValue(default) end
            if plus then
                ApplyMoverDefault(GW, moverInfo, default, false)
            end
        end
    end
end

local function ApplySavedVariableDefaults()
    for variableName, defaults in pairs(SAVED_VARIABLE_DEFAULTS) do
        local database = _G[variableName]
        if type(database) ~= "table" then
            database = {}
            _G[variableName] = database
        end
        ApplyTableDefaults(database, defaults)
    end
end

ApplyMoverDefault = function(GW, moverInfo, default, force)
    if not default then return end
    local frame = _G[moverInfo.frame]
    local mover = frame and frame.gwMover
    if mover then mover.defaultPoint = CopyValue(default) end

    local saved = rawget(GW.settings, moverInfo.setting)
    if not force and type(saved) == "table" and saved.hasMoved == true then
        return
    end

    saved = CopyValue(default)
    GW.settings[moverInfo.setting] = saved
    if not mover then return end

    mover.savedPoint = CopyValue(saved)
    mover:ClearAllPoints()
    mover:SetPoint(
        default.point, UIParent, default.relativePoint,
        default.xOfs, default.yOfs)
    frame.isMoved = false
    frame:SetAttribute("isMoved", false)
    if mover.postdrag then mover.postdrag(frame) end
    if GW.UpdateMatchingLayout then
        GW.UpdateMatchingLayout(mover, saved)
    end
end

local function ApplyMatchedMoverDefaults()
    local GW = _G.GW2_ADDON
    if not GW or not GW.settings or InCombatLockdown() then return end
    if not IsPlusProfileDefault() then return end

    RefreshMoverDefaults()
end

local function ApplyActionBarProfileDefaults(GW)
    ApplyTableDefaults(GW.settings, ACTIONBAR_PROFILE_DEFAULTS)
    for _, moverInfo in ipairs(MOVER_DEFAULTS) do
        local default = GetMoverDefault(moverInfo.setting)
        if default and ACTIONBAR_POSITION_DEFAULTS[moverInfo.setting] then
            ApplyMoverDefault(GW, moverInfo, default, true)
        end
    end
end

local function ApplyActionBarRuntime()
    local AB = addonTable.PlusActionBar
    if AB and AB.EnforceActionBarMoverScales then
        AB.EnforceActionBarMoverScales()
    end
    if AB and AB.ApplyCastbarSize then AB.ApplyCastbarSize() end
    if AB and AB.ApplyGlobeScale then AB.ApplyGlobeScale() end
    local layout = addonTable.PlusActionBarLayout
    if layout and layout.RefreshAll then layout.RefreshAll() end
    if addonTable.PlusMageBar and addonTable.PlusMageBar.Toggle then
        addonTable.PlusMageBar.Toggle()
    end
    if _G.GwTotemBar then
        if _G.GwTotemBar.UpdateVisibility then _G.GwTotemBar:UpdateVisibility() end
        if _G.GwTotemBar.PositionAndSizeUpdate then
            _G.GwTotemBar:PositionAndSizeUpdate()
        end
    end
    if addonTable.PlusFader and addonTable.PlusFader.Refresh then
        addonTable.PlusFader.Refresh()
    end
end

local function QueueMatchedMoverDefaults()
    if C_Timer and C_Timer.After then
        C_Timer.After(0, ApplyMatchedMoverDefaults)
    else
        ApplyMatchedMoverDefaults()
    end
end

local function Apply()
    local GW = _G.GW2_ADDON
    if not GW or not GW.settings or not GW.ResetToDefault then
        return false
    end

    -- 原生重置会保留当前配置名称，并删除对应的配置布局。
    GW.ResetToDefault()
    ApplyTableDefaults(GW.settings, PROFILE_DEFAULTS)
    ApplyActionBarProfileDefaults(GW)
    GW.settings[PLUS_DEFAULT_SOURCE_KEY] = PLUS_DEFAULT_SOURCE
    ApplySavedVariableDefaults()

    if addonTable.ApplyPlayerResourceBarSize then
        addonTable.ApplyPlayerResourceBarSize()
    end
    if addonTable.ApplyPlayerEnergyBarScale then
        addonTable.ApplyPlayerEnergyBarScale()
    end
    if addonTable.PlusPetFrame and addonTable.PlusPetFrame.ApplyLayout then
        addonTable.PlusPetFrame.ApplyLayout()
    end
    ApplyActionBarRuntime()
    RefreshMoverDefaults()
    return true
end

IsPlusProfileDefault = function()
    local GW = _G.GW2_ADDON
    return GW and GW.settings
        and GW.settings[PLUS_DEFAULT_SOURCE_KEY] == PLUS_DEFAULT_SOURCE
end

addonTable.PlusProfileDefaults = {
    Profile = PROFILE_DEFAULTS,
    SavedVariables = SAVED_VARIABLE_DEFAULTS,
    ActionBarProfile = ACTIONBAR_PROFILE_DEFAULTS,
    ActionBarPositions = ACTIONBAR_POSITION_DEFAULTS,
    GetActionBarDefault = GetActionBarDefault,
    GetMoverDefault = GetMoverDefault,
    GetNativeMoverDefault = GetNativeMoverDefault,
    RefreshMoverDefaults = RefreshMoverDefaults,
    Apply = Apply,
    IsPlusProfileDefault = IsPlusProfileDefault,
}

local events = CreateFrame("Frame")
events:RegisterEvent("PLAYER_LOGIN")
events:RegisterEvent("PLAYER_ENTERING_WORLD")
events:SetScript("OnEvent", function(self)
    local GW = _G.GW2_ADDON
    if GW and GW.globalSettings and GW.globalSettings.RegisterCallback
        and not GW.gwPlusDefaultProfileHooked then
        GW.gwPlusDefaultProfileHooked = true
        local function RefreshProfileDefaults()
            RefreshMoverDefaults()
        end
        GW.globalSettings.RegisterCallback(
            addonTable, "OnProfileChanged", RefreshProfileDefaults)
        GW.globalSettings.RegisterCallback(
            addonTable, "OnProfileReset", RefreshProfileDefaults)
    end
    RefreshMoverDefaults()
    QueueMatchedMoverDefaults()
    self:UnregisterAllEvents()
end)
