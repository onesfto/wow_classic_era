---@class GW2
local GW = select(2, ...)

local WOW_PROJECT_BURNING_CRUSADE_CLASSIC = 5
local WOW_PROJECT_CLASSIC = 2
local WOW_PROJECT_MAINLINE = WOW_PROJECT_MAINLINE
local WOW_PROJECT_WRATH_CLASSIC = 11
local WOW_PROJECT_CATACLYSM_CLASSIC = 14
local WOW_PROJECT_MISTS_CLASSIC = 19

local MediaPath = "Interface/AddOns/GW2_UI/Textures/social/"
local delimiter = format("|cff%s | |r", "979fad")

GW.friendsList = {}
GW.friendsList.projectCodes = {
    ["ANBS"] = "Diablo Immortal",
    ["Hero"] = "Heroes of the Storm",
    ["OSI"] = "Diablo II",
    ["S2"] = "StarCraft II",
    ["VIPR"] = "Call of Duty: Black Ops 4",
    ["W3"] = "WarCraft III",
    ["APP"] = "Battle.net App",
    ["FORE"] = "Call of Duty: Vanguard",
    ["LAZR"] = "Call of Duty: MW2 Campaign Remastered",
    ["RTRO"] = "Blizzard Arcade Collection",
    ["WLBY"] = "Crash Bandicoot 4: It's About Time",
    ["WTCG"] = "Hearthstone",
    ["ZEUS"] = "Call of Duty: Blac Ops Cold War",
    ["D3"] = "Diablo III",
    ["GRY"] = "Warcraft Arclight Rumble",
    ["ODIN"] = "Call of Duty: Mordern Warfare II",
    ["S1"] = "StarCraft",
    ["WOW"] = "World of Warcraft",
    ["PRO"] = "Overwatch",
    ["PRO-ZHCN"] = "Overwatch",
}

GW.friendsList.clientData = {
    ["Diablo Immortal"] = {
        color = { r = 0.768, g = 0.121, b = 0.231 },
    },
    ["Heroes of the Storm"] = {
        color = { r = 0, g = 0.8, b = 1 },
    },
    ["Diablo II"] = {
        color = { r = 0.768, g = 0.121, b = 0.231 },
    },
    ["StarCraft II"] = {
        color = { r = 0.749, g = 0.501, b = 0.878 },
    },
    ["Call of Duty: Black Ops 4"] = {
        color = { r = 0, g = 0.8, b = 0 },
    },
    ["WarCraft III"] = {
        color = { r = 0.796, g = 0.247, b = 0.145 },
    },
    ["Battle.net App"] = {
        color = { r = 0.509, g = 0.772, b = 1 },
    },
    ["Call of Duty: Vanguard"] = {
        color = { r = 0, g = 0.8, b = 0 },
    },
    ["Call of Duty: MW2 Campaign Remastered"] = {
        color = { r = 0, g = 0.8, b = 0 },
    },
    ["Blizzard Arcade Collection"] = {
        color = { r = 0.509, g = 0.772, b = 1 },
    },
    ["Crash Bandicoot 4: It's About Time"] = {
        color = { r = 0.509, g = 0.772, b = 1 },
    },
    ["Hearthstone"] = {
        color = { r = 1, g = 0.694, b = 0 },
    },
    ["Call of Duty: Blac Ops Cold War"] = {
        color = { r = 0, g = 0.8, b = 0 },
    },
    ["Diablo III"] = {
        color = { r = 0.768, g = 0.121, b = 0.231 },
    },
    ["Warcraft Arclight Rumble"] = {
        color = { r = 0.945, g = 0.757, b = 0.149 },
    },
    ["Call of Duty: Mordern Warfare II"] = {
        color = { r = 0, g = 0.8, b = 0 },
    },
    ["StarCraft"] = {
        color = { r = 0.749, g = 0.501, b = 0.878 },
    },
    ["World of Warcraft"] = {
        color = { r = 0.866, g = 0.690, b = 0.180 },
    },
    ["Overwatch"] = {
        color = { r = 1, g = 1, b = 1 },
    },
}

