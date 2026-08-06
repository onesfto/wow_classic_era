local _, addonTable = ...
local GW = _G.GW2_ADDON
if not GW then return end
local AB = addonTable.PlusActionBar
if not AB then return end
local MageBar = {}
addonTable.PlusMageBar = MageBar
local ipairs, tinsert, tremove, sort, wipe = ipairs, table.insert, table.remove, table.sort, wipe
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
local MARGIN = 2
local PADDING = 2
local MOVER_SETTING = "MageBar_pos"
local MOVER_DEFAULT = {
    point = "BOTTOMRIGHT",
    relativePoint = "BOTTOMRIGHT",
    xOfs = -300,
    yOfs = 0,
    hasMoved = false,
}
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
local allButtons = {}
local mainButtons = {}
local numMainShown = 0
MageBar.buttons = allButtons
local db
local PopupHandler
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
    local spell = Spell:CreateFromSpellID(spellID)
    spell:ContinueOnSpellLoad(function()
        if button.spellID ~= spellID then return end
        local fallback = GetSpellNameWithRank(spellID) or spell:GetSpellName()
        if fallback then
            Button_ApplySpellAttribute(button, fallback)
        end
    end)
end
local function Button_UpdateSpell(button, spellID)
    button.spellID = spellID
    button.icon:SetTexture(GetSpellTextureCompat(spellID))
    Button_SetSpellAttribute(button, spellID)
    Button_UpdateCount(button)
    Button_UpdateUsable(button)
    Button_UpdateCooldown(button)
end
local function Button_UpdateSize(button)
    local size = db.mageBarSize
    if math.abs(button:GetWidth() - size) < 0.5 then return end
    button:SetSize(size, size)
    GW.setActionButtonStyle(button:GetName(), false, false, true)
end
local function Button_UpdateFlyout(button)
    if not button.FlyoutArrow then return end
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
    button:RegisterForClicks("AnyUp", "AnyDown")
    button:SetHitRectInsets(-MARGIN / 2, -MARGIN / 2, -MARGIN / 2, -MARGIN / 2)
    button.showMacroName = false
    if not button.CheckedTexture then
        button:SetCheckedTexture("Interface/AddOns/GW2_UI/textures/uistuff/ui-quickslot-depress.png")
        button.CheckedTexture = button:GetCheckedTexture()
    end
    button:SetSize(db.mageBarSize, db.mageBarSize)
    Button_UpdateSpell(button, spellID)
    button:SetScript("OnEnter", Button_OnEnter)
    button:SetScript("OnLeave", Button_OnLeave)
    GW.setActionButtonStyle(name, false, false, true)
    tinsert(allButtons, button)
    if addonTable.PlusFader then
        addonTable.PlusFader.HookButton(button)
    end
    return button
end
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
        popupBar:EnableMouse(true)
        popupBar:SetFrameStrata("DIALOG")
        popupBar:Raise()
        popupBar:Hide()
        PopupHandler:SetFrameRef("popupBar", popupBar)
        PopupHandler:SetFrameRef("mainButton", button)
        PopupHandler:Execute([=[
            BAR_MAP[PopupHandler:GetFrameRef("mainButton")] = PopupHandler:GetFrameRef("popupBar")
        ]=])
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
local spellList = {}
function MageBar.Update()
    if not MageBar.bar then return end
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
            tremove(info.subSpell)
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
local eventFrame
function MageBar.Toggle()
    local bar = MageBar.bar
    if not bar then return end
    if db.mageBarEnable then
        MageBar.Update()
        -- eventFrame:RegisterEvent("LEARNED_SPELL_IN_TAB") -- 经典版不存在此事件
        eventFrame:RegisterEvent("SPELLS_CHANGED")
        eventFrame:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")
        eventFrame:RegisterEvent("BAG_UPDATE_DELAYED")
        eventFrame:RegisterEvent("SPELL_UPDATE_USABLE")
        bar:Show()
    else
        eventFrame:UnregisterAllEvents()
        bar:Hide()
    end
    if GW.ToggleMover and bar.gwMover then
        GW.ToggleMover(bar.gwMover, db.mageBarEnable)
    end
    if addonTable.PlusFader then
        addonTable.PlusFader.UpdateTargets()
    end
end
local function EnsureMoverSettings()
    return AB.EnsureMoverSettings(MOVER_SETTING, MOVER_DEFAULT)
end
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
    AB.RegisterMovableFrame(
        bar, "法师动作条", MOVER_SETTING, BINDING_HEADER_ACTIONBAR,
        nil, {"default"}, nil, nil, nil, MOVER_DEFAULT)
    bar:ClearAllPoints()
    bar:SetPoint("TOPLEFT", bar.gwMover)
    hooksecurefunc(bar, "SetPoint", function(_, _, anchor)
        if anchor ~= bar.gwMover then
            bar:ClearAllPoints()
            bar:SetPoint("TOPLEFT", bar.gwMover)
        end
    end)
    eventFrame = CreateFrame("Frame")
    eventFrame:SetScript("OnEvent", function(_, event)
        if event == "SPELLS_CHANGED" then
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
