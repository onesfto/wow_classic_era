local GW = _G.GW2_ADDON
if not GW then return end
local CLASSIC_GUILD_TAB_ICON = "Interface/AddOns/GW2_UI/textures/uistuff/tabicon_stats.png"
local friendsFrameTabsAdded = 0
local function AddExistingDetailBackgrounds(detailBackgrounds, ...)
    for i = 1, select("#", ...) do
        local frame = select(i, ...)
        if frame then
            detailBackgrounds[#detailBackgrounds + 1] = frame
        end
    end
end
local function LayoutClassicSocialFrame()
    if not GW.Classic or not FriendsFrame then return end
    FriendsFrame:SetSize(500, 627)
    if FriendsFrameCloseButton then
        FriendsFrameCloseButton:ClearAllPoints()
        FriendsFrameCloseButton:SetPoint("TOPRIGHT", FriendsFrame, "TOPRIGHT", -5, -2)
        FriendsFrameCloseButton:GwSkinButton(true)
    end
    if FriendsFrame.gwHeader and FriendsFrame.gwHeader.windowIcon then
        FriendsFrame.gwHeader.windowIcon:ClearAllPoints()
        FriendsFrame.gwHeader.windowIcon:SetPoint("CENTER", FriendsFrame.gwHeader, "BOTTOMLEFT", -26, 35)
    end
    if FriendsFrameTitleText and FriendsFrame.gwHeader then
        FriendsFrameTitleText:ClearAllPoints()
        FriendsFrameTitleText:SetPoint("BOTTOMLEFT", FriendsFrame.gwHeader, "BOTTOMLEFT", 25, 10)
    end
    if FriendsFrameBattlenetFrame and FriendsFrame.gwHeader then
        FriendsFrameBattlenetFrame:ClearAllPoints()
        FriendsFrameBattlenetFrame:SetPoint("TOP", FriendsFrame.gwHeader, "BOTTOM", 0, 0)
        FriendsFrameBattlenetFrame:SetSize(260, 28)
    end
end
local function LayoutClassicSideTab(tab)
    local idx = tab.gwSideTabIndex
    if not idx then return end
    tab:ClearAllPoints()
    tab:SetPoint("TOPRIGHT", FriendsFrame.LeftSidePanel, "TOPLEFT", 1, -32 + (-40 * (idx - 1)))
    tab:SetSize(64, 40)
end
local function LayoutClassicSideTabs()
    for _, tab in ipairs({FriendsFrameTab1, FriendsFrameTab2, FriendsFrameTab3, FriendsFrameTab4}) do
        if tab then
            LayoutClassicSideTab(tab)
        end
    end
end
local function HandleTabs()
    for idx, tab in ipairs({FriendsFrameTab1, FriendsFrameTab2, FriendsFrameTab3, FriendsFrameTab4}) do
        if not tab then
            return
        end
        if not tab.isSkinned then
            local iconTexture
            if GW.Classic and idx == 3 then
                iconTexture = CLASSIC_GUILD_TAB_ICON
            else
                local iconName
                if GW.Retail then
                    iconName = idx == 1 and "tabicon_friends" or idx == 2 and "tabicon_who" or idx == 3 and "tabicon_raid" or "tabicon_quickjoin"
                else
                    iconName = idx == 1 and "tabicon_friends" or idx == 2 and "tabicon_who" or idx == 3 and "tabicon_friends" or "tabicon_raid"
                end
                iconTexture = "Interface/AddOns/GW2_UI/textures/social/" .. iconName .. ".png"
            end
            GW.SkinSideTabButton(tab, iconTexture, tab:GetText())
        end
        tab:SetParent(FriendsFrame.LeftSidePanel)
        if GW.Classic then
            tab.gwSideTabIndex = idx
            if not tab.gwClassicSideTabLayoutHooked then
                tab:HookScript("OnShow", LayoutClassicSideTab)
                tab.gwClassicSideTabLayoutHooked = true
            end
            LayoutClassicSideTab(tab)
        else
            tab:ClearAllPoints()
            tab:SetPoint("TOPRIGHT", FriendsFrame.LeftSidePanel, "TOPLEFT", 1, -32 + (-40 * friendsFrameTabsAdded))
            tab:SetSize(64, 40)
        end
        friendsFrameTabsAdded = friendsFrameTabsAdded + 1
        if GW.TBC or GW.Wrath then
            hooksecurefunc("FriendsFrame_UpdateGuildTabVisibility", function()
                if not FriendsFrameTab4 then return end
                FriendsFrameTab4:ClearAllPoints()
                if FriendsFrameTab3:IsShown() then
                    FriendsFrameTab4:SetPoint("TOPRIGHT", FriendsFrame.LeftSidePanel, "TOPLEFT", 1, -32 + (-40 * 3))
                else
                    FriendsFrameTab4:SetPoint("TOPRIGHT", FriendsFrame.LeftSidePanel, "TOPLEFT", 1, -32 + (-40 * 2))
                end
            end)
        end
        if idx == 4 and GW.Retail then
            tab.GwNotifyRed = tab:CreateTexture(nil, "ARTWORK", nil, 7)
            tab.GwNotifyText = tab:CreateFontString(nil, "OVERLAY")
            tab.GwNotifyRed:SetSize(18, 18)
            tab.GwNotifyRed:SetPoint("CENTER", tab, "BOTTOM", 23, 7)
            tab.GwNotifyRed:SetTexture("Interface/AddOns/GW2_UI/textures/hud/notification-backdrop.png")
            tab.GwNotifyRed:SetVertexColor(0.7, 0, 0, 0.7)
            tab.GwNotifyRed:Hide()
            tab.GwNotifyText:SetSize(24, 24)
            tab.GwNotifyText:SetPoint("CENTER", tab, "BOTTOM", 23, 7)
            tab.GwNotifyText:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Small)
            tab.GwNotifyText:SetTextColor(1, 1, 1, 1)
            tab.GwNotifyText:SetShadowColor(0, 0, 0, 0)
            tab.GwNotifyText:Hide()
        end
    end
    if GW.Classic and not FriendsFrame.gwClassicSideTabsUpdateHooked then
        hooksecurefunc("FriendsFrame_Update", LayoutClassicSideTabs)
        FriendsFrame.gwClassicSideTabsUpdateHooked = true
    end
