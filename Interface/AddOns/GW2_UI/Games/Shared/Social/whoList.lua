---@class GW2
local GW = select(2, ...)

local function ReskinWhoFrameButton(button)
    if not button.isSkinned then
        local name = button.Name or button:GetName() and _G[button:GetName() .. "Name"]
        local variable = button.Variable or button:GetName() and _G[button:GetName() .. "Variable"]
        local level = button.Level or button:GetName() and _G[button:GetName() .. "Level"]
        local class = button.Class or button:GetName() and _G[button:GetName() .. "Class"]

        if name then
            name:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Small)
        end
        if variable then
            variable:SetFont(UNIT_NAME_FONT, 11)
        end
        if level then
            level:SetFont(UNIT_NAME_FONT, 11)
        end
        if class then
            class:SetFont(UNIT_NAME_FONT, 11)
        end
        GW.AddListItemChildHoverTexture(button)
        button.isSkinned = true
    end
end

local function LayoutClassicWhoList()
    if not GW.Classic then return end
    if not WhoFrame or not WhoListScrollFrame then return end

    if WhoFrameListInset then
        WhoFrameListInset:SetAlpha(0)
    end
    if WhoFrameColumnHeader1 then
        WhoFrameColumnHeader1:ClearAllPoints()
        WhoFrameColumnHeader1:SetPoint("TOPLEFT", WhoFrame, "TOPLEFT", 8, -62)
        WhoFrameColumnHeader1:SetWidth(112)
    end
    if WhoFrameColumnHeader2 then
        WhoFrameColumnHeader2:ClearAllPoints()
        WhoFrameColumnHeader2:SetPoint("LEFT", WhoFrameColumnHeader1 or WhoFrame, WhoFrameColumnHeader1 and "RIGHT" or "TOPLEFT", -2, WhoFrameColumnHeader1 and 0 or -62)
        WhoFrameColumnHeader2:SetWidth(155)
    end
    if WhoFrameColumnHeader3 then
        WhoFrameColumnHeader3:ClearAllPoints()
        WhoFrameColumnHeader3:SetPoint("LEFT", WhoFrameColumnHeader2 or WhoFrame, WhoFrameColumnHeader2 and "RIGHT" or "TOPLEFT", -2, WhoFrameColumnHeader2 and 0 or -62)
        WhoFrameColumnHeader3:SetWidth(50)
    end
    if WhoFrameColumnHeader4 then
        WhoFrameColumnHeader4:ClearAllPoints()
        WhoFrameColumnHeader4:SetPoint("LEFT", WhoFrameColumnHeader3 or WhoFrame, WhoFrameColumnHeader3 and "RIGHT" or "TOPLEFT", -2, WhoFrameColumnHeader3 and 0 or -62)
        WhoFrameColumnHeader4:SetWidth(120)
    end

    WhoListScrollFrame:ClearAllPoints()
    WhoListScrollFrame:SetPoint("TOPLEFT", WhoFrame, "TOPLEFT", 8, -87)
    WhoListScrollFrame:SetPoint("BOTTOMRIGHT", WhoFrame, "BOTTOMRIGHT", -25, 78)
    WhoListScrollFrame:SetHeight(455)

    if WhoFrameEditBox then
        WhoFrameEditBox:ClearAllPoints()
        WhoFrameEditBox:SetPoint("BOTTOMLEFT", WhoFrame, "BOTTOMLEFT", 15, 42)
        WhoFrameEditBox:SetPoint("BOTTOMRIGHT", WhoFrame, "BOTTOMRIGHT", -25, 42)
        WhoFrameEditBox:SetHeight(22)
    end
    if WhoFrameWhoButton then
        WhoFrameWhoButton:ClearAllPoints()
        WhoFrameWhoButton:SetPoint("BOTTOMLEFT", WhoFrame, "BOTTOMLEFT", 150, 8)
        WhoFrameWhoButton:SetWidth(80)
    end
    if WhoFrameAddFriendButton then
        WhoFrameAddFriendButton:ClearAllPoints()
        WhoFrameAddFriendButton:SetPoint("LEFT", WhoFrameWhoButton or WhoFrame, WhoFrameWhoButton and "RIGHT" or "BOTTOMLEFT", WhoFrameWhoButton and 4 or 235, WhoFrameWhoButton and 0 or 8)
        WhoFrameAddFriendButton:SetWidth(100)
    end
    if WhoFrameGroupInviteButton then
        WhoFrameGroupInviteButton:ClearAllPoints()
        WhoFrameGroupInviteButton:SetPoint("LEFT", WhoFrameAddFriendButton or WhoFrame, WhoFrameAddFriendButton and "RIGHT" or "BOTTOMLEFT", WhoFrameAddFriendButton and 4 or 340, WhoFrameAddFriendButton and 0 or 8)
        WhoFrameGroupInviteButton:SetWidth(100)
    end

    for i = 1, WHOS_TO_DISPLAY or 0 do
        local button = _G["WhoFrameButton" .. i]
        if button then
            ReskinWhoFrameButton(button)
            button:SetWidth(440)
        end
    end
