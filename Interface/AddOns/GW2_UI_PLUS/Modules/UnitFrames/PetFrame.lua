local _, addonTable = ...

local PetFrame = {}
addonTable.PlusPetFrame = PetFrame

local DEFAULTS = {
    portraitPosition = "RIGHT",
    portraitSize = 60,
    portraitOffsetX = 0,
    portraitOffsetY = 0,
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
    happinessEnabled = true,
    feedEnabled = true,
}
local PORTRAIT_SIZE_MIN = 20
local PORTRAIT_SIZE_MAX = 200
local PORTRAIT_OFFSET_MIN = -200
local PORTRAIT_OFFSET_MAX = 200
local AUXILIARY_MOVER_DEFAULTS = {
    happiness = {
        point = "BOTTOM",
        relativePoint = "BOTTOM",
        xOfs = -285,
        yOfs = 205,
        hasMoved = false,
    },
    feed = {
        point = "BOTTOM",
        relativePoint = "BOTTOM",
        xOfs = -315,
        yOfs = 205,
        hasMoved = false,
    },
}
PetFrame.AuxiliaryMoverDefaults = AUXILIARY_MOVER_DEFAULTS
local PET_HAPPINESS_SPRITE = {
    width = 512,
    height = 128,
    colums = 4,
    rows = 1,
}
local PORTRAIT_POSITIONS = {"TOP", "BOTTOM", "LEFT", "RIGHT", "HIDDEN"}
local PORTRAIT_POSITION_NAMES = {"中上", "中下", "左边", "右边", "隐藏"}
local PORTRAIT_POSITION_SET = {}
for _, position in ipairs(PORTRAIT_POSITIONS) do
    PORTRAIT_POSITION_SET[position] = true
end

local function Clamp(value, minimum, maximum)
    value = tonumber(value) or minimum
    return math.max(minimum, math.min(maximum, math.floor(value + 0.5)))
end

local function SetShown(frame, shown)
    if not frame then return end
    if frame.SetShown then
        frame:SetShown(shown)
    elseif shown then
        frame:Show()
    else
        frame:Hide()
    end
end

local function SetTopLeft(frame, parent, x, y)
    if not frame or not frame.ClearAllPoints then return end
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", parent, "TOPLEFT", x, -y)
end

local function SetSize(frame, width, height)
    if frame and frame.SetSize then frame:SetSize(width, height) end
end

function PetFrame.InitDB()
    GW2_UI_PLUS_SV = type(GW2_UI_PLUS_SV) == "table"
        and GW2_UI_PLUS_SV or {}
    local db = GW2_UI_PLUS_SV.petFrame
    if type(db) ~= "table" then
        db = {}
        GW2_UI_PLUS_SV.petFrame = db
    end
    for key, value in pairs(DEFAULTS) do
        if db[key] == nil then db[key] = value end
    end
    if not PORTRAIT_POSITION_SET[db.portraitPosition] then
        db.portraitPosition = DEFAULTS.portraitPosition
    end
    db.portraitSize = Clamp(
        db.portraitSize, PORTRAIT_SIZE_MIN, PORTRAIT_SIZE_MAX)
    db.portraitOffsetX = Clamp(
        db.portraitOffsetX, PORTRAIT_OFFSET_MIN, PORTRAIT_OFFSET_MAX)
    db.portraitOffsetY = Clamp(
        db.portraitOffsetY, PORTRAIT_OFFSET_MIN, PORTRAIT_OFFSET_MAX)
    db.healthWidth = Clamp(db.healthWidth, 100, 600)
    db.healthHeight = Clamp(db.healthHeight, 1, 100)
    db.powerHeight = Clamp(db.powerHeight, 1, 20)
    db.happinessEnabled = db.happinessEnabled ~= false
    db.feedEnabled = db.feedEnabled ~= false
    return db
end

