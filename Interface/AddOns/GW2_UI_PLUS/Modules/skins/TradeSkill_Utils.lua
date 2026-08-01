local _, addonTable = ...
local GW = _G.GW2_ADDON
if not GW then return end
local Utils = {}
addonTable.TradeSkillSkinUtils = Utils
Utils.ICON = "Interface/AddOns/GW2_UI/textures/character/questlog-window-icon.png"
Utils.STATUS_BAR = "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar"
Utils.RANK_BAR_R, Utils.RANK_BAR_G, Utils.RANK_BAR_B = 0.941, 0.938, 0.637
Utils.PANEL_WIDTH = 714
Utils.PANEL_HEIGHT = 487
Utils.LIST_WIDTH = 303
Utils.DETAIL_WIDTH = 303
Utils.LIST_HEIGHT = 330
Utils.DETAIL_HEIGHT = Utils.LIST_HEIGHT
Utils.LIST_X = 20
Utils.DETAIL_X = 357
Utils.LIST_Y = -75
Utils.DETAIL_Y = Utils.LIST_Y
Utils.CONTROL_Y = -72
Utils.RANK_X = Utils.LIST_X + 1
Utils.RANK_Y = Utils.CONTROL_Y + 25
Utils.RANK_WIDTH = 300
Utils.RANK_HEIGHT = 18
Utils.RANK_TEXT_RIGHT_PADDING = 8
Utils.TARGET_TRADE_SKILLS_DISPLAYED = 19
Utils.TARGET_CRAFTS_DISPLAYED = 19
function Utils.HideRegion(region)
    if region and region.Hide then
        region:Hide()
        if region.SetAlpha then region:SetAlpha(0) end
        if region.SetTexture then region:SetTexture(nil) end
        if region.EnableMouse then region:EnableMouse(false) end
        if region.IsObjectType and region:IsObjectType("Frame") and region.ClearAllPoints and region.SetPoint then
            region:ClearAllPoints()
            region:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", -200, -200)
        end
    end
end
function Utils.ShowRegion(region)
    if region and region.Show then
        region:Show()
        if region.SetAlpha then region:SetAlpha(1) end
    end
end
function Utils.HideRegionKeepTexture(region)
    if region and region.Hide then
        region:Hide()
        if region.SetAlpha then region:SetAlpha(0) end
        if region.EnableMouse then region:EnableMouse(false) end
    end
end
function Utils.HideFrameTextures(frame)
    if not frame then return end
    frame:GwStripTextures()
    if frame.GetRegions then
        for _, region in pairs({frame:GetRegions()}) do
            if region.GetObjectType and region:GetObjectType() == "Texture" then
                Utils.HideRegion(region)
            end
        end
    end
end
function Utils.SkinCloseButton(button, frame)
    if not button or not frame then return end
    button:GwStripTextures()
    button:ClearAllPoints()
    button:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -3)
    button:GwSkinButton(true)
    button:SetSize(20, 20)
    button:SetAlpha(1)
    button:EnableMouse(true)
    button:Show()
    if button.SetFrameLevel and frame.GetFrameLevel then
        button:SetFrameLevel(frame:GetFrameLevel() + 20)
    end
end
function Utils.CreateFallbackCloseButton(frame, buttonName)
    if not frame or not buttonName then return end
    local parent = frame
    local button = _G[buttonName]
    if not button then
        button = CreateFrame("Button", buttonName, parent, "UIPanelCloseButton")
        button:SetScript("OnClick", function()
            frame:Hide()
        end)
    else
        button:SetParent(parent)
    end
    button:ClearAllPoints()
    button:SetPoint("TOPRIGHT", parent, "TOPRIGHT", -5, -3)
    button:GwSkinButton(true)
    button:SetSize(20, 20)
    button:SetAlpha(1)
    button:EnableMouse(true)
    button:Show()
    button:SetFrameStrata("DIALOG")
    if button.SetFrameLevel and parent.GetFrameLevel then
        button:SetFrameLevel(parent:GetFrameLevel() + 100)
    end
end
function Utils.SkinActionButton(button)
    if not button then return end
    button:GwStripTextures()
    button:GwSkinButton(false, true)
