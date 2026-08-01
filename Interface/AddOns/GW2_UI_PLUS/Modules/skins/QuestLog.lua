local GW = _G.GW2_ADDON
if not GW then return end
local QUESTLOG_PANEL_WIDTH = 714
local QUESTLOG_PANEL_HEIGHT = 487
local QUESTLOG_LIST_WIDTH = 303
local QUESTLOG_DETAIL_WIDTH = 303
local QUESTLOG_LIST_HEIGHT = 335
local QUESTLOG_DETAIL_HEIGHT = QUESTLOG_LIST_HEIGHT
local QUESTLOG_LIST_X = 20
local QUESTLOG_DETAIL_X = 357
local QUESTLOG_LIST_Y = -75
local QUESTLOG_DETAIL_Y = QUESTLOG_LIST_Y
local TARGET_QUESTS_DISPLAYED = 22
local QUESTLOG_BUTTON_Y = 38
local function UpdateGreetingFrame()
	local i = 1
	local title = _G['QuestTitleButton'..i]
	while (title and title:IsVisible()) do
		GreetingText:SetTextColor(1, 1, 1)
		CurrentQuestsText:SetTextColor(1, 0.80, 0.10)
		AvailableQuestsText:SetTextColor(1, 0.80, 0.10)
		local text = title:GetFontString()
		local textString = gsub(title:GetText(), '|c[Ff][Ff]%x%x%x%x%x%x(.+)|r', '%1')
		title:SetText(textString)
		local icon = _G['QuestTitleButton'..i..'QuestIcon']
		if title.isActive == 1 then
			icon:SetTexture(132048)
			icon:SetDesaturation(1)
			text:SetTextColor(.6, .6, .6)
		else
			icon:SetTexture(132049)
			icon:SetDesaturation(0)
			text:SetTextColor(1, .8, .1)
		end
		local numEntries = GetNumQuestLogEntries()
		for y = 1, numEntries do
			local titleText, _, _, _, _, isComplete, _, questId = GetQuestLogTitle(y)
			if not titleText then
				break
			elseif strmatch(titleText, textString) and (isComplete == 1 or IsQuestComplete(questId)) then
				icon:SetDesaturation(0)
				text:SetTextColor(1, .8, .1)
				break
			end
		end
		i = i + 1
		title = _G['QuestTitleButton'..i]
	end
end
local function handleItemButton(item)
    if not item then return end
    if item then
        item:GwCreateBackdrop("Transparent", true, -1, -1)
        item:SetSize(143, 40)
        item:SetFrameLevel(item:GetFrameLevel() + 2)
    end
    if item.Icon then
        item.Icon:SetSize(35, 35)
        item.Icon:SetDrawLayer("ARTWORK")
        item.Icon:SetPoint("TOPLEFT", 2 , -2)
        GW.HandleIcon(item.Icon)
    end
    if item.IconBorder then
        GW.HandleIconBorder(item.IconBorder)
    end
    if item.Count then
        item.Count:SetDrawLayer("OVERLAY")
        item.Count:ClearAllPoints()
        item.Count:SetPoint("BOTTOMRIGHT", item.Icon, "BOTTOMRIGHT", 0, 0)
    end
    if item.NameFrame then
        item.NameFrame:SetAlpha(0)
        item.NameFrame:Hide()
    end
    if item.IconOverlay then
        item.IconOverlay:SetAlpha(0)
    end
    if item.Name then
        item.Name:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Normal)
    end
    if item.CircleBackground then
        item.CircleBackground:SetAlpha(0)
        item.CircleBackgroundGlow:SetAlpha(0)
    end
    for i = 1, item:GetNumRegions() do
        local Region = select(i, item:GetRegions())
        if Region and Region:IsObjectType("Texture") and Region:GetTexture() == [[Interface\Spellbook\Spellbook-Parts]] then
            Region:SetTexture("")
        end
    end
end
local function questQualityColors(frame, text, link)
    if not frame.backdrop then
        handleItemButton(frame)
    end
    local quality = link and select(3, C_Item.GetItemInfo(link))
    if quality and quality > 1 then
        local r, g, b = C_Item.GetItemQualityColor(quality)
        text:SetTextColor(r, g, b)
        frame.backdrop:SetBackdropBorderColor(r, g, b)
    else
        text:SetTextColor(1, 1, 1)
        frame.backdrop:SetBackdropBorderColor(1, 1, 1)
	end
