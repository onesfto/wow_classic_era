local frames = {}
local timers = {}
local equippedChecks = 0
local notices = {}
local suspendCalls = 0
local restoreCalls = 0
local restoresRemaining = 2

local function NewFrame(name)
    local frame = {
        name = name,
        events = {},
        scripts = {},
    }

    function frame:GetName() return self.name end
    function frame:RegisterEvent(event) self.events[event] = true end
    function frame:UnregisterEvent(event) self.events[event] = nil end
    function frame:IsEventRegistered(event) return self.events[event] == true end
    function frame:SetScript(script, handler) self.scripts[script] = handler end
    function frame:GetScript(script) return self.scripts[script] end

    frames[#frames + 1] = frame
    return frame
end

local source = NewFrame(nil)
for _, event in ipairs({
    "PLAYER_EQUIPMENT_CHANGED",
    "ACTION_RANGE_CHECK_UPDATE",
    "PLAYER_REGEN_ENABLED",
    "PLAYER_REGEN_DISABLED",
    "PLAYER_LEVEL_UP",
    "PLAYER_SPECIALIZATION_CHANGED",
}) do
    source:RegisterEvent(event)
end
source:SetScript("OnEvent", function() end)

local decoy = NewFrame(nil)
decoy:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
decoy:RegisterEvent("PLAYER_LEVEL_UP")
decoy:SetScript("OnEvent", function() end)

function EnumerateFrames(previous)
    if not previous then return frames[1] end
    for index, frame in ipairs(frames) do
        if frame == previous then
            return frames[index + 1]
        end
    end
end

function CreateFrame(_, name)
    return NewFrame(name)
end

C_Timer = {
    NewTimer = function(_, callback)
        local timer = {
            callback = callback,
            cancelled = false,
            Cancel = function(self) self.cancelled = true end,
        }
        timers[#timers + 1] = timer
        return timer
    end,
}

function IsEquippedAction()
    equippedChecks = equippedChecks + 1
    return true
end

ActionButton1 = {
    action = 1,
}
MultiBarRightButton1 = {
    action = 25,
}
ActionButton1Border = {
    SetVertexColor = function(self, ...)
        self.color = {...}
    end,
}

GW2_ADDON = {
    Notice = function(message)
        notices[#notices + 1] = message
    end,
}
local addonTable = {
    PlusActionBar = {
        IsBarShown = function()
            return true
        end,
        IsBarActive = function(barKey)
            return barKey ~= "bar4"
        end,
    },
    PlusFader = {
        SuspendExtraTargets = function()
            suspendCalls = suspendCalls + 1
            return restoresRemaining
        end,
        RestoreNextSuspendedTarget = function()
            restoreCalls = restoreCalls + 1
            restoresRemaining = restoresRemaining - 1
            return restoresRemaining > 0
        end,
    },
}

local chunk = assert(loadfile("ActionBar/Equipment.lua"))
chunk("GW2_UI_PLUS", addonTable)
local module = assert(addonTable.PlusEquipmentDebounce, "装备事件防抖模块没有创建")
assert(module.Init(), "没有找到 GW2 UI 动作条事件框体")

assert(not source:IsEventRegistered("PLAYER_EQUIPMENT_CHANGED"),
    "应从 GW2 UI 动作条事件框体取消装备事件")
assert(source:IsEventRegistered("ACTION_RANGE_CHECK_UPDATE"),
    "不得取消 GW2 UI 动作条框体的其他事件")
assert(decoy:IsEventRegistered("PLAYER_EQUIPMENT_CHANGED"),
    "不得修改不匹配的事件框体")

local eventFrame = assert(module.eventFrame, "Plus 没有创建装备事件框体")
local onEvent = assert(eventFrame:GetScript("OnEvent"), "Plus 装备事件框体没有 OnEvent")
onEvent(eventFrame, "PLAYER_EQUIPMENT_CHANGED")
onEvent(eventFrame, "PLAYER_EQUIPMENT_CHANGED")
onEvent(eventFrame, "PLAYER_EQUIPMENT_CHANGED")

assert(#timers == 3, "每次事件都应重置防抖计时器")
assert(timers[1].cancelled and timers[2].cancelled and not timers[3].cancelled,
    "只应保留最后一个防抖计时器")
assert(equippedChecks == 0, "静默期结束前不应扫描动作按钮")
assert(suspendCalls == 3, "每次换装事件都应确保额外动作条已暂时移出渐隐")

timers[3].callback()
assert(equippedChecks == 1, "连续换装结束后每个现有按钮只应扫描一次")
assert(ActionButton1Border.color and ActionButton1Border.color[2] == 1,
    "已装备动作的边框应更新为绿色")
assert(#notices == 1 and notices[1]:find("3") and notices[1]:find("扫描 × 1")
    and notices[1]:find("临时移出 × 2"),
    "应在聊天框汇总事件数、扫描次数和临时移出的动作条数")
assert(#timers == 4 and restoreCalls == 0, "扫描结束后应延迟恢复第一条动作条")

timers[4].callback()
assert(restoreCalls == 1 and #timers == 5, "仍有目标时应继续安排下一次恢复")
timers[5].callback()
assert(restoreCalls == 2 and #timers == 5, "最后一个目标恢复后应停止计时器")

print("EquipmentDebounce_test: OK")
