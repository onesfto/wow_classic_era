---@class GW2
local GW = select(2, ...)

-- 标题栏左侧羽毛图标，沿用 GW2UI 任务日志图标。
local ICON = "Interface/AddOns/GW2_UI/textures/character/questlog-window-icon.png"
-- 技能等级条使用的 GW2UI 状态条贴图。
local STATUS_BAR = "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar"
-- 技能等级条颜色，RGB；当前是浅黄色。
local RANK_BAR_R, RANK_BAR_G, RANK_BAR_B = 0.941, 0.938, 0.637

-- 整个专业面板宽高。
local PANEL_WIDTH = 714
local PANEL_HEIGHT = 487
-- 左侧配方列表框、右侧详情框宽度。
local LIST_WIDTH = 303
local DETAIL_WIDTH = 303
-- 左侧配方列表框高度；右侧详情框跟随左侧高度，保证两边框大小一致。
local LIST_HEIGHT = 330
local DETAIL_HEIGHT = LIST_HEIGHT
-- 左侧配方列表框、右侧详情框的 X 位置；数值越大越往右。
local LIST_X = 20
local DETAIL_X = 357
-- 左侧配方列表框的 Y 位置；右侧详情框跟随左侧 Y，保证上下对齐。
local LIST_Y = -75
local DETAIL_Y = LIST_Y
-- 顶部控件行基础 Y 位置，主要给技能条/下拉框对齐时参考。
local CONTROL_Y = -72
-- 技能等级条位置；RANK_X 数值越大越往右，RANK_Y 数值越大越往上。
local RANK_X = LIST_X + 2
local RANK_Y = CONTROL_Y + 25

-- 提前声明布局函数，下面的刷新队列会先引用它。
local LayoutTradeSkillFrame
-- 左侧列表最多显示多少行；超出的内容交给滚动条。
local TARGET_TRADE_SKILLS_DISPLAYED = 19
local TARGET_CRAFTS_DISPLAYED = 19

local function HideRegion(region)
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

local function ShowRegion(region)
    if region and region.Show then
        region:Show()
        if region.SetAlpha then region:SetAlpha(1) end
    end
end

local function HideRegionKeepTexture(region)
    if region and region.Hide then
        region:Hide()
        if region.SetAlpha then region:SetAlpha(0) end
        if region.EnableMouse then region:EnableMouse(false) end
    end
end

local function HideFrameTextures(frame)
    if not frame then return end

    frame:GwStripTextures()

    if frame.GetRegions then
        for _, region in pairs({frame:GetRegions()}) do
            if region.GetObjectType and region:GetObjectType() == "Texture" then
                HideRegion(region)
            end
        end
    end
end

local function SkinCloseButton(button, frame)
    if not button then return end

    button:GwStripTextures()
    button:ClearAllPoints()
    button:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -5, -3)
    button:GwSkinButton(true)
    button:SetSize(20, 20)
end

local function SkinActionButton(button)
    if not button then return end

    button:GwStripTextures()
    button:GwSkinButton(false, true)
end

local function SkinScrollPanel(scrollFrame, scrollBar)
    if not scrollFrame then return end

    scrollFrame:GwStripTextures()
    scrollFrame:GwSkinScrollFrame()
    scrollFrame:GwCreateBackdrop(GW.BackdropTemplates.OnlyBorder, true, 2, 2)

    if scrollBar then
        scrollBar:GwSkinScrollBar()
    end
end

local function SkinRankFrame(rankFrame)
    if not rankFrame then return end

    rankFrame:GwStripTextures()
    rankFrame:SetStatusBarTexture(STATUS_BAR)
    rankFrame:SetStatusBarColor(RANK_BAR_R, RANK_BAR_G, RANK_BAR_B)
    rankFrame:GwCreateBackdrop(GW.BackdropTemplates.StatusBar, true)

    local name = rankFrame.GetName and rankFrame:GetName()
    HideRegion(name and _G[name .. "SkillName"])
end

local function HideRankSkillName(rankFrame)
    local name = rankFrame and rankFrame.GetName and rankFrame:GetName()
    HideRegion(name and _G[name .. "SkillName"])
end

local function UpdateRankText(fontString)
    if not fontString or not fontString.GetText or fontString.gwTradeSkillUpdatingRankText then return end

    local text = fontString:GetText()
    local rankText = text and text:match("(%d+%s*/%s*%d+)")
    if rankText then
        fontString.gwTradeSkillUpdatingRankText = true
        fontString:SetText(rankText:gsub("%s+", ""))
        fontString.gwTradeSkillUpdatingRankText = nil
    end
