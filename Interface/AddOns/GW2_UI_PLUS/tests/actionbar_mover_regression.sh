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

printf '%s\n' '动作条移动器回归检查通过'