function PetFrame.CalculateLayout(frameDB)
    frameDB = frameDB or DEFAULTS
    local position = PORTRAIT_POSITION_SET[frameDB.portraitPosition]
        and frameDB.portraitPosition or DEFAULTS.portraitPosition
    local healthWidth = Clamp(frameDB.healthWidth, 100, 600)
    local healthHeight = Clamp(frameDB.healthHeight, 1, 100)
    local powerHeight = Clamp(frameDB.powerHeight, 1, 20)
    local portraitSize = Clamp(
        frameDB.portraitSize or DEFAULTS.portraitSize,
        PORTRAIT_SIZE_MIN, PORTRAIT_SIZE_MAX)
    local portraitOffsetX = Clamp(
        frameDB.portraitOffsetX or DEFAULTS.portraitOffsetX,
        PORTRAIT_OFFSET_MIN, PORTRAIT_OFFSET_MAX)
    local portraitOffsetY = Clamp(
        frameDB.portraitOffsetY or DEFAULTS.portraitOffsetY,
        PORTRAIT_OFFSET_MIN, PORTRAIT_OFFSET_MAX)
    local bodyHeight = healthHeight + 2 + powerHeight
    local bodyWidth = healthWidth + 2
    local portraitGap = 4
    local bodyX, bodyY, portraitX, portraitY

    if position == "TOP" then
        local contentWidth = math.max(bodyWidth, portraitSize)
        bodyX = (contentWidth - bodyWidth) / 2
        portraitX = (contentWidth - portraitSize) / 2
        portraitY = 0
        bodyY = portraitY + portraitSize + portraitGap
    elseif position == "BOTTOM" then
        local contentWidth = math.max(bodyWidth, portraitSize)
        bodyX = (contentWidth - bodyWidth) / 2
        bodyY = 0
        portraitX = (contentWidth - portraitSize) / 2
        portraitY = bodyY + bodyHeight + portraitGap
    else
        bodyY = 0
        if position == "LEFT" then
            portraitX, bodyX = 0, portraitSize
        else
            bodyX = 0
            portraitX = bodyWidth
        end
        if position == "HIDDEN" then
            bodyX, portraitX = 0, bodyWidth
        end
        portraitY = bodyY
    end

    local contentWidth, contentHeight
    if position == "HIDDEN" then
        contentWidth = bodyX + bodyWidth
        contentHeight = bodyY + bodyHeight
    else
        portraitX = portraitX + portraitOffsetX
        portraitY = portraitY - portraitOffsetY
        local minX = math.min(0, bodyX, portraitX)
        local minY = math.min(0, bodyY, portraitY)
        local maxX = math.max(bodyX + bodyWidth,
            portraitX + portraitSize)
        local maxY = math.max(bodyY + bodyHeight,
            portraitY + portraitSize)
        bodyX = bodyX - minX
        bodyY = bodyY - minY
        portraitX = portraitX - minX
        portraitY = portraitY - minY
        contentWidth = maxX - minX
        contentHeight = maxY - minY
    end

    local bars = {
        x = bodyX + 1,
        y = bodyY,
        width = healthWidth,
        height = bodyHeight,
    }
    return {
        position = position,
        contentWidth = contentWidth,
        contentHeight = contentHeight,
        background = {
            x = bodyX,
            y = bodyY,
            width = bodyWidth,
            height = healthHeight + 2,
        },
        bars = bars,
        health = {
            x = bodyX + 1,
            y = bodyY,
            width = healthWidth,
            height = healthHeight,
        },
        energy = {
            x = bodyX + 1,
            y = bodyY + healthHeight + 2,
            width = healthWidth,
            height = powerHeight,
        },
        portrait = {
            shown = position ~= "HIDDEN",
            x = portraitX,
            y = portraitY,
            width = portraitSize,
            height = portraitSize,
        },
    }
end

local function CopyTable(source)
    local copy = {}
    for key, value in pairs(source or {}) do
        if type(value) == "table" then
            copy[key] = CopyTable(value)
        else
            copy[key] = value
        end
    end
    return copy
end

local function EnsureMoverSettings(setting, default)
    local AB = addonTable.PlusActionBar
    if AB and AB.EnsureMoverSettings then
        return AB.EnsureMoverSettings(setting, default)
    end
    local GW = _G.GW2_ADDON
    if not GW or not GW.settings or not GW.RegisterMovableFrame then
        return false
    end
    if not GW.settings[setting] then
        GW.settings[setting] = CopyTable(default)
    end
    if GW.globalDefault and GW.globalDefault.profile
        and not GW.globalDefault.profile[setting] then
        GW.globalDefault.profile[setting] = CopyTable(default)
    end
    return true
