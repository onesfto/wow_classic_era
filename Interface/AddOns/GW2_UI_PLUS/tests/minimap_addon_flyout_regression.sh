#!/bin/sh
set -eu

flyout_file="Modules/Minimap/AddonFlyout.lua"
options_file="Modules/Minimap/Options.lua"

grep -F 'local toggleName = "GwPlusAddonFlyoutToggle"' "$flyout_file" >/dev/null
grep -F 'MICROBAR_LEFT = true' "$flyout_file" >/dev/null
grep -F 'MICROBAR_RIGHT = true' "$flyout_file" >/dev/null
grep -F '"Button", toggleName, UIParent, "GwAddonToggle")' "$flyout_file" >/dev/null
grep -F 'hooksecurefunc("UpdateMicroButtons", QueueMicrobarRefresh)' "$flyout_file" >/dev/null
grep -F 'Gw2MicroBarFrame' "$flyout_file" >/dev/null
if grep -F '_G.GwAddonToggle' "$flyout_file" >/dev/null; then
    exit 1
fi

grep -F '"MICROBAR_LEFT", "MICROBAR_RIGHT"' "$options_file" >/dev/null
grep -F '"系统菜单左边", "系统菜单右边"' "$options_file" >/dev/null

printf '%s\n' '插件悬浮按钮独立入口回归检查通过'
