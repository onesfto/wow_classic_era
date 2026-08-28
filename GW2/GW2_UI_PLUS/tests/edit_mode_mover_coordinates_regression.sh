#!/bin/sh
set -eu

lua - <<'LUA'
local function NewFrame()
    local frame = {scripts = {}}
    function frame:RegisterEvent() end
    function frame:SetScript(name, callback) self.scripts[name] = callback end
    function frame:HookScript(name, callback)
        local original = self.scripts[name]
        self.scripts[name] = function(...)
            if original then original(...) end
            callback(...)
        end
    end
    function frame:GetText() return self.text end
    function frame:SetText(text) self.text = text end
    return frame
end

CreateFrame = function() return NewFrame() end
NPE_MOVE = "移动"
unpack = unpack or table.unpack
UIParent = {}

local title = NewFrame()
title.text = "移动"
local movers = NewFrame()
movers.title = title
for _, direction in ipairs({"left", "right", "up", "down"}) do
    movers[direction] = NewFrame()
end
local options = {movers = movers, default = NewFrame()}
local settings = {options = options}
local container = {moverSettingsFrame = settings}

_G.GW2_ADDON = {
    MoveHudScaleableFrame = container,
    MOVABLE_FRAMES = {},
    RoundInt = function(value) return math.floor(value + 0.5) end,
}

local addonTable = {}
assert(loadfile("Modules/Settings/EditModeMoverCoordinates.lua"))(
    "GW2_UI_PLUS", addonTable)
addonTable.SetupEditModeMoverCoordinates()

assert(title.text == "移动", "未选中组件时不应改写标题")

local mover = NewFrame()
mover.point = {"CENTER", UIParent, "CENTER", 12.6, -8.2}
function mover:GetPoint() return unpack(self.point) end
settings.childMover = mover
_G.GW2_ADDON.MOVABLE_FRAMES[1] = mover
addonTable.SetupEditModeMoverCoordinates()
mover.scripts.OnClick(mover)
assert(title.text == "移动  X: 13  Y: -8")

mover.point[4], mover.point[5] = 14.4, -7.6
mover.scripts.OnDragStop(mover)
assert(title.text == "移动  X: 14  Y: -8")

mover.point[4], mover.point[5] = 18.1, 1.4
movers.left.scripts.OnClick(movers.left)
assert(title.text == "移动  X: 18  Y: 1")

mover.point[4], mover.point[5] = 20.2, 30.6
movers.scripts.OnUpdate(movers, 0.05)
assert(title.text == "移动  X: 18  Y: 1", "刷新必须节流")
movers.scripts.OnUpdate(movers, 0.05)
assert(title.text == "移动  X: 20  Y: 31")

settings.childMover = nil
movers.scripts.OnUpdate(movers, 1)
assert(title.text == "移动  X: 20  Y: 31", "未选中时不应改写标题")

settings.childMover = mover
mover.point[4] = nil
addonTable.UpdateEditModeMoverCoordinates()
assert(title.text == "移动  X: 20  Y: 31", "无效坐标不应覆盖标题")
LUA

printf '%s\n' '编辑模式移动坐标回归检查通过'