end

local function CreateIconFrame(name, label, setting, default, texturePath)
    local frame = _G[name]
    if frame then return frame end
    local GW = _G.GW2_ADDON
    local AB = addonTable.PlusActionBar
    local registerMover = AB and AB.RegisterMovableFrame
        or GW and GW.RegisterMovableFrame
    if not GW or not registerMover
        or not EnsureMoverSettings(setting, default) then
        return
    end

    frame = CreateFrame("Frame", name, UIParent)
    frame:SetSize(25, 25)
    if frame.SetFrameStrata then frame:SetFrameStrata("MEDIUM") end
    if frame.EnableMouse then frame:EnableMouse(false) end
    frame.Background = frame:CreateTexture(nil, "ARTWORK")
    frame.Background:SetTexture(
        "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar.png")
    if frame.Background.SetAllPoints then frame.Background:SetAllPoints(frame) end
    frame.icon = frame:CreateTexture(nil, "ARTWORK", nil, 2)
    frame.icon:SetTexture(texturePath)
    if frame.icon.SetAllPoints then frame.icon:SetAllPoints(frame) end

    registerMover(frame, label, setting, "Unitframe", nil, {"default"},
        nil, nil, nil, default)
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", frame.gwMover)
    frame:Hide()
    return frame
end

local auxiliaryFrames
function PetFrame.EnsureAuxiliaryFrames()
    if auxiliaryFrames then return auxiliaryFrames end
    local happiness = CreateIconFrame(
        "GwPlusPetHappiness", "宠物欢乐度", "PetHappiness_pos",
        AUXILIARY_MOVER_DEFAULTS.happiness,
        "Interface/AddOns/GW2_UI/textures/character/pet-happiness.png")
    local feed = CreateIconFrame(
        "GwPlusPetFeed", "宠物喂食", "PetFeed_pos",
        AUXILIARY_MOVER_DEFAULTS.feed,
        "Interface/Icons/INV_Misc_Food_15")
    if not happiness or not feed then return end

    happiness:SetScript("OnEnter", function(self)
        if not self.tooltip or not GameTooltip then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(self.tooltip, 1, 1, 1)
        if self.tooltipDamage then
            GameTooltip:AddLine(self.tooltipDamage, 1, 1, 1, true)
        end
        if self.tooltipLoyalty then
            GameTooltip:AddLine(self.tooltipLoyalty, 1, 1, 1, true)
        end
        GameTooltip:Show()
    end)
    happiness:SetScript("OnLeave", GameTooltip_Hide)
    feed:SetScript("OnEnter", function(self)
        if not GameTooltip then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("自动喂食（暂未实现）", 1, 1, 1)
        GameTooltip:Show()
    end)
    feed:SetScript("OnLeave", GameTooltip_Hide)
    auxiliaryFrames = {happiness = happiness, feed = feed}
    return auxiliaryFrames
end

function PetFrame.GetAuxiliaryFrames()
    return PetFrame.EnsureAuxiliaryFrames()
end

local function IsPetBlocked()
    if UnitInVehicle and UnitInVehicle("player") then return true end
    if IsInPetBattle and IsInPetBattle() then return true end
    local petBattles = C_PetBattles
    return petBattles and petBattles.IsInBattle and petBattles.IsInBattle()
        or false
end

local function UpdateHappinessFrame(frame, db)
    local happiness, damagePercentage, loyaltyRate = GetPetHappiness()
    local _, isHunterPet = HasPetUI()
    local shown = db.happinessEnabled and not IsPetBlocked()
        and UnitExists("pet") and happiness and isHunterPet
    if not shown then
        frame:Hide()
        return
    end
    local GW = _G.GW2_ADDON
    if GW and GW.getSprite then
        frame.icon:SetTexCoord(GW.getSprite(PET_HAPPINESS_SPRITE, happiness, 1))
    end
    frame.tooltip = _G["PET_HAPPINESS" .. happiness]
    frame.tooltipDamage = format(PET_DAMAGE_PERCENTAGE, damagePercentage)
    if loyaltyRate < 0 then
        frame.tooltipLoyalty = LOSING_LOYALTY
    elseif loyaltyRate > 0 then
        frame.tooltipLoyalty = GAINING_LOYALTY
    else
        frame.tooltipLoyalty = nil
    end
    frame:Show()
