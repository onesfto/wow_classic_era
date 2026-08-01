local _, addonTable = ...
local GW = _G.GW2_ADDON
if not GW then return end
local Utils = addonTable.TradeSkillSkinUtils
if not Utils then return end
local Layout = {}
addonTable.TradeSkillSkinLayout = Layout
function Layout.HasTradeSkillSelection()
    local index = GetTradeSkillSelectionIndex and GetTradeSkillSelectionIndex()
    if not index or index == 0 then return false end
    local _, skillType = GetTradeSkillInfo(index)
    return skillType ~= "header"
end
function Layout.HasCraftSelection()
    local index = GetCraftSelectionIndex and GetCraftSelectionIndex()
    if not index or index == 0 then return false end
    local _, _, skillType = GetCraftInfo(index)
    return skillType ~= "header"
end
function Layout.LayoutTradeSkillDetailHeader(hasSelection)
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
function Layout.LayoutCraftDetailHeader(hasSelection)
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
function Layout.ExtendTradeSkillListButtons()
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
function Layout.ExtendCraftListButtons()
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
function Layout.LayoutTradeSkillButtons()
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
function Layout.LayoutCraftButtons()
    for i = TARGET_CRAFTS_DISPLAYED + 1, CRAFTS_DISPLAYED or 0 do
        local button = _G["Craft" .. i]
        if button then
            button:Hide()
        end
    end
end
function Layout.QueueTradeSkillLayout()
    local function RunLayout()
        LayoutTradeSkillFrame()
        LayoutTradeSkillButtons()
    end
    RunLayout()
    if C_Timer then
        C_Timer.After(0, RunLayout)
        C_Timer.After(0.05, RunLayout)
        C_Timer.After(0.2, RunLayout)
    end
end
function LayoutTradeSkillFrame()
    if not TradeSkillFrame then return end
    ClampFrameWithHeader(TradeSkillFrame)
    HideFilterCheckButton(TradeSkillFrameAvailableFilterCheckButton)
    HideLeftSquareArtifacts(TradeSkillFrame)
    SetProfessionFrameSize(TradeSkillFrame, "TradeSkillFrame")
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
        TradeSkillRankFrame:SetSize(RANK_WIDTH, RANK_HEIGHT)
        TradeSkillRankFrame:SetStatusBarColor(RANK_BAR_R, RANK_BAR_G, RANK_BAR_B)
        HideRankSkillName(TradeSkillRankFrame)
    end
    if TradeSkillRankFrameSkillRank and TradeSkillRankFrame then
        local _, currentRank, maxRank = GetTradeSkillLine and GetTradeSkillLine()
        TradeSkillRankFrameSkillRank:ClearAllPoints()
        TradeSkillRankFrameSkillRank:SetPoint("LEFT", TradeSkillRankFrame, "LEFT", 0, 0)
        TradeSkillRankFrameSkillRank:SetPoint("RIGHT", TradeSkillRankFrame, "RIGHT", -RANK_TEXT_RIGHT_PADDING, 0)
        if TradeSkillRankFrameSkillRank.SetJustifyH then
            TradeSkillRankFrameSkillRank:SetJustifyH("RIGHT")
        end
        SkinRankText(TradeSkillRankFrameSkillRank, currentRank, maxRank)
    end
    local subClassDropDown = TradeSkillSubClassDropDown or TradeSkillSubClassDropdown
    local invSlotDropDown = TradeSkillInvSlotDropDown or TradeSkillInvSlotDropdown
    if subClassDropDown then
        subClassDropDown:ClearAllPoints()
        subClassDropDown:SetPoint("TOPLEFT", TradeSkillFrame, "TOPLEFT", DETAIL_X - 4, RANK_Y+3)
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
    CreateFallbackCloseButton(TradeSkillFrame, "GWTradeSkillCloseButton")
end
