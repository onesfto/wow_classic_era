local function NewFrame(name, parent)
    local frame = {
        name = name,
        parent = parent,
        shown = true,
        width = 0,
        height = 0,
    }
    function frame:GetName() return self.name end
    function frame:GetParent() return self.parent end
    function frame:SetParent(value) self.parent = value end
    function frame:GetFrameLevel() return 1 end
    function frame:GetScale() return 1 end
    function frame:SetFrameStrata(value) self.strata = value end
    function frame:SetFrameLevel(value) self.level = value end
    function frame:SetSize(width, height)
        self.width, self.height = width, height
    end
    function frame:GetWidth() return self.width end
    function frame:GetHeight() return self.height end
    function frame:SetShown(value) self.shown = value end
    function frame:IsShown() return self.shown end
    function frame:ClearAllPoints() self.point = nil end
    function frame:SetPoint(point, relativeFrame, relativePoint, x, y)
        self.point = {point, relativeFrame, relativePoint, x, y}
    end
    function frame:RegisterEvent() end
    function frame:SetScript() end
    return frame
end

local addonTable = {}
local uiParent = NewFrame("UIParent")
local petFrame = NewFrame("GwPlayerPetFrame", uiParent)
petFrame.buttons = {}
local hooks = setmetatable({}, {__mode = "k"})
function petFrame:SetActionButtonPositionAndStyle()
    for _, button in ipairs(self.buttons) do button:SetParent(self) end
    local methods = hooks[self]
    for _, callback in ipairs(methods and methods.SetActionButtonPositionAndStyle or {}) do
        callback()
    end
end

