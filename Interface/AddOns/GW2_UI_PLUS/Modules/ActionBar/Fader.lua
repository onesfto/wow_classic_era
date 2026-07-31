-- GW2_UI_PLUS 动作条全局渐隐
--
-- 抄 NDui_Plus（Modules/ActionBar/Fader.lua）的思路：建一个渐隐父框体，把要一起
-- 变淡的动作条挂到它下面，改的是父框体的 alpha。
--
-- 为什么不直接 SetAlpha 各个条：本体自己有一套渐隐（actionbars.lua 的 fadeCheck
-- 每 0.1 秒跑一次，对应设置面板里每条那个「显示」下拉），它读的是框体**自身**的
-- alpha，看到小于 1 就会立刻拉回 1。改父框体的 alpha 它看不见，两边的 alpha 相乘，
-- 于是「一直显示 / 战斗中 / 仅鼠标悬停」和全局渐隐可以同时用、互不打架。
--
-- 亮/暗状态是 0.1 秒轮询算出来的，不靠按钮的 OnEnter/OnLeave —— 那两个钩子不可靠：
-- 设置窗口这种全屏框体会盖住动作条，鼠标压根进不了按钮，OnLeave 也就永远不来，
-- 条会一直亮着。本体的 fadeCheck 同样是轮询，节奏也是 0.1 秒。

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
local petHolder
local delayTimer
local gridShown = false     -- 正在往动作条上拖技能
local wantShown             -- 当前想要的状态；只在翻转时才动画，nil 表示还没算过
local updateElapsed = 0
local UpdateBlingState
local suspendedTargets = {}
local suspendedTargetSet = {}

--------------------------------------------------------------------------------
-- 一、参与渐隐的框体
--------------------------------------------------------------------------------

-- 游戏里的动作条 1 是本体复用的暴雪 MainActionBar，2-8 是本体自建的 GwMultiBarXXX
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

--------------------------------------------------------------------------------
-- 二、淡入淡出
--------------------------------------------------------------------------------

