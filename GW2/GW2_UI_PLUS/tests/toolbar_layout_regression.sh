#!/bin/sh
set -eu

core_file="Modules/Toolbar/Core.lua"
addon_core_file="core.lua"
components_file="Modules/Settings/ComponentsTab.lua"
options_file="Modules/Toolbar/Options.lua"
quickbar_file="Modules/Toolbar/QuickBar.lua"
marker_file="Modules/Toolbar/MarkerBar.lua"
performance_file="Modules/Toolbar/PerformanceBar.lua"
options_utils_file="Modules/ActionBar/Options_Utils.lua"
hide_native_file="Modules/Settings/HideNativeSettings.lua"

# Random-dungeon teleport is no longer a quick-bar action or an exposed option.
if grep -F 'teleport' "$quickbar_file" "$options_file" "$core_file" >/dev/null; then
    exit 1
fi

# Toolbar settings are split into dedicated child pages.
grep -F 'local function AddMoverToggle(panel, moduleKey)' "$options_file" >/dev/null
grep -F '"标记条", "gw2_ui_plus_toolbar_marker"' "$options_file" >/dev/null
grep -F '"快捷条", "gw2_ui_plus_toolbar_quick"' "$options_file" >/dev/null
grep -F '"队伍管理", "gw2_ui_plus_toolbar_group"' "$options_file" >/dev/null
grep -F '"角色职责", "gw2_ui_plus_toolbar_role"' "$options_file" >/dev/null
grep -F '"性能条", "gw2_ui_plus_toolbar_performance"' "$options_file" >/dev/null
grep -F 'children = toolbarFrame.toolbarPages' "$addon_core_file" >/dev/null
grep -F 'local RefreshMenu' "$components_file" >/dev/null
grep -F 'AddMenuEntry(entry.name, entry.frame, entry.children)' "$components_file" >/dev/null
grep -F 'entry.children' "$components_file" >/dev/null
grep -F 'ScrollUtil.InitScrollBoxListWithScrollBar(' "$components_file" >/dev/null
grep -F 'tab.menu.ScrollBox, tab.menu.ScrollBar, view' "$components_file" >/dev/null
grep -F 'tab.menu.ScrollBar:SetHideIfUnscrollable(true)' "$components_file" >/dev/null
grep -F 'tab.menu.ScrollBox:ClearAllPoints()' "$components_file" >/dev/null
grep -F 'tab.menu.ScrollBox:SetPoint("TOPLEFT", tab.menu, "TOPLEFT", 0, 0)' "$components_file" >/dev/null
if grep -F 'tab.menu.ScrollBox:Hide()' "$components_file" >/dev/null; then
    exit 1
fi
if grep -F 'tab.menu.ScrollBar:Hide()' "$components_file" >/dev/null; then
    exit 1
fi
if grep -F 'GwSettingsSettingsTabTemplate' "$options_file" >/dev/null; then
    exit 1
fi
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
grep -F 'SetRow(4, quickButtons.leave, quickButtons.convert,' "$options_file" >/dev/null
grep -F 'SetRow(4, quickButtons.role, quickButtons.ready,' "$options_file" >/dev/null
grep -F 'SetRow(3, metricOptions[1], metricOptions[2], metricOptions[3])' "$options_file" >/dev/null
grep -F 'InitializeToolbarPage(page)' "$options_file" >/dev/null
grep -F 'GW.RefreshSettingsPanel(page)' "$options_file" >/dev/null
grep -F 'widget:SetSize(width, 24)' "$options_utils_file" >/dev/null
grep -F 'if option.__widget then' "$options_utils_file" >/dev/null
grep -F 'option.__gwPlusWidget = option.__widget' "$options_utils_file" >/dev/null
grep -F 'local function SetupMasterToggleStyle(widget)' "$options_utils_file" >/dev/null
grep -F 'widget.masterToggleBg = widget:CreateTexture(nil, "BACKGROUND")' "$options_utils_file" >/dev/null
grep -F 'widget.masterToggleAccent = widget:CreateTexture(nil, "ARTWORK")' "$options_utils_file" >/dev/null
grep -F 'levelreward-sep.png' "$options_utils_file" >/dev/null
grep -F 'kind = "masterToggleSeparator"' "$options_utils_file" >/dev/null
grep -F 'SetupMasterToggleStyle(widget)' "$options_utils_file" >/dev/null
grep -F 'elseif not data.widgets and widget.isMasterToggle then' "$options_utils_file" >/dev/null
grep -F 'widget:SetPoint("TOPLEFT", row, "TOPLEFT", 8, -8' "$options_utils_file" >/dev/null
grep -F 'widget:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 8, 8)' "$options_utils_file" >/dev/null

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

