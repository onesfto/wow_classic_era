-- GW2_UI_PLUS 法师动作条
--
-- 从 NDui_Plus（Modules/ActionBar/MageBar.lua）搬来的，五组法术各一个主按钮，
-- 鼠标悬停在主按钮上弹出同组其余等级/目的地。按钮外观改用本体的
-- GW.setActionButtonStyle，条本身用 GW.RegisterMovableFrame 注册，
-- 这样它就出现在 GW2_UI 的 HUD 编辑界面里，跟本体的框体一样拖着走。
--
-- 弹出条走的是暴雪的安全代码片段（SecureHandler + WrapScript），
-- 所以战斗中也能弹、能点——但按钮的创建和属性写入必须在战斗外。

local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local AB = addonTable.PlusActionBar
if not AB then return end

local MageBar = {}
addonTable.PlusMageBar = MageBar

local ipairs, tinsert, tremove, sort, wipe = ipairs, table.insert, table.remove, table.sort, wipe

--------------------------------------------------------------------------------
-- 一、法术表
--------------------------------------------------------------------------------

-- 原样保留 NDui_Plus 的表（含 TBC/WLK 的 ID）。经典旧世学不到的条目会被
-- IsSpellKnown 过滤掉，季节服（SoD）也走同一份表。
-- 每组里最后一个已学到的当主按钮，其余进弹出条。
local mageSpellData = {
    [1] = {
        key = "mageBarTeleport",
        spell = {3561, 3562, 3567, 3563, 3565, 3566, 32271, 32272, 49359, 49358, 33690, 35715},
    },
    [2] = {
        key = "mageBarPortal",
        spell = {10059, 11416, 11417, 11418, 11419, 11420, 32266, 32267, 49360, 49361, 33691, 35717},
    },
    [3] = {
        key = "mageBarFood",
        spell = {587, 597, 990, 6129, 10144, 10145, 28612, 33717},
    },
    [4] = {
        key = "mageBarWater",
        spell = {5504, 5505, 5506, 6127, 10138, 10139, 10140, 37420, 27090},
    },
    [5] = {
        key = "mageBarGem",
        spell = {759, 3552, 10053, 10054, 27101},
    },
}

local MARGIN = 2   -- 按钮间距
local PADDING = 2  -- 条边缘留白

local MOVER_SETTING = "MageBar_pos"
local MOVER_DEFAULT = {
    point = "BOTTOMRIGHT",
    relativePoint = "BOTTOMRIGHT",
    xOfs = -420,
    yOfs = 300,
    hasMoved = false,
}

--------------------------------------------------------------------------------
-- 二、客户端 API 兼容
--------------------------------------------------------------------------------

local function GetSpellTextureCompat(spellID)
    if C_Spell and C_Spell.GetSpellTexture then
        return C_Spell.GetSpellTexture(spellID)
    end
    return select(3, GetSpellInfo(spellID))
end

local function IsSpellKnownCompat(spellID)
    if C_SpellBook and C_SpellBook.IsSpellKnown and Enum and Enum.SpellBookSpellBank then
        return C_SpellBook.IsSpellKnown(spellID, Enum.SpellBookSpellBank.Player)
    end
    return IsSpellKnown(spellID)
end

local function GetSpellCountCompat(spellID)
    if C_Spell and C_Spell.GetSpellCastCount then
        return C_Spell.GetSpellCastCount(spellID)
    end
    return GetSpellCount(spellID)
end

local function GetSpellCooldownCompat(spellID)
    if C_Spell and C_Spell.GetSpellCooldown then
        local info = C_Spell.GetSpellCooldown(spellID)
        if info then
            return info.startTime, info.duration, info.isEnabled
        end
        return 0, 0, false
    end
    return GetSpellCooldown(spellID)
end

local function IsUsableSpellCompat(spellID)
    if C_Spell and C_Spell.IsSpellUsable then
        return C_Spell.IsSpellUsable(spellID)
    end
    return IsUsableSpell(spellID)
end

local function IsMouseOverButton(button)
    if GetMouseFoci then
        local foci = GetMouseFoci()
        return foci and foci[1] == button
    end
    return GetMouseFocus and GetMouseFocus() == button
