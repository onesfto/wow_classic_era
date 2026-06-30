local addonName, addonTable = ...;
--
local L=addonTable.locale
local Data=addonTable.Data
local Fun=addonTable.Fun
local Create=addonTable.Create
local PIGLine=Create.PIGLine
local PIGFrame=Create.PIGFrame
local PIGButton = Create.PIGButton
local PIGFontString=Create.PIGFontString
local PIGOptionsList_R=Create.PIGOptionsList_R
local PIGTabBut=Create.PIGTabBut
------
local BusinessInfo=addonTable.BusinessInfo
local shibaiERR = {
	ERR_TRADE_BAG,--"你不能交易装有物品的包";
	ERR_TRADE_BAG_FULL,--"交易失败，你没有足够的物品栏空间。";
	ERR_TRADE_BLOCKED_S,--"%s要求进行交易，你拒绝了。";
	ERR_TRADE_BOUND_ITEM,--"你不能交易一件灵魂绑定物品";
	ERR_TRADE_CANCELLED,--"交易取消。";
	ERR_TRADE_EQUIPPED_BAG,--"你无法交易已经装备的包裹。";
	ERR_TRADE_FACTION_SPECIFIC,--"你无法与对立阵营交易阵营特色物品。";
	ERR_TRADE_GROUND_ITEM,--"你不能交易一件还放在地上的物品。";
	ERR_TRADE_MAX_COUNT_EXCEEDED,--"你拥有超过一件";
	ERR_TRADE_NOT_ON_TAPLIST,--"你只能将绑定物品交易给拥有该物品起始拾取资格的玩家。";
	ERR_TRADE_QUEST_ITEM,--"你不能交易一件任务物品";
	ERR_TRADE_REQUEST_S,--"%s想要和你进行交易。";
	ERR_TRADE_SELF,--"你不能与自己交易。";
	ERR_TRADE_TARGET_BAG_FULL,--"交易失败，交易目标没有足够的物品栏空间。";
	ERR_TRADE_TARGET_DEAD,--"你不能和已死亡的玩家交易";
	ERR_TRADE_TARGET_MAX_COUNT_EXCEEDED,--"交易对象已经拥有该类唯一物品。";
	ERR_TRADE_TARGET_MAX_LIMIT_CATEGORY_COUNT_EXCEEDED_IS,--"你的交易对象只能携带%d个%s";
	ERR_TRADE_TEMP_ENCHANT_BOUND,--"你不能交易带有临时附魔的物品。";
	ERR_TRADE_TOO_FAR,--"交易目标太远";
	ERR_TRADE_WRONG_REALM,--"你只能与来自其它服务器的玩家交易魔法制造的物品";
}
local function IsErrTrade(arg2)
	for k,v in pairs(shibaiERR) do
		if arg2==v then
			return true
		end
	end
	return false
