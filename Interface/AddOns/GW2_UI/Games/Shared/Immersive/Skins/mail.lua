---@class GW2
local GW = select(2, ...)

-- get local references
local MailFrame = _G.MailFrame
local InboxFrame = _G.InboxFrame
local SendMailFrame = _G.SendMailFrame
local OpenMailFrame = _G.OpenMailFrame

local function RefreshMailFrameReferences()
    MailFrame = _G.MailFrame
    InboxFrame = _G.InboxFrame
    SendMailFrame = _G.SendMailFrame
    OpenMailFrame = _G.OpenMailFrame
end

local function HideRegion(region)
    if region and region.Hide then
        region:Hide()
    end
end

local function SkinButton(button, isNegative)
    if not button then return end

    button:GwSkinButton(false, true)
    if isNegative then
        button:GwSkinNegativeButton()
    end
end

local function SkinClassicScrollFrame(scrollFrame, scrollBar)
    if scrollFrame and scrollFrame.GwSkinScrollFrame then
        scrollFrame:GwSkinScrollFrame()
    end
    if scrollBar and scrollBar.GwSkinScrollBar then
        scrollBar:GwSkinScrollBar()
    end
end

local function SetSendMailVisibleState(isShowing)
    if SetSendMailShowing then
        SetSendMailShowing(isShowing)
    end
end

local function ClearSendMailAttachments()
    for i = 1, ATTACHMENTS_MAX_SEND do
        ClickSendMailItemButton(i, true)
    end
end

local function SwitchToComposeView(tabButton)
    OpenMailFrame:Hide()
    MailFrameTab_OnClick(tabButton or MailFrameTab2, 2)
    InboxFrame:Show()
    SendMailFrame:Show()
    SendMailFrame_Update()
    SetSendMailVisibleState(true)
end

local function ResetComposeView()
    SendMailFrame_Reset()
    ClearSendMailAttachments()
end

local function FixMailSkin()
    -- MailFrameTab2.SetWidth is overridden with GW.NoOp later, so force width via SetSize.
    if not MailFrameTab2 or not MailItem1 then return end

    MailFrameTab2:SetSize(310, MailFrameTab2:GetHeight())
    MailFrameTab2:ClearAllPoints()
    MailFrameTab2:SetPoint("BOTTOMLEFT", MailItem1, "TOPLEFT", 0, 10)
    MailFrameTab2:SetPoint("BOTTOMRIGHT", MailItem1, "TOPRIGHT", 0, 10)
    if SendMailSendMoneyButtonText then SendMailSendMoneyButtonText:SetTextColor(1, 1, 1, 1) end
    if SendMailCODButtonText then SendMailCODButtonText:SetTextColor(1, 1, 1, 1) end
end

local function AddFrameSeperator()
    MailFrame.mailFrameSepTexture = MailFrame:CreateTexture(nil, "ARTWORK")
    MailFrame.mailFrameSepTexture:SetHeight(2)
    -- Keep the original vertical position, but size to the right pane width.
    MailFrame.mailFrameSepTexture:SetPoint("BOTTOMRIGHT", MailFrame, "BOTTOMRIGHT", 0, 50)
    MailFrame.mailFrameSepTexture:SetWidth(OpenMailFrame:GetWidth())
    MailFrame.mailFrameSepTexture:SetTexture("Interface/AddOns/GW2_UI/textures/hud/levelreward-sep.png")
    MailFrame.mailFrameSepTexture:Hide()
end

local function AddOnClickHandlers()
    for i = 1, _G.INBOXITEMS_TO_DISPLAY do
        local b = _G["MailItem" .. i .. "Button"]

        if b then
            b:SetScript("OnClick", function(self)
                --setup our UI code
                SendMailFrame:Hide()
                MailFrameTab_OnClick(self, 1)

                InboxFrame:Show()
                OpenMailFrame:Show()
                SendMailFrame_Update()
                SetSendMailVisibleState(false)

                --callback into blizz native functions for click handler
                local modifiedClick = IsModifiedClick("MAILAUTOLOOTTOGGLE");
                if (modifiedClick) then
                    InboxFrame_OnModifiedClick(self, self.index);
                else
                    InboxFrame_OnClick(self, self.index);
                end
            end)
        end
    end