_G.UIParent = uiParent
_G.GW2_ADDON = {
    settings = {},
    globalDefault = {profile = {}},
    MOVABLE_FRAMES = {},
    RegisterMovableFrame = function(frame, _, setting)
        local mover = NewFrame("Gw_" .. setting, uiParent)
        mover.setting = setting
        frame.gwMover = mover
        table.insert(_G.GW2_ADDON.MOVABLE_FRAMES, mover)
    end,
    setActionButtonStyle = function() end,
}
_G.NUM_PET_ACTION_SLOTS = 10
_G.GwPlayerPetFrame = nil
_G.InCombatLockdown = function() return false end
_G.RegisterStateDriver = function() end
_G.hooksecurefunc = function(target, method, callback)
    hooks[target] = hooks[target] or {}
    hooks[target][method] = hooks[target][method] or {}
    hooks[target][method][#hooks[target][method] + 1] = callback
end
_G.CreateFrame = function(_, name, parent)
    local frame = NewFrame(name, parent or uiParent)
    if name then _G[name] = frame end
    return frame
end

local db = {
    petBarShown = true,
    petBarCount = 10,
    petBarColumns = 5,
    petBarSize = 36,
    petBarSpacing = 3,
    petBarMiddleGap = 0,
    petBarShowHotkey = true,
    petBarHotkeyPosition = "TOPRIGHT",
    petBarHotkeyX = 0,
    petBarHotkeyY = 0,
    petBarHotkeySize = 12,
}
local inCombat = false
local queued
addonTable.PlusActionBar = {
    SIZE_MIN = 12,
    SIZE_MAX = 64,
    MULTIBARS = {},
    InitDB = function() return db end,
    EnsureMoverSettings = function(setting, default)
        local profile = _G.GW2_ADDON.globalDefault.profile
        profile[setting] = profile[setting] or default
        _G.GW2_ADDON.settings[setting] =
            _G.GW2_ADDON.settings[setting] or profile[setting]
        return true
    end,
    QueueOutOfCombat = function(_, callback)
        if inCombat then
            queued = callback
            return true
        end
        return false
    end,
    ApplyMainBarLayout = function() end,
}

local layoutChunk = assert(loadfile("Modules/ActionBar/Layout.lua"))
layoutChunk("GW2_UI_PLUS", addonTable)
local layout = assert(addonTable.PlusActionBarLayout)

assert(layout.EnsurePetBar, "缺少独立宠物动作条创建接口")
local holder = assert(layout.EnsurePetBar(), "未创建独立宠物动作条框体")
assert(layout.ApplyPetBar(),
    "宠物框体延迟创建时仍应先注册独立动作条 holder")
assert(holder:GetParent() == uiParent, "宠物动作条 holder 不应挂在宠物框体下")
assert(holder.gwMover and holder.gwMover.setting == "PetBar_pos",
    "宠物动作条未使用独立 mover")
assert(_G.GW2_ADDON.MOVABLE_FRAMES[1] == holder.gwMover,
    "独立宠物动作条 mover 未加入编辑模式列表")
local defaultPoint = _G.GW2_ADDON.globalDefault.profile.PetBar_pos
assert(defaultPoint.point == "BOTTOM" and defaultPoint.relativePoint == "BOTTOM"
        and defaultPoint.xOfs == 0 and defaultPoint.yOfs == 100,
    "宠物动作条默认位置错误")

for index = 1, 10 do
    petFrame.buttons[index] = NewFrame("PetActionButton" .. index, petFrame)
    local button = petFrame.buttons[index]
    button.InterruptDisplay = {
        Base = {Base = NewFrame(button.name .. "InterruptBase", button)},
    }
    button.gwInterruptDisplayMask = NewFrame(
        button.name .. "InterruptMask", button)
    button.Shine = NewFrame(button.name .. "Shine", button)
    button.Flash = NewFrame(button.name .. "Flash", button)
    button.InterruptDisplay.Base.Base:SetSize(32, 32)
    button.gwInterruptDisplayMask:SetSize(32, 32)
    button.Shine:SetSize(32, 32)
    button.Flash:SetSize(32, 32)
end
local function RunHooks(target, method, ...)
    local targetHooks = hooks[target]
    for _, callback in ipairs(targetHooks and targetHooks[method] or {}) do
        callback(...)
    end
end
_G.GW2_ADDON.LoadPetFrame = function()
    _G.GwPlayerPetFrame = petFrame
    RunHooks(_G.GW2_ADDON, "LoadPetFrame")
end
layout.Init()
_G.GW2_ADDON.LoadPetFrame()
assert(layout.ApplyPetBar(), "独立宠物动作条布局未应用")
assert(layout.GetPetBarFrame() == holder, "动作条接口返回了错误的 holder")
assert(holder.width == 5 * 36 + 4 * 3 and holder.height == 2 * 36 + 3,
    "holder 尺寸没有按宠物动作条网格计算")
assert(petFrame.buttons[1].InterruptDisplay.Base.Base.width == 36
        and petFrame.buttons[1].InterruptDisplay.Base.Base.height == 36
        and petFrame.buttons[1].gwInterruptDisplayMask.width == 36
        and petFrame.buttons[1].gwInterruptDisplayMask.height == 36,
    "宠物按钮尺寸变化后红色状态框必须同步更新")
assert(petFrame.buttons[1].Shine.width == 36
        and petFrame.buttons[1].Shine.height == 36
        and petFrame.buttons[1].Flash.width == 36
        and petFrame.buttons[1].Flash.height == 36,
    "宠物按钮尺寸变化后激活高亮层必须同步更新")
for index, button in ipairs(petFrame.buttons) do
    assert(button:GetParent() == holder,
        "宠物按钮没有统一挂到独立 holder: " .. index)
end

db.petBarMiddleGap = 35
db.petBarGapPosition = "SIDE"
db.petBarCount = 8
db.petBarColumns = 4
assert(layout.ApplyPetBar(), "左右空隙布局未应用")
assert(holder.width == 4 * 36 + 3 * 3 + 35
        and petFrame.buttons[1].point[4] == 0
        and petFrame.buttons[2].point[4] == 39
        and petFrame.buttons[3].point[4] == 113
        and petFrame.buttons[4].point[4] == 152
        and petFrame.buttons[5].point[4] == 0
        and petFrame.buttons[6].point[4] == 39
        and petFrame.buttons[7].point[4] == 113
        and petFrame.buttons[8].point[4] == 152
        and petFrame.buttons[5].point[5] == -39,
    "左右空隙应用时应按行填充按钮并分开左右两组")
db.petBarMiddleGap = 0
db.petBarGapPosition = "MIDDLE"
db.petBarCount = 10
db.petBarColumns = 5
assert(layout.ApplyPetBar(), "恢复上下空隙布局失败")

petFrame:SetActionButtonPositionAndStyle()
for index, button in ipairs(petFrame.buttons) do
    assert(button:GetParent() == holder,
        "原生重排后宠物按钮未重新挂回 holder: " .. index)
end

for _, button in ipairs(petFrame.buttons) do
    button:SetParent(petFrame)
    RunHooks(button, "SetParent", button, petFrame)
end
for index, button in ipairs(petFrame.buttons) do
    assert(button:GetParent() == holder,
        "宠物按钮父级被单独重置后未恢复到 holder: " .. index)
end

local initialWidth = holder.width
inCombat = true
db.petBarSize = 49
assert(layout.ApplyPetBar() == nil, "战斗中不应立即修改宠物动作条")
assert(holder.width == initialWidth and petFrame.buttons[1].width == 36,
    "战斗中提前修改了宠物动作条尺寸")
inCombat = false
assert(queued and queued(), "脱战后未应用排队的宠物动作条布局")
assert(holder.width == 5 * 49 + 4 * 3 and petFrame.buttons[1].width == 49,
    "脱战后宠物动作条尺寸未刷新")
assert(petFrame.buttons[1].InterruptDisplay.Base.Base.width == 49
        and petFrame.buttons[1].gwInterruptDisplayMask.width == 49
        and petFrame.buttons[1].Shine.width == 49
        and petFrame.buttons[1].Flash.width == 49,
    "宠物动作条二次调整尺寸后状态层未同步")

local oldPetFrameWidth = petFrame.width
local holderWidth = holder.width
petFrame:SetSize(600, 300)
assert(holder.width == holderWidth and petFrame.width == 600
        and oldPetFrameWidth ~= petFrame.width,
    "宠物框体尺寸变化不应改变独立动作条尺寸")

print("宠物独立动作条回归检查通过")
