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
        Utils.HideRegion(TradeSkillFramePortrait)
        Utils.HideRegion(TradeSkillFrame.portrait)
        Utils.HideRegion(TradeSkillRankFrameBorder)
        Utils.HideRegion(TradeSkillRankFrameBackground)
        Utils.HideRegion(TradeSkillExpandTabLeft)
        Utils.HideRegion(TradeSkillExpandTabRight)
        Utils.HideRegion(TradeSkillSkillBorderLeft)
        Utils.HideRegion(TradeSkillHorizontalBarLeft)
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
        Layout.ExtendTradeSkillListButtons()
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
            hooksecurefunc("TradeSkillFrame_Update", Layout.QueueTradeSkillLayout)
        end
        if _G.TradeSkillFrame_SetSelection then
            hooksecurefunc("TradeSkillFrame_SetSelection", Layout.QueueTradeSkillLayout)
        end
        if _G.TradeSkillCollapseAllButton_OnClick then
            hooksecurefunc("TradeSkillCollapseAllButton_OnClick", Layout.QueueTradeSkillLayout)
        end
        TradeSkillFrame:HookScript("OnShow", function()
            Layout.QueueTradeSkillLayout()
        end)
    end
    Layout.QueueTradeSkillLayout()
end
function Skin.SkinCraftFrame()
    if not CraftFrame then return end
    if not CraftFrame.gwTradeSkillSkinned then
        CraftFrame.gwTradeSkillSkinned = true
        Utils.HideFrameTextures(CraftFrame)
        Utils.HideFrameTextures(CraftListScrollFrame)
        Utils.HideFrameTextures(CraftDetailScrollFrame)
        Utils.HideFrameTextures(CraftDetailScrollChildFrame)
        Utils.HideRegion(CraftFramePortrait)
        Utils.HideRegion(CraftFrame.portrait)
        Utils.HideRegion(CraftRankFrameBorder)
        Utils.HideRegion(CraftRankFrameBackground)
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
        Layout.ExtendCraftListButtons()
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
                C_Timer.After(0.05, Layout.LayoutCraftFrame)
            end
        end)
    end
    Layout.LayoutCraftFrame()
end
