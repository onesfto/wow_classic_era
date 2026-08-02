#!/bin/sh
set -eu

toolbar_options_file="Modules/Toolbar/Options.lua"
toolbar_core_file="Modules/Toolbar/Core.lua"
hide_native_file="Modules/Settings/HideNativeSettings.lua"

# The native setting is presented on the toolbar's group-management page and
# keeps its original storage key, dependency, and runtime callback.
grep -F 'local function AddGroupManageOptions(panel)' "$toolbar_options_file" >/dev/null
grep -F 'local function AddGroupManageFadeOption(panel)' "$toolbar_options_file" >/dev/null
grep -F 'GW.settings.FADE_GROUP_MANAGE_FRAME' "$toolbar_options_file" >/dev/null
grep -F 'GW.ToggleRaidControllFrame()' "$toolbar_options_file" >/dev/null
grep -F '["PARTY_FRAMES"] = true' "$toolbar_options_file" >/dev/null
grep -F 'SetOptionName(option, "FADE_GROUP_MANAGE_FRAME")' "$toolbar_options_file" >/dev/null

# Moving this setting must not rename the group-management mover.
grep -F 'groupManage = "队伍管理",' "$toolbar_core_file" >/dev/null

# The old HUD-general entry is removed so the setting has one home only.
sed -n '/-- 隐藏界面设置-综合面板中的特定选项/,/-- 调用 Settings.lua/p' \
    "$hide_native_file" | grep -F '"FADE_GROUP_MANAGE_FRAME"' >/dev/null

printf '%s\n' '队伍管理渐隐设置迁移回归检查通过'
