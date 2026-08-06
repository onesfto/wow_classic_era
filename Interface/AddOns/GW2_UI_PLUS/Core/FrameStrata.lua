-- 集中覆盖指定 HUD 框体的层级。

local _, addonTable = ...

local NORMAL_FRAME_LEVEL = 10
local PET_FRAME_LEVEL = 11

local NORMAL_FRAME_NAMES = {
    -- 动作条
    "MainActionBar",
    "GwMultiBarBottomLeft",
    "GwMultiBarBottomRight",
    "GwMultiBarRight",
    "GwMultiBarLeft",
    "GwMultiBar5",
    "GwMultiBar6",
    "GwMultiBar7",
    "GwStanceBar",
    "GwTotemBar",
    "GwPlusPetBarHolder",
    "GwPlusMageBar",
    "GwPlusActionBarFader",

    -- 玩家、目标、宠物与资源
    "GwPlayerUnitFrame",
    "GwTargetUnitFrame",
    "GwTargetTargetUnitFrame",
    "GwPlayerPetFrame",
    "GwCastingBarPlayer",
    "GwCastingBarPet",
    "GwPlayerPowerBar",
    "GwPlayerPowerBarDecay",
    "GwPlayerClassPower",
    "GwTargetClassPower",
    "GwCustomResourceBar",
    "GwPlayerAltClassLmb",
    "GwPlayerAltClassLmbSecret",
    "GwPlayerAltClassExBar",
    "GwPlayerAltClassExBarSecret",

    -- 经验、任务与光环
    "GwExperienceFrame",
    "GwQuestTracker",
    "GwQuestTrackerScroll",
    "GwQuestTrackerScrollChild",
    "GwQuestTrackerTimer",
    "GwObjectivesNotification",
    "GW2UIPlayerBuffs",
    "GW2UIPlayerDebuffs",

    -- 聊天与社交
    "GwChatButtonsFrame",
    "GW2_UICopyChatFrame",
    "GW_EmoteFrame",
    "FriendsFrameBattlenetFrame",

    -- 微缩地图
    "Minimap",
    "MinimapCluster",
    "GwMinimapShadow",
    "GwMapGradient",
    "Gw2UI_MinimapClickHandler",
    "GwMapTime",
    "GwMapCoords",
    "GwMapFPS",
    "GW2UI_MinimapClusterHolder",
    "GWUI_MinimapClusterBackdrop",

    -- 队伍管理、角色职责、飞行窗口
    "GwGroupManage",
    "GwManageGroupButton",
    "GwPlusToolbarGroupManageHolder",
    "GwPlusToolbarGroupManageState",
    "GwPlusToolbarQuickBar",
    "GwPlusToolbarMarkerBar",
    "GwPlusToolbarPerformanceBar",
    "GW_RaidCounter_Frame",
    "GW2PlusVehicleLeaveButton",
    "MainMenuBarVehicleLeaveButton",
    "TaxiFrame",
    "TaxiRouteMap",
    "TaxiMap",
    "TaxiCloseButton",
    "FlightMapFrame",
    "FlightMapFrameCloseButton",
    "QuestTimerFrame",
    "QuestTimerHeader",
}

local PET_FRAME_NAMES = {
    "GwPlusPetHappiness",
    "GwPlusPetFeed",
}

local ACTION_BAR_NAMES = {
    "MainActionBar",
    "GwMultiBarBottomLeft",
    "GwMultiBarBottomRight",
    "GwMultiBarRight",
    "GwMultiBarLeft",
    "GwMultiBar5",
    "GwMultiBar6",
    "GwMultiBar7",
    "GwStanceBar",
    "GwTotemBar",
    "GwPlusPetBarHolder",
    "GwPlusMageBar",
}

local UNIT_FRAME_NAMES = {
    "GwPlayerUnitFrame",
    "GwTargetUnitFrame",
    "GwTargetTargetUnitFrame",
    "GwPlayerPetFrame",
}