end
local function EnsureQuestLogRows()
	if not QuestLogFrame or not QuestLogTitle1 then return end
	local oldQuestsDisplayed = QUESTS_DISPLAYED or 0
	if oldQuestsDisplayed < TARGET_QUESTS_DISPLAYED then
		_G.QUESTS_DISPLAYED = TARGET_QUESTS_DISPLAYED
		for i = oldQuestsDisplayed + 1, TARGET_QUESTS_DISPLAYED do
			if not _G["QuestLogTitle" .. i] then
				local button = CreateFrame("Button", "QuestLogTitle" .. i, QuestLogFrame, "QuestLogTitleButtonTemplate")
				button:SetID(i)
				button:Hide()
				button:ClearAllPoints()
				button:SetPoint("TOPLEFT", _G["QuestLogTitle" .. (i - 1)], "BOTTOMLEFT", 0, 1)
			end
		end
	end
	for i = 1, QUESTS_DISPLAYED do
		local button = _G["QuestLogTitle" .. i]
		if not button then break end
		button:SetWidth(QUESTLOG_LIST_WIDTH)
		local normal = button:GetNormalTexture()
		if GW.UpdateCollapseTexture and normal and not button.collapsedSkined then
			button.collapsedSkined = true
			hooksecurefunc(button, "SetNormalTexture", GW.UpdateCollapseTexture)
			GW.UpdateCollapseTexture(button, normal:GetTexture())
		end
		if normal then
			normal:SetSize(16, 16)
		end
	end
end
local function LayoutQuestLogFrame()
	if not QuestLogFrame or not QuestLogListScrollFrame or not QuestLogDetailScrollFrame then return end
	if UIPanelWindows and UIPanelWindows.QuestLogFrame then
		UIPanelWindows.QuestLogFrame.width = QUESTLOG_PANEL_WIDTH
		UIPanelWindows.QuestLogFrame.height = QUESTLOG_PANEL_HEIGHT
	end
	QuestLogFrame:SetWidth(QUESTLOG_PANEL_WIDTH)
	QuestLogFrame:SetHeight(QUESTLOG_PANEL_HEIGHT)
	QuestLogListScrollFrame:ClearAllPoints()
	QuestLogListScrollFrame:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", QUESTLOG_LIST_X, QUESTLOG_LIST_Y)
	QuestLogListScrollFrame:SetSize(QUESTLOG_LIST_WIDTH, QUESTLOG_LIST_HEIGHT)
	QuestLogDetailScrollFrame:ClearAllPoints()
	QuestLogDetailScrollFrame:SetPoint("TOPLEFT", QuestLogFrame, "TOPLEFT", QUESTLOG_DETAIL_X, QUESTLOG_DETAIL_Y)
	QuestLogDetailScrollFrame:SetSize(QUESTLOG_DETAIL_WIDTH, QUESTLOG_DETAIL_HEIGHT)
	QuestLogFrameAbandonButton:SetSize(129, 21)
	QuestLogFrameAbandonButton:ClearAllPoints()
	QuestLogFrameAbandonButton:SetPoint("BOTTOMLEFT", QuestLogFrame, "BOTTOMLEFT", 20, QUESTLOG_BUTTON_Y)
	QuestFramePushQuestButton:SetSize(129, 21)
	QuestFramePushQuestButton:ClearAllPoints()
	QuestFramePushQuestButton:SetPoint("LEFT", QuestLogFrameAbandonButton, "RIGHT", 5, 0)
	QuestFrameExitButton:SetSize(80, 21)
	QuestFrameExitButton:ClearAllPoints()
	QuestFrameExitButton:SetPoint("BOTTOMRIGHT", QuestLogFrame, "BOTTOMRIGHT", -40, QUESTLOG_BUTTON_Y)
	QuestLogHighlightFrame:SetWidth(QUESTLOG_LIST_WIDTH)
	QuestLogSkillHighlight:SetWidth(QUESTLOG_LIST_WIDTH)
	if QuestLogNoQuestsText then
		QuestLogNoQuestsText:ClearAllPoints()
		QuestLogNoQuestsText:SetPoint("TOP", QuestLogListScrollFrame, 0, -90)
	end
	if EmptyQuestLogFrame then
		EmptyQuestLogFrame:ClearAllPoints()
		EmptyQuestLogFrame:SetPoint("TOPLEFT", QuestLogListScrollFrame, "TOPLEFT", 0, 0)
		EmptyQuestLogFrame:SetSize(QUESTLOG_LIST_WIDTH, QUESTLOG_LIST_HEIGHT)
	end
	if QuestLogQuestCount and QuestLogListScrollFrame.backdrop then
		QuestLogQuestCount:ClearAllPoints()
		QuestLogQuestCount:SetPoint("BOTTOMRIGHT", QuestLogListScrollFrame.backdrop, "TOPRIGHT", 0, 9)
	end
	if QuestLogCollapseAllButton and QuestLogListScrollFrame.backdrop then
		QuestLogCollapseAllButton:ClearAllPoints()
		QuestLogCollapseAllButton:SetPoint("BOTTOMLEFT", QuestLogListScrollFrame.backdrop, "TOPLEFT", 2, 9)
	end