end
function Utils.SkinScrollPanel(scrollFrame, scrollBar)
    if not scrollFrame then return end
    scrollFrame:GwStripTextures()
    scrollFrame:GwSkinScrollFrame()
    scrollFrame:GwCreateBackdrop(GW.BackdropTemplates.OnlyBorder, true, 2, 2)
    if scrollBar then
        scrollBar:GwSkinScrollBar()
    end
end
function Utils.SkinRankFrame(rankFrame)
    if not rankFrame then return end
    rankFrame:GwStripTextures()
    rankFrame:SetStatusBarTexture(STATUS_BAR)
    rankFrame:SetStatusBarColor(RANK_BAR_R, RANK_BAR_G, RANK_BAR_B)
    rankFrame:GwCreateBackdrop(GW.BackdropTemplates.StatusBar, true)
    local name = rankFrame.GetName and rankFrame:GetName()
    Utils.HideRegion(name and _G[name .. "SkillName"])
end
function Utils.HideRankSkillName(rankFrame)
    local name = rankFrame and rankFrame.GetName and rankFrame:GetName()
    Utils.HideRegion(name and _G[name .. "SkillName"])
end
function Utils.UpdateRankText(fontString)
    if not fontString or not fontString.GetText or fontString.gwTradeSkillUpdatingRankText then return end
    local text = fontString:GetText()
    local rankText = text and text:match("(%d+%s*/%s*%d+)")
    if rankText then
        fontString.gwTradeSkillUpdatingRankText = true
        fontString:SetText(rankText:gsub("%s+", ""))
        fontString.gwTradeSkillUpdatingRankText = nil
    end
end
function Utils.SetRankText(fontString, currentRank, maxRank)
    if not fontString or not currentRank or not maxRank then return end
    fontString.gwTradeSkillUpdatingRankText = true
    fontString:SetText(currentRank .. "/" .. maxRank)
    fontString.gwTradeSkillUpdatingRankText = nil
end
function Utils.SkinRankText(fontString, currentRank, maxRank)
    if not fontString then return end
    if fontString.SetTextColor then
        fontString:SetTextColor(1, 1, 1)
    end
    if fontString.SetJustifyH then
        fontString:SetJustifyH("RIGHT")
    end
    Utils.SetRankText(fontString, currentRank, maxRank)
    Utils.UpdateRankText(fontString)
    if not fontString.gwTradeSkillRankTextHooked then
        hooksecurefunc(fontString, "SetText", UpdateRankText)
        fontString.gwTradeSkillRankTextHooked = true
    end
end
function Utils.SkinDropdown(dropdown)
    if not dropdown or dropdown.gwTradeSkillSkinned then return end
    dropdown:GwHandleDropDownBox()
    dropdown:SetWidth(150)
    if dropdown.Text then
        dropdown.Text:ClearAllPoints()
        dropdown.Text:SetPoint("LEFT", dropdown, "LEFT", 9, 0)
        dropdown.Text:SetPoint("RIGHT", dropdown.gw2Arrow, "LEFT", -3, 0)
        dropdown.Text:SetHeight(16)
        dropdown.Text:SetJustifyH("CENTER")
    end
    dropdown.gwTradeSkillSkinned = true
end
function Utils.ClampFrameWithHeader(frame)
    if not frame or not frame.GetTop or not UIParent then return end
    local left = frame:GetLeft()
    local top = frame:GetTop()
    local screenTop = UIParent:GetTop()
    if not left or not top or not screenTop then return end
    local headerPadding = 64
    if top > screenTop - headerPadding then
        frame:ClearAllPoints()
        frame:SetPoint("TOPLEFT", UIParent, "TOPLEFT", left, -headerPadding)
    end
end
function Utils.MakeFrameMovable(frame)
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:SetClampedToScreen(true)
    frame:RegisterForDrag("LeftButton")
    frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
        ClampFrameWithHeader(self)
    end)
    if frame.gwHeader then
        frame.gwHeader:EnableMouse(true)
        frame.gwHeader:RegisterForDrag("LeftButton")
        frame.gwHeader:SetScript("OnDragStart", function() frame:StartMoving() end)
        frame.gwHeader:SetScript("OnDragStop", function()
            frame:StopMovingOrSizing()
            ClampFrameWithHeader(frame)
        end)
    end