end

local function SetRankText(fontString, currentRank, maxRank)
    if not fontString or not currentRank or not maxRank then return end

    fontString.gwTradeSkillUpdatingRankText = true
    fontString:SetText(currentRank .. "/" .. maxRank)
    fontString.gwTradeSkillUpdatingRankText = nil
end

local function SkinRankText(fontString, currentRank, maxRank)
    if not fontString then return end

    if fontString.SetTextColor then
        fontString:SetTextColor(1, 1, 1)
    end
    SetRankText(fontString, currentRank, maxRank)
    UpdateRankText(fontString)

    if not fontString.gwTradeSkillRankTextHooked then
        hooksecurefunc(fontString, "SetText", UpdateRankText)
        fontString.gwTradeSkillRankTextHooked = true
    end
end

local function SkinDropdown(dropdown)
    if not dropdown or dropdown.gwTradeSkillSkinned then return end

    local frameName = dropdown.GetName and dropdown:GetName()
    local button = dropdown.Button or frameName and (_G[frameName .. "Button"] or _G[frameName .. "_Button"])
    if button then
        dropdown:GwSkinDropDownMenu()
        dropdown.gwTradeSkillSkinned = true
    end
end

local function ClampFrameWithHeader(frame)
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

local function MakeFrameMovable(frame)
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

local function SetupHeader(frame, titleText, detailFrames)
    if frame.gwTradeSkillHeaderReady then return end

    GW.CreateFrameHeaderWithBody(frame, titleText, ICON, detailFrames, nil, nil, true)
    frame.gwTradeSkillHeaderReady = true
end

local function SetSearchBoxPoint(editBox, relativeFrame, x, y)
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

local function SkinQuantityInput(editBox)
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

local function SkinQuantityButton(button, direction)
    if not button then return end

    button:GwStripTextures()
    button:SetSize(20, 20)

    if GW.HandleNextPrevButton then
        GW.HandleNextPrevButton(button, direction)
    end
end

local function GetNamedRegion(frame, suffix)
    local name = frame and frame.GetName and frame:GetName()
    return name and _G[name .. suffix]
end

local function HideNamedRegion(frame, suffix)
    HideRegion(GetNamedRegion(frame, suffix))
end

local function HideFilterCheckButton(button)
    if not button then return end

    HideRegion(button)
    HideRegion(button.GetNormalTexture and button:GetNormalTexture())
    HideRegion(button.GetCheckedTexture and button:GetCheckedTexture())
    HideRegion(button.GetDisabledTexture and button:GetDisabledTexture())
    HideRegion(button.GetHighlightTexture and button:GetHighlightTexture())
    HideNamedRegion(button, "Text")
    HideNamedRegion(button, "Left")
    HideNamedRegion(button, "Right")
    HideNamedRegion(button, "Middle")
    HideNamedRegion(button, "Checked")
    HideNamedRegion(button, "NormalTexture")
    HideNamedRegion(button, "DisabledTexture")
    HideNamedRegion(button, "Highlight")
end

local function IsRegionInFrameArea(region, parent, minX, maxX, minY, maxY)
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

local function HideLeftSquareArtifacts(frame)
    if not frame or not frame.GetChildren then return end

    local minX, maxX = 18, 82
    local minY, maxY = -68, -142

    if frame.GetRegions then
        for _, region in pairs({frame:GetRegions()}) do
            if region.GetObjectType and region:GetObjectType() == "Texture" and IsRegionInFrameArea(region, frame, minX, maxX, minY, maxY) then
                HideRegion(region)
            end
        end
    end

    for _, child in pairs({frame:GetChildren()}) do
        if child ~= TradeSkillCollapseAllButton and child ~= CraftCollapseAllButton and IsRegionInFrameArea(child, frame, minX, maxX, minY, maxY) then
            HideRegion(child)
        end

        if child.GetRegions then
            for _, region in pairs({child:GetRegions()}) do
                if region.GetObjectType and region:GetObjectType() == "Texture" and IsRegionInFrameArea(region, frame, minX, maxX, minY, maxY) then
                    HideRegion(region)
                end
            end
        end
    end
end

