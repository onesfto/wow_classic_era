#!/bin/sh
set -eu

settings_file="Modules/Settings/Settings.lua"
hide_native_file="Modules/Settings/HideNativeSettings.lua"

grep -F 'local function HideNativePlayerSettings(settingsTab, embeddedPanels)' "$hide_native_file" >/dev/null
grep -F 'if data.itemData ~= playerParent and data.parent ~= playerParent then' "$hide_native_file" >/dev/null
grep -F 'HideNativePlayerSettings(settingsTab, embeddedPanels)' "$hide_native_file" >/dev/null
grep -F 'local function HideNativeRaidSettings(settingsTab, embeddedPanels, provider)' "$hide_native_file" >/dev/null
grep -F 'raid_general = true,' "$hide_native_file" >/dev/null
grep -F 'if data.itemData ~= raidParent and data.parent ~= raidParent then' "$hide_native_file" >/dev/null
grep -F 'HideNativeRaidSettings(settingsTab, embeddedPanels, provider)' "$hide_native_file" >/dev/null
grep -F 'unitframes_general = true,' "$hide_native_file" >/dev/null
grep -F 'local function HideNativeUnitFrameSettings(settingsTab, embeddedPanels, provider)' "$hide_native_file" >/dev/null
grep -F 'HideNativeUnitFrameSettings(settingsTab, embeddedPanels, provider)' "$hide_native_file" >/dev/null
grep -F 'unitframes_general = {header = "框体", breadcrumb = "框体颜色", sub = "编辑全局单位框体颜色。"}' "$settings_file" >/dev/null
grep -F 'CreateMenuButton("框体颜色", "unitframes_general", false)' "$settings_file" >/dev/null
grep -F 'player_general = {header = "玩家", breadcrumb = "综合", sub = "编辑玩家设置。"}' "$settings_file" >/dev/null
grep -F 'target_general = {header = "目标", breadcrumb = "综合", sub = "编辑目标设置。"}' "$settings_file" >/dev/null
grep -F 'target_of_target_general = {' "$settings_file" >/dev/null
grep -F 'target_of_target_fader = {' "$settings_file" >/dev/null
grep -F 'pet_general = {' "$settings_file" >/dev/null
grep -F 'pet_fader = {' "$settings_file" >/dev/null
grep -F '"宠物", "pet_general", true, "pet"' "$settings_file" >/dev/null
grep -F 'toggleMethod = "ToggleFaderOptions"' "$settings_file" >/dev/null
grep -F 'includePlayerTarget = true' "$settings_file" >/dev/null
grep -F 'preserveDynamicFlightVehicle = false' "$settings_file" >/dev/null
if grep -F 'HideEmbeddedFader(embeddedPanels.player_pet' "$hide_native_file" >/dev/null; then
    exit 1
fi
grep -F 'entry.panelId == panelId and not entry.isParent' "$settings_file" >/dev/null
grep -F 'local PANEL_BREADCRUMB_GAP = 24' "$settings_file" >/dev/null
grep -F 'panel.header:GetUnboundedStringWidth()' "$settings_file" >/dev/null
grep -F 'panel.breadcrumb:ClearAllPoints()' "$settings_file" >/dev/null
grep -F 'panel.breadcrumb:SetPoint(' "$settings_file" >/dev/null
grep -F 'PANEL_BREADCRUMB_GAP, 0)' "$settings_file" >/dev/null
grep -F '"目标的目标", "target_of_target_general", true, "targettarget"' "$settings_file" >/dev/null
grep -F 'target_of_target_fader' "$settings_file" >/dev/null
grep -F 'target_TARGET_ENABLED = "启用"' "$settings_file" >/dev/null
grep -F 'value == "unittarget"' "$settings_file" >/dev/null
grep -F 'and "目标" or' "$settings_file" >/dev/null
if grep -F 'CreateMenuButton("小队", "party_general"' "$settings_file" >/dev/null; then
    exit 1
fi

printf '%s\n' '框体设置回归检查通过'