end

--------------------------------------------------------------------------------
-- 三、状态
--------------------------------------------------------------------------------

local allButtons = {}   -- 所有按钮（主按钮 + 弹出按钮），供渐隐模块挂钩子
local mainButtons = {}  -- {button, index} 用于排序摆位
local numMainShown = 0

MageBar.buttons = allButtons

local db

local PopupHandler

--------------------------------------------------------------------------------
-- 四、按钮
--------------------------------------------------------------------------------

local function Button_UpdateCount(button)
    local count = GetSpellCountCompat(button.spellID)
    button.Count:SetText(count and count > 0 and count or "")
end

local function Button_UpdateUsable(button)
    local isUsable, notEnoughMana = IsUsableSpellCompat(button.spellID)
    if isUsable then
        button.icon:SetVertexColor(1, 1, 1)
    elseif notEnoughMana then
        button.icon:SetVertexColor(0.5, 0.5, 1)
    else
        button.icon:SetVertexColor(0.4, 0.4, 0.4)
    end
end

local function Button_UpdateCooldown(button)
    local start, duration, enabled = GetSpellCooldownCompat(button.spellID)
    if start and duration and start > 0 and duration > 0 then
        CooldownFrame_Set(button.cooldown, start, duration, enabled)
    else
        CooldownFrame_Set(button.cooldown, 0, 0, 0)
    end
    Button_UpdateCount(button)
end

-- 经典旧世要施放指定等级的法术，"spell" 属性必须写成「法术名(等级 X)」，
-- 光给 spellID 会施放最高等级。
--
-- 名字优先**同步**取：这些都是已经学会的法术，数据一定在客户端缓存里，
-- GetSpellInfo / GetSpellSubtext 直接就能拿到（本体 Classic 分支的
-- spellbook.lua:548 也是这么读 rank 的）。原来只走 Spell:ContinueOnSpellLoad
-- 的异步回调，回调万一没来，"spell" 属性就是空的——按钮看着正常，点了没反应。
local function GetSpellNameWithRank(spellID)
    local name
    if C_Spell and C_Spell.GetSpellName then
        name = C_Spell.GetSpellName(spellID)
    else
        name = GetSpellInfo(spellID)
    end
    if not name then return end

    local rank = GetSpellSubtext and GetSpellSubtext(spellID)
    if rank and rank ~= "" then
        name = name .. "(" .. rank .. ")"
    end

    return name
end

local function Button_ApplySpellAttribute(button, name)
    if InCombatLockdown() then
        AB.QueueOutOfCombat("mageBarAttr" .. button:GetName(), function()
            button:SetAttribute("type", "spell")
            button:SetAttribute("spell", name)
        end)
        return
    end
    button:SetAttribute("type", "spell")
    button:SetAttribute("spell", name)
end

local function Button_SetSpellAttribute(button, spellID)
    local name = GetSpellNameWithRank(spellID)
    if name then
        Button_ApplySpellAttribute(button, name)
        return
    end

    -- 同步拿不到（理论上不该发生）才退回异步等一次
    local spell = Spell:CreateFromSpellID(spellID)
    spell:ContinueOnSpellLoad(function()
        if button.spellID ~= spellID then return end -- 期间又被改成别的法术了

        local fallback = GetSpellNameWithRank(spellID) or spell:GetSpellName()
        if fallback then
            Button_ApplySpellAttribute(button, fallback)
        end
    end)
end

local function Button_UpdateSpell(button, spellID)
    button.spellID = spellID
    button.icon:SetTexture(GetSpellTextureCompat(spellID))

    -- type 和 spell 一起设（都在 Button_ApplySpellAttribute 里），
    -- 免得战斗中只设上一半
    Button_SetSpellAttribute(button, spellID)

    Button_UpdateCount(button)
    Button_UpdateUsable(button)
    Button_UpdateCooldown(button)
end

local function Button_UpdateSize(button)
    local size = db.mageBarSize
    if math.abs(button:GetWidth() - size) < 0.5 then return end

    button:SetSize(size, size)
    -- 按钮内部纹理是按当前宽度算的，尺寸变了要重跑样式
    GW.setActionButtonStyle(button:GetName(), false, false, true)