end
Fun.IsErrTrade=IsErrTrade
function BusinessInfo.Trade(StatsInfo)
	local PlayerData = PIGA["StatsInfo"]["Players"]
	for k,v in pairs(PlayerData) do
		local shujuyaun=PIGA["StatsInfo"]["TradeData"][k]
		if #shujuyaun>0 then
			if #shujuyaun[1]>0 then
				for ii=#shujuyaun[1], 1, -1 do
					local dangqianday=floor(GetServerTime()/60/60/24);
					local jiluday=shujuyaun[1][ii];
					if (dangqianday-jiluday)>30 then
						table.remove(shujuyaun[1],ii);
						table.remove(shujuyaun[2],ii);
					end
				end	
			end
		end
   	end
	local fujiF,fujiTabBut=PIGOptionsList_R(StatsInfo.F,L["TRADECHARDATA_TRADETAB"],StatsInfo.butW,"Left")
	---
	fujiF.LF=PIGFrame(fujiF)
	fujiF.LF:PIGSetBackdrop(0)
	fujiF.LF:SetWidth(190)
	fujiF.LF:SetPoint("TOPLEFT",fujiF,"TOPLEFT",0,0);
	fujiF.LF:SetPoint("BOTTOMLEFT",fujiF,"BOTTOMLEFT",0,0);
	BusinessInfo.addhangMode1("trade",fujiF.LF,fujiF)

	--日期列表
	fujiF.TimeList=PIGFrame(fujiF)
	fujiF.TimeList:SetWidth(106)
	fujiF.TimeList:PIGSetBackdrop(0)
	fujiF.TimeList:SetPoint("TOPLEFT",fujiF.LF,"TOPRIGHT",2,0);
	fujiF.TimeList:SetPoint("BOTTOMLEFT",fujiF.LF,"BOTTOMRIGHT",0,0);
	local T_hang_Height,T_hang_NUM  = 24, 21;
	fujiF.TimeList.Scroll = CreateFrame("ScrollFrame",nil,fujiF.TimeList, "FauxScrollFrameTemplate");  
	fujiF.TimeList.Scroll:SetPoint("TOPLEFT",fujiF.TimeList,"TOPLEFT",0,-2);
	fujiF.TimeList.Scroll:SetPoint("BOTTOMRIGHT",fujiF.TimeList,"BOTTOMRIGHT",-24,2);
	fujiF.TimeList.Scroll:SetScale(0.7);
	fujiF.TimeList.Scroll:SetScript("OnVerticalScroll", function(self, offset)
	    FauxScrollFrame_OnVerticalScroll(self, offset, T_hang_Height, fujiF.Update_List_R)
	end)
	fujiF.TimeList.listbut={}
	function fujiF:Update_List_R()
		for _,but in pairs(fujiF.TimeList.listbut) do
			but:Hide()
		end
		if not fujiF.SelectName then return end
		local TimeDataX=PIGA["StatsInfo"]["TradeData"][fujiF.SelectName]
		if TimeDataX and TimeDataX[1] then
			local DataX = TimeDataX[1];
			local ItemsNum = #DataX;
			fujiF.SelectTime=fujiF.SelectTime or ItemsNum
			local Scrollui=fujiF.TimeList.Scroll
			FauxScrollFrame_Update(Scrollui, ItemsNum, T_hang_NUM, T_hang_Height);
			local offset = FauxScrollFrame_GetOffset(Scrollui);
			for i = 1, T_hang_NUM do
				local dangqian = (ItemsNum+1)-i-offset;
				if dangqian>0 and DataX[dangqian] then
					if not fujiF.TimeList.listbut[i] then
						local listbut = CreateFrame("Button", nil,fujiF.TimeList);
						fujiF.TimeList.listbut[i]=listbut
						listbut:SetSize(fujiF.TimeList:GetWidth()-4,T_hang_Height);
						if i==1 then
							listbut:SetPoint("TOPLEFT", fujiF.TimeList.Scroll, "TOPLEFT", 0, 0);
						else
							listbut:SetPoint("TOPLEFT", fujiF.TimeList.listbut[i-1], "BOTTOMLEFT", 0, 0);
						end
						listbut:Hide()
						listbut.highlight = listbut:CreateTexture(nil,"HIGHLIGHT");
						listbut.highlight:SetTexture("interface/buttons/ui-listbox-highlight2.blp");
						listbut.highlight:SetBlendMode("ADD")
						listbut.highlight:SetPoint("TOPLEFT", listbut, "TOPLEFT", 2,0);
						listbut.highlight:SetPoint("BOTTOMRIGHT", listbut, "BOTTOMRIGHT", -2,0);
						listbut.highlight:SetAlpha(0.3);
						listbut.highlight1 = listbut:CreateTexture();
						listbut.highlight1:SetTexture("interface/buttons/ui-listbox-highlight.blp");
						listbut.highlight1:SetPoint("TOPLEFT", listbut, "TOPLEFT", 2,0);
						listbut.highlight1:SetPoint("BOTTOMRIGHT", listbut, "BOTTOMRIGHT", -2,0);
						listbut.highlight1:SetAlpha(0.8);
						listbut.highlight1:Hide();
						listbut.Title = PIGFontString(listbut,{"LEFT", listbut, "LEFT", 6, 0})
						listbut.Title:SetTextColor(0,250/255,154/255, 1);
						listbut:SetScript("OnClick", function (self)
							fujiF.SelectTime=self:GetID()
							fujiF:Update_List_R()
						end)
					end
					local fuji = fujiF.TimeList.listbut[i]
					fuji:Show()
					fuji:SetID(dangqian)
					fuji.Title:SetText(date("%Y-%m-%d",DataX[dangqian]*86400));
					fuji.highlight1:SetShown(dangqian==fujiF.SelectTime)
					local Color=dangqian==fujiF.SelectTime and {1,1,1} or {0,250/255,154/255}
					fuji.Title:SetTextColor(unpack(Color));
				end
			end
			fujiF:Update_List_RR()
		end
	end
	-------
	fujiF.ListRR=PIGFrame(fujiF)
	fujiF.ListRR:PIGSetBackdrop(0)
	fujiF.ListRR:SetPoint("TOPLEFT",fujiF.TimeList,"TOPRIGHT",2,0);
	fujiF.ListRR:SetPoint("BOTTOMRIGHT",fujiF,"BOTTOMRIGHT",0,2);
	local N_hang_Height,N_hang_NUM  = 40, 12;
	fujiF.ListRR.Scroll = CreateFrame("ScrollFrame",nil,fujiF.ListRR, "FauxScrollFrameTemplate");  
	fujiF.ListRR.Scroll:SetPoint("TOPLEFT",fujiF.ListRR,"TOPLEFT",0,-2);
	fujiF.ListRR.Scroll:SetPoint("BOTTOMRIGHT",fujiF.ListRR,"BOTTOMRIGHT",-24,36);
	fujiF.ListRR.Scroll:SetScale(0.7);
	fujiF.ListRR.Scroll:SetScript("OnVerticalScroll", function(self, offset)
	    FauxScrollFrame_OnVerticalScroll(self, offset, N_hang_Height, fujiF.Update_List_RR)
	end)
	fujiF.ListRR.BotF=PIGFrame(fujiF.ListRR,{"BOTTOMLEFT",fujiF.ListRR,"BOTTOMLEFT",0,0})
	fujiF.ListRR.BotF:SetPoint("BOTTOMRIGHT",fujiF.ListRR,"BOTTOMRIGHT",0,0);
	fujiF.ListRR.BotF:PIGSetBackdrop(0)
	fujiF.ListRR.BotF:SetHeight(24)
	fujiF.ListRR.BotF.JiluNumT = PIGFontString(fujiF.ListRR.BotF,{"LEFT",fujiF.ListRR.BotF,"LEFT",10,0},L["TRADECHARDATA_TRADE1"])
	fujiF.ListRR.BotF.JiluNum = PIGFontString(fujiF.ListRR.BotF,{"LEFT",fujiF.ListRR.BotF.JiluNumT,"RIGHT",2,0},0)
	fujiF.ListRR.BotF.JiluNum:SetTextColor(1, 1, 1, 1);
	fujiF.ListRR.BotF.DELtimeall=PIGButton(fujiF.ListRR.BotF,{"RIGHT",fujiF.ListRR.BotF,"RIGHT",-140,0},{60,18},DELETE)
	fujiF.ListRR.BotF.DELtimeall:Disable()
	fujiF.ListRR.BotF.DELtimeall:SetScript("OnClick", function(self, button)
		StaticPopup_Show("PIGTRADELISTTIMENR_DEL");
	end)
	StaticPopupDialogs["PIGTRADELISTTIMENR_DEL"] = {
		text = L["TRADECHARDATA_TRADE2"],
		button1 = YES,
		button2 = NO,
		OnAccept = function()
			if fujiF.SelectName and PIGA["StatsInfo"]["TradeData"][fujiF.SelectName] then
				table.remove(PIGA["StatsInfo"]["TradeData"][fujiF.SelectName][1],fujiF.SelectTime);
				table.remove(PIGA["StatsInfo"]["TradeData"][fujiF.SelectName][2],fujiF.SelectTime);
				fujiF:Update_List_R()
			end
		end,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
	}
	
	fujiF.ListRR.listbut={}
	function fujiF:Update_List_RR()
		fujiF.ListRR.BotF.DELtimeall:Disable()
		for _,but in pairs(fujiF.ListRR.listbut) do
			but:Hide()
			for _,itembut in pairs(but.itembuttons) do
				itembut:SetWidth(0.0001)
				itembut:Hide()
			end
		end
		if not fujiF.SelectName or not fujiF.SelectTime then return end
		local playerData=PIGA["StatsInfo"]["TradeData"][fujiF.SelectName]
		if playerData and playerData[2] then
			local shujuData = playerData[2][fujiF.SelectTime]
			if shujuData then
				local ItemsNum = #shujuData;
				fujiF.ListRR.BotF.DELtimeall:Enable()
				fujiF.ListRR.BotF.JiluNum:SetText(ItemsNum)
				local ScrollUI=fujiF.ListRR.Scroll
			    FauxScrollFrame_Update(ScrollUI, ItemsNum, N_hang_NUM, N_hang_Height);
			    local offset = FauxScrollFrame_GetOffset(ScrollUI);
			    for i = 1, N_hang_NUM do
					local dangqian = (ItemsNum+1)-i-offset;
					if shujuData[dangqian] then
						if not fujiF.ListRR.listbut[i] then
							local listbut = CreateFrame("Button", nil,fujiF.ListRR);
							fujiF.ListRR.listbut[i]=listbut
							listbut:SetSize(fujiF.ListRR:GetWidth()-4,N_hang_Height);
							if i==1 then
								listbut:SetPoint("TOPLEFT", fujiF.ListRR.Scroll, "TOPLEFT", 1, 0);
							else
								listbut:SetPoint("TOPLEFT", fujiF.ListRR.listbut[i-1], "BOTTOMLEFT", 0, 0);
							end
							listbut.bg1 = listbut:CreateTexture();
							listbut.bg1:SetTexture("interface/buttons/ui-listbox-highlight2.blp");
							listbut.bg1:SetBlendMode("ADD")
							listbut.bg1:SetPoint("TOPLEFT", listbut, "TOPLEFT", 0,0);
							listbut.bg1:SetPoint("BOTTOMRIGHT", listbut, "BOTTOMRIGHT", 0,0);
							local tmp1,tmp2 = math.modf(i/2)
							if tmp2==0 then
								listbut.bg1:SetColorTexture(0.3, 0.3, 0.3, 0.2);
							else
								listbut.bg1:SetColorTexture(0.1, 0.1, 0.1, 0.2)
							end
							listbut:Hide()
							listbut.highlight = listbut:CreateTexture(nil,"HIGHLIGHT");
							listbut.highlight:SetTexture("interface/buttons/ui-listbox-highlight2.blp");
							listbut.highlight:SetBlendMode("ADD")
							listbut.highlight:SetPoint("TOPLEFT", listbut, "TOPLEFT", 2,0);
							listbut.highlight:SetPoint("BOTTOMRIGHT", listbut, "BOTTOMRIGHT", -2,0);
							listbut.highlight:SetAlpha(0.3);
							listbut.Title = PIGFontString(listbut,{"LEFT", listbut, "LEFT", 2, 0})
							listbut.Title:SetTextColor(0.9, 0.9, 0.9, 0.9);
							listbut.Race = listbut:CreateTexture();
							listbut.Race:SetPoint("TOPLEFT", listbut, "TOPLEFT", 36, -2);
							listbut.Race:SetSize(N_hang_Height*0.5-2,N_hang_Height*0.5-2);
							listbut.Class = listbut:CreateTexture();
							listbut.Class:SetTexture("interface/glues/charactercreate/ui-charactercreate-classes.blp")
							listbut.Class:SetPoint("LEFT", listbut.Race, "RIGHT", 1,0);
							listbut.Class:SetSize(N_hang_Height*0.5-2,N_hang_Height*0.5-2);
							listbut.level = PIGFontString(listbut,{"LEFT", listbut.Class, "RIGHT", 2, 0},1,"OUTLINE")
							listbut.level:SetTextColor(1,0.843,0,1);
							listbut.Name = PIGFontString(listbut,{"LEFT", listbut.level, "RIGHT", 0, 0})
							listbut.MapName = PIGFontString(listbut,{"TOPLEFT", listbut.Race, "BOTTOMLEFT", 0, -3})
							listbut.MapName:SetTextColor(0.6,0.6,0.6,1);
							listbut.jiaochuP = PIGFontString(listbut,{"TOPLEFT", listbut, "TOPLEFT", 250, -2},"交出:")
							listbut.jiaochuP:SetTextColor(1,0,0,1);
							listbut.shoudaoP = PIGFontString(listbut,{"TOPLEFT", listbut, "TOPLEFT", 250, -N_hang_Height*0.5-2},"收到:")
							listbut.shoudaoP:SetTextColor(0,1,0,1);
							listbut.itembuttons={}
							for butid=1,12 do
								local xitembut = CreateFrame("Button",nil,listbut)
								listbut.itembuttons[butid]=xitembut
								xitembut:Hide()
								xitembut:SetSize(N_hang_Height*0.5-2,N_hang_Height*0.5-2)
								if butid==1 then
									xitembut:SetPoint("LEFT", listbut.jiaochuP, "RIGHT", 4,-1);
								elseif butid==7 then
									xitembut:SetPoint("LEFT", listbut.shoudaoP, "RIGHT", 4,-1);
								else
									xitembut:SetPoint("LEFT", listbut.itembuttons[butid-1], "RIGHT", 0,0);
								end
								xitembut.numItems = PIGFontString(xitembut,{"BOTTOMRIGHT", xitembut, "BOTTOMRIGHT", 0, 0},nil,"OUTLINE",12)
								xitembut.numItems:SetTextColor(1, 1, 1, 1);
								xitembut:HookScript("OnEnter", function (self)
									GameTooltip:ClearLines();
									GameTooltip:SetOwner(self, "ANCHOR_LEFT",0,0);
									GameTooltip:SetHyperlink(self.itemlink)
									GameTooltip:Show();
								end);
								xitembut:HookScript("OnLeave", function (self)
									GameTooltip:ClearLines();
									GameTooltip:Hide() 
								end);
							end
							listbut.MoneyP = PIGFontString(listbut,{"LEFT", listbut.itembuttons[6], "RIGHT", 2, 0})
							listbut.MoneyP:SetTextColor(1,0,0,1);
							listbut.MoneyT = PIGFontString(listbut,{"LEFT", listbut.itembuttons[12], "RIGHT", 2, 0})
							listbut.MoneyT:SetTextColor(0,1,0,1);
						end
						local fuji = fujiF.ListRR.listbut[i]
						fuji:Show()
						fuji.Title:SetText(date("%H:%M",shujuData[dangqian]["Time"]));
						if shujuData[dangqian]["Name"]==NONE or shujuData[dangqian]["Class"]==nil or shujuData[dangqian]["Class"]==NONE then
							fuji.level:SetText("??");fuji.Name:SetText("??");fuji.MapName:SetText("??");fuji.MoneyP:SetText("??");fuji.MoneyT:SetText("??")
						else
							fuji.Race:SetAtlas(shujuData[dangqian]["Race"]);
							local className, classFile, classID = PIGGetClassInfo(shujuData[dangqian]["Class"])
							fuji.Class:SetTexCoord(unpack(CLASS_ICON_TCOORDS[classFile]));
							fuji.level:SetText(shujuData[dangqian]["Level"]);
							local color = PIG_CLASS_COLORS[classFile or NONE];
							fuji.Name:SetText(shujuData[dangqian]["Name"])
							fuji.Name:SetTextColor(color.r, color.g, color.b, 1);
							fuji.MapName:SetText(shujuData[dangqian]["Map"])
							if shujuData[dangqian]["MoneyP"] and shujuData[dangqian]["MoneyP"]>0 then
								fuji.MoneyP:SetText(GetMoneyString(shujuData[dangqian]["MoneyP"]))
							else
								fuji.MoneyP:SetText("")
							end
							if shujuData[dangqian]["MoneyT"] and shujuData[dangqian]["MoneyT"]>0 then
								fuji.MoneyT:SetText(GetMoneyString(shujuData[dangqian]["MoneyT"]))
							else
								fuji.MoneyT:SetText("")
							end
							for butid=1,6 do
								if shujuData[dangqian]["ItemP"][butid]~=NONE then
									fuji.itembuttons[butid]:Show()
									fuji.itembuttons[butid]:SetWidth(N_hang_Height*0.5-2)
									local itemID, itemType, itemSubType, itemEquipLoc, icon = PIGGetItemInfoInstant(shujuData[dangqian]["ItemP"][butid][1]) 
									fuji.itembuttons[butid]:SetNormalTexture(icon)
									fuji.itembuttons[butid].numItems:SetText(shujuData[dangqian]["ItemP"][butid][2])
									fuji.itembuttons[butid].itemlink=shujuData[dangqian]["ItemP"][butid][1]
								end
								if shujuData[dangqian]["ItemT"][butid]~=NONE then
									local itemID, itemType, itemSubType, itemEquipLoc, icon = PIGGetItemInfoInstant(shujuData[dangqian]["ItemT"][butid][1]) 
									local newbutid = butid+6
									fuji.itembuttons[newbutid]:Show()
									fuji.itembuttons[newbutid]:SetWidth(N_hang_Height*0.5-2)
									fuji.itembuttons[newbutid]:SetNormalTexture(icon)
									fuji.itembuttons[newbutid].numItems:SetText(shujuData[dangqian]["ItemT"][butid][2])
									fuji.itembuttons[newbutid].itemlink=shujuData[dangqian]["ItemT"][butid][1]
								end
							end
						end
						---
					end
				end
			end
		end
	end
	--
	fujiF:HookScript("OnShow", function(self)
		self:Update_List_L();
	end)
	----
	local function IsTimeDay(DQday,timelist)
		for d=#timelist, 1, -1 do
			if timelist[d]==DQday then
				return true,d
			end
		end
		return false
	end
	local IsFriend=Fun.IsFriend
	fujiF:RegisterEvent("UI_INFO_MESSAGE");
	fujiF:HookScript("OnEvent", function(self,event,arg1,arg2)
		if event=="UI_INFO_MESSAGE" then
			if arg2==ERR_TRADE_COMPLETE then
				local xiaoxiTime=GetServerTime()
				local MapName=GetZoneText().."-"..GetSubZoneText()
				local TradeDATA=CopyTable(Data.TradeInfo)
				TradeDATA["Time"]=xiaoxiTime
				TradeDATA["Map"]=MapName
				local YYDAY=floor(xiaoxiTime/60/60/24)
				local TimeDataX=PIGA["StatsInfo"]["TradeData"][StatsInfo.allname]
				if #TimeDataX>0 then
					local cunzai,xuhao=IsTimeDay(YYDAY,TimeDataX[1])
					if cunzai then
						table.insert(TimeDataX[2][xuhao], TradeDATA);
					else
						table.insert(TimeDataX[1], YYDAY);
						table.insert(TimeDataX[2], {TradeDATA});
					end
				else
					PIGA["StatsInfo"]["TradeData"][StatsInfo.allname]={{YYDAY},{{TradeDATA}}}
				end
				local FSmsgT = {"",""}
				if TradeDATA.MoneyP>0 then
					FSmsgT[1]=FSmsgT[1]..(TradeDATA.MoneyP*0.0001).."G"
				end
				for i=1,6 do
					if TradeDATA.ItemP[i]~=NONE then
						FSmsgT[1]=FSmsgT[1]..TradeDATA.ItemP[i][1]
						if TradeDATA.ItemP[i][2]>1 then
							FSmsgT[1]=FSmsgT[1].."×"..TradeDATA.ItemP[i][2]
						end
					end
				end
				if FSmsgT[1]~="" then FSmsgT[1]=L["TRADECHARDATA_NOTICETXT1"]..FSmsgT[1] end
				if TradeDATA.MoneyT>0 then
					FSmsgT[2]=FSmsgT[2]..(TradeDATA.MoneyT*0.0001).."G"
				end
				for i=1,6 do
					if TradeDATA.ItemT[i]~=NONE then
						FSmsgT[2]=FSmsgT[2]..TradeDATA.ItemT[i][1]
						if TradeDATA.ItemT[i][2]>1 then
							FSmsgT[2]=FSmsgT[2].."×"..TradeDATA.ItemT[i][2]
						end
					end
				end
				if FSmsgT[2]~="" and FSmsgT[1]~="" then
					FSmsgT[2]=","..L["TRADECHARDATA_NOTICETXT2"]..FSmsgT[2]
				elseif FSmsgT[2]~="" then
					FSmsgT[2]=L["TRADECHARDATA_NOTICETXT2"]..FSmsgT[2]
				end
				if FSmsgT[1]~="" or FSmsgT[2]~="" then
					local msgT = "["..addonName.."]:"..string.format(L["TRADECHARDATA_NOTICETXT3"],TradeDATA.Name,FSmsgT[1],FSmsgT[2])
					if PIGA["StatsInfo"]["TradeTongGao"] then
						if PIGA["StatsInfo"]["TradeIsFriend"] and IsFriend(TradeDATA.Name) then
						else
							if PIGA["StatsInfo"]["TradeTongGaoChannel"]=="WHISPER" then
								SendChatMessage(msgT, "WHISPER", nil, TradeDATA.Name);
							else
								if HasLFGRestrictions() then
									SendChatMessage(msgT, "INSTANCE_CHAT");
								elseif IsInRaid() then
									SendChatMessage(msgT, "RAID");
								elseif IsInGroup() then
									SendChatMessage(msgT, "PARTY");
								end
								return
							end
						end
					end
					if PIGIsAddOnLoaded(L.addnames[3]) and PIGA["GDKP"]["Rsetting"]["tradetonggao"] then
						if IsInRaid() then
							SendChatMessage(msgT, "RAID");
						elseif IsInGroup() then
							SendChatMessage(msgT, "PARTY");
						end
					end
				end
			elseif IsErrTrade(arg2) and Data.TradeInfo.Name then
				if PIGA["StatsInfo"]["TradeIsError"] then return end
				local msgT = "["..addonName.."]:"..string.format(L["TRADECHARDATA_NOTICETXT4"],Data.TradeInfo.Name,arg2)
				if PIGA["StatsInfo"]["TradeTongGao"] then
					if PIGA["StatsInfo"]["TradeIsFriend"] and IsFriend(Data.TradeInfo.Name) then
					else
						if PIGA["StatsInfo"]["TradeTongGaoChannel"]=="WHISPER" then
							SendChatMessage(msgT, "WHISPER", nil, Data.TradeInfo.Name);
						else
							if HasLFGRestrictions() then
								SendChatMessage(msgT, "INSTANCE_CHAT");
							elseif IsInRaid() then
								SendChatMessage(msgT, "RAID");
							elseif IsInGroup() then
								SendChatMessage(msgT, "PARTY");
							end
							return
						end
					end
				end
				if PIGIsAddOnLoaded(L.addnames[3]) and PIGA["GDKP"]["Rsetting"]["tradetonggao"] and IsInRaid() then
					SendChatMessage(msgT, "RAID");
				end
			end
		end
	end)
end
