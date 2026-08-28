local addonName, addonTable = ...;
local BusinessInfo=addonTable.BusinessInfo
function BusinessInfo.Admin(StatsUI)
	local L=addonTable.locale
	local Fun=addonTable.Fun
	local Create=addonTable.Create
	local fmod=math.fmod
	local gsub = _G.string.gsub
	local PIGLine=Create.PIGLine
	local PIGFrame=Create.PIGFrame
	local PIGButton=Create.PIGButton
	local PIGDiyBut = Create.PIGDiyBut
	local PIGFontString=Create.PIGFontString
	local PIGOptionsList_R=Create.PIGOptionsList_R
	--------
	local fujiF,fujiTabBut=PIGOptionsList_R(StatsUI.F,CHAT_MODERATE..CHARACTER,StatsUI.butW,"LeftH")
	fujiF:HookScript("OnShow", function(self)
		fujiF.Update_List();
	end)
	local hang_Height,hang_NUM,UIWWW  = 22.6, 20,fujiF:GetWidth()*0.5
	fujiF.hide = PIGButton(fujiF,{"TOPLEFT", fujiF, "TOPLEFT", 260,-1},{80,20},"重置排序");
	fujiF.hide:SetScript("OnClick", function (self)
		PIGA["StatsInfo"]["PlayerSort"]={}
		fujiF.Update_List()
	end);
	local function add_uifun()
		if fujiF.Admin then return end
		fujiF.Admin=PIGFrame(fujiF)
		fujiF.Admin:SetPoint("TOPLEFT",fujiF,"TOPLEFT",0,0);
		fujiF.Admin:SetPoint("BOTTOMLEFT",fujiF,"BOTTOMLEFT",0,0);
		fujiF.Admin:SetWidth(UIWWW)
		fujiF.Admin:PIGSetBackdrop(0)
		fujiF.Admin.title = PIGFontString(fujiF.Admin,{"TOPLEFT", fujiF.Admin, "TOPLEFT", 4, -2},SHOW..CHARACTER..L["TRADECHARDATA_ADMINTISP1"])
		fujiF.Admin.title:SetTextColor(0, 1, 0, 1);
		fujiF.Admin.lineTOP = PIGLine(fujiF.Admin,"TOP",-22,nil,nil,{0.3,0.3,0.3,0.8})
		fujiF.Admin.Scroll = CreateFrame("ScrollFrame",nil,fujiF.Admin, "FauxScrollFrameTemplate");  
		fujiF.Admin.Scroll:SetPoint("TOPLEFT",fujiF.Admin.lineTOP,"BOTTOMLEFT",2,-2);
		fujiF.Admin.Scroll:SetPoint("BOTTOMRIGHT",fujiF.Admin,"BOTTOMRIGHT",-24,2);
		fujiF.Admin.Scroll:SetScale(0.8);
		fujiF.Admin.Scroll:SetScript("OnVerticalScroll", function(self, offset)
		    FauxScrollFrame_OnVerticalScroll(self, offset, hang_Height, fujiF.Update_List)
		end)
		fujiF.Admin.ButList={}
		--
		fujiF.Admin_Hide=PIGFrame(fujiF)
		fujiF.Admin_Hide:SetPoint("TOPRIGHT",fujiF,"TOPRIGHT",0,0);
		fujiF.Admin_Hide:SetPoint("BOTTOMRIGHT",fujiF,"BOTTOMRIGHT",0,0);
		fujiF.Admin_Hide:SetWidth(UIWWW)
		fujiF.Admin_Hide:PIGSetBackdrop(0)
		fujiF.Admin_Hide.title = PIGFontString(fujiF.Admin_Hide,{"TOPLEFT", fujiF.Admin_Hide, "TOPLEFT", 4, -2},HIDE..CHARACTER..L["TRADECHARDATA_ADMINTISP2"])
		fujiF.Admin_Hide.title:SetTextColor(1, 0.2, 0, 1);
		fujiF.Admin_Hide.lineTOP = PIGLine(fujiF.Admin_Hide,"TOP",-22,nil,nil,{0.3,0.3,0.3,0.8})
		fujiF.Admin_Hide.Scroll = CreateFrame("ScrollFrame",nil,fujiF.Admin_Hide, "FauxScrollFrameTemplate");  
		fujiF.Admin_Hide.Scroll:SetPoint("TOPLEFT",fujiF.Admin_Hide.lineTOP,"BOTTOMLEFT",2,-2);
		fujiF.Admin_Hide.Scroll:SetPoint("BOTTOMRIGHT",fujiF.Admin_Hide,"BOTTOMRIGHT",-24,2);
		fujiF.Admin_Hide.Scroll:SetScale(0.8);
		fujiF.Admin_Hide.Scroll:SetScript("OnVerticalScroll", function(self, offset)
		    FauxScrollFrame_OnVerticalScroll(self, offset, hang_Height, fujiF.Update_List)
		end)
		fujiF.Admin_Hide.ButList={}
	end
	function fujiF.Update_List()
		if not fujiF:IsVisible() then return end
		add_uifun()
		for _,hang in pairs(fujiF.Admin.ButList) do
			hang:Hide()
		end
		for _,hang in pairs(fujiF.Admin_Hide.ButList) do
			hang:Hide()
		end

	   	local cdmulu = {}
	   	local pmuli,PData,added,Sortnum=Fun.GetPlayerSortData()
	   	for i=1,#pmuli do
			local pname=pmuli[i]
			if PData[pname] then
				local pData=PData[pname]
		   		table.insert(cdmulu,{pname,pData,pname==StatsUI.allname})
		   	end
		end
		local ItemsNum = #cdmulu;
	    FauxScrollFrame_Update(fujiF.Admin.Scroll, ItemsNum, hang_NUM, hang_Height);
	    local offset = FauxScrollFrame_GetOffset(fujiF.Admin.Scroll);
	    for id = 1, hang_NUM do
			local dangqian = id+offset;
			if cdmulu[dangqian] then
				if not fujiF.Admin.ButList[id] then
					local hang = CreateFrame("Frame", nil, fujiF.Admin);
					fujiF.Admin.ButList[id]=hang
					hang:SetSize(fujiF.Admin:GetWidth()-18,hang_Height);
					if id==1 then
						hang:SetPoint("TOPLEFT", fujiF.Admin.Scroll, "TOPLEFT", 0, -1);
					else
						hang:SetPoint("TOPLEFT", fujiF.Admin.ButList[id-1], "BOTTOMLEFT", 0, -2);
					end
					if id~=hang_NUM then
						hang.line = PIGLine(hang,"BOT",0,nil,nil,{0.3,0.3,0.3,0.6})
					end
					hang.Faction = hang:CreateTexture();
					hang.Faction:SetTexture("interface/glues/charactercreate/ui-charactercreate-factions.blp");
					hang.Faction:SetPoint("LEFT", hang, "LEFT", 0,0);
					hang.Faction:SetSize(hang_Height,hang_Height);
					hang.Race = hang:CreateTexture();
					hang.Race:SetPoint("LEFT", hang.Faction, "RIGHT", 1,0);
					hang.Race:SetSize(hang_Height,hang_Height);
					hang.Class = hang:CreateTexture();
					hang.Class:SetTexture("interface/glues/charactercreate/ui-charactercreate-classes.blp")
					hang.Class:SetPoint("LEFT", hang.Race, "RIGHT", 1,0);
					hang.Class:SetSize(hang_Height,hang_Height);
					hang.level = PIGFontString(hang,{"LEFT", hang.Class, "RIGHT", 2, 0},1)
					hang.level:SetTextColor(1,0.843,0, 1);
					hang.name = PIGFontString(hang,{"LEFT", hang.level, "RIGHT", 0, 0})
					hang.nameDQ = hang:CreateTexture();
					hang.nameDQ:SetTexture("interface/common/indicator-green.blp")
					hang.nameDQ:SetPoint("LEFT", hang.name, "RIGHT", 1,0);
					hang.nameDQ:SetSize(hang_Height-2,hang_Height-2);
					hang.hide = PIGButton(hang,{"RIGHT", hang, "RIGHT", 0,0},{hang_Height*2,hang_Height-4},HIDE);
					hang.hide:SetScript("OnClick", function (self)
						local wanjianame = self:GetParent().allname
						fujiF.caozuoshuaxin("hide",wanjianame)
					end);
					hang.down = PIGDiyBut(hang,{"RIGHT", hang.hide, "LEFT", -8,0},{hang_Height-2,nil,hang_Height-2,hang_Height+10,"NPE_ArrowDown"})
					hang.down:SetScript("OnClick", function (self)
						local wanjianame = self:GetParent().allname
						fujiF.caozuoshuaxin("sort",wanjianame,"-")
					end);
					hang.up = PIGDiyBut(hang,{"RIGHT", hang.down, "LEFT", -8,0},{hang_Height-2,nil,hang_Height-2,hang_Height+10,"NPE_ArrowUp"})
					hang.up:SetScript("OnClick", function (self)
						local wanjianame = self:GetParent().allname
						fujiF.caozuoshuaxin("sort",wanjianame,"+")
					end);
				end
				local fujik = fujiF.Admin.ButList[id]
				fujik:Show();
				fujik.allname=cdmulu[dangqian][1]
				fujik.name:SetText(Fun.PruningServerName(cdmulu[dangqian][1]));
				if cdmulu[dangqian][2][1]=="Alliance" then
					fujik.Faction:SetTexCoord(0,0.5,0,1);
				elseif cdmulu[dangqian][2][1]=="Horde" then
					fujik.Faction:SetTexCoord(0.5,1,0,1);
				end
				fujik.Race:SetAtlas(cdmulu[dangqian][2][3]);
				local className, classFile, classID = PIGGetClassInfo(cdmulu[dangqian][2][4])
				fujik.Class:SetTexCoord(unpack(PIG_CLASS_ICON_TCOORDS[classFile]));
				fujik.level:SetText("("..cdmulu[dangqian][2][5]..")");
				local color = PIG_CLASS_COLORS[classFile];
				fujik.name:SetTextColor(color.r, color.g, color.b, 1);
				fujik.nameDQ:SetShown(cdmulu[dangqian][3])
				fujik.up.icon:SetDesaturated(not added[cdmulu[dangqian][1]])
				if added[cdmulu[dangqian][1]] then
					fujik.down:SetShown(dangqian~=Sortnum)
					fujik.up:SetShown(dangqian~=1)
				else
					fujik.down:SetShown(false)
				end
			end
		end
		local cdmulu={};
		local PlayerSH = PIGA["StatsInfo"]["PlayerSH"]
   		for k,v in pairs(PData) do
   			if PlayerSH[k] then
		   		if k==StatsUI.allname then
					table.insert(cdmulu,1,{k,v,true})
		   		else
		   			table.insert(cdmulu,{k,v})
		   		end
		   	end
	   	end
	   	--
		local ItemsNum = #cdmulu;
		FauxScrollFrame_Update(fujiF.Admin_Hide.Scroll, ItemsNum, hang_NUM, hang_Height);
		local offset = FauxScrollFrame_GetOffset(fujiF.Admin_Hide.Scroll);
		for id = 1, hang_NUM do
			local dangqian = id+offset;
			if cdmulu[dangqian] then
				if not fujiF.Admin_Hide.ButList[id] then
					local hang = CreateFrame("Frame", nil, fujiF.Admin_Hide);
					fujiF.Admin_Hide.ButList[id]=hang
					hang:SetSize(fujiF.Admin_Hide:GetWidth()-18,hang_Height);
					if id==1 then
						hang:SetPoint("TOPLEFT", fujiF.Admin_Hide.Scroll, "TOPLEFT", 0, -1);
					else
						hang:SetPoint("TOPLEFT", fujiF.Admin_Hide.ButList[id-1], "BOTTOMLEFT", 0, -2);
					end
					if id~=hang_NUM then
						hang.line = PIGLine(hang,"BOT",0,nil,nil,{0.3,0.3,0.3,0.6})
					end
					hang.Faction = hang:CreateTexture();
					hang.Faction:SetTexture("interface/glues/charactercreate/ui-charactercreate-factions.blp");
					hang.Faction:SetPoint("LEFT", hang, "LEFT", 0,0);
					hang.Faction:SetSize(hang_Height,hang_Height);
					hang.Race = hang:CreateTexture();
					hang.Race:SetPoint("LEFT", hang.Faction, "RIGHT", 1,0);
					hang.Race:SetSize(hang_Height,hang_Height);
					hang.Class = hang:CreateTexture();
					hang.Class:SetTexture("interface/glues/charactercreate/ui-charactercreate-classes.blp")
					hang.Class:SetPoint("LEFT", hang.Race, "RIGHT", 1,0);
					hang.Class:SetSize(hang_Height,hang_Height);
					hang.level = PIGFontString(hang,{"LEFT", hang.Class, "RIGHT", 2, 0},1)
					hang.level:SetTextColor(1,0.843,0, 1);
					hang.name = PIGFontString(hang,{"LEFT", hang.level, "RIGHT", 0, 0})
					hang.nameDQ = hang:CreateTexture();
					hang.nameDQ:SetTexture("interface/common/indicator-green.blp")
					hang.nameDQ:SetPoint("LEFT", hang.name, "RIGHT", 1,0);
					hang.nameDQ:SetSize(hang_Height-2,hang_Height-2);
					hang.del=PIGDiyBut(hang,{"RIGHT", hang, "RIGHT", -8,0},{hang_Height-6})
					hang.del:SetScript("OnClick", function (self)
						local wanjianame = self:GetParent().allname
						fujiF.caozuoshuaxin("del",wanjianame)
					end);
					hang.hide = PIGButton(hang,{"RIGHT", hang.del, "LEFT", -12,0},{hang_Height*2,hang_Height-4},SHOW);
					hang.hide:SetScript("OnClick", function (self)
						local wanjianame = self:GetParent().allname
						fujiF.caozuoshuaxin("show",wanjianame)
					end);
				end
				local fujik = fujiF.Admin_Hide.ButList[id]
				fujik:Show();
				fujik.allname=cdmulu[dangqian][1]
				fujik.name:SetText(cdmulu[dangqian][1]);
				if cdmulu[dangqian][2][1]=="Alliance" then
					fujik.Faction:SetTexCoord(0,0.5,0,1);
				elseif cdmulu[dangqian][2][1]=="Horde" then
					fujik.Faction:SetTexCoord(0.5,1,0,1);
				end
				fujik.Race:SetAtlas(cdmulu[dangqian][2][3]);
				local className, classFile, classID = PIGGetClassInfo(cdmulu[dangqian][2][4])
				fujik.Class:SetTexCoord(unpack(PIG_CLASS_ICON_TCOORDS[classFile]));
				fujik.level:SetText("("..cdmulu[dangqian][2][5]..")");
				local color = PIG_CLASS_COLORS[classFile];
				fujik.name:SetTextColor(color.r, color.g, color.b, 1);
				fujik.nameDQ:SetShown(cdmulu[dangqian][3])
			end
		end
	end
	local CZpeizhiList={
		"FBCDRecords",
		"SkillData",
		"Token",
		"Items",
		"TradeData",
		"MailData",
		"Played",
	}
	function fujiF.caozuoshuaxin(ly,name,updo)
		if ly=="del" then
			PIGA["StatsInfo"]["Players"][name]=nil
			PIGA["StatsInfo"]["PlayerSH"][name]=nil
			local PlayerData = PIGA["StatsInfo"]["Players"]
			local PlayerSH = PIGA["StatsInfo"]["PlayerSH"]	
			for _,leix in pairs(CZpeizhiList) do
				PIGA["StatsInfo"][leix][name]= nil
			end		
		elseif ly=="hide" then
			PIGA["StatsInfo"]["PlayerSH"][name]=true
		elseif ly=="show" then
			PIGA["StatsInfo"]["PlayerSH"][name]=nil
		elseif ly=="sort" then
			local PlayerSort = PIGA["StatsInfo"]["PlayerSort"]
			if updo == "+" then
				local found = false
			    for i, v in ipairs(PlayerSort) do
			    	if v == name then
			        	if i > 1 then
				            PlayerSort[i], PlayerSort[i - 1] = PlayerSort[i - 1], PlayerSort[i] 
				        end
				        found = true
				        break
			        end
			    end
			    if not found then
			        table.insert(PlayerSort, name)
			    end
			elseif updo == "-" then
			    for i, v in ipairs(PlayerSort) do
			        if v == name and i < #PlayerSort then
			            PlayerSort[i], PlayerSort[i + 1] = PlayerSort[i + 1], PlayerSort[i]
			            break
			        end
			    end
			end
		end
		fujiF.Update_List();
	end
end