end

-- 主按钮上的小箭头，提示这里能展开
local function Button_UpdateFlyout(button)
    if not button.FlyoutArrow then return end

    -- 这一组只学到一个法术，没有可展开的东西
    if not button.hasPopup then
        button.FlyoutArrow:Hide()
        if button.FlyoutBorder then button.FlyoutBorder:Hide() end
        if button.FlyoutBorderShadow then button.FlyoutBorderShadow:Hide() end
        return
    end

    local distance = 2
    if IsMouseOverButton(button) then
        if button.FlyoutBorder then button.FlyoutBorder:Show() end
        if button.FlyoutBorderShadow then button.FlyoutBorderShadow:Show() end
        distance = 5
    else
        if button.FlyoutBorder then button.FlyoutBorder:Hide() end
        if button.FlyoutBorderShadow then button.FlyoutBorderShadow:Hide() end
    end

    button.FlyoutArrow:Show()
    button.FlyoutArrow:ClearAllPoints()
    if db.mageBarVertical then
        button.FlyoutArrow:SetPoint("LEFT", button, "LEFT", -distance, 0)
        SetClampedTextureRotation(button.FlyoutArrow, 270)
    else
        button.FlyoutArrow:SetPoint("TOP", button, "TOP", 0, distance)
        SetClampedTextureRotation(button.FlyoutArrow, 0)
    end
end

local function Button_OnEnter(self)
    GameTooltip_SetDefaultAnchor(GameTooltip, self)
    GameTooltip:SetSpellByID(self.spellID)
    GameTooltip:Show()
end

local function Button_OnLeave()
    GameTooltip:Hide()
end

local function CreateButton(name, parent, spellID)
    local button = CreateFrame("CheckButton", name, parent, "ActionButtonTemplate, SecureActionButtonTemplate")
    -- 经典旧世会按 ActionButtonUseKeyDown 决定安全动作在按下还是抬起触发。
    -- 两种都注册，安全模板会自行选择正确的那一种。
    button:RegisterForClicks("AnyUp", "AnyDown")
    button:SetHitRectInsets(-MARGIN / 2, -MARGIN / 2, -MARGIN / 2, -MARGIN / 2)
    button.showMacroName = false

    -- 本体的样式函数无条件访问 btn.CheckedTexture，模板不一定给了这个 parentKey
    if not button.CheckedTexture then
        button:SetCheckedTexture("Interface/AddOns/GW2_UI/textures/uistuff/ui-quickslot-depress.png")
        button.CheckedTexture = button:GetCheckedTexture()
    end

    button:SetSize(db.mageBarSize, db.mageBarSize)

    -- 先把「能用」的部分装好（法术属性、脚本），外观放到最后。
    -- 万一本体的样式函数在某个客户端上炸了，按钮至少还能点。
    Button_UpdateSpell(button, spellID)
    button:SetScript("OnEnter", Button_OnEnter)
    button:SetScript("OnLeave", Button_OnLeave)

    -- 第四个参数 isPet=true：跳过空槽透明度那段，法师条上的格子永远是满的
    GW.setActionButtonStyle(name, false, false, true)

    tinsert(allButtons, button)
    if addonTable.PlusFader then
        addonTable.PlusFader.HookButton(button)
    end

    return button
end

--------------------------------------------------------------------------------
-- 五、主按钮与它的弹出条
--------------------------------------------------------------------------------