end

local function SkinMoneyFrame()
    -- setup money frame
    if SendMailMoneyFrameCopperButtonText then
        SendMailMoneyFrameCopperButtonText:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Normal)
        SendMailMoneyFrameCopperButtonText:SetTextColor(177 / 255, 97 / 255, 34 / 255)
    end

    if SendMailMoneyFrameSilverButtonText then
        SendMailMoneyFrameSilverButtonText:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Normal)
        SendMailMoneyFrameSilverButtonText:SetTextColor(170 / 255, 170 / 255, 170 / 255)
    end

    if SendMailMoneyFrameGoldButtonText then
        SendMailMoneyFrameGoldButtonText:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Normal)
        SendMailMoneyFrameGoldButtonText:SetTextColor(221 / 255, 187 / 255, 68 / 255)
    end
end

local function SkinPager()
    if not InboxPrevPageButton or not InboxNextPageButton then return end

    local r = { InboxPrevPageButton:GetRegions() }
    if r[1] and r[1].SetTextColor then r[1]:SetTextColor(1, 1, 1, 1) end
    if r[2] and r[2].SetTexture then r[2]:SetTexture("Interface/AddOns/GW2_UI/textures/character/backicon.png") end
    if r[3] and r[3].SetTexture then r[3]:SetTexture("Interface/AddOns/GW2_UI/textures/character/backicon.png") end
    if r[4] and r[4].SetTexture then
        r[4]:SetTexture("Interface/AddOns/GW2_UI/textures/character/backicon.png")
        SetDesaturation(r[4], true)
    end

    r = { InboxNextPageButton:GetRegions() }
    if r[1] and r[1].SetTextColor then r[1]:SetTextColor(1, 1, 1, 1) end
    if r[2] and r[2].SetTexture then r[2]:SetTexture("Interface/AddOns/GW2_UI/textures/character/forwardicon.png") end
    if r[3] and r[3].SetTexture then r[3]:SetTexture("Interface/AddOns/GW2_UI/textures/character/forwardicon.png") end
    if r[4] and r[4].SetTexture then
        r[4]:SetTexture("Interface/AddOns/GW2_UI/textures/character/forwardicon.png")
        SetDesaturation(r[4], true)
    end
end