GW.friendsList.timerunningSeasonIcon = {
    [2] = MediaPath .. "GameIcons/WOW_LEG",
}

GW.friendsList.expansionData = {
    [WOW_PROJECT_MAINLINE] = {
        name = "Retail",
        suffix = nil,
        maxLevel = (GetMaxLevelForPlayerExpansion and GetMaxLevelForPlayerExpansion() or GetMaxPlayerLevel()),
        icon = MediaPath .. "GameIcons/WOW_Retail",
    },
    [WOW_PROJECT_CLASSIC] = {
        name = "Classic",
        suffix = "Classic",
        maxLevel = 60,
        icon = MediaPath .. "GameIcons/WOW_Classic",
    },
    [WOW_PROJECT_BURNING_CRUSADE_CLASSIC] = {
        name = "TBC",
        suffix = "TBC",
        maxLevel = 70,
        icon = MediaPath .. "GameIcons/WOW_TBC",
    },
    [WOW_PROJECT_WRATH_CLASSIC] = {
        name = "WotLK",
        suffix = "WotLK",
        maxLevel = 80,
        icon = MediaPath .. "GameIcons/WOW_WotLK",
    },
    [WOW_PROJECT_CATACLYSM_CLASSIC] = {
        name = "Cata",
        suffix = "Cata",
        maxLevel = 85,
        icon = MediaPath .. "GameIcons/WOW_Cata",
    },
    [WOW_PROJECT_MISTS_CLASSIC] = {
        name = "MoP",
        suffix = "MoP",
        maxLevel = 90,
        icon = MediaPath .. "GameIcons/WOW_MoP",
    },
}

GW.friendsList.factionIcons = {
    ["Alliance"] = MediaPath .. "GameIcons/Alliance",
    ["Horde"] = MediaPath .. "GameIcons/Horde",
}

GW.friendsList.statusIcons = {
    default = {
        Online = FRIENDS_TEXTURE_ONLINE,
        Offline = FRIENDS_TEXTURE_OFFLINE,
        DND = FRIENDS_TEXTURE_DND,
        AFK = FRIENDS_TEXTURE_AFK,
    },
    square = {
        Online = MediaPath .. "StatusIcons/Square/Online",
        Offline = MediaPath .. "StatusIcons/Square/Offline",
        DND = MediaPath .. "StatusIcons/Square/DND",
        AFK = MediaPath .. "StatusIcons/Square/AFK",
    },
    color = {
        Online  = { Color = {0.243, 0.57, 1} },
        Offline = { Color = {0.486, 0.518, 0.541} },
        DND     = { Color = {1, 0, 0} },
        AFK     = { Color = {1, 1, 0} },
    },
}

local function HandleInviteTexNormal(self)
    self:SetTexture("Interface/AddOns/GW2_UI/textures/icons/lfdmicrobutton-down.png")
    self:SetTexCoord(0, 1, 0, 1)
    self:SetSize(16, 16)
    self:ClearAllPoints()
    self:SetPoint("CENTER")
    self:SetVertexColor(1, 1, 1, 1)
end

local function HandleInviteTexDisabled(self)
    self:SetTexture("Interface/AddOns/GW2_UI/textures/icons/lfdmicrobutton-down.png")
    self:SetTexCoord(0, 1, 0, 1)
    self:SetSize(18, 18)
    self:ClearAllPoints()
    self:SetPoint("CENTER")
    self:SetVertexColor(0.4, 0.4, 0.4, 1)
    self:SetDesaturated(true)
end