end

function PetFrame.UpdateAuxiliaryFrames()
    local frames = PetFrame.EnsureAuxiliaryFrames()
    if not frames then return false end
    local db = PetFrame.InitDB()
    local petAvailable = UnitExists("pet") and not IsPetBlocked()
    if not petAvailable then
        frames.happiness:Hide()
        frames.feed:Hide()
        return true
    end
    frames.feed:SetShown(db.feedEnabled)
    UpdateHappinessFrame(frames.happiness, db)
    return true
end

local function HideNativeHappiness(frame)
    if not frame or not frame.happiness then return end
    frame.happiness:Hide()
    if hooksecurefunc and not frame.happiness.gwPlusHideHooked then
        frame.happiness.gwPlusHideHooked = true
        hooksecurefunc(frame.happiness, "Show", function(self)
            self:Hide()
        end)
    end
end

function PetFrame.ApplyLayout()
    local AB = addonTable.PlusActionBar
    if AB and AB.QueueOutOfCombat
        and AB.QueueOutOfCombat("petFrameLayout", PetFrame.ApplyLayout) then
        return false
    end
    local frame = _G.GwPlayerPetFrame
    if not frame then return false end

    local layout = PetFrame.CalculateLayout(PetFrame.InitDB())
    SetSize(frame, layout.contentWidth, layout.contentHeight)
    if frame.gwMover then
        frame.gwMover:SetSize(layout.contentWidth, layout.contentHeight)
    end

    SetSize(frame.Background, layout.background.width, layout.background.height)
    SetTopLeft(frame.Background, frame, layout.background.x, layout.background.y)
    SetSize(frame.health, layout.health.width, layout.health.height)
    SetTopLeft(frame.health, frame, layout.health.x, layout.health.y)
    SetSize(frame.powerbar, layout.energy.width, layout.energy.height)
    SetTopLeft(frame.powerbar, frame, layout.energy.x, layout.energy.y)
    if frame.health and frame.health.text then
        SetSize(frame.health.text, layout.health.width, layout.health.height)
    end
    if frame.healthString and frame.healthString ~= frame.health.text then
        SetSize(frame.healthString, layout.health.width, layout.health.height)
    end

    SetSize(frame.portraitBackground, layout.portrait.width,
        layout.portrait.height)
    SetTopLeft(frame.portraitBackground, frame, layout.portrait.x,
        layout.portrait.y)
    SetSize(frame.portrait, layout.portrait.width, layout.portrait.height)
    SetTopLeft(frame.portrait, frame, layout.portrait.x, layout.portrait.y)
    SetShown(frame.portraitBackground, layout.portrait.shown)
    SetShown(frame.portrait, layout.portrait.shown)
    HideNativeHappiness(frame)
    PetFrame.UpdateAuxiliaryFrames()

    frame.gwPlusPetFrameLayout = layout
    return true
end

function PetFrame.ResetDefaults()
    local db = PetFrame.InitDB()
    for key, value in pairs(DEFAULTS) do db[key] = value end
    return db
end

function PetFrame.ResetLayoutDefaults()
    local db = PetFrame.InitDB()
    db.portraitPosition = DEFAULTS.portraitPosition
    db.portraitSize = DEFAULTS.portraitSize
    db.portraitOffsetX = DEFAULTS.portraitOffsetX
    db.portraitOffsetY = DEFAULTS.portraitOffsetY
    db.healthWidth = DEFAULTS.healthWidth
    db.healthHeight = DEFAULTS.healthHeight
    db.powerHeight = DEFAULTS.powerHeight
    return db
end

local function AddOptionName(option, name)
    if option then option.optionName = name end
    return option
end

local function KeepGeneralHeader(option, dependence)
    if not option then return end
    option.__gwPlusKeepGeneralHeader = true
    option.dependence = dependence
end