local function SetupMainButton(info)
    local index = info.index
    local buttonName = "GwPlusMageBarButton" .. index
    local button = _G[buttonName]

    if not button then
        button = CreateButton(buttonName, MageBar.bar, info.mainSpell)
        button:HookScript("OnEnter", Button_UpdateFlyout)
        button:HookScript("OnLeave", Button_UpdateFlyout)
        button.popupButtons = {}
        tinsert(mainButtons, {button, index})
    else
        button:Show()
        Button_UpdateSpell(button, info.mainSpell)
    end

    button.hasPopup = #info.subSpell > 0
    Button_UpdateFlyout(button)

    local popupBar = button.popupBar
    if not popupBar then
        popupBar = CreateFrame("Frame", buttonName .. "PopupBar", button, "SecureHandlerBaseTemplate")
        popupBar:SetFrameStrata("DIALOG")
        popupBar:Raise()
        popupBar:Hide()

        PopupHandler:SetFrameRef("popupBar", popupBar)
        PopupHandler:SetFrameRef("mainButton", button)
        PopupHandler:Execute([=[
            BAR_MAP[PopupHandler:GetFrameRef("mainButton")] = PopupHandler:GetFrameRef("popupBar")
        ]=])
        -- 每句都得先判空。这些片段是**前置**处理，在安全环境里一报错，
        -- 后面原本的 OnClick（也就是施法那一步）会被一起中断——按钮看着正常，
        -- 点了完全没反应，还未必留下明显报错。
        PopupHandler:WrapScript(button, "OnEnter", [=[
            local bar = BAR_MAP[self]
            if bar then bar:Show() end
        ]=])
        PopupHandler:WrapScript(button, "OnLeave", [=[
            local bar = BAR_MAP[self]
            if bar then bar:Hide() end
        ]=])
        PopupHandler:WrapScript(button, "OnClick", [=[
            local bar = BAR_MAP[self]
            if bar then bar:Hide() end
        ]=])

        button.popupBar = popupBar
    end

    local vertical = db.mageBarVertical
    local prev

    for i, spellID in ipairs(info.subSpell) do
        local popupButton = button.popupButtons[i]
        if not popupButton then
            popupButton = CreateButton(buttonName .. "Popup" .. i, popupBar, spellID)

            PopupHandler:SetFrameRef("popupBar", popupBar)
            PopupHandler:SetFrameRef("popupButton", popupButton)
            PopupHandler:Execute([=[
                BAR_MAP[PopupHandler:GetFrameRef("popupButton")] = PopupHandler:GetFrameRef("popupBar")
            ]=])
            PopupHandler:WrapScript(popupButton, "OnClick", [=[
                local bar = BAR_MAP[self]
                if bar then bar:Hide() end
            ]=])
            -- 鼠标从主按钮挪到弹出条上时主按钮的 OnLeave 会把条藏掉，
            -- 这里再把它拉回来并交给自动隐藏
            PopupHandler:WrapScript(popupButton, "OnEnter", [=[
                local popupBar = BAR_MAP[self]
                if popupBar and not popupBar:IsVisible() then
                    popupBar:Show()
                    popupBar:UnregisterAutoHide()
                    popupBar:RegisterAutoHide(.25)
                    popupBar:AddToAutoHide(self)
                end
            ]=])

            button.popupButtons[i] = popupButton
        else
            popupButton:Show()
            Button_UpdateSpell(popupButton, spellID)
        end

        Button_UpdateSize(popupButton)
        popupButton:ClearAllPoints()
        if vertical then
            if prev then
                popupButton:SetPoint("RIGHT", prev, "LEFT", -MARGIN, 0)
            else
                popupButton:SetPoint("RIGHT", -MARGIN, 0)
            end
        else
            if prev then
                popupButton:SetPoint("BOTTOM", prev, "TOP", 0, MARGIN)
            else
                popupButton:SetPoint("BOTTOM", 0, MARGIN)
            end
        end
        prev = popupButton
    end

    -- 这一组学到的等级变少了（换了配置文件/重新计算），多出来的按钮藏掉
    for i = #info.subSpell + 1, #button.popupButtons do
        button.popupButtons[i]:Hide()
        button.popupButtons[i]:ClearAllPoints()
    end

    local size = db.mageBarSize
    local num = #info.subSpell
    local long, short = num * size + (num + 1) * MARGIN, size + 2 * MARGIN

    popupBar:ClearAllPoints()
    if vertical then
        popupBar:SetSize(long, short)
        popupBar:SetPoint("RIGHT", button, "LEFT")
    else
        popupBar:SetSize(short, long)
        popupBar:SetPoint("BOTTOM", button, "TOP")
    end
end

--------------------------------------------------------------------------------
-- 六、整条的重建与尺寸
--------------------------------------------------------------------------------

local spellList = {}

