local GW = _G.GW2_ADDON
if not GW then return end
local  raidInit = false
local RAID_PULLOUT_WIDTH_SCALE = 1.5
local GW_HEALTHBAR_TEXTURE = "Interface/AddOns/GW2_UI/textures/bartextures/statusbar.png"
local GW_STATUSBAR_TEXTURE = "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar.png"
local StripAllTextures = {
    "RaidGroup1",
    "RaidGroup2",
    "RaidGroup3",
    "RaidGroup4",
    "RaidGroup5",
    "RaidGroup6",
    "RaidGroup7",
    "RaidGroup8",
}
local function SkinRaidClassButtons()
    for i = 1, 15 do
        local button = _G["RaidClassButton" .. i]
        local icon = _G["RaidClassButton" .. i .. "IconTexture"]
        if button and icon then
            for _, region in ipairs({button:GetRegions()}) do
                if region ~= icon and region:IsObjectType("Texture") then
                    region:SetTexture(nil)
                end
            end
            button:SetSize(24, 24)
            button:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder, true)
            icon:ClearAllPoints()
            icon:SetPoint("CENTER", button, "CENTER", 0, 0)
            icon:SetSize(18, 18)
            local coords = button.fileName and CLASS_ICON_TCOORDS and CLASS_ICON_TCOORDS[button.fileName]
            if coords then
                icon:SetTexture("Interface\\WorldStateFrame\\Icons-Classes")
                icon:SetTexCoord(coords[1] + 0.02, coords[2] - 0.02, coords[3] + 0.02, coords[4] - 0.02)
            else
                icon:SetTexCoord(0.12, 0.88, 0.12, 0.88)
            end
            button:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square", "ADD")
            local highlight = button:GetHighlightTexture()
            if highlight then
                highlight:ClearAllPoints()
                highlight:SetAllPoints(icon)
            end
            if not button:GetScript("OnDragStart") then
                button:SetScript("OnDragStart", function(self)
                    if self.fileName and self.class then
                        RaidPulloutButton_OnDragStart(RaidPullout_GeneratePulloutFrame(self.fileName, self.class))
                    end
                end)
            end
        end
    end
end
local function SkinRaidPulloutMember(button)
    if not button then return end
    local buttonName = button:GetName()
    local healthBar = button.healthbar or _G[buttonName .. "HealthBar"]
    local manaBar = button.manabar or _G[buttonName .. "ManaBar"]
    local nameText = button.nameLabel or _G[buttonName .. "Name"]
    if not healthBar or not manaBar or not nameText then return end
    if not button.gwPlusSkinned then
        button.gwPlusSkinned = true
        healthBar:GwStripTextures()
        manaBar:GwStripTextures()
        button:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder, true)
        healthBar.lockColor = true
        manaBar.lockColor = true
        healthBar:HookScript("OnValueChanged", function(self)
            self:SetStatusBarColor(GW.Colors.UnitFrameReactionColors.Friendly:GetRGB())
        end)
        manaBar:HookScript("OnValueChanged", function(self)
            local color = GW.Colors.PowerBarCustomColors.MANA
            self:SetStatusBarColor(color.r, color.g, color.b)
        end)
    end
    button:SetWidth(button:GetParent():GetWidth() - 10)
    healthBar:ClearAllPoints()
    healthBar:SetPoint("TOP", button, "TOP", 0, 0)
    healthBar:SetPoint("LEFT", button, "LEFT", 0, 0)
    healthBar:SetPoint("RIGHT", button, "RIGHT", 0, 0)
    healthBar:SetHeight(17)
    healthBar:SetStatusBarTexture(GW_HEALTHBAR_TEXTURE)
    healthBar:SetStatusBarColor(GW.Colors.UnitFrameReactionColors.Friendly:GetRGB())
    manaBar:ClearAllPoints()
    manaBar:SetPoint("TOP", healthBar, "BOTTOM", 0, -1)
    manaBar:SetPoint("LEFT", button, "LEFT", 0, 0)
    manaBar:SetPoint("RIGHT", button, "RIGHT", 0, 0)
    manaBar:SetHeight(5)
    manaBar:SetStatusBarTexture(GW_STATUSBAR_TEXTURE)
    local manaColor = GW.Colors.PowerBarCustomColors.MANA
    manaBar:SetStatusBarColor(manaColor.r, manaColor.g, manaColor.b)
    nameText:ClearAllPoints()
    nameText:SetPoint("CENTER", healthBar, "CENTER", 0, 0)
    nameText:SetSize(button:GetWidth() - 4, 17)
    nameText:SetJustifyH("CENTER")
    nameText:SetDrawLayer("OVERLAY", 7)
