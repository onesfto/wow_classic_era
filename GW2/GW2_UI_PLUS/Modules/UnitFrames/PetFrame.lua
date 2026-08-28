local _, addonTable = ...

local PetFrame = {}
addonTable.PlusPetFrame = PetFrame

local AUXILIARY_ICON_DEFAULT_SIZE = 25
local HAPPINESS_SIZE_MIN = 12
local HAPPINESS_SIZE_MAX = 64
local DEFAULTS = {
    portraitEnabled = true,
    portraitPosition = "RIGHT",
    portraitSize = 60,
    portraitOffsetX = 0,
    portraitOffsetY = 0,
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
    auraPosition = "TOPRIGHT",
    auraOffsetX = 0,
    auraOffsetY = 0,
    happinessEnabled = true,
    happinessSize = AUXILIARY_ICON_DEFAULT_SIZE,
    feedEnabled = true,
}
local PORTRAIT_SIZE_MIN = 20
local PORTRAIT_SIZE_MAX = 200
local PORTRAIT_OFFSET_X_MIN = -300
local PORTRAIT_OFFSET_X_MAX = 300
local PORTRAIT_OFFSET_Y_MIN = -100
local PORTRAIT_OFFSET_Y_MAX = 100
local AURA_OFFSET_X_MIN = -300
local AURA_OFFSET_X_MAX = 300
local AURA_OFFSET_Y_MIN = -100
local AURA_OFFSET_Y_MAX = 100
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
local PORTRAIT_POSITIONS = {"TOP", "BOTTOM", "LEFT", "RIGHT"}
local PORTRAIT_POSITION_NAMES = {"中上", "中下", "左边", "右边"}
local PORTRAIT_POSITION_SET = {}
for _, position in ipairs(PORTRAIT_POSITIONS) do
    PORTRAIT_POSITION_SET[position] = true
end
local AURA_POSITIONS = {
    "TOPLEFT", "TOPRIGHT", "BOTTOMLEFT", "BOTTOMRIGHT",
}
local AURA_POSITION_NAMES = {"左上", "右上", "左下", "右下"}
local AURA_POSITION_SET = {}
for _, position in ipairs(AURA_POSITIONS) do
    AURA_POSITION_SET[position] = true
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

local function SyncStatusBarSize(statusBar, width, height)
    if not statusBar then return end
    SetSize(statusBar, width, height)
    if statusBar.internalBar then
        SetSize(statusBar.internalBar, width, height)
    end
    if statusBar.UpdateBarSize then
        statusBar:UpdateBarSize()
    end
end

function PetFrame.InitDB()
    GW2_UI_PLUS_SV = type(GW2_UI_PLUS_SV) == "table"
        and GW2_UI_PLUS_SV or {}
    local db = GW2_UI_PLUS_SV.petFrame
    if type(db) ~= "table" then
        db = {}
        GW2_UI_PLUS_SV.petFrame = db
    end
    local legacyPortraitHidden = db.portraitEnabled == nil
        and db.portraitPosition == "HIDDEN"
    local legacyAuraUnder
    if db.auraPosition == nil then
        local settings = _G.GW2_ADDON and _G.GW2_ADDON.settings
        if settings and settings.PET_AURAS_UNDER ~= nil then
            legacyAuraUnder = settings.PET_AURAS_UNDER
        end
    end
    for key, value in pairs(DEFAULTS) do
        if db[key] == nil then db[key] = value end
    end
    if legacyPortraitHidden then
        db.portraitEnabled = false
        db.portraitPosition = DEFAULTS.portraitPosition
    end
    if legacyAuraUnder ~= nil then
        db.auraPosition = legacyAuraUnder and "BOTTOMRIGHT" or "TOPRIGHT"
    end
    db.portraitEnabled = db.portraitEnabled ~= false
    if not PORTRAIT_POSITION_SET[db.portraitPosition] then
        db.portraitPosition = DEFAULTS.portraitPosition
    end
    db.portraitSize = Clamp(
        db.portraitSize, PORTRAIT_SIZE_MIN, PORTRAIT_SIZE_MAX)
    db.portraitOffsetX = Clamp(
        db.portraitOffsetX, PORTRAIT_OFFSET_X_MIN, PORTRAIT_OFFSET_X_MAX)
    db.portraitOffsetY = Clamp(
        db.portraitOffsetY, PORTRAIT_OFFSET_Y_MIN, PORTRAIT_OFFSET_Y_MAX)
    if not AURA_POSITION_SET[db.auraPosition] then
        db.auraPosition = DEFAULTS.auraPosition
    end
    db.auraOffsetX = Clamp(
        db.auraOffsetX, AURA_OFFSET_X_MIN, AURA_OFFSET_X_MAX)
    db.auraOffsetY = Clamp(
        db.auraOffsetY, AURA_OFFSET_Y_MIN, AURA_OFFSET_Y_MAX)
    db.healthWidth = Clamp(db.healthWidth, 100, 600)
    db.healthHeight = Clamp(db.healthHeight, 1, 100)
    db.powerHeight = Clamp(db.powerHeight, 1, 20)
    db.happinessEnabled = db.happinessEnabled ~= false
    db.happinessSize = Clamp(
        db.happinessSize, HAPPINESS_SIZE_MIN, HAPPINESS_SIZE_MAX)
    db.feedEnabled = db.feedEnabled ~= false
    return db