function MageBar.Update()
    if not MageBar.bar then return end
    -- 会新建按钮、写安全属性，战斗中一律推后
    if AB.QueueOutOfCombat("mageBarUpdate", MageBar.Update) then return end

    wipe(spellList)

    for _, value in ipairs(mainButtons) do
        value[1]:Hide()
        value[1]:ClearAllPoints()
    end

    for index, info in ipairs(mageSpellData) do
        if db[info.key] then
            local node = {index = index, subSpell = {}}
            for _, spellID in ipairs(info.spell) do
                if IsSpellKnownCompat(spellID) then
                    tinsert(node.subSpell, spellID)
                    node.mainSpell = spellID
                end
            end
            tinsert(spellList, node)
        end
    end

    for _, info in ipairs(spellList) do
        if info.mainSpell then
            tremove(info.subSpell) -- 最后一个已经摆在主按钮上了
            SetupMainButton(info)
        end
    end

    sort(mainButtons, function(a, b)
        if a and b then return a[2] < b[2] end
    end)

    local num, prev = 0, nil
    for _, value in ipairs(mainButtons) do
        local button = value[1]
        if button:IsShown() then
            button:ClearAllPoints()
            if not prev then
                button:SetPoint("TOPLEFT", PADDING, -PADDING)
            elseif db.mageBarVertical then
                button:SetPoint("TOP", prev, "BOTTOM", 0, -MARGIN)
            else
                button:SetPoint("LEFT", prev, "RIGHT", MARGIN, 0)
            end
            num = num + 1
            prev = button
        end
    end

    numMainShown = num
    MageBar.UpdateSize()
end

function MageBar.UpdateSize()
    local bar = MageBar.bar
    if not bar then return end

    for _, button in ipairs(allButtons) do
        Button_UpdateSize(button)
    end

    local size = db.mageBarSize
    local num = math.max(numMainShown, 1)
    local long, short = num * size + (num - 1) * MARGIN + 2 * PADDING, size + 2 * PADDING

    -- mover 的尺寸不用手动同步：RegisterMovableFrame 给 SetSize 挂了钩子
    if db.mageBarVertical then
        bar:SetSize(short, long)
    else
        bar:SetSize(long, short)
    end
end

local function Bar_UpdateCooldown()
    for _, button in ipairs(allButtons) do
        Button_UpdateCooldown(button)
    end
end

local lastUsableCheck = 0
local function Bar_UpdateUsable()
    local now = GetTime()
    if now - lastUsableCheck < 0.5 then return end
    lastUsableCheck = now

    for _, button in ipairs(allButtons) do
        Button_UpdateUsable(button)
    end
end

--------------------------------------------------------------------------------
-- 七、开关
--------------------------------------------------------------------------------

local eventFrame

function MageBar.Toggle()
    local bar = MageBar.bar
    if not bar then return end

    if db.mageBarEnable then
        MageBar.Update()
        eventFrame:RegisterEvent("LEARNED_SPELL_IN_TAB")
        eventFrame:RegisterEvent("SPELLS_CHANGED")
        eventFrame:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")
        eventFrame:RegisterEvent("BAG_UPDATE_DELAYED")
        eventFrame:RegisterEvent("SPELL_UPDATE_USABLE")
        bar:Show()
    else
        eventFrame:UnregisterAllEvents()
        bar:Hide()
    end

    -- 关掉之后编辑界面里也别再摆一个空 mover
    if GW.ToggleMover and bar.gwMover then
        GW.ToggleMover(bar.gwMover, db.mageBarEnable)
    end

    -- 藏起来的条不该再占着渐隐父框体
    if addonTable.PlusFader then
        addonTable.PlusFader.UpdateTargets()
    end
end

--------------------------------------------------------------------------------
-- 八、编辑界面（mover）
--------------------------------------------------------------------------------

-- 位置存在本体的存档里（RegisterMovableFrame 的硬性要求），
-- 默认值注入见 ActionBar.lua 的 AB.EnsureMoverSettings
local function EnsureMoverSettings()
    return AB.EnsureMoverSettings(MOVER_SETTING, MOVER_DEFAULT)
end

