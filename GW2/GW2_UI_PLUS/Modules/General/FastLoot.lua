local _, addonTable = ...

local General = addonTable.General
if not General then return end

local FastLoot = {}
General.FastLoot = FastLoot

local frame = CreateFrame("Frame")
local hiddenParent = CreateFrame("Frame")
hiddenParent:Hide()

local state = {
    isLooting = false,
    isHidden = false,
    lootFrameParent = nil,
    lootFrameStrata = nil,
}

local function GetContainerFreeSlots(bag)
    local getter = _G.C_Container and _G.C_Container.GetContainerNumFreeSlots or
        _G.GetContainerNumFreeSlots
    if type(getter) ~= "function" then return 0, 0 end
    local ok, free, family = pcall(getter, bag)
    if not ok then return 0, 0 end
    return free or 0, family or 0
end

local function GetContainerLink(bag, slot)
    local getter = _G.C_Container and _G.C_Container.GetContainerItemLink or
        _G.GetContainerItemLink
    return type(getter) == "function" and getter(bag, slot) or nil
end

local function GetContainerStackCount(bag, slot)
    local getter = _G.C_Container and _G.C_Container.GetContainerItemInfo or
        _G.GetContainerItemInfo
    if type(getter) ~= "function" then return 0 end
    local first, second = getter(bag, slot)
    if type(first) == "table" then return first.stackCount or 0 end
    return second or 0
end

local function IsBagCompatible(itemFamily, bagFamily)
    if not bagFamily or bagFamily == 0 or not itemFamily or itemFamily == 0 then
        return true
    end
    local bitLibrary = _G.bit or _G.bit32
    return bitLibrary and bitLibrary.band(itemFamily, bagFamily) ~= 0
end

local function CanFitItem(itemLink, quantity)
    if not itemLink or type(quantity) ~= "number" then return false end
    local itemFamily = type(GetItemFamily) == "function" and GetItemFamily(itemLink) or 0
    for bag = 0, 4 do
        local freeSlots, bagFamily = GetContainerFreeSlots(bag)
        if freeSlots > 0 and IsBagCompatible(itemFamily, bagFamily) then
            return true
        end
    end

    local maxStack = select(8, GetItemInfo(itemLink))
    local slotCount = _G.C_Container and _G.C_Container.GetContainerNumSlots or
        _G.GetContainerNumSlots
    if type(maxStack) ~= "number" or maxStack < 2 or type(slotCount) ~= "function" then
        return false
    end
    for bag = 0, 4 do
        for slot = 1, slotCount(bag) or 0 do
            if GetContainerLink(bag, slot) == itemLink then
                local count = GetContainerStackCount(bag, slot)
                if maxStack - count >= quantity then return true end
            end
        end
    end
    return false
end

local function ShowNativeLootFrame()
    if not _G.LootFrame then return end
    _G.LootFrame:SetParent(state.lootFrameParent or _G.UIParent)
    _G.LootFrame:SetFrameStrata(state.lootFrameStrata or "HIGH")
    state.isHidden = false
end

local function HideNativeLootFrame()
    if not _G.LootFrame then return end
    state.lootFrameParent = state.lootFrameParent or _G.LootFrame:GetParent()
    state.lootFrameStrata = state.lootFrameStrata or _G.LootFrame:GetFrameStrata()
    _G.LootFrame:SetParent(hiddenParent)
    state.isHidden = true
end

local function ShouldAutoLoot(autoLoot)
    if autoLoot then return true end
    if autoLoot ~= nil or type(GetCVarBool) ~= "function" or
        type(IsModifiedClick) ~= "function" then
        return false
    end
    return GetCVarBool("autoLootDefault") ~= IsModifiedClick("AUTOLOOTTOGGLE")
end

local function IsProtectedSlot(slot, quality, locked)
    if locked then return true end
    if _G.MasterLooterFrame and _G.MasterLooterFrame:IsShown() then return true end
    local method = type(GetLootMethod) == "function" and GetLootMethod() or nil
    local threshold = type(GetLootThreshold) == "function" and GetLootThreshold() or nil
    return method ~= nil and type(quality) == "number" and
        type(threshold) == "number" and quality >= threshold
end

local function LootItems()
    local itemCount = type(GetNumLootItems) == "function" and GetNumLootItems() or 0
    local skipped = false
    HideNativeLootFrame()
    for slot = itemCount, 1, -1 do
        local itemLink = type(GetLootSlotLink) == "function" and GetLootSlotLink(slot) or nil
        local slotType = type(GetLootSlotType) == "function" and GetLootSlotType(slot) or nil
        local _, _, quantity, _, quality, locked, isQuestItem = GetLootSlotInfo(slot)
        local itemSlot = (_G.Enum and _G.Enum.LootSlotType and _G.Enum.LootSlotType.Item) or
            _G.LOOT_SLOT_ITEM or 1
        if IsProtectedSlot(slot, quality, locked) or
            (slotType == itemSlot and not isQuestItem and not CanFitItem(itemLink, quantity)) then
            skipped = true
        elseif type(LootSlot) == "function" then
            LootSlot(slot)
        end
    end
    if skipped then ShowNativeLootFrame() end
end

local function HandleEvent(_, event, autoLoot, message)
    if event == "LOOT_READY" or event == "LOOT_OPENED" then
        if state.isLooting then return end
        state.isLooting = true
        if ShouldAutoLoot(autoLoot) then
            LootItems()
        else
            ShowNativeLootFrame()
        end
    elseif event == "LOOT_CLOSED" then
        state.isLooting = false
        ShowNativeLootFrame()
    elseif event == "UI_ERROR_MESSAGE" and state.isHidden and
        (message == _G.ERR_INV_FULL or message == _G.ERR_ITEM_MAX_COUNT) then
        ShowNativeLootFrame()
    end
end

frame:SetScript("OnEvent", HandleEvent)

function FastLoot.Apply(enabled)
    frame:UnregisterAllEvents()
    if enabled then
        General.RememberCVar("autoLootRate", "autoLootRate")
        General.SetCVar("autoLootRate", "0")
        frame:RegisterEvent("LOOT_READY")
        frame:RegisterEvent("LOOT_OPENED")
        frame:RegisterEvent("LOOT_CLOSED")
        frame:RegisterEvent("UI_ERROR_MESSAGE")
    else
        General.RestoreCVar("autoLootRate", "autoLootRate")
        state.isLooting = false
        ShowNativeLootFrame()
    end
end
