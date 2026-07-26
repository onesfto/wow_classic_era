---@class GW2
local GW = select(2, ...)

local Headers = {
    "GuildFrameColumnHeader1",
    "GuildFrameColumnHeader2",
    "GuildFrameColumnHeader3",
    "GuildFrameColumnHeader4",
    "GuildFrameGuildStatusColumnHeader1",
    "GuildFrameGuildStatusColumnHeader2",
    "GuildFrameGuildStatusColumnHeader3",
    "GuildFrameGuildStatusColumnHeader4",
}

local function UpdateGuildStatus()
	if FriendsFrame.playerStatusFrame then
		local playerZone = GW.Libs.GW2Lib:GetPlayerLocationZoneText()
		for i = 1, GUILDMEMBERS_TO_DISPLAY or 0 do
			local button = _G["GuildFrameButton"..i]
			if button and button.guildIndex then
				local _, _, _, level, className, zone, _, _, online = GetGuildRosterInfo(button.guildIndex)
				local classFilename = GW.UnlocalizedClassName(className)
				if classFilename then
					if online then
						local classTextColor = GW.GWGetClassColor(classFilename, true, true)
						local levelTextColor = GetQuestDifficultyColor(level)
						local name = _G["GuildFrameButton"..i.."Name"]
						local levelText = _G["GuildFrameButton"..i.."Level"]
						local zoneText = _G["GuildFrameButton"..i.."Zone"]
						if name then
							name:SetTextColor(classTextColor.r, classTextColor.g, classTextColor.b)
						end
						if levelText then
							levelText:SetTextColor(levelTextColor.r, levelTextColor.g, levelTextColor.b)
						end

						if zoneText then
							if zone == playerZone then
								zoneText:SetTextColor(0, 1, 0)
							else
								zoneText:SetTextColor(1, 1, 1)
							end
						end
					end

					if button.icon then
						GW.SetClassIcon(button.icon, classFilename)
					end
				end
			end
		end
	else
		for i = 1, GUILDMEMBERS_TO_DISPLAY or 0 do
			local button = _G["GuildFrameGuildStatusButton"..i]
			if button and button.guildIndex then
				local _, _, _, _, className, _, _, _, online = GetGuildRosterInfo(button.guildIndex)
				local classFilename = online and GW.UnlocalizedClassName(className)
				if classFilename then
					local classTextColor = GW.GWGetClassColor(classFilename, true, true)
					local name = _G["GuildFrameGuildStatusButton"..i.."Name"]
					local onlineText = _G["GuildFrameGuildStatusButton"..i.."Online"]
					if name then
						name:SetTextColor(classTextColor.r, classTextColor.g, classTextColor.b)
					end
					if onlineText then
						onlineText:SetTextColor(1, 1, 1)
					end
				end
			end
		end
	end
end

local function SkinHeader(frame)
    if not frame then return end

    frame:GwStripTextures()
    local regions = {frame:GetRegions()}
    for _, region in pairs(regions) do
        if region:GetObjectType() == "FontString" then
            region:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Small)
        end
    end
    GW.HandleScrollFrameHeaderButton(frame)
end

