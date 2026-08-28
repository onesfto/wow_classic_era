local function NewProvider(rows)
    local provider = {rows = rows or {}}
    function provider:Insert(row)
        self.rows[#self.rows + 1] = row
    end
    function provider:ForEach(callback)
        for _, row in ipairs(self.rows) do callback(row) end
    end
    return provider
end

local function NewTextObject(value)
    return {
        GetText = function() return value end,
        SetText = function(_, newValue) value = newValue end,
        GetWidth = function() return 100 end,
        SetWidth = function() end,
        GetStringWidth = function() return 100 end,
    }
end

local oldCreateDataProvider = _G.CreateDataProvider
local oldScrollBoxConstants = _G.ScrollBoxConstants
local oldGW2Addon = _G.GW2_ADDON
local oldMixin = _G.GwPlayerPetFrameMixin

_G.CreateDataProvider = NewProvider
_G.ScrollBoxConstants = {RetainScrollPosition = true}
_G.GW2_ADDON = {
    SettingsWidgetRegistry = {
        list = {},
        byPanel = setmetatable({}, {__mode = "k"}),
        panelCounter = 0,
        byOptionName = {},
    },
}
_G.GwPlayerPetFrameMixin = nil

local addonTable = {}
local enabledWidget = {}
local createdWidgets = {}
addonTable.PlusPetFrame = {
    AddOptions = function() end,
    AddAuxiliaryOptions = function() end,
}
addonTable.ActionBarOptionsUtils = {
    InitializePanel = function() end,
    CreateOptionWidget = function(_, option)
        option.__gwPlusWidget = enabledWidget
        enabledWidget.optionName = option.optionName
        enabledWidget.optionType = option.optionType or "boolean"
        enabledWidget.displayName = option.name
        enabledWidget.desc = option.desc
        enabledWidget.get = option.getter
        enabledWidget.dependence = option.dependence
        createdWidgets[#createdWidgets + 1] = option
        return enabledWidget
    end,
}
assert(loadfile("Modules/Settings/Settings.lua"))("GW2_UI_PLUS", addonTable)

local function FindUpvalue(functionValue, wantedName)
    for index = 1, 80 do
        local name, value = debug.getupvalue(functionValue, index)
        if not name then break end
        if name == wantedName then return value end
    end
end

local preparePetPanel = assert(
    FindUpvalue(addonTable.BuildMainMenuTab, "PreparePetPanel"))

local enabled = {
    optionName = "PETBAR_ENABLED",
    isMasterToggle = true,
}
local faderHeader = {
    optionType = "header",
    name = "隐藏器",
    dependence = {PETBAR_ENABLED = true},
}
local fader = {
    optionName = "petFrameFader",
    groupHeaderName = "Fader",
    dependence = {PETBAR_ENABLED = true},
    __gwPlusWidget = {},
    optionsList = {
        "casting", "combat", "hover", "dynamicflight", "vehicle",
        "unittarget", "playertarget",
    },
    optionsNames = {
        "Casting", "Combat", "Hover", "Dynamic Flight", "Vehicle",
        "Unit Target", "Player Target",
    },
}
local faderWidget = fader.__gwPlusWidget
local smooth = {
    optionName = "petFrameFader.smooth",
    groupHeaderName = "Fader",
    dependence = {PETBAR_ENABLED = true},
    min = 0,
    max = 3,
    __gwPlusWidget = {},
}
local smoothWidget = smooth.__gwPlusWidget
local minAlpha = {
    optionName = "petFrameFader.minAlpha",
    groupHeaderName = "Fader",
    dependence = {PETBAR_ENABLED = true},
    min = 0,
    max = 1,
    __gwPlusWidget = {},
}
local minAlphaWidget = minAlpha.__gwPlusWidget
local maxAlpha = {
    optionName = "petFrameFader.maxAlpha",
    groupHeaderName = "Fader",
    dependence = {PETBAR_ENABLED = true},
    min = 0,
    max = 1,
    __gwPlusWidget = {},
}
local maxAlphaWidget = maxAlpha.__gwPlusWidget
local general = {optionName = "PET_FLOATING_COMBAT_TEXT"}
local originalProvider = NewProvider({
    {option = enabled, widget = enabledWidget},
    {option = faderHeader, widget = {}},
    {option = fader, widget = faderWidget},
    {option = smooth, widget = smoothWidget},
    {option = minAlpha, widget = minAlphaWidget},
    {option = maxAlpha, widget = maxAlphaWidget},
    {option = general, widget = {}},
})

local addedOptions = {}
local panel = {
    gwOptions = {
        enabled, faderHeader, fader, smooth, minAlpha, maxAlpha, general,
    },
    header = NewTextObject("Unit Frames"),
    breadcrumb = NewTextObject("Pet"),
    sub = NewTextObject("Pet settings"),
    scroll = {ScrollBox = {
        GetDataProvider = function() return originalProvider end,
        SetDataProvider = function() end,
    }},
}
function panel:AddOption(name, description, options)
    local option = options or {}
    option.name = name
    option.desc = description
    addedOptions[#addedOptions + 1] = option
    return option
end

preparePetPanel(panel)

local state = assert(panel.__gwPlusPetFaderState)
local faderView = assert(state.views.fader)
assert(faderView.options[1] == addedOptions[1],
    "old Plus fader enable option is missing")
assert(createdWidgets[1] == addedOptions[1],
    "old Plus fader enable option was not converted to a settings widget")
local enabledEntries = _G.GW2_ADDON.SettingsWidgetRegistry.byOptionName[
    "GW2PlusPetFaderEnabled"]
assert(enabledEntries and enabledEntries[1]
        and enabledEntries[1].widget == enabledWidget,
    "old Plus fader enable widget was not registered for dependencies")
assert(addedOptions[1].optionName == "GW2PlusPetFaderEnabled",
    "old Plus fader option name was not restored")
for _, option in ipairs({fader, smooth, minAlpha, maxAlpha}) do
    assert(not option.dependence.PETBAR_ENABLED
            and option.dependence.GW2PlusPetFaderEnabled == true,
        "宠物渐隐选项不应依赖 PETBAR_ENABLED")
end
assert(faderHeader.name == "显隐"
        and not faderHeader.dependence.PETBAR_ENABLED
        and faderHeader.dependence.GW2PlusPetFaderEnabled == true,
    "宠物渐隐分组标题未统一为显隐")
for _, option in ipairs(faderView.options) do
    assert(option ~= faderHeader,
        "宠物渐隐页不应显示显隐分组标题")
end
assert(#faderView.provider.rows >= 2
        and faderView.provider.rows[1].widget == enabledWidget
        and faderView.provider.rows[2].kind == "masterToggleSeparator",
    "old Plus fader master rows were not preserved")
local faderRows = {}
for index = 3, #faderView.provider.rows do
    local row = faderView.provider.rows[index]
    for _, widget in ipairs(row.widgets or {row.widget}) do
        faderRows[widget] = true
    end
end
assert(faderRows[faderWidget] and faderRows[smoothWidget]
        and faderRows[minAlphaWidget] and faderRows[maxAlphaWidget],
    "old Plus fader controls were not rendered from the panel provider")
assert(#fader.optionsList == 5
        and fader.optionsList[1] == "casting"
        and fader.optionsList[2] == "combat"
        and fader.optionsList[3] == "hover"
        and fader.optionsList[4] == "unittarget"
        and fader.optionsList[5] == "playertarget",
    "old Plus fader condition list was not restored")
assert(smooth.min == 0 and smooth.max == 3,
    "smooth range changed")
assert(minAlpha.min == 0 and minAlpha.max == 1,
    "min alpha range changed")
assert(maxAlpha.min == 0 and maxAlpha.max == 1,
    "max alpha range changed")

_G.CreateDataProvider = oldCreateDataProvider
_G.ScrollBoxConstants = oldScrollBoxConstants
_G.GW2_ADDON = oldGW2Addon
_G.GwPlayerPetFrameMixin = oldMixin
print("宠物旧版渐隐设置回归检查通过")
