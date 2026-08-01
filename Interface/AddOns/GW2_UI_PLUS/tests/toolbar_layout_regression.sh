#!/bin/sh
set -eu

core_file="Modules/Toolbar/Core.lua"
addon_core_file="core.lua"
options_file="Modules/Toolbar/Options.lua"
quickbar_file="Modules/Toolbar/QuickBar.lua"
marker_file="Modules/Toolbar/MarkerBar.lua"
performance_file="Modules/Toolbar/PerformanceBar.lua"
hide_native_file="Modules/Settings/HideNativeSettings.lua"

# Random-dungeon teleport is no longer a quick-bar action or an exposed option.
if grep -F 'teleport' "$quickbar_file" "$options_file" "$core_file" >/dev/null; then
    exit 1
fi

# The new toolbar layout exposes positioning controls and the role bar.
grep -F 'local function AddMoverToggle(panel, moduleKey)' "$options_file" >/dev/null
grep -F 'panel:AddGroupHeader("角色职责列")' "$options_file" >/dev/null
grep -F '"ROLE_BAR"' "$options_file" >/dev/null
grep -F '"ROLE_BAR_pos_scale"' "$options_file" >/dev/null

# Countdown defaults are limited to the requested 3–10 seconds everywhere.
grep -F 'min = 3, max = 10, step = 1, decimalNumbers = 0' "$options_file" >/dev/null
grep -F 'math.max(3, math.min(10,' "$quickbar_file" >/dev/null

# Marker and performance bars expose their new visual controls.
grep -F 'hideBackground = false,' "$core_file" >/dev/null
grep -F '"隐藏背景"' "$options_file" >/dev/null
grep -F 'db.hideBackground and 0 or 0.86' "$marker_file" >/dev/null
grep -F 'alignment = "CENTER",' "$core_file" >/dev/null
grep -F '"对齐"' "$options_file" >/dev/null
grep -F '{"LEFT", "CENTER", "RIGHT"}' "$options_file" >/dev/null
grep -F '{"左对齐", "居中", "右对齐"}' "$options_file" >/dev/null
grep -F 'function PerformanceBar.SetAlignment(value)' "$performance_file" >/dev/null

# Each requested visual row uses the existing 2/3/4-column renderer.
grep -F 'SetRow(3, groupEnabled, groupFade, groupScale)' "$options_file" >/dev/null
grep -F 'SetRow(4, quickButtons.leave, quickButtons.convert,' "$options_file" >/dev/null
grep -F 'SetRow(4, quickButtons.role, quickButtons.ready,' "$options_file" >/dev/null
grep -F 'SetRow(3, markerEnabled, hideBackground, markerScale)' "$options_file" >/dev/null
grep -F 'SetRow(3, metricOptions[1], metricOptions[2], metricOptions[3])' "$options_file" >/dev/null
grep -F 'InitializePanel(toolbarFrame)' "$addon_core_file" >/dev/null
grep -F 'widget:SetSize(width, 24)' Modules/ActionBar/Options_Utils.lua >/dev/null

# Unlocking a toolbar component must not enter GW2_UI's global Move HUD mode.
grep -F 'function Toolbar.ToggleComponentMover(moduleKey)' "$core_file" >/dev/null
grep -F 'Toolbar.ToggleComponentMover(moduleKey)' "$options_file" >/dev/null
if grep -F 'moveHudObjects' "$options_file" >/dev/null; then
    exit 1
fi
if grep -F 'lockHudObjects' "$options_file" >/dev/null; then
    exit 1
fi

# The role-bar setting is removed from the original HUD-general page.
sed -n '/-- 隐藏界面设置-综合面板中的特定选项/,/-- 调用 Settings.lua/p' \
    "$hide_native_file" | grep -F '"ROLE_BAR"' >/dev/null