local function LayoutClassicGuildList()
    if not GW.Classic or not GuildFrame then return end

    if GuildListScrollFrame then
        GuildListScrollFrame:ClearAllPoints()
        GuildListScrollFrame:SetPoint("TOPLEFT", GuildFrame, "TOPLEFT", 10, -60)
        GuildListScrollFrame:SetPoint("BOTTOMRIGHT", GuildFrame, "BOTTOMRIGHT", -25, 165)
    end
    if GuildFrameColumnHeader3 then
        GuildFrameColumnHeader3:ClearAllPoints()
        GuildFrameColumnHeader3:SetPoint("TOPLEFT", GuildFrame, "TOPLEFT", 8, -57)
        GuildFrameColumnHeader3:SetWidth(72)
    end
    if GuildFrameColumnHeader4 then
        GuildFrameColumnHeader4:ClearAllPoints()
        GuildFrameColumnHeader4:SetPoint("LEFT", GuildFrameColumnHeader3 or GuildFrame, GuildFrameColumnHeader3 and "RIGHT" or "TOPLEFT", -2, GuildFrameColumnHeader3 and 0 or -57)
        GuildFrameColumnHeader4:SetWidth(100)
    end
    if GuildFrameColumnHeader1 then
        GuildFrameColumnHeader1:ClearAllPoints()
        GuildFrameColumnHeader1:SetPoint("LEFT", GuildFrameColumnHeader4 or GuildFrame, GuildFrameColumnHeader4 and "RIGHT" or "TOPLEFT", -2, GuildFrameColumnHeader4 and 0 or -57)
        GuildFrameColumnHeader1:SetWidth(50)
    end
    if GuildFrameColumnHeader2 then
        GuildFrameColumnHeader2:ClearAllPoints()
        GuildFrameColumnHeader2:SetPoint("LEFT", GuildFrameColumnHeader1 or GuildFrame, GuildFrameColumnHeader1 and "RIGHT" or "TOPLEFT", -2, GuildFrameColumnHeader1 and 0 or -57)
        GuildFrameColumnHeader2:SetWidth(120)
    end
    if GuildFrameLFGButton then
        GuildFrameLFGButton:ClearAllPoints()
        GuildFrameLFGButton:SetPoint("TOPRIGHT", GuildFrame, "TOPRIGHT", -18, -38)
    end
    if GuildFrameAddMemberButton then
        GuildFrameAddMemberButton:ClearAllPoints()
        GuildFrameAddMemberButton:SetPoint("BOTTOM", GuildFrame, "BOTTOM", -30, 8)
        GuildFrameAddMemberButton:SetWidth(100)
    end
    if GuildFrameGuildInformationButton then
        GuildFrameGuildInformationButton:ClearAllPoints()
        GuildFrameGuildInformationButton:SetPoint("RIGHT", GuildFrameAddMemberButton or GuildFrame, GuildFrameAddMemberButton and "LEFT" or "BOTTOM", GuildFrameAddMemberButton and -4 or -90, GuildFrameAddMemberButton and 0 or 8)
        GuildFrameGuildInformationButton:SetWidth(110)
    end
    if GuildFrameControlButton then
        GuildFrameControlButton:ClearAllPoints()
        GuildFrameControlButton:SetPoint("LEFT", GuildFrameAddMemberButton or GuildFrame, GuildFrameAddMemberButton and "RIGHT" or "BOTTOM", GuildFrameAddMemberButton and 4 or 90, GuildFrameAddMemberButton and 0 or 8)
        GuildFrameControlButton:SetWidth(100)
    end
end

