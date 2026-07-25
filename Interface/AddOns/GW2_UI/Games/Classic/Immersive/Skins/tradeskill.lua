---@class GW2
local GW = select(2, ...)

local function SkinTradeSkillFrame()
    if not TradeSkillFrame then return end
    if TradeSkillFrame.isSkinned then return end
    TradeSkillFrame.isSkinned = true

    -- Strip blizzard textures
    TradeSkillFrame:GwStripTextures()
    TradeSkillListScrollFrame:GwStripTextures()
    TradeSkillDetailScrollFrame:GwStripTextures()
    TradeSkillRankFrame:GwStripTextures()
    
    if TradeSkillRankFrameBorder then TradeSkillRankFrameBorder:Hide() end
    if TradeSkillRankFrameBackground then TradeSkillRankFrameBackground:Hide() end

    -- Skin the progress bar
    TradeSkillRankFrame:SetStatusBarTexture("Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar")
    TradeSkillRankFrame:GwCreateBackdrop("Transparent")

    -- Hide native portrait permanently so it doesn't reappear on updates
    if TradeSkillFramePortrait and type(TradeSkillFramePortrait) == "table" then
        TradeSkillFramePortrait:Hide()
        TradeSkillFramePortrait:SetTexture(nil)
    end
    if TradeSkillFrame.portrait and type(TradeSkillFrame.portrait) == "table" then
        TradeSkillFrame.portrait:Hide()
        TradeSkillFrame.portrait:SetTexture(nil)
    end

    -- Skin buttons
    for _, btn in pairs({TradeSkillCreateButton, TradeSkillCreateAllButton, TradeSkillCancelButton}) do
        btn:GwStripTextures()
        btn:GwSkinButton(false, true)
    end

    -- Input box
    if TradeSkillInputBox then
        TradeSkillInputBox:GwStripTextures()
        TradeSkillInputBox:GwSkinEditbox()
    end

    -- Relocate Close Button
    TradeSkillFrameCloseButton:GwStripTextures()
    TradeSkillFrameCloseButton:SetPoint("TOPRIGHT", TradeSkillFrame, "TOPRIGHT", -5, -3)
    TradeSkillFrameCloseButton:GwSkinButton(true)
    TradeSkillFrameCloseButton:SetSize(20, 20)

    -- Use GW2 header removed (moved to end of function)
    

    local closeBtn = TradeSkillFrameCloseButton or (TradeSkillFrame and TradeSkillFrame.CloseButton)
    if closeBtn then
        closeBtn:GwStripTextures()
        closeBtn:SetPoint("TOPRIGHT", TradeSkillFrame, "TOPRIGHT", -5, -3)
        closeBtn:GwSkinButton(true)
        closeBtn:SetSize(20, 20)
    end

    -- Make frame draggable
    TradeSkillFrame:EnableMouse(true)
    TradeSkillFrame:SetMovable(true)
    TradeSkillFrame:SetClampedToScreen(true)

    -- Also allow dragging from the frame itself just in case
    TradeSkillFrame:RegisterForDrag("LeftButton")
    TradeSkillFrame:SetScript("OnDragStart", function(self) self:StartMoving() end)
    TradeSkillFrame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

    -- Match Quest Log Scroll Frame Dimensions
    TradeSkillListScrollFrame:SetWidth(303)
    TradeSkillDetailScrollFrame:SetWidth(303)

    -- Skin Scrollbars
    if TradeSkillListScrollFrameScrollBar then TradeSkillListScrollFrameScrollBar:GwSkinScrollBar() end
    if TradeSkillDetailScrollFrameScrollBar then TradeSkillDetailScrollFrameScrollBar:GwSkinScrollBar() end

    -- Fix bottom buttons positioning to perfectly align with scroll frame + scrollbar (303 + 15 = 318)
    if TradeSkillCreateAllButton then
        TradeSkillCreateAllButton:SetWidth(106)
        TradeSkillCreateButton:SetWidth(106)
        TradeSkillCancelButton:SetWidth(106)

        TradeSkillCreateAllButton:ClearAllPoints()
        TradeSkillCreateAllButton:SetPoint("TOPLEFT", TradeSkillDetailScrollFrame, "BOTTOMLEFT", 0, -5)
        TradeSkillCreateButton:ClearAllPoints()
        TradeSkillCreateButton:SetPoint("LEFT", TradeSkillCreateAllButton, "RIGHT", 0, 0)
        TradeSkillCancelButton:ClearAllPoints()
        TradeSkillCancelButton:SetPoint("LEFT", TradeSkillCreateButton, "RIGHT", 0, 0)
    else
        if TradeSkillCreateButton and TradeSkillCancelButton then
            TradeSkillCreateButton:SetWidth(159)
            TradeSkillCancelButton:SetWidth(159)
            TradeSkillCreateButton:ClearAllPoints()
            TradeSkillCreateButton:SetPoint("TOPLEFT", TradeSkillDetailScrollFrame, "BOTTOMLEFT", 0, -5)
            TradeSkillCancelButton:ClearAllPoints()
            TradeSkillCancelButton:SetPoint("LEFT", TradeSkillCreateButton, "RIGHT", 0, 0)
        end
    end

    -- Strip extra Blizzard textures that might cause dark tints
    if TradeSkillDetailScrollChildFrame then TradeSkillDetailScrollChildFrame:GwStripTextures(true) end

    -- Relocate Input Box so it doesn't overlap the new seamless bottom buttons
    local function fixInputBox()
        if TradeSkillInputBox then
            TradeSkillInputBox:ClearAllPoints()
            TradeSkillInputBox:SetPoint("BOTTOMRIGHT", TradeSkillDetailScrollFrame, "BOTTOMRIGHT", -5, 5)
        end
    end
    fixInputBox()
    if _G.TradeSkillFrame_SetSelection then
        hooksecurefunc("TradeSkillFrame_SetSelection", fixInputBox)
    end

    -- Hide native title completely by forcing its text to empty string
    local titleText = TradeSkillFrameTitleText or (TradeSkillFrame and TradeSkillFrame.TitleText)
    if titleText then
        titleText:SetText("")
        titleText:SetAlpha(0)
        hooksecurefunc(titleText, "SetText", function(self, txt)
            if txt and txt ~= "" then
                if TradeSkillFrame.gwHeader and TradeSkillFrame.gwHeader.headerText then
                    TradeSkillFrame.gwHeader.headerText:SetText(txt)
                end
                self:SetText("")
            end
        end)
    end

    -- Use GW2 header (pass a space to force headerText creation)
    GW.CreateFrameHeaderWithBody(TradeSkillFrame, " ", "Interface/AddOns/GW2_UI/textures/character/questlog-window-icon.png", {TradeSkillListScrollFrame, TradeSkillDetailScrollFrame}, nil, nil, false)
    
    if TradeSkillFrame.gwHeader and TradeSkillFrame.gwHeader.headerText then
        TradeSkillFrame.gwHeader.headerText:SetText(TRADE_SKILLS or "炼金术")
    end
    -- Make the GW2 header handle the drag
    if TradeSkillFrame.gwHeader then
        TradeSkillFrame.gwHeader:EnableMouse(true)
        TradeSkillFrame.gwHeader:RegisterForDrag("LeftButton")
        TradeSkillFrame.gwHeader:SetScript("OnDragStart", function() TradeSkillFrame:StartMoving() end)
        TradeSkillFrame.gwHeader:SetScript("OnDragStop", function() TradeSkillFrame:StopMovingOrSizing() end)
    end

    -- Re-add backdrops for scroll frames to match QuestLog exactly
    TradeSkillListScrollFrame:GwCreateBackdrop("Transparent", true, 2, 2)
    TradeSkillDetailScrollFrame:GwCreateBackdrop("Transparent", true, 2, 4)

    -- Dropdowns
    if TradeSkillInvSlotDropDown then TradeSkillInvSlotDropDown:GwSkinDropDownMenu() end
    if TradeSkillSubClassDropDown then TradeSkillSubClassDropDown:GwSkinDropDownMenu() end