local function UpdateFriendButton(button)
    if not button.isSkinned then
        local normal = button.travelPassButton:GetNormalTexture()
        normal:SetTexture("Interface/AddOns/GW2_UI/textures/icons/lfdmicrobutton-down.png")
        normal:SetTexCoord(0, 1, 0, 1)
        normal:SetSize(18, 18)
        normal:ClearAllPoints()
        normal:SetPoint("CENTER")
        normal:SetVertexColor(1, 1, 1, 1)

        local disabled = button.travelPassButton:GetDisabledTexture()
        disabled:SetTexture("Interface/AddOns/GW2_UI/textures/icons/lfdmicrobutton-down.png")
        disabled:SetTexCoord(0, 1, 0, 1)
        disabled:SetSize(18, 18)
        disabled:ClearAllPoints()
        disabled:SetPoint("CENTER")
        disabled:SetVertexColor(0.4, 0.4, 0.4, 1)
        disabled:SetDesaturated(true)

        local highlight = button.travelPassButton:GetHighlightTexture()
        highlight:SetTexture("Interface/AddOns/GW2_UI/textures/icons/lfdmicrobutton-up.png")
        highlight:SetTexCoord(0, 1, 0, 1)
        highlight:SetSize(18, 18)
        highlight:ClearAllPoints()
        highlight:SetPoint("CENTER")
        highlight:SetVertexColor(1, 1, 1, 1)

        if GW.Retail then
            hooksecurefunc(button.travelPassButton.NormalTexture, "SetAtlas", HandleInviteTexNormal)
            hooksecurefunc(button.travelPassButton.DisabledTexture, "SetAtlas", HandleInviteTexDisabled)
        end

        button.isSkinned = true
    end


    if button.buttonType == FRIENDS_BUTTON_TYPE_DIVIDER then
        return
    end

    local gameName, realID, name, server, class, area, level, faction, status, wowID, timerunningSeasonID

    if button.buttonType == FRIENDS_BUTTON_TYPE_WOW then
        -- WoW friends
        wowID = WOW_PROJECT_MAINLINE
        gameName = GW.friendsList.projectCodes["WOW"]
        local friendInfo = C_FriendList.GetFriendInfoByIndex(button.id)
        name, server = strsplit("-", friendInfo.name)
        level = friendInfo.level
        class = friendInfo.className
        area = friendInfo.area
        faction = GW.myfaction

        if friendInfo.connected then
            if friendInfo.afk then
                status = "AFK"
            elseif friendInfo.dnd then
                status = "DND"
            else
                status = "Online"
            end
        else
            status = "Offline"
        end
    elseif button.buttonType == FRIENDS_BUTTON_TYPE_BNET and BNConnected() then
        -- Battle.net friends
        local friendAccountInfo = C_BattleNet.GetFriendAccountInfo(button.id)
        if friendAccountInfo then
            realID = friendAccountInfo.accountName

            local gameAccountInfo = friendAccountInfo.gameAccountInfo
            gameName = GW.friendsList.projectCodes[strupper(gameAccountInfo.clientProgram)]

            if gameAccountInfo.isOnline then
                if friendAccountInfo.isAFK or gameAccountInfo.isGameAFK then
                    status = "AFK"
                elseif friendAccountInfo.isDND or gameAccountInfo.isGameBusy then
                    status = "DND"
                else
                    status = "Online"
                end
            else
                status = "Offline"
            end

            -- Fetch version if friend playing WoW
            if gameName == "World of Warcraft" then
                wowID = gameAccountInfo.wowProjectID
                name = gameAccountInfo.characterName or ""
                level = gameAccountInfo.characterLevel or 0
                faction = gameAccountInfo.factionName or nil
                class = gameAccountInfo.className or ""
                area = gameAccountInfo.areaName or ""
                timerunningSeasonID = gameAccountInfo.timerunningSeasonID or ""

                if wowID and wowID ~= 1 and GW.friendsList.expansionData[wowID] then
                    local suffix = GW.friendsList.expansionData[wowID].suffix and " (" .. GW.friendsList.expansionData[wowID].suffix .. ")" or ""
                    local serverStrings = { strsplit(" - ", gameAccountInfo.richPresence) }
                    server = (serverStrings[#serverStrings] or BNET_FRIEND_TOOLTIP_WOW_CLASSIC) .. suffix .. "*"
                elseif wowID and wowID == 1 and name == "" then
                    server = gameAccountInfo.richPresence -- Plunderstorm
                else
                    server = gameAccountInfo.realmDisplayName or ""
                end
            end
        end
    end

    if status then
        button.status:SetTexture(GW.friendsList.statusIcons.square[status])
    end

    button.gameIcon:SetTexCoord(0, 1, 0, 1)

    if gameName then
        local buttonTitle, buttonText

        -- real ID
        local clientColor = GW.friendsList.clientData[gameName] and GW.friendsList.clientData[gameName].color
        local realIDString = realID and clientColor and GW.StringWithRGB(realID, clientColor) or realID

        -- name
        local classColor = GW.GWGetClassColor(GW.UnlocalizedClassName(class), true, true, true)
        local nameString = name and classColor and GW.StringWithRGB(name, classColor) or name
        if TimerunningUtil and timerunningSeasonID and timerunningSeasonID ~= "" and nameString ~= nil then
            nameString = TimerunningUtil.AddSmallIcon(nameString) or nameString -- add timerunning tag
        end

        if wowID and GW.friendsList.expansionData[wowID] and level and level ~= 0 then
            nameString = nameString .. GW.StringWithRGB(delimiter .. level, GetQuestDifficultyColor(level))
        end

        -- combine Real ID and Name
        if nameString and nameString ~= "" and realIDString and realIDString ~= "" then
            buttonTitle = realIDString .. delimiter .. nameString
        elseif nameString and nameString ~= "" then
            buttonTitle = nameString
        else
            buttonTitle = realIDString or ""
        end

        button.name:SetText(buttonTitle)

        -- area
        if area then
            if area ~= "" and server and server ~= "" and server ~= GW.myrealm then
                buttonText = GW.StringWithRGB(area .. " - " .. server, {r = 1, g = 1, b = 1})
            elseif area ~= "" then
                buttonText = GW.StringWithRGB(area, {r = 1, g = 1, b = 1})
            else
                buttonText = server or ""
            end

            button.info:SetText(buttonText)
        end

        -- game icon
        local texOrAtlas
        if wowID and GW.friendsList.expansionData[wowID] then
            texOrAtlas = GW.friendsList.expansionData[wowID].icon
            if wowID == WOW_PROJECT_MAINLINE and timerunningSeasonID and GW.friendsList.timerunningSeasonIcon[timerunningSeasonID] then
                texOrAtlas = GW.friendsList.timerunningSeasonIcon[timerunningSeasonID]
            end
        end

        if texOrAtlas == nil and faction and GW.friendsList.factionIcons[faction] then
            texOrAtlas = GW.friendsList.factionIcons[faction]
        end

        if texOrAtlas then
            button.gameIcon:SetAlpha(1)
            button.gameIcon:SetTexture(texOrAtlas)
            button.gameIcon:SetTexCoord(0.15, 0.85, 0.15, 0.85)
        end
    end

    button.name:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Normal)
    button.info:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Small, nil, -1)

    if button.Favorite and button.Favorite:IsShown() then
        button.Favorite:ClearAllPoints()
        button.Favorite:SetPoint("LEFT", button.name, "LEFT", button.name:GetStringWidth(), 0)
    end

    button:SetSize(460, 34)
    button.name:SetWidth(400)