function GW.SkinGuildList()
    if not (GW.TBC or GW.Wrath or GW.Classic) then return end

    -- this will taint
    --[[
    GUILDMEMBERS_TO_DISPLAY = 22
    for i = 14, GUILDMEMBERS_TO_DISPLAY do
        local button = CreateFrame("Button", "GuildFrameButton" .. i, GuildPlayerStatusFrame, "FriendsFrameGuildPlayerStatusButtonTemplate", i)
        button:SetPoint("TOPLEFT", _G["GuildFrameButton" .. i -1], "BOTTOMLEFT", 0, 0)

        button = CreateFrame("Button", "GuildFrameGuildStatusButton" .. i, GuildStatusFrame, "FriendsFrameGuildStatusButtonTemplate", i)
        button:SetPoint("TOPLEFT", _G["GuildFrameButton" .. i -1], "BOTTOMLEFT", 0, 0)
    end
    ]]

    for i = 1, GUILDMEMBERS_TO_DISPLAY or 0 do
        local button = _G["GuildFrameButton"..i]
		local level = _G["GuildFrameButton"..i.."Level"]
		local name = _G["GuildFrameButton"..i.."Name"]
		local classButton = _G["GuildFrameButton"..i.."Class"]
		local statusName = _G["GuildFrameGuildStatusButton"..i.."Name"]

        if button then
            if not button.icon then
                button.icon = button:CreateTexture("$parentIcon", "ARTWORK")
                button.icon:SetPoint("LEFT", 48, 0)
                button.icon:SetSize(15, 15)
                button.icon:SetTexture("Interface/AddOns/GW2_UI/textures/party/classicons.png")
                button.icon:GwCreateBackdrop(nil, true, nil, nil, nil, nil, nil, button.icon)
            end

            if level then
                level:ClearAllPoints()
                level:SetPoint("TOPLEFT", 10, -1)
            end
            if name then
                name:SetSize(100, 14)
                name:ClearAllPoints()
                name:SetPoint("LEFT", 85, 0)
            end
            if classButton then
                classButton:Hide()
            end
            if statusName then
                statusName:ClearAllPoints()
                statusName:SetPoint("LEFT", 10, 0)
            end

            local statusButton = _G["GuildFrameGuildStatusButton" .. i]
            if statusButton then
                local statusHighlight = statusButton:GetHighlightTexture()
                if statusHighlight then
                    statusHighlight:SetTexture("")
                end
                GW.AddListItemChildHoverTexture(statusButton)
            end
            local highlight = button:GetHighlightTexture()
            if highlight then
                highlight:SetTexture("")
            end
            GW.AddListItemChildHoverTexture(button)
        end
    end

    if _G.GuildStatus_Update and not GuildFrame.gwGuildStatusHooked then
        hooksecurefunc("GuildStatus_Update", UpdateGuildStatus)
        GuildFrame.gwGuildStatusHooked = true
    end

    if GuildFrameColumnHeader3 then
        GuildFrameColumnHeader3:ClearAllPoints()
        GuildFrameColumnHeader3:SetPoint("TOPLEFT", 8, -57)
    end
    if GuildFrameColumnHeader4 then
        GuildFrameColumnHeader4:ClearAllPoints()
        GuildFrameColumnHeader4:SetPoint("LEFT", GuildFrameColumnHeader3 or GuildFrame, GuildFrameColumnHeader3 and "RIGHT" or "TOPLEFT", -2, GuildFrameColumnHeader3 and 0 or -57)
        GuildFrameColumnHeader4:SetWidth(50)
    end
    if GuildFrameColumnHeader1 then
        GuildFrameColumnHeader1:ClearAllPoints()
        GuildFrameColumnHeader1:SetPoint("LEFT", GuildFrameColumnHeader4 or GuildFrame, GuildFrameColumnHeader4 and "RIGHT" or "TOPLEFT", -2, GuildFrameColumnHeader4 and 0 or -57)
        GuildFrameColumnHeader1:SetWidth(105)
    end
    if GuildFrameColumnHeader2 then
        GuildFrameColumnHeader2:ClearAllPoints()
        GuildFrameColumnHeader2:SetPoint("LEFT", GuildFrameColumnHeader1 or GuildFrame, GuildFrameColumnHeader1 and "RIGHT" or "TOPLEFT", -2, GuildFrameColumnHeader1 and 0 or -57)
        GuildFrameColumnHeader2:SetWidth(127)
    end

    if GuildFrameLFGButton then
        GuildFrameLFGButton:GwSkinCheckButton()
        GuildFrameLFGButton:SetSize(15, 15)
    end

    if GuildFrameGuildListToggleButton then
        GW.HandleNextPrevButton(GuildFrameGuildListToggleButton, "right")
    end
    if GuildFrameAddMemberButton then
        GuildFrameAddMemberButton:GwSkinButton(false, true)
    end
    if GuildFrameGuildInformationButton then
        GuildFrameGuildInformationButton:GwSkinButton(false, true)
    end
    if GuildFrameControlButton then
        GuildFrameControlButton:GwSkinButton(false, true)
    end
    if GuildFrameNotesText then
        GuildFrameNotesText:SetWidth(450)
    end
    if GuildMOTDEditButton then
        GuildMOTDEditButton:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder, true)
    end

    if GuildFrame then
        GuildFrame:GwStripTextures()
    end
    if GuildListScrollFrame then
        GuildListScrollFrame:GwStripTextures()
        GuildListScrollFrame:GwSkinScrollFrame()
        GuildListScrollFrame:SetPoint("TOPLEFT", GuildFrame, "TOPLEFT", 10, -60)
    end
    if GuildListScrollFrameScrollBar then
        GuildListScrollFrameScrollBar:GwSkinScrollBar()
    end

    if GuildFrameNotesLabel then
        GuildFrameNotesLabel:GwSetFontTemplate(DAMAGE_TEXT_FONT, GW.Enum.TextSizeType.Header)
        GuildFrameNotesLabel:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
        GuildFrameNotesLabel:GwSetFontTemplate(DAMAGE_TEXT_FONT, GW.Enum.TextSizeType.Normal)
    end

    if GuildFrameTotals then
        GuildFrameTotals:GwSetFontTemplate(DAMAGE_TEXT_FONT, GW.Enum.TextSizeType.Normal)
    end
    if GuildFrameOnlineTotals then
        GuildFrameOnlineTotals:GwSetFontTemplate(DAMAGE_TEXT_FONT, GW.Enum.TextSizeType.Normal)
    end
    if GuildFrameNotesText then
        GuildFrameNotesText:GwSetFontTemplate(DAMAGE_TEXT_FONT, GW.Enum.TextSizeType.Normal)
    end

    if GuildFrameLFGFrame then
        GuildFrameLFGFrame:GwStripTextures()
    end

    for _, object in pairs(Headers) do
        local frame = _G[object]
        SkinHeader(frame)
    end

    LayoutClassicGuildList()
    if GW.Classic and _G.GuildStatus_Update and not GuildFrame.gwClassicGuildLayoutHooked then
        hooksecurefunc("GuildStatus_Update", LayoutClassicGuildList)
        GuildFrame.gwClassicGuildLayoutHooked = true
    end
end
