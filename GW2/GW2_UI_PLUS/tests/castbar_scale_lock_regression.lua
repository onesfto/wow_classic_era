local addonTable = {}
local scaleableFrames = {}
local defaultProfile = {castingbar_pos_scale = 2}
local settings = {castingbar_pos_scale = 1.5}

local GW = {
    settings = settings,
    globalDefault = {profile = defaultProfile},
    scaleableFrames = scaleableFrames,
    globalSettings = {},
    CopyTable = function(source)
        local copy = {}
        for key, value in pairs(source) do copy[key] = value end
        return copy
    end,
}
function GW.globalSettings.RegisterCallback(_, _, callback)
    GW.castbarProfileCallback = callback
end
_G.GW2_ADDON = GW
_G.CreateFrame = function()
    return {SetScript = function() end}
end
_G.InCombatLockdown = function() return false end

local actionBarCore = assert(loadfile("Modules/ActionBar/ActionBar_Core.lua"))
actionBarCore("GW2_UI_PLUS", addonTable)
local actionBarMover = assert(loadfile("Modules/ActionBar/ActionBar_Mover.lua"))
actionBarMover("GW2_UI_PLUS", addonTable)

local frame = {scale = 1.5, isMoved = true}
function frame:SetScale(value) self.scale = value end
local mover = {parent = frame, setting = "castingbar_pos", scale = 1.5,
    optionScaleable = true}
function mover:SetScale(value) self.scale = value end
frame.gwMover = mover
_G.GwCastingBarPlayer = frame
scaleableFrames[1] = mover

assert(addonTable.PlusActionBar.defaults.castbarWidth == 300,
    "施法条宽度默认值不是 300")
assert(addonTable.PlusActionBar.defaults.castbarHeight == 15,
    "施法条高度默认值不是 15")

assert(type(addonTable.PlusActionBar.EnforceCastbarScale) == "function",
    "缺少施法条固定缩放函数")
addonTable.PlusActionBar.EnforceCastbarScale()

assert(frame.scale == 1, "施法条当前缩放未固定为 1")
assert(mover.scale == 1, "施法条移动框体缩放未固定为 1")
assert(settings.castingbar_pos_scale == 1,
    "施法条当前缩放配置未固定为 1")
assert(defaultProfile.castingbar_pos_scale == 1,
    "施法条默认缩放配置未固定为 1")
assert(mover.optionScaleable == false,
    "施法条移动选项仍允许缩放")
assert(scaleableFrames[1] == nil,
    "施法条仍在全局可缩放框体列表中")
assert(type(GW.castbarProfileCallback) == "function",
    "施法条未注册配置切换固定缩放回调")

settings.castingbar_pos_scale = 1.5
defaultProfile.castingbar_pos_scale = 1.5
frame.scale = 1.5
mover.scale = 1.5
mover.optionScaleable = true
scaleableFrames[1] = mover
GW.castbarProfileCallback()
assert(frame.scale == 1, "配置切换后施法条缩放未固定为 1")
assert(mover.scale == 1, "配置切换后施法条移动框体缩放未固定为 1")
assert(settings.castingbar_pos_scale == 1,
    "配置切换后施法条缩放配置未固定为 1")
assert(defaultProfile.castingbar_pos_scale == 1,
    "配置切换后施法条默认缩放配置未固定为 1")
assert(mover.optionScaleable == false,
    "配置切换后施法条移动选项仍允许缩放")
assert(scaleableFrames[1] == nil,
    "配置切换后施法条仍在全局可缩放框体列表中")

print("施法条默认尺寸与固定缩放检查通过")