local function SkinOpenMailFrame()
    -- configure location of OpenMail Frame
    OpenMailFrame:ClearAllPoints()
    OpenMailFrame:SetPoint("TOPLEFT", MailFrame, "TOPLEFT", 331, 0)
    OpenMailFrame:SetPoint("TOPRIGHT", MailFrame, "TOPRIGHT", 0, 0)
    HideRegion(OpenMailFrameCloseButton)
    HideRegion(OpenMailFrameIcon)
    HideRegion(OpenMailSenderLabel)
    HideRegion(OpenMailSubjectLabel)
    HideRegion(OpenMailFrame.TitleContainer)
    HideRegion(OpenStationeryBackgroundLeft)
    HideRegion(OpenStationeryBackgroundRight)

    if OpenMailBodyText then
        OpenMailBodyText:SetFont("P", UNIT_NAME_FONT, 14, "")
        OpenMailBodyText:SetTextColor("P", 1, 1, 1, 1)
    end

    HideRegion(OpenMailFrame.NineSlice)
    HideRegion(OpenMailFrame.TopTileStreaks)
    OpenMailFrame:GwCreateBackdrop(nil)
    OpenMailFrame:SetParent(MailFrame)

    HideRegion(OpenMailSenderLabel)
    local senderText = OpenMailSender and (OpenMailSender.Name or OpenMailSender)
    if senderText then
        senderText:SetPoint("TOPLEFT", OpenMailScrollFrame, "TOPLEFT", 0, 50)
        senderText:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Normal)
        senderText:SetTextColor(1, 1, 1, 1)
    end

    HideRegion(OpenMailSubjectLabel)
    if OpenMailSubject then
        OpenMailSubject:SetPoint("TOPLEFT", senderText or OpenMailScrollFrame, senderText and "BOTTOMLEFT" or "TOPLEFT", 0, senderText and -10 or 30)
        OpenMailSubject:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Small)
        OpenMailSubject:SetTextColor(1, 1, 1, 1)
    end

    SkinButton(OpenMailReportSpamButton)
    SkinButton(OpenMailReplyButton)
    if OpenMailReplyButton and OpenMailDeleteButton then
        OpenMailReplyButton:SetPoint("RIGHT", OpenMailDeleteButton, "LEFT", -5, 0)
        OpenMailReplyButton:SetScript("OnClick", function(self)
            OpenMail_Reply()
            SwitchToComposeView(self)
        end)
    end

    SkinButton(OpenMailDeleteButton, true)
    if OpenMailDeleteButton and OpenMailCancelButton then
        OpenMailDeleteButton:SetPoint("RIGHT", OpenMailCancelButton, "LEFT", -5, 0)
    end

    SkinButton(OpenMailCancelButton)
    if OpenMailCancelButton then
        OpenMailCancelButton:SetPoint("BOTTOMRIGHT", OpenMailFrame, "BOTTOMRIGHT", -7, -20)
    end

    SkinButton(OpenAllMail)
    if OpenAllMail then
        OpenAllMail:ClearAllPoints()
        OpenAllMail:SetPoint("CENTER",InboxFrame,"BOTTOM",0,114)
    end
    if GW.Retail then
        GW.HandleTrimScrollBar(OpenMailScrollFrame.ScrollBar)
        GW.HandleScrollControls(OpenMailScrollFrame)
    else
        SkinClassicScrollFrame(OpenMailScrollFrame, OpenMailScrollFrameScrollBar)
    end

    if OpenMailScrollFrame then
        OpenMailScrollFrame:SetPoint("TOPLEFT",OpenMailFrame,"TOPLEFT",8,-84)
        OpenMailScrollFrame:SetPoint("TOPRIGHT", OpenMailFrame, "TOPRIGHT", -26, -84)
    end
    for i = 1, _G.ATTACHMENTS_MAX_RECEIVE do
        local b = _G["OpenMailAttachmentButton" .. i]
        local t = _G["OpenMailAttachmentButton" .. i .. "IconTexture"]

        if b then
            b:GwStripTextures()
            b:SetHighlightTexture("Interface/AddOns/GW2_UI/textures/uistuff/ui-quickslot-depress.png")
            local r = { b:GetRegions() }
            local ii = 1
            for _, c in pairs(r) do
                if c:GetObjectType() == "Texture" then
                    if ii == 1 then
                        c:SetTexture("Interface/AddOns/GW2_UI/textures/bag/bagitembackdrop.png")
                        c:SetSize(b:GetSize())
                    end
                    ii = ii + 1
                end
            end
            if b.IconBorder then
                hooksecurefunc(b.IconBorder, "SetVertexColor", function(self)
                    self:SetTexture("Interface/AddOns/GW2_UI/textures/bag/bagitemborder.png")
                end)

                b.IconBorder:SetTexture("Interface/AddOns/GW2_UI/textures/bag/bagitemborder.png")
            end
        end

        if t then t:SetTexCoord(0.1, 0.9, 0.1, 0.9) end
    end
end

local function setFontColorToWhite(self)
    self:SetTextColor(1, 1, 1, 1)
end

local function SkinMailFrameSendItems()
    for i = 1, _G.ATTACHMENTS_MAX_SEND do
        local b = _G["SendMailAttachment" .. i]
        if b then
            b:SetHighlightTexture("Interface/AddOns/GW2_UI/textures/uistuff/ui-quickslot-depress.png")
            local r = { b:GetRegions() }
            local ii = 1
            for _, c in pairs(r) do
                if c:GetObjectType() == "Texture" then
                    if ii == 1 then
                        c:SetTexture("Interface/AddOns/GW2_UI/textures/bag/bagitembackdrop.png")
                        c:SetSize(b:GetSize())
                    end
                    ii = ii + 1
                end
            end
            local t = b:GetNormalTexture()
            if t then t:SetTexCoord(0.1, 0.9, 0.1, 0.9) end

            if b.IconBorder then
                b.IconBorder:ClearAllPoints()
                b.IconBorder:SetPoint("TOPLEFT", b, "TOPLEFT", -2, 2)
                b.IconBorder:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", 2, -2)
            end
        end
    end
