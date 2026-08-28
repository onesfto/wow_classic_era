local _, addonTable = ...

local PetFeed = {}
addonTable.PetFeed = PetFeed

local FEED_PET_SPELL_ID = 6991
local MAX_LEVEL_DELTA = 30
local ACTION_BUTTON_HIGHLIGHT =
    "Interface/AddOns/GW2_UI/textures/uistuff/ui-quickslot-depress.png"
local ACTION_BUTTON_PUSHED =
    "Interface/AddOns/GW2_UI/textures/uistuff/actionbutton-pressed.png"
local ACTION_BUTTON_BORDER =
    "Interface/AddOns/GW2_UI/textures/bag/bagitemborder.png"
local CATEGORY_ORDER = {"conjured", "basic", "wellfed", "inedible"}
local CATEGORY_NAMES = {
    conjured = "魔法制造物",
    basic = "普通食物",
    wellfed = "能喂饱的食物",
    inedible = "生食",
}
local DIET_ALIASES = {
    Meat = "Meat", ["肉"] = "Meat", ["肉类"] = "Meat",
    Fish = "Fish", ["鱼"] = "Fish", ["鱼类"] = "Fish",
    Bread = "Bread", ["面包"] = "Bread",
    Cheese = "Cheese", ["奶酪"] = "Cheese",
    Fruit = "Fruit", ["水果"] = "Fruit",
    Fungus = "Fungus", ["蘑菇"] = "Fungus",
    ["Mechanical Bits"] = "Mechanical Bits", ["机械零件"] = "Mechanical Bits",
}
local DEFAULTS = {
    buttonSize = 25,
    useLowLevelFirst = true,
    avoidQuestFood = true,
    alertType = 1,
    excludedCategories = {},
    excludedFoods = {},
    foodLog = {},
}
PetFeed.DEFAULTS = DEFAULTS
PetFeed.FeedPetSpellID = FEED_PET_SPELL_ID
PetFeed.CategoryOrder = CATEGORY_ORDER
PetFeed.CategoryNames = CATEGORY_NAMES

local function CopyTable(source)
    local copy = {}
    for key, value in pairs(source or {}) do
        copy[key] = type(value) == "table" and CopyTable(value) or value
    end
    return copy
end

local function EnsureTable(parent, key)
    if type(parent[key]) ~= "table" then parent[key] = {} end
    return parent[key]
end

local function Clamp(value, minimum, maximum)
    value = tonumber(value) or minimum
    return math.max(minimum, math.min(maximum, math.floor(value + 0.5)))
end

function PetFeed.InitDB()
    _G.GW2_UI_PLUS_SV = type(_G.GW2_UI_PLUS_SV) == "table"
        and _G.GW2_UI_PLUS_SV or {}
    local db = _G.GW2_UI_PLUS_SV.petFeed
    if type(db) ~= "table" then
        db = {}
        _G.GW2_UI_PLUS_SV.petFeed = db
    end
    for key, value in pairs(DEFAULTS) do
        if db[key] == nil then db[key] = type(value) == "table"
            and CopyTable(value) or value end
    end
    db.buttonSize = Clamp(db.buttonSize, 16, 64)
    db.alertType = Clamp(db.alertType, 1, 3)
    EnsureTable(db, "excludedCategories")
    EnsureTable(db, "excludedFoods")
    EnsureTable(db, "foodLog")
    return db
end

function PetFeed.ResetDB()
    local db = PetFeed.InitDB()
    for key, value in pairs(DEFAULTS) do
        db[key] = type(value) == "table" and CopyTable(value) or value
    end
    return db
end

local function NormalizeDiet(diet)
    return DIET_ALIASES[diet] or diet
end

local function HasDiet(diets, wanted)
    for _, diet in ipairs(diets or {}) do
        if NormalizeDiet(diet) == wanted then return true end
    end
    return false
end

local function IsBadFood(settings, family, itemID)
    local log = settings.foodLog and settings.foodLog[family]
    return log and log.bad and log.bad[itemID] ~= nil
end

local function IsQuestFood(context, itemID, count)
    local required = context.questFood and context.questFood[itemID]
    return required and (context.counts and context.counts[itemID] or count)
        <= required
end