local function SetFontStringPoint(fontString, relativeFrame, x, y, width)
    if not fontString or not relativeFrame then return end

    ShowRegion(fontString)
    fontString:ClearAllPoints()
    fontString:SetPoint("TOPLEFT", relativeFrame, "TOPLEFT", x, y)
    if fontString.SetWidth and width then
        fontString:SetWidth(width)
    end
    if fontString.SetJustifyH then
        fontString:SetJustifyH("LEFT")
    end
end

local function HideProductionIcon(icon)
    if not icon then return end

    HideRegion(icon)
    HideRegionKeepTexture(icon.Icon or icon.icon or GetNamedRegion(icon, "IconTexture"))
    HideRegionKeepTexture(icon.GetNormalTexture and icon:GetNormalTexture())
    HideNamedRegion(icon, "NameFrame")
    HideNamedRegion(icon, "SlotFrame")
    HideNamedRegion(icon, "Stock")
    HideNamedRegion(icon, "Count")
end

local function LayoutProductionIcon(icon, detailFrame)
    if not icon or not detailFrame then return end

    if icon.SetParent then
        icon:SetParent(detailFrame)
    end
    icon:ClearAllPoints()
    icon:SetPoint("TOPLEFT", detailFrame, "TOPLEFT", 12, -12)
    icon:SetSize(40, 40)
    icon:SetAlpha(1)
    icon:Show()

    local iconTexture = icon.Icon or icon.icon or GetNamedRegion(icon, "IconTexture")
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

    HideNamedRegion(icon, "NameFrame")
    HideNamedRegion(icon, "SlotFrame")
    HideNamedRegion(icon, "Stock")
    HideNamedRegion(icon, "Count")
end

local function HasTradeSkillSelection()
    local index = GetTradeSkillSelectionIndex and GetTradeSkillSelectionIndex()
    if not index or index == 0 then return false end

    local _, skillType = GetTradeSkillInfo(index)
    return skillType ~= "header"
end

local function HasCraftSelection()
    local index = GetCraftSelectionIndex and GetCraftSelectionIndex()
    if not index or index == 0 then return false end

    local _, _, skillType = GetCraftInfo(index)
    return skillType ~= "header"
end

local function LayoutTradeSkillDetailHeader(hasSelection)
    if not TradeSkillDetailScrollFrame then return end

    if not hasSelection then
        HideRegion(TradeSkillSkillName)
        HideRegion(TradeSkillDescription)
        HideRegion(TradeSkillReagentLabel)
        return
    end

    SetFontStringPoint(TradeSkillSkillName, TradeSkillDetailScrollFrame, 60, -14, DETAIL_WIDTH - 72)
    SetFontStringPoint(TradeSkillDescription, TradeSkillDetailScrollFrame, 60, -35, DETAIL_WIDTH - 72)
    SetFontStringPoint(TradeSkillReagentLabel, TradeSkillDetailScrollFrame, 12, -69, DETAIL_WIDTH - 24)
end

local function LayoutCraftDetailHeader(hasSelection)
    if not CraftDetailScrollFrame then return end

    if not hasSelection then
        HideRegion(CraftName)
        HideRegion(CraftDescription)
        HideRegion(CraftReagentLabel)
        return
    end

    SetFontStringPoint(CraftName, CraftDetailScrollFrame, 60, -14, DETAIL_WIDTH - 72)
    SetFontStringPoint(CraftDescription, CraftDetailScrollFrame, 60, -35, DETAIL_WIDTH - 72)
    SetFontStringPoint(CraftReagentLabel, CraftDetailScrollFrame, 12, -69, DETAIL_WIDTH - 24)
end

local function ExtendTradeSkillListButtons()
    if not TradeSkillFrame or not TRADE_SKILLS_DISPLAYED or TRADE_SKILLS_DISPLAYED >= TARGET_TRADE_SKILLS_DISPLAYED then return end

    local oldTradeSkillsDisplayed = TRADE_SKILLS_DISPLAYED
    for i = 2, oldTradeSkillsDisplayed do
        local button = _G["TradeSkillSkill" .. i]
        local previousButton = _G["TradeSkillSkill" .. (i - 1)]
        if button and previousButton then
            button:ClearAllPoints()
            button:SetPoint("TOPLEFT", previousButton, "BOTTOMLEFT", 0, 1)
        end
    end

    _G.TRADE_SKILLS_DISPLAYED = TARGET_TRADE_SKILLS_DISPLAYED
    for i = oldTradeSkillsDisplayed + 1, TRADE_SKILLS_DISPLAYED do
        local previousButton = _G["TradeSkillSkill" .. (i - 1)]
        if previousButton and not _G["TradeSkillSkill" .. i] then
            local button = CreateFrame("Button", "TradeSkillSkill" .. i, TradeSkillFrame, "TradeSkillSkillButtonTemplate")
            button:SetID(i)
            button:Hide()
            button:ClearAllPoints()
            button:SetPoint("TOPLEFT", previousButton, "BOTTOMLEFT", 0, 1)
        end
    end