end

function PetFrame.CalculateLayout(frameDB)
    frameDB = frameDB or DEFAULTS
    local position = PORTRAIT_POSITION_SET[frameDB.portraitPosition]
        and frameDB.portraitPosition or DEFAULTS.portraitPosition
    local portraitShown = frameDB.portraitEnabled ~= false
        and frameDB.portraitPosition ~= "HIDDEN"
    local healthWidth = Clamp(frameDB.healthWidth, 100, 600)
    local healthHeight = Clamp(frameDB.healthHeight, 1, 100)
    local powerHeight = Clamp(frameDB.powerHeight, 1, 20)
    local portraitSize = Clamp(
        frameDB.portraitSize or DEFAULTS.portraitSize,
        PORTRAIT_SIZE_MIN, PORTRAIT_SIZE_MAX)
    local portraitOffsetX = Clamp(
        frameDB.portraitOffsetX or DEFAULTS.portraitOffsetX,
        PORTRAIT_OFFSET_X_MIN, PORTRAIT_OFFSET_X_MAX)
    local portraitOffsetY = Clamp(
        frameDB.portraitOffsetY or DEFAULTS.portraitOffsetY,
        PORTRAIT_OFFSET_Y_MIN, PORTRAIT_OFFSET_Y_MAX)
    local bodyHeight = healthHeight + 2 + powerHeight
    local bodyWidth = healthWidth + 2
    local portraitGap = 4
    local bodyX, bodyY = 0, 0
    local portraitX, portraitY

    if position == "TOP" then
        portraitX = (bodyWidth - portraitSize) / 2
        portraitY = -(portraitSize + portraitGap)
    elseif position == "BOTTOM" then
        portraitX = (bodyWidth - portraitSize) / 2
        portraitY = bodyHeight + portraitGap
    elseif position == "LEFT" then
        portraitX = -portraitSize
        portraitY = (bodyHeight - portraitSize) / 2
    else
        portraitX = bodyWidth
        portraitY = (bodyHeight - portraitSize) / 2
    end

    portraitX = portraitX + portraitOffsetX
    portraitY = portraitY - portraitOffsetY
    local contentWidth, contentHeight = bodyWidth, bodyHeight

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
            shown = portraitShown,
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

    local template = name == "GwPlusPetFeed"
        and "SecureActionButtonTemplate" or nil
    frame = CreateFrame(name == "GwPlusPetFeed" and "Button" or "Frame",
        name, UIParent, template)
    frame.gwPlusProtected = name == "GwPlusPetFeed"
    frame:SetSize(AUXILIARY_ICON_DEFAULT_SIZE, AUXILIARY_ICON_DEFAULT_SIZE)
    if frame.SetFrameStrata then frame:SetFrameStrata("MEDIUM") end
    if frame.EnableMouse then frame:EnableMouse(name == "GwPlusPetFeed") end
    frame.Background = frame:CreateTexture(nil, "ARTWORK")
    frame.Background:SetTexture(
        "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar.png")
    if frame.Background.SetVertexColor then
        frame.Background:SetVertexColor(0, 0, 0, 0.8)
    end
    if frame.Background.SetAllPoints then frame.Background:SetAllPoints(frame) end
    frame.icon = frame:CreateTexture(nil, "ARTWORK", nil, 2)
    frame.icon:SetTexture(texturePath)
    if frame.icon.SetBlendMode then frame.icon:SetBlendMode("ADD") end
    if frame.icon.SetSize then
        frame.icon:SetSize(AUXILIARY_ICON_DEFAULT_SIZE,
            AUXILIARY_ICON_DEFAULT_SIZE)
    end
    if frame.icon.SetPoint then
        frame.icon:SetPoint("CENTER", frame, "CENTER", 0, 1)
    end

    registerMover(frame, label, setting, "Unitframe", nil, {"default"},
        nil, nil, nil, default)
    frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", frame.gwMover)
    frame:Hide()
    if name == "GwPlusPetFeed" and addonTable.PetFeed
        and addonTable.PetFeed.AttachButton then
        addonTable.PetFeed.AttachButton(frame)
    end
    return frame
