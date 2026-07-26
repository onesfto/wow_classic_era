---@class GW2
local GW = select(2, ...)
local L = GW.L

local function GetFrameFlag(frame, methodName)
    if not frame or not frame[methodName] then
        return "n/a"
    end

    local ok, value = pcall(frame[methodName], frame)
    if not ok then
        return "error"
    end

    return tostring(value)
end

local function PrintEscDebugFrame(frameName)
    local frame = _G[frameName]
    if not frame then
        return
    end

    local shown = GetFrameFlag(frame, "IsShown")
    local keyboard = GetFrameFlag(frame, "IsKeyboardEnabled")
    local propagate = GetFrameFlag(frame, "GetPropagateKeyboardInput")
    if shown == "true" or keyboard == "true" or propagate == "false" then
        GW.Notice(format("  %s shown=%s keyboard=%s propagate=%s", frameName, shown, keyboard, propagate))
    end
end

local function PrintEscDebug()
    local binding1, binding2 = GetBindingKey("TOGGLEGAMEMENU")
    local focus = GetMouseFocus and GetMouseFocus()
    local focusName = "nil"
    if focus then
        focusName = (focus.GetName and focus:GetName()) or tostring(focus)
    end

    GW.Notice("ESC debug:")
    GW.Notice(format("  TOGGLEGAMEMENU=%s%s", tostring(binding1), binding2 and (", " .. binding2) or ""))
    GW.Notice(format("  mouseFocus=%s", focusName))

    for _, frameName in ipairs({
        "GwSettingsWindow",
        "GwPopupFrame1", "GwPopupFrame2", "GwPopupFrame3", "GwPopupFrame4",
        "GwImmersiveQuestFrame",
        "GossipFrame",
        "HoverBind",
        "AFKMode",
        "GameMenuFrame",
        "StaticPopup1", "StaticPopup2", "StaticPopup3", "StaticPopup4",
        "MailFrame",
        "TradeSkillFrame",
        "CraftFrame",
        "QuestLogFrame",
        "GwSmallSettingsContainer",
    }) do
        PrintEscDebugFrame(frameName)
    end
end

local function LoadSlashCommands()
    SLASH_GWSLASH1 = "/gw2"
    function SlashCmdList.GWSLASH(msg)
        if msg == "" then
            GW.Notice(L["Slash commands:"])
            GW.Notice(L["  /gw2 settings       -> Open the settings window"])
            GW.Notice(L["  /gw2 reset windows  -> Reset the inventory and hero panel windows"])
            GW.Notice(L["  /gw2 status         -> Show the GW2 status window"])
            GW.Notice(L["  /gw2 kb             -> Activate keybind mode"])
            GW.Notice(L["  /gw2 mh             -> Activate Move HUD mode"])
            GW.Notice(L["  /gw2 reset profile  -> Reset the current profile to default settings"])
            GW.Notice(L["  /gw2 clear achievements  -> Untrack all earned achievements (Blizzard bug)"])
            GW.Notice("  /gw2 escdebug      -> Show frames that may capture ESC")
        elseif msg == "settings" then
            if InCombatLockdown() then
                GW.Notice(L["Settings are not available in combat!"])
                return
            end
            ShowUIPanel(GwSettingsWindow)
            --UIFrameFadeIn(GwSettingsWindow, 0.2, 0, 1)
        elseif msg == "reset windows" then
            GW.settings.BAG_POSITION = nil
            GW.settings.BANK_POSITION = nil
            GW.settings.HERO_POSITION = nil
            GW.settings.MAILBOX_POSITION = nil
            C_UI.Reload()
        elseif msg == "status" then
            GW.ShowStatusReport()
        elseif msg == "kb" then
            if InCombatLockdown() then
                GW.Notice(L["Settings are not available in combat!"])
                return
            end
            GW.DisplayHoverBinding()
        elseif msg == "mh" then
            if InCombatLockdown() then
                GW.Notice(L["You cannot move elements during combat!"])
                return
            end
            if GW.MoveHudScaleableFrame:IsShown() then
                GW.lockHudObjects(GW.MoveHudScaleableFrame)
            else
                GW.moveHudObjects(GW.MoveHudScaleableFrame)
            end
        elseif msg == "reset profile" then
            if InCombatLockdown() then
                GW.Notice(L["Settings are not available in combat!"])
                return
            end
            GW.ShowPopup({text =  GW.L["Are you sure you want to load the default settings?\n\nAll previous settings will be lost."],
                OnAccept = function() GW.ResetToDefault(); C_UI.Reload() end}
            )
        elseif msg == "error" then
            Gw2ErrorLog:Toggle()
        elseif msg == "escdebug" then
            PrintEscDebug()
        elseif msg == "clear achievements" then
            local trackedAchievements = C_ContentTracking.GetTrackedIDs(Enum.ContentTrackingType.Achievement)
            local numAchievements = #trackedAchievements
            local counter = 0

            for i = 1, numAchievements do
                local achievementID = trackedAchievements[i]
                local achievementName = select(2, GetAchievementInfo(achievementID))
                local wasEarnedByMe = select(13, GetAchievementInfo(achievementID))

                if wasEarnedByMe then
                    C_ContentTracking.StopTracking(Enum.ContentTrackingType.Achievement, achievementID, Enum.ContentTrackingStopType.Manual)
                    GW.Notice(format(L["Untracked Achievement '%s (%s)'"], achievementName, achievementID))

                    counter = counter + 1
                end
            end
            GW.Notice(format(L["%s Achievements cleared"], counter))
        else
            GW.Notice("\"" .. msg .. "\" is not a valid GW2 UI slash command.")
        end
    end
end
GW.LoadSlashCommands = LoadSlashCommands