end

local function ExtendCraftListButtons()
    if not CraftFrame or not CRAFTS_DISPLAYED or CRAFTS_DISPLAYED >= TARGET_CRAFTS_DISPLAYED then return end

    local oldCraftsDisplayed = CRAFTS_DISPLAYED
    for i = 2, oldCraftsDisplayed do
        local button = _G["Craft" .. i]
        local previousButton = _G["Craft" .. (i - 1)]
        local cost = _G["Craft" .. i .. "Cost"]
        if button and previousButton then
            button:ClearAllPoints()
            button:SetPoint("TOPLEFT", previousButton, "BOTTOMLEFT", 0, 1)
        end
        if cost and button then
            cost:ClearAllPoints()
            cost:SetPoint("RIGHT", button, "RIGHT", -30, 0)
        end
    end

    _G.CRAFTS_DISPLAYED = TARGET_CRAFTS_DISPLAYED
    for i = oldCraftsDisplayed + 1, CRAFTS_DISPLAYED do
        local previousButton = _G["Craft" .. (i - 1)]
        if previousButton and not _G["Craft" .. i] then
            local button = CreateFrame("Button", "Craft" .. i, CraftFrame, "CraftButtonTemplate")
            button:SetID(i)
            button:Hide()
            button:ClearAllPoints()
            button:SetPoint("TOPLEFT", previousButton, "BOTTOMLEFT", 0, 1)
        end

        local button = _G["Craft" .. i]
        local cost = _G["Craft" .. i .. "Cost"]
        if cost and button then
            cost:ClearAllPoints()
            cost:SetPoint("RIGHT", button, "RIGHT", -30, 0)
        end
    end
end

local function LayoutTradeSkillButtons()
    for i = 1, TRADE_SKILLS_DISPLAYED or 0 do
        local button = _G["TradeSkillSkill" .. i]
        if button then
            if i > TARGET_TRADE_SKILLS_DISPLAYED then
                button:Hide()
            end
            button:SetWidth(LIST_WIDTH - 18)
            if GW.UpdateCollapseTexture and button.GetNormalTexture then
                if not button.gwTradeSkillCollapseHooked then
                    hooksecurefunc(button, "SetNormalTexture", GW.UpdateCollapseTexture)
                    button.gwTradeSkillCollapseHooked = true
                end

                local normalTexture = button:GetNormalTexture()
                if normalTexture and normalTexture.GetTexture then
                    GW.UpdateCollapseTexture(button, normalTexture:GetTexture())
                    normalTexture:SetSize(14, 14)
                end
            end
        end
    end

    if TradeSkillHighlightFrame then
        TradeSkillHighlightFrame:SetWidth(LIST_WIDTH - 18)
        TradeSkillHighlightFrame.SetWidth = GW.NoOp
    end
end

local function LayoutCraftButtons()
    for i = TARGET_CRAFTS_DISPLAYED + 1, CRAFTS_DISPLAYED or 0 do
        local button = _G["Craft" .. i]
        if button then
            button:Hide()
        end
    end
end

local function QueueTradeSkillLayout()
    LayoutTradeSkillFrame()
    LayoutTradeSkillButtons()

    if C_Timer then
        C_Timer.After(0.01, function()
            LayoutTradeSkillFrame()
            LayoutTradeSkillButtons()
        end)
    end
end

