local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local TOGGLE = "RAID_STYLE_PARTY_AND_FRAMES"
local PARTY_FRAMES = "PARTY_FRAMES"
local RAID_STYLE_PARTY = "RAID_STYLE_PARTY"

local PartyInRaid = {}
addonTable.PartyInRaid = PartyInRaid

local controller = CreateFrame("Frame")
local pendingRefresh = false
local isShowingInRaid = false

local FRAME_UNIT_EVENTS = {
    "UNIT_AURA", "UNIT_LEVEL", "UNIT_PHASE", "UNIT_HEALTH",
    "UNIT_MAXHEALTH", "UNIT_POWER_FREQUENT", "UNIT_MAXPOWER",
    "UNIT_NAME_UPDATE", "UNIT_MODEL_CHANGED", "UNIT_HEAL_PREDICTION",
    "UNIT_THREAT_SITUATION_UPDATE", "UNIT_PORTRAIT_UPDATE",
}

local PET_UNIT_EVENTS = {
    "UNIT_AURA", "UNIT_LEVEL", "UNIT_PHASE", "UNIT_HEALTH",
    "UNIT_MAXHEALTH", "UNIT_POWER_UPDATE", "UNIT_MAXPOWER",
    "UNIT_NAME_UPDATE", "UNIT_HEAL_PREDICTION",
}

local function GetPartyFrameUnit(index)
    if index == 1 and GW.settings.PARTY_PLAYER_FRAME then
        return "player", "pet"
    end

    local partyIndex = index - (GW.settings.PARTY_PLAYER_FRAME and 1 or 0)
    return "party" .. partyIndex, "partypet" .. partyIndex
end

