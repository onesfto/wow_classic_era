local _, addonTable = ...
local CooldownPulse = {}
addonTable.CooldownPulse = CooldownPulse
local GW = _G.GW2_ADDON
local fadeInTime, fadeOutTime, maxAlpha, animScale, iconSize, holdTime, showSpellName, spellNamePosition, ignoredSpells, invertIgnored, remainingCooldownWhenNotified
local cooldowns, animating, watching, itemSpells = {}, {}, {}, {}
local GetTime = GetTime
local defaults = {
    enable = true,
    fadeInTime = 0.3,
    fadeOutTime = 0.7,
    maxAlpha = 0.7,
    animScale = 1.5,
    iconSize = 75,
    holdTime = 0,
    petOverlay = {1, 1, 1},
    showSpellName = false,
    spellNamePosition = "TOP",
    x = 0,
    y = 0,
    remainingCooldownWhenNotified = 0,
    ignoredSpells = "",
    invertIgnored = false
}
CooldownPulse.defaults = defaults
local function InitDB()
    GW2_UI_PLUS_CooldownPulseSV = GW2_UI_PLUS_CooldownPulseSV or {}
    local db = GW2_UI_PLUS_CooldownPulseSV
    for k, v in pairs(defaults) do
        if db[k] == nil then
            db[k] = (type(v) == "table") and CopyTable(v) or v
        end
    end
    if db.x == 0 and db.y == 0 then
        db.x = UIParent:GetWidth() * UIParent:GetEffectiveScale() / 2
        db.y = UIParent:GetHeight() * UIParent:GetEffectiveScale() / 2
    end
    return db
end
CooldownPulse.InitDB = InitDB
local DCP = CreateFrame("Frame", "GW2Plus_CooldownPulseFrame", UIParent)
DCP:SetFrameStrata("HIGH")
if GW and GW.BackdropTemplates and DCP.GwCreateBackdrop then
    DCP:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder)
end
DCP:SetMovable(true)
DCP:RegisterForDrag("LeftButton")
DCP:SetScript("OnDragStart", function(self)
    if not self.isLocked then
        self:StartMoving()
    end
end)
DCP:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    local db = GW2_UI_PLUS_CooldownPulseSV
    db.x = self:GetLeft() + self:GetWidth() / 2
    db.y = self:GetBottom() + self:GetHeight() / 2
    self:ClearAllPoints()
    self:SetPoint("CENTER", UIParent, "BOTTOMLEFT", db.x, db.y)
end)
DCP.TextFrame = DCP:CreateFontString(nil, "ARTWORK")
DCP.TextFrame:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE")
DCP.TextFrame:SetShadowOffset(2, -2)
DCP.TextFrame:SetWidth(185)
DCP.TextFrame:SetJustifyH("CENTER")
DCP.TextFrame:SetTextColor(1, 1, 1)
local DCPT = DCP:CreateTexture(nil, "BACKGROUND")
DCPT:SetPoint("TOPLEFT", DCP, "TOPLEFT", 3, -3)
DCPT:SetPoint("BOTTOMRIGHT", DCP, "BOTTOMRIGHT", -3, 3)
DCPT:SetTexCoord(0.08, 0.92, 0.08, 0.92)
CooldownPulse.DCP = DCP
local function tcount(tab)
    local n = 0
    for _ in pairs(tab) do
        n = n + 1
    end
    return n
end
local function memoize(f)
    local cache = nil
    local memoized = {}
    local function get()
        if (cache == nil) then
            cache = f()
        end
        return cache
    end
    memoized.resetCache = function()
        cache = nil
    end
    setmetatable(memoized, {__call = get})
    return memoized
end
local function GetPetActionIndexByName(name)
    for i=1, NUM_PET_ACTION_SLOTS, 1 do
        if (GetPetActionInfo(i) == name) then
            return i
        end
    end
    return nil
end
local function UpdateSpellNamePosition()
    DCP.TextFrame:ClearAllPoints()
    if spellNamePosition == "CENTER" then
        DCP.TextFrame:SetPoint("CENTER", DCP, "CENTER")
    elseif spellNamePosition == "BOTTOM" then
        DCP.TextFrame:SetPoint("TOP", DCP, "BOTTOM", 0, -4)
    else
        DCP.TextFrame:SetPoint("BOTTOM", DCP, "TOP", 0, 4)
    end
end
local function RefreshLocals()
    local db = GW2_UI_PLUS_CooldownPulseSV
    fadeInTime = db.fadeInTime
    fadeOutTime = db.fadeOutTime
    maxAlpha = db.maxAlpha
    animScale = db.animScale
    iconSize = db.iconSize
    holdTime = db.holdTime
    showSpellName = db.showSpellName
    spellNamePosition = db.spellNamePosition
    invertIgnored = db.invertIgnored
    remainingCooldownWhenNotified = db.remainingCooldownWhenNotified
    ignoredSpells = {}
    for _, v in ipairs({strsplit(",", db.ignoredSpells)}) do
        ignoredSpells[strtrim(v)] = true
    end
    UpdateSpellNamePosition()