function LayoutTradeSkillFrame()
    if not TradeSkillFrame then return end

    ClampFrameWithHeader(TradeSkillFrame)
    HideFilterCheckButton(TradeSkillFrameAvailableFilterCheckButton)
    HideLeftSquareArtifacts(TradeSkillFrame)

    TradeSkillFrame:SetSize(PANEL_WIDTH, PANEL_HEIGHT)
    if UIPanelWindows and UIPanelWindows.TradeSkillFrame then
        UIPanelWindows.TradeSkillFrame.width = PANEL_WIDTH
        UIPanelWindows.TradeSkillFrame.height = PANEL_HEIGHT
    end

    if TradeSkillListScrollFrame then
        TradeSkillListScrollFrame:ClearAllPoints()
        TradeSkillListScrollFrame:SetPoint("TOPLEFT", TradeSkillFrame, "TOPLEFT", LIST_X, LIST_Y)
        TradeSkillListScrollFrame:SetSize(LIST_WIDTH, LIST_HEIGHT)
    end

    if TradeSkillDetailScrollFrame then
        TradeSkillDetailScrollFrame:ClearAllPoints()
        TradeSkillDetailScrollFrame:SetPoint("TOPLEFT", TradeSkillFrame, "TOPLEFT", DETAIL_X, DETAIL_Y)
        TradeSkillDetailScrollFrame:SetSize(DETAIL_WIDTH, DETAIL_HEIGHT)
        local hasSelection = HasTradeSkillSelection()
        if hasSelection then
            LayoutProductionIcon(TradeSkillSkillIcon, TradeSkillDetailScrollFrame)
        else
            HideProductionIcon(TradeSkillSkillIcon)
        end
        LayoutTradeSkillDetailHeader(hasSelection)
    end

    if TradeSkillRankFrame then
        TradeSkillRankFrame:ClearAllPoints()
        TradeSkillRankFrame:SetPoint("TOPLEFT", TradeSkillFrame, "TOPLEFT", RANK_X, RANK_Y)
        TradeSkillRankFrame:SetSize(240, 18)
        TradeSkillRankFrame:SetStatusBarColor(RANK_BAR_R, RANK_BAR_G, RANK_BAR_B)
        HideRankSkillName(TradeSkillRankFrame)
    end
    if TradeSkillRankFrameSkillRank and TradeSkillRankFrame then
        local _, currentRank, maxRank = GetTradeSkillLine and GetTradeSkillLine()
        TradeSkillRankFrameSkillRank:ClearAllPoints()
        TradeSkillRankFrameSkillRank:SetPoint("CENTER", TradeSkillRankFrame, "CENTER", 0, 0)
        SkinRankText(TradeSkillRankFrameSkillRank, currentRank, maxRank)
    end

    local subClassDropDown = TradeSkillSubClassDropDown or TradeSkillSubClassDropdown
    local invSlotDropDown = TradeSkillInvSlotDropDown or TradeSkillInvSlotDropdown
    if subClassDropDown then
        subClassDropDown:ClearAllPoints()
        subClassDropDown:SetPoint("TOPLEFT", TradeSkillFrame, "TOPLEFT", DETAIL_X - 5, RANK_Y)
    end
    if invSlotDropDown then
        invSlotDropDown:ClearAllPoints()
        invSlotDropDown:SetPoint("LEFT", subClassDropDown or TradeSkillFrame, subClassDropDown and "RIGHT" or "TOPLEFT", subClassDropDown and 10 or DETAIL_X + 150, subClassDropDown and 0 or RANK_Y)
    end

    HideFilterCheckButton(TradeSkillFrameAvailableFilterCheckButton)
    HideLeftSquareArtifacts(TradeSkillFrame)

    SetSearchBoxPoint(TradeSkillFrameEditBox or TradeSkillFrameSearchBox or TradeSearchInputBox, TradeSkillFrame, LIST_X + 115, -74)

    if TradeSkillCollapseAllButton and TradeSkillListScrollFrame then
        TradeSkillCollapseAllButton:ClearAllPoints()
        TradeSkillCollapseAllButton:SetPoint("BOTTOMLEFT", TradeSkillListScrollFrame.backdrop or TradeSkillListScrollFrame, "TOPLEFT", 2, 9)
    end
    if TradeSkillHighlightFrame then
        TradeSkillHighlightFrame:SetWidth(LIST_WIDTH - 18)
    end

    if TradeSkillCreateAllButton and TradeSkillCreateButton and TradeSkillCancelButton and TradeSkillDetailScrollFrame then
        TradeSkillCreateAllButton:SetWidth(92)
        TradeSkillCreateButton:SetWidth(72)
        TradeSkillCancelButton:SetWidth(71)

        TradeSkillCreateAllButton:ClearAllPoints()
        TradeSkillCreateAllButton:SetPoint("TOPLEFT", TradeSkillDetailScrollFrame, "BOTTOMLEFT", 0, -8)
        if TradeSkillDecrementButton and TradeSkillInputBox and TradeSkillIncrementButton then
            TradeSkillDecrementButton:ClearAllPoints()
            TradeSkillDecrementButton:SetPoint("LEFT", TradeSkillCreateAllButton, "RIGHT", 4, 0)
            TradeSkillInputBox:ClearAllPoints()
            TradeSkillInputBox:SetPoint("LEFT", TradeSkillDecrementButton, "RIGHT", 1, 0)
            TradeSkillIncrementButton:ClearAllPoints()
            TradeSkillIncrementButton:SetPoint("LEFT", TradeSkillInputBox, "RIGHT", 1, 0)
            TradeSkillCreateButton:ClearAllPoints()
            TradeSkillCreateButton:SetPoint("LEFT", TradeSkillIncrementButton, "RIGHT", 4, 0)
        else
            TradeSkillCreateButton:ClearAllPoints()
            TradeSkillCreateButton:SetPoint("LEFT", TradeSkillCreateAllButton, "RIGHT", 0, 0)
        end
        TradeSkillCancelButton:ClearAllPoints()
        TradeSkillCancelButton:SetPoint("LEFT", TradeSkillCreateButton, "RIGHT", 0, 0)
    elseif TradeSkillCreateButton and TradeSkillCancelButton and TradeSkillDetailScrollFrame then
        TradeSkillCreateButton:SetWidth(159)
        TradeSkillCancelButton:SetWidth(159)

        TradeSkillCreateButton:ClearAllPoints()
        TradeSkillCreateButton:SetPoint("TOPLEFT", TradeSkillDetailScrollFrame, "BOTTOMLEFT", 0, -8)
        TradeSkillCancelButton:ClearAllPoints()
        TradeSkillCancelButton:SetPoint("LEFT", TradeSkillCreateButton, "RIGHT", 0, 0)
    end

    SkinCloseButton(TradeSkillFrameCloseButton or TradeSkillFrame.CloseButton, TradeSkillFrame)
