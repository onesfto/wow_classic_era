local addonTable = {}
local registeredProfileOwner
local registeredProfileCallback
local refreshCounts = {}

local function Noop() end
local function ValueOption(optionName, dependence)
    return {
        name = optionName,
        optionName = optionName,
        optionType = "boolean",
        getter = function() return true end,
        setter = Noop,
        getDefault = function() return true end,
        callback = Noop,
        dependence = dependence,
    }
end

local function AddOption(panel, name, _, config)
    local option = config or {}
    option.name = name
    option.optionType = option.optionType or "boolean"
    panel.gwOptions[#panel.gwOptions + 1] = option
    return option
end

local function NewPanel(parent)
    local text = {SetFont = Noop, SetTextColor = Noop, SetText = Noop}
    local panel = {
        parent = parent,
        gwOptions = {},
        header = text,
        breadcrumb = text,
        sub = text,
        scroll = {
            ScrollBox = {SetDataProvider = Noop},
        },
    }
    panel.GetParent = function(self) return self.parent end
    panel.AddOption = AddOption
    panel.AddOptionSlider = function(self, name, description, config)
        config.optionType = "slider"
        return AddOption(self, name, description, config)
    end
    panel.HookScript = Noop
    panel.Hide = Noop
    return panel
end

local playerGeneral = NewPanel({})
playerGeneral.gwOptions = {
    ValueOption("HEALTHGLOBE_ENABLED"),
    ValueOption("POWERBAR_ENABLED"),
    ValueOption("PLAYER_AS_TARGET_FRAME"),
    ValueOption("showDodgebar"),
    ValueOption("PLAYER_TRACKED_DODGEBAR_SPELL"),
    ValueOption("PLAYER_WIDTH"),
}

local sourceDependence = {CLASS_POWER = true}
local resourcePanel = NewPanel({})
resourcePanel.gwOptions = {
    ValueOption("PLAYER_ENERGY_MANA_TICK"),
    ValueOption("PLAYER_5SR_TIMER", {PLAYER_ENERGY_MANA_TICK = true}),
    ValueOption("PLAYER_ENERGY_MANA_TICK_HIDE_OFC", {PLAYER_ENERGY_MANA_TICK = true}),
    ValueOption("CLASS_POWER"),
    ValueOption("CLASSPOWER_ANCHOR_MODE", sourceDependence),
    ValueOption("CLASSPOWER_CUSTOMRESOURCEBAR_SIDE", sourceDependence),
    ValueOption("CLASSPOWER_ANCHOR_OFFSET_X", sourceDependence),
    ValueOption("CLASSPOWER_ANCHOR_OFFSET_Y", sourceDependence),
    ValueOption("CLASSPOWER_CUSTOMRESOURCEBAR_GAP", sourceDependence),
    ValueOption("CLASSPOWER_ONLY_SHOW_IN_COMBAT", sourceDependence),
}

local castDependence = {CASTINGBAR_ENABLED = true}
local castbarPanel = NewPanel({})
castbarPanel.gwOptions = {
    ValueOption("CASTINGBAR_ENABLED"),
    ValueOption("CASTINGBAR_DATA", castDependence),
    ValueOption("PLAYER_CASTBAR_SHOW_SPELL_QUEUEWINDOW", castDependence),
    ValueOption("showPlayerCastBarTicks", castDependence),
}

local GW = {
    settings = {
        HEALTHGLOBE_ENABLED = true,
        POWERBAR_ENABLED = true,
        HUD_BACKGROUND = true,
        HUD_SPELL_SWAP = true,
        XPBAR_ENABLED = true,
        QUEST_XP_PERCENT = false,
    },
    Colors = {
        TextColors = {
            LightHeader = {GetRGB = function() return 1, 1, 1 end},
        },
    },
    globalSettings = {
        RegisterCallback = function(owner, event, callback)
            assert(event == "OnProfileChanged")
            registeredProfileOwner = owner
            registeredProfileCallback = callback
        end,
    },
}
_G.GW2_ADDON = GW

local actionBarDB = {globeScale = 1, castbarWidth = 250, castbarHeight = 24}
addonTable.PlusActionBar = {
    defaults = {globeScale = 1},
    InitDB = function() return actionBarDB end,
    IsNormalPlayerFrameEnabled = function() return true end,
    SetNormalPlayerFrameEnabled = Noop,
    SyncPlayerHudEnabled = Noop,
    ApplyNormalPlayerFrameVisibility = Noop,
    IsGlobeStyleEnabled = function() return true end,
    SetGlobeStyleEnabled = Noop,
    ApplyGlobeScale = Noop,
    ApplyCastbarSize = Noop,
}
addonTable.ActionBarOptionsUtils = {
    InitializePanel = Noop,
    RefreshPanel = function(panel)
        refreshCounts[panel.panelId] = (refreshCounts[panel.panelId] or 0) + 1
    end,
}
addonTable.SetPanelTitle = Noop

_G.CreateFrame = function() return NewPanel() end
_G.CreateDataProvider = function()
    return {Insert = function(self, value) self[#self + 1] = value end}
end
_G.ScrollBoxConstants = {RetainScrollPosition = 1}
_G.C_Timer = {After = function(_, callback) callback() end}
_G.DEFAULT_CHAT_FRAME = {AddMessage = Noop}

local chunk = assert(loadfile("Modules/UnitFrames/PlayerResources.lua"))
chunk("GW2_UI_PLUS", addonTable)

local panels = assert(addonTable.PreparePlayerResourcePanel(
    playerGeneral, resourcePanel, castbarPanel))

local expected = {
    gw2_plus_player_globe = {
        "GW2PlusGlobeEnabled", "缩放", "HUD_BACKGROUND", "HUD_SPELL_SWAP",
        "showDodgebar", "PLAYER_TRACKED_DODGEBAR_SPELL",
    },
    gw2_plus_player_castbar = {
        "CASTINGBAR_ENABLED", "showPlayerCastBarTicks", "CASTINGBAR_DATA",
        "PLAYER_CASTBAR_SHOW_SPELL_QUEUEWINDOW", "castbarWidth", "castbarHeight",
    },
    gw2_plus_player_energy = {
        "PLAYER_ENERGY_MANA_TICK", "PLAYER_5SR_TIMER",
        "PLAYER_ENERGY_MANA_TICK_HIDE_OFC", "POWERBAR_ENABLED",
        "GW2PlusEnergyShowValue",
    },
    gw2_plus_player_resource = {
        "CLASS_POWER", "GW2PlusResourceShowValue", "CLASSPOWER_ANCHOR_MODE",
        "CLASSPOWER_CUSTOMRESOURCEBAR_SIDE", "CLASSPOWER_ANCHOR_OFFSET_X",
        "CLASSPOWER_ANCHOR_OFFSET_Y", "CLASSPOWER_CUSTOMRESOURCEBAR_GAP",
        "CLASSPOWER_ONLY_SHOW_IN_COMBAT",
    },
    gw2_plus_player_xp = {
        "GW2PlusXpEnabled", "QUEST_XP_PERCENT",
    },
}
local expectedDependencies = {
    GW2PlusGlobeEnabled = {},
    ["缩放"] = {GW2PlusGlobeEnabled = true},
    HUD_BACKGROUND = {GW2PlusGlobeEnabled = true},
    HUD_SPELL_SWAP = {GW2PlusGlobeEnabled = true},
    showDodgebar = {GW2PlusGlobeEnabled = true},
    PLAYER_TRACKED_DODGEBAR_SPELL = {
        GW2PlusGlobeEnabled = true,
        showDodgebar = true,
    },
    CASTINGBAR_ENABLED = {},
    showPlayerCastBarTicks = {CASTINGBAR_ENABLED = true},
    CASTINGBAR_DATA = {CASTINGBAR_ENABLED = true},
    PLAYER_CASTBAR_SHOW_SPELL_QUEUEWINDOW = {CASTINGBAR_ENABLED = true},
    castbarWidth = {CASTINGBAR_ENABLED = true},
    castbarHeight = {CASTINGBAR_ENABLED = true},
    PLAYER_ENERGY_MANA_TICK = {},
    PLAYER_5SR_TIMER = {PLAYER_ENERGY_MANA_TICK = true},
    PLAYER_ENERGY_MANA_TICK_HIDE_OFC = {PLAYER_ENERGY_MANA_TICK = true},
    POWERBAR_ENABLED = {},
    GW2PlusEnergyShowValue = {POWERBAR_ENABLED = true},
    CLASS_POWER = {},
    GW2PlusResourceShowValue = {CLASS_POWER = true},
    CLASSPOWER_ANCHOR_MODE = {CLASS_POWER = true},
    CLASSPOWER_CUSTOMRESOURCEBAR_SIDE = {CLASS_POWER = true},
    CLASSPOWER_ANCHOR_OFFSET_X = {CLASS_POWER = true},
    CLASSPOWER_ANCHOR_OFFSET_Y = {CLASS_POWER = true},
    CLASSPOWER_CUSTOMRESOURCEBAR_GAP = {CLASS_POWER = true},
    CLASSPOWER_ONLY_SHOW_IN_COMBAT = {CLASS_POWER = true},
    GW2PlusXpEnabled = {},
    QUEST_XP_PERCENT = {GW2PlusXpEnabled = true},
}

local seen = {}
local total = 0
local function OptionKey(option)
    return option.optionName or option.name
end
local function AssertDependencies(option, expectedValues)
    local actual = option.dependence or {}
    for key, value in pairs(expectedValues) do
        assert(actual[key] == value, OptionKey(option) .. " 缺少依赖: " .. key)
    end
    for key in pairs(actual) do
        assert(expectedValues[key] ~= nil,
            OptionKey(option) .. " 存在额外依赖: " .. key)
    end
end

local panelCount = 0
for panelId in pairs(panels) do
    assert(expected[panelId], "存在未预期面板: " .. panelId)
    panelCount = panelCount + 1
end
assert(panelCount == 5, "玩家资源面板数量错误")
for panelId, expectedOptions in pairs(expected) do
    local panel = assert(panels[panelId], "缺少面板: " .. panelId)
    assert(#panel.gwOptions == #expectedOptions, panelId .. " 选项数量错误")
    for index, option in ipairs(panel.gwOptions) do
        local key = OptionKey(option)
        assert(key == expectedOptions[index], panelId .. " 选项顺序错误: " .. key)
        assert(not seen[key], "选项重复归属: " .. key)
        seen[key] = panelId
        total = total + 1
        assert(option.forceNewLine == true, key .. " 未强制换行")
        assert(option.gwPlusColumns == nil, key .. " 仍使用多列布局")
        assert(option.groupHeaderName == nil, key .. " 仍保留重复分组标题")
        AssertDependencies(option, expectedDependencies[key])
    end
end
assert(total == 27, "玩家资源面板选项总数错误")

assert(registeredProfileOwner == panels, "配置回调 owner 不是五面板表")
assert(type(registeredProfileCallback) == "function", "未注册配置切换回调")
refreshCounts = {}
registeredProfileCallback()
for panelId in pairs(expected) do
    assert(refreshCounts[panelId] == 1, panelId .. " 未在配置切换时刷新")
end

print("玩家资源面板行为回归检查通过")