end


local function HideClassicFriendsScrollTrack(scrollFrame)
    if not GW.Classic or not scrollFrame then return end

    local frameName = scrollFrame:GetName()
    local trackTextures = {
        scrollFrame.scrollBorderMiddle,
        scrollFrame.scrollFrameScrollBarBackground,
        frameName and _G[frameName .. "ScrollBarMiddle"],
        frameName and _G[frameName .. "Middle"],
        frameName and _G[frameName .. "ScrollBar"] and _G[frameName .. "ScrollBar"].Middle,
        frameName and _G[frameName .. "ScrollBar"] and _G[frameName .. "ScrollBar"].Background
    }

    for _, texture in pairs(trackTextures) do
        if texture then
            if texture.SetTexture then
                texture:SetTexture("")
            end
            if texture.SetAlpha then
                texture:SetAlpha(0)
            end
            if texture.Hide then
                texture:Hide()
            end
        end
    end
end


function GW.SkinFriendList()
    if GW.Retail then
        for i = 1, 3 do
            local tabId = i == 1 and FriendsTabHeader.friendsTabID or i == 2 and FriendsTabHeader.recentAlliesTabID or FriendsTabHeader.recruitAFriendTabID
            local tab = FriendsTabHeader.TabSystem:GetTabButton(tabId)
            GW.HandleTabs(tab, "top")
        end
    else
        if FriendsTabHeaderTab1 then
            GW.HandleTabs(FriendsTabHeaderTab1, "top")
            FriendsTabHeaderTab1:SetHeight(25)
            FriendsTabHeaderTab1:ClearAllPoints()
            if GW.Classic and FriendsFrameFriendsScrollFrame then
                FriendsTabHeaderTab1:SetPoint("TOPLEFT", FriendsFrameFriendsScrollFrame, "TOPLEFT", 0, 24)
            else
                FriendsTabHeaderTab1:SetPoint("TOPLEFT", FriendsFrame, "TOPLEFT", GW.Classic and 8 or 18, -63)
            end
        end
        if FriendsTabHeaderTab2 then
            GW.HandleTabs(FriendsTabHeaderTab2, "top")
            FriendsTabHeaderTab2:SetHeight(25)
            FriendsTabHeaderTab2:ClearAllPoints()
            FriendsTabHeaderTab2:SetPoint("LEFT", FriendsTabHeaderTab1 or FriendsFrame, FriendsTabHeaderTab1 and "RIGHT" or "TOPLEFT", FriendsTabHeaderTab1 and 0 or 100, FriendsTabHeaderTab1 and 0 or -63)
        end
    end

    if FriendsFrameStatusDropdown then
        FriendsFrameStatusDropdown:GwHandleDropDownBox()
        FriendsFrameStatusDropdown:SetWidth(55)
        FriendsFrameStatusDropdown:ClearAllPoints()
        if GW.Classic and FriendsFrameBattlenetFrame then
            FriendsFrameStatusDropdown:SetHeight(30)
            FriendsFrameStatusDropdown:SetPoint("LEFT", FriendsFrameBattlenetFrame, "RIGHT", 0, 0)
            local statusText = FriendsFrameStatusDropdown.Text
            if statusText then
                statusText:ClearAllPoints()
                statusText:SetPoint("LEFT", FriendsFrameStatusDropdown, "LEFT", 9, 0)
                statusText:SetPoint("RIGHT", FriendsFrameStatusDropdown.gw2Arrow, "LEFT", -3, 0)
                statusText:SetHeight(16)
            end
        else
            FriendsFrameStatusDropdown:SetPoint("TOPLEFT", FriendsFrame.gwHeader or FriendsFrame, FriendsFrame.gwHeader and "BOTTOMLEFT" or "TOPLEFT", 5, FriendsFrame.gwHeader and 0 or -38)
        end
    end

    if GW.Retail then
        GW.HandleTrimScrollBar(FriendsListFrame.ScrollBar)
        GW.HandleScrollControls(FriendsListFrame)
        hooksecurefunc(FriendsListFrame.ScrollBox, "Update", GW.HandleItemListScrollBoxHover)
    elseif GW.TBC or GW.Wrath or GW.Classic then
        FriendsFrameFriendsScrollFrame:ClearAllPoints()
        FriendsFrameFriendsScrollFrame:SetPoint("TOPLEFT", FriendsFrame, 8, -87)
        FriendsFrameFriendsScrollFrame:SetPoint("BOTTOMRIGHT", FriendsFrame, -25, 35)
        FriendsFrameFriendsScrollFrame:SetHeight(480)
        HybridScrollFrame_CreateButtons(FriendsFrameFriendsScrollFrame, "FriendsFrameButtonTemplate")

        if FriendsFrameFriendsScrollFrameScrollBar then
            FriendsFrameFriendsScrollFrameScrollBar:GwSkinScrollBar()
        end
        FriendsFrameFriendsScrollFrame:GwSkinScrollFrame()
        HideClassicFriendsScrollTrack(FriendsFrameFriendsScrollFrame)
    end

    if FriendsFrameAddFriendButton then
        FriendsFrameAddFriendButton:GwSkinButton(false, true)
        if GW.Classic then
            FriendsFrameAddFriendButton:ClearAllPoints()
            FriendsFrameAddFriendButton:SetPoint("BOTTOMLEFT", FriendsFrame, "BOTTOMLEFT", 8, 8)
            FriendsFrameAddFriendButton:SetWidth(130)
        end
    end
    if FriendsFrameSendMessageButton then
        FriendsFrameSendMessageButton:GwSkinButton(false, true)
        if GW.Classic then
            FriendsFrameSendMessageButton:ClearAllPoints()
            FriendsFrameSendMessageButton:SetPoint("BOTTOMRIGHT", FriendsFrame, "BOTTOMRIGHT", -25, 8)
            FriendsFrameSendMessageButton:SetWidth(130)
        end
    end
    if _G.FriendsFrame_UpdateFriendButton then
        hooksecurefunc("FriendsFrame_UpdateFriendButton", UpdateFriendButton)
    end

    --View Friends BN Frame
    local button
    if FriendsFrameBattlenetFrame then
        button = CreateFrame("Button", nil, FriendsFrameBattlenetFrame)
        button:SetAllPoints()
        button:GwCreateBackdrop(nil, true)
        if not GW.Classic then
            button:GwSkinButton(false, false, true)
        end

        button.Tag = button:CreateFontString(nil, "OVERLAY")
        button.Tag:SetPoint("CENTER", button, "CENTER")
        button.Tag:SetTextColor(0.345, 0.667, 0.867)
        button.Tag:SetFont(UNIT_NAME_FONT, 15)
        if button.hover then
            button.hover.r = FRIENDS_BNET_BACKGROUND_COLOR.r
            button.hover.g = FRIENDS_BNET_BACKGROUND_COLOR.g
            button.hover.b = FRIENDS_BNET_BACKGROUND_COLOR.b
        end
    end

    if FriendsFriendsFrame then
        FriendsFriendsFrame:GwStripTextures()
        FriendsFriendsFrame:GwCreateBackdrop(GW.BackdropTemplates.Default)
    end
    if FriendsFriendsFrameDropdown then
        FriendsFriendsFrameDropdown:GwHandleDropDownBox()
    end

    if GW.Retail then
        FriendsFriendsFrame.ScrollFrameBorder:Hide()
        FriendsFriendsFrame.SendRequestButton:GwSkinButton(false, true)
        FriendsFriendsFrame.CloseButton:GwSkinButton(false, true)

        GW.HandleTrimScrollBar(FriendsFriendsFrame.ScrollBar)
        GW.HandleScrollControls(FriendsFriendsFrame)

        FriendsFrameBattlenetFrame.ContactsMenuButton:SetPoint("TOPRIGHT", FriendsFrame.gwHeader, "BOTTOMRIGHT", 5, 0)
        FriendsFrameBattlenetFrame.ContactsMenuButton:GwHandleDropDownBox(GW.BackdropTemplates.ColorableBorderOnly, nil, nil, 32)
        FriendsFrameBattlenetFrame.ContactsMenuButton.backdrop:SetBackdropBorderColor(0, 0, 0, 0)
        FriendsFrameBattlenetFrame.ContactsMenuButton.gw2Arrow:SetPoint("CENTER")
        FriendsFrameBattlenetFrame.ContactsMenuButton.gw2Arrow:SetSize(28, 28)

        button:SetScript("OnClick", function() FriendsFrameBattlenetFrame.BroadcastFrame:ToggleFrame() end)
    elseif GW.TBC or GW.Wrath or GW.Classic then
        if FriendsFriendsSendRequestButton then
            FriendsFriendsSendRequestButton:GwSkinButton(false, true)
        end
        if FriendsFriendsCloseButton then
            FriendsFriendsCloseButton:GwSkinButton(false, true)
        end

        if button and FriendsFrameBattlenetFrame and FriendsFrameBattlenetFrame.BroadcastFrame then
            button:SetScript("OnClick", function()
                PlaySound(SOUNDKIT.IG_CHAT_EMOTE_BUTTON)
                if FriendsFrameBattlenetFrame.BroadcastFrame:IsShown() then
                    FriendsFrameBattlenetFrame_HideBroadcastFrame()
                else
                    FriendsFrameBattlenetFrame_ShowBroadcastFrame()
                end
            end)
        end
    end

    if FriendsFrameBattlenetFrame then
        FriendsFrameBattlenetFrame:ClearAllPoints()
        FriendsFrameBattlenetFrame:SetPoint("TOP", FriendsFrame.gwHeader or FriendsFrame, FriendsFrame.gwHeader and "BOTTOM" or "TOP", 0, FriendsFrame.gwHeader and 0 or -34)
        FriendsFrameBattlenetFrame:GwStripTextures()
        FriendsFrameBattlenetFrame:GwCreateBackdrop(GW.BackdropTemplates.Default, true)
        if FriendsFrameBattlenetFrame.Tag then
            FriendsFrameBattlenetFrame.Tag:GwKill()
        end
    end

    if button then
        button:HookScript("OnEnter", function(self)
            if self.Tag then
                self.Tag:SetTextColor(1, 1, 1)
            end
        end)
        button:HookScript("OnLeave", function(self)
            if self.Tag then
                self.Tag:SetTextColor(0.345, 0.667, 0.867)
            end
            if self.hover then
                self.hover:SetAlpha(0)
            end
            self.animationValue = 0
        end)

        if _G.FriendsFrame_CheckBattlenetStatus then
            hooksecurefunc("FriendsFrame_CheckBattlenetStatus", function()
                button.Tag:Hide()
                if BNFeaturesEnabled() and BNConnected() then
                    local _, battleTag = BNGetInfo()
                    if battleTag then
                        button.Tag:SetText(battleTag)
                        button.Tag:Show()
                    end
                end
            end)
        end
    end

    if FriendsFrameBattlenetFrame and FriendsFrameBattlenetFrame.BroadcastFrame then
        FriendsFrameBattlenetFrame.BroadcastFrame:GwStripTextures()
        FriendsFrameBattlenetFrame.BroadcastFrame:GwCreateBackdrop(GW.BackdropTemplates.Default)
        FriendsFrameBattlenetFrame.BroadcastFrame:ClearAllPoints()
        FriendsFrameBattlenetFrame.BroadcastFrame:SetPoint("TOPLEFT", FriendsFrame.gwHeader or FriendsFrame, FriendsFrame.gwHeader and "BOTTOMRIGHT" or "TOPRIGHT", 45, FriendsFrame.gwHeader and 1 or -34)
        if GW.Retail then
            FriendsFrameBattlenetFrame.BroadcastFrame.EditBox:GwStripTextures()
            GW.HandleBlizzardRegions(FriendsFrameBattlenetFrame.BroadcastFrame.EditBox)
            GW.SkinTextBox(FriendsFrameBattlenetFrame.BroadcastFrame.EditBox.MiddleBorder, FriendsFrameBattlenetFrame.BroadcastFrame.EditBox.LeftBorder, FriendsFrameBattlenetFrame.BroadcastFrame.EditBox.RightBorder, nil, nil, 5, 5)
            FriendsFrameBattlenetFrame.BroadcastFrame.UpdateButton:GwSkinButton(false, true)
            FriendsFrameBattlenetFrame.BroadcastFrame.CancelButton:GwSkinButton(false, true)
        elseif GW.TBC or GW.Wrath or GW.Classic then
            if FriendsFrameBattlenetFrame.BroadcastButton then
                FriendsFrameBattlenetFrame.BroadcastButton:GwKill()
            end
            if FriendsFrameBattlenetFrameScrollFrame then
                FriendsFrameBattlenetFrameScrollFrame:GwStripTextures()
                GW.HandleBlizzardRegions(FriendsFrameBattlenetFrameScrollFrame)
                GW.SkinTextBox(FriendsFrameBattlenetFrameScrollFrame.MiddleBorder, FriendsFrameBattlenetFrameScrollFrame.LeftBorder, FriendsFrameBattlenetFrameScrollFrame.RightBorder, nil, nil, 5, 5)
                local broadcastEditBox = FriendsFrameBattlenetFrameScrollFrame.EditBox
                if broadcastEditBox then
                    broadcastEditBox:ClearAllPoints()
                    broadcastEditBox:SetPoint("LEFT", FriendsFrameBattlenetFrameScrollFrame, "LEFT", 4, 0)
                    broadcastEditBox:SetPoint("RIGHT", FriendsFrameBattlenetFrameScrollFrame, "RIGHT", -4, 0)
                    broadcastEditBox:SetHeight(16)

                    if broadcastEditBox.PromptText then
                        broadcastEditBox.PromptText:ClearAllPoints()
                        broadcastEditBox.PromptText:SetPoint("LEFT", broadcastEditBox, "LEFT", 0, 0)
                    end
                end
                if FriendsFrameBattlenetFrameScrollFrame.UpdateButton then
                    FriendsFrameBattlenetFrameScrollFrame.UpdateButton:GwSkinButton(false, true)
                end
                if FriendsFrameBattlenetFrameScrollFrame.CancelButton then
                    FriendsFrameBattlenetFrameScrollFrame.CancelButton:GwSkinButton(false, true)
                end
            end
        end
    end

    if AddFriendFrame then
        AddFriendFrame:GwStripTextures()
        AddFriendFrame:GwCreateBackdrop(GW.BackdropTemplates.Default)
    end
    if AddFriendEntryFrameAcceptButton then
        AddFriendEntryFrameAcceptButton:GwSkinButton(false, true)
    end
    if AddFriendEntryFrameCancelButton then
        AddFriendEntryFrameCancelButton:GwSkinButton(false, true)
    end
    if _G["AddFriendNameEditBoxMiddle"] then
        GW.SkinTextBox(_G["AddFriendNameEditBoxMiddle"], _G["AddFriendNameEditBoxLeft"], _G["AddFriendNameEditBoxRight"])
    end
    if FriendsFrameBattlenetFrame and FriendsFrameBattlenetFrame.UnavailableInfoFrame then
        FriendsFrameBattlenetFrame.UnavailableInfoFrame:ClearAllPoints()
        FriendsFrameBattlenetFrame.UnavailableInfoFrame:SetPoint("TOPLEFT", FriendsFrame.gwHeader or FriendsFrame, FriendsFrame.gwHeader and "TOPRIGHT" or "TOPRIGHT", 1, FriendsFrame.gwHeader and -18 or -52)
    end
end
