local GW = _G.GW2_ADDON
if not GW then return end
local CLASSIC_IGNORES_TO_DISPLAY = 30
local function AlignClassicIgnoreScrollBar()
    if not GW.Classic or not FriendsFrameIgnoreScrollFrame or not FriendsFrameIgnoreScrollFrameScrollBar then return end
    FriendsFrameIgnoreScrollFrameScrollBar:ClearAllPoints()
    FriendsFrameIgnoreScrollFrameScrollBar:SetWidth(12)
    FriendsFrameIgnoreScrollFrameScrollBar:SetPoint("TOPLEFT", FriendsFrameIgnoreScrollFrame, "TOPRIGHT", 3, -15)
    FriendsFrameIgnoreScrollFrameScrollBar:SetPoint("BOTTOMLEFT", FriendsFrameIgnoreScrollFrame, "BOTTOMRIGHT", 3, 15)
end
local function CreateClassicIgnoreButtons()
    if not GW.Classic or not FriendsFrameIgnoreScrollFrame then return end
    IGNORES_TO_DISPLAY = CLASSIC_IGNORES_TO_DISPLAY
    local firstButton = FriendsFrameIgnoreButton1
    if not firstButton then return end
    local parent = firstButton:GetParent()
    for i = 1, CLASSIC_IGNORES_TO_DISPLAY do
        local button = _G["FriendsFrameIgnoreButton" .. i]
        if not button then
            button = CreateFrame("Button", "FriendsFrameIgnoreButton" .. i, parent, "FriendsFrameIgnoreButtonTemplate")
            button:SetID(i)
        end
        button:ClearAllPoints()
        if i == 1 then
            button:SetPoint("TOPLEFT", FriendsFrameIgnoreScrollFrame, "TOPLEFT", 0, 0)
        else
            button:SetPoint("TOPLEFT", _G["FriendsFrameIgnoreButton" .. (i - 1)], "BOTTOMLEFT", 0, 0)
        end
        button:SetWidth(FriendsFrameIgnoreScrollFrame:GetWidth())
        if button.name then
            button.name:ClearAllPoints()
            button.name:SetPoint("LEFT", button, "LEFT", 10, 0)
            button.name:SetWidth(FriendsFrameIgnoreScrollFrame:GetWidth() - 10)
        end
    end
end
function GW.SkinIgnoreList()
    local IgnoreWindow = FriendsFrame.IgnoreListWindow
    if IgnoreWindow then
        IgnoreWindow:GwStripTextures()
        IgnoreWindow:GwCreateBackdrop(GW.BackdropTemplates.Default)
        if IgnoreWindow.ScrollBar then
            GW.HandleTrimScrollBar(IgnoreWindow.ScrollBar)
        end
        GW.HandleScrollControls(IgnoreWindow)
        if IgnoreWindow.CloseButton then
            IgnoreWindow.CloseButton:GwSkinButton(true)
        end
    end
    if GW.TBC or GW.Wrath or GW.Classic then
        if IgnoreListFrameTop then IgnoreListFrameTop:Hide() end
        if IgnoreListFrameMiddle then IgnoreListFrameMiddle:Hide() end
        if IgnoreListFrameBottom then IgnoreListFrameBottom:Hide() end
        if FriendsFrameIgnorePlayerButton then
            FriendsFrameIgnorePlayerButton:GwSkinButton(false, true)
            if GW.Classic then
                FriendsFrameIgnorePlayerButton:ClearAllPoints()
                FriendsFrameIgnorePlayerButton:SetPoint("BOTTOMLEFT", FriendsFrame, "BOTTOMLEFT", 8, 8)
                FriendsFrameIgnorePlayerButton:SetWidth(130)
            end
        end
        if FriendsFrameUnsquelchButton then
            FriendsFrameUnsquelchButton:GwSkinButton(false, true)
            if GW.Classic then
                FriendsFrameUnsquelchButton:ClearAllPoints()
                FriendsFrameUnsquelchButton:SetPoint("BOTTOMRIGHT", FriendsFrame, "BOTTOMRIGHT", -25, 8)
                FriendsFrameUnsquelchButton:SetWidth(130)
            end
        end
        if FriendsFrameIgnoreScrollFrame then
            FriendsFrameIgnoreScrollFrame:ClearAllPoints()
            FriendsFrameIgnoreScrollFrame:SetPoint("TOPLEFT", FriendsFrame, "TOPLEFT", 8, -87)
            FriendsFrameIgnoreScrollFrame:SetPoint("BOTTOMRIGHT", FriendsFrame, "BOTTOMRIGHT", -25, 35)
            FriendsFrameIgnoreScrollFrame:SetHeight(GW.Classic and 480 or 600)
            FriendsFrameIgnoreScrollFrame:GwSkinScrollFrame()
            CreateClassicIgnoreButtons()
        end
        if FriendsFrameIgnoreScrollFrameScrollBar then
            FriendsFrameIgnoreScrollFrameScrollBar:GwSkinScrollBar()
            AlignClassicIgnoreScrollBar()
        end
    end
end
