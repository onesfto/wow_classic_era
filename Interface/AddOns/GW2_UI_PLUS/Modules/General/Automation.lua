local _, addonTable = ...

local General = addonTable.General
if not General then return end

local Automation = {}
General.Automation = Automation

local frame = CreateFrame("Frame")
local pendingDialogueTurnIn = false

local function IsSuppressed()
    return type(IsShiftKeyDown) == "function" and IsShiftKeyDown()
end

local function CanTurnIn()
    if IsSuppressed() then return false end
    if type(IsQuestCompletable) == "function" and not IsQuestCompletable() then
        return false
    end
    if type(GetNumQuestChoices) == "function" and GetNumQuestChoices() > 0 then
        return false
    end
    if type(GetQuestMoneyToGet) == "function" and GetQuestMoneyToGet() > 0 then
        return false
    end
    return true
end

local function GetCompletedGossipQuest()
    if _G.C_GossipInfo and type(_G.C_GossipInfo.GetActiveQuests) == "function" then
        local quests = _G.C_GossipInfo.GetActiveQuests()
        local questID
        if type(quests) ~= "table" then return nil end
        for _, quest in ipairs(quests) do
            if quest and quest.isComplete then
                if questID then return nil end
                questID = quest.questID
            end
        end
        return questID, questID and "modern" or nil
    end

    if type(GetNumGossipActiveQuests) ~= "function" or
        type(GetGossipActiveQuests) ~= "function" then
        return nil
    end
    local completedIndex
    local count = GetNumGossipActiveQuests()
    for index = 1, count do
        local _, _, _, isComplete = GetGossipActiveQuests(index)
        if isComplete then
            if completedIndex then return nil end
            completedIndex = index
        end
    end
    return completedIndex, completedIndex and "legacy" or nil
end

local function HandleEvent(_, event)
    local db = General.GetDB()
    if event == "QUEST_DETAIL" then
        if db.autoAcceptQuests and not IsSuppressed() and
            type(AcceptQuest) == "function" then
            AcceptQuest()
        end
        return
    end

    if event == "QUEST_PROGRESS" then
        if db.autoTurnInQuests and CanTurnIn() and
            type(CompleteQuest) == "function" then
            CompleteQuest()
        end
        return
    end

    if event == "QUEST_COMPLETE" then
        local shouldTurnIn = db.autoTurnInQuests or pendingDialogueTurnIn
        pendingDialogueTurnIn = false
        if shouldTurnIn and CanTurnIn() and
            type(GetQuestReward) == "function" then
            GetQuestReward(1)
        end
        return
    end

    if event == "GOSSIP_SHOW" and db.autoDialogueTurnIn and not IsSuppressed() then
        local questID, api = GetCompletedGossipQuest()
        if api == "modern" and type(_G.C_GossipInfo.SelectActiveQuest) == "function" then
            pendingDialogueTurnIn = true
            _G.C_GossipInfo.SelectActiveQuest(questID)
        elseif api == "legacy" and type(SelectGossipActiveQuest) == "function" then
            pendingDialogueTurnIn = true
            SelectGossipActiveQuest(questID)
        end
    end
end

frame:SetScript("OnEvent", HandleEvent)

function Automation.Apply(db)
    db = type(db) == "table" and db or General.GetDB()
    frame:UnregisterAllEvents()
    if db.autoAcceptQuests or db.autoTurnInQuests or db.autoDialogueTurnIn then
        frame:RegisterEvent("QUEST_DETAIL")
        frame:RegisterEvent("QUEST_PROGRESS")
        frame:RegisterEvent("QUEST_COMPLETE")
        frame:RegisterEvent("GOSSIP_SHOW")
    else
        pendingDialogueTurnIn = false
    end
end