local GRID_CONTAINER_NAMES = {
    "GW2_PartyGridContainer",
    "GW2_PartyPetGridContainer",
    "GW2_RaidPetGridContainer",
    "GW2_Raid40GridContainer",
    "GW2_Raid25GridContainer",
    "GW2_Raid10GridContainer",
    "GW2_MaintankGridContainer",
}

local function IsInCombat()
    return InCombatLockdown and InCombatLockdown()
end

local function ApplyFrame(frame, level)
    if not frame or type(frame.SetFrameStrata) ~= "function"
        or type(frame.SetFrameLevel) ~= "function" then
        return false
    end

    if frame.IsForbidden and frame:IsForbidden() then
        return false
    end

    frame:SetFrameStrata("BACKGROUND")
    frame:SetFrameLevel(level)
    return true
end

local function ApplyNamedFrames(names, level)
    for _, name in ipairs(names) do
        ApplyFrame(_G[name], level)
    end
end

local function ApplyIndexedFrames(prefix, first, last, level)
    for index = first, last do
        ApplyFrame(_G[prefix .. index], level)
    end
end

local function ApplyDirectChildren(frame, level)
    if not frame or type(frame.GetChildren) ~= "function" then return end

    for _, child in ipairs({frame:GetChildren()}) do
        ApplyFrame(child, level)
    end
end

local function ApplyActionBars()
    ApplyNamedFrames(ACTION_BAR_NAMES, NORMAL_FRAME_LEVEL)
    ApplyFrame(_G.GwPlusMageBarHandler, NORMAL_FRAME_LEVEL)

    for _, name in ipairs(ACTION_BAR_NAMES) do
        local frame = _G[name]
        if frame then
            ApplyDirectChildren(frame, NORMAL_FRAME_LEVEL)
        end
    end

    local mageBar = _G.GwPlusMageBar
    if mageBar and type(mageBar.GetChildren) == "function" then
        for _, button in ipairs({mageBar:GetChildren()}) do
            ApplyFrame(button, NORMAL_FRAME_LEVEL)
            ApplyDirectChildren(button, NORMAL_FRAME_LEVEL)
        end
    end

    ApplyIndexedFrames("GwPlusMageBarButton", 1, 24, NORMAL_FRAME_LEVEL)
    for index = 1, 24 do
        ApplyDirectChildren(_G["GwPlusMageBarButton" .. index], NORMAL_FRAME_LEVEL)
        for popupIndex = 1, 24 do
            ApplyFrame(_G["GwPlusMageBarButton" .. index .. "Popup" .. popupIndex], NORMAL_FRAME_LEVEL)
        end
        ApplyFrame(_G["GwPlusMageBarButton" .. index .. "PopupBar"], NORMAL_FRAME_LEVEL)
    end
end

local function ApplyUnitFrameParts(frame)
    if not frame then return end

    for _, key in ipairs({
        "castingbarNormal",
        "castingbarBackground",
        "castingbar",
        "castingbarSpark",
        "auras",
        "powerbarContainer",
        "powerbar",
        "comboBar",
    }) do
        ApplyFrame(frame[key], NORMAL_FRAME_LEVEL)
    end

    ApplyDirectChildren(frame.auras, NORMAL_FRAME_LEVEL)
end