end
local function LoadQuestLogFrameSkin()
    if not GW.settings.QUESTLOG_SKIN_ENABLED then return end
    local QuestStrip = {
		EmptyQuestLogFrame,
		QuestDetailScrollChildFrame,
		QuestDetailScrollFrame,
		QuestFrame,
		QuestFrameDetailPanel,
		QuestFrameGreetingPanel,
		QuestFrameProgressPanel,
		QuestFrameRewardPanel,
		QuestGreetingScrollFrame,
		QuestInfoItemHighlight,
		QuestLogDetailScrollFrame,
		QuestLogFrame,
		QuestLogListScrollFrame,
		QuestLogQuestCount,
		QuestProgressScrollFrame,
		QuestRewardScrollChildFrame,
		QuestRewardScrollFrame,
		QuestRewardScrollFrame
	}
	for _, object in pairs(QuestStrip) do
		object:GwStripTextures(true)
	end
    local QuestButtons = {
		QuestFrameAcceptButton,
		QuestFrameCancelButton,
		QuestFrameCompleteButton,
		QuestFrameCompleteQuestButton,
		QuestFrameDeclineButton,
		QuestFrameExitButton,
		QuestFrameGoodbyeButton,
		QuestFrameGreetingGoodbyeButton,
		QuestFramePushQuestButton,
		QuestLogFrameAbandonButton
	}
	for _, button in pairs(QuestButtons) do
		if button then
			button:GwStripTextures()
			button:GwSkinButton(false, true)
		end
	end
	QuestLogFrameAbandonButton:GwSkinNegativeButton()
    local ScrollBars = {
		QuestDetailScrollFrameScrollBar,
		QuestGreetingScrollFrameScrollBar,
		QuestLogDetailScrollFrameScrollBar,
		QuestLogListScrollFrameScrollBar,
		QuestProgressScrollFrameScrollBar,
		QuestRewardScrollFrameScrollBar
	}
	for _, object in pairs(ScrollBars) do
		object:GwSkinScrollBar()
	end
    ScrollBars = {
		QuestDetailScrollFrame,
		QuestGreetingScrollFrame,
		QuestLogDetailScrollFrame,
		QuestLogListScrollFrame,
		QuestProgressScrollFrame,
		QuestRewardScrollFrame
	}
	for _, object in pairs(ScrollBars) do
		object:GwSkinScrollFrame()
	end
    for frame, numItems in pairs({ QuestLogItem = MAX_NUM_ITEMS, QuestProgressItem = MAX_REQUIRED_ITEMS }) do
		for i = 1, numItems do
			handleItemButton(_G[frame..i])
		end
	end
    hooksecurefunc('QuestInfo_GetRewardButton', function(rewardsFrame, index)
		local button = rewardsFrame.RewardButtons[index]
		if not button and button.backdrop then return end
		handleItemButton(button)
	end)
	hooksecurefunc('QuestInfoItem_OnClick', function(frame)
		if frame.type == 'choice' then
			frame.backdrop:SetBackdropBorderColor(1, 0.80, 0.10)
			_G[frame:GetName()..'Name']:SetTextColor(1, 0.80, 0.10)
			for i = 1, #QuestInfoRewardsFrame.RewardButtons do
				local item = _G['QuestInfoRewardsFrameQuestInfoItem'..i]
				if item ~= frame then
					local name = _G['QuestInfoRewardsFrameQuestInfoItem'..i..'Name']
					local link = item.type and (QuestInfoFrame.questLog and GetQuestLogItemLink or GetQuestItemLink)(item.type, item:GetID())
					questQualityColors(item, name, link)
				end
			end
		end
	end)
    hooksecurefunc('QuestInfo_ShowRewards', function()
		for i = 1, #QuestInfoRewardsFrame.RewardButtons do
			local item = _G['QuestInfoRewardsFrameQuestInfoItem'..i]
			local name = _G['QuestInfoRewardsFrameQuestInfoItem'..i..'Name']
			local link = item.type and (QuestInfoFrame.questLog and GetQuestLogItemLink or GetQuestItemLink)(item.type, item:GetID())
			questQualityColors(item, name, link)
		end
	end)
    hooksecurefunc('QuestInfo_ShowRewards', function()
		for i = 1, #QuestInfoRewardsFrame.RewardButtons do
			local item = _G['QuestInfoRewardsFrameQuestInfoItem'..i]
			local name = _G['QuestInfoRewardsFrameQuestInfoItem'..i..'Name']
			local link = item.type and (QuestInfoFrame.questLog and GetQuestLogItemLink or GetQuestItemLink)(item.type, item:GetID())
			questQualityColors(item, name, link)
		end
	end)
    hooksecurefunc('QuestFrameProgressItems_Update', function()
		QuestProgressTitleText:SetTextColor(1, .8, .1)
		QuestProgressText:SetTextColor(1, 1, 1)
		QuestProgressRequiredItemsText:SetTextColor(1, .8, 0.1)
		local moneyToGet = GetQuestMoneyToGet()
		if moneyToGet > 0 then
			if moneyToGet > GetMoney() then
				QuestProgressRequiredMoneyText:SetTextColor(.6, .6, .6)
			else
				QuestProgressRequiredMoneyText:SetTextColor(1, .8, .1)
			end
		end
        if not GW.settings.immersiveQuesting.enabled then
            for i = 1, MAX_REQUIRED_ITEMS do
                local item = _G['QuestProgressItem'..i]
                local name = _G['QuestProgressItem'..i..'Name']
                local link = item.type and GetQuestItemLink(item.type, item:GetID())
                questQualityColors(item, name, link)
            end
        end
	end)
	do
		local function UpdateCollapseTexture(button, texture, skip)
			if skip or not texture then return end
			if type(texture) == 'number' then
				if texture == 130838 then
					button:SetNormalTexture("Interface/AddOns/GW2_UI/Textures/uistuff/arrow_right.png", true)
				elseif texture == 130821 then
					button:SetNormalTexture("Interface/AddOns/GW2_UI/textures/uistuff/arrowdown_down.png", true)
				end
			elseif strfind(texture, 'Plus') or strfind(texture, 'Closed') then
				button:SetNormalTexture("Interface/AddOns/GW2_UI/Textures/uistuff/arrow_right.png", true)
			elseif strfind(texture, 'Minus') or strfind(texture, 'Open') then
				button:SetNormalTexture("Interface/AddOns/GW2_UI/textures/uistuff/arrowdown_down.png", true)
			end
		end
		GW.UpdateCollapseTexture = UpdateCollapseTexture
			local lastIndex = 1
			hooksecurefunc('QuestLog_Update', function()
				if not QuestLogFrame:IsShown() then return end
				EnsureQuestLogRows()
				local numDisplayed = QUESTS_DISPLAYED
				if lastIndex < numDisplayed then
					for i = lastIndex, numDisplayed do
						local title = _G['QuestLogTitle'..i]
						if not title then break end
						if not title.collapsedSkined then
							local normalTexture = title:GetNormalTexture()
							title.collapsedSkined = true
							hooksecurefunc(title, 'SetNormalTexture', UpdateCollapseTexture)
							if normalTexture then
								UpdateCollapseTexture(title, normalTexture:GetTexture())
							end
						end
						local normal = title:GetNormalTexture()
						if normal then
							normal:SetSize(16, 16)
						end
						local highlight = _G[title:GetName()..'Highlight']
						if highlight then
							highlight:SetAlpha(0)
						end
					end
					lastIndex = numDisplayed
				end
				LayoutQuestLogFrame()
			end)
		end
	    hooksecurefunc('QuestLog_UpdateQuestDetails', function()
			local requiredMoney = GetQuestLogRequiredMoney()
			if requiredMoney > 0 then
				if requiredMoney > GetMoney() then
					QuestInfoRequiredMoneyText:SetTextColor(0.6, 0.6, 0.6)
				else
					QuestInfoRequiredMoneyText:SetTextColor(1, 0.80, 0.10)
				end
			end
			LayoutQuestLogFrame()
		end)
		hooksecurefunc('QuestLog_Update', function()
			LayoutQuestLogFrame()
			QuestLogQuestCount:ClearAllPoints()
			QuestLogQuestCount:SetPoint('BOTTOMRIGHT', QuestLogListScrollFrame.backdrop, 'TOPRIGHT', 0, 9)
			if QuestLogTrack then
				QuestLogTrack:Hide()
				QuestLogTrack:SetAlpha(0)
				QuestLogTrack:ClearAllPoints()
				QuestLogTrack:SetPoint("BOTTOMLEFT", UIParent, "TOPLEFT", -9999, 9999)
			end
		end)
    local textR, textG, textB = 1, 1, 1
	local titleR, titleG, titleB = 1, 0.80, 0.10
    hooksecurefunc('QuestFrameItems_Update', function()
		QuestLogDescriptionTitle:SetTextColor(titleR, titleG, titleB)
		QuestLogRewardTitleText:SetTextColor(titleR, titleG, titleB)
		QuestLogQuestTitle:SetTextColor(titleR, titleG, titleB)
		QuestLogItemChooseText:SetTextColor(textR, textG, textB)
		QuestLogItemReceiveText:SetTextColor(textR, textG, textB)
		QuestLogObjectivesText:SetTextColor(textR, textG, textB)
		QuestLogQuestDescription:SetTextColor(textR, textG, textB)
		QuestLogSpellLearnText:SetTextColor(textR, textG, textB)
		QuestInfoQuestType:SetTextColor(textR, textG, textB)
		local requiredMoney = GetQuestLogRequiredMoney()
		if requiredMoney > 0 then
			if requiredMoney > GetMoney() then
				QuestInfoRequiredMoneyText:SetTextColor(0.6, 0.6, 0.6)
			else
				QuestInfoRequiredMoneyText:SetTextColor(1, 0.80, 0.10)
			end
		end
		QuestLogItem1:SetPoint('TOPLEFT', QuestLogItemChooseText, 'BOTTOMLEFT', 1, -3)
		local numVisibleObjectives = 0
		local numObjectives = GetNumQuestLeaderBoards()
		for i = 1, numObjectives do
			local _, objType, finished = GetQuestLogLeaderBoard(i)
			if objType ~= 'spell' then
				numVisibleObjectives = numVisibleObjectives + 1
				local objective = _G['QuestLogObjective'..numVisibleObjectives]
				if objective then
					if finished then
						objective:SetTextColor(1, .8, .1)
					else
						objective:SetTextColor(.63, .09, .09)
					end
				end
			end
		end
		for i = 1, MAX_NUM_ITEMS do
			local item = _G['QuestLogItem'..i]
			local name = _G['QuestLogItem'..i..'Name']
			local link = item.type and (GetQuestLogItemLink or GetQuestItemLink)(item.type, item:GetID())
			questQualityColors(item, name, link)
		end
	end)
    hooksecurefunc('QuestInfo_Display', function()
		QuestInfoTitleHeader:SetTextColor(titleR, titleG, titleB)
		QuestInfoDescriptionHeader:SetTextColor(titleR, titleG, titleB)
		QuestInfoObjectivesHeader:SetTextColor(titleR, titleG, titleB)
		QuestInfoRewardsFrame.Header:SetTextColor(titleR, titleG, titleB)
		QuestInfoDescriptionText:SetTextColor(textR, textG, textB)
		QuestInfoObjectivesText:SetTextColor(textR, textG, textB)
		QuestInfoGroupSize:SetTextColor(textR, textG, textB)
		QuestInfoRewardText:SetTextColor(textR, textG, textB)
		QuestInfoQuestType:SetTextColor(textR, textG, textB)
		local numObjectives = GetNumQuestLeaderBoards()
		for i = 1, numObjectives do
			local text = _G['QuestInfoObjective'..i]
			if not text then break end
			text:SetTextColor(textR, textG, textB)
		end
		QuestInfoRewardsFrame.ItemChooseText:SetTextColor(textR, textG, textB)
		QuestInfoRewardsFrame.ItemReceiveText:SetTextColor(textR, textG, textB)
		QuestInfoRewardsFrame.XPFrame.ReceiveText:SetTextColor(textR, textG, textB)
		QuestInfoRewardsFrame.PlayerTitleText:SetTextColor(textR, textG, textB)
		QuestInfoRewardsFrame.spellHeaderPool.textR, QuestInfoRewardsFrame.spellHeaderPool.textG, QuestInfoRewardsFrame.spellHeaderPool.textB = textR, textG, textB
		for spellHeader, _ in QuestInfoFrame.rewardsFrame.spellHeaderPool:EnumerateActive() do
			spellHeader:SetVertexColor(1, 1, 1)
		end
		for spellIcon, _ in QuestInfoFrame.rewardsFrame.spellRewardPool:EnumerateActive() do
			if not spellIcon.backdrop then
				handleItemButton(spellIcon)
			end
		end
		local requiredMoney = GetQuestLogRequiredMoney()
		if requiredMoney > 0 then
			if requiredMoney > GetMoney() then
				QuestInfoRequiredMoneyText:SetTextColor(0.6, 0.6, 0.6)
			else
				QuestInfoRequiredMoneyText:SetTextColor(1, 0.80, 0.10)
			end
		end
		for i = 1, #QuestInfoRewardsFrame.RewardButtons do
			local item = _G['QuestInfoRewardsFrameQuestInfoItem'..i]
			local name = _G['QuestInfoRewardsFrameQuestInfoItem'..i..'Name']
			local link = item.type and (QuestInfoFrame.questLog and GetQuestLogItemLink or GetQuestItemLink)(item.type, item:GetID())
			questQualityColors(item, name, link)
		end
	end)
    for i = 1, MAX_NUM_QUESTS do
		_G['QuestTitleButton'..i..'QuestIcon']:SetPoint('TOPLEFT', 4, 2)
		_G['QuestTitleButton'..i..'QuestIcon']:SetSize(16, 16)
	end
	    QuestFrameGreetingPanel:HookScript('OnUpdate', UpdateGreetingFrame)
		hooksecurefunc('QuestFrameGreetingPanel_OnShow', UpdateGreetingFrame)
		EnsureQuestLogRows()
		LayoutQuestLogFrame()
		GW.CreateFrameHeaderWithBody(QuestLogFrame, QuestLogTitleText:GetText(), "Interface/AddOns/GW2_UI/textures/character/questlog-window-icon.png", {QuestLogListScrollFrame, QuestLogDetailScrollFrame}, nil, nil, true)
		QuestLogListScrollFrame:GwCreateBackdrop(GW.BackdropTemplates.OnlyBorder, true, 2, 2)
	    QuestLogDetailScrollFrame:GwCreateBackdrop(GW.BackdropTemplates.OnlyBorder, true, 2, 4)
	QuestLogTitleText:Hide()
	QuestLogFrameCloseButton:SetPoint("TOPRIGHT", QuestLogFrame, "TOPRIGHT", -5, -3)
    QuestLogFrameCloseButton:GwSkinButton(true)
    QuestLogFrameCloseButton:SetSize(20, 20)
	QuestGreetingFrameHorizontalBreak:GwKill()
		if QuestLogTrackTracking then
			QuestLogTrackTracking:GwKill()
		end
		LayoutQuestLogFrame()
		QuestLogHighlightFrame:SetWidth(QUESTLOG_LIST_WIDTH)
		QuestLogHighlightFrame.SetWidth = GW.NoOp
	QuestLogSkillHighlight:SetAlpha(0.35)
    QuestLogFrame:EnableMouse(true)
    QuestLogFrame:SetMovable(true)
    QuestLogFrame:RegisterForDrag("LeftButton")
    QuestLogFrame:SetClampedToScreen(true)
    QuestLogFrame:SetScript("OnDragStart", function(self)
		self:StartMoving()
    end)
    QuestLogFrame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()
    end)
    QuestFrameNpcNameText:GwSetFontTemplate(DAMAGE_TEXT_FONT, GW.Enum.TextSizeType.BigHeader, "OUTLINE")
    QuestFrame:GwStripTextures()
    QuestFrame:GwCreateBackdrop()
    QuestFrame.tex = QuestFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
    QuestFrame.tex:SetPoint("TOP", QuestFrame, "TOP", 0, 20)
    QuestFrame.tex:SetSize(QuestFrame:GetSize())
    QuestFrame.tex:SetTexture("Interface/AddOns/GW2_UI/textures/party/manage-group-bg.png")
    QuestFrameCloseButton:GwSkinButton(true)
    QuestFrameCloseButton:SetSize(20, 20)
    QuestFrameDetailPanel:GwStripTextures(nil, true)
    QuestDetailScrollFrame:GwStripTextures()
    QuestProgressScrollFrame:GwStripTextures()
    QuestGreetingScrollFrame:GwStripTextures()
    QuestFrameDetailPanel.SealMaterialBG:SetAlpha(0)
    QuestFrameRewardPanel.SealMaterialBG:SetAlpha(0)
    QuestFrameProgressPanel.SealMaterialBG:SetAlpha(0)
    QuestFrameGreetingPanel.SealMaterialBG:SetAlpha(0)
    QuestFrameGreetingPanel:GwStripTextures(true)
    QuestFrameGreetingGoodbyeButton:GwSkinButton(false, true)
    QuestGreetingFrameHorizontalBreak:GwKill()
    QuestDetailScrollChildFrame:GwStripTextures(true)
    QuestRewardScrollChildFrame:GwStripTextures(true)
    QuestFrameProgressPanel:GwStripTextures(true)
    QuestFrameRewardPanel:GwStripTextures(true)
    QuestProgressScrollFrameScrollBar:GwSkinScrollBar()
    QuestProgressScrollFrame:GwSkinScrollFrame()
    QuestFrameAcceptButton:GwSkinButton(false, true)
    QuestFrameDeclineButton:GwSkinButton(false, true)
    QuestFrameCompleteButton:GwSkinButton(false, true)
    QuestFrameGoodbyeButton:GwSkinButton(false, true)
    QuestFrameCompleteQuestButton:GwSkinButton(false, true)
    QuestNPCModelTextFrame:GwStripTextures()
    local w, h = QuestNPCModelTextFrame:GetSize()
    QuestNPCModelTextFrame:GwStripTextures()
    QuestNPCModelTextFrame.tex = QuestNPCModelTextFrame:CreateTexture(nil, "BACKGROUND", nil, 0)
    QuestNPCModelTextFrame.tex:SetPoint("TOP", QuestNPCModelTextFrame, "TOP", 0, 20)
    QuestNPCModelTextFrame.tex:SetSize(w + 30, h + 60)
    QuestNPCModelTextFrame.tex:SetTexture("Interface/AddOns/GW2_UI/textures/party/manage-group-bg.png")
		hooksecurefunc(QuestLogCollapseAllButton, 'SetNormalTexture', GW.UpdateCollapseTexture)
		GW.UpdateCollapseTexture(QuestLogCollapseAllButton, QuestLogCollapseAllButton:GetNormalTexture():GetTexture())
		QuestLogCollapseAllButton:GwStripTextures()
		QuestLogCollapseAllButton:ClearAllPoints()
		QuestLogCollapseAllButton:SetPoint("BOTTOMLEFT", QuestLogListScrollFrame.backdrop, "TOPLEFT", 2, 9)
		QuestLogCollapseAllButton:GetNormalTexture():SetSize(16, 16)
		QuestLogCollapseAllButton:ClearHighlightTexture()
		QuestLogFrame:HookScript("OnShow", function()
			EnsureQuestLogRows()
			LayoutQuestLogFrame()
		end)
	end
GW.LoadQuestLogFrameSkin = LoadQuestLogFrameSkin
