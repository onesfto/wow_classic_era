#!/bin/sh
set -eu

module_file="Modules/UnitFrames/PartyInRaid.lua"
toc_file="GW2_UI_PLUS.toc"
locale_file="locale/Hardcoded.lua"

grep -F 'Modules/UnitFrames/PartyInRaid.lua' "$toc_file" >/dev/null
grep -F '在团队中显示玩家所在小队的小队框体' "$locale_file" >/dev/null
grep -F 'RAID_STYLE_PARTY_AND_FRAMES' "$module_file" >/dev/null
grep -F 'GetRaidRosterInfo' "$module_file" >/dev/null
grep -F 'UnitInRaid("player")' "$module_file" >/dev/null
grep -F 'InCombatLockdown()' "$module_file" >/dev/null
grep -F 'PLAYER_REGEN_ENABLED' "$module_file" >/dev/null
grep -F 'GW.UpdatePlayerInPartySetting(false)' "$module_file" >/dev/null
grep -F '[PARTY_FRAMES] = true' "$module_file" >/dev/null
grep -F '[RAID_STYLE_PARTY] = false' "$module_file" >/dev/null
if grep -F 'RAID_FRAMES' "$module_file" >/dev/null; then
    exit 1
fi

printf '%s\n' '团队内小队框体回归检查通过'