local function ApplyUnitFrames()
    ApplyNamedFrames(UNIT_FRAME_NAMES, NORMAL_FRAME_LEVEL)
    ApplyIndexedFrames("GwPartyFrame", 1, 5, NORMAL_FRAME_LEVEL)
    ApplyIndexedFrames("GwPartyPetFrame", 1, 5, NORMAL_FRAME_LEVEL)

    for _, name in ipairs(UNIT_FRAME_NAMES) do
        local frame = _G[name]
        ApplyUnitFrameParts(frame)
        ApplyDirectChildren(frame, NORMAL_FRAME_LEVEL)
    end

    for index = 1, 5 do
        ApplyUnitFrameParts(_G["GwPartyFrame" .. index])
        ApplyUnitFrameParts(_G["GwPartyPetFrame" .. index])
    end

    ApplyNamedFrames(GRID_CONTAINER_NAMES, NORMAL_FRAME_LEVEL)
    local GW = _G.GW2_ADDON
    local headers = GW and GW.GridGroupHeaders
    if headers then
        for _, header in pairs(headers) do
            ApplyFrame(header, NORMAL_FRAME_LEVEL)
            if header.groups then
                for _, group in pairs(header.groups) do
                    ApplyFrame(group, NORMAL_FRAME_LEVEL)
                    ApplyDirectChildren(group, NORMAL_FRAME_LEVEL)
                end
            end
        end
    end

    -- 目标职业资源条使用无全局名称的 GWTargetClassPower 模板。
    local uiParent = _G.UIParent
    if uiParent and type(uiParent.GetChildren) == "function" then
        for _, child in ipairs({uiParent:GetChildren()}) do
            if child.runeTex1 and child.combo1 and child.comboFlare then
                ApplyFrame(child, NORMAL_FRAME_LEVEL)
                ApplyDirectChildren(child, NORMAL_FRAME_LEVEL)
            end
        end
    end
end

local function ApplyAuraHeaders()
    ApplyNamedFrames({"GW2UIPlayerBuffs", "GW2UIPlayerDebuffs"}, NORMAL_FRAME_LEVEL)
    ApplyDirectChildren(_G.GW2UIPlayerBuffs, NORMAL_FRAME_LEVEL)
    ApplyDirectChildren(_G.GW2UIPlayerDebuffs, NORMAL_FRAME_LEVEL)
end

local function ApplyChatFrames()
    ApplyNamedFrames({
        "GwChatButtonsFrame",
        "GW2_UICopyChatFrame",
        "GW_EmoteFrame",
    }, NORMAL_FRAME_LEVEL)

    if type(CHAT_FRAMES) == "table" then
        for _, name in ipairs(CHAT_FRAMES) do
            ApplyFrame(type(name) == "string" and _G[name] or name, NORMAL_FRAME_LEVEL)
        end
    end

    ApplyIndexedFrames("ChatFrame", 1, NUM_CHAT_WINDOWS or 10, NORMAL_FRAME_LEVEL)
    for index = 1, NUM_CHAT_WINDOWS or 10 do
        local chatFrame = _G["ChatFrame" .. index]
        if chatFrame then
            ApplyFrame(chatFrame.Container, NORMAL_FRAME_LEVEL)
        end
    end
    ApplyFrame(_G.FriendsFrameBattlenetFrame, NORMAL_FRAME_LEVEL)
    ApplyFrame(_G.FriendsFrameBattlenetFrame
        and _G.FriendsFrameBattlenetFrame.BroadcastFrame, NORMAL_FRAME_LEVEL)
end

local function ApplyQuestFrames()
    ApplyNamedFrames({
        "GwQuestTracker",
        "GwQuestTrackerScroll",
        "GwQuestTrackerScrollChild",
        "GwQuestTrackerTimer",
        "GwObjectivesNotification",
        "QuestTimerFrame",
        "QuestTimerHeader",
        "QuestTimerScrollFrame",
        "QuestTimerListScrollFrame",
    }, NORMAL_FRAME_LEVEL)

    local GW = _G.GW2_ADDON
    if GW then
        for _, listName in ipairs({
            "QuestTrackerFixedContainer",
            "QuestTrackerScrollableContainer",
        }) do
            local list = GW[listName]
            if list then
                for _, frame in ipairs(list) do
                    ApplyFrame(frame, NORMAL_FRAME_LEVEL)
                    ApplyDirectChildren(frame, NORMAL_FRAME_LEVEL)
                end
            end
        end

        local containers = GW.ObjectiveTrackerContainer
        if containers then
            for _, frame in pairs(containers) do
                ApplyFrame(frame, NORMAL_FRAME_LEVEL)
                ApplyDirectChildren(frame, NORMAL_FRAME_LEVEL)
            end
        end
    end

    ApplyIndexedFrames("GwBossFrame", 1, 5, NORMAL_FRAME_LEVEL)
    ApplyIndexedFrames("GwArenaFrame", 1, 5, NORMAL_FRAME_LEVEL)