end
function Utils.SetProfessionFrameSize(frame, panelName)
    if not frame then return end
    frame:SetSize(PANEL_WIDTH, PANEL_HEIGHT)
    if UIPanelWindows and panelName and UIPanelWindows[panelName] then
        UIPanelWindows[panelName].width = PANEL_WIDTH
        UIPanelWindows[panelName].height = PANEL_HEIGHT
    end
end
function Utils.SetupHeader(frame, titleText, detailFrames)
    if frame.gwTradeSkillHeaderReady then return end
    GW.CreateFrameHeaderWithBody(frame, titleText, ICON, detailFrames, nil, nil, true)
    frame.gwTradeSkillHeaderReady = true
end
function Utils.SetSearchBoxPoint(editBox, relativeFrame, x, y)
    if not editBox then return end
    editBox:GwStripTextures()
    if not editBox.gwTradeSkillSkinned then
        local name = editBox.GetName and editBox:GetName()
        GW.SkinTextBox(
            editBox.Middle or name and (_G[name .. "Middle"] or _G[name .. "Mid"]),
            editBox.Left or name and _G[name .. "Left"],
            editBox.Right or name and _G[name .. "Right"],
            nil,
            nil,
            5,
            5,
            nil,
            editBox
        )
        editBox.gwTradeSkillSkinned = true
    end
    editBox:ClearAllPoints()
    editBox:SetPoint("TOPLEFT", relativeFrame, "TOPLEFT", x, y)
    editBox:SetSize(170, 20)
end
function Utils.SkinQuantityInput(editBox)
    if not editBox then return end
    editBox:GwStripTextures()
    if not editBox.gwTradeSkillSkinned then
        local name = editBox.GetName and editBox:GetName()
        GW.SkinTextBox(
            editBox.Middle or name and (_G[name .. "Middle"] or _G[name .. "Mid"]),
            editBox.Left or name and _G[name .. "Left"],
            editBox.Right or name and _G[name .. "Right"],
            nil,
            nil,
            3,
            3,
            nil,
            editBox
        )
        editBox.gwTradeSkillSkinned = true
    end
    editBox:SetSize(28, 20)
    if editBox.SetTextInsets then
        editBox:SetTextInsets(0, 0, 0, 0)
    end
    if editBox.SetJustifyH then
        editBox:SetJustifyH("CENTER")
    end
    if editBox.SetJustifyV then
        editBox:SetJustifyV("MIDDLE")
    end
end
function Utils.SkinQuantityButton(button, direction)
    if not button then return end
    button:GwStripTextures()
    button:SetSize(20, 20)
    if GW.HandleNextPrevButton then
        GW.HandleNextPrevButton(button, direction)
    end
end
function Utils.GetNamedRegion(frame, suffix)
    local name = frame and frame.GetName and frame:GetName()
    return name and _G[name .. suffix]
end
function Utils.HideNamedRegion(frame, suffix)
    Utils.HideRegion(Utils.GetNamedRegion(frame, suffix))
end
function Utils.HideFilterCheckButton(button)
    if not button then return end
    Utils.HideRegion(button)
    Utils.HideRegion(button.GetNormalTexture and button:GetNormalTexture())
    Utils.HideRegion(button.GetCheckedTexture and button:GetCheckedTexture())
    Utils.HideRegion(button.GetDisabledTexture and button:GetDisabledTexture())
    Utils.HideRegion(button.GetHighlightTexture and button:GetHighlightTexture())
    Utils.HideNamedRegion(button, "Text")
    Utils.HideNamedRegion(button, "Left")
    Utils.HideNamedRegion(button, "Right")
    Utils.HideNamedRegion(button, "Middle")
    Utils.HideNamedRegion(button, "Checked")
    Utils.HideNamedRegion(button, "NormalTexture")
    Utils.HideNamedRegion(button, "DisabledTexture")
    Utils.HideNamedRegion(button, "Highlight")
