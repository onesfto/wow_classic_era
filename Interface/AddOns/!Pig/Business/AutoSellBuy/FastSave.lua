local _, addonTable = ...;
local BusinessInfo=addonTable.BusinessInfo
function BusinessInfo.FastSave()
	local L=addonTable.locale
	local Create=addonTable.Create
	local PIGOptionsList_R=Create.PIGOptionsList_R
	local PIGEnter=Create.PIGEnter
	local Show_TabBut_R=Create.Show_TabBut_R
	local PIGCheckbutton=Create.PIGCheckbutton
	local PIGFontString=Create.PIGFontString
	local PIGSlider = Create.PIGSlider
	-- 
	local Fun = addonTable.Fun
	local Data=addonTable.Data
	local bagID=Data.bagData["bagID"]
	local bankID=Data.bagData["bankID"]
	--
	local GnName,GnUI,GnIcon,FrameLevel = unpack(BusinessInfo.uiData)
	local _GNList={{L["TRADESELLBUY_SAVE2"],"Save",L["TRADESELLBUY_SAVE1"]},{L["TRADESELLBUY_TAKE2"],"Take",L["TRADESELLBUY_TAKE1"]}}
	---
	local SellBuyUI=_G[GnUI]
	local _TabList,hang_NUM={},18
	for index=1,#_GNList do
		local dataxx=_GNList[index]
		local fujiF,fujiTabBut=PIGOptionsList_R(SellBuyUI.F,dataxx[3],50,"Left")
		_TabList[index]={fujiF,fujiTabBut}
		fujiF.cunGV =PIGFontString(fujiF,{"TOPLEFT",fujiF,"TOPLEFT",10,-9},L["TRADESELLBUY_TISP8"])
		if PIG_MaxTocversion(20000) then
		else
			local function saveGetMoneyString(vvv)
				return (index==1 and L["TRADESELLBUY_SAVE4"] or L["TRADESELLBUY_TAKE4"])..GetMoneyString(vvv*10000)
			end
			fujiF.Slider_Guild = PIGSlider(fujiF,{"TOPLEFT",fujiF,"TOPLEFT",4,-24},{1, 100000, 1,{["Right"]=saveGetMoneyString}},200)
			fujiF.Slider_Guild:PIGSetValue(PIGA_Per["AutoSellBuy"][dataxx[2].."_MoneyGuild"]/10000)
			function fujiF.Slider_Guild:PIGOnValueChange(arg1)
				PIGA_Per["AutoSellBuy"][dataxx[2].."_MoneyGuild"]=arg1*10000
			end
			if PIG_MaxTocversion(120000,true) then
				hang_NUM=17
				local function saveGetMoneyString(vvv)
					return (index==1 and L["TRADESELLBUY_SAVE3"] or L["TRADESELLBUY_TAKE3"])..GetMoneyString(vvv*10000)
				end
				fujiF.Slider_BattleG = PIGSlider(fujiF,{"TOPLEFT",fujiF,"TOPLEFT",4,-54},{1, 100000, 1,{["Right"]=saveGetMoneyString}},200)
				fujiF.Slider_BattleG:PIGSetValue(PIGA_Per["AutoSellBuy"][dataxx[2].."_Money"]/10000)
				function fujiF.Slider_BattleG:PIGOnValueChange(arg1)
					PIGA_Per["AutoSellBuy"][dataxx[2].."_Money"]=arg1*10000
				end
			end
		end
		BusinessInfo.ADDScroll(fujiF,dataxx[1],dataxx[2],hang_NUM,{true,"AutoSellBuy",dataxx[2].."_List"})
	end

	--
	local www,hhh,NewItemTypeLsit = 25,25
	local pigtypeList={}
	local function GetItewdatax()
		local NewItemTypeLsit = CopyTable(Data.ItemTypeLsit)
		table.insert(NewItemTypeLsit,1,{133784,"G",CUSTOM})
		table.insert(NewItemTypeLsit,{134140,"diy",CUSTOM})
		table.insert(NewItemTypeLsit,{134063,"set",CUSTOM})--QuestSharing-QuestLog-Button--QuestSharing-DialogIcon
		return NewItemTypeLsit
	end
	local function _1PIGUseContainerItem(bag,slot,GuildBank)
		if GuildBank then
			AutoStoreGuildBankItem(bag,slot);
		else
			PIGUseContainerItem(bag,slot);
		end
	end
	local function SavezhixingFun(lyData,typeid,iteminfo,bag,slot,cfvv,GuildBank)
		if iteminfo then
			local itemID, itemType, itemSubType, itemEquipLoc, icon, classID, subclassID = PIGGetItemInfoInstant(iteminfo)
			if lyData=="diy" then
				for ib=1,#cfvv do
					if itemID==cfvv[ib][1] then
						_1PIGUseContainerItem(bag,slot,GuildBank);
					end
				end
			else
				for ib=1,#lyData do
					if lyData[ib][2] then
						if classID==lyData[ib][1] and subclassID==lyData[ib][2] then
							_1PIGUseContainerItem(bag,slot,GuildBank);
						end
					else
						if classID==lyData[ib][1] then
							_1PIGUseContainerItem(bag,slot,GuildBank);
						end
					end
				end
			end
		end
	end
	local function PIGRunUseItem(hangui,button,typeid,laiyuan)
		if PIG_MaxTocversion(20000) then PIGErrorMsg(FEATURE_NOT_YET_AVAILABLE) return end
		local shujudata={{},{}}
		local lyData=hangui.lyType
		if button=="LeftButton" then
			if lyData=="G" then
				if laiyuan==1 then
					C_Bank.DepositMoney(BankFrame:GetActiveBankType(), PIGA_Per["AutoSellBuy"][_GNList[1][2].."_Money"])
				else
					DepositGuildBankMoney(PIGA_Per["AutoSellBuy"][_GNList[1][2].."_MoneyGuild"]);
					PIGErrorMsg(L["TRADESELLBUY_SAVE4"]..GetMoneyString(PIGA_Per["AutoSellBuy"][_GNList[1][2].."_MoneyGuild"]))
				end
			else
				shujudata[2]=PIGA_Per["AutoSellBuy"][_GNList[1][2].."_List"]
				for bag=1,#bagID do
					local bganum=PIGGetContainerNumSlots(bagID[bag])
					for slot=1,bganum do
						local itemID=PIGGetContainerItemID(bagID[bag], slot)
						SavezhixingFun(lyData,typeid,itemID,bagID[bag], slot, shujudata[2])
					end
				end
			end
		else
			if lyData=="G" then
				if laiyuan==1 then
					C_Bank.WithdrawMoney(BankFrame:GetActiveBankType(), PIGA_Per["AutoSellBuy"][_GNList[2][2].."_Money"]);
				else
					WithdrawGuildBankMoney(PIGA_Per["AutoSellBuy"][_GNList[2][2].."_MoneyGuild"]);
					PIGErrorMsg(L["TRADESELLBUY_TAKE4"]..GetMoneyString(PIGA_Per["AutoSellBuy"][_GNList[2][2].."_MoneyGuild"]))
				end
			else
				shujudata[2]=PIGA_Per["AutoSellBuy"][_GNList[2][2].."_List"]
				if laiyuan==1 then
					local BankFrameBankType=BankFrame:GetActiveBankType()
					if BankFrameBankType==0 then
						if PIG_MaxTocversion() then
							local bganum=PIGGetContainerNumSlots(-1)
							for slot=1,bganum do
								local itemID=PIGGetContainerItemID(-1, slot)
								SavezhixingFun(lyData,typeid,itemID,-1, slot, shujudata[2])
							end
						end
						for bagid=(bagID[#bagID]+1),11 do
							local bganum=PIGGetContainerNumSlots(bagid)
							for slot=1,bganum do
								local itemID=PIGGetContainerItemID(bagid, slot)
								SavezhixingFun(lyData,typeid,itemID,bagid, slot, shujudata[2])
							end
						end
					elseif BankFrameBankType==2 then
						for bagid=12,17 do
							local bganum=PIGGetContainerNumSlots(bagid)
							for slot=1,bganum do
								local itemID=PIGGetContainerItemID(bagid, slot)
								SavezhixingFun(lyData,typeid,itemID,bagid, slot, shujudata[2])
							end
						end
					end
				else
					for slot=1,98 do
						local ItemLink =GetGuildBankItemLink(GetCurrentGuildBankTab(), slot)
						SavezhixingFun(lyData,typeid,ItemLink,GetCurrentGuildBankTab(), slot, shujudata[2],true)
					end
				end
			end
		end
	end
	---
	local function Show_TabButtype(tabid)
		if BankFrame.Gtabbut then BankFrame.Gtabbut:SetShown(tabid==2) end
	end
	local function add_TabTypeBut()
		if #pigtypeList==0 then
			NewItemTypeLsit = GetItewdatax()
			for ib=#NewItemTypeLsit,1,-1 do
				local savebut = CreateFrame("Button",nil,BankFrame, "TruncatedButtonTemplate",ib);
				savebut:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square");
				savebut:SetNormalTexture(NewItemTypeLsit[ib][1])
				if Fun.IsElvUI() or Fun.IsNDui() then
					savebut:GetNormalTexture():SetTexCoord(0.1,0.9,0.1,0.9)
				end
				savebut:SetSize(www,hhh);
				pigtypeList[ib]=savebut
				savebut.lyType=NewItemTypeLsit[ib][2]
				if ib~=#NewItemTypeLsit then
					savebut:SetPoint("RIGHT",pigtypeList[ib+1],"LEFT",-2,0);
				end
				if NewItemTypeLsit[ib][2]=="set" then
					PIGEnter(savebut,L["TRADESELLBUY_SAVETIPS2"])
				elseif NewItemTypeLsit[ib][2]=="G" then
					BankFrame.Gtabbut=savebut
					PIGEnter(savebut,string.format(L["TRADESELLBUY_SAVETIPS1"],MONEY,MONEY))
				elseif NewItemTypeLsit[ib][2]=="diy" then
					PIGEnter(savebut,string.format(L["TRADESELLBUY_SAVETIPS1"],NewItemTypeLsit[ib][3]..ITEMS,NewItemTypeLsit[ib][3]..ITEMS))
				else	
					PIGEnter(savebut,string.format(L["TRADESELLBUY_SAVETIPS1"],NewItemTypeLsit[ib][3],NewItemTypeLsit[ib][3]))
				end
				savebut:RegisterForClicks("LeftButtonUp","RightButtonUp")
				savebut.Down = savebut:CreateTexture(nil, "OVERLAY");
				savebut.Down:SetTexture(130839);
				savebut.Down:SetAllPoints(savebut)
				savebut.Down:Hide();
				savebut:SetScript("OnMouseDown", function (self)
					self.Down:Show();
				end);
				savebut:SetScript("OnMouseUp", function (self)
					self.Down:Hide();
				end);
				savebut:SetScript("OnClick", function (self,button)
					PlaySound(SOUNDKIT.IG_CHAT_EMOTE_BUTTON);
					if self.lyType=="set" then 
						if button=="LeftButton" then
							SellBuyUI:Show()
							Show_TabBut_R(SellBuyUI.F,_TabList[1][1],_TabList[1][2])
						else
							SellBuyUI:Show()
							Show_TabBut_R(SellBuyUI.F,_TabList[2][1],_TabList[2][2])
						end
						return
					end
					local typeid = self:GetID()
					PIGRunUseItem(self,button,typeid,self.laiyuan)
				end);
			end
		end
	end
	BankFrame:HookScript("OnShow", function(self,event,arg1)
		add_TabTypeBut()
		for ib=#pigtypeList,1,-1 do
			local burxx=pigtypeList[ib]
			burxx:SetParent(BankFrame)
			burxx.laiyuan=1
			if ib==#pigtypeList then
				burxx:ClearAllPoints();
				if PIG_MaxTocversion() then
					burxx:SetPoint("TOPRIGHT",BankFrame,"TOPRIGHT",-56,-40);
				else
					burxx:SetPoint("BOTTOMRIGHT", BankPanel, "BOTTOMRIGHT", -10, 4);
				end
			end
		end
		Show_TabButtype(1)
	end);
	if PIG_MaxTocversion() then
	else
		for tabID,tabbut in pairs(BankFrame.TabSystem.tabs) do
			tabbut:HookScript("OnClick", function(self,...)
				Show_TabButtype(tabID)
			end);
		end
	end
	--公会银行
	Fun.IsAddOnLoaded("Blizzard_GuildBankUI",function()
		GuildBankFrame:HookScript("OnShow", function(self,event,arg1)
			add_TabTypeBut()
			local _,_,_,_,yyyy=self.TabTitleBG:GetPoint();
			self.TabTitleBG:ClearAllPoints();
			self.TabTitleBG:SetPoint("TOPLEFT",GuildBankFrame,"TOPLEFT",30,yyyy);
			GuildItemSearchBox:SetPoint("TOPRIGHT",GuildBankFrame,"TOPRIGHT",-360,yyyy);
			for ib=#pigtypeList,1,-1 do
				local burxx=pigtypeList[ib]
				burxx:SetParent(GuildBankFrame)
				burxx.laiyuan=2
				if ib==#pigtypeList then
					burxx:ClearAllPoints();
					burxx:SetPoint("TOPRIGHT",GuildBankFrame,"TOPRIGHT",-16,yyyy+3);
				end
			end
			Show_TabButtype(2)
		end);
	end)
end