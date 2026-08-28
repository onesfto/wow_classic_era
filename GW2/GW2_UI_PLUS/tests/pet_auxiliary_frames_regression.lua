local function NewFrame(name, parent)
    local frame = {
        name = name,
        parent = parent,
        shown = false,
        width = 0,
        height = 0,
        points = {},
    }
    function frame:GetName() return self.name end
    function frame:GetParent() return self.parent end
    function frame:SetParent(value) self.parent = value end
    function frame:SetSize(width, height)
        self.width, self.height = width, height
    end
    function frame:GetWidth() return self.width end
    function frame:GetHeight() return self.height end
    function frame:SetShown(value) self.shown = value end
    function frame:IsShown() return self.shown end
    function frame:Show() self.shown = true end
    function frame:Hide() self.shown = false end
    function frame:ClearAllPoints() self.points = {} end
    function frame:SetPoint(...) self.points[#self.points + 1] = {...} end
    function frame:RegisterEvent() end
    function frame:UnregisterEvent() end
    function frame:SetScript() end
    function frame:SetFrameStrata(value) self.strata = value end
    function frame:EnableMouse(value) self.mouseEnabled = value end
    function frame:CreateTexture()
        local texture = {}
        function texture:SetTexture(value) texture.texture = value end
        function texture:SetAllPoints(target) texture.allPoints = target end
        function texture:SetSize(width, height)
            texture.width, texture.height = width, height
        end
        function texture:ClearAllPoints() texture.point = nil end
        function texture:SetPoint(...) texture.point = {...} end
        function texture:SetTexCoord(...) texture.texCoord = {...} end
        return texture
    end
    return frame
end

local uiParent = NewFrame("UIParent")
_G.UIParent = uiParent
_G.GW2_UI_PLUS_SV = {}
_G.GW2_ADDON = {
    settings = {},
    globalDefault = {profile = {}},
    RegisterMovableFrame = function(frame, _, setting)
        local mover = NewFrame("Mover_" .. setting, uiParent)
        mover.setting = setting
        frame.gwMover = mover
        _G.GW2_ADDON.settings[setting] = _G.GW2_UI_PLUS_SV[setting]
            or _G.GW2_ADDON.globalDefault.profile[setting]
    end,
}
_G.NUM_PET_ACTION_SLOTS = 10
_G.UnitExists = function(unit) return unit == "pet" end
_G.HasPetUI = function() return true, true end
_G.GetPetHappiness = function() return 3, 125, 0 end
_G.format = string.format
_G.PET_DAMAGE_PERCENTAGE = "%d%%"
_G.PET_HAPPINESS3 = "快乐"
_G.LOSING_LOYALTY = "忠诚度下降"
_G.GAINING_LOYALTY = "忠诚度上升"
_G.CreateFrame = function(_, name, parent)
    local frame = NewFrame(name, parent or uiParent)
    if name then _G[name] = frame end
    return frame
end

local addonTable = {}
addonTable.PetFeed = {
    InitDB = function() return {buttonSize = 64} end,
    AttachButton = function(button) button.gwPlusProtected = true end,
}
local petChunk = assert(loadfile("Modules/UnitFrames/PetFrame.lua"))
petChunk("GW2_UI_PLUS", addonTable)
local petFrame = assert(addonTable.PlusPetFrame)

local right = petFrame.CalculateLayout({
    portraitPosition = "RIGHT",
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
})
assert(right.happiness == nil, "主体布局不应返回欢乐度坐标")

local auxiliaries = assert(petFrame.EnsureAuxiliaryFrames(),
    "应创建独立的宠物辅助框体")
assert(auxiliaries.happiness == _G.GwPlusPetHappiness,
    "欢乐度独立框体引用错误")
assert(auxiliaries.feed == _G.GwPlusPetFeed,
    "喂食独立框体引用错误")
assert(auxiliaries.happiness:GetParent() == uiParent
        and auxiliaries.feed:GetParent() == uiParent,
    "两个小图标必须直接挂在 UIParent 下")
assert(auxiliaries.happiness.gwMover.setting == "PetHappiness_pos"
        and auxiliaries.feed.gwMover.setting == "PetFeed_pos",
    "两个小图标必须使用不同的 mover")
assert(auxiliaries.happiness.gwMover ~= auxiliaries.feed.gwMover,
    "欢乐度和喂食不能共用 mover")
assert(auxiliaries.happiness.icon.point
        and auxiliaries.happiness.icon.point[5] == 1
        and auxiliaries.feed.icon.point
        and auxiliaries.feed.icon.point[5] == 0,
    "喂食图标应与动作条同轴，欢乐度图标保留原有偏移")

petFrame.UpdateAuxiliaryFrames()
assert(auxiliaries.happiness:IsShown() and auxiliaries.feed:IsShown(),
    "有效宠物状态下两个独立图标都应显示")

local db = petFrame.InitDB()
db.portraitEnabled = false
petFrame.UpdateAuxiliaryFrames()
assert(auxiliaries.happiness:IsShown() and auxiliaries.feed:IsShown(),
    "隐藏头像不能隐藏独立小图标")

db.happinessEnabled = false
db.feedEnabled = true
petFrame.UpdateAuxiliaryFrames()
assert(not auxiliaries.happiness:IsShown() and auxiliaries.feed:IsShown(),
    "欢乐度开关不能影响喂食图标")

_G.GetPetHappiness = function() return nil end
petFrame.UpdateAuxiliaryFrames()
assert(not auxiliaries.happiness:IsShown() and auxiliaries.feed:IsShown(),
    "无欢乐度数据时欢乐度图标必须隐藏")

print("宠物独立小图标回归检查通过")