lua - <<'LUA'
_G.GW2_ADDON = {
    GetSettingsTabFrame = true,
    settings = {
        FADE_GROUP_MANAGE_FRAME = false,
        ROLE_BAR = "IN_RAID",
        ROLE_BAR_pos_scale = 1,
    },
    globalDefault = {
        profile = {
            FADE_GROUP_MANAGE_FRAME = false,
            ROLE_BAR = "IN_RAID",
            ROLE_BAR_pos_scale = 1,
            ROLE_BAR_pos = {
                point = "TOPLEFT", relativePoint = "TOPLEFT",
                xOfs = 500, yOfs = 0, hasMoved = false,
            },
        },
    },
}

local function NewFrame()
    local frame = {}
    function frame:RegisterEvent() end
    function frame:UnregisterEvent() end
    function frame:SetScript() end
    function frame:SetFont() end
    function frame:SetTextColor() end
    function frame:SetText() end
    function frame:AddOption(name, _, values)
        local option = {name = name, optionType = "boolean"}
        for key, value in pairs(values) do option[key] = value end
        self.options = self.options or {}
        self.options[#self.options + 1] = option
        return option
    end
    function frame:AddOptionSlider(name, _, values)
        local option = frame:AddOption(name, nil, values)
        option.optionType = "slider"
        return option
    end
    function frame:AddOptionDropdown(name, _, values)
        local option = frame:AddOption(name, nil, values)
        option.optionType = "dropdown"
        return option
    end
    function frame:AddOptionButton(name, _, values)
        local option = frame:AddOption(name, nil, values)
        option.optionType = "button"
        return option
    end
    function frame:AddGroupHeader(name)
        self.options = self.options or {}
        self.options[#self.options + 1] = {name = name, optionType = "header"}
    end
    frame.header = NewFrame == nil and nil or {
        SetFont = function() end, SetTextColor = function() end,
        SetText = function() end,
    }
    frame.breadcrumb = {
        SetFont = function() end, SetTextColor = function() end,
        SetText = function() end,
    }
    frame.sub = {
        SetFont = function() end, SetTextColor = function() end,
        SetText = function() end,
    }
    return frame
end

CreateFrame = function() return NewFrame() end
InCombatLockdown = function() return false end
hooksecurefunc = function() end
UIParent = {}
unpack = table.unpack

local addonTable = {SetPanelTitle = function() end}
assert(loadfile("Modules/Toolbar/Core.lua"))("GW2_UI_PLUS", addonTable)
assert(loadfile("Modules/Toolbar/Options.lua"))("GW2_UI_PLUS", addonTable)

local roleFrame = {SetScale = function(self, value) self.scale = value end}
_G.GW_RaidCounter_Frame = roleFrame
local panel = addonTable.BuildToolbarPanel(NewFrame())
local roleScale
for _, option in ipairs(panel.options) do
    if option.optionName == "ROLE_BAR_pos_scale" then roleScale = option end
end
assert(roleScale and roleScale.setter)
roleScale.setter(1.25)
assert(_G.GW2_ADDON.settings.ROLE_BAR_pos_scale == 1.25)
assert(roleFrame.scale == 1.25)

local expectedColumns = {
    ["队伍管理"] = {3, 3, 3, 2, 2},
    ["快捷条"] = {2, 2, 4, 4, 4, 4, 4, 4, 4, 4, 2, 2, 2, 2, 2, 2},
    ["标记条"] = {3, 3, 3, 2, 2},
    ["角色职责列"] = {2, 2, 2, 2},
    ["性能条"] = {2, 2, 2, 2, 3, 3, 3},
}
local section, seen = nil, {}
for _, option in ipairs(panel.options) do
    if expectedColumns[option.name] and option.optionType == "header" then
        section = option.name
        seen[section] = {}
    elseif section and option.optionType ~= "header" then
        seen[section][#seen[section] + 1] = option.gwPlusColumns
    end
end
for name, columns in pairs(expectedColumns) do
    assert(#seen[name] == #columns, name .. " option count")
    for index, count in ipairs(columns) do
        assert(seen[name][index] == count,
            name .. " option " .. index .. " column count")
    end
end
LUA

printf '%s\n' '工具条布局回归检查通过'