local function NewFrame(template)
    local frame = {template = template}
    function frame:RegisterEvent() end
    function frame:UnregisterEvent() end
    function frame:SetScript() end
    function frame:SetFont() end
    function frame:SetTextColor() end
    function frame:SetText() end
    function frame:SetSize() end
    function frame:SetAllPoints() end
    function frame:SetPoint() end
    function frame:ClearAllPoints() end
    function frame:Hide() self.hidden = true end
    function frame:Show() self.hidden = false end
    function frame:SetShown(shown) self.hidden = not shown end
    function frame:SetScript(_, callback) self.onClick = callback end
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
    frame.menu = {
        search = {Hide = function() end},
        ScrollBox = {Hide = function() end},
        ScrollBar = {Hide = function() end},
    }
    if template == "GwSettingsPanelTmpl" then
        frame.scroll = {
            Hide = function() end,
            ScrollBox = {},
            ScrollBar = {},
        }
    end
    return frame
end

CreateFrame = function(_, _, _, template) return NewFrame(template) end
InCombatLockdown = function() return false end
hooksecurefunc = function() end
UIParent = {}
unpack = table.unpack

local addonTable = {SetPanelTitle = function() end}
assert(loadfile("Modules/Toolbar/Core.lua"))("GW2_UI_PLUS", addonTable)
assert(loadfile("Modules/Toolbar/Options.lua"))("GW2_UI_PLUS", addonTable)

local roleFrame = {SetScale = function(self, value) self.scale = value end}
_G.GW_RaidCounter_Frame = roleFrame
local toolbar = addonTable.BuildToolbarPanel(NewFrame())
assert(toolbar and toolbar.toolbarPages)
assert(toolbar.template == "GwSettingsPanelTmpl")
assert(toolbar.scroll, "注册到组件菜单的工具条根页必须具有 scroll")
assert(#toolbar.toolbarPages == 5)
local pages = {}
for _, entry in ipairs(toolbar.toolbarPages) do
    pages[entry.name] = entry.panel
end
local panel = pages["角色职责"]
local roleScale
for _, option in ipairs(panel.options) do
    if option.optionName == "ROLE_BAR_pos_scale" then roleScale = option end
end
assert(roleScale and roleScale.setter)
roleScale.setter(1.25)
assert(_G.GW2_ADDON.settings.ROLE_BAR_pos_scale == 1.25)
assert(roleFrame.scale == 1.25)

local expectedColumns = {
    ["队伍管理"] = {false, false, false, 2, 2},
    ["快捷条"] = {false, false, 4, 4, 4, 4, 4, 4, 4, 4, false, false, 2, 2, 2, 2},
    ["标记条"] = {false, false, false, false, false, false, 2, 2},
    ["角色职责列"] = {false, false, 2, 2},
    ["性能条"] = {false, false, false, false, 3, 3, 3, 2, 2},
}
for name, columns in pairs(expectedColumns) do
    local page = pages[name == "角色职责列" and "角色职责" or name]
    assert(page, name .. " page")
    local seen = {}
    for _, option in ipairs(page.options) do
        if option.optionType ~= "header" then
            seen[#seen + 1] = option.gwPlusColumns or false
        end
    end
    assert(#seen == #columns, name .. " option count")
    for index, count in ipairs(columns) do
        assert(seen[index] == count,
            name .. " option " .. index .. " column count")
    end
end

for _, entry in ipairs({
    {"队伍管理", "GW2PlusToolbarGroupManageEnable"},
    {"快捷条", "GW2PlusToolbarQuickBarEnable"},
    {"标记条", "GW2PlusToolbarMarkerBarEnable"},
    {"角色职责", "ROLE_BAR"},
    {"性能条", "GW2PlusToolbarPerformanceBarEnable"},
}) do
    local enableOption
    for _, option in ipairs(pages[entry[1]].options) do
        if option.optionName == entry[2] then enableOption = option end
    end
    assert(enableOption and enableOption.isMasterToggle)
    assert(enableOption.forceNewLine ~= false)
    assert(not enableOption.gwPlusColumns)
end

for _, pageName in ipairs({"标记条", "快捷条", "队伍管理", "性能条"}) do
    local unlockIndex, resetOption
    for index, option in ipairs(pages[pageName].options) do
        if option.name == "解锁/锁定" then unlockIndex = index end
        if option.name == "重置位置" then resetOption = option end
    end
    assert(unlockIndex and resetOption)
    assert(pages[pageName].options[unlockIndex + 1] == resetOption)
    assert(resetOption.isNegativeButton)
end
LUA

printf '%s\n' '工具条布局回归检查通过'