end

local function ApplyMinimapFrames()
    ApplyNamedFrames({
        "Minimap",
        "MinimapCluster",
        "GwMinimapShadow",
        "GwMapGradient",
        "Gw2UI_MinimapClickHandler",
        "GwMapTime",
        "GwMapCoords",
        "GwMapFPS",
        "GW2UI_MinimapClusterHolder",
        "GWUI_MinimapClusterBackdrop",
    }, NORMAL_FRAME_LEVEL)

    local minimap = _G.Minimap
    if minimap then
        ApplyFrame(minimap.backdrop, NORMAL_FRAME_LEVEL)
        ApplyFrame(minimap.lowerPanel, NORMAL_FRAME_LEVEL)
        ApplyFrame(minimap.sidePanel, NORMAL_FRAME_LEVEL)
        ApplyFrame(minimap.gwBorder, NORMAL_FRAME_LEVEL)
        ApplyFrame(minimap.gwBorder and minimap.gwBorder.gradient, NORMAL_FRAME_LEVEL)
        ApplyDirectChildren(minimap, NORMAL_FRAME_LEVEL)
    end
end

local function ApplyToolbarFrames()
    ApplyNamedFrames({
        "GwPlusToolbarGroupManageHolder",
        "GwPlusToolbarGroupManageState",
        "GW_RaidCounter_Frame",
    }, NORMAL_FRAME_LEVEL)

    local toolbar = addonTable.Toolbar
    if not toolbar then return end

    for _, moduleKey in ipairs({
        "groupManage",
        "quickBar",
        "markerBar",
        "performanceBar",
    }) do
        local module = toolbar[moduleKey]
        if module then
            ApplyFrame(module.frame, NORMAL_FRAME_LEVEL)
            ApplyFrame(module.button, NORMAL_FRAME_LEVEL)
            ApplyFrame(module.panel, NORMAL_FRAME_LEVEL)
            ApplyFrame(module.controller, NORMAL_FRAME_LEVEL)
            ApplyDirectChildren(module.frame, NORMAL_FRAME_LEVEL)
        end
    end

    local quickBar = toolbar.quickBar
    if quickBar and quickBar.buttons then
        for _, button in pairs(quickBar.buttons) do
            ApplyFrame(button, NORMAL_FRAME_LEVEL)
        end
    end

    local markerBar = toolbar.markerBar
    if markerBar and markerBar.buttons then
        for _, button in pairs(markerBar.buttons) do
            ApplyFrame(button, NORMAL_FRAME_LEVEL)
        end
    end
end

local function ApplyGroupMarkerFrames()
    ApplyIndexedFrames("GwRaidMarkerButton", 1, 8, NORMAL_FRAME_LEVEL)
    ApplyIndexedFrames("GwWorldMarkerButton", 1, 9, NORMAL_FRAME_LEVEL)
end

local function ApplyFrameStrata()
    if IsInCombat() then return false end

    ApplyNamedFrames(NORMAL_FRAME_NAMES, NORMAL_FRAME_LEVEL)
    ApplyNamedFrames(PET_FRAME_NAMES, PET_FRAME_LEVEL)
    ApplyActionBars()
    ApplyUnitFrames()
    ApplyAuraHeaders()
    ApplyChatFrames()
    ApplyQuestFrames()
    ApplyMinimapFrames()
    ApplyToolbarFrames()
    ApplyGroupMarkerFrames()

    return true
end

addonTable.ApplyFrameStrata = ApplyFrameStrata
addonTable.ApplyFrameStrataFrame = ApplyFrame

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
eventFrame:SetScript("OnEvent", function()
    ApplyFrameStrata()
end)

if C_Timer and C_Timer.After then
    for _, delay in ipairs({0, 0.1, 1}) do
        C_Timer.After(delay, ApplyFrameStrata)
    end
end