end
local function SkinRaidPulloutFrame(pullout)
    if not pullout then return end
    local menuBackdrop = _G[pullout:GetName() .. "MenuBackdrop"]
    if not pullout.gwPlusSkinned then
        pullout.gwPlusSkinned = true
        pullout.gwOriginalWidth = pullout:GetWidth()
        pullout:GwStripTextures()
        pullout:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder, true)
        if menuBackdrop then
            menuBackdrop:HookScript("OnShow", function()
                if pullout.backdrop then pullout.backdrop:Show() end
            end)
            menuBackdrop:HookScript("OnHide", function()
                if pullout.backdrop then pullout.backdrop:Hide() end
            end)
        end
    end
    if menuBackdrop then
        menuBackdrop:SetAlpha(0)
    end
    if pullout.backdrop then
        pullout.backdrop:SetShown(not menuBackdrop or menuBackdrop:IsShown())
    end
    pullout:SetWidth(pullout.gwOriginalWidth * RAID_PULLOUT_WIDTH_SCALE)
    if pullout.label then
        pullout.label:ClearAllPoints()
        pullout.label:SetPoint("TOP", pullout, "TOP", 0, -2)
        pullout.label:SetFontObject("GameFontNormal")
    end
    local firstButton = pullout.buttons and pullout.buttons[1]
    if firstButton then
        firstButton:ClearAllPoints()
        firstButton:SetPoint("TOP", pullout, "TOP", 0, -24)
    end
    local visibleButtons = 0
    for i = 1, (pullout.numPulloutButtons or 0) do
        local button = pullout.buttons[i]
        SkinRaidPulloutMember(button)
        if button:IsShown() then
            visibleButtons = visibleButtons + 1
        end
    end
    if visibleButtons > 0 then
        local buttonHeight = pullout.showTarget and 48 or 33
        pullout:SetHeight((visibleButtons * buttonHeight) + 27)
    end
end
local function LoadRaidFrame()
    if raidInit then return end
    if InCombatLockdown() then
        GW.CombatQueue:Queue(nil,  LoadRaidFrame)
        return
    end
    raidInit = true
    for _, object in pairs(StripAllTextures) do
        local obj = _G[object]
        if obj then
            obj:SetSize(230, 120)
            obj:GwStripTextures()
            local label = _G[object .. "Label"]
            if label then
                label:SetNormalFontObject("GameFontNormal")
                label:SetHighlightFontObject("GameFontHighlight")
            end
            for j = 1, 5 do
                local slot = _G[object .. "Slot" .. j]
                if slot then
                    slot:GwStripTextures()
                    slot:SetSize(220, 22)
                    slot:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder, true)
                end
            end
        end
    end
    if RaidGroup1 then
        RaidGroup1:ClearAllPoints()
        RaidGroup1:SetPoint("TOPLEFT", RaidFrame, "TOPLEFT", 3, -83)
    end
    for i = 1, (_G.MAX_RAID_GROUPS or 0) * 5 do
        local button = _G["RaidGroupButton" .. i]
        local name = _G["RaidGroupButton" .. i .. "Name"]
        local level = _G["RaidGroupButton" .. i .. "Level"]
        local class = _G["RaidGroupButton" .. i .. "Class"]
        if button then
            button:SetSize(220, 22)
            button:GwSkinButton(false, true, true)
            button:GwStripTextures()
            button:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder, true)
        end
        if name then
            name:SetFont(UNIT_NAME_FONT, 10)
            name:SetSize(60, 19)
        end
        if level then
            level:SetFont(UNIT_NAME_FONT, 10)
            level:SetSize(37, 19)
        end
        if class then
            if class.SetFont then
                class:SetFont(UNIT_NAME_FONT, 10)
            elseif class.text then
                class.text:SetFont(UNIT_NAME_FONT, 10)
            end
            class:SetSize(80, 19)
        end
    end
    hooksecurefunc("RaidGroupFrame_Update", function()
        for i = 1, (MAX_RAID_GROUPS or 0) * 5 do
            local _, rank, _, _, _, _, _, _, _, role = GetRaidRosterInfo(i)
            local rankTexture = _G["RaidGroupButton" .. i .. "RankTexture"]
            local roleTexture = _G["RaidGroupButton" .. i .. "RoleTexture"]
            if rankTexture then
                if rank == 2 then
                    rankTexture:SetTexture("Interface/AddOns/GW2_UI/textures/party/icon-groupleader.png")
                elseif rank == 1 then
                    rankTexture:SetTexture("Interface/AddOns/GW2_UI/textures/party/icon-assist.png")
                else
                    rankTexture:SetTexture("")
                end
            end
            if roleTexture then
                if role == "MAINTANK" then
                    roleTexture:SetTexture("Interface/AddOns/GW2_UI/textures/party/icon-maintank.png")
                elseif role == "MAINASSIST" then
                    roleTexture:SetTexture("Interface/AddOns/GW2_UI/textures/party/icon-mainassist.png")
                else
                    roleTexture:SetTexture("")
                end
            end
        end
    end)
    hooksecurefunc("RaidPullout_GetFrame", function()
        for i = 1, (_G.NUM_RAID_PULLOUT_FRAMES or 0) do
            SkinRaidPulloutFrame(_G["RaidPullout" .. i])
        end
    end)
    hooksecurefunc("RaidPullout_Update", SkinRaidPulloutFrame)
    for i = 1, (_G.NUM_RAID_PULLOUT_FRAMES or 0) do
        SkinRaidPulloutFrame(_G["RaidPullout" .. i])
    end
    SkinRaidClassButtons()