end

local function SkinCraftFrame()
    if not CraftFrame then return end
    if CraftFrame.isSkinned then return end
    CraftFrame.isSkinned = true

    -- Strip blizzard textures
    CraftFrame:GwStripTextures()
    CraftListScrollFrame:GwStripTextures()
    CraftDetailScrollFrame:GwStripTextures()
    if CraftRankFrame then
        CraftRankFrame:GwStripTextures()
        CraftRankFrame:SetStatusBarTexture("Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar")
        CraftRankFrame:GwCreateBackdrop("Transparent")
        if CraftRankFrameBorder then CraftRankFrameBorder:Hide() end
        if CraftRankFrameBackground then CraftRankFrameBackground:Hide() end
    end

    -- Hide native portrait permanently so it doesn't reappear on updates
    if CraftFramePortrait and type(CraftFramePortrait) == "table" then
        CraftFramePortrait:Hide()
        CraftFramePortrait:SetTexture(nil)
    end
    if CraftFrame.portrait and type(CraftFrame.portrait) == "table" then
        CraftFrame.portrait:Hide()
        CraftFrame.portrait:SetTexture(nil)
    end

    -- Skin buttons
    for _, btn in pairs({CraftCreateButton, CraftCancelButton}) do
        if btn then
            btn:GwStripTextures()
            btn:GwSkinButton(false, true)
        end
    end

    -- Relocate Close Button
    local craftCloseBtn = CraftFrameCloseButton or (CraftFrame and CraftFrame.CloseButton)
    if craftCloseBtn then
        craftCloseBtn:GwStripTextures()
        craftCloseBtn:SetPoint("TOPRIGHT", CraftFrame, "TOPRIGHT", -5, -3)
        craftCloseBtn:GwSkinButton(true)
        craftCloseBtn:SetSize(20, 20)
    end

    -- Make frame draggable
    CraftFrame:EnableMouse(true)
    CraftFrame:SetMovable(true)
    CraftFrame:SetClampedToScreen(true)

    -- Also allow dragging from the frame itself just in case
    CraftFrame:RegisterForDrag("LeftButton")
    CraftFrame:SetScript("OnDragStart", function(self) self:StartMoving() end)
    CraftFrame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)

    -- Match Quest Log Scroll Frame Dimensions
    CraftListScrollFrame:SetWidth(303)
    CraftDetailScrollFrame:SetWidth(303)

    -- Skin Scrollbars
    if CraftListScrollFrameScrollBar then CraftListScrollFrameScrollBar:GwSkinScrollBar() end
    if CraftDetailScrollFrameScrollBar then CraftDetailScrollFrameScrollBar:GwSkinScrollBar() end

    -- Fix bottom buttons positioning to perfectly align with scroll frame + scrollbar (303 + 15 = 318)
    if CraftCreateButton and CraftCancelButton then
        CraftCreateButton:SetWidth(159)
        CraftCancelButton:SetWidth(159)

        CraftCreateButton:ClearAllPoints()
        CraftCreateButton:SetPoint("TOPLEFT", CraftDetailScrollFrame, "BOTTOMLEFT", 0, -5)
        CraftCancelButton:ClearAllPoints()
        CraftCancelButton:SetPoint("LEFT", CraftCreateButton, "RIGHT", 0, 0)
    end

    -- Hide native title completely by forcing its text to empty string
    local titleText = CraftFrameTitleText or (CraftFrame and CraftFrame.TitleText)
    if titleText then
        titleText:SetText("")
        titleText:SetAlpha(0)
        hooksecurefunc(titleText, "SetText", function(self, txt)
            if txt and txt ~= "" then
                if CraftFrame.gwHeader and CraftFrame.gwHeader.headerText then
                    CraftFrame.gwHeader.headerText:SetText(txt)
                end
                self:SetText("")
            end
        end)
    end

    -- Use GW2 header (pass a space to force headerText creation)
    GW.CreateFrameHeaderWithBody(CraftFrame, " ", "Interface/AddOns/GW2_UI/textures/character/questlog-window-icon.png", {CraftListScrollFrame, CraftDetailScrollFrame}, nil, nil, false)
    
    if CraftFrame.gwHeader and CraftFrame.gwHeader.headerText then
        CraftFrame.gwHeader.headerText:SetText(CRAFT_SKILLS or "附魔")
    end

    -- Make the GW2 header handle the drag
    if CraftFrame.gwHeader then
        CraftFrame.gwHeader:EnableMouse(true)
        CraftFrame.gwHeader:RegisterForDrag("LeftButton")
        CraftFrame.gwHeader:SetScript("OnDragStart", function() CraftFrame:StartMoving() end)
        CraftFrame.gwHeader:SetScript("OnDragStop", function() CraftFrame:StopMovingOrSizing() end)
    end

    -- Re-add backdrops for scroll frames to match QuestLog exactly
    CraftListScrollFrame:GwCreateBackdrop("Transparent", true, 2, 2)
    CraftDetailScrollFrame:GwCreateBackdrop("Transparent", true, 2, 4)
end

local function LoadTradeSkillFrameSkin()
    local f = CreateFrame("Frame")
    f:RegisterEvent("ADDON_LOADED")
    f:SetScript("OnEvent", function(self, event, addon)
        if addon == "Blizzard_TradeSkillUI" then
            SkinTradeSkillFrame()
        elseif addon == "Blizzard_CraftUI" then
            SkinCraftFrame()
        end
    end)
    
    -- In case they are already loaded
    if IsAddOnLoaded("Blizzard_TradeSkillUI") then
        SkinTradeSkillFrame()
    end
    if IsAddOnLoaded("Blizzard_CraftUI") then
        SkinCraftFrame()
    end
end
GW.LoadTradeSkillFrameSkin = LoadTradeSkillFrameSkin