end
function Utils.IsRegionInFrameArea(region, parent, minX, maxX, minY, maxY)
    if not region or not parent or not region.GetLeft or not parent.GetLeft then return false end
    local regionLeft, regionRight = region:GetLeft(), region:GetRight()
    local regionTop, regionBottom = region:GetTop(), region:GetBottom()
    local parentLeft, parentTop = parent:GetLeft(), parent:GetTop()
    if not regionLeft or not regionRight or not regionTop or not regionBottom or not parentLeft or not parentTop then return false end
    local width = regionRight - regionLeft
    local height = regionTop - regionBottom
    if width < 25 or width > 80 or height < 25 or height > 80 then return false end
    local centerX = ((regionLeft + regionRight) / 2) - parentLeft
    local centerY = ((regionTop + regionBottom) / 2) - parentTop
    return centerX >= minX and centerX <= maxX and centerY <= minY and centerY >= maxY
end
function Utils.HideLeftSquareArtifacts(frame)
    if not frame or not frame.GetChildren then return end
    local minX, maxX = 18, 82
    local minY, maxY = -68, -142
    if frame.GetRegions then
        for _, region in pairs({frame:GetRegions()}) do
            if region.GetObjectType and region:GetObjectType() == "Texture" and IsRegionInFrameArea(region, frame, minX, maxX, minY, maxY) then
                Utils.HideRegion(region)
            end
        end
    end
    for _, child in pairs({frame:GetChildren()}) do
        if child ~= TradeSkillCollapseAllButton and child ~= CraftCollapseAllButton and IsRegionInFrameArea(child, frame, minX, maxX, minY, maxY) then
            Utils.HideRegion(child)
        end
        if child.GetRegions then
            for _, region in pairs({child:GetRegions()}) do
                if region.GetObjectType and region:GetObjectType() == "Texture" and IsRegionInFrameArea(region, frame, minX, maxX, minY, maxY) then
                    Utils.HideRegion(region)
                end
            end
        end
    end
end
function Utils.SetFontStringPoint(fontString, relativeFrame, x, y, width)
    if not fontString or not relativeFrame then return end
    Utils.ShowRegion(fontString)
    fontString:ClearAllPoints()
    fontString:SetPoint("TOPLEFT", relativeFrame, "TOPLEFT", x, y)
    if fontString.SetWidth and width then
        fontString:SetWidth(width)
    end
    if fontString.SetJustifyH then
        fontString:SetJustifyH("LEFT")
    end
end
function Utils.HideProductionIcon(icon)
    if not icon then return end
    Utils.HideRegion(icon)
    Utils.HideRegionKeepTexture(icon.Icon or icon.icon or Utils.GetNamedRegion(icon, "IconTexture"))
    Utils.HideRegionKeepTexture(icon.GetNormalTexture and icon:GetNormalTexture())
    Utils.HideNamedRegion(icon, "NameFrame")
    Utils.HideNamedRegion(icon, "SlotFrame")
    Utils.HideNamedRegion(icon, "Stock")
    Utils.HideNamedRegion(icon, "Count")
end
function Utils.LayoutProductionIcon(icon, detailFrame)
    if not icon or not detailFrame then return end
    if icon.SetParent then
        icon:SetParent(detailFrame)
    end
    icon:ClearAllPoints()
    icon:SetPoint("TOPLEFT", detailFrame, "TOPLEFT", 12, -12)
    icon:SetSize(40, 40)
    icon:SetAlpha(1)
    icon:Show()
    local iconTexture = icon.Icon or icon.icon or Utils.GetNamedRegion(icon, "IconTexture")
    if not iconTexture and icon.GetNormalTexture then
        iconTexture = icon:GetNormalTexture()
    end
    if iconTexture then
        iconTexture:ClearAllPoints()
        iconTexture:SetAllPoints(icon)
        iconTexture:SetAlpha(1)
        iconTexture:Show()
        if iconTexture.SetDrawLayer then
            iconTexture:SetDrawLayer("OVERLAY")
        end
    end
    local normalTexture = icon.GetNormalTexture and icon:GetNormalTexture()
    if normalTexture and normalTexture ~= iconTexture then
        normalTexture:ClearAllPoints()
        normalTexture:SetAllPoints(icon)
        normalTexture:SetAlpha(1)
        normalTexture:Show()
    end
    Utils.HideNamedRegion(icon, "NameFrame")
    Utils.HideNamedRegion(icon, "SlotFrame")
    Utils.HideNamedRegion(icon, "Stock")
    Utils.HideNamedRegion(icon, "Count")
end
