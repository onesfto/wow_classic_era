local _, addonTable = ...
local GW = _G.GW2_ADDON
if not GW then return end
local Utils = addonTable.TradeSkillSkinUtils
local Layout = addonTable.TradeSkillSkinLayout
if not Utils or not Layout then return end
local Skin = {}
addonTable.TradeSkillSkin = Skin
function Skin.SkinTradeSkillFrame()
    if not TradeSkillFrame then return end
    if not TradeSkillFrame.gwTradeSkillSkinned then
        TradeSkillFrame.gwTradeSkillSkinned = true
        Utils.HideFrameTextures(TradeSkillFrame)
        Utils.HideFrameTextures(TradeSkillListScrollFrame)
        Utils.HideFrameTextures(TradeSkillDetailScrollFrame)
        Utils.HideFrameTextures(TradeSkillDetailScrollChildFrame)
        HideRegion(TradeSkillFramePortrait)
        HideRegion(TradeSkillFrame.portrait)
        HideRegion(TradeSkillRankFrameBorder)
        HideRegion(TradeSkillRankFrameBackground)
        HideRegion(TradeSkillExpandTabLeft)
        HideRegion(TradeSkillExpandTabRight)
        HideRegion(TradeSkillSkillBorderLeft)
        HideRegion(TradeSkillHorizontalBarLeft)
        Utils.HideFilterCheckButton(TradeSkillFrameAvailableFilterCheckButton)
        Utils.SetProfessionFrameSize(TradeSkillFrame, "TradeSkillFrame")
        Utils.SetupHeader(TradeSkillFrame, TradeSkillFrameTitleText or TradeSkillFrame.TitleText, {TradeSkillListScrollFrame, TradeSkillDetailScrollFrame})
        Utils.MakeFrameMovable(TradeSkillFrame)
        Utils.SkinRankFrame(TradeSkillRankFrame)
        Utils.SkinRankText(TradeSkillRankFrameSkillRank)
        Utils.SkinScrollPanel(TradeSkillListScrollFrame, TradeSkillListScrollFrameScrollBar)
        Utils.SkinScrollPanel(TradeSkillDetailScrollFrame, TradeSkillDetailScrollFrameScrollBar)
        Utils.SkinActionButton(TradeSkillCreateAllButton)
        Utils.SkinActionButton(TradeSkillCreateButton)
        Utils.SkinActionButton(TradeSkillCancelButton)
        Utils.SkinCloseButton(TradeSkillFrameCloseButton or TradeSkillFrame.CloseButton, TradeSkillFrame)
        Utils.CreateFallbackCloseButton(TradeSkillFrame, "GWTradeSkillCloseButton")
        Utils.SkinQuantityInput(TradeSkillInputBox)
        Utils.SkinQuantityButton(TradeSkillDecrementButton, "left")
        Utils.SkinQuantityButton(TradeSkillIncrementButton, "right")
        ExtendTradeSkillListButtons()
        Utils.SkinDropdown(TradeSkillSubClassDropDown or TradeSkillSubClassDropdown)
        Utils.SkinDropdown(TradeSkillInvSlotDropDown or TradeSkillInvSlotDropdown)
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
            Layout.QueueTradeSkillLayout()
        end)
    end
    Layout.QueueTradeSkillLayout()
end
function Skin.LayoutCraftFrame()
    if not CraftFrame then return end
    ClampFrameWithHeader(CraftFrame)
    Utils.HideFilterCheckButton(CraftFrameAvailableFilterCheckButton)
    Utils.HideLeftSquareArtifacts(CraftFrame)
    Utils.SetProfessionFrameSize(CraftFrame, "CraftFrame")
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
        CraftRankFrame:SetSize(RANK_WIDTH, RANK_HEIGHT)
        CraftRankFrame:SetStatusBarColor(RANK_BAR_R, RANK_BAR_G, RANK_BAR_B)
        Utils.HideRankSkillName(CraftRankFrame)
    end
    if CraftRankFrameSkillRank and CraftRankFrame then
        local _, currentRank, maxRank = GetCraftDisplaySkillLine and GetCraftDisplaySkillLine()
        CraftRankFrameSkillRank:ClearAllPoints()
        CraftRankFrameSkillRank:SetPoint("LEFT", CraftRankFrame, "LEFT", 0, 0)
        CraftRankFrameSkillRank:SetPoint("RIGHT", CraftRankFrame, "RIGHT", -RANK_TEXT_RIGHT_PADDING, 0)
        if CraftRankFrameSkillRank.SetJustifyH then
            CraftRankFrameSkillRank:SetJustifyH("RIGHT")
        end
        Utils.SkinRankText(CraftRankFrameSkillRank, currentRank, maxRank)
    end
    local dropdown = CraftFrameFilterDropDown or CraftFrameFilterDropdown or CraftFrame.Dropdown
    if dropdown then
        dropdown:ClearAllPoints()
        dropdown:SetPoint("TOPLEFT", CraftFrame, "TOPLEFT", DETAIL_X - 5, RANK_Y)
    end
    Utils.HideFilterCheckButton(CraftFrameAvailableFilterCheckButton)
    Utils.HideLeftSquareArtifacts(CraftFrame)
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
    Utils.SkinCloseButton(CraftFrameCloseButton or CraftFrame.CloseButton, CraftFrame)
    Utils.CreateFallbackCloseButton(CraftFrame, "GWCraftCloseButton")
end
function Skin.SkinCraftFrame()
    if not CraftFrame then return end
    if not CraftFrame.gwTradeSkillSkinned then
        CraftFrame.gwTradeSkillSkinned = true
        Utils.HideFrameTextures(CraftFrame)
        Utils.HideFrameTextures(CraftListScrollFrame)
        Utils.HideFrameTextures(CraftDetailScrollFrame)
        Utils.HideFrameTextures(CraftDetailScrollChildFrame)
        HideRegion(CraftFramePortrait)
        HideRegion(CraftFrame.portrait)
        HideRegion(CraftRankFrameBorder)
        HideRegion(CraftRankFrameBackground)
        Utils.HideFilterCheckButton(CraftFrameAvailableFilterCheckButton)
        Utils.SetProfessionFrameSize(CraftFrame, "CraftFrame")
        Utils.SetupHeader(CraftFrame, CraftFrameTitleText or CraftFrame.TitleText, {CraftListScrollFrame, CraftDetailScrollFrame})
        Utils.MakeFrameMovable(CraftFrame)
        Utils.SkinRankFrame(CraftRankFrame)
        Utils.SkinRankText(CraftRankFrameSkillRank)
        Utils.SkinScrollPanel(CraftListScrollFrame, CraftListScrollFrameScrollBar)
        Utils.SkinScrollPanel(CraftDetailScrollFrame, CraftDetailScrollFrameScrollBar)
        Utils.SkinActionButton(CraftCreateButton)
        Utils.SkinActionButton(CraftCancelButton)
        Utils.SkinCloseButton(CraftFrameCloseButton or CraftFrame.CloseButton, CraftFrame)
        Utils.CreateFallbackCloseButton(CraftFrame, "GWCraftCloseButton")
        Utils.SkinDropdown(CraftFrameFilterDropDown or CraftFrameFilterDropdown or CraftFrame.Dropdown)
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
            Layout.LayoutCraftFrame()
            if C_Timer then
                C_Timer.After(0.05, LayoutCraftFrame)
            end
        end)
    end
    Layout.LayoutCraftFrame()
end