end
local function UpdateRaidInfoScrollBarVisibility(scrollFrame, _, verticalRange)
    local scrollBar = RaidInfoScrollFrameScrollBar
    if not scrollFrame or not scrollBar then return end
    verticalRange = verticalRange or scrollFrame:GetVerticalScrollRange() or 0
    if verticalRange > 0 then
        scrollBar:Show()
    else
        scrollBar:Hide()
    end
end
local function SkinClassicRaidInfoFrame()
    if not (GW.Classic or GW.TBC or GW.Wrath) then return end
    if not RaidInfoFrame or RaidInfoFrame.gwPlusSkinned then return end
    RaidInfoFrame.gwPlusSkinned = true
    RaidInfoFrame:GwStripTextures()
    RaidInfoFrame:GwCreateBackdrop(GW.BackdropTemplates.Default)
    for _, frame in pairs({RaidInfoInstanceLabel, RaidInfoIDLabel}) do
        if frame and frame.GwStripTextures then
            frame:GwStripTextures()
        end
    end
    if RaidInfoFrame.ScrollBox and RaidInfoFrame.ScrollBar then
        RaidInfoFrame.ScrollBox:GwStripTextures()
        GW.HandleScrollControls(RaidInfoFrame)
        GW.HandleTrimScrollBar(RaidInfoFrame.ScrollBar)
        RaidInfoFrame.ScrollBar:SetHideIfUnscrollable(true)
    elseif RaidInfoScrollFrame then
        RaidInfoScrollFrame:GwStripTextures()
        RaidInfoScrollFrame:GwSkinScrollFrame()
        RaidInfoScrollFrame:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder, true)
        if RaidInfoScrollFrameScrollBar then
            RaidInfoScrollFrameScrollBar:GwSkinScrollBar()
            for _, texture in pairs({
                RaidInfoScrollFrameScrollBarBG,
                RaidInfoScrollFrameScrollBarTop,
                RaidInfoScrollFrameScrollBarBottom,
                RaidInfoScrollFrameScrollBarMiddle,
            }) do
                texture:Hide()
                texture:SetTexture(nil)
            end
            local track = RaidInfoScrollFrameScrollBar:CreateTexture(nil, "BACKGROUND")
            track:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/scrollbg.png")
            track:SetWidth(3)
            track:SetPoint("TOP", RaidInfoScrollFrameScrollBar, "TOP", 0, -12)
            track:SetPoint("BOTTOM", RaidInfoScrollFrameScrollBar, "BOTTOM", 0, 12)
            RaidInfoScrollFrame:HookScript("OnScrollRangeChanged", UpdateRaidInfoScrollBarVisibility)
            RaidInfoFrame:HookScript("OnShow", function()
                UpdateRaidInfoScrollBarVisibility(RaidInfoScrollFrame)
            end)
            UpdateRaidInfoScrollBarVisibility(RaidInfoScrollFrame)
        end
    end
    if RaidInfoCloseButton then
        RaidInfoCloseButton:GwSkinButton(true, false)
    end
    for _, button in pairs({RaidInfoExtendButton, RaidInfoCancelButton}) do
        if button then
            button:GwSkinButton(false, true)
        end
    end
