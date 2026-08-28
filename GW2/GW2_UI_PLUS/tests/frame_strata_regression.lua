local function NewFrame(name)
    local frame = {
        name = name,
        strata = "HIGH",
        level = 7,
        events = {},
    }

    function frame:SetFrameStrata(value)
        self.strata = value
    end

    function frame:SetFrameLevel(value)
        self.level = value
    end

    function frame:RegisterEvent(event)
        self.events[event] = true
    end

    function frame:UnregisterEvent(event)
        self.events[event] = nil
    end

    function frame:SetScript() end

    function frame:GetChildren()
        local unpackValues = table.unpack or unpack
        return unpackValues(self.children or {})
    end

    return frame
end

local combat = false
_G.InCombatLockdown = function()
    return combat
end

_G.CreateFrame = function(_, name)
    local frame = NewFrame(name)
    if name then _G[name] = frame end
    return frame
end

_G.UIParent = NewFrame("UIParent")
local targetClassPower = NewFrame("anonymousTargetClassPower")
targetClassPower.runeTex1 = true
targetClassPower.combo1 = true
targetClassPower.comboFlare = true
_G.UIParent.children = {targetClassPower}

local function AddGlobal(name)
    _G[name] = NewFrame(name)
    return _G[name]
end

local bottomLeft = AddGlobal("GwMultiBarBottomLeft")
local bottomRight = AddGlobal("GwMultiBarBottomRight")
local bottomLeftButton = NewFrame("MultiBarBottomLeftButton1")
local bottomRightButton = NewFrame("MultiBarBottomRightButton1")
bottomLeft.children = {bottomLeftButton}
bottomRight.children = {bottomRightButton}

for _, name in ipairs({
    "MainActionBar",
    "GwPlayerUnitFrame",
    "TaxiFrame",
    "GwPlusPetHappiness",
    "GwPlusPetFeed",
    "GwPartyFrame1",
    "GW2_Raid40GridContainer",
    "GwRaidMarkerButton1",
    "GwWorldMarkerButton1",
    "GW2PlusVehicleLeaveButton",
    "MainMenuBarVehicleLeaveButton",
    "ChatFrame1",
    "GwQuestTracker",
    "QuestTimerFrame",
    "GW2UIPlayerBuffs",
    "GW2UIPlayerDebuffs",
}) do
    AddGlobal(name)
end

local addonTable = {}
local frameStrataChunk = assert(loadfile("Core/FrameStrata.lua"))
frameStrataChunk("GW2_UI_PLUS", addonTable)

assert(type(addonTable.ApplyFrameStrata) == "function",
    "缺少集中设置框体层级的函数")
addonTable.ApplyFrameStrata()

assert(MainActionBar.strata == "BACKGROUND" and MainActionBar.level == 10,
    "普通框体必须设置为 BACKGROUND/10")
assert(bottomLeft.strata == "BACKGROUND" and bottomLeft.level == 10
        and bottomLeftButton.strata == "BACKGROUND"
        and bottomLeftButton.level == 11,
    "动作条2的按钮必须高于动作条父框体")
assert(bottomRight.strata == "BACKGROUND" and bottomRight.level == 10
        and bottomRightButton.strata == "BACKGROUND"
        and bottomRightButton.level == 11,
    "动作条3的按钮必须高于动作条父框体")
assert(GwPlusPetHappiness.strata == "BACKGROUND"
        and GwPlusPetHappiness.level == 11,
    "宠物欢乐度必须设置为 BACKGROUND/11")
assert(GwPlusPetFeed.strata == "BACKGROUND" and GwPlusPetFeed.level == 11,
    "宠物喂食必须设置为 BACKGROUND/11")
assert(GwPartyFrame1.strata == "BACKGROUND" and GwPartyFrame1.level == 10,
    "动态队伍框体必须被处理")
assert(GW2_Raid40GridContainer.strata == "BACKGROUND"
        and GW2_Raid40GridContainer.level == 10,
    "团队容器必须被处理")
assert(GW2PlusVehicleLeaveButton.strata == "BACKGROUND"
        and MainMenuBarVehicleLeaveButton.strata == "BACKGROUND"
        and GW2PlusVehicleLeaveButton.level == 10
        and MainMenuBarVehicleLeaveButton.level == 10,
    "飞行请求终止框必须被处理")
assert(targetClassPower.strata == "BACKGROUND" and targetClassPower.level == 10,
    "无全局名称的目标职业资源条必须被处理")
assert(GwRaidMarkerButton1.strata == "BACKGROUND"
        and GwWorldMarkerButton1.strata == "BACKGROUND"
        and ChatFrame1.strata == "BACKGROUND",
    "动态标记和聊天框必须被处理")

local optional = NewFrame("Optional")
optional:SetFrameStrata("HIGH")
optional:SetFrameLevel(9)
_G.GwOptionalTestFrame = optional
addonTable.ApplyFrameStrata()
assert(optional.strata == "HIGH" and optional.level == 9,
    "不存在或未列入范围的可选框体不应被误改")

MainActionBar.strata = "HIGH"
MainActionBar.level = 9
combat = true
addonTable.ApplyFrameStrata()
assert(MainActionBar.strata == "HIGH" and MainActionBar.level == 9,
    "战斗锁定时不能修改框体层级")

print("框体层级回归检查通过")
