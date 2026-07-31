-- GW2_UI_PLUS 社交窗口 —— guildList.lua
--
-- 公会列表。经典旧世的公会界面属于 FrameXML，不是按需加载，所以直接skin 即可。
--
-- 原先直接改在 GW2_UI/Games/Shared/Social/guildList.lua 里，现在整体搬进 PLUS。
-- 下面的 function GW.XXX 是写进 GW2_ADDON 这张共享表的，等于覆盖掉上游的同名函数。

local GW = _G.GW2_ADDON
if not GW then return end

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

local CLASSIC_GUILD_MEMBERS_TO_DISPLAY = 22
local CLASSIC_GUILD_COLUMN_GAP = -2
local CLASSIC_GUILD_TEXT_INSET = 9
local CLASSIC_GUILD_MEMBER_COLUMNS = {
    {header = "GuildFrameColumnHeader3", field = "Level", width = 55, justify = "LEFT"},
    {header = "GuildFrameColumnHeader4", field = "Class", width = 55, justify = "CENTER"},
    {header = "GuildFrameColumnHeader1", field = "Name", width = 135, justify = "LEFT"},
    {header = "GuildFrameColumnHeader2", field = "Zone", width = 195, justify = "LEFT"},
}
local CLASSIC_GUILD_STATUS_COLUMNS = {
    {header = "GuildFrameGuildStatusColumnHeader1", field = "Name", width = 135, justify = "LEFT"},
    {header = "GuildFrameGuildStatusColumnHeader2", field = "Rank", width = 100, justify = "LEFT"},
    {header = "GuildFrameGuildStatusColumnHeader3", field = "Note", width = 125, justify = "LEFT"},
    {header = "GuildFrameGuildStatusColumnHeader4", field = "Online", width = 80, justify = "LEFT"},
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

local function GetGuildButtonField(button, field)
    local buttonName = button and button:GetName()
    return buttonName and _G[buttonName .. field]
end

local function GetGuildColumnsWidth(columns)
    local width = 0
    for index, column in ipairs(columns) do
        width = width + column.width
        if index > 1 then
            width = width + CLASSIC_GUILD_COLUMN_GAP
        end
    end
    return width
end

local function LayoutClassicGuildHeaders(columns)
    local previousHeader
    for _, column in ipairs(columns) do
        local header = _G[column.header]
        if header then
            header:ClearAllPoints()
            if previousHeader then
                header:SetPoint("LEFT", previousHeader, "RIGHT", CLASSIC_GUILD_COLUMN_GAP, 0)
            else
                header:SetPoint("TOPLEFT", GuildFrame, "TOPLEFT", 8, -57)
            end
            header:SetWidth(column.width)

            local headerName = header:GetName()
            local text = headerName and _G[headerName .. "Text"] or header:GetFontString()
            if text then
                local inset = column.justify == "CENTER" and 0 or CLASSIC_GUILD_TEXT_INSET
                text:ClearAllPoints()
                text:SetPoint("LEFT", header, "LEFT", inset, 0)
                text:SetWidth(column.width - inset * 2)
                text:SetJustifyH(column.justify)
            end
            previousHeader = header
        end
    end
end

local function LayoutClassicGuildFrameButton(button)
    local columnStart = 0
    for _, column in ipairs(CLASSIC_GUILD_MEMBER_COLUMNS) do
        local field = GetGuildButtonField(button, column.field)
        if column.field == "Class" then
            if field then field:Hide() end
            if button.icon then
                button.icon:ClearAllPoints()
                button.icon:SetPoint("CENTER", button, "LEFT", columnStart + column.width / 2, 0)
            end
        elseif field then
            local inset = column.justify == "CENTER" and 0 or CLASSIC_GUILD_TEXT_INSET
            field:ClearAllPoints()
            field:SetPoint("LEFT", button, "LEFT", columnStart + inset, 0)
            field:SetWidth(column.width - inset * 2)
            field:SetJustifyH(column.justify)
        end
        columnStart = columnStart + column.width + CLASSIC_GUILD_COLUMN_GAP
    end
    button:SetWidth(GetGuildColumnsWidth(CLASSIC_GUILD_MEMBER_COLUMNS))
end

local function LayoutClassicGuildStatusButton(button)
    local columnStart = 0
    for _, column in ipairs(CLASSIC_GUILD_STATUS_COLUMNS) do
        local field = GetGuildButtonField(button, column.field)
        if field then
            local inset = column.justify == "CENTER" and 0 or CLASSIC_GUILD_TEXT_INSET
            field:ClearAllPoints()
            field:SetPoint("LEFT", button, "LEFT", columnStart + inset, 0)
            field:SetWidth(column.width - inset * 2)
            field:SetJustifyH(column.justify)
        end
        columnStart = columnStart + column.width + CLASSIC_GUILD_COLUMN_GAP
    end
    button:SetWidth(GetGuildColumnsWidth(CLASSIC_GUILD_STATUS_COLUMNS))
end

local function EnsureClassicGuildRows()
    if not GW.Classic then return end

    GUILDMEMBERS_TO_DISPLAY = CLASSIC_GUILD_MEMBERS_TO_DISPLAY
    for i = 2, CLASSIC_GUILD_MEMBERS_TO_DISPLAY do
        if not _G["GuildFrameButton" .. i] and _G["GuildFrameButton" .. (i - 1)] then
            local button = CreateFrame("Button", "GuildFrameButton" .. i, GuildPlayerStatusFrame, "FriendsFrameGuildPlayerStatusButtonTemplate", i)
            button:SetPoint("TOP", _G["GuildFrameButton" .. (i - 1)], "BOTTOM")
        end
        if not _G["GuildFrameGuildStatusButton" .. i] and _G["GuildFrameGuildStatusButton" .. (i - 1)] then
            local button = CreateFrame("Button", "GuildFrameGuildStatusButton" .. i, GuildStatusFrame, "FriendsFrameGuildStatusButtonTemplate", i)
            button:SetPoint("TOP", _G["GuildFrameGuildStatusButton" .. (i - 1)], "BOTTOM")
        end
    end
end

local function SkinClassicGuildInfoFrame()
    if not GuildInfoFrame or GuildInfoFrame.gwPlusSkinned then return end
    GuildInfoFrame.gwPlusSkinned = true

    GuildInfoFrame:GwStripTextures()
    GuildInfoFrame:GwCreateBackdrop(GW.BackdropTemplates.Default)

    if GuildInfoTextBackground then
        GuildInfoTextBackground:GwStripTextures()
        GuildInfoTextBackground:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder, true)
    end
    if GuildInfoFrameScrollFrame then
        GuildInfoFrameScrollFrame:GwStripTextures()
        GuildInfoFrameScrollFrame:GwSkinScrollFrame()
    end
    if GuildInfoFrameScrollFrameScrollBar then
        GuildInfoFrameScrollFrameScrollBar:GwSkinScrollBar()
    end
    if GuildInfoCloseButton then
        GuildInfoCloseButton:GwSkinButton(true, false)
    end
    for _, button in pairs({GuildInfoGuildEventButton, GuildInfoSaveButton, GuildInfoCancelButton}) do
        if button then
            button:GwSkinButton(false, true)
        end
    end
