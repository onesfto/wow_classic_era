local _, addonTable = ...
local GW = _G.GW2_ADDON
if not GW then return end
local AB = addonTable.PlusActionBar
if not AB then return end
local Fader = {}
addonTable.PlusFader = Fader
local ipairs, pairs, abs = ipairs, pairs, math.abs
local FADE_IN_TIME = 0.2
local FADE_OUT_TIME = 0.38
local UPDATE_INTERVAL = 0.1
local db
local fader
local delayTimer
local gridShown = false
local wantShown
local updateElapsed = 0
local UpdateBlingState
local suspendedTargets = {}
local suspendedTargetSet = {}
local TARGETS = {
    {key = "fadeBar1", barKey = "bar1", frame = "MainActionBar"},
    {key = "fadeBar2", barKey = "bar2", frame = "GwMultiBarBottomLeft"},
    {key = "fadeBar3", barKey = "bar3", frame = "GwMultiBarBottomRight"},
    {key = "fadeBar4", barKey = "bar4", frame = "GwMultiBarRight"},
    {key = "fadeBar5", barKey = "bar5", frame = "GwMultiBarLeft"},
    {key = "fadeBar6", barKey = "bar6", frame = "GwMultiBar5"},
    {key = "fadeBar7", barKey = "bar7", frame = "GwMultiBar6"},
    {key = "fadeBar8", barKey = "bar8", frame = "GwMultiBar7"},
    {key = "fadeStanceBar", barKey = "stance", frame = "GwStanceBar"},
    {key = "fadePetBar", barKey = "pet", frame = "GwPlusPetBarHolder"},
    {key = "fadeMageBar", barKey = "mage", frame = "GwPlusMageBar"},
}
Fader.TARGETS = TARGETS
local function IsTargetSelected(target)
    if not db or not db[target.key] then return false end
    if AB.IsBarActive then return AB.IsBarActive(target.barKey) end
    return not AB.IsBarShown or AB.IsBarShown(target.barKey)
end
function Fader.IsTargetEligible(target)
    return db and db.fadeEnable == true and IsTargetSelected(target)
end
local function CreateFadeAnim(frame)
    frame.fade = frame:CreateAnimationGroup()
    frame.fade:SetLooping("NONE")
    frame.fade.anim = frame.fade:CreateAnimation("Alpha")
    frame.fade:SetScript("OnFinished", function(self)
        frame:SetAlpha(self.targetAlpha or 1)
    end)
end
local function CancelDelay()
    if delayTimer then
        delayTimer:Cancel()
        delayTimer = nil
    end
end
local function FadeTo(targetAlpha, duration)
    if not fader then return end
    if UpdateBlingState then
        UpdateBlingState(targetAlpha)
    end
    fader.fade:Stop()
    local from = fader:GetAlpha()
    if abs(from - targetAlpha) < 0.01 then
        fader:SetAlpha(targetAlpha)
        return
    end
    fader.fade.anim:SetFromAlpha(from)
    fader.fade.anim:SetToAlpha(targetAlpha)
    fader.fade.anim:SetDuration(duration)
    fader.fade.targetAlpha = targetAlpha
    fader.fade:Play()
end
local function DoFadeOut()
    delayTimer = nil
    FadeTo(db.fadeAlpha, FADE_OUT_TIME)
end
local function FadeIn()
    CancelDelay()
    FadeTo(1, FADE_IN_TIME)
end
local function FadeOut()
    CancelDelay()
    if db.fadeDelay > 0 then
        delayTimer = C_Timer.NewTimer(db.fadeDelay, DoFadeOut)
    else
        DoFadeOut()
    end
end
local function ShouldKeepShown()
    if db.keepInCombat and UnitAffectingCombat("player") then return true end
    return false
end
local function IsMouseOverAnyBar()
    for _, target in ipairs(TARGETS) do
        if IsTargetSelected(target) then
            local frame = _G[target.frame]
            if frame and frame:IsShown() and frame:IsMouseOver() then
                return true
            end
        end
    end
    return false
end
local function ShouldShow()
    if gridShown then return true end
    if ShouldKeepShown() then return true end
    if IsMouseOverAnyBar() then return true end
    return false
end
local function EvaluateState()
    if not fader or not db or not db.fadeEnable then return end
    local shown = ShouldShow()
    if wantShown == shown then return end
    wantShown = shown
    if shown then
        FadeIn()
    else
        FadeOut()
    end
end
Fader.EvaluateState = EvaluateState
local function Fader_OnUpdate(_, elapsed)
    updateElapsed = updateElapsed + elapsed
    if updateElapsed < UPDATE_INTERVAL then return end
    updateElapsed = 0
    EvaluateState()