local function IsExcluded(settings, itemID, category)
    return settings.excludedFoods and settings.excludedFoods[itemID]
        or settings.excludedCategories
        and settings.excludedCategories[category]
end

local function SortFoods(foods, useLowLevelFirst)
    table.sort(foods, function(left, right)
        if left.priority ~= right.priority then
            return left.priority < right.priority
        end
        if left.delta ~= right.delta then
            if useLowLevelFirst then
                return left.delta > right.delta
            end
            return left.delta < right.delta
        end
        if left.count ~= right.count then return left.count < right.count end
        return left.itemID < right.itemID
    end)
end

function PetFeed.FilterAndSort(entries, context, settings, fallback)
    local foods = {}
    local metadata = addonTable.PetFeedFoodData or {}
    context = context or {}
    settings = settings or DEFAULTS
    for _, entry in ipairs(entries or {}) do
        local itemID = tonumber(entry.itemID)
        local info = itemID and metadata[itemID]
        local level = tonumber(entry.level)
        local petLevel = tonumber(context.petLevel)
        if info and info.major <= 1 and level and petLevel
            and petLevel - level < MAX_LEVEL_DELTA
            and HasDiet(context.diets, info.diet)
            and not IsBadFood(settings, context.family, itemID) then
            local excluded = IsExcluded(settings, itemID, info.category)
            local questFood = IsQuestFood(context, itemID, entry.count or 0)
            if fallback or (not excluded and (not settings.avoidQuestFood or not questFood)) then
                local food = {}
                for key, value in pairs(entry) do food[key] = value end
                food.itemID = itemID
                food.priority = tonumber(info.priority) or 4
                food.category = info.category
                food.diet = info.diet
                food.delta = petLevel - level
                foods[#foods + 1] = food
            end
        end
    end
    SortFoods(foods, settings.useLowLevelFirst ~= false)
    return foods
end

function PetFeed.FindFood(entries, context, settings)
    local foods = PetFeed.FilterAndSort(entries, context, settings, false)
    if foods[1] then return foods[1], false, nil end
    local fallback = PetFeed.FilterAndSort(entries, context, settings, true)
    if fallback[1] then
        return fallback[1], true, "仅找到需要确认的备用食物"
    end
    return nil, false, "没有找到符合宠物饮食的食物"
end

local function GetSpellNameAndIcon()
    if _G.C_Spell and _G.C_Spell.GetSpellInfo then
        local info = _G.C_Spell.GetSpellInfo(FEED_PET_SPELL_ID)
        if type(info) == "table" then return info.name, info.iconID end
    end
    if _G.GetSpellInfo then
        local name, _, icon = _G.GetSpellInfo(FEED_PET_SPELL_ID)
        return name, icon
    end
end

local function SetAttribute(button, key, value)
    if value == nil then
        if button.ClearAttribute then button:ClearAttribute(key) end
    elseif button.SetAttribute then
        button:SetAttribute(key, value)
    end
end

local function SetButtonColor(button, r, g, b)
    if button.icon and button.icon.SetVertexColor then
        button.icon:SetVertexColor(r, g, b)
    elseif button.SetVertexColor then
        button:SetVertexColor(r, g, b)
    end
end

local function ApplyActionButtonStyle(button, size)
    if not button then return end
    size = tonumber(size)
    if not size and button.GetWidth then size = button:GetWidth() end
    if button.icon then
        if button.icon.ClearAllPoints then
            button.icon:ClearAllPoints()
        end
        if button.icon.SetPoint then
            button.icon:SetPoint("CENTER", button, "CENTER", 0, 0)
        end
        if button.icon.SetTexCoord then
            button.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
        end
        if button.icon.SetBlendMode then
            button.icon:SetBlendMode("BLEND")
        end
    end
    if not button.Border and button.CreateTexture then
        button.Border = button:CreateTexture(nil, "OVERLAY", nil, 3)
    end
    if button.Border then
        if button.Border.SetTexture then
            button.Border:SetTexture(ACTION_BUTTON_BORDER)
        end
        if button.Border.SetBlendMode then
            button.Border:SetBlendMode("BLEND")
        end
        if button.Border.SetSize and size then
            button.Border:SetSize(size, size)
        end
        if button.Border.SetAllPoints then
            button.Border:SetAllPoints(button)
        end
    end
    if button.SetPushedTexture then
        button:SetPushedTexture(ACTION_BUTTON_PUSHED)
    end
    local pushed = button.GetPushedTexture and button:GetPushedTexture()
    if pushed and pushed.SetSize and size then pushed:SetSize(size, size) end
    if button.SetHighlightTexture then
        button:SetHighlightTexture(ACTION_BUTTON_HIGHLIGHT)
    end
    local highlight = button.GetHighlightTexture
        and button:GetHighlightTexture()
    if highlight and highlight.SetSize and size then
        highlight:SetSize(size, size)
    end
end

local function GetItemID(link)
    return link and tonumber(string.match(link, "item:(%d+)"))
end

local function GetPetDiets()
    if not _G.GetPetFoodTypes then return {} end
    local diets = {}
    local values = {_G.GetPetFoodTypes()}
    for _, diet in ipairs(values) do diets[#diets + 1] = diet end
    return diets
end

function PetFeed.GetPetContext()
    if _G.UnitClass then
        local _, class = _G.UnitClass("player")
        if class and class ~= "HUNTER" then return end
    end
    if not _G.UnitExists or not _G.UnitExists("pet") then return end
    if _G.HasPetUI then
        local _, isHunterPet = _G.HasPetUI()
        if isHunterPet == false then return end
    end
    local family = _G.UnitCreatureFamily and _G.UnitCreatureFamily("pet")
    local petLevel = _G.UnitLevel and _G.UnitLevel("pet")
    if not family or not petLevel then return end
    return {
        family = family,
        petName = _G.UnitName and _G.UnitName("pet") or family,
        petLevel = petLevel,
        diets = GetPetDiets(),
    }
end

local function AddQuestFood(questFood, itemID, required)
    if not itemID or not required then return end
    required = tonumber(required)
    if not required then return end
    questFood[itemID] = math.max(questFood[itemID] or 0, required)
end

local function ScanQuestFood()
    local questFood = {}
    if not _G.GetNumQuestLogEntries or not _G.GetQuestLogLeaderBoard then
        return questFood
    end
    for questIndex = 1, _G.GetNumQuestLogEntries() do
        local _, _, _, _, isHeader = _G.GetQuestLogTitle(questIndex)
        if not isHeader and _G.GetNumQuestLeaderBoards then
            for objectiveIndex = 1, _G.GetNumQuestLeaderBoards(questIndex) do
                local text = _G.GetQuestLogLeaderBoard(objectiveIndex, questIndex)
                local itemName, current, required = text and string.match(
                    text, "(.*): (%d+)/(%d+)")
                if itemName and required and _G.GetItemInfo then
                    local _, link = _G.GetItemInfo(itemName)
                    local itemID = GetItemID(link)
                    if itemID and (addonTable.PetFeedFoodData or {})[itemID] then
                        AddQuestFood(questFood, itemID, required)
                    end
                end
            end
        end
    end
    return questFood
end

function PetFeed.ScanBags()
    local entries, counts = {}, {}
    local container = _G.C_Container
    local getSlots = container and container.GetContainerNumSlots
    local getInfo = container and container.GetContainerItemInfo
    if not getSlots or not getInfo then return entries, counts end
    for bag = 0, 4 do
        for slot = 1, (getSlots(bag) or 0) do
            local itemInfo = getInfo(bag, slot)
            if itemInfo and itemInfo.itemID then
                local itemID = itemInfo.itemID
                local name, link, level
                if _G.GetItemInfo then
                    local itemName, itemLink, _, itemLevel = _G.GetItemInfo(itemID)
                    name, link, level = itemName, itemLink, itemLevel
                end
                local entry = {
                    itemID = itemID,
                    bag = bag,
                    slot = slot,
                    count = itemInfo.stackCount or 1,
                    icon = itemInfo.iconFileID,
                    name = name,
                    link = itemInfo.hyperlink or link,
                    level = level,
                }
                entries[#entries + 1] = entry
                counts[itemID] = (counts[itemID] or 0) + entry.count
            end
        end
    end
    return entries, counts
end

local function ApplyFoodToButton(button, food, fallback, reason)
    if not button or (InCombatLockdown and InCombatLockdown()) then return false end
    local spellName, spellIcon = GetSpellNameAndIcon()
    SetAttribute(button, "type1", food and not fallback and "spell" or nil)
    SetAttribute(button, "spell", food and not fallback
        and (spellName or "Feed Pet") or nil)
    SetAttribute(button, "spell1", food and not fallback
        and (spellName or "Feed Pet") or nil)
    SetAttribute(button, "alt-type1", food and fallback and "spell" or nil)
    SetAttribute(button, "alt-spell", food and fallback
        and (spellName or "Feed Pet") or nil)
    SetAttribute(button, "alt-spell1", food and fallback
        and (spellName or "Feed Pet") or nil)
    SetAttribute(button, "type2", nil)
    SetAttribute(button, "target-bag", food and not fallback and food.bag or nil)
    SetAttribute(button, "target-slot", food and not fallback and food.slot or nil)
    SetAttribute(button, "target-item", food and not fallback
        and string.format("%d %d", food.bag, food.slot) or nil)
    SetAttribute(button, "alt-target-bag", food and fallback and food.bag or nil)
    SetAttribute(button, "alt-target-slot", food and fallback and food.slot or nil)
    SetAttribute(button, "alt-target-item", food and fallback
        and string.format("%d %d", food.bag, food.slot) or nil)
    button.food = food
    button.isFallback = fallback == true
    button.feedError = reason
    button.pendingWarning = nil
    button.hasFood = food ~= nil
    if button.icon and button.icon.SetTexture then
        button.icon:SetTexture(food and (food.icon or food.itemID) or spellIcon
            or "Interface/Icons/Ability_Hunter_MendPet")
    end
    if button.count and button.count.SetText then
        local count = food and food.count
        if food and _G.C_Item and _G.C_Item.GetItemCount then
            count = _G.C_Item.GetItemCount(food.itemID)
        elseif food and _G.GetItemCount then
            count = _G.GetItemCount(food.itemID)
        end
        button.count:SetText(food and tostring(count or 1) or "")
    end
    if food then
        SetButtonColor(button, fallback and 1 or 1, fallback and 0.75 or 1,
            fallback and 0.2 or 1)
    else
        SetButtonColor(button, 0.45, 0.45, 0.45)
    end
    return true
end

local function IsActionClickPhase(button, down)
    if type(down) ~= "boolean" then return true end
    local useOnKeyDown
    if button and button.GetAttribute then
        useOnKeyDown = button:GetAttribute("useOnKeyDown")
    end
    if useOnKeyDown == nil and _G.GetCVarBool then
        useOnKeyDown = _G.GetCVarBool("ActionButtonUseKeyDown")
    end
    return down == (useOnKeyDown == true)
end

function PetFeed.AttachButton(button)
    if not button then return end
    if button.__gwPlusPetFeedAttached then return button end
    button.__gwPlusPetFeedAttached = true
    button.gwPlusProtected = true
    button:RegisterForClicks("AnyUp", "AnyDown")
    local spellName, spellIcon = GetSpellNameAndIcon()
    SetAttribute(button, "type1", "spell")
    SetAttribute(button, "spell", spellName or "Feed Pet")
    SetAttribute(button, "spell1", spellName or "Feed Pet")
    button.icon = button.icon or button:CreateTexture(nil, "ARTWORK", nil, 2)
    if button.icon.SetAllPoints then button.icon:SetAllPoints(button) end
    ApplyActionButtonStyle(button)
    if button.Border and button.Border.Hide then button.Border:Hide() end
    if not button.count and button.CreateFontString then
        button.count = button:CreateFontString(nil, "OVERLAY", "NumberFontNormal")
        button.count:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -1, 1)
    end
    if button.icon.SetTexture then
        button.icon:SetTexture(spellIcon or "Interface/Icons/Ability_Hunter_MendPet")
    end
    local function HandleRightClick(self, mouseButton, down)
        if not IsActionClickPhase(self, down) then return end
        if mouseButton == "RightButton" and PetFeed.OpenSettings then
            PetFeed.OpenSettings()
        end
    end
    if button.HookScript then
        button:HookScript("OnClick", HandleRightClick)
    else
        button:SetScript("OnMouseUp", HandleRightClick)
    end
    button:SetScript("PreClick", function(self, mouseButton, down)
        if not IsActionClickPhase(self, down) then return end
        if mouseButton == "RightButton" then return end
        self.pendingItemID = nil
        self.pendingItemName = nil
        if self.isFallback and IsAltKeyDown and IsAltKeyDown() then
            self.pendingItemID = self.food and self.food.itemID
            self.pendingItemName = self.food and self.food.name
        elseif self.isFallback then
            self.pendingWarning = self.feedError
        elseif self.food then
            self.pendingItemID = self.food.itemID
            self.pendingItemName = self.food.name
        end
    end)
    button:SetScript("PostClick", function(self, mouseButton, down)
        if not IsActionClickPhase(self, down) then return end
        if mouseButton == "LeftButton" and self.pendingWarning
            and not (IsAltKeyDown and IsAltKeyDown()) then
            PetFeed.NotifyFallback(self)
        end
    end)
    button:SetScript("OnEnter", function(self)
        if self.Border and self.Border.Show then self.Border:Show() end
        PetFeed.ShowTooltip(self)
    end)
    button:SetScript("OnLeave", function(self)
        if self.Border and self.Border.Hide then self.Border:Hide() end
        if GameTooltip then GameTooltip:Hide() end
    end)
    return button
end

local function BuildEntries(context)
    local entries, counts = PetFeed.ScanBags()
    context.questFood = ScanQuestFood()
    context.counts = counts
    return entries
end

function PetFeed.NotifyFallback(button)
    local message = button and button.feedError or "没有找到未禁用的食物"
    if DEFAULT_CHAT_FRAME and DEFAULT_CHAT_FRAME.AddMessage then
        DEFAULT_CHAT_FRAME:AddMessage("GW2 UI Plus: " .. message .. "，按住 Alt 再左键确认。")
    end
end

function PetFeed.ShowTooltip(button)
    if not GameTooltip then return end
    GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
    if button.food and button.food.bag
        and GameTooltip.SetBagItem then
        GameTooltip:SetBagItem(button.food.bag, button.food.slot)
    else
        GameTooltip:SetText(button.food and (button.food.name or tostring(button.food.itemID))
            or "不能喂养宠物", 1, 1, 1)
    end
    local context = PetFeed.GetPetContext()
    if context then
        GameTooltip:AddLine("宠物饮食: " .. table.concat(context.diets, ", "),
            0.8, 0.8, 0.8)
    end
    if button.isFallback then
        GameTooltip:AddLine("备用食物：按住 Alt 再左键确认。", 1, 0.75, 0.2, true)
    elseif button.feedError then
        GameTooltip:AddLine(button.feedError, 1, 0.2, 0.2, true)
    elseif button.food then
        GameTooltip:AddLine("左键喂食，右键打开喂食设置。", 0.8, 0.8, 0.8)
    end
    GameTooltip:Show()
end

function PetFeed.Alert(context, food)
    local db = PetFeed.InitDB()
    if db.alertType == 3 or not context or not food then return end
    local text = string.format("%s 喂了 %s。", context.petName or "宠物",
        food.name or tostring(food.itemID))
    if db.alertType == 1 and SendChatMessage then
        SendChatMessage(text, "EMOTE")
    elseif db.alertType == 2 and DEFAULT_CHAT_FRAME
        and DEFAULT_CHAT_FRAME.AddMessage then
        DEFAULT_CHAT_FRAME:AddMessage(text)
    end
end

function PetFeed.LogFood(status, itemID, itemName, family)
    if not itemID or not family then return end
    local db = PetFeed.InitDB()
    local log = db.foodLog[family]
    if type(log) ~= "table" then
        log = {good = {}, bad = {}}
        db.foodLog[family] = log
    end
    log.good = log.good or {}
    log.bad = log.bad or {}
    if status == "good" or status == "bad" then
        log[status][itemID] = itemName or tostring(itemID)
    end
end

function PetFeed.Refresh()
    local button = _G.GwPlusPetFeed
    if not button then return false end
    local context = PetFeed.GetPetContext()
    local db = PetFeed.InitDB()
    local frameDB = _G.GW2_UI_PLUS_SV
        and _G.GW2_UI_PLUS_SV.petFrame
    if not context or frameDB and frameDB.feedEnabled == false then
        if InCombatLockdown and InCombatLockdown() then
            PetFeed.refreshQueued = true
        else
            button:Hide()
        end
        return true
    end
    local entries = BuildEntries(context)
    local food, fallback, reason = PetFeed.FindFood(entries, context, db)
    if ApplyFoodToButton(button, food, fallback, reason) then
        if button.SetShown then button:SetShown(true) else button:Show() end
    end
    button.petContext = context
    return true
end

function PetFeed.RequestRefresh()
    if InCombatLockdown and InCombatLockdown() then
        PetFeed.refreshQueued = true
        return false
    end
    PetFeed.refreshQueued = false
    return PetFeed.Refresh()
end

function PetFeed.UpdateVisibility(enabled)
    local button = _G.GwPlusPetFeed
    if not button then return end
    if enabled == false or not PetFeed.GetPetContext() then
        if InCombatLockdown and InCombatLockdown() then
            PetFeed.refreshQueued = true
        else
            button:Hide()
        end
        return
    end
    PetFeed.RequestRefresh()
end

function PetFeed.AddOptions(panel, dependence)
    if not panel or panel.__gwPlusPetFeedOptions then return end
    local db = PetFeed.InitDB()
    dependence = dependence or {PETBAR_ENABLED = true}
    local function Refresh()
        PetFeed.RequestRefresh()
    end
    local size = panel:AddOptionSlider("图标尺寸", "喂食图标的宽度和高度。", {
        min = 16, max = 64, step = 1, decimalNumbers = 0,
        getter = function() return db.buttonSize end,
        setter = function(value) db.buttonSize = Clamp(value, 16, 64) end,
        getDefault = function() return DEFAULTS.buttonSize end,
        callback = function()
            local button = _G.GwPlusPetFeed
            if button and (not InCombatLockdown or not InCombatLockdown()) then
                button:SetSize(db.buttonSize, db.buttonSize)
                if button.icon and button.icon.SetSize then
                    button.icon:SetSize(db.buttonSize, db.buttonSize)
                end
                ApplyActionButtonStyle(button, db.buttonSize)
                if button.gwMover then button.gwMover:SetSize(db.buttonSize, db.buttonSize) end
            end
        end,
        dependence = dependence, groupHeaderName = "喂食",
    })
    size.optionName = "GW2PlusPetFeedButtonSize"
    local low = panel:AddOption("优先低等级食物", nil, {
        getter = function() return db.useLowLevelFirst end,
        setter = function(value) db.useLowLevelFirst = value == true end,
        getDefault = function() return DEFAULTS.useLowLevelFirst end,
        callback = Refresh, dependence = dependence, groupHeaderName = "喂食",
    })
    low.optionName = "GW2PlusPetFeedLowLevelFirst"
    local quest = panel:AddOption("避免任务食物", nil, {
        getter = function() return db.avoidQuestFood end,
        setter = function(value) db.avoidQuestFood = value == true end,
        getDefault = function() return DEFAULTS.avoidQuestFood end,
        callback = Refresh, dependence = dependence, groupHeaderName = "喂食",
    })
    quest.optionName = "GW2PlusPetFeedAvoidQuestFood"
    local alert = panel:AddOptionDropdown("喂食提示方式", nil, {
        optionsList = {1, 2, 3}, optionNames = {"表情", "聊天", "关闭"},
        getter = function() return db.alertType end,
        setter = function(value) db.alertType = tonumber(value) or 1 end,
        getDefault = function() return DEFAULTS.alertType end,
        dependence = dependence, groupHeaderName = "喂食",
    })
    alert.optionName = "GW2PlusPetFeedAlertType"
    local categoryOption = panel:AddOptionDropdown("禁用食物类别", nil, {
        optionsList = CATEGORY_ORDER, optionNames = {
            CATEGORY_NAMES.conjured, CATEGORY_NAMES.basic,
            CATEGORY_NAMES.wellfed, CATEGORY_NAMES.inedible,
        }, checkbox = true, maxButtons = 4,
        getter = function(key) return db.excludedCategories[key] == true end,
        setter = function(value, key)
            db.excludedCategories[key] = value == true
            Refresh()
        end,
        getDefault = function() return false end,
        dependence = dependence, groupHeaderName = "喂食",
    })
    categoryOption.optionName = "GW2PlusPetFeedExcludedCategories"
    local foodIDs, foodNames = {}, {}
    for itemID in pairs(addonTable.PetFeedFoodData or {}) do
        foodIDs[#foodIDs + 1] = itemID
    end
    table.sort(foodIDs)
    for _, itemID in ipairs(foodIDs) do
        foodNames[#foodNames + 1] = _G.GetItemInfo and _G.GetItemInfo(itemID)
            or tostring(itemID)
    end
    local foodOption = panel:AddOptionDropdown("禁用单个食物", nil, {
        optionsList = foodIDs, optionNames = foodNames, checkbox = true,
        maxButtons = 10,
        getter = function(key) return db.excludedFoods[key] == true end,
        setter = function(value, key)
            db.excludedFoods[key] = value == true
            Refresh()
        end,
        getDefault = function() return false end,
        dependence = dependence, groupHeaderName = "喂食",
    })
    foodOption.optionName = "GW2PlusPetFeedExcludedFoods"
    panel.__gwPlusPetFeedOptions = true
end

function PetFeed.OpenSettings()
    if addonTable.OpenPetFeedSettings then
        addonTable.OpenPetFeedSettings()
        return true
    end
    local GW = _G.GW2_ADDON
    local tab = GW and GW.GetSettingsTabFrame and GW.GetSettingsTabFrame()
    if tab and tab.OpenSettingsToPanel then
        tab:OpenSettingsToPanel("pet_feed")
        return true
    end
    return false
end

local function HideGFWButton()
    if InCombatLockdown and InCombatLockdown() then return end
    local button = _G.FOM_FeedButton
    if button and button.Hide then button:Hide() end
end

local events
if _G.CreateFrame then
    events = _G.CreateFrame("Frame")
    for _, event in ipairs({
        "PLAYER_ENTERING_WORLD", "PLAYER_LOGIN", "UNIT_PET", "PET_UI_UPDATE",
        "PET_BAR_UPDATE", "BAG_UPDATE_DELAYED", "PLAYER_REGEN_DISABLED",
        "PLAYER_REGEN_ENABLED", "CHAT_MSG_PET_INFO", "UI_ERROR_MESSAGE",
        "GET_ITEM_INFO_RECEIVED", "ADDON_LOADED",
    }) do events:RegisterEvent(event) end
    events:SetScript("OnEvent", function(_, event, arg1, arg2)
        if event == "ADDON_LOADED" and arg1 ~= "GFW_FeedOMatic" then return end
        HideGFWButton()
        if event == "PLAYER_REGEN_DISABLED" then
            PetFeed.refreshQueued = true
            return
        end
        if event == "PLAYER_REGEN_ENABLED" then
            if PetFeed.refreshQueued then PetFeed.RequestRefresh() end
            return
        end
        if event == "CHAT_MSG_PET_INFO" then
            local button = _G.GwPlusPetFeed
            local context = button and button.petContext
            if button and button.pendingItemID and context then
                local itemID = button.pendingItemID
                local name = button.pendingItemName
                if arg1 and (not name or string.find(arg1, name, 1, true)) then
                    PetFeed.LogFood("good", itemID, name, context.family)
                    PetFeed.Alert(context, {itemID = itemID, name = name})
                    button.pendingItemID = nil
                    button.pendingItemName = nil
                    PetFeed.RequestRefresh()
                end
            end
            return
        end
        if event == "UI_ERROR_MESSAGE" then
            local button = _G.GwPlusPetFeed
            local wrongFood = _G.SPELL_FAILED_WRONG_PET_FOOD
            local message = arg2 or arg1
            if button and button.pendingItemID and message == wrongFood
                and button.petContext then
                PetFeed.LogFood("bad", button.pendingItemID,
                    button.pendingItemName, button.petContext.family)
                button.pendingItemID = nil
                button.pendingItemName = nil
                PetFeed.RequestRefresh()
            end
            return
        end
        if event == "GET_ITEM_INFO_RECEIVED" then
            PetFeed.RequestRefresh()
            return
        end
        PetFeed.RequestRefresh()
    end)
end

PetFeed.HideGFWButton = HideGFWButton