function PetFrame.AddOptions(panel)
    if not panel or panel.__gwPlusPetLayoutOptions then return end
    local dependence = {PETBAR_ENABLED = true}
    local db = PetFrame.InitDB()
    local firstNewIndex = #(panel.gwOptions or {}) + 1
    local header = panel:AddGroupHeader("头像与资源条", {
        dependence = dependence,
    })
    KeepGeneralHeader(header, dependence)
    AddOptionName(panel:AddOptionDropdown("头像位置", nil, {
        optionsList = PORTRAIT_POSITIONS,
        optionNames = PORTRAIT_POSITION_NAMES,
        getter = function() return db.portraitPosition end,
        setter = function(value) db.portraitPosition = value end,
        getDefault = function() return DEFAULTS.portraitPosition end,
        callback = PetFrame.ApplyLayout,
        dependence = dependence,
        groupHeaderName = "头像与资源条",
        forceNewLine = true,
    }), "GW2PlusPetFramePortraitPosition")
    local portraitSize = AddOptionName(
        panel:AddOptionSlider("头像尺寸", "头像的宽度和高度。", {
            min = PORTRAIT_SIZE_MIN, max = PORTRAIT_SIZE_MAX, step = 1,
            decimalNumbers = 0,
            getter = function() return db.portraitSize end,
            setter = function(value) db.portraitSize = value end,
            getDefault = function() return DEFAULTS.portraitSize end,
            callback = PetFrame.ApplyLayout,
            dependence = dependence,
            groupHeaderName = "头像与资源条",
        }), "GW2PlusPetFramePortraitSize")
    local portraitOffsetX = AddOptionName(
        panel:AddOptionSlider("头像偏移 X", "正值向右移动头像。", {
            min = PORTRAIT_OFFSET_MIN, max = PORTRAIT_OFFSET_MAX, step = 1,
            decimalNumbers = 0,
            getter = function() return db.portraitOffsetX end,
            setter = function(value) db.portraitOffsetX = value end,
            getDefault = function() return DEFAULTS.portraitOffsetX end,
            callback = PetFrame.ApplyLayout,
            dependence = dependence,
            groupHeaderName = "头像与资源条",
        }), "GW2PlusPetFramePortraitOffsetX")
    local portraitOffsetY = AddOptionName(
        panel:AddOptionSlider("头像偏移 Y", "正值向上移动头像。", {
            min = PORTRAIT_OFFSET_MIN, max = PORTRAIT_OFFSET_MAX, step = 1,
            decimalNumbers = 0,
            getter = function() return db.portraitOffsetY end,
            setter = function(value) db.portraitOffsetY = value end,
            getDefault = function() return DEFAULTS.portraitOffsetY end,
            callback = PetFrame.ApplyLayout,
            dependence = dependence,
            groupHeaderName = "头像与资源条",
        }), "GW2PlusPetFramePortraitOffsetY")
    if portraitSize then portraitSize.gwPlusColumns = 2 end
    if portraitOffsetX then portraitOffsetX.gwPlusColumns = 2 end
    if portraitOffsetY then portraitOffsetY.gwPlusColumns = 2 end
    local width = AddOptionName(panel:AddOptionSlider("生命条宽度", nil, {
        min = 100, max = 600, step = 1,
        getter = function() return db.healthWidth end,
        setter = function(value) db.healthWidth = value end,
        getDefault = function() return DEFAULTS.healthWidth end,
        callback = PetFrame.ApplyLayout,
        dependence = dependence,
        groupHeaderName = "头像与资源条",
    }), "GW2PlusPetFrameHealthWidth")
    local height = AddOptionName(panel:AddOptionSlider("生命条高度", nil, {
        min = 1, max = 100, step = 1,
        getter = function() return db.healthHeight end,
        setter = function(value) db.healthHeight = value end,
        getDefault = function() return DEFAULTS.healthHeight end,
        callback = PetFrame.ApplyLayout,
        dependence = dependence,
        groupHeaderName = "头像与资源条",
    }), "GW2PlusPetFrameHealthHeight")
    if width then width.gwPlusColumns = 2 end
    if height then height.gwPlusColumns = 2 end
    AddOptionName(panel:AddOptionSlider("能量条高度", nil, {
        min = 1, max = 20, step = 1,
        getter = function() return db.powerHeight end,
        setter = function(value) db.powerHeight = value end,
        getDefault = function() return DEFAULTS.powerHeight end,
        callback = PetFrame.ApplyLayout,
        dependence = dependence,
        groupHeaderName = "头像与资源条",
    }), "GW2PlusPetFramePowerHeight")

    local Utils = addonTable.ActionBarOptionsUtils
    local function Reset()
        PetFrame.ResetLayoutDefaults()
        PetFrame.ApplyLayout()
    end
    if Utils and Utils.AddResetButton then
        local reset = Utils.AddResetButton(panel, Reset)
        if reset then reset.dependence = dependence end
    elseif panel.AddOptionButton then
        panel:AddOptionButton("恢复默认", nil, {
            callback = Reset,
            dependence = dependence,
        })
    end
    local additions = {}
    for index = firstNewIndex, #(panel.gwOptions or {}) do
        additions[#additions + 1] = panel.gwOptions[index]
    end
    for index = #(panel.gwOptions or {}), firstNewIndex, -1 do
        table.remove(panel.gwOptions, index)
    end
    local insertAt = #(panel.gwOptions or {}) + 1
    for index, option in ipairs(panel.gwOptions or {}) do
        if option.optionType == "header"
            and (option.name == "光环" or option.name == "Auras") then
            insertAt = index
            break
        end
    end
    for index = #additions, 1, -1 do
        table.insert(panel.gwOptions, insertAt, additions[index])
    end
    panel.__gwPlusPetLayoutOptions = true
end

function PetFrame.AddAuxiliaryOptions(panel)
    if not panel or panel.__gwPlusPetAuxiliaryOptions then return end
    local dependence = {PETBAR_ENABLED = true}
    local db = PetFrame.InitDB()
    local happiness = panel:AddOption("启用欢乐度", nil, {
        getter = function() return db.happinessEnabled end,
        setter = function(value)
            db.happinessEnabled = value == true
            PetFrame.UpdateAuxiliaryFrames()
        end,
        getDefault = function() return DEFAULTS.happinessEnabled end,
        callback = PetFrame.UpdateAuxiliaryFrames,
        dependence = dependence,
        groupHeaderName = "欢乐度",
        isMasterToggle = true,
    })
    AddOptionName(happiness, "GW2PlusPetHappinessEnabled")

    local feed = panel:AddOption("启用喂食图标", nil, {
        getter = function() return db.feedEnabled end,
        setter = function(value)
            db.feedEnabled = value == true
            PetFrame.UpdateAuxiliaryFrames()
        end,
        getDefault = function() return DEFAULTS.feedEnabled end,
        callback = PetFrame.UpdateAuxiliaryFrames,
        dependence = dependence,
        groupHeaderName = "喂食",
        isMasterToggle = true,
    })
    AddOptionName(feed, "GW2PlusPetFeedEnabled")
    panel.__gwPlusPetAuxiliaryOptions = true
end

local function InstallHooks()
    local mixin = _G.GwPlayerPetFrameMixin
    if mixin and hooksecurefunc and not mixin.__gwPlusPetLayoutHooked then
        mixin.__gwPlusPetLayoutHooked = true
        hooksecurefunc(mixin, "UpdateSettings", PetFrame.ApplyLayout)
        hooksecurefunc(mixin, "UpdateHappiness", function(frame)
            HideNativeHappiness(frame)
            PetFrame.UpdateAuxiliaryFrames()
        end)
    end
end

local events = CreateFrame("Frame")
events:RegisterEvent("PLAYER_ENTERING_WORLD")
events:RegisterEvent("UNIT_PET")
events:RegisterEvent("UNIT_HAPPINESS")
events:RegisterEvent("PET_UI_UPDATE")
events:RegisterEvent("PET_BAR_UPDATE")
events:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED")
events:RegisterEvent("PET_BATTLE_OPENING_START")
events:RegisterEvent("PET_BATTLE_CLOSE")
events:SetScript("OnEvent", function(self)
    InstallHooks()
    if _G.GwPlayerPetFrame then
        PetFrame.ApplyLayout()
    else
        PetFrame.UpdateAuxiliaryFrames()
    end
end)