end

local function SkinTradeSkillFrame()
    if not TradeSkillFrame then return end

    if not TradeSkillFrame.gwTradeSkillSkinned then
        TradeSkillFrame.gwTradeSkillSkinned = true

        HideFrameTextures(TradeSkillFrame)
        HideFrameTextures(TradeSkillListScrollFrame)
        HideFrameTextures(TradeSkillDetailScrollFrame)
        HideFrameTextures(TradeSkillDetailScrollChildFrame)

        HideRegion(TradeSkillFramePortrait)
        HideRegion(TradeSkillFrame.portrait)
        HideRegion(TradeSkillRankFrameBorder)
        HideRegion(TradeSkillRankFrameBackground)
        HideRegion(TradeSkillExpandTabLeft)
        HideRegion(TradeSkillExpandTabRight)
        HideRegion(TradeSkillSkillBorderLeft)
        HideRegion(TradeSkillHorizontalBarLeft)
        HideFilterCheckButton(TradeSkillFrameAvailableFilterCheckButton)

        SetupHeader(TradeSkillFrame, TradeSkillFrameTitleText or TradeSkillFrame.TitleText, {TradeSkillListScrollFrame, TradeSkillDetailScrollFrame})
        MakeFrameMovable(TradeSkillFrame)

        SkinRankFrame(TradeSkillRankFrame)
        SkinRankText(TradeSkillRankFrameSkillRank)
        SkinScrollPanel(TradeSkillListScrollFrame, TradeSkillListScrollFrameScrollBar)
        SkinScrollPanel(TradeSkillDetailScrollFrame, TradeSkillDetailScrollFrameScrollBar)

        SkinActionButton(TradeSkillCreateAllButton)
        SkinActionButton(TradeSkillCreateButton)
        SkinActionButton(TradeSkillCancelButton)
        SkinCloseButton(TradeSkillFrameCloseButton or TradeSkillFrame.CloseButton, TradeSkillFrame)
        SkinQuantityInput(TradeSkillInputBox)
        SkinQuantityButton(TradeSkillDecrementButton, "left")
        SkinQuantityButton(TradeSkillIncrementButton, "right")

        ExtendTradeSkillListButtons()

        SkinDropdown(TradeSkillSubClassDropDown or TradeSkillSubClassDropdown)
        SkinDropdown(TradeSkillInvSlotDropDown or TradeSkillInvSlotDropdown)

        if TradeSkillCollapseAllButton and TradeSkillCollapseAllButton.SetNormalTexture then
            hooksecurefunc(TradeSkillCollapseAllButton, "SetNormalTexture", GW.UpdateCollapseTexture)
            GW.UpdateCollapseTexture(TradeSkillCollapseAllButton, TradeSkillCollapseAllButton:GetNormalTexture():GetTexture())
            TradeSkillCollapseAllButton:GwStripTextures()
            TradeSkillCollapseAllButton:ClearHighlightTexture()
            if TradeSkillCollapseAllButton:GetNormalTexture() then
                TradeSkillCollapseAllButton:GetNormalTexture():SetSize(16, 16)
            end
        end

        if _G.TradeSkillFrame_Update then
            hooksecurefunc("TradeSkillFrame_Update", QueueTradeSkillLayout)
        end
        if _G.TradeSkillFrame_SetSelection then
            hooksecurefunc("TradeSkillFrame_SetSelection", QueueTradeSkillLayout)
        end
        if _G.TradeSkillCollapseAllButton_OnClick then
            hooksecurefunc("TradeSkillCollapseAllButton_OnClick", QueueTradeSkillLayout)
        end

        TradeSkillFrame:HookScript("OnShow", function()
            QueueTradeSkillLayout()
        end)
    end

    QueueTradeSkillLayout()
