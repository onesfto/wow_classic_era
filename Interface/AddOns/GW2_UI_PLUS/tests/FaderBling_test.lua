local frames = {}
local combat = false
local hasTarget = false

local function NewFrame(name, parent)
    local frame = {
        name = name,
        parent = parent,
        alpha = 1,
        scripts = {},
        shown = true,
    }

    function frame:CreateAnimationGroup()
        local group = {}
        function group:SetLooping() end
        function group:CreateAnimation()
            local animation = {}
            function animation:SetFromAlpha() end
            function animation:SetToAlpha() end
            function animation:SetDuration() end
            return animation
        end
        function group:SetScript() end
        function group:Stop() end
        function group:Play() end
        return group
    end

    function frame:SetAllPoints() end
    function frame:RegisterEvent() end
    function frame:UnregisterEvent() end
    function frame:RegisterUnitEvent() end
    function frame:SetScript(script, handler) self.scripts[script] = handler end
    function frame:GetScript(script) return self.scripts[script] end
    function frame:HookScript() end
    function frame:GetAlpha() return self.alpha end
    function frame:SetAlpha(alpha) self.alpha = alpha end
    function frame:GetParent() return self.parent end
    function frame:SetParent(newParent) self.parent = newParent end
    function frame:IsShown() return self.shown end
    function frame:IsMouseOver() return false end

    frames[name] = frame
    return frame
end

UIParent = NewFrame("UIParent")
GW2_ADDON = {}
C_Timer = {
    NewTimer = function()
        return {Cancel = function() end}
    end,
}

function CreateFrame(_, name, parent)
    return NewFrame(name, parent)
end

function UnitAffectingCombat() return combat end
function UnitExists() return hasTarget end
function UnitCastingInfo() return nil end
function UnitChannelInfo() return nil end
function UnitHealth() return 100 end
function UnitHealthMax() return 100 end

local button = NewFrame("ActionButton1", UIParent)
button.cooldown = {
    SetDrawBling = function(self, enabled)
        self.drawBling = enabled
    end,
}

MainActionBar = NewFrame("MainActionBar", UIParent)
MainActionBar.gw_Buttons = {[1] = button}

local multibarFrames = {}
for _, name in ipairs({
    "GwMultiBarBottomLeft",
    "GwMultiBarBottomRight",
    "GwMultiBarRight",
    "GwMultiBarLeft",
}) do
    local frame = NewFrame(name, UIParent)
    frame.gw_Buttons = {}
    _G[name] = frame
    multibarFrames[#multibarFrames + 1] = frame
end

local db = {
    fadeEnable = true,
    fadeAlpha = 0.5,
    fadeDelay = 0,
    keepInCombat = true,
    keepOnTarget = false,
    keepOnCasting = false,
    keepOnHealth = false,
    fadeBar1 = true,
    fadeBar2 = true,
    fadeBar3 = true,
    fadeBar4 = true,
    fadeBar5 = true,
}

local addonTable = {
    PlusActionBar = {
        MULTIBARS = {
            [2] = {frame = "GwMultiBarBottomLeft"},
            [3] = {frame = "GwMultiBarBottomRight"},
            [4] = {frame = "GwMultiBarRight"},
            [5] = {frame = "GwMultiBarLeft"},
        },
        InitDB = function() return db end,
        QueueOutOfCombat = function() return false end,
        IsBarShown = function()
            return true
        end,
        IsBarActive = function(barKey)
            return barKey ~= "bar4"
        end,
    },
}

local chunk = assert(loadfile("ActionBar/Fader.lua"))
chunk("GW2_UI_PLUS", addonTable)
addonTable.PlusFader.Init()

assert(button.cooldown.drawBling == false, "alpha 0.5 淡出时应关闭 Bling")

db.keepOnTarget = true
hasTarget = true
addonTable.PlusFader.EvaluateState()
assert(button.cooldown.drawBling == false,
    "旧的“有目标时不渐隐”存档不应再参与判断")
db.keepOnTarget = false
hasTarget = false

combat = true
addonTable.PlusFader.EvaluateState()
assert(button.cooldown.drawBling == true, "恢复全亮时应开启 Bling")

db.fadeAlpha = 0.6
combat = false
addonTable.PlusFader.EvaluateState()
assert(button.cooldown.drawBling == true, "alpha 大于 0.5 时应保留 Bling")

db.fadeAlpha = 0.5
combat = true
addonTable.PlusFader.EvaluateState()
combat = false
addonTable.PlusFader.EvaluateState()
assert(button.cooldown.drawBling == false, "再次淡出到 alpha 0.5 时应关闭 Bling")

db.fadeEnable = false
addonTable.PlusFader.Refresh()
assert(button.cooldown.drawBling == true, "关闭全局渐隐时应恢复 Bling")

db.fadeEnable = true
addonTable.PlusFader.Refresh()
local fader = frames.GwPlusActionBarFader
assert(multibarFrames[3]:GetParent() == UIParent,
    "隐藏动作条即使勾选渐隐也不能挂到渐隐父框体")
assert(addonTable.PlusFader.SuspendExtraTargets(3) == 1,
    "隐藏动作条不能计入换装暂停队列")
assert(MainActionBar:GetParent() == fader
    and multibarFrames[1]:GetParent() == fader
    and multibarFrames[2]:GetParent() == fader,
    "前三个参与目标应继续保持渐隐")
assert(multibarFrames[3]:GetParent() == UIParent and multibarFrames[4]:GetParent() == UIParent,
    "隐藏目标应留在原父级，第四个有效目标应暂时恢复原父级")

assert(not addonTable.PlusFader.RestoreNextSuspendedTarget(),
    "唯一的等待目标恢复后不应再有目标")
assert(multibarFrames[3]:GetParent() == UIParent,
    "隐藏动作条在恢复阶段仍不能重新参与渐隐")
assert(multibarFrames[4]:GetParent() == fader, "最后一个目标应重新参与渐隐")

print("FaderBling_test: OK")