end

local function ApplyAuxiliaryFrameSize(frame, size)
    if not frame then return end
    if frame.gwPlusProtected and InCombatLockdown and InCombatLockdown() then
        return
    end
    frame:SetSize(size, size)
    if frame.icon and frame.icon.SetSize then
        frame.icon:SetSize(size, size)
        if frame.icon.ClearAllPoints then frame.icon:ClearAllPoints() end
        if frame.icon.SetPoint then
            local yOffset = frame.gwPlusProtected and 0 or 1
            frame.icon:SetPoint("CENTER", frame, "CENTER", 0, yOffset)
        end
    end
    if frame.gwMover then frame.gwMover:SetSize(size, size) end
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
    ApplyAuxiliaryFrameSize(happiness, PetFrame.InitDB().happinessSize)
    if addonTable.PetFeed and addonTable.PetFeed.InitDB then
        ApplyAuxiliaryFrameSize(feed, addonTable.PetFeed.InitDB().buttonSize)
    end

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
    if not (addonTable.PetFeed and addonTable.PetFeed.AttachButton) then
        feed:SetScript("OnEnter", function(self)
            if not GameTooltip then return end
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetText("宠物喂食", 1, 1, 1)
            GameTooltip:Show()
        end)
        feed:SetScript("OnLeave", GameTooltip_Hide)
    end
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
    ApplyAuxiliaryFrameSize(frames.happiness, db.happinessSize)
    if addonTable.PetFeed and addonTable.PetFeed.InitDB then
        ApplyAuxiliaryFrameSize(frames.feed,
            addonTable.PetFeed.InitDB().buttonSize)
    end
    local petAvailable = UnitExists("pet") and not IsPetBlocked()
    if not petAvailable then
        frames.happiness:Hide()
        if not frames.feed.gwPlusProtected
            or not InCombatLockdown or not InCombatLockdown() then
            frames.feed:Hide()
        end
        return true
    end
    if not frames.feed.gwPlusProtected
        or not InCombatLockdown or not InCombatLockdown() then
        frames.feed:SetShown(db.feedEnabled)
    end
    if addonTable.PetFeed and addonTable.PetFeed.UpdateVisibility then
        addonTable.PetFeed.UpdateVisibility(db.feedEnabled)
    end
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