end

local function LayoutCraftFrame()
    if not CraftFrame then return end

    ClampFrameWithHeader(CraftFrame)
    HideFilterCheckButton(CraftFrameAvailableFilterCheckButton)
    HideLeftSquareArtifacts(CraftFrame)

    CraftFrame:SetSize(PANEL_WIDTH, PANEL_HEIGHT)
    if UIPanelWindows and UIPanelWindows.CraftFrame then
        UIPanelWindows.CraftFrame.width = PANEL_WIDTH
        UIPanelWindows.CraftFrame.height = PANEL_HEIGHT
    end

    if CraftListScrollFrame then
        CraftListScrollFrame:ClearAllPoints()
        CraftListScrollFrame:SetPoint("TOPLEFT", CraftFrame, "TOPLEFT", LIST_X, LIST_Y)
        CraftListScrollFrame:SetSize(LIST_WIDTH, LIST_HEIGHT)
    end

    if CraftDetailScrollFrame then
        CraftDetailScrollFrame:ClearAllPoints()
        CraftDetailScrollFrame:SetPoint("TOPLEFT", CraftFrame, "TOPLEFT", DETAIL_X, DETAIL_Y)
        CraftDetailScrollFrame:SetSize(DETAIL_WIDTH, DETAIL_HEIGHT)
        local hasSelection = HasCraftSelection()
        if hasSelection then
            LayoutProductionIcon(CraftIcon, CraftDetailScrollFrame)
        else
            HideProductionIcon(CraftIcon)
        end
        LayoutCraftDetailHeader(hasSelection)
    end

    if CraftRankFrame then
        CraftRankFrame:ClearAllPoints()
        CraftRankFrame:SetPoint("TOPLEFT", CraftFrame, "TOPLEFT", RANK_X, RANK_Y)
        CraftRankFrame:SetSize(240, 18)
        CraftRankFrame:SetStatusBarColor(RANK_BAR_R, RANK_BAR_G, RANK_BAR_B)
        HideRankSkillName(CraftRankFrame)
    end
    if CraftRankFrameSkillRank and CraftRankFrame then
        local _, currentRank, maxRank = GetCraftDisplaySkillLine and GetCraftDisplaySkillLine()
        CraftRankFrameSkillRank:ClearAllPoints()
        CraftRankFrameSkillRank:SetPoint("CENTER", CraftRankFrame, "CENTER", 0, 0)
        SkinRankText(CraftRankFrameSkillRank, currentRank, maxRank)
    end

    local dropdown = CraftFrameFilterDropDown or CraftFrameFilterDropdown or CraftFrame.Dropdown
    if dropdown then
        dropdown:ClearAllPoints()
        dropdown:SetPoint("TOPLEFT", CraftFrame, "TOPLEFT", DETAIL_X - 5, RANK_Y)
    end

    HideFilterCheckButton(CraftFrameAvailableFilterCheckButton)
    HideLeftSquareArtifacts(CraftFrame)

    if CraftFramePointsLabel then
        CraftFramePointsLabel:ClearAllPoints()
        CraftFramePointsLabel:SetPoint("TOPLEFT", CraftFrame, "TOPLEFT", LIST_X + 310, -46)
    end
    if CraftFramePointsText and CraftFramePointsLabel then
        CraftFramePointsText:ClearAllPoints()
        CraftFramePointsText:SetPoint("LEFT", CraftFramePointsLabel, "RIGHT", 3, 0)
    end

    if CraftCollapseAllButton and CraftListScrollFrame then
        CraftCollapseAllButton:ClearAllPoints()
        CraftCollapseAllButton:SetPoint("BOTTOMLEFT", CraftListScrollFrame.backdrop or CraftListScrollFrame, "TOPLEFT", 2, 9)
    end
    if CraftHighlightFrame then
        CraftHighlightFrame:SetWidth(LIST_WIDTH)
    end
    LayoutCraftButtons()

    if CraftCreateButton and CraftCancelButton and CraftDetailScrollFrame then
        CraftCreateButton:SetWidth(159)
        CraftCancelButton:SetWidth(159)

        CraftCreateButton:ClearAllPoints()
        CraftCreateButton:SetPoint("TOPLEFT", CraftDetailScrollFrame, "BOTTOMLEFT", 0, -8)
        CraftCancelButton:ClearAllPoints()
        CraftCancelButton:SetPoint("LEFT", CraftCreateButton, "RIGHT", 0, 0)
    end

    SkinCloseButton(CraftFrameCloseButton or CraftFrame.CloseButton, CraftFrame)
