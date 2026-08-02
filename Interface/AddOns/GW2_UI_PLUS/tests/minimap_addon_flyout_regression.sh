#!/bin/sh
set -eu

flyout_file="Modules/Minimap/AddonFlyout.lua"
options_file="Modules/Minimap/Options.lua"
settings_utils_file="../GW2_UI/settings/settingsUtils.lua"
hud_file="../GW2_UI/settings/panels/panel_hud.lua"
core_file="core.lua"
mover_options_file="Modules/Settings/HudMoverOptions.lua"

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

# The micro bar and minimap expose the toolbar-style independent mover controls.
grep -F 'pages and pages.hud_microbar' "$mover_options_file" >/dev/null
grep -F 'pages and pages.hud_minimap' "$mover_options_file" >/dev/null
grep -F '"Gw2MicroBarFrame", "MicromenuPos"' "$mover_options_file" >/dev/null
grep -F '"Minimap", "MinimapPos", MINIMAP_DEFAULT' "$mover_options_file" >/dev/null
grep -F 'local MINIMAP_DEFAULT = {' "$mover_options_file" >/dev/null
sed -n '/local MINIMAP_DEFAULT = {/,/}/p' "$mover_options_file" \
    | grep -F 'point = "TOPRIGHT"' >/dev/null
grep -F 'function addonTable.BuildHudMoverOptions(settingsTab)' "$mover_options_file" >/dev/null
grep -F 'addonTable.BuildHudMoverOptions(settingsTab)' "$core_file" >/dev/null

lua - <<'LUA'
local function NewMover()
    local mover = {}
    function mover:EnableMouse(enabled) self.mouseEnabled = enabled end
    function mover:Hide() self.hidden = true end
    function mover:Show() self.hidden = false end
    function mover:ClearAllPoints() self.point = nil end
    function mover:SetPoint(...) self.point = {...} end
    return mover
end

local function NewFrame()
    local frame = {gwMover = NewMover()}
    function frame:SetAttribute(_, value) self.isMovedAttribute = value end
    function frame:RegisterEvent() end
    function frame:UnregisterEvent() end
    function frame:SetScript() end
    return frame
end

local function NewPanel()
    local panel = {options = {}}
    function panel:AddGroupHeader(name)
        self.options[#self.options + 1] = {name = name, optionType = "header"}
    end
    function panel:AddOptionButton(name, _, values)
        local option = {name = name, optionType = "button"}
        for key, value in pairs(values) do option[key] = value end
        self.options[#self.options + 1] = option
        return option
    end
    return panel
end

_G.GW2_ADDON = {
    settings = {
        MinimapPos = {
            point = "BOTTOMRIGHT", relativePoint = "BOTTOMRIGHT",
            xOfs = -5, yOfs = 21, hasMoved = false,
        },
        MicromenuPos = {
            point = "TOPLEFT", relativePoint = "TOPLEFT",
            xOfs = 0, yOfs = 1, hasMoved = false,
        },
    },
    globalDefault = {profile = {
        MinimapPos = {
            point = "BOTTOMRIGHT", relativePoint = "BOTTOMRIGHT",
            xOfs = -5, yOfs = 21, hasMoved = false,
        },
        MicromenuPos = {
            point = "TOPLEFT", relativePoint = "TOPLEFT",
            xOfs = 0, yOfs = 1, hasMoved = false,
        },
    }},
    RefreshSettingsPanel = function() end,
    UpdateMatchingLayout = function(mover, point)
        _G.matchingLayouts = _G.matchingLayouts or {}
        _G.matchingLayouts[#_G.matchingLayouts + 1] = {
            mover = mover,
            point = point,
        }
    end,
}
_G.Minimap = NewFrame()
_G.Gw2MicroBarFrame = NewFrame()
_G.UIParent = {}
_G.InCombatLockdown = function() return false end
_G.C_Timer = {After = function() end}
_G.CreateFrame = function() return NewFrame() end

local addon = {}
assert(loadfile("Modules/Settings/HudMoverOptions.lua"))("GW2_UI_PLUS", addon)
local microPanel, minimapPanel = NewPanel(), NewPanel()
assert(addon.BuildHudMoverOptions({gwPlusEmbeddedPanels = {
    hud_microbar = microPanel,
    hud_minimap = minimapPanel,
}}))

assert(GW2_ADDON.settings.MinimapPos.point == "TOPRIGHT")
assert(GW2_ADDON.settings.MinimapPos.relativePoint == "TOPRIGHT")
assert(Minimap.gwMover.point[1] == "TOPRIGHT")
assert(minimapPanel.options[2].name == "解锁/锁定")
minimapPanel.options[2].callback()
assert(Minimap.gwMover.gwPlusUnlocked == true)
assert(Minimap.gwMover.mouseEnabled == true)
minimapPanel.options[2].callback()
assert(Minimap.gwMover.gwPlusUnlocked == false)
assert(Minimap.gwMover.mouseEnabled == false)
local minimapLayoutCount = #matchingLayouts
minimapPanel.options[3].callback()
assert(Minimap.gwMover.point[1] == "TOPRIGHT")
assert(Minimap.isMoved == false)
assert(#matchingLayouts == minimapLayoutCount + 1)
assert(matchingLayouts[#matchingLayouts].mover == Minimap.gwMover)
assert(matchingLayouts[#matchingLayouts].point == GW2_ADDON.settings.MinimapPos)
assert(microPanel.options[2].name == "解锁/锁定")
microPanel.options[2].callback()
assert(Gw2MicroBarFrame.gwMover.gwPlusUnlocked == true)
local microLayoutCount = #matchingLayouts
microPanel.options[3].callback()
assert(Gw2MicroBarFrame.gwMover.point[1] == "TOPLEFT")
assert(#matchingLayouts == microLayoutCount + 1)
assert(matchingLayouts[#matchingLayouts].mover == Gw2MicroBarFrame.gwMover)
assert(matchingLayouts[#matchingLayouts].point == GW2_ADDON.settings.MicromenuPos)

print("微型系统菜单与微缩地图移动控制检查通过")
LUA

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