end

local function SkinSendMailFrame()
    GW.MutateInaccessableObject(SendMailCostMoneyFrame, "FontString", setFontColorToWhite)
    GW.MutateInaccessableObject(SendMailNameEditBox, "FontString", setFontColorToWhite)
    GW.MutateInaccessableObject(SendMailSubjectEditBox, "FontString", setFontColorToWhite)

    if not GW.Retail then
        local mailEditBox = MailEditBox and (MailEditBox.ScrollBox and MailEditBox.ScrollBox.EditBox or MailEditBox)
        if mailEditBox and mailEditBox.SetTextColor then
            mailEditBox:SetTextColor(1, 1, 1)
        end
        if MailEditBox and MailEditBox.ScrollBox then
            MailEditBox.ScrollBox:GwStripTextures()
            MailEditBox.ScrollBox:GwCreateBackdrop(GW.BackdropTemplates.Default, true, 10, 10)
        elseif MailEditBox then
            MailEditBox:GwStripTextures()
            MailEditBox:GwCreateBackdrop(GW.BackdropTemplates.Default, true, 10, 10)
        end
        if MailEditBoxScrollBar then
            GW.HandleTrimScrollBar(MailEditBoxScrollBar)
        end
    end

    SkinMoneyFrame()
    if SendMailMoneyText then SendMailMoneyText:SetTextColor(1, 1, 1, 1) end

    -- configure location of SendMail Frame
    SendMailFrame:ClearAllPoints()
    SendMailFrame:SetPoint("TOPRIGHT", MailFrame, "TOPRIGHT", 46, 20)
    SendMailFrame:SetParent(MailFrame)

    --Hides
    HideRegion(SendStationeryBackgroundLeft)
    HideRegion(SendStationeryBackgroundRight)
    HideRegion(SendMailMoneyBg)
    HideRegion(SendMailMoneyInset)

    SkinButton(SendMailCancelButton)
    SkinButton(SendMailMailButton)

    if GW.Retail then
        SendMailScrollFrame:GwStripTextures(true)
        GW.HandleTrimScrollBar(SendMailScrollFrame.ScrollBar)
        GW.HandleScrollControls(SendMailScrollFrame)
    end

    if SendMailMoneyFrame then
        SendMailMoneyFrame:ClearAllPoints()
        SendMailMoneyFrame:SetPoint("BOTTOMRIGHT", SendMailFrame, "BOTTOMRIGHT", -40, 15)
    end

    if SendMailNameEditBox then
        GW.SkinTextBox(SendMailNameEditBoxMiddle, SendMailNameEditBoxLeft, SendMailNameEditBoxRight, nil, nil, 5)
    end
    if SendMailSubjectEditBox then
        GW.SkinTextBox(SendMailSubjectEditBoxMiddle, SendMailSubjectEditBoxLeft, SendMailSubjectEditBoxRight, nil, nil, 5)
    end
    if SendMailMoneyGold then
        GW.SkinTextBox(SendMailMoneyGoldMiddle, SendMailMoneyGoldLeft, SendMailMoneyGoldRight, nil, nil, 5)
    end
    if SendMailMoneySilver then
        GW.SkinTextBox(SendMailMoneySilverMiddle, SendMailMoneySilverLeft, SendMailMoneySilverRight, nil, nil, 5, -12)
    end
    if SendMailMoneyCopper then
        GW.SkinTextBox(SendMailMoneyCopperMiddle, SendMailMoneyCopperLeft, SendMailMoneyCopperRight, nil, nil, 5, -12)
    end

    --reposition buttons
    if SendMailMailButton then
        SendMailMailButton:ClearAllPoints()
        SendMailMailButton:SetPoint("BOTTOMRIGHT", SendMailFrame, "BOTTOMRIGHT", -53, 57)
    end

    if SendMailCancelButton and SendMailMailButton then
        SendMailCancelButton:ClearAllPoints()
        SendMailCancelButton:SetPoint("RIGHT", SendMailMailButton, "LEFT", -5, 0)
        SendMailCancelButton:SetText(RESET)
        SendMailCancelButton:SetScript("OnClick", function()
            ResetComposeView()
        end)
    end

    local cancelButton = CreateFrame("Button", "SendMailQuit", SendMailFrame, "UIPanelButtonNoTooltipTemplate")
    cancelButton:ClearAllPoints()
    cancelButton:SetPoint("RIGHT", SendMailCancelButton or SendMailMailButton or SendMailFrame, SendMailCancelButton and "LEFT" or "BOTTOMRIGHT", -5, SendMailCancelButton and 0 or 57)
    cancelButton:SetText(CANCEL)
    if SendMailCancelButton or SendMailMailButton then
        cancelButton:SetSize((SendMailCancelButton or SendMailMailButton):GetSize())
    else
        cancelButton:SetSize(80, 22)
    end
    cancelButton:GwSkinButton(false, true)
    cancelButton:SetScript("OnClick", function(self)
        ResetComposeView()

        SendMailFrame:Hide()
        SetSendMailVisibleState(false)
        MailFrameTab_OnClick(self, 1)
    end)