end
local function Fader_OnEvent(_, event)
    if event == "ACTIONBAR_SHOWGRID" then
        gridShown = true
    elseif event == "ACTIONBAR_HIDEGRID" then
        gridShown = false
    end
    EvaluateState()
end
local function Button_OnEnterOrLeave()
    EvaluateState()
end
function Fader.HookButton(button)
    if not button or button.gwPlusFadeHooked then return end
    button.gwPlusFadeHooked = true
    button:HookScript("OnEnter", Button_OnEnterOrLeave)
    button:HookScript("OnLeave", Button_OnEnterOrLeave)
end
local function HookBarButtons()
    local main = _G.MainActionBar
    if (not AB.IsBarActive or AB.IsBarActive("bar1"))
        and main and main.gw_Buttons then
        for i = 1, 12 do
            Fader.HookButton(main.gw_Buttons[i])
        end
    end
    for index, info in pairs(AB.MULTIBARS) do
        local bar = _G[info.frame]
        if (not AB.IsBarActive or AB.IsBarActive("bar" .. index))
            and bar and bar.gw_Buttons then
            for i = 1, 12 do
                Fader.HookButton(bar.gw_Buttons[i])
            end
        end
    end
    local stance = _G.GwStanceBar
    if (not AB.IsBarActive or AB.IsBarActive("stance"))
        and stance and stance.buttons then
        for _, button in ipairs(stance.buttons) do
            Fader.HookButton(button)
        end
    end
    if not AB.IsBarActive or AB.IsBarActive("pet") then
        for i = 1, (NUM_PET_ACTION_SLOTS or 10) do
            Fader.HookButton(_G["PetActionButton" .. i])
        end
    end
    if (not AB.IsBarActive or AB.IsBarActive("mage"))
        and addonTable.PlusMageBar and addonTable.PlusMageBar.buttons then
        for _, button in ipairs(addonTable.PlusMageBar.buttons) do
            Fader.HookButton(button)
        end
    end
end
local function SetButtonBling(button, enabled)
    local cooldown = button and button.cooldown
    if cooldown and cooldown.SetDrawBling then
        cooldown:SetDrawBling(enabled)
    end
end
local function SetTargetBlings(target, enabled)
    local frame = _G[target.frame]
    if frame and frame.gw_Buttons then
        for i = 1, 12 do
            SetButtonBling(frame.gw_Buttons[i], enabled)
        end
    elseif target.key == "fadeStanceBar" and frame and frame.buttons then
        for _, button in ipairs(frame.buttons) do
            SetButtonBling(button, enabled)
        end
    elseif target.key == "fadePetBar" then
        for i = 1, (NUM_PET_ACTION_SLOTS or 10) do
            SetButtonBling(_G["PetActionButton" .. i], enabled)
        end
    elseif target.key == "fadeMageBar" and addonTable.PlusMageBar then
        for _, button in ipairs(addonTable.PlusMageBar.buttons or {}) do
            SetButtonBling(button, enabled)
        end
    end
end
UpdateBlingState = function(alpha)
    local enabled = alpha > 0.5
    for _, target in ipairs(TARGETS) do
        local frame = _G[target.frame]
        if IsTargetSelected(target) and frame and frame:GetParent() == fader then
            SetTargetBlings(target, enabled)
        end
    end
end
local CONDITION_EVENTS = {
    keepInCombat = {"PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED"},
}
function Fader.UpdateConditionEvents()
    if not fader then return end
    for key, events in pairs(CONDITION_EVENTS) do
        for _, event in ipairs(events) do
            if db.fadeEnable and db[key] then
                fader:RegisterEvent(event)
            else
                fader:UnregisterEvent(event)
            end
        end
    end
