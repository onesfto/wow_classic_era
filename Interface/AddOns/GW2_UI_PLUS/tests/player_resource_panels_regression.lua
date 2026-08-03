local addonTable = {}
local registeredProfileOwner
local registeredProfileCallback
local refreshCounts = {}
local initializedPanels = {}
local scheduledTimers = {}

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

local function DropdownOption(optionName, dependence)
    local option = ValueOption(optionName, dependence)
    option.optionType = "dropdown"
    return option
end

local function AddOption(panel, name, _, config)
    local option = config or {}
    option.name = name
    option.optionType = option.optionType or "boolean"
    panel.gwOptions = panel.gwOptions or {}
    panel.gwOptions[#panel.gwOptions + 1] = option
    return option
end

local function NewPanel(parent)
    local text = {SetFont = Noop, SetTextColor = Noop, SetText = Noop}
    local panel = {
        parent = parent,
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
    panel.AddGroupHeader = function(self, name)
        return AddOption(self, name, nil, {optionType = "header"})
    end
    panel.scripts = {}
    panel.HookScript = function(self, event, callback)
        self.scripts[event] = callback
    end
    panel.Hide = Noop
    return panel
end

local playerGeneral = NewPanel({})
local hiddenPlayerOption = ValueOption("PLAYER_UNIT_HEALTH_SHORT_VALUES")
hiddenPlayerOption.hidden = true
playerGeneral.gwOptions = {
    ValueOption("HEALTHGLOBE_ENABLED"),
    ValueOption("POWERBAR_ENABLED"),
    ValueOption("PLAYER_AS_TARGET_FRAME"),
    ValueOption("showDodgebar"),
    ValueOption("PLAYER_TRACKED_DODGEBAR_SPELL"),
    ValueOption("PLAYER_AS_TARGET_FRAME_ALT_BACKGROUND"),
    hiddenPlayerOption,
    ValueOption("player_CLASS_COLOR"),
    ValueOption("PLAYER_SHOW_PVP_INDICATOR"),
    DropdownOption("PLAYER_UNIT_HEALTH"),
    DropdownOption("playerFrameHealthBarTexture"),
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
        LightHeader = {
            GetRGB = function() return 1, 0.9450, 0.8196 end,
        },
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

local actionBarDB = {globeScale = 1}
addonTable.PlusActionBar = {
    defaults = {globeScale = 1, castbarWidth = 300, castbarHeight = 15},
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
    InitializePanel = function(panel)
        initializedPanels[#initializedPanels + 1] = panel
    end,
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
_G.C_Timer = {
    After = function(_, callback)
        scheduledTimers[#scheduledTimers + 1] = callback
    end,
}
_G.DEFAULT_CHAT_FRAME = {AddMessage = Noop}

local powerBarSize = {width = 313, height = 14}
_G.GwPlayerPowerBar = {
    SetSize = function(_, width, height)
        powerBarSize.width = width
        powerBarSize.height = height
    end,
    GetWidth = function() return powerBarSize.width end,
    GetHeight = function() return powerBarSize.height end,
}

local chunk = assert(loadfile("Modules/UnitFrames/PlayerResources.lua"))
chunk("GW2_UI_PLUS", addonTable)

local panels = assert(addonTable.PreparePlayerResourcePanel(
    playerGeneral, resourcePanel, castbarPanel))

assert(initializedPanels[1] == playerGeneral,
    "玩家综合未使用动作条多栏初始化器")
local initialPanelInitCount = #initializedPanels
for _, callback in ipairs(scheduledTimers) do callback() end
assert(#initializedPanels > initialPanelInitCount,
    "玩家综合未在设置页完成后重新使用动作条多栏初始化器")
assert(initializedPanels[#initializedPanels] == playerGeneral,
    "玩家综合最终没有使用动作条多栏初始化器")
local expectedGeneralColumns = {
    GW2PlusNormalPlayerFrameEnabled = false,
    PLAYER_AS_TARGET_FRAME_ALT_BACKGROUND = 3,
    player_CLASS_COLOR = 3,
    PLAYER_SHOW_PVP_INDICATOR = 3,
    PLAYER_UNIT_HEALTH = false,
    playerFrameHealthBarTexture = false,
    PLAYER_WIDTH = false,
}
local expectedGeneralOrder = {
    "GW2PlusNormalPlayerFrameEnabled",
    "PLAYER_AS_TARGET_FRAME_ALT_BACKGROUND",
    "player_CLASS_COLOR",
    "PLAYER_SHOW_PVP_INDICATOR",
    "PLAYER_UNIT_HEALTH",
    "playerFrameHealthBarTexture",
    "PLAYER_WIDTH",
}
for index, expectedName in ipairs(expectedGeneralOrder) do
    local option = playerGeneral.gwOptions[index]
    assert(option and (option.optionName or option.name) == expectedName,
        "玩家综合顺序错误: " .. expectedName)
end
for _, option in ipairs(playerGeneral.gwOptions) do
    local key = option.optionName or option.name
    local expectedColumn = expectedGeneralColumns[key]
    assert(expectedColumn ~= nil, "玩家综合存在未预期选项: " .. key)
    assert((option.gwPlusColumns or false) == expectedColumn,
        key .. " 列数错误")
end

local expected = {
    gw2_plus_player_globe = {
        "GW2PlusGlobeEnabled", "HUD_SPELL_SWAP", "HUD_BACKGROUND",
        "showDodgebar", "PLAYER_TRACKED_DODGEBAR_SPELL", "缩放",
    },
    gw2_plus_player_castbar = {
        "CASTINGBAR_ENABLED", "showPlayerCastBarTicks", "CASTINGBAR_DATA",
        "PLAYER_CASTBAR_SHOW_SPELL_QUEUEWINDOW", "castbarWidth", "castbarHeight",
    },
    gw2_plus_player_energy = {
        "PLAYER_ENERGY_MANA_TICK", "PLAYER_5SR_TIMER",
        "PLAYER_ENERGY_MANA_TICK_HIDE_OFC", "额外能量条",
        "POWERBAR_ENABLED", "GW2PlusEnergyShowValue", "energyBarWidth",
        "energyBarHeight",
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
    ["额外能量条"] = {},
    POWERBAR_ENABLED = {},
    GW2PlusEnergyShowValue = {POWERBAR_ENABLED = true},
    energyBarWidth = {POWERBAR_ENABLED = true},
    energyBarHeight = {POWERBAR_ENABLED = true},
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
local expectedGlobeColumns = {
    GW2PlusGlobeEnabled = false,
    HUD_SPELL_SWAP = 2,
    HUD_BACKGROUND = 2,
    showDodgebar = 2,
    PLAYER_TRACKED_DODGEBAR_SPELL = 2,
    ["缩放"] = false,
}
local expectedCastbarColumns = {
    CASTINGBAR_ENABLED = false,
    showPlayerCastBarTicks = 3,
    CASTINGBAR_DATA = 3,
    PLAYER_CASTBAR_SHOW_SPELL_QUEUEWINDOW = 3,
    castbarWidth = false,
    castbarHeight = false,
}
local expectedEnergyColumns = {
    PLAYER_ENERGY_MANA_TICK = 2,
    PLAYER_5SR_TIMER = 2,
    PLAYER_ENERGY_MANA_TICK_HIDE_OFC = false,
    ["额外能量条"] = false,
    POWERBAR_ENABLED = 2,
    energyBarWidth = false,
    energyBarHeight = false,
    GW2PlusEnergyShowValue = 2,
}

local castWidthOption = nil
local castHeightOption = nil
local energyEnabledOption = nil
local energyWidthOption = nil
local energyHeightOption = nil

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
        local expectedColumn = false
        if panelId == "gw2_plus_player_globe" then
            expectedColumn = expectedGlobeColumns[key]
        elseif panelId == "gw2_plus_player_castbar" then
            expectedColumn = expectedCastbarColumns[key]
        elseif panelId == "gw2_plus_player_energy" then
            expectedColumn = expectedEnergyColumns[key]
        end
        assert((option.gwPlusColumns or false) == expectedColumn,
            key .. " 列数错误")
        assert(option.groupHeaderName == nil, key .. " 仍保留重复分组标题")
        AssertDependencies(option, expectedDependencies[key])
        if panelId == "gw2_plus_player_castbar" then
            if key == "castbarWidth" then castWidthOption = option end
            if key == "castbarHeight" then castHeightOption = option end
        elseif panelId == "gw2_plus_player_energy" then
            if key == "POWERBAR_ENABLED" then energyEnabledOption = option end
            if key == "energyBarWidth" then energyWidthOption = option end
            if key == "energyBarHeight" then energyHeightOption = option end
        end
    end
end
assert(total == 30, "玩家资源面板选项总数错误")

local globePanel = panels.gw2_plus_player_globe
assert(globePanel.gwOptions[1].isMasterToggle == true,
    "血球面板启用项未使用主开关样式")
assert(globePanel.gwOptions[5].name == "位移条技能",
    "位移条技能文案错误")
assert(castWidthOption.getDefault() == 300,
    "施法条宽度默认值不是 300")
assert(castHeightOption.getDefault() == 15,
    "施法条高度默认值不是 15")
assert(castWidthOption.getter() == 300,
    "施法条宽度初始化默认值不是 300")
assert(castHeightOption.getter() == 15,
    "施法条高度初始化默认值不是 15")
assert(energyEnabledOption.name == "启用",
    "额外能量条开关文案不是启用")
assert(not energyEnabledOption.isMasterToggle,
    "额外能量条启用项错误使用主开关样式")
assert(energyWidthOption.getDefault() == 300,
    "额外能量条宽度默认值不是 300")
assert(energyHeightOption.getDefault() == 15,
    "额外能量条高度默认值不是 15")
assert(energyWidthOption.getter() == 300,
    "额外能量条宽度初始化默认值不是 300")
assert(energyHeightOption.getter() == 15,
    "额外能量条高度初始化默认值不是 15")

local castbarPanel = panels.gw2_plus_player_castbar
local energyHeaderText = {
    r = 0, g = 0, b = 0,
    SetTextColor = function(self, r, g, b)
        self.r, self.g, self.b = r, g, b
    end,
}
panels.gw2_plus_player_energy.gwPlusWidgets = {
    {
        optionType = "header",
        title = energyHeaderText,
        SetAlpha = Noop,
    },
}
panels.gw2_plus_player_energy.scripts.OnShow()
assert(energyHeaderText.r == 1
        and energyHeaderText.g == 0.9450
        and energyHeaderText.b == 0.8196,
    "额外能量条分组标题未使用 LightHeader 颜色")
local ordinaryButtonText = {
    r = 0, g = 0, b = 0,
    SetTextColor = function(self, r, g, b)
        self.r, self.g, self.b = r, g, b
    end,
}
local negativeButtonText = {
    r = 0.55, g = 0.05, b = 0.05,
    SetTextColor = function(self, r, g, b)
        self.r, self.g, self.b = r, g, b
    end,
}
castbarPanel.gwPlusWidgets = {
    {
        optionType = "button",
        title = ordinaryButtonText,
        SetAlpha = Noop,
    },
    {
        optionType = "button",
        title = negativeButtonText,
        SetAlpha = Noop,
    },
}
assert(castbarPanel.scripts.OnShow, "施法条面板未注册显示刷新")
castbarPanel.scripts.OnShow()
assert(ordinaryButtonText.r == 0 and ordinaryButtonText.g == 0
        and ordinaryButtonText.b == 0,
    "依赖刷新覆盖了解锁按钮的黑色文字")
assert(negativeButtonText.r == 0.55 and negativeButtonText.g == 0.05
        and negativeButtonText.b == 0.05,
    "依赖刷新覆盖了恢复按钮的深红文字")

local widthOption = energyWidthOption
local heightOption = energyHeightOption
assert(widthOption.getter() == 300, "额外能量条宽度默认值错误")
assert(heightOption.getter() == 15, "额外能量条高度默认值错误")
widthOption.setter(420)
widthOption.callback()
assert(powerBarSize.width == 420 and powerBarSize.height == 15,
    "额外能量条宽度未应用")
heightOption.setter(22)
heightOption.callback()
assert(powerBarSize.width == 420 and powerBarSize.height == 22,
    "额外能量条高度未应用")

assert(registeredProfileOwner == panels, "配置回调 owner 不是五面板表")
assert(type(registeredProfileCallback) == "function", "未注册配置切换回调")
refreshCounts = {}
registeredProfileCallback()
for panelId in pairs(expected) do
    assert(refreshCounts[panelId] == 1, panelId .. " 未在配置切换时刷新")
end

print("玩家资源面板行为回归检查通过")