end

local function SkinComposeButton()
    if not MailFrameTab2 then return end

    MailFrameTab2:GwStripTextures()
    MailFrameTab2:SetSize(310, 24)
    MailFrameTab2.SetWidth = GW.NoOp

    MailFrameTab2:SetText(SENDMAIL)
    MailFrameTab2:GwSkinButton(false, true)
    MailFrameTab2:SetScript("OnClick", function(self)
        SwitchToComposeView(self)
    end)
end

local function ClearMailTextures()
    HideRegion(MailFrameTitleText)
    HideRegion(_G.MailFrameBg)
    HideRegion(_G.MailFrameInset and _G.MailFrameInset.NineSlice)
    if _G.MailFrameInset then
        _G.MailFrameInset:GwCreateBackdrop()
    end

    HideRegion(InboxTitleText)
    HideRegion(SendMailTitleText)

    MailFrame:GwStripTextures()
    InboxFrame:GwStripTextures()
    SendMailFrame:GwStripTextures()
    if GW.Retail then
        SendMailScrollFrame:GwStripTextures(true)
    end
    OpenMailFrame:GwStripTextures()
    OpenMailScrollFrame:GwStripTextures()
    OpenMailScrollFrame:GwCreateBackdrop(GW.BackdropTemplates.Default, true)

    if GW.Retail then
        SendMailScrollFrame:GwCreateBackdrop(GW.BackdropTemplates.Default)

        HideRegion(MailFrame.NineSlice)
    end
    HideRegion(MailFrame.TopTileStreaks)
    MailFrame:GwCreateBackdrop()

    if OpenMailLetterButtonIconTexture then OpenMailLetterButtonIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9) end
    if OpenMailLetterButton then OpenMailLetterButton:GwStripTextures() end
    if OpenMailMoneyButtonIconTexture then OpenMailMoneyButtonIconTexture:SetTexCoord(0.1, 0.9, 0.1, 0.9) end
    if OpenMailMoneyButton then OpenMailMoneyButton:GwStripTextures() end

    for i = 1, _G.INBOXITEMS_TO_DISPLAY do
        local zebra = i % 2
        local bg = _G["MailItem" .. i]

        if bg then bg:GwStripTextures() end

        local btn = _G["MailItem" .. i .. "Button"]
        if btn then btn:GwStripTextures() end

        local t = _G["MailItem" .. i .. "ButtonIcon"]
        if t then t:SetTexCoord(0.1, 0.9, 0.1, 0.9) end

        if bg then
            bg.gwZebra = bg:CreateTexture(nil, "BACKGROUND")
            bg.gwZebra:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar.png")
            bg.gwZebra:SetSize(32, 32)
            bg.gwZebra:SetPoint("TOPLEFT", bg, "TOPLEFT")
            bg.gwZebra:SetPoint("BOTTOMRIGHT", bg, "BOTTOMRIGHT")
            bg.gwZebra:SetVertexColor(0,0,0,zebra/4 + 0.2)
        end

        local ib = _G["MailItem" .. i .. "ButtonIconBorder"]
        if ib and t then
            ib:ClearAllPoints()
            ib:SetPoint("TOPLEFT", t, "TOPLEFT", -2, 2)
            ib:SetPoint("BOTTOMRIGHT", t, "BOTTOMRIGHT", 2, -2)
            hooksecurefunc(ib, "SetVertexColor", function(self)
                self:SetTexture("Interface/AddOns/GW2_UI/textures/bag/bagitemborder.png")
            end)
        end
    end
    HideRegion(MailFrameTab1)
