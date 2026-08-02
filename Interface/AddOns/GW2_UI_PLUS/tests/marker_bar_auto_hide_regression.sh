#!/bin/sh
set -eu

core_file="Modules/Toolbar/Core.lua"
marker_file="Modules/Toolbar/MarkerBar.lua"
options_file="Modules/Toolbar/Options.lua"

require_text() {
    if ! grep -F "$2" "$1" >/dev/null; then
        echo "标记条自动隐藏回归检查失败：$1 缺少 $2" >&2
        exit 1
    fi
}

require_text "$core_file" 'hideWhenNoPermission = true,'
require_text "$core_file" 'hideWhenNoTarget = true,'
require_text "$core_file" 'hideWhenSolo = true,'
require_text "$options_file" '"无权限时隐藏"'
require_text "$options_file" '"无目标时隐藏"'
require_text "$options_file" '"单人时隐藏"'
require_text "$options_file" 'Toolbar.markerBar.SetHideWhenNoPermission(value)'
require_text "$options_file" 'Toolbar.markerBar.SetHideWhenNoTarget(value)'
require_text "$options_file" 'Toolbar.markerBar.SetHideWhenSolo(value)'
require_text "$options_file" '"GW2PlusToolbarMarkerBarHideWhenNoPermission"'
require_text "$options_file" '"GW2PlusToolbarMarkerBarHideWhenNoTarget"'
require_text "$options_file" '"GW2PlusToolbarMarkerBarHideWhenSolo"'

lua - <<'LUA'
local inGroup = false
local inRaid = false
local hasTarget = true
local isLeader = false
local isAssistant = false
local db = {
    enabled = true,
    scale = 1,
    hideBackground = false,
    hideWhenNoPermission = true,
    hideWhenNoTarget = true,
    hideWhenSolo = true,
}

IsInGroup = function() return inGroup end
IsInRaid = function() return inRaid end
UnitExists = function(unit) return unit == "target" and hasTarget end
UnitIsGroupLeader = function() return isLeader end
UnitIsGroupAssistant = function() return isAssistant end

local function NewTexture()
    return {
        SetPoint = function() end,
        SetTexture = function() end,
        SetDesaturated = function() end,
    }
end

local function NewFrame()
    return {
        RegisterEvent = function() end,
        UnregisterEvent = function() end,
        SetScript = function() end,
        SetSize = function() end,
        RegisterForClicks = function(self, ...)
            self.clicks = {...}
        end,
        SetAttribute = function(self, key, value)
            self.attributes = self.attributes or {}
            self.attributes[key] = value
        end,
        SetBackdrop = function() end,
        SetBackdropColor = function() end,
        SetBackdropBorderColor = function() end,
        SetPoint = function() end,
        SetEnabled = function() end,
        SetAlpha = function() end,
        CreateTexture = NewTexture,
        SetShown = function(self, shown) self.shown = shown end,
        SetScale = function() end,
    }
end

CreateFrame = function() return NewFrame() end
local addonTable = {}
local Toolbar = {}
Toolbar.InitDB = function() return {markerBar = db} end
Toolbar.CreateBarFrame = function()
    local bar = NewFrame()
    Toolbar.bar = bar
    return bar
end
Toolbar.RegisterMover = function() end
Toolbar.SetMoverEnabled = function() end
Toolbar.QueueOutOfCombat = function(_, callback) callback() end
Toolbar.defaults = {markerBar = db}
addonTable.Toolbar = Toolbar

assert(loadfile("Modules/Toolbar/MarkerBar.lua"))("GW2_UI_PLUS", addonTable)

Toolbar.markerBar.Refresh()
local skullButton = Toolbar.markerBar.buttons[8]
assert(skullButton.clicks[1] == "LeftButtonUp",
    "标记按钮必须注册左键抬起点击")
assert(skullButton.attributes.type1 == "macro",
    "标记按钮必须使用左键安全宏动作")
assert(skullButton.attributes.macrotext1 == "/tm 8",
    "骷髅按钮必须绑定正确的团队标记宏")
assert(not Toolbar.bar.shown, "默认单人状态必须隐藏")

Toolbar.markerBar.SetHideWhenSolo(false)
assert(not db.hideWhenSolo, "单人隐藏开关必须写入配置")
assert(Toolbar.bar.shown, "关闭单人隐藏后必须显示")

Toolbar.markerBar.SetHideWhenSolo(true)
inGroup, inRaid, hasTarget = true, true, false
isLeader = true
Toolbar.markerBar.Refresh()
assert(not Toolbar.bar.shown, "默认无目标状态必须隐藏")

Toolbar.markerBar.SetHideWhenNoTarget(false)
assert(not db.hideWhenNoTarget, "无目标隐藏开关必须写入配置")
assert(Toolbar.bar.shown, "关闭无目标隐藏后必须显示")

Toolbar.markerBar.SetHideWhenNoTarget(true)
hasTarget = true
isLeader = false
Toolbar.markerBar.Refresh()
assert(not Toolbar.bar.shown, "团队无权限时必须隐藏")

Toolbar.markerBar.SetHideWhenNoPermission(false)
assert(not db.hideWhenNoPermission, "无权限隐藏开关必须写入配置")
assert(Toolbar.bar.shown, "关闭无权限隐藏后必须显示")

Toolbar.markerBar.SetHideWhenNoPermission(true)
isLeader = true
Toolbar.markerBar.Refresh()
assert(Toolbar.bar.shown, "团队队长且有目标时必须显示")
LUA

printf '%s\n' '标记条自动隐藏回归检查通过'