end

local function SkinCraftFrame()
    if not CraftFrame then return end

    if not CraftFrame.gwTradeSkillSkinned then
        CraftFrame.gwTradeSkillSkinned = true

        HideFrameTextures(CraftFrame)
        HideFrameTextures(CraftListScrollFrame)
        HideFrameTextures(CraftDetailScrollFrame)
        HideFrameTextures(CraftDetailScrollChildFrame)

        HideRegion(CraftFramePortrait)
        HideRegion(CraftFrame.portrait)
        HideRegion(CraftRankFrameBorder)
        HideRegion(CraftRankFrameBackground)
        HideFilterCheckButton(CraftFrameAvailableFilterCheckButton)

        SetupHeader(CraftFrame, CraftFrameTitleText or CraftFrame.TitleText, {CraftListScrollFrame, CraftDetailScrollFrame})
        MakeFrameMovable(CraftFrame)

        SkinRankFrame(CraftRankFrame)
        SkinRankText(CraftRankFrameSkillRank)
        SkinScrollPanel(CraftListScrollFrame, CraftListScrollFrameScrollBar)
        SkinScrollPanel(CraftDetailScrollFrame, CraftDetailScrollFrameScrollBar)

        SkinActionButton(CraftCreateButton)
        SkinActionButton(CraftCancelButton)
        SkinCloseButton(CraftFrameCloseButton or CraftFrame.CloseButton, CraftFrame)
        SkinDropdown(CraftFrameFilterDropDown or CraftFrameFilterDropdown or CraftFrame.Dropdown)
        ExtendCraftListButtons()

        if CraftCollapseAllButton and CraftCollapseAllButton.SetNormalTexture then
            hooksecurefunc(CraftCollapseAllButton, "SetNormalTexture", GW.UpdateCollapseTexture)
            GW.UpdateCollapseTexture(CraftCollapseAllButton, CraftCollapseAllButton:GetNormalTexture():GetTexture())
            CraftCollapseAllButton:GwStripTextures()
            CraftCollapseAllButton:ClearHighlightTexture()
            if CraftCollapseAllButton:GetNormalTexture() then
                CraftCollapseAllButton:GetNormalTexture():SetSize(16, 16)
            end
        end

        CraftFrame:HookScript("OnShow", function()
            LayoutCraftFrame()
            if C_Timer then
                C_Timer.After(0.05, LayoutCraftFrame)
            end
        end)
    end

    LayoutCraftFrame()
end

local function LoadTradeSkillFrameSkin()
    local f = CreateFrame("Frame")
    f:RegisterEvent("ADDON_LOADED")
    f:SetScript("OnEvent", function(_, _, addon)
        if addon == "Blizzard_TradeSkillUI" then
            SkinTradeSkillFrame()
        elseif addon == "Blizzard_CraftUI" then
            SkinCraftFrame()
        end
    end)

    local isAddOnLoaded = C_AddOns and C_AddOns.IsAddOnLoaded or IsAddOnLoaded
    if isAddOnLoaded and isAddOnLoaded("Blizzard_TradeSkillUI") then
        SkinTradeSkillFrame()
    end
    if isAddOnLoaded and isAddOnLoaded("Blizzard_CraftUI") then
        SkinCraftFrame()
    end
end
GW.LoadTradeSkillFrameSkin = LoadTradeSkillFrameSkin