end
function GW.SkinRaidList()
    if RaidFrameNotInRaid and RaidFrameNotInRaid.ScrollingDescription then
        RaidFrameNotInRaid.ScrollingDescription:ClearAllPoints()
        RaidFrameNotInRaid.ScrollingDescription:SetPoint("TOPLEFT", RaidFrameNotInRaid, "TOPLEFT", 0, -73)
        RaidFrameNotInRaid.ScrollingDescription:SetPoint("BOTTOMRIGHT", RaidFrameNotInRaid, "BOTTOMRIGHT", 0, 0)
        if RaidFrameNotInRaid.ScrollingDescription.ScrollBox and RaidFrameNotInRaid.ScrollingDescription.ScrollBox.FontStringContainer then
            local fontString = RaidFrameNotInRaid.ScrollingDescription.ScrollBox.FontStringContainer.FontString
            if fontString then
                fontString:SetJustifyH("CENTER")
                fontString:SetJustifyV("TOP")
                fontString:SetTextColor(1, 1, 1)
            end
        end
    end
    if RaidFrameAllAssistCheckButton then
        RaidFrameAllAssistCheckButton:ClearAllPoints()
        RaidFrameAllAssistCheckButton:SetPoint("TOPLEFT", 10, -33)
        if RaidFrameAllAssistCheckButton.text then
            RaidFrameAllAssistCheckButton.text:ClearAllPoints()
            RaidFrameAllAssistCheckButton.text:SetPoint("LEFT", RaidFrameAllAssistCheckButton, "RIGHT", 5, -2)
            RaidFrameAllAssistCheckButton.text:SetText(ALL .. " |TInterface/AddOns/GW2_UI/textures/party/icon-assist.png:25:25:0:-3|t")
        end
    end
    if RaidFrame and RaidFrame.RoleCount then
        RaidFrame.RoleCount:ClearAllPoints()
        RaidFrame.RoleCount:SetPoint("TOP", -80, -33)
        if RaidFrame.RoleCount.TankIcon then
            RaidFrame.RoleCount.TankIcon:SetTexture("Interface/AddOns/GW2_UI/textures/party/roleicon-tank.png")
        end
        if RaidFrame.RoleCount.HealerIcon then
            RaidFrame.RoleCount.HealerIcon:SetTexture("Interface/AddOns/GW2_UI/textures/party/roleicon-healer.png")
        end
        if RaidFrame.RoleCount.DamagerIcon then
            RaidFrame.RoleCount.DamagerIcon:SetTexture("Interface/AddOns/GW2_UI/textures/party/roleicon-dps.png")
            RaidFrame.RoleCount.DamagerIcon:SetSize(20, 20)
        end
    end
    if RaidFrameAllAssistCheckButton then
        RaidFrameAllAssistCheckButton:GwSkinCheckButton()
        RaidFrameAllAssistCheckButton:SetSize(18, 18)
    end
    if RaidFrameReadyCheckButton then
        RaidFrameReadyCheckButton:GwSkinButton(false, true)
    end
    if RaidFrameConvertToRaidButton then
        RaidFrameConvertToRaidButton:GwSkinButton(false, true)
    end
    if RaidFrameRaidInfoButton then
        RaidFrameRaidInfoButton:GwSkinButton(false, true)
        RaidFrameRaidInfoButton:SetPoint("TOPRIGHT", -7, -33)
    end
    SkinClassicRaidInfoFrame()
    if GW.settings.USE_CHARACTER_WINDOW and (GW.Retail or GW.Mists) and RaidFrameRaidInfoButton then
        RaidFrameRaidInfoButton:SetScript("OnClick", function()
            if InCombatLockdown() then return end
            if GwCharacterCurrencyRaidInfoFrame.RaidLocks:IsVisible() then
                GwCharacterWindow:SetAttribute("windowpanelopen", "nil")
                return
            end
            GwCharacterWindow:SetAttribute("windowpanelopen", "currency")
            GWCurrencyMenu.items.raidinfo:Click()
        end)
    end
    if _G.RaidFrame_LoadUI and RaidFrame and not RaidFrame.gwRaidFrameHooked then
        hooksecurefunc("RaidFrame_LoadUI", LoadRaidFrame)
        RaidFrame.gwRaidFrameHooked = true
    end
    if RaidClassButton1 then
        LoadRaidFrame()
    end
end