local function GetRaidSubgroupUnits()
    local playerIndex = UnitInRaid("player")
    if not playerIndex then return {} end

    local _, _, playerSubgroup = GetRaidRosterInfo(playerIndex)
    if not playerSubgroup then return {} end

    local units = {}
    if GW.settings.PARTY_PLAYER_FRAME then
        units[#units + 1] = "raid" .. playerIndex
    end

    for raidIndex = 1, GetNumGroupMembers() do
        local _, _, subgroup = GetRaidRosterInfo(raidIndex)
        if subgroup == playerSubgroup and raidIndex ~= playerIndex then
            units[#units + 1] = "raid" .. raidIndex
        end
    end

    return units
end

local function UpdateRaidPartyFrame(frame, event, unit, ...)
    if not frame.gwPlusRaidPartyUnit then return end
    if event == "UNIT_PET" then
        if UnitExists(frame.unit) then
            frame:UpdateFrame()
            frame.auras:ForceUpdate()
        end
        return
    end
    if not UnitExists(frame.unit) then return end
    if unit and unit ~= frame.unit then return end

    if event == "UNIT_AURA" then
        GW.UpdateBuffLayout(frame, event, frame.unit, ...)
    elseif event == "UNIT_HEALTH" or event == "UNIT_HEALTH_FREQUENT"
        or event == "UNIT_MAXHEALTH" or event == "UNIT_HEAL_PREDICTION"
        or event == "UNIT_ABSORB_AMOUNT_CHANGED"
        or event == "UNIT_HEAL_ABSORB_AMOUNT_CHANGED" then
        frame:UpdateHealthBar()
    elseif event == "UNIT_POWER_FREQUENT" or event == "UNIT_POWER_UPDATE"
        or event == "UNIT_MAXPOWER" then
        frame:UpdatePowerBar()
    elseif event == "UNIT_LEVEL" or event == "UNIT_MODEL_CHANGED"
        or event == "UNIT_PET" then
        frame:UpdateFrame()
        frame.auras:ForceUpdate()
    elseif event == "UNIT_PHASE" or event == "PARTY_MEMBER_DISABLE"
        or event == "PARTY_MEMBER_ENABLE" or event == "UNIT_THREAT_SITUATION_UPDATE"
        or event == "INCOMING_RESURRECT_CHANGED"
        or event == "INCOMING_SUMMON_CHANGED" then
        frame:UpdateAwayData()
    elseif event == "UNIT_PORTRAIT_UPDATE" or event == "PORTRAITS_UPDATED" then
        frame:UpdatePortrait()
    elseif event == "UNIT_NAME_UPDATE" then
        frame:SetUnitName()
    elseif event == "READY_CHECK" or event == "READY_CHECK_CONFIRM"
        or event == "READY_CHECK_FINISHED" then
        frame:UpdateAwayData()
    end
end

local function RegisterUnitEvents(frame, unit, events, healthEvent)
    for _, event in ipairs(events) do
        frame:UnregisterEvent(event)
        frame:RegisterUnitEvent(event, unit)
    end

    if healthEvent then
        frame:UnregisterEvent(healthEvent)
        frame:RegisterUnitEvent(healthEvent, unit)
    end
end

local function RegisterPetOwnerEvent(petFrame, ownerUnit)
    petFrame:UnregisterEvent("UNIT_PET")
    petFrame:RegisterUnitEvent("UNIT_PET", ownerUnit)
end

local function RefreshFrame(frame, unit, petUnit)
    if not frame.gwPlusOriginalOnEvent then
        frame.gwPlusOriginalOnEvent = frame:GetScript("OnEvent")
        frame.PetFrame.gwPlusOriginalOnEvent = frame.PetFrame:GetScript("OnEvent")
    end

    if not unit then
        frame.gwPlusRaidPartyUnit = nil
        frame.PetFrame.gwPlusRaidPartyUnit = nil
        RegisterStateDriver(frame, "visibility", "hide")
        RegisterStateDriver(frame.PetFrame, "visibility", "hide")
        return
    end

    frame.gwPlusRaidPartyUnit = true
    frame.unit = unit
    frame.guid = UnitGUID(unit)
    frame:SetAttribute("unit", unit)
    frame:SetScript("OnEvent", UpdateRaidPartyFrame)
    RegisterUnitEvents(
        frame, unit, FRAME_UNIT_EVENTS,
        GW.Classic and "UNIT_HEALTH_FREQUENT" or nil)
    RegisterStateDriver(frame, "visibility", "show")
    frame:UpdateFrame()
    frame.auras:ForceUpdate()

    local petFrame = frame.PetFrame
    petFrame.gwPlusRaidPartyUnit = true
    petFrame.unit = petUnit
    petFrame.guid = UnitGUID(petUnit)
    petFrame:SetAttribute("unit", petUnit)
    petFrame:SetScript("OnEvent", UpdateRaidPartyFrame)
    RegisterUnitEvents(petFrame, petUnit, PET_UNIT_EVENTS, nil)
    RegisterPetOwnerEvent(petFrame, unit)
    RegisterStateDriver(
        petFrame, "visibility",
        GW.settings.PARTY_SHOW_PETS
            and ("[@" .. petUnit .. ",exists] show;hide") or "hide")
    if UnitExists(petUnit) then
        petFrame:UpdateFrame()
        petFrame.auras:ForceUpdate()
    end
end

local function RestorePartyFrames()
    if not isShowingInRaid then return end

    isShowingInRaid = false
    for index = 1, MAX_PARTY_MEMBERS + 1 do
        local frame = _G["GwPartyFrame" .. index]
        if frame and frame.PetFrame then
            local unit, petUnit = GetPartyFrameUnit(index)
            frame.gwPlusRaidPartyUnit = nil
            frame.PetFrame.gwPlusRaidPartyUnit = nil
            frame:SetScript("OnEvent", frame.gwPlusOriginalOnEvent or frame.OnEvent)
            frame.PetFrame:SetScript(
                "OnEvent", frame.PetFrame.gwPlusOriginalOnEvent
                    or frame.PetFrame.OnEvent)
            RegisterUnitEvents(
                frame, unit, FRAME_UNIT_EVENTS,
                GW.Classic and "UNIT_HEALTH_FREQUENT" or nil)
            RegisterUnitEvents(frame.PetFrame, petUnit, PET_UNIT_EVENTS, nil)
            RegisterPetOwnerEvent(frame.PetFrame, unit)
        end
    end

    GW.UpdatePlayerInPartySetting(false)
end

local function IsEnabledInRaid()
    return GW.settings[PARTY_FRAMES]
        and GW.settings[TOGGLE]
        and not GW.settings[RAID_STYLE_PARTY]
        and IsInRaid()
end

local function RefreshPartyFrames()
    -- 小队按钮带受保护 unit 属性；战斗中不能切换到新的团队成员。
    if InCombatLockdown() then
        pendingRefresh = true
        controller:RegisterEvent("PLAYER_REGEN_ENABLED")
        return
    end

    pendingRefresh = false
    controller:UnregisterEvent("PLAYER_REGEN_ENABLED")

    if not IsEnabledInRaid() then
        RestorePartyFrames()
        return
    end

    local units = GetRaidSubgroupUnits()
    if #units == 0 then
        RestorePartyFrames()
        return
    end

    isShowingInRaid = true
    for index = 1, MAX_PARTY_MEMBERS + 1 do
        local frame = _G["GwPartyFrame" .. index]
        if frame and frame.PetFrame then
            local unit = units[index]
            local petUnit = unit and unit:gsub("^raid", "raidpet")
            RefreshFrame(frame, unit, petUnit)
        end
    end

    GW.UpdatePartyLayout()
end
PartyInRaid.Refresh = RefreshPartyFrames

local function DisablePartyGridDuringPartyFrames()
    if PartyInRaid.gridHooked or not GW.UpdateGridSettings then return end

    PartyInRaid.gridHooked = true
    local originalUpdateGridSettings = GW.UpdateGridSettings
    GW.UpdateGridSettings = function(profile, ...)
        local suppressPartyGrid = GW.settings[TOGGLE]
            and not GW.settings[RAID_STYLE_PARTY]
            and (profile == "PARTY" or profile == "ALL")
        if not suppressPartyGrid then
            return originalUpdateGridSettings(profile, ...)
        end

        -- 上游把这个开关解释为“显示小队网格”；Plus 在调用期间临时关掉它，
        -- 仅让上游撤销网格状态，持久化设置本身仍保留给团队内小队框体使用。
        GW.settings[TOGGLE] = false
        local ok, err = pcall(originalUpdateGridSettings, profile, ...)
        GW.settings[TOGGLE] = true
        if not ok then error(err) end
    end
end

local function FindPartyPanel()
    local settingsTab = GW.GetSettingsTabFrame and GW.GetSettingsTabFrame()
    local scrollBox = settingsTab and settingsTab.menu and settingsTab.menu.ScrollBox
    local dataProvider = scrollBox and scrollBox:GetDataProvider()
    if not dataProvider or not dataProvider.ForEach then return end

    local partyPanel
    dataProvider:ForEach(function(elementData)
        local frame = elementData and elementData.isSubCat
            and elementData.itemData and elementData.itemData.frame
        if frame and frame.panelId == "party_general" then
            partyPanel = frame
            return true
        end
    end)
    return partyPanel
end

local function ConfigureSetting()
    local partyPanel = FindPartyPanel()
    if not partyPanel then return end

    local dependence = {
        [PARTY_FRAMES] = true,
        [RAID_STYLE_PARTY] = false,
    }
    for _, option in ipairs(partyPanel.gwOptions or {}) do
        if option.optionName == TOGGLE then
            option.dependence = dependence
            option.callback = RefreshPartyFrames

            local widget = option.__widget
            if widget then
                widget.dependence = dependence
                widget.callback = RefreshPartyFrames
            end
            break
        end
    end

    if GW.CheckDependencies then GW.CheckDependencies() end
end

controller:RegisterEvent("PLAYER_ENTERING_WORLD")
controller:RegisterEvent("GROUP_ROSTER_UPDATE")
controller:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_REGEN_ENABLED" and not pendingRefresh then return end
    if event == "PLAYER_ENTERING_WORLD" then
        ConfigureSetting()
        DisablePartyGridDuringPartyFrames()
        if GW.UpdateGridSettings then GW.UpdateGridSettings("PARTY", true) end
    end
    RefreshPartyFrames()
end)
