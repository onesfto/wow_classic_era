local addonName, PD = ...;
local BusinessInfo=PD.BusinessInfo
--=========================
function BusinessInfo.StatsInfo_ADDUI()
	if not PIGA["StatsInfo"]["Open"] then return end
	if _G[GnUI] then return end
	local L=PD.locale
	local Data=PD.Data
	local PlayerInfo=Data.PlayerInfo
	local Fun=PD.Fun
	local PIGGetRaceAtlas=Fun.PIGGetRaceAtlas
	local PlayerInfo=PD.Data.PlayerInfo
	local Create=PD.Create
	local PIGFrame=Create.PIGFrame
	local PIGLine=Create.PIGLine
	local PIGFontString=Create.PIGFontString
	local PIGOptionsList_RF=Create.PIGOptionsList_RF
	local GnName,GnUI,GnIcon,FrameLevel = unpack(BusinessInfo.StatsInfoData)
	local Width,Height,biaotiH  = 860, 540, 21;
	--
	Create.PIGModbutton(GnName,GnIcon,GnUI,FrameLevel)
	local StatsInfo=PIGFrame(UIParent,{"CENTER",UIParent,"CENTER",0,60},{Width,Height},GnUI,true)
	StatsInfo:PIGSetBackdrop()
	StatsInfo:PIGClose()
	StatsInfo:PIGSetMovableNoSave()
	StatsInfo.butW=46
	StatsInfo.hang_Height=19
	StatsInfo.title = PIGFontString(StatsInfo,{"TOP", StatsInfo, "TOP", 0, -3},GnName)
	StatsInfo.F=PIGOptionsList_RF(StatsInfo,biaotiH,"Left")
	--
	StatsInfo:RegisterEvent("PLAYER_LEVEL_UP");
	StatsInfo:HookScript("OnEvent",function (self, event)
		if event=="PLAYER_LEVEL_UP" then
			PIGA["StatsInfo"]["Players"][self.allname][5]=UnitLevel("player") or 1
		end
	end)
	--
	local peizhiList={
		["Players"] = "must",
		["PlayerSH"] = "none",
		["Times"] = "none",
		["FBCDRecords"] = "name",
		["SkillData"] = "name",
		["Token"] = "name",
		["Items"] = "name",
		["TradeData"] = "name",
		["Played"] = "name",
	}
	local function Get_renwuInfo()
		StatsInfo.allname = PlayerInfo.AllName
		local race_icon = PIGGetRaceAtlas(PlayerInfo.RaceData.raceFile,PlayerInfo.gender)
		local level = UnitLevel("player")
		PIGA["StatsInfo"]["Players"][StatsInfo.allname]={PlayerInfo.englishFaction,PlayerInfo.RaceData.raceId,race_icon,PlayerInfo.ClassData.classId,level}
		for k,v in pairs(peizhiList) do
			if v=="name" then
				PIGA["StatsInfo"][k][StatsInfo.allname]=PIGA["StatsInfo"][k][StatsInfo.allname] or {}
			end
		end
	end
	Get_renwuInfo()
	--任务目录左侧
	function BusinessInfo.addhangMode1(ly,LF,Parent)
		local hang_NUM  = hang_NUM or 14
		local hang_Height = StatsInfo.hang_Height-3
		--LF.hang_Height=hang_Height
		LF.Scroll = CreateFrame("ScrollFrame",nil,LF, "FauxScrollFrameTemplate");  
		LF.Scroll:SetPoint("TOPLEFT",LF,"TOPLEFT",2,-2);
		LF.Scroll:SetPoint("BOTTOMRIGHT",LF,"BOTTOMRIGHT",-17,2);
		LF.Scroll.ScrollBar:SetScale(0.7)
		LF.Scroll:SetScript("OnVerticalScroll", function(self, offset)
		    FauxScrollFrame_OnVerticalScroll(self, offset, hang_Height, Parent.Update_List_L)
		end)
		LF.listbut={}
		function LF:add_hang(id)
			local hang = CreateFrame("Button", nil, self);
			self.listbut[id]=hang
			hang:SetSize(self:GetWidth()-4,hang_Height*2+4);
			if id==1 then
				hang:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 0);
			else
				hang:SetPoint("TOPLEFT", self.listbut[id-1], "BOTTOMLEFT", 0, -1);
			end
			if id~=hang_NUM then
				hang.line = PIGLine(hang,"BOT",0,nil,nil,{0.3,0.3,0.3,0.6})
			end
			hang.highlight = hang:CreateTexture(nil,"HIGHLIGHT");
			hang.highlight:SetTexture("interface/buttons/ui-listbox-highlight2.blp");
			hang.highlight:SetBlendMode("ADD")
			hang.highlight:SetPoint("TOPLEFT", hang, "TOPLEFT", 2,-1);
			hang.highlight:SetPoint("BOTTOMRIGHT", hang, "BOTTOMRIGHT", -2,1);
			hang.highlight:SetAlpha(0.3);
			hang.highlight1 = hang:CreateTexture();
			hang.highlight1:SetTexture("interface/buttons/ui-listbox-highlight.blp");
			hang.highlight1:SetDrawLayer("BORDER", -1)
			hang.highlight1:SetPoint("TOPLEFT", hang, "TOPLEFT", 2,-1);
			hang.highlight1:SetPoint("BOTTOMRIGHT", hang, "BOTTOMRIGHT", -2,1);
			hang.highlight1:SetAlpha(0.8);
			hang.highlight1:Hide();
			hang.Faction = hang:CreateTexture();
			hang.Faction:SetTexture("interface/glues/charactercreate/ui-charactercreate-factions.blp");
			hang.Faction:SetPoint("TOPLEFT", hang, "TOPLEFT", 3,-2);
			hang.Faction:SetSize(hang_Height,hang_Height);
			hang.Race = hang:CreateTexture();
			hang.Race:SetPoint("LEFT", hang.Faction, "RIGHT", 1,0);
			hang.Race:SetSize(hang_Height,hang_Height);
			hang.Class = hang:CreateTexture();
			hang.Class:SetTexture("interface/glues/charactercreate/ui-charactercreate-classes.blp")
			hang.Class:SetPoint("LEFT", hang.Race, "RIGHT", 1,0);
			hang.Class:SetSize(hang_Height,hang_Height);
			hang.level = PIGFontString(hang,{"LEFT", hang.Class, "RIGHT", 2, 0},1,"OUTLINE")
			hang.level:SetTextColor(1,0.843,0, 1);
			hang.nameDQ = hang:CreateTexture();
			hang.nameDQ:SetTexture("interface/common/indicator-green.blp")
			hang.nameDQ:SetPoint("LEFT", hang.level, "RIGHT", 1,0);
			hang.nameDQ:SetSize(hang_Height+2,hang_Height+2);
			if ly~="trade" then
				hang.guanchaC = CreateFrame("Button",nil, hang);
				hang.guanchaC:SetSize(hang_Height,hang_Height);
				hang.guanchaC:SetPoint("TOPRIGHT", hang, "TOPRIGHT", -15,-2);
				hang.guanchaC:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
				hang.guanchaC.tex = hang.guanchaC:CreateTexture();
				hang.guanchaC.tex:SetTexture(133122)
				hang.guanchaC.tex:SetPoint("CENTER", hang.guanchaC, "CENTER", 0,0);
				hang.guanchaC.tex:SetSize(hang_Height,hang_Height);
				hang.guanchaC:HookScript("OnMouseDown", function (self)
					self.tex:SetPoint("CENTER", hang.guanchaC, "CENTER", 1.5,-1.5);
				end);
				hang.guanchaC:HookScript("OnMouseUp", function (self)
					self.tex:SetPoint("CENTER", hang.guanchaC, "CENTER", 0,0);
				end);
				hang.guanchaC:SetScript("OnClick", function (self)
					PlaySound(SOUNDKIT.IG_CHAT_EMOTE_BUTTON);
					Fun.lixian_chakan(hang.allname,PIGA["StatsInfo"]["Players"][hang.allname],PIGA["StatsInfo"]["Items"][hang.allname])
				end)
			end
			hang.name = PIGFontString(hang,{"TOPLEFT", hang.Faction, "BOTTOMLEFT", 0, -1},nil,"OUTLINE")
			hang:SetScript("OnClick", function (self)
				PlaySound(SOUNDKIT.IG_CHAT_EMOTE_BUTTON);
				Parent.SelectName=hang.allname
				Parent:Update_List_L()
			end)
			return hang
		end
		function Parent:Update_List_L()
			if not self:IsVisible() then return end
			for _,but in pairs(LF.listbut) do
				but:Hide()
			end
			local cdmulu={};
			local PlayerData = PIGA["StatsInfo"]["Players"]
			local PlayerSH = PIGA["StatsInfo"]["PlayerSH"]
			if PlayerData[StatsInfo.allname] and not PlayerSH[StatsInfo.allname] then
				local dangqianC=PlayerData[StatsInfo.allname]
				table.insert(cdmulu,{StatsInfo.allname,dangqianC[1],dangqianC[2],dangqianC[3],dangqianC[4],dangqianC[5],true})
			end
		   	for k,v in pairs(PlayerData) do
		   		if k~=StatsInfo.allname and PlayerData[k] and not PlayerSH[k] then
		   			table.insert(cdmulu,{k,v[1],v[2],v[3],v[4],v[5]})
		   		end
		   	end
			-- local SyncPlayers=Data.SyncData.StatsInfo.Players
			-- for k,v in pairs(SyncPlayers) do
			-- 	if not PlayerData[k] then
			-- 		print(k)
			-- 		table.insert(cdmulu,{k,v[1],v[2],v[3],v[4],v[5]})
		   	-- 	end
			-- end	
			local ItemsNum = #cdmulu;
			if ItemsNum>0 then
				self.SelectName=self.SelectName or StatsInfo.allname
				local ScrollUI=LF.Scroll
			    FauxScrollFrame_Update(ScrollUI, ItemsNum, hang_NUM, hang_Height);
			    local offset = FauxScrollFrame_GetOffset(ScrollUI);
			    for id = 1, hang_NUM do
					local dangqian = id+offset;
					if cdmulu[dangqian] then
						if not LF.listbut[id] then
							LF:add_hang(id)
						end
						local hang = LF.listbut[id]
						hang:Show();
						if self.SelectName==cdmulu[dangqian][1] then
							hang.highlight1:Show();
						end
						if cdmulu[dangqian][2]=="Alliance" then
							hang.Faction:SetTexCoord(0,0.5,0,1);
						elseif cdmulu[dangqian][2]=="Horde" then
							hang.Faction:SetTexCoord(0.5,1,0,1);
						end
						hang.Race:SetAtlas(cdmulu[dangqian][4]);
						local className, classFile, classID = PIGGetClassInfo(cdmulu[dangqian][5])
						hang.Class:SetTexCoord(unpack(CLASS_ICON_TCOORDS[classFile]));
						hang.level:SetText(cdmulu[dangqian][6]);
						hang.name:SetText(Fun.PruningServerName(cdmulu[dangqian][1]));
						hang.allname=cdmulu[dangqian][1]
						local color = PIG_CLASS_COLORS[classFile];
						hang.name:SetTextColor(color.r, color.g, color.b, 1);
						if hang.guanchaC then hang.guanchaC:SetShown(not cdmulu[dangqian][7]) end
						hang.nameDQ:SetShown(cdmulu[dangqian][7])
						hang.highlight1:SetShown(self.SelectName==hang.allname)
					end
				end
			end
			Parent:Update_List_R()
		end
	end
	BusinessInfo.FBCD(StatsInfo,peizhiList)
	BusinessInfo.SkillCD(StatsInfo,peizhiList)
	BusinessInfo.Token(StatsInfo,peizhiList)
	BusinessInfo.Item(StatsInfo,peizhiList)
	BusinessInfo.Trade(StatsInfo,peizhiList)
	BusinessInfo.AH(StatsInfo,peizhiList)
	BusinessInfo.Time(StatsInfo,peizhiList)
	BusinessInfo.Player(StatsInfo,peizhiList)
	BusinessInfo.Admin(StatsInfo,peizhiList)
end