end

local function LayoutClassicGuildList()
    if not GW.Classic or not GuildFrame then return end

    if GuildListScrollFrame then
        GuildListScrollFrame:ClearAllPoints()
        GuildListScrollFrame:SetPoint("TOPLEFT", GuildFrame, "TOPLEFT", 10, -60)
        GuildListScrollFrame:SetPoint("BOTTOMRIGHT", GuildFrame, "BOTTOMRIGHT", -25, 190)
    end
    if GuildListScrollFrameScrollBar then
        GuildListScrollFrameScrollBar:ClearAllPoints()
        GuildListScrollFrameScrollBar:SetWidth(12)
        GuildListScrollFrameScrollBar:SetPoint("TOPLEFT", GuildListScrollFrame, "TOPRIGHT", 3, -15)
        GuildListScrollFrameScrollBar:SetPoint("BOTTOMLEFT", GuildListScrollFrame, "BOTTOMRIGHT", 3, 15)
    end

    LayoutClassicGuildHeaders(CLASSIC_GUILD_MEMBER_COLUMNS)
    LayoutClassicGuildHeaders(CLASSIC_GUILD_STATUS_COLUMNS)

    for i = 1, CLASSIC_GUILD_MEMBERS_TO_DISPLAY do
        local button = _G["GuildFrameButton" .. i]
        local previousButton = _G["GuildFrameButton" .. (i - 1)]
        if button then
            button:ClearAllPoints()
            if previousButton then
                button:SetPoint("TOP", previousButton, "BOTTOM")
            elseif GuildFrameColumnHeader3 then
                button:SetPoint("TOPLEFT", GuildFrameColumnHeader3, "BOTTOMLEFT", 0, -2)
            end
            LayoutClassicGuildFrameButton(button)
        end

        local statusButton = _G["GuildFrameGuildStatusButton" .. i]
        local previousStatusButton = _G["GuildFrameGuildStatusButton" .. (i - 1)]
        if statusButton then
            statusButton:ClearAllPoints()
            if previousStatusButton then
                statusButton:SetPoint("TOP", previousStatusButton, "BOTTOM")
            elseif GuildFrameGuildStatusColumnHeader1 then
                statusButton:SetPoint("TOPLEFT", GuildFrameGuildStatusColumnHeader1, "BOTTOMLEFT", 0, -2)
            end
            LayoutClassicGuildStatusButton(statusButton)
        end
    end

    if GuildFrameLFGButton then
        GuildFrameLFGButton:ClearAllPoints()
        GuildFrameLFGButton:SetPoint("TOPRIGHT", GuildFrame, "TOPRIGHT", -18, -38)
    end
    if GuildFrameNotesLabel then
        GuildFrameNotesLabel:ClearAllPoints()
        GuildFrameNotesLabel:SetPoint("TOPLEFT", GuildFrame, "TOPLEFT", 10, -445)
    end
    if GuildMOTDEditButton and GuildFrameNotesLabel then
        GuildMOTDEditButton:ClearAllPoints()
        GuildMOTDEditButton:SetPoint("TOPLEFT", GuildFrameNotesLabel, "BOTTOMLEFT", 0, -3)
        GuildMOTDEditButton:SetSize(450, 46)
    end
    if GuildFrameNotesText and GuildMOTDEditButton then
        GuildFrameNotesText:ClearAllPoints()
        GuildFrameNotesText:SetPoint("TOPLEFT", GuildMOTDEditButton, "TOPLEFT", 3, -3)
        GuildFrameNotesText:SetPoint("BOTTOMRIGHT", GuildMOTDEditButton, "BOTTOMRIGHT", -3, 3)
    end
    if GuildFrameTotals then
        GuildFrameTotals:ClearAllPoints()
        GuildFrameTotals:SetPoint("TOPLEFT", GuildFrame, "TOPLEFT", 10, -523)
    end
    if GuildFrameOnlineTotals and GuildFrameTotals then
        GuildFrameOnlineTotals:ClearAllPoints()
        GuildFrameOnlineTotals:SetPoint("LEFT", GuildFrameTotals, "RIGHT", 4, 0)
    end
    if GuildFrameGuildListToggleButton then
        GuildFrameGuildListToggleButton:ClearAllPoints()
        GuildFrameGuildListToggleButton:SetPoint("LEFT", GuildFrameOnlineTotals or GuildFrameTotals or GuildFrame, "RIGHT", 8, 0)
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

    EnsureClassicGuildRows()

    for i = 1, GUILDMEMBERS_TO_DISPLAY or 0 do
        local button = _G["GuildFrameButton"..i]

        if button then
            if not button.icon then
                button.icon = button:CreateTexture("$parentIcon", "ARTWORK")
                button.icon:SetPoint("LEFT", 48, 0)
                button.icon:SetSize(15, 15)
                button.icon:SetTexture("Interface/AddOns/GW2_UI/textures/party/classicons.png")
                button.icon:GwCreateBackdrop(nil, true, nil, nil, nil, nil, nil, button.icon)
            end

            local statusButton = _G["GuildFrameGuildStatusButton" .. i]
            if GW.Classic then
                LayoutClassicGuildFrameButton(button)
                if statusButton then
                    LayoutClassicGuildStatusButton(statusButton)
                end
            else
                local level = GetGuildButtonField(button, "Level")
                local name = GetGuildButtonField(button, "Name")
                local class = GetGuildButtonField(button, "Class")
                local statusName = GetGuildButtonField(statusButton, "Name")
                if level then
                    level:ClearAllPoints()
                    level:SetPoint("TOPLEFT", 10, -1)
                end
                if name then
                    name:SetSize(100, 14)
                    name:ClearAllPoints()
                    name:SetPoint("LEFT", 85, 0)
                end
                if class then class:Hide() end
                if statusName then
                    statusName:ClearAllPoints()
                    statusName:SetPoint("LEFT", 10, 0)
                end
            end

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

    SkinClassicGuildInfoFrame()

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
