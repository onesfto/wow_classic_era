#!/bin/sh
set -eu

title_file="Core/PanelTitle.lua"
toc_file="GW2_UI_PLUS.toc"
fixes_file="Core/Fixes.lua"

test -f "$title_file"
grep -F 'Core/PanelTitle.lua' "$toc_file" >/dev/null
grep -F 'local PANEL_BREADCRUMB_GAP = 24' "$title_file" >/dev/null
grep -F 'header:GetUnboundedStringWidth()' "$title_file" >/dev/null
grep -F 'crumb:ClearAllPoints()' "$title_file" >/dev/null
grep -F '"LEFT", header, "RIGHT", PANEL_BREADCRUMB_GAP, 0' "$title_file" >/dev/null
grep -F 'child.__gwPlusTitleManaged' "$fixes_file" >/dev/null

rg -l --glob '*.lua' 'GwSettingsPanelTmpl' . | while IFS= read -r panel_file
do
    grep -F 'addonTable.SetPanelTitle(' "$panel_file" >/dev/null
done

for panel_file in Modules/Settings/Settings.lua Modules/Settings/PartyTab.lua
do
    grep -F 'addonTable.SetPanelTitle(panel, header, breadcrumb)' "$panel_file" >/dev/null
done

if rg -F 'GetStringWidth() + 10' \
    Modules/ActionBar/Options.lua \
    Modules/ActionBar/Options_Utils.lua \
    Modules/ChatBar/Options.lua \
    Modules/ChatWindow/Options.lua \
    Modules/CooldownPulse/Options.lua \
    Modules/Minimap/Options.lua \
    Modules/Skins/Options.lua \
    Modules/Toolbar/Options.lua \
    Modules/UnitFrames/PlayerResources.lua >/dev/null; then
    exit 1
fi

lua - <<'LUA'
local addonTable = {}
assert(loadfile("Core/PanelTitle.lua"))("GW2_UI_PLUS", addonTable)

local header = {
    GetUnboundedStringWidth = function() return 96 end,
    SetText = function(self, text) self.text = text end,
    SetWidth = function(self, width) self.width = width end,
}
local breadcrumb = {
    SetText = function(self, text) self.text = text end,
    ClearAllPoints = function(self) self.cleared = true end,
    SetPoint = function(self, ...) self.point = {...} end,
}
addonTable.SetPanelTitle({header = header, breadcrumb = breadcrumb}, "长标题", "小标题")
assert(header.text == "长标题" and header.width == 96)
assert(breadcrumb.text == "小标题" and breadcrumb.cleared)
assert(breadcrumb.point[1] == "LEFT" and breadcrumb.point[2] == header)
assert(breadcrumb.point[3] == "RIGHT" and breadcrumb.point[4] == 24)
print("Plus 设置页标题布局回归检查通过")
LUA