local function ApplyAuraLayout(frame, db)
    if not frame or not frame.auras then return end
    local position = AURA_POSITION_SET[db.auraPosition]
        and db.auraPosition or DEFAULTS.auraPosition
    if not frame.auras.ClearAllPoints
        or not frame.auras.SetPoint then
        return
    end

    local xOffset = Clamp(
        db.auraOffsetX, AURA_OFFSET_X_MIN, AURA_OFFSET_X_MAX)
    local yOffset = Clamp(
        db.auraOffsetY, AURA_OFFSET_Y_MIN, AURA_OFFSET_Y_MAX)
    local x, y = 0, 0
    frame.auraPositionUnder = position == "BOTTOMLEFT"
        or position == "BOTTOMRIGHT"

    frame.auras:ClearAllPoints()
    frame.auras:SetPoint(
        "TOPRIGHT", frame, position, x + xOffset, y + yOffset)
    if frame.auras.ForceUpdate then frame.auras:ForceUpdate() end
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
    SyncStatusBarSize(frame.health, layout.health.width, layout.health.height)
    SetTopLeft(frame.health, frame, layout.health.x, layout.health.y)
    SyncStatusBarSize(frame.powerbar, layout.energy.width, layout.energy.height)
    SetTopLeft(frame.powerbar, frame, layout.energy.x, layout.energy.y)
    if frame.health and frame.health.text then
        SetSize(frame.health.text, layout.health.width, layout.health.height)
    end
    if frame.healthString and frame.healthString ~= frame.health.text then
        SetSize(frame.healthString, layout.health.width, layout.health.height)
    end
    if frame.UpdateHealthBar then
        frame:UpdateHealthBar(true)
    end
    if frame.UpdatePowerBar then
        frame:UpdatePowerBar(true)
    end

    SetSize(frame.portraitBackground, layout.portrait.width,
        layout.portrait.height)
    SetTopLeft(frame.portraitBackground, frame, layout.portrait.x,
        layout.portrait.y)
    SetSize(frame.portrait, layout.portrait.width, layout.portrait.height)
    SetTopLeft(frame.portrait, frame, layout.portrait.x, layout.portrait.y)
    SetShown(frame.portraitBackground, layout.portrait.shown)
    SetShown(frame.portrait, layout.portrait.shown)
    ApplyAuraLayout(frame, PetFrame.InitDB())
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
    db.portraitEnabled = DEFAULTS.portraitEnabled
    db.portraitPosition = DEFAULTS.portraitPosition
    db.portraitSize = DEFAULTS.portraitSize
    db.portraitOffsetX = DEFAULTS.portraitOffsetX
    db.portraitOffsetY = DEFAULTS.portraitOffsetY
    db.healthWidth = DEFAULTS.healthWidth
    db.healthHeight = DEFAULTS.healthHeight
    db.powerHeight = DEFAULTS.powerHeight
    db.auraPosition = DEFAULTS.auraPosition
    db.auraOffsetX = DEFAULTS.auraOffsetX
    db.auraOffsetY = DEFAULTS.auraOffsetY
    return db
end

local function AddOptionName(option, name)
    if option then option.optionName = name end
    return option
end

local function SetWidgetLabelAndGroup(widget, name, groupName)
    if not widget then return end
    if groupName then widget.groupHeaderName = groupName end
    if name then
        widget.displayName = name
        if widget.title and widget.title.SetText then
            widget.title:SetText(name)
        end
    end
end

local function SetOptionLabelAndGroup(option, name, groupName)
    if not option then return end
    if name then option.name = name end
    option.groupHeaderName = groupName
    SetWidgetLabelAndGroup(option.__widget, name, groupName)
    if option.__gwPlusWidget ~= option.__widget then
        SetWidgetLabelAndGroup(option.__gwPlusWidget, name, groupName)
    end
end

local function FindOption(options, optionName)
    for _, option in ipairs(options or {}) do
        if option.optionName == optionName then return option end
    end
end

local function FindHeaderBefore(options, target)
    local targetIndex
    for index, option in ipairs(options or {}) do
        if option == target then
            targetIndex = index
            break
        end
    end
    if not targetIndex then return end
    for index = targetIndex - 1, 1, -1 do
        if options[index].optionType == "header" then
            return options[index]
        end
    end
