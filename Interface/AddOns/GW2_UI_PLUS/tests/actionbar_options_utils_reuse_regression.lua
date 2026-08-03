local addonTable = {PlusActionBar = {}}
_G.GW2_ADDON = {GetSettingsTabFrame = true}

assert(loadfile("Modules/ActionBar/Options_Utils.lua"))(
    "GW2_UI_PLUS", addonTable)

local widget = {}
local option = {__widget = widget}
local panel = {}
local actual = addonTable.ActionBarOptionsUtils.CreateOptionWidget(
    panel, option)

assert(actual == widget, "未复用原生控件")
assert(option.__gwPlusWidget == widget, "未记录 Plus 控件引用")
assert(panel.gwPlusWidgets and panel.gwPlusWidgets[1] == widget,
    "原生控件未登记到面板刷新列表")
assert(#panel.gwPlusWidgets == 1, "原生控件被重复登记")

addonTable.ActionBarOptionsUtils.CreateOptionWidget(panel, option)
assert(#panel.gwPlusWidgets == 1, "重复初始化导致控件重复登记")

local extentCalculator
CreateScrollBoxListLinearView = function()
    local view = {}
    function view:SetElementExtentCalculator(callback)
        extentCalculator = callback
    end
    function view:SetElementInitializer() end
    function view:SetElementResetter() end
    return view
end
ScrollUtil = {
    InitScrollBoxListWithScrollBar = function() end,
}
ScrollBoxConstants = {RetainScrollPosition = 1}
CreateDataProvider = function(rows) return rows end
GW2_ADDON.HandleTrimScrollBar = function() end
GW2_ADDON.HandleScrollControls = function() end

local layoutPanel = {
    gwOptions = {{
        name = "启用",
        optionType = "boolean",
        isMasterToggle = true,
        __widget = {},
    }},
    scroll = {
        ScrollBox = {SetDataProvider = function() end},
        ScrollBar = {SetHideIfUnscrollable = function() end},
    },
}
addonTable.ActionBarOptionsUtils.InitializePanel(layoutPanel)
assert(extentCalculator, "未创建设置行高计算器")
assert(extentCalculator(nil, {option = layoutPanel.gwOptions[1]}) == 40,
    "主开关行高应与玩家综合设置一致")

print("动作条原生控件复用回归检查通过")