end
CooldownPulse.RefreshLocals = RefreshLocals
local function TrackItemSpell(itemID)
    local _, spellID = GetItemSpell(itemID)
    if (spellID) then
        itemSpells[spellID] = itemID
        return true
    else
        return false
    end
end
local function IsAnimatingCooldownByName(name)
    for i, details in pairs(animating) do
        if details[3] == name then
            return true
        end
    end
    return false
end
local elapsed = 0
local runtimer = 0
local function OnUpdate(_, update)
    elapsed = elapsed + update
    if (elapsed > 0.05) then
        for id, v in pairs(watching) do
            if (GetTime() >= v[1] + 0.5) then
                local getCooldownDetails
                if (v[2] == "spell") then
                    getCooldownDetails = memoize(function()
                        local start, duration, enabled = GetSpellCooldown(v[3])
                        return {
                            name = GetSpellInfo(v[3]),
                            texture = GetSpellTexture(v[3]),
                            start = start,
                            duration = duration,
                            enabled = enabled
                        }
                    end)
                elseif (v[2] == "item") then
                    getCooldownDetails = memoize(function()
                        local start, duration, enabled = C_Container.GetItemCooldown(id)
                        return {
                            name = GetItemInfo(id),
                            texture = v[3],
                            start = start,
                            duration = duration,
                            enabled = enabled
                        }
                    end)
                elseif (v[2] == "pet") then
                    getCooldownDetails = memoize(function()
                        local name, texture = GetPetActionInfo(v[3])
                        local start, duration, enabled = GetPetActionCooldown(v[3])
                        return {
                            name = name,
                            texture = texture,
                            isPet = true,
                            start = start,
                            duration = duration,
                            enabled = enabled
                        }
                    end)
                end
                local cooldown = getCooldownDetails()
                if ((ignoredSpells[cooldown.name] ~= nil or ignoredSpells[tostring(id)] ~= nil) ~= invertIgnored) then
                    watching[id] = nil
                else
                    if (cooldown.enabled ~= 0) then
                        if (cooldown.duration and cooldown.duration > 2.0 and cooldown.texture) then
                            cooldowns[id] = getCooldownDetails
                        end
                    end
                    if (not (cooldown.enabled == 0 and v[2] == "spell")) then
                        watching[id] = nil
                    end
                end
            end
        end
        for i, getCooldownDetails in pairs(cooldowns) do
            local cooldown = getCooldownDetails()
            if cooldown.start then
                local remaining = cooldown.duration - (GetTime() - cooldown.start)
                if (remaining <= remainingCooldownWhenNotified) then
                    if not IsAnimatingCooldownByName(cooldown.name) then
                        tinsert(animating, {cooldown.texture, cooldown.isPet, cooldown.name})
                    end
                    cooldowns[i] = nil
                end
            else
                cooldowns[i] = nil
            end
        end
        elapsed = 0
        if (#animating == 0 and tcount(watching) == 0 and tcount(cooldowns) == 0) then
            DCP:SetScript("OnUpdate", nil)
            return
        end
    end
    if (#animating > 0) then
        runtimer = runtimer + update
        if (runtimer > (fadeInTime + holdTime + fadeOutTime)) then
            tremove(animating, 1)
            runtimer = 0
            DCP.TextFrame:SetText(nil)
            DCPT:SetTexture(nil)
            DCPT:SetVertexColor(1, 1, 1)
        else
            if (not DCPT:GetTexture()) then
                if (animating[1][3] ~= nil and showSpellName) then
                    DCP.TextFrame:SetText(animating[1][3])
                end
                DCPT:SetTexture(animating[1][1])
                if animating[1][2] then
                    DCPT:SetVertexColor(unpack(GW2_UI_PLUS_CooldownPulseSV.petOverlay))
                end
            end
            local alpha = maxAlpha
            if (runtimer < fadeInTime) then
                alpha = maxAlpha * (runtimer / fadeInTime)
            elseif (runtimer >= fadeInTime + holdTime) then
                alpha = maxAlpha - (maxAlpha * ((runtimer - holdTime - fadeInTime) / fadeOutTime))
            end
            DCP:SetAlpha(alpha)
            local scale = iconSize + (iconSize * ((animScale - 1) * (runtimer / (fadeInTime + holdTime + fadeOutTime))))
            DCP:SetWidth(scale)
            DCP:SetHeight(scale)
        end
    end
end
CooldownPulse.OnUpdate = OnUpdate
local EventFrame = CreateFrame("Frame")
EventFrame:SetScript("OnEvent", function(self, event, ...)
    if not GW2_UI_PLUS_CooldownPulseSV or not GW2_UI_PLUS_CooldownPulseSV.enable then return end
    if event == "SPELL_UPDATE_COOLDOWN" then
        for i, getCooldownDetails in pairs(cooldowns) do
            getCooldownDetails.resetCache()
        end
    elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
        local unit, lineID, spellID = ...
        if (unit == "player") then
            local itemID = itemSpells[spellID]
            if (itemID) then
                local texture = select(10, GetItemInfo(itemID))
                watching[itemID] = {GetTime(), "item", texture}
                itemSpells[spellID] = nil
            else
                watching[spellID] = {GetTime(), "spell", spellID}
            end
            if (not DCP:IsMouseEnabled()) then
                DCP:SetScript("OnUpdate", OnUpdate)
            end
        end
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local _, subEvent, _, _, _, sourceFlags, _, _, _, _, _, spellID = CombatLogGetCurrentEventInfo()
        if (subEvent == "SPELL_CAST_SUCCESS") then
            if (bit.band(sourceFlags, COMBATLOG_OBJECT_TYPE_PET) == COMBATLOG_OBJECT_TYPE_PET and bit.band(sourceFlags, COMBATLOG_OBJECT_AFFILIATION_MINE) == COMBATLOG_OBJECT_AFFILIATION_MINE) then
                local name = GetSpellInfo(spellID)
                local index = GetPetActionIndexByName(name)
                if (index and not select(6, GetPetActionInfo(index))) then
                    watching[spellID] = {GetTime(), "pet", index}
                elseif (not index and spellID) then
                    watching[spellID] = {GetTime(), "spell", spellID}
                else
                    return
                end
                if (not DCP:IsMouseEnabled()) then
                    DCP:SetScript("OnUpdate", OnUpdate)
                end
            end
        end
    elseif event == "PLAYER_ENTERING_WORLD" then
        local inInstance, instanceType = IsInInstance()
        if (inInstance and instanceType == "arena") then
            DCP:SetScript("OnUpdate", nil)
            wipe(cooldowns)
            wipe(watching)
        end
    elseif event == "PLAYER_SPECIALIZATION_CHANGED" then
        local unit = ...
        if (unit == "player") then
            wipe(cooldowns)
            wipe(watching)
        end
    end
end)
local function Initialize()
    local db = InitDB()
    RefreshLocals()
    DCP.isLocked = true
    DCP:EnableMouse(false)
    DCP:SetPoint("CENTER", UIParent, "BOTTOMLEFT", db.x, db.y)
    if not db.enable then return end
    EventFrame:RegisterEvent("SPELL_UPDATE_COOLDOWN")
    EventFrame:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
    EventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
    EventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
    if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
        EventFrame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
    end
    hooksecurefunc("UseAction", function(slot)
        local actionType, itemID = GetActionInfo(slot)
        if (actionType == "item" and not TrackItemSpell(itemID)) then
            local texture = GetActionTexture(slot)
            watching[itemID] = {GetTime(), "item", texture}
        end
    end)
    hooksecurefunc("UseInventoryItem", function(slot)
        local itemID = GetInventoryItemID("player", slot);
        if (itemID and not TrackItemSpell(itemID)) then
            local texture = GetInventoryItemTexture("player", slot)
            watching[itemID] = {GetTime(), "item", texture}
        end
    end)
    hooksecurefunc(C_Container, "UseContainerItem", function(bag, slot)
        local itemID = C_Container.GetContainerItemID(bag, slot)
        if (itemID and not TrackItemSpell(itemID)) then
            local texture = select(10, GetItemInfo(itemID))
            watching[itemID] = {GetTime(), "item", texture}
        end
    end)
end
local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("PLAYER_LOGIN")
initFrame:SetScript("OnEvent", function()
    Initialize()
end)
function CooldownPulse.TestAndUnlock()
    local db = GW2_UI_PLUS_CooldownPulseSV
    if DCP.isLocked then
        DCP.isLocked = false
        DCP:EnableMouse(true)
        RefreshLocals()
        DCP.TextFrame:SetText("解锁中...\n拖动以移动")
        DCPT:SetTexture("Interface\\Icons\\Spell_Nature_Earthbind")
        DCP:SetWidth(iconSize)
        DCP:SetHeight(iconSize)
        DCP:SetAlpha(db.maxAlpha)
        DCP:SetScript("OnUpdate", nil)
        print("|cffffcc00[GW2 UI PLUS]|r 冷却闪烁已解锁，可以拖动图标。输入 /dcp 锁定。")
    else
        DCP.isLocked = true
        DCP:EnableMouse(false)
        DCP.TextFrame:SetText(nil)
        DCPT:SetTexture(nil)
        RefreshLocals()
        tinsert(animating, {"Interface\\Icons\\Spell_Nature_Earthbind", nil, "测试技能"})
        DCP:SetScript("OnUpdate", OnUpdate)
        print("|cffffcc00[GW2 UI PLUS]|r 冷却闪烁已锁定，播放了一次测试动画。")
    end
end
SlashCmdList["GW2PLUS_COOLDOWNPULSE"] = CooldownPulse.TestAndUnlock
SLASH_GW2PLUS_COOLDOWNPULSE1 = "/dcp"
SLASH_GW2PLUS_COOLDOWNPULSE2 = "/cooldownpulse"
SLASH_GW2PLUS_COOLDOWNPULSE3 = "/doomcooldownpulse"
