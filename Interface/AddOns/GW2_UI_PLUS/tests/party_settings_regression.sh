#!/bin/sh
set -eu

party_file="Modules/Settings/PartyTab.lua"
locale_file="Locale/Hardcoded.lua"

grep -F 'AddMenuEntry("小队", pages.party_general, false, false)' "$party_file" >/dev/null
grep -F 'tab.headerBreadcrumbText = "队伍"' "$party_file" >/dev/null
grep -F 'SetPanelText(partyPanel, "小队", "", "编辑小队设置。")' "$party_file" >/dev/null
grep -F 'SetPanelText(frame, "团队", subPanel.name, "编辑团队设置。")' "$party_file" >/dev/null
grep -F '{name = "团队:40", panelId = "raid40"}' "$party_file" >/dev/null
if grep -F '团队框体' "$party_file" >/dev/null; then
    exit 1
fi
sed -n '/local function ShowPage/,/local function LayoutButtons/p' "$party_file" \
    | grep -F 'HideCurrent()' >/dev/null
grep -F 'tab.callbackOnClose = RestoreAll' "$party_file" >/dev/null
grep -F 'RAID_STYLE_PARTY_AND_FRAMES' "$locale_file" >/dev/null
grep -F '团队中也显示小队' "$locale_file" >/dev/null

printf '%s\n' '队伍设置回归检查通过'
