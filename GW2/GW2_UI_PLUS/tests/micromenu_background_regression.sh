#!/bin/sh
set -eu

plus_fixes_file="Core/Fixes.lua"
original_menu_file="../GW2_UI/Games/Shared/Micromenu/micromenu.lua"
original_template_file="../GW2_UI/Games/Shared/Micromenu/micromenu.xml"

# Plus must leave the original micro-menu background lifecycle untouched.
if grep -F 'ApplyMicroMenuBackgroundFix' "$plus_fixes_file" >/dev/null; then
    exit 1
fi

# The original UI owns this texture and its visibility behaviour.
grep -F 'windowcornermenu.png' "$original_template_file" >/dev/null
grep -F 'mbf.cf.bg:SetShown(not mbf.isMoved)' "$original_menu_file" >/dev/null
grep -F 'mbf.cf.bg:Hide()' "$original_menu_file" >/dev/null

printf '%s\n' '微缩系统菜单背景原始行为回归检查通过'
