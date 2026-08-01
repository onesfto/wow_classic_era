local GW = _G.GW2_ADDON
if not GW then return end
local CLASSIC_WHO_MEMBERS_TO_DISPLAY = 29
local CLASSIC_WHO_LIST_LAYOUT = {
    defaultContentLeft = 40,
    defaultSearchLeftInset = 11,
    scrollLeft = 8,
    headerTop = -62,
    columnGap = -2,
    textInset = 9,
    classicDropdownInset = 26,
    columns = {
        {header = "WhoFrameColumnHeader1", field = "Name", width = 112, justify = "LEFT"},
        {header = "WhoFrameColumnHeader2", field = "Variable", width = 155, justify = "LEFT"},
        {header = "WhoFrameColumnHeader3", field = "Level", width = 50, justify = "CENTER"},
        {header = "WhoFrameColumnHeader4", field = "Class", width = 120, justify = "LEFT"},
    },
}
local function GetWhoFrameButtonField(button, field)
    return button[field] or button:GetName() and _G[button:GetName() .. field]
end
local function ReskinWhoFrameButton(button)
    if not button.isSkinned then
        local name = GetWhoFrameButtonField(button, "Name")
        local variable = GetWhoFrameButtonField(button, "Variable")
        local level = GetWhoFrameButtonField(button, "Level")
        local class = GetWhoFrameButtonField(button, "Class")
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
local function GetClassicWhoContentLeft()
    local searchMiddle = WhoFrameEditBox and WhoFrameEditBox.Middle
    local frameLeft = WhoFrame and WhoFrame:GetLeft()
    local searchLeft = searchMiddle and searchMiddle:GetLeft()
    if frameLeft and searchLeft then
        return searchLeft - frameLeft
    end
    return CLASSIC_WHO_LIST_LAYOUT.defaultContentLeft
end
local function GetClassicWhoColumnsWidth()
    local width = 0
    for index, column in ipairs(CLASSIC_WHO_LIST_LAYOUT.columns) do
        width = width + column.width
        if index > 1 then
            width = width + CLASSIC_WHO_LIST_LAYOUT.columnGap
        end
    end
    return width
end
local function GetClassicWhoSearchLeftInset()
    local editBoxLeft = WhoFrameEditBox and WhoFrameEditBox:GetLeft()
    local searchMiddle = WhoFrameEditBox and WhoFrameEditBox.Middle
    local searchLeft = searchMiddle and searchMiddle:GetLeft()
    if editBoxLeft and searchLeft then
        return searchLeft - editBoxLeft
    end
    return CLASSIC_WHO_LIST_LAYOUT.defaultSearchLeftInset
end
local function LayoutClassicWhoHeader(header, previousHeader, column, contentLeft)
    header:ClearAllPoints()
    if previousHeader then
        header:SetPoint("LEFT", previousHeader, "RIGHT", CLASSIC_WHO_LIST_LAYOUT.columnGap, 0)
    else
        header:SetPoint("TOPLEFT", WhoFrame, "TOPLEFT", contentLeft, CLASSIC_WHO_LIST_LAYOUT.headerTop)
    end
    header:SetWidth(column.width)
    local headerName = header:GetName()
    local text = headerName and _G[header:GetName() .. "Text"] or header:GetFontString()
    if text then
        local inset = column.justify == "CENTER" and 0 or CLASSIC_WHO_LIST_LAYOUT.textInset
        text:ClearAllPoints()
        text:SetPoint("LEFT", header, "LEFT", inset, 0)
        text:SetWidth(column.width - inset * 2)
        text:SetJustifyH(column.justify)
    end
end
local function LayoutClassicWhoFrameButton(button)
    local columnStart = 0
    for _, column in ipairs(CLASSIC_WHO_LIST_LAYOUT.columns) do
        local field = GetWhoFrameButtonField(button, column.field)
        if field then
            local inset = column.justify == "CENTER" and 0 or CLASSIC_WHO_LIST_LAYOUT.textInset
            field:ClearAllPoints()
            field:SetPoint("LEFT", button, "LEFT", columnStart + inset, 0)
            field:SetWidth(column.width - inset * 2)
            field:SetJustifyH(column.justify)
        end
        columnStart = columnStart + column.width + CLASSIC_WHO_LIST_LAYOUT.columnGap
    end
end
local function LayoutClassicWhoList()
    if not GW.Classic then return end
    if not WhoFrame or not WhoListScrollFrame then return end
    local contentLeft = GetClassicWhoContentLeft()
    if WhoFrameListInset then
        WhoFrameListInset:SetAlpha(0)
    end
    local previousHeader
    for _, column in ipairs(CLASSIC_WHO_LIST_LAYOUT.columns) do
        local header = _G[column.header]
        if header then
            LayoutClassicWhoHeader(header, previousHeader, column, contentLeft)
            previousHeader = header
        end
    end
    if WhoFrameDropdown and WhoFrameColumnHeader2 then
        WhoFrameDropdown:ClearAllPoints()
        WhoFrameDropdown:SetPoint("LEFT", WhoFrameColumnHeader2, "LEFT", CLASSIC_WHO_LIST_LAYOUT.classicDropdownInset, 0)
        WhoFrameDropdown:SetWidth(CLASSIC_WHO_LIST_LAYOUT.columns[2].width - CLASSIC_WHO_LIST_LAYOUT.classicDropdownInset)
    end
    WhoListScrollFrame:ClearAllPoints()
    WhoListScrollFrame:SetPoint("TOPLEFT", WhoFrame, "TOPLEFT", CLASSIC_WHO_LIST_LAYOUT.scrollLeft, -87)
    WhoListScrollFrame:SetPoint("BOTTOMRIGHT", WhoFrame, "BOTTOMRIGHT", -25, 78)
    if WhoListScrollFrameScrollBar then
        WhoListScrollFrameScrollBar:ClearAllPoints()
        WhoListScrollFrameScrollBar:SetWidth(12)
        WhoListScrollFrameScrollBar:SetPoint("TOPLEFT", WhoListScrollFrame, "TOPRIGHT", 3, -15)
        WhoListScrollFrameScrollBar:SetPoint("BOTTOMLEFT", WhoListScrollFrame, "BOTTOMRIGHT", 3, 15)
    end
    if WhoFrameEditBox then
        WhoFrameEditBox:ClearAllPoints()
        WhoFrameEditBox:SetPoint("BOTTOMLEFT", WhoFrame, "BOTTOMLEFT", 15, 42)
        WhoFrameEditBox:SetWidth(GetClassicWhoColumnsWidth() + GetClassicWhoSearchLeftInset())
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
            button:ClearAllPoints()
            if i == 1 and WhoFrameColumnHeader1 then
                button:SetPoint("TOPLEFT", WhoFrameColumnHeader1, "BOTTOMLEFT", 0, -2)
            elseif i > 1 and _G["WhoFrameButton" .. (i - 1)] then
                button:SetPoint("TOP", _G["WhoFrameButton" .. (i - 1)], "BOTTOM")
            end
            ReskinWhoFrameButton(button)
            LayoutClassicWhoFrameButton(button)
            button:SetWidth(GetClassicWhoColumnsWidth())
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
        WHOS_TO_DISPLAY = CLASSIC_WHO_MEMBERS_TO_DISPLAY
        for i = 18, CLASSIC_WHO_MEMBERS_TO_DISPLAY do
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
            GW.HandleScrollFrameHeaderButton(object, GW.Classic and object == WhoFrameColumnHeader4)
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
