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

local oldCreateDataProvider = _G.CreateDataProvider
_G.CreateDataProvider = NewProvider

local addonTable = {}
assert(loadfile("Modules/Settings/Settings.lua"))(
    "GW2_UI_PLUS", addonTable)

local function FindUpvalue(functionValue, wantedName)
    for index = 1, 80 do
        local name, value = debug.getupvalue(functionValue, index)
        if not name then break end
        if name == wantedName then return value end
    end
end

local preparePetPanel = assert(
    FindUpvalue(addonTable.BuildMainMenuTab, "PreparePetPanel"))
local buildPetView = assert(FindUpvalue(preparePetPanel, "BuildPetView"))

local happinessWidget = {}
local feedWidget = {}
local generalWidget = {}
local generalWidthWidget = {}
local hiddenHealthWidget = {}
local faderWidget = {}
local auraWidget = {}

local happiness = {
    optionName = "GW2PlusPetHappinessEnabled",
    groupHeaderName = "欢乐度",
    __gwPlusWidget = happinessWidget,
}
local feed = {
    optionName = "GW2PlusPetFeedEnabled",
    groupHeaderName = "喂食",
    __gwPlusWidget = feedWidget,
}
local general = {optionName = "GW2PlusPetGeneral", __gwPlusWidget = generalWidget}
local generalWidth = {
    optionName = "GW2PlusPetFrameHealthWidth",
    __gwPlusWidget = generalWidthWidget,
}
local hiddenHealth = {
    optionName = "PET_HEALTH_VALUE_RAW",
    __gwPlusWidget = hiddenHealthWidget,
}
local fader = {optionName = "petFrameFader", groupHeaderName = "显隐",
    __gwPlusWidget = faderWidget}
local aura = {optionName = "PET_Buff_Filter", groupHeaderName = "光环",
    __gwPlusWidget = auraWidget}

local originalProvider = NewProvider({
    {option = happiness, widget = happinessWidget},
    {
        option = general,
        widgets = {generalWidget, generalWidthWidget},
        columnCount = 2,
    },
    {option = hiddenHealth, widget = hiddenHealthWidget},
    {option = feed, widget = feedWidget},
    {option = fader, widget = faderWidget},
    {option = aura, widget = auraWidget},
})
local state = {
    originalOptions = {
        happiness, feed, general, generalWidth, hiddenHealth, fader, aura,
    },
    originalProvider = originalProvider,
}

local happinessView = buildPetView({}, state, "happiness")
assert(#happinessView.options == 1
        and happinessView.options[1] == happiness,
    "happiness options were not filtered")
assert(#happinessView.provider.rows == 1
        and happinessView.provider.rows[1].widget == happinessWidget,
    "single-column custom row was not preserved")

local generalView = buildPetView({}, state, "general")
assert(#generalView.provider.rows == 1
        and #generalView.provider.rows[1].widgets == 2,
    "two-column custom row was not preserved")
for _, option in ipairs(generalView.options) do
    assert(option ~= hiddenHealth,
        "宠物综合页不应显示生命值数值选项")
end

local faderView = buildPetView({}, state, "fader")
assert(faderView.options[1] == fader
        and faderView.provider.rows[1].widget == faderWidget,
    "native fader row was not preserved")
assert(#faderView.provider.rows == 1,
    "pet fader view gained an unexpected custom row")

_G.CreateDataProvider = oldCreateDataProvider
print("宠物设置 provider 回归检查通过")