-- 用动画组而不是 UIFrameFadeIn/Out：后者收尾时会 Show 框体、各客户端行为还有出入，
-- 本体的渐隐用的也是动画组
local function CreateFadeAnim(frame)
    frame.fade = frame:CreateAnimationGroup()
    frame.fade:SetLooping("NONE")
    frame.fade.anim = frame.fade:CreateAnimation("Alpha")
    frame.fade:SetScript("OnFinished", function(self)
        -- 动画结束后 alpha 会退回播放前的值，得自己定住
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

--------------------------------------------------------------------------------
-- 三、状态机
--------------------------------------------------------------------------------

local function ShouldKeepShown()
    if db.keepInCombat and UnitAffectingCombat("player") then return true end
    return false
end

-- 渐隐父框体和 UIParent 一样大，问它自己没意义，只能挨个问参与的条
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

-- 只在状态翻转时才动画，所以每 0.1 秒调一次也很便宜
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

-- 鼠标进出按钮时立刻重算一次，比等下一个轮询更跟手。
-- 只是加速，不是唯一入口——轮询才是权威。
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
    -- 动作条 1-8
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

    -- 姿态条的按钮是按当前形态数按需创建的
    local stance = _G.GwStanceBar
    if (not AB.IsBarActive or AB.IsBarActive("stance"))
        and stance and stance.buttons then
        for _, button in ipairs(stance.buttons) do
            Fader.HookButton(button)
        end
    end

    -- 宠物动作条
    if not AB.IsBarActive or AB.IsBarActive("pet") then
        for i = 1, (NUM_PET_ACTION_SLOTS or 10) do
            Fader.HookButton(_G["PetActionButton" .. i])
        end
    end

    -- 法师动作条
    if (not AB.IsBarActive or AB.IsBarActive("mage"))
        and addonTable.PlusMageBar and addonTable.PlusMageBar.buttons then
        for _, button in ipairs(addonTable.PlusMageBar.buttons) do
            Fader.HookButton(button)
        end
    end
end

--------------------------------------------------------------------------------
-- 四、低透明度时关闭冷却完成闪光
--------------------------------------------------------------------------------

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

-- NDui_Plus 和 ElvUI 都在全局渐隐较深时关掉冷却完成闪光，避免大量半透明
-- 动作按钮继续渲染星芒层。这里只影响 Bling，不影响冷却转圈和倒计时。
UpdateBlingState = function(alpha)
    local enabled = alpha > 0.5

    for _, target in ipairs(TARGETS) do
        local frame = _G[target.frame]
        if IsTargetSelected(target) and frame and frame:GetParent() == fader then
            SetTargetBlings(target, enabled)
        end
    end
end

--------------------------------------------------------------------------------
-- 五、宠物动作条
--------------------------------------------------------------------------------

-- 本体把宠物动作按钮直接挂在宠物**单位框体**上（petbar.lua 的
-- SetActionButtonPositionAndStyle 里 button:SetParent(self)），照原样挂到渐隐父
-- 框体上会连宠物血条一起变淡。所以中间加一层容器，只让按钮跟着渐隐。
-- 按钮的锚点锚在宠物框体和彼此身上，换父级不影响摆位。
local function ReparentPetButtons()
    if not petHolder then return end
    if AB.QueueOutOfCombat("petReparent", ReparentPetButtons) then return end

    for i = 1, (NUM_PET_ACTION_SLOTS or 10) do
        local button = _G["PetActionButton" .. i]
        if button and button:GetParent() ~= petHolder then
            button:SetParent(petHolder)
        end
    end
end

local function EnsurePetHolder()
    if petHolder then return petHolder end

    local petFrame = _G.GwPlayerPetFrame
    if not petFrame then return end

    petHolder = CreateFrame("Frame", "GwPlusPetBarHolder", petFrame)
    petHolder:SetAllPoints(petFrame)
    -- 显式设过层级就不再随父级变，换到渐隐父框体下也不会被血条盖住
    petHolder:SetFrameStrata(petFrame:GetFrameStrata())
    petHolder:SetFrameLevel(petFrame:GetFrameLevel() + 4)
    petHolder.gwPlusOrigParent = petFrame

    -- 本体每次重排宠物按钮都会把它们抢回宠物框体，跑完之后再拿回来
    if petFrame.SetActionButtonPositionAndStyle then
        hooksecurefunc(petFrame, "SetActionButtonPositionAndStyle", ReparentPetButtons)
    end

    ReparentPetButtons()
    return petHolder
end

--------------------------------------------------------------------------------
-- 六、保持全亮的条件所需的事件
--------------------------------------------------------------------------------

local CONDITION_EVENTS = {
    keepInCombat = {"PLAYER_REGEN_ENABLED", "PLAYER_REGEN_DISABLED"},
}

-- 轮询本来就能发现这些状态变化，注册事件只是让反应更即时
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

--------------------------------------------------------------------------------
-- 七、接管与交还
--------------------------------------------------------------------------------

function Fader.UpdateTargets()
    if not fader then return end
    if AB.QueueOutOfCombat("faderTargets", Fader.UpdateTargets) then return end

    for _, target in ipairs(TARGETS) do
        -- 宠物容器要用到才建，不然就别去动暴雪的宠物按钮
        if target.key == "fadePetBar" and Fader.IsTargetEligible(target) then
            EnsurePetHolder()
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

-- 换装集中刷新动作按钮时，只让前三个参与目标继续处于半透明父级。其余目标
-- 暂时回到原父级（完全不透明），等事件批次结束后再逐个接回来。
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

--------------------------------------------------------------------------------
-- 八、外部入口
--------------------------------------------------------------------------------

-- 设置面板里改了任何一项都调这个
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
    wantShown = nil -- 强制重算一次，好让改过的透明度立刻应用
    EvaluateState()
end

--------------------------------------------------------------------------------
-- 九、诊断（/gw2plus fader）
--------------------------------------------------------------------------------

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
    Notice(format("  该亮吗：保持全亮条件=%s  鼠标在条上=%s",
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

--------------------------------------------------------------------------------
-- 十、初始化
--------------------------------------------------------------------------------

function Fader.Init()
    db = AB.InitDB()

    fader = CreateFrame("Frame", "GwPlusActionBarFader", UIParent)
    -- 和 UIParent 完全重合：主动作条是暴雪的框体，万一它的锚点是相对父级的，
    -- 换父级之后位置也不会跳。它不吃鼠标
    fader:SetAllPoints(UIParent)
    -- 不显式设层级：子框体里没自己设过的（姿态条、宠物容器）继承下来的
    -- 层级和原来挂在 UIParent 上时一致
    CreateFadeAnim(fader)

    fader:RegisterEvent("ACTIONBAR_SHOWGRID")
    fader:RegisterEvent("ACTIONBAR_HIDEGRID")
    fader:SetScript("OnEvent", Fader_OnEvent)

    -- 姿态条按形态数动态加按钮，加完了补挂钩子
    local stance = _G.GwStanceBar
    if stance and stance.AdjustMaxStanceButtons then
        hooksecurefunc(stance, "AdjustMaxStanceButtons", HookBarButtons)
    end

    Fader.Refresh()
end
