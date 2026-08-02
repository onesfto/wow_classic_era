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

print("动作条原生控件复用回归检查通过")