end
function Fader.UpdateTargets()
    if not fader then return end
    if AB.QueueOutOfCombat("faderTargets", Fader.UpdateTargets) then return end
    for _, target in ipairs(TARGETS) do
        if target.key == "fadePetBar" and Fader.IsTargetEligible(target) then
            local layout = addonTable.PlusActionBarLayout
            if layout and layout.EnsurePetBar then layout.EnsurePetBar() end
        end
        local frame = _G[target.frame]
        if frame then
            if not frame.gwPlusOrigParent then
                frame.gwPlusOrigParent = frame:GetParent() or UIParent
            end
            local wanted = Fader.IsTargetEligible(target) and fader or frame.gwPlusOrigParent
            if frame:GetParent() ~= wanted then
                if frame:GetParent() == fader then
                    SetTargetBlings(target, true)
                end
                frame:SetParent(wanted)
            end
        end
    end
    suspendedTargets = {}
    for _, target in ipairs(TARGETS) do
        if suspendedTargetSet[target] and Fader.IsTargetEligible(target) then
            suspendedTargets[#suspendedTargets + 1] = target
        else
            suspendedTargetSet[target] = nil
        end
    end
    HookBarButtons()
    UpdateBlingState(wantShown == false and db.fadeAlpha or 1)
end
function Fader.SuspendExtraTargets(limit)
    if not fader or not db or not db.fadeEnable then return 0 end
    if wantShown ~= false then return #suspendedTargets end
    if InCombatLockdown and InCombatLockdown() then return #suspendedTargets end
    local selectedCount = 0
    for _, target in ipairs(TARGETS) do
        local frame = _G[target.frame]
        if Fader.IsTargetEligible(target) and frame then
            selectedCount = selectedCount + 1
            if selectedCount > limit and frame:GetParent() == fader then
                SetTargetBlings(target, true)
                frame:SetParent(frame.gwPlusOrigParent or UIParent)
                suspendedTargetSet[target] = true
            end
        else
            suspendedTargetSet[target] = nil
        end
    end
    suspendedTargets = {}
    for _, target in ipairs(TARGETS) do
        if suspendedTargetSet[target] then
            suspendedTargets[#suspendedTargets + 1] = target
        end
    end
    return #suspendedTargets
end
function Fader.RestoreNextSuspendedTarget()
    if #suspendedTargets == 0 then return false end
    if AB.QueueOutOfCombat("faderEquipmentRestore", function()
        while Fader.RestoreNextSuspendedTarget() do end
    end) then
        return false
    end
    local target = table.remove(suspendedTargets, 1)
    suspendedTargetSet[target] = nil
    local frame = _G[target.frame]
    if frame then
        local wanted = Fader.IsTargetEligible(target) and fader
            or frame.gwPlusOrigParent or UIParent
        if frame:GetParent() ~= wanted then
            frame:SetParent(wanted)
        end
        if wanted == fader then
            SetTargetBlings(target, wantShown ~= false or db.fadeAlpha > 0.5)
        end
    end
    return #suspendedTargets > 0
end
function Fader.Refresh()
    if not fader then return end
    Fader.UpdateTargets()
    Fader.UpdateConditionEvents()
    if not db.fadeEnable then
        CancelDelay()
        fader.fade:Stop()
        fader:SetScript("OnUpdate", nil)
        fader:SetAlpha(1)
        wantShown = nil
        return
    end
    fader:SetScript("OnUpdate", Fader_OnUpdate)
    wantShown = nil
    EvaluateState()
end
function Fader.PrintDiagnostics()
    local Notice = GW.Notice or function(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end
    local format = string.format
    Notice("全局渐隐诊断：")
    if not addonTable.PlusActionBar then
        Notice("  |cffff5555ActionBar 模块表不存在（ActionBar.lua 没加载）|r")
        return
    end
    if not fader or not db then
        Notice(format("  |cffff5555渐隐父框体不存在 —— Fader.Init 没跑完（faderInitOk=%s）|r",
            tostring(AB.faderInitOk)))
        return
    end
    Notice(format("  开关=%s  当前alpha=%.2f  淡出目标=%.2f  延迟=%.1fs",
        tostring(db.fadeEnable), fader:GetAlpha(), db.fadeAlpha, db.fadeDelay))
    Notice(format("  轮询=%s  当前判定=%s  拖拽中=%s",
        fader:GetScript("OnUpdate") and "开" or "|cffcc6666关|r", tostring(wantShown), tostring(gridShown)))
    Notice(format("  该亮吗：战斗中保持显示=%s  鼠标在条上=%s",
        tostring(ShouldKeepShown()), tostring(IsMouseOverAnyBar())))
    for _, target in ipairs(TARGETS) do
        local frame = _G[target.frame]
        if not frame then
            Notice(format("  %s：|cff888888框体不存在|r", target.frame))
        else
            local effective = frame.GetEffectiveAlpha and frame:GetEffectiveAlpha() or -1
            Notice(format("  %s：勾选=%s 已接管=%s 显示=%s 自身alpha=%.2f 有效alpha=%.2f",
                target.frame,
                tostring(db[target.key]),
                (frame:GetParent() == fader) and "|cff66cc66是|r" or "|cffcc6666否|r",
                tostring(frame:IsShown()),
                frame:GetAlpha(),
                effective))
        end
    end
end
function Fader.Init()
    db = AB.InitDB()
    fader = CreateFrame("Frame", "GwPlusActionBarFader", UIParent)
    fader:SetAllPoints(UIParent)
    CreateFadeAnim(fader)
    fader:RegisterEvent("ACTIONBAR_SHOWGRID")
    fader:RegisterEvent("ACTIONBAR_HIDEGRID")
    fader:SetScript("OnEvent", Fader_OnEvent)
    local stance = _G.GwStanceBar
    if stance and stance.AdjustMaxStanceButtons then
        hooksecurefunc(stance, "AdjustMaxStanceButtons", HookBarButtons)
    end
    Fader.Refresh()
end