end

local function AppendOption(options, option)
    if option then options[#options + 1] = option end
end

local function SetColumns(columnCount, ...)
    local options = {}
    for index = 1, select("#", ...) do
        local option = select(index, ...)
        if not option then return end
        options[#options + 1] = option
    end
    for _, option in ipairs(options) do
        option.gwPlusColumns = columnCount
    end
end

function PetFrame.AddOptions(panel)
    if not panel or panel.__gwPlusPetLayoutOptions then return end
    panel.gwPlusColumnGap = 8
    local dependence = {PETBAR_ENABLED = true}
    local db = PetFrame.InitDB()
    local originalOptions = {}
    for _, option in ipairs(panel.gwOptions or {}) do
        originalOptions[#originalOptions + 1] = option
    end

    local damageOption = FindOption(
        originalOptions, "PET_FLOATING_COMBAT_TEXT")
    local textureOption = FindOption(
        originalOptions, "playerPetFrameHealthBarTexture")
    local scaleOption = FindOption(originalOptions, "pet_pos_scale")
    local originalSizeHeader = FindHeaderBefore(originalOptions, scaleOption)
    local originalAuraPosition = FindOption(
        originalOptions, "PET_AURAS_UNDER")
    local originalAuraHeader = FindHeaderBefore(
        originalOptions, originalAuraPosition)

    SetOptionLabelAndGroup(damageOption, "头像框显示伤害", "头像")
    SetOptionLabelAndGroup(textureOption, "生命条材质", "头像")
    SetOptionLabelAndGroup(scaleOption, "缩放指数", "大小")

    local auraHeader = originalAuraHeader
    if not auraHeader then
        auraHeader = panel:AddGroupHeader("光环", {
            dependence = dependence,
        })
    end

    local avatarHeader = panel:AddGroupHeader("头像", {
        dependence = dependence,
    })
    local portraitEnabled = AddOptionName(panel:AddOption(
        "启用头像", "控制宠物头像是否显示。", {
        getter = function() return db.portraitEnabled end,
        setter = function(value)
            db.portraitEnabled = value == true
            PetFrame.ApplyLayout()
        end,
        getDefault = function() return DEFAULTS.portraitEnabled end,
        callback = PetFrame.ApplyLayout,
        dependence = dependence,
        groupHeaderName = "头像",
    }), "GW2PlusPetPortraitEnabled")
    local portraitPosition = AddOptionName(panel:AddOptionDropdown(
        "位置", nil, {
        optionsList = PORTRAIT_POSITIONS,
        optionNames = PORTRAIT_POSITION_NAMES,
        getter = function() return db.portraitPosition end,
        setter = function(value) db.portraitPosition = value end,
        getDefault = function() return DEFAULTS.portraitPosition end,
        callback = PetFrame.ApplyLayout,
        dependence = dependence,
        groupHeaderName = "头像",
    }), "GW2PlusPetFramePortraitPosition")
    local portraitSize = AddOptionName(
        panel:AddOptionSlider("尺寸", "头像的宽度和高度。", {
            min = PORTRAIT_SIZE_MIN, max = PORTRAIT_SIZE_MAX, step = 1,
            decimalNumbers = 0,
            getter = function() return db.portraitSize end,
            setter = function(value) db.portraitSize = value end,
            getDefault = function() return DEFAULTS.portraitSize end,
            callback = PetFrame.ApplyLayout,
            dependence = dependence,
            groupHeaderName = "头像",
        }), "GW2PlusPetFramePortraitSize")
    local portraitOffsetX = AddOptionName(
        panel:AddOptionSlider("X 偏移", "正值向右移动头像。", {
            min = PORTRAIT_OFFSET_X_MIN, max = PORTRAIT_OFFSET_X_MAX, step = 1,
            decimalNumbers = 0,
            getter = function() return db.portraitOffsetX end,
            setter = function(value) db.portraitOffsetX = value end,
            getDefault = function() return DEFAULTS.portraitOffsetX end,
            callback = PetFrame.ApplyLayout,
            dependence = dependence,
            groupHeaderName = "头像",
        }), "GW2PlusPetFramePortraitOffsetX")
    local portraitOffsetY = AddOptionName(
        panel:AddOptionSlider("Y 偏移", "正值向上移动头像。", {
            min = PORTRAIT_OFFSET_Y_MIN, max = PORTRAIT_OFFSET_Y_MAX, step = 1,
            decimalNumbers = 0,
            getter = function() return db.portraitOffsetY end,
            setter = function(value) db.portraitOffsetY = value end,
            getDefault = function() return DEFAULTS.portraitOffsetY end,
            callback = PetFrame.ApplyLayout,
            dependence = dependence,
            groupHeaderName = "头像",
        }), "GW2PlusPetFramePortraitOffsetY")
    SetColumns(2, portraitEnabled, damageOption)
    SetColumns(2, portraitPosition, portraitSize)
    SetColumns(2, portraitOffsetX, portraitOffsetY)

    local auraPosition = AddOptionName(panel:AddOptionDropdown(
        "光环位置", "选择光环显示在宠物框体上方或下方。", {
        optionsList = AURA_POSITIONS,
        optionNames = AURA_POSITION_NAMES,
        getter = function() return db.auraPosition end,
        setter = function(value)
            db.auraPosition = AURA_POSITION_SET[value]
                and value or DEFAULTS.auraPosition
        end,
        getDefault = function() return DEFAULTS.auraPosition end,
        callback = PetFrame.ApplyLayout,
        dependence = dependence,
        groupHeaderName = "光环",
    }), "GW2PlusPetAuraPosition")
    local auraOffsetX = AddOptionName(
        panel:AddOptionSlider("X 偏移", "正值向右移动光环。", {
            min = AURA_OFFSET_X_MIN, max = AURA_OFFSET_X_MAX, step = 1,
            decimalNumbers = 0,
            getter = function() return db.auraOffsetX end,
            setter = function(value)
                db.auraOffsetX = Clamp(
                    value, AURA_OFFSET_X_MIN, AURA_OFFSET_X_MAX)
            end,
            getDefault = function() return DEFAULTS.auraOffsetX end,
            callback = PetFrame.ApplyLayout,
            dependence = dependence,
            groupHeaderName = "光环",
        }), "GW2PlusPetAuraOffsetX")
    local auraOffsetY = AddOptionName(
        panel:AddOptionSlider("Y 偏移", "正值向上移动光环。", {
            min = AURA_OFFSET_Y_MIN, max = AURA_OFFSET_Y_MAX, step = 1,
            decimalNumbers = 0,
            getter = function() return db.auraOffsetY end,
            setter = function(value)
                db.auraOffsetY = Clamp(
                    value, AURA_OFFSET_Y_MIN, AURA_OFFSET_Y_MAX)
            end,
            getDefault = function() return DEFAULTS.auraOffsetY end,
            callback = PetFrame.ApplyLayout,
            dependence = dependence,
            groupHeaderName = "光环",
        }), "GW2PlusPetAuraOffsetY")
    SetColumns(2, auraOffsetX, auraOffsetY)

    local sizeHeader = panel:AddGroupHeader("大小", {
        dependence = dependence,
    })
    local width = AddOptionName(panel:AddOptionSlider("生命条宽度", nil, {
        min = 100, max = 600, step = 1,
        getter = function() return db.healthWidth end,
        setter = function(value) db.healthWidth = value end,
        getDefault = function() return DEFAULTS.healthWidth end,
        callback = PetFrame.ApplyLayout,
        dependence = dependence,
        groupHeaderName = "大小",
    }), "GW2PlusPetFrameHealthWidth")
    local height = AddOptionName(panel:AddOptionSlider("生命条高度", nil, {
        min = 1, max = 100, step = 1,
        getter = function() return db.healthHeight end,
        setter = function(value) db.healthHeight = value end,
        getDefault = function() return DEFAULTS.healthHeight end,
        callback = PetFrame.ApplyLayout,
        dependence = dependence,
        groupHeaderName = "大小",
    }), "GW2PlusPetFrameHealthHeight")
    local powerHeight = AddOptionName(panel:AddOptionSlider(
        "能量条高度", nil, {
        min = 1, max = 20, step = 1,
        getter = function() return db.powerHeight end,
        setter = function(value) db.powerHeight = value end,
        getDefault = function() return DEFAULTS.powerHeight end,
        callback = PetFrame.ApplyLayout,
        dependence = dependence,
        groupHeaderName = "大小",
    }), "GW2PlusPetFramePowerHeight")

    local masterOption
    for _, option in ipairs(originalOptions) do
        if option.optionName == "PETBAR_ENABLED"
            or (not masterOption and option.isMasterToggle) then
            masterOption = option
            break
        end
    end

    local excluded = {}
    for _, option in ipairs({
        damageOption, textureOption, scaleOption, originalSizeHeader,
        originalAuraHeader, originalAuraPosition,
    }) do
        if option then excluded[option] = true end
    end
    local reordered = {}
    AppendOption(reordered, masterOption)
    AppendOption(reordered, avatarHeader)
    AppendOption(reordered, portraitEnabled)
    AppendOption(reordered, damageOption)
    AppendOption(reordered, portraitPosition)
    AppendOption(reordered, portraitSize)
    AppendOption(reordered, portraitOffsetX)
    AppendOption(reordered, portraitOffsetY)
    AppendOption(reordered, textureOption)
    AppendOption(reordered, sizeHeader)
    AppendOption(reordered, scaleOption)
    AppendOption(reordered, width)
    AppendOption(reordered, height)
    AppendOption(reordered, powerHeight)
    AppendOption(reordered, auraHeader)
    AppendOption(reordered, auraPosition)
    AppendOption(reordered, auraOffsetX)
    AppendOption(reordered, auraOffsetY)
    for _, option in ipairs(originalOptions) do
        if option ~= masterOption and not excluded[option] then
            reordered[#reordered + 1] = option
        end
    end
    panel.gwOptions = reordered
    panel.__gwPlusPetLayoutOptions = true
end

function PetFrame.AddAuxiliaryOptions(panel)
    if not panel or panel.__gwPlusPetAuxiliaryOptions then return end
    local dependence = {PETBAR_ENABLED = true}
    local db = PetFrame.InitDB()
    local happiness = panel:AddOption("启用", nil, {
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

    local happinessSize = panel:AddOptionSlider(
        "尺寸", "欢乐度图标的宽度和高度。", {
        min = HAPPINESS_SIZE_MIN,
        max = HAPPINESS_SIZE_MAX,
        step = 1,
        decimalNumbers = 0,
        getter = function() return db.happinessSize end,
        setter = function(value)
            db.happinessSize = Clamp(
                value, HAPPINESS_SIZE_MIN, HAPPINESS_SIZE_MAX)
            PetFrame.UpdateAuxiliaryFrames()
        end,
        getDefault = function() return DEFAULTS.happinessSize end,
        callback = PetFrame.UpdateAuxiliaryFrames,
        dependence = dependence,
        groupHeaderName = "欢乐度",
    })
    AddOptionName(happinessSize, "GW2PlusPetHappinessSize")

    local feed = panel:AddOption("启用", nil, {
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
    if addonTable.PetFeed and addonTable.PetFeed.AddOptions then
        addonTable.PetFeed.AddOptions(panel, dependence)
    end
    panel.__gwPlusPetAuxiliaryOptions = true
end

local function InstallHooks()
    local mixin = _G.GwPlayerPetFrameMixin
    if mixin and hooksecurefunc and not mixin.__gwPlusPetLayoutHooked then
        mixin.__gwPlusPetLayoutHooked = true
        hooksecurefunc(mixin, "UpdateSettings", PetFrame.ApplyLayout)
        hooksecurefunc(mixin, "ToggleAuraPosition", PetFrame.ApplyLayout)
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
