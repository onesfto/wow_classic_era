#!/bin/sh
set -eu

flyout_file="Modules/Minimap/AddonFlyout.lua"
options_file="Modules/Minimap/Options.lua"
settings_utils_file="../GW2_UI/settings/settingsUtils.lua"
hud_file="../GW2_UI/settings/panels/panel_hud.lua"
core_file="core.lua"

grep -F 'local toggleName = "GwPlusAddonFlyoutToggle"' "$flyout_file" >/dev/null
grep -F 'MICROBAR_LEFT = true' "$flyout_file" >/dev/null
grep -F 'MICROBAR_RIGHT = true' "$flyout_file" >/dev/null
grep -F '"Button", toggleName, UIParent,' "$flyout_file" >/dev/null
grep -F '"SecureHandlerClickTemplate,GwAddonToggle")' "$flyout_file" >/dev/null
grep -F 'hooksecurefunc("UpdateMicroButtons", QueueMicrobarRefresh)' "$flyout_file" >/dev/null
grep -F 'Gw2MicroBarFrame' "$flyout_file" >/dev/null
grep -F 'local function SetToggleArrowDirection(toggle, rotation)' "$flyout_file" >/dev/null
grep -F 'texture:SetRotation(rotation)' "$flyout_file" >/dev/null
grep -F 'local function ApplyMinimapContainerLayout(toggle)' "$flyout_file" >/dev/null
grep -F 'local centerX = Minimap:GetCenter()' "$flyout_file" >/dev/null
grep -F 'ApplyMinimapContainerLayout(toggle)' "$flyout_file" >/dev/null
grep -F 'ApplyMicrobarContainerLayout(toggle, position)' "$flyout_file" >/dev/null
grep -F 'local microbarArrowOffset = 3' "$flyout_file" >/dev/null
grep -F 'local function SetPointWithYOffset(frame, point, yOffset)' "$flyout_file" >/dev/null
grep -F 'local function GetMicrobarFirstButton(microbar)' "$flyout_file" >/dev/null
grep -F 'local firstButton = _G.GwCharacterMicroButton' "$flyout_file" >/dev/null
grep -F 'or _G.CharacterMicroButton' "$flyout_file" >/dev/null
grep -F 'and -microbarArrowOffset or microbarArrowOffset' "$flyout_file" >/dev/null
sed -n '/local function ApplyMicrobarPosition/,/local function ApplyMinimapPosition/p' "$flyout_file" \
    | grep -F 'RestoreMicrobarLayout()' >/dev/null
sed -n '/local function ApplyMicrobarPosition/,/local function ApplyMinimapPosition/p' "$flyout_file" \
    | grep -F 'firstPoints = CapturePoints(first)' >/dev/null
sed -n '/local function ApplyMicrobarPosition/,/local function ApplyMinimapPosition/p' "$flyout_file" \
    | grep -F 'firstAnchorPoint = first.GwSetAnchorPoint' >/dev/null
sed -n '/local function ApplyMicrobarPosition/,/local function ApplyMinimapPosition/p' "$flyout_file" \
    | grep -F 'first.GwSetAnchorPoint = function(self)' >/dev/null
sed -n '/local function ApplyMicrobarPosition/,/local function ApplyMinimapPosition/p' "$flyout_file" \
    | grep -F 'first:GwSetAnchorPoint()' >/dev/null
sed -n '/local function ApplyMicrobarPosition/,/local function ApplyMinimapPosition/p' "$flyout_file" \
    | grep -F 'toggle, microbarState.firstPoints[1], verticalOffset' >/dev/null
sed -n '/local function ApplyMicrobarPosition/,/local function ApplyMinimapPosition/p' "$flyout_file" \
    | grep -F '"BOTTOMLEFT", toggle, "BOTTOMRIGHT", 4,' >/dev/null
sed -n '/local function ApplyMicrobarPosition/,/local function ApplyMinimapPosition/p' "$flyout_file" \
    | grep -F -- '-verticalOffset)' >/dev/null
sed -n '/local function ApplyMicrobarPosition/,/local function ApplyMinimapPosition/p' "$flyout_file" \
    | grep -F '"BOTTOMLEFT", last, "BOTTOMRIGHT", 4, verticalOffset' >/dev/null
sed -n '/local function RestoreMicrobarLayout/,/local function ApplyMicrobarPosition/p' "$flyout_file" \
    | grep -F 'microbarState.firstPoints' >/dev/null
sed -n '/local function RestoreMicrobarLayout/,/local function ApplyMicrobarPosition/p' "$flyout_file" \
    | grep -F 'microbarState.firstAnchorPoint' >/dev/null
sed -n '/local function UpdateButtons/,/local function ToggleContainer/p' "$flyout_file" \
    | grep -F 'toggle.gw_Showing = shownCount > 0' >/dev/null
sed -n '/local function UpdateButtons/,/local function ToggleContainer/p' "$flyout_file" \
    | grep -F 'button:SetFrameStrata("MEDIUM")' >/dev/null
sed -n '/local function UpdateButtons/,/local function ToggleContainer/p' "$flyout_file" \
    | grep -F 'toggle:Hide()' >/dev/null
grep -F 'local function EnsureNativeMinimapToggle()' "$flyout_file" >/dev/null
grep -F '"Button", "GwAddonToggle", UIParent, "GwAddonToggle")' "$flyout_file" >/dev/null
grep -F 'GW.CreateMinimapButtonsSack = function()' "$flyout_file" >/dev/null
grep -F 'EnsureNativeMinimapToggle()' "$flyout_file" >/dev/null

grep -F '"MICROBAR_LEFT", "MICROBAR_RIGHT"' "$options_file" >/dev/null
grep -F '"系统菜单左边", "系统菜单右边"' "$options_file" >/dev/null
grep -F 'maxButtons = 11' "$options_file" >/dev/null
grep -F 'opt.maxButtons = values.maxButtons' "$settings_utils_file" >/dev/null
grep -F 'local maxButtons = v.maxButtons or 10' "$settings_utils_file" >/dev/null
if grep -F 'matchControlWidth' "$settings_utils_file" >/dev/null; then
    exit 1
fi
grep -F 'name = "插件收纳"' "$core_file" >/dev/null
grep -F 'panel.breadcrumb:SetText("插件收纳")' "$options_file" >/dev/null
if grep -F 'Always show AddOn flyout button' "$hud_file" >/dev/null; then
    exit 1
fi

printf '%s\n' '插件悬浮按钮独立入口回归检查通过'
