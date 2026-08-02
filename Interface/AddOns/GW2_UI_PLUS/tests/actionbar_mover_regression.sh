#!/bin/sh
set -eu

lua - <<'LUA'
local function NewFrame()
    local frame = {}
    function frame:RegisterEvent() end
    function frame:UnregisterEvent() end
    function frame:SetScript() end
    function frame:ClearAllPoints() self.pointsCleared = true end
    function frame:SetPoint(_, _, _, x, y)
        self.x, self.y = x, y
    end
    function frame:SetAttribute(name, value) self[name] = value end
    return frame
end

CreateFrame = NewFrame
InCombatLockdown = function() return false end
UIParent = {}

local function CopyTable(source)
    local result = {}
    for key, value in pairs(source) do result[key] = value end
    return result
end

_G.GW2_ADDON = {
    CopyTable = CopyTable,
    settings = {
        TestActionBar_pos = {
            point = "CENTER", relativePoint = "CENTER",
            xOfs = 10, yOfs = 20, hasMoved = true,
        },
    },
    globalDefault = {
        profile = {
            TestActionBar_pos = {
                point = "BOTTOM", relativePoint = "BOTTOM",
                xOfs = 0, yOfs = 14, hasMoved = false,
            },
        },
    },
}

local addonTable = {}
assert(loadfile("Modules/ActionBar/ActionBar_Core.lua"))("GW2_UI_PLUS", addonTable)
assert(loadfile("Modules/ActionBar/ActionBar_Mover.lua"))("GW2_UI_PLUS", addonTable)

local mover = NewFrame()
mover.setting = "TestActionBar_pos"
mover.parent = NewFrame()
local bar = {gwMover = mover}

addonTable.PlusActionBar.ResetMoverPosition(bar)

assert(mover.x == 0 and mover.y == 14)
assert(mover.parent.isMoved == false)
assert(_G.GW2_ADDON.settings.TestActionBar_pos.hasMoved == false)
LUA

lua - <<'LUA'
local function NewFrame()
    local frame = {}
    function frame:RegisterEvent() end
    function frame:UnregisterEvent() end
    function frame:SetScript() end
    function frame:HookScript() end
    function frame:ClearAllPoints() end
    function frame:SetPoint() end
    function frame:SetSize() end
    function frame:SetHeight() end
    function frame:SetShown() end
    function frame:Show() end
    function frame:Hide() end
    function frame:SetOrientation() end
    function frame:SetHitRectInsets() end
    function frame:SetTexture() end
    function frame:SetAllPoints() end
    function frame:SetThumbTexture() end
    function frame:SetAutoFocus() end
    function frame:SetFont() end
    function frame:SetJustifyH() end
    function frame:SetText() end
    function frame:SetTextColor() end
    function frame:SetTexCoord() end
    function frame:SetMinMaxValues() end
    function frame:SetValueStep() end
    function frame:SetValue() end
    function frame:SetObeyStepOnDrag() end
    function frame:CreateFontString() return NewFrame() end
    function frame:CreateTexture() return NewFrame() end
    return frame
end

CreateFrame = function() return NewFrame() end
InCombatLockdown = function() return false end
unpack = unpack or table.unpack
_G.GW = nil
local options = NewFrame()
options.scaleSlider = NewFrame()
options.heightSlider = NewFrame()
options.movers = NewFrame()
options.default = NewFrame()
local moverSettingsFrame = {options = options}
local moveHudScaleableFrame = NewFrame()
moveHudScaleableFrame.moverSettingsFrame = moverSettingsFrame
_G.GW2_ADDON = {
    settings = {},
    MOVABLE_FRAMES = {},
    MoveHudScaleableFrame = moveHudScaleableFrame,
}

local addonTable = {}
assert(loadfile("Modules/ActionBar/ActionBar_Core.lua"))("GW2_UI_PLUS", addonTable)
assert(loadfile("Modules/ActionBar/ActionBar_Layout.lua"))("GW2_UI_PLUS", addonTable)

assert(pcall(addonTable.PlusActionBar.InitMoverOptions))
assert(_G.GW2_ADDON.MoveHudScaleableFrame.moverSettingsFrame.options.gwPlusActionBarOptions)
_G.MainActionBar = {}
moverSettingsFrame.childMover = {parent = _G.MainActionBar}
assert(pcall(addonTable.PlusActionBar.RefreshMoverOptionPanel))
assert(pcall(addonTable.PlusActionBar.ApplyNormalPlayerFrameVisibility))
LUA

printf '%s\n' '动作条移动器回归检查通过'