-- 切换本体的配置文件之后 GW.settings 换成了另一张表，mover 里存的还是旧引用，
-- 拖动会写进已经不生效的那张表。这里把默认值补进新表、把 mover 的引用换过去。
local function HookProfileChange()
    if not GW.globalSettings or not GW.globalSettings.RegisterCallback then return end

    GW.globalSettings.RegisterCallback(MageBar, "OnProfileChanged", function()
        if not EnsureMoverSettings() then return end

        local bar = MageBar.bar
        local mover = bar and bar.gwMover
        if not mover then return end

        mover.savedPoint = GW.settings[MOVER_SETTING]
        local point = mover.savedPoint
        mover:ClearAllPoints()
        mover:SetPoint(point.point, UIParent, point.relativePoint, point.xOfs, point.yOfs)
    end)
end

--------------------------------------------------------------------------------
-- 九、诊断（/gw2plus magebar）
--------------------------------------------------------------------------------

function MageBar.PrintDiagnostics()
    local Notice = GW.Notice or function(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end
    local format = string.format

    Notice("法师动作条诊断：")

    local _, class = UnitClass("player")
    if class ~= "MAGE" then
        Notice("  当前角色不是法师，这条不会创建")
        return
    end
    if not MageBar.bar then
        Notice(format("  |cffff5555条不存在 —— MageBar.Init 没跑完（mageBarInitOk=%s）|r",
            tostring(AB.mageBarInitOk)))
        return
    end

    Notice(format("  开关=%s  显示=%s  按钮尺寸=%d  竖向=%s  主按钮数=%d",
        tostring(db.mageBarEnable), tostring(MageBar.bar:IsShown()),
        db.mageBarSize, tostring(db.mageBarVertical), numMainShown))
    Notice(format("  按钮总数=%d（含弹出条）", #allButtons))

    for _, button in ipairs(allButtons) do
        if button:IsShown() then
            local spellName = GetSpellNameWithRank(button.spellID)
            Notice(format("  %s：type=%s spell=|cffffd200%s|r 图标=%s 可点=%s（应为 %s）",
                button:GetName(),
                tostring(button:GetAttribute("type")),
                tostring(button:GetAttribute("spell")),
                button.icon:GetTexture() and "有" or "|cffcc6666无|r",
                tostring(button:IsMouseEnabled()),
                tostring(spellName)))
        end
    end
end

--------------------------------------------------------------------------------
-- 十、初始化
--------------------------------------------------------------------------------

function MageBar.Init()
    db = AB.InitDB()

    local _, class = UnitClass("player")
    if class ~= "MAGE" then return end
    if not EnsureMoverSettings() then return end
    if not GW.setActionButtonStyle then return end

    PopupHandler = CreateFrame("Frame", "GwPlusMageBarHandler", UIParent, "SecureHandlerBaseTemplate")
    PopupHandler:Hide()
    PopupHandler:Execute([=[
        PopupHandler = self
        BAR_MAP = newtable()
    ]=])

    local bar = CreateFrame("Frame", "GwPlusMageBar", UIParent)
    MageBar.bar = bar

    GW.RegisterMovableFrame(bar, "法师动作条", MOVER_SETTING, BINDING_HEADER_ACTIONBAR, nil, {"default"})
    bar:ClearAllPoints()
    bar:SetPoint("TOPLEFT", bar.gwMover)
    -- 本体给 multibar 用的同一套保险：谁把条挪走都拉回 mover 上
    hooksecurefunc(bar, "SetPoint", function(_, _, anchor)
        if anchor ~= bar.gwMover then
            bar:ClearAllPoints()
            bar:SetPoint("TOPLEFT", bar.gwMover)
        end
    end)

    eventFrame = CreateFrame("Frame")
    eventFrame:SetScript("OnEvent", function(_, event)
        if event == "LEARNED_SPELL_IN_TAB" or event == "SPELLS_CHANGED" then
            MageBar.Update()
        elseif event == "SPELL_UPDATE_USABLE" then
            Bar_UpdateUsable()
        else
            Bar_UpdateCooldown()
        end
    end)

    HookProfileChange()
    MageBar.Toggle()
end