end

function GW.SkinWhoList()
    if WhoFrameTotals then
        WhoFrameTotals:SetTextColor(1, 1, 1)
    end
    if WhoFrameListInset then
        WhoFrameListInset:SetAlpha(0)
    end

    if GW.Retail then
        GW.HandleTrimScrollBar(WhoFrame.ScrollBar)
        GW.HandleScrollControls(WhoFrame)

        hooksecurefunc(WhoFrame.ScrollBox, "Update", GW.HandleItemListScrollBoxHover)
        hooksecurefunc(WhoFrame.ScrollBox, "Update", function(scrollBox)
            scrollBox:ForEachFrame(ReskinWhoFrameButton)
        end)
    else
        WHOS_TO_DISPLAY = 30
        for i = 18, 30 do
            if not _G["WhoFrameButton"..i] and _G["WhoFrameButton"..(i-1)] then
                local button = CreateFrame("Button", "WhoFrameButton"..i, WhoFrame, "FriendsFrameWhoButtonTemplate")
                button:SetID(i)
                button:SetPoint("TOP", _G["WhoFrameButton"..(i-1)], "BOTTOM")
            end
        end

        if WhoListScrollFrame then
            WhoListScrollFrame:GwStripTextures()
            WhoListScrollFrame:GwSkinScrollFrame()
        end
        if WhoListScrollFrameScrollBar then
            WhoListScrollFrameScrollBar:GwSkinScrollBar()
        end
        LayoutClassicWhoList()

        if WhoFrameListInset then
            WhoFrameListInset:SetAlpha(0)
        end
        if _G.WhoList_Update and not WhoFrame.gwWhoListUpdateHooked then
            hooksecurefunc("WhoList_Update", LayoutClassicWhoList)
            WhoFrame.gwWhoListUpdateHooked = true
        end
    end

    if WhoFrameEditBox and WhoFrameEditBox.Backdrop then
        WhoFrameEditBox.Backdrop:SetTexture("Interface/AddOns/GW2_UI/textures/bag/bagsearchbg.png")
    end
    if WhoFrameEditBox then
        WhoFrameEditBox:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Normal)
        if WhoFrameEditBox.Instructions then
            WhoFrameEditBox.Instructions:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Normal)
            WhoFrameEditBox.Instructions:SetTextColor(178 / 255, 178 / 255, 178 / 255)
        end
        GW.SkinBagSearchBox(WhoFrameEditBox)
    end

    for _, frame in ipairs({WhoFrameColumnHeader1, WhoFrameColumnHeader2, WhoFrameColumnHeader3, WhoFrameColumnHeader4}) do
        if frame then
            frame:GwStripTextures()
            local r = {frame:GetRegions()}
            for _,c in pairs(r) do
                if c:GetObjectType() == "FontString" then
                    c:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Small)
                end
            end
        end
    end

    for _, object in pairs({WhoFrameColumnHeader1, WhoFrameColumnHeader2, WhoFrameColumnHeader3, WhoFrameColumnHeader4}) do
        if object then
            GW.HandleScrollFrameHeaderButton(object)
        end
    end

    if WhoFrameDropdown then
        WhoFrameDropdown:GwStripTextures()
        if WhoFrameDropdown.Arrow then
            WhoFrameDropdown.Arrow:ClearAllPoints()
            WhoFrameDropdown.Arrow:SetPoint("RIGHT", WhoFrameDropdown, "RIGHT", -5, -3)
            WhoFrameDropdown.Arrow:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/arrowdown_down.png")
        end
        if WhoFrameDropdown.Text then
            WhoFrameDropdown.Text:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Small)
            WhoFrameDropdown.Text:SetShadowOffset(0, 0)
            WhoFrameDropdown.Text:SetTextColor(1, 1, 1)
        end
        if not WhoFrameDropdown.gwWhoDropdownHooked then
            WhoFrameDropdown:HookScript("OnClick", function(self)
                if self.Arrow then
                    self.Arrow:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/arrowdown_down.png")
                end
            end)
            WhoFrameDropdown:HookScript("OnMouseDown", function(self)
                if self.Arrow then
                    self.Arrow:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/arrowdown_down.png")
                end
            end)
            WhoFrameDropdown.gwWhoDropdownHooked = true
        end
        if WhoFrameDropdown.Background then
            WhoFrameDropdown.Background:Hide()
        end
    end

    if WhoFrameColumnHeader1 and WhoFrameListInset and not GW.Classic then
        WhoFrameColumnHeader1:SetPoint("BOTTOMLEFT", WhoFrameListInset, "TOPLEFT", 5, 0)
    end
    if WhoFrameWhoButton then
        WhoFrameWhoButton:GwSkinButton(false, true)
    end
    if WhoFrameAddFriendButton then
        WhoFrameAddFriendButton:GwSkinButton(false, true)
    end
    if WhoFrameGroupInviteButton then
        WhoFrameGroupInviteButton:GwSkinButton(false, true)
    end
    LayoutClassicWhoList()
end