end

local function LoadMailSkin()
    if not GW.settings.MAIL_SKIN_ENABLED then return end
    RefreshMailFrameReferences()
    if not (MailFrame and InboxFrame and SendMailFrame and OpenMailFrame) then return end
    if MailFrame.gwMailSkinned then return end
    MailFrame.gwMailSkinned = true

    local eventFrame = CreateFrame("Frame")
    eventFrame:RegisterEvent("MAIL_SHOW")
    eventFrame:RegisterEvent("MAIL_INBOX_UPDATE")
    eventFrame:RegisterEvent("MAIL_CLOSED")
    eventFrame:RegisterEvent("MAIL_SEND_INFO_UPDATE")
    eventFrame:RegisterEvent("MAIL_SEND_SUCCESS")
    eventFrame:RegisterEvent("MAIL_FAILED")
    eventFrame:RegisterEvent("MAIL_SUCCESS")
    eventFrame:RegisterEvent("CLOSE_INBOX_ITEM")
    eventFrame:RegisterEvent("MAIL_LOCK_SEND_ITEMS")
    eventFrame:RegisterEvent("MAIL_UNLOCK_SEND_ITEMS")
    eventFrame:RegisterEvent("TRIAL_STATUS_UPDATE")
    eventFrame:SetScript("OnEvent", FixMailSkin)

    if InvoiceTextFontNormal then InvoiceTextFontNormal:SetTextColor(1, 1, 1) end
    if MailTextFontNormal then MailTextFontNormal:SetTextColor(1, 1, 1) end

    -- Strip and hide default textures
    ClearMailTextures()

    -- Setup adaptive frame size:
    -- compact mode keeps only the inbox area visible;
    -- expanded mode adds a right pane with similar width.
    local baseWidth, baseHeight = MailFrame:GetSize()
    local leftPaneWidth = 331
    local sidePadding = 20
    local compactWidth = baseWidth
    local expandedWidth = (leftPaneWidth * 2) + sidePadding
    local frameHeight = baseHeight + 30

    -- override max tabsize for the "compose" button (as it's just the send mail tab)
    MailFrame.maxTabWidth = 320

    -- Configure Mail Frame Background
    MailFrame.mailFrameBgTexture = MailFrame:CreateTexture(nil, "BACKGROUND", nil, -7)
    MailFrame.mailFrameBgTexture:SetSize(expandedWidth, frameHeight)
    MailFrame.mailFrameBgTexture:SetPoint("TOPLEFT", MailFrame, "TOPLEFT", 0, 5)
    MailFrame.mailFrameBgTexture:SetTexture("Interface/AddOns/GW2_UI/textures/hud/mailboxwindow-background.png")
    MailFrame.mailFrameBgTexture:SetTexCoord(0, 0.7099, 0, 0.955);

    -- Configure Mail Heading
    MailFrame.heading = MailFrame:CreateTexture(nil, "BACKGROUND")
    MailFrame.heading:SetSize(expandedWidth, 64)
    MailFrame.heading:SetPoint("BOTTOMLEFT", MailFrame, "TOPLEFT", 0, 0)
    MailFrame.heading:SetTexture("Interface/AddOns/GW2_UI/textures/bag/bagheader.png")

    MailFrame.heading.Title = MailFrame:CreateFontString("MailFrameTitle", "ARTWORK")
    MailFrame.heading.Title:SetPoint("TOPLEFT", MailFrame, "TOPLEFT", 50, 30)
    MailFrame.heading.Title:GwSetFontTemplate(DAMAGE_TEXT_FONT, GW.Enum.TextSizeType.BigHeader, "OUTLINE", 2)
    MailFrame.heading.Title:SetText(MAIL_LABEL)
    MailFrame.heading.Title:SetTextColor(1, .93, .73)

    MailFrame.icon = MailFrame:CreateTexture(nil, "ARTWORK")
    MailFrame.icon:SetSize(80, 80)
    MailFrame.icon:SetPoint("CENTER", MailFrame, "TOPLEFT", 12, 25)
    MailFrame.icon:SetTexture("Interface/AddOns/GW2_UI/textures/icons/mail-window-icon.png")

    MailFrame.headingRight = MailFrame:CreateTexture(nil, "BACKGROUND")
    MailFrame.headingRight:SetSize(expandedWidth, 64)
    MailFrame.headingRight:SetPoint("BOTTOMRIGHT", MailFrame, "TOPRIGHT", 0, 0)
    MailFrame.headingRight:SetTexture("Interface/AddOns/GW2_UI/textures/bag/bagheader-right.png")

    local closeButton = MailFrame.CloseButton or MailFrameCloseButton
    if closeButton then
        closeButton:GwSkinButton(true, false)
        closeButton:SetSize(20, 20)
        closeButton:ClearAllPoints()
        closeButton:SetPoint("TOPRIGHT", MailFrame, "TOPRIGHT", -10, 30)
        closeButton:SetParent(MailFrame)
    end

    -- Configure footer
    MailFrame.footer = MailFrame:CreateTexture(nil, "BACKGROUND")
    MailFrame.footer:SetSize(expandedWidth, 70)
    MailFrame.footer:SetPoint("TOPLEFT", MailFrame, "BOTTOMLEFT", 0, 5)
    MailFrame.footer:SetPoint("TOPRIGHT", MailFrame, "BOTTOMRIGHT", 0, 5)
    MailFrame.footer:SetTexture("Interface/AddOns/GW2_UI/textures/bag/bagfooter.png")

    InboxFrame:SetWidth(leftPaneWidth)

    if _G.AutoCompleteBox then
        _G.AutoCompleteBox:GwStripTextures()
        _G.AutoCompleteBox:GwCreateBackdrop(GW.BackdropTemplates.Default)
    end

    -- movable stuff
    local pos = GW.settings.MAILBOX_POSITION
    MailFrame.mover = CreateFrame("Frame", nil, MailFrame)
    MailFrame.mover:EnableMouse(true)
    MailFrame:SetMovable(true)
    MailFrame.mover:SetSize(expandedWidth, 30)
    MailFrame.mover:SetPoint("BOTTOMLEFT", MailFrame, "TOPLEFT", 0, 0)
    MailFrame.mover:SetPoint("BOTTOMRIGHT", MailFrame, "TOPRIGHT", 0, 0)
    MailFrame.mover:RegisterForDrag("LeftButton")
    MailFrame:SetClampedToScreen(true)
    MailFrame.mover:SetScript("OnDragStart", function()
        MailFrame:StartMoving()
    end)
    MailFrame.mover:SetScript("OnDragStop", function()
        MailFrame:StopMovingOrSizing()

        local x = MailFrame:GetLeft()
        local y = MailFrame:GetTop()

        -- re-anchor to UIParent after the move
        MailFrame.SetPoint = nil
        MailFrame:ClearAllPoints()
        MailFrame:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x, y)
        MailFrame.SetPoint = GW.NoOp -- prevent blizz from overriding our position

        -- store the updated position
        local pos = GW.settings.MAILBOX_POSITION
        wipe(pos)
        pos.point = "TOPLEFT"
        pos.relativePoint = "BOTTOMLEFT"
        pos.xOfs = x
        pos.yOfs = y
        GW.settings.MAILBOX_POSITION = pos
    end)
    MailFrame:ClearAllPoints()
    MailFrame:SetPoint(pos.point, UIParent, pos.relativePoint, pos.xOfs, pos.yOfs)
    MailFrame.SetPoint = GW.NoOp -- prevent blizz from overriding our position

    MailFrame:HookScript("OnShow", function()
        local pos = GW.settings.MAILBOX_POSITION
        MailFrame.SetPoint = nil
        MailFrame:ClearAllPoints()
        MailFrame:SetPoint(pos.point, UIParent, pos.relativePoint, pos.xOfs, pos.yOfs)
        MailFrame.SetPoint = GW.NoOp -- prevent blizz from overriding our position
    end)

    local function UpdateInboxBottomButtons()
        local yOffset = 88

        if OpenAllMail then
            OpenAllMail:ClearAllPoints()
            OpenAllMail:SetPoint("CENTER", InboxFrame, "BOTTOM", 0, yOffset)
        end

        if InboxPrevPageButton then
            local prevBottomOffset = yOffset - (InboxPrevPageButton:GetHeight() * 0.5)
            InboxPrevPageButton:ClearAllPoints()
            InboxPrevPageButton:SetPoint("BOTTOMLEFT", InboxFrame, "BOTTOMLEFT", 6, prevBottomOffset)
        end

        if InboxNextPageButton then
            local nextBottomOffset = yOffset - (InboxNextPageButton:GetHeight() * 0.5)
            InboxNextPageButton:ClearAllPoints()
            InboxNextPageButton:SetPoint("BOTTOMRIGHT", InboxFrame, "BOTTOMRIGHT", -6, nextBottomOffset)
        end
    end

    local function ApplyMailFrameSize(width)
        MailFrame:SetSize(width, frameHeight)
        MailFrame.mailFrameBgTexture:SetSize(width, frameHeight)
        MailFrame.heading:SetSize(width, 64)
        MailFrame.headingRight:SetSize(width, 64)
        MailFrame.footer:SetSize(width, 70)
        MailFrame.mover:SetWidth(width)
    end

    local function UpdateMailFrameSize()
        local shouldExpand = OpenMailFrame:IsShown() or SendMailFrame:IsShown()
        ApplyMailFrameSize(shouldExpand and expandedWidth or compactWidth)
        if MailFrame.mailFrameSepTexture then
            MailFrame.mailFrameSepTexture:SetWidth(OpenMailFrame:GetWidth())
            MailFrame.mailFrameSepTexture:SetShown(shouldExpand)
        end
        UpdateInboxBottomButtons()
    end

    MailFrame:HookScript("OnShow", UpdateMailFrameSize)
    OpenMailFrame:HookScript("OnShow", UpdateMailFrameSize)
    OpenMailFrame:HookScript("OnHide", UpdateMailFrameSize)
    SendMailFrame:HookScript("OnShow", UpdateMailFrameSize)
    SendMailFrame:HookScript("OnHide", UpdateMailFrameSize)
    hooksecurefunc("MailFrameTab_OnClick", UpdateMailFrameSize)
    UpdateMailFrameSize()

    -- Reskin OpenMailFrame Buttons
    SkinPager()
    SkinOpenMailFrame()
    SkinSendMailFrame()
    SkinComposeButton()
    AddFrameSeperator()

    -- Hook's
    hooksecurefunc("SendMailFrame_Update", SkinMailFrameSendItems)

    -- hook inbox buttons to close the compose view if we want to look at a message and it's open
    AddOnClickHandlers()

    -- Skin Postal Addon
    if GW.LoadPostalAddonSkin then
        GW.LoadPostalAddonSkin()
    end
end
GW.LoadMailSkin = LoadMailSkin