end
function GW.LoadSocialFrame()
    if not GW.settings.USE_SOCIAL_WINDOW then return end
    GW.HandlePortraitFrame(FriendsFrame)
    if FriendsFrameIcon then
        FriendsFrameIcon:SetAlpha(0)
    end
    if FriendsFrameCloseButton then
        FriendsFrameCloseButton:SetPoint("TOPRIGHT", -5, -2)
    end
    local detailBackgrounds = {}
    AddExistingDetailBackgrounds(
        detailBackgrounds,
        FriendsListFrame and FriendsListFrame.ScrollBox,
        FriendsFrameFriendsScrollFrame,
        FriendsFrameIgnoreScrollFrame,
        RecentAlliesFrame and RecentAlliesFrame.List,
        RecruitAFriendFrame and RecruitAFriendFrame.RecruitList and RecruitAFriendFrame.RecruitList.ScrollBox,
        WhoFrame and WhoFrame.ScrollBox,
        WhoListScrollFrame,
        QuickJoinFrame and QuickJoinFrame.ScrollBox
    )
    GW.CreateFrameHeaderWithBody(FriendsFrame, FriendsFrameTitleText, "Interface/AddOns/GW2_UI/textures/social/social-windowheader.png", detailBackgrounds, nil, true, true)
    HandleTabs()
    FriendsFrame.gwHeader.windowIcon:ClearAllPoints()
    FriendsFrame.gwHeader.windowIcon:SetPoint("CENTER", FriendsFrame.gwHeader, "BOTTOMLEFT", -26, 35)
    FriendsFrameTitleText:ClearAllPoints()
    FriendsFrameTitleText:SetPoint("BOTTOMLEFT", FriendsFrame.gwHeader, "BOTTOMLEFT", 25, 10)
    FriendsFrameTitleText:GwSetFontTemplate(DAMAGE_TEXT_FONT, GW.Enum.TextSizeType.BigHeader, nil, 6)
    FriendsFrame:SetClampedToScreen(true)
    FriendsFrame:SetClampRectInsets(-40, 0, FriendsFrame.gwHeader:GetHeight() - 30, 0)
    FriendsFrame:SetSize(500, 627)
    FriendsFrame:SetScale(GW.settings.SOCIAL_POSITION_SCALE)
    FriendsFrame:SetMovable(true)
    FriendsFrame:RegisterForDrag("LeftButton")
    FriendsFrame:SetScript("OnDragStart", function()
        FriendsFrame:StartMoving()
    end)
    FriendsFrame:SetScript("OnDragStop", function()
        FriendsFrame:StopMovingOrSizing()
        FriendsFrame:SetUserPlaced(false)
        local pos = GW.settings.SOCIAL_POSITION
        if pos then
            wipe(pos)
        else
            pos = {}
        end
        pos.point, _, pos.relativePoint, pos.xOfs, pos.yOfs = FriendsFrame:GetPoint()
        GW.settings.SOCIAL_POSITION = pos
    end)
    FriendsFrame:HookScript("OnShow", function()
        local pos = GW.settings.SOCIAL_POSITION
        if pos and pos.point and pos.relativePoint then
            FriendsFrame:ClearAllPoints()
            FriendsFrame:SetPoint(pos.point, UIParent, pos.relativePoint, pos.xOfs, pos.yOfs)
        end
        LayoutClassicSocialFrame()
    end)
    LayoutClassicSocialFrame()
    GW.SkinFriendList()
    GW.SkinIgnoreList()
    if not GW.Classic then
        GW.SkinRecentAlliesList()
        GW.SkinRecruitAFriendList()
    end
    GW.SkinWhoList()
    GW.SkinRaidList()
    if not GW.Classic then
        GW.SkinQuickJoinList()
    end
    GW.SkinGuildList()
end
