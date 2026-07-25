-------------------
---NovaWorldBuffs--
-------------------

local addonName, addon = ...;
local NWB = addon.a;
local L = LibStub("AceLocale-3.0"):GetLocale("NovaWorldBuffs");

---=======---
---Felwood---
---=======---

function NWB:setSongFlowers()
	NWB.songFlowers = {
		--Songflowers in order from north to south.
		["flower1"] = {x = 63.9, y = 6.1, subZone = L["North Felpaw Village"]}, --x 63.907248382611, y 6.0921582958694
		["flower2"] = {x = 55.8, y = 10.4, subZone = L["West Felpaw Village"]}, --x 55.80811845313, y 10.438248169009
		["flower3"] = {x = 50.6, y = 13.9, subZone = L["North of Irontree Woods"]}, --x 50.575074328086, y 13.918245916971
		["flower4"] = {x = 63.3, y = 22.6, subZone = L["Talonbranch Glade"]}, -- x 63.336814849559, y 22.610425663249
		["flower5"] = {x = 40.1, y = 44.4, subZone = L["Shatter Scar Vale"]}, --x 40.142029982253, y 44.353905770542
		["flower6"] = {x = 34.3, y = 52.2, subZone = L["Bloodvenom Post"]}, --x 34.345508209303, y 52.179993391643
		["flower7"] = {x = 40.1, y = 56.5, subZone = L["East of Jaedenar"]}, --x 40.142029982253, y 56.523472021355
		["flower8"] = {x = 48.3, y = 75.7, subZone = L["North of Emerald Sanctuary"]}, -- x 48.260292045699, y 75.650435262435
		["flower9"] = {x = 45.9, y = 85.2, subZone = L["West of Emerald Sanctuary"]}, --x 45.942030228517, y 85.219126632059
		["flower10"] = {x = 52.9, y = 87.8, subZone = L["South of Emerald Sanctuary"]}, --x 52.893336145267, y 87.825217631218
	}
	if (NWB.faction == "Horde") then
		local fp = "";
		if (GetLocale() == "enUS") then
			fp = " FP"
		end
		NWB.songFlowers.flower6.subZone = L["Bloodvenom Post"] .. fp;
	end
end

NWB.tubers = {
	--Whipper root in order from north to south.
	--Taken from wowhead, could be some missing.
	["tuber1"] = {x = 49.5, y = 12.2, subZone = L["North of Irontree Woods"]},
	["tuber2"] = {x = 50.6, y = 18.2, subZone = L["Irontree Woods"]},
	["tuber3"] = {x = 40.7, y = 19.2, subZone = L["West of Irontree Woods"]},
	["tuber4"] = {x = 43.0, y = 46.9, subZone = L["Bloodvenom Falls"]},
	["tuber5"] = {x = 34.1, y = 60.3, subZone = L["Jaedenar"]},
	["tuber6"] = {x = 40.2, y = 85.2, subZone = L["West of Emerald Sanctuary"]},
};

NWB.dragons = {
	--Night dragon in order from north to south.
	--Taken from wowhead, could be some missing.
	["dragon1"] = {x = 42.5, y = 13.9, subZone = L["North-West of Irontree Woods"]},
	["dragon2"] = {x = 50.6, y = 30.5, subZone = L["South of Irontree Woods"]},
	["dragon3"] = {x = 35.1, y = 59.0, subZone = L["Jaedenar"]},
	["dragon4"] = {x = 40.7, y = 78.3, subZone = L["West of Emerald Sanctuary"]},
};

--Debug.
function NWB:resetSongFlowers()
	if (NWB.db.global.resetSongflowers) then
		for k, v in pairs(NWB.songFlowers) do
			NWB.data[k] = 0;
		end
		NWB.db.global.resetSongflowers = false;
	end
end

SLASH_NWBSFCMD1, SLASH_NWBSFCMD2, SLASH_NWBSFCMD3, SLASH_NWBSFCMD4 = '/sf', '/sfs', '/songflower', '/songflowers';
function SlashCmdList.NWBSFCMD(msg, editBox)
	if (msg) then
		msg = string.lower(msg);
	end
	if (msg == "map") then
		WorldMapFrame:Show();
		WorldMapFrame:SetMapID(1448);
		return;
	end
	if (msg == "options" or msg == "option" or msg == "config" or msg == "menu") then
		NWB:openConfig();
		return;
	end
	local dataPrefix, layer, layerNum;
	local layerMsg = "";
	local string = L["Songflower"] .. ":";
	local found;
	--Show timers for our current layer.
	if (NWB.isLayered) then
		if (NWB.layeredSongflowers and NWB:checkLayerCount() and NWB.lastKnownLayerMapID and NWB.lastKnownLayerMapID > 0
			and NWB.lastKnownLayer and NWB.lastKnownLayer > 0) then
			layerNum = NWB.lastKnownLayer;
			layer = NWB.lastKnownLayerID;
			dataPrefix = NWB.data.layers[layer];
			layerMsg = " (" .. L["Layer"] .. " " .. layerNum .. ")";
		elseif (NWB.layeredSongflowers and NWB:GetLayerCount() == 1) then
			for k, v in NWB:pairsByKeys(NWB.data.layers) do
				layerNum = 1;
				dataPrefix = NWB.data.layers[k];
				layer = k;
				layerMsg = " (" .. L["Layer"] .. " " .. layerNum .. ")";
				break;
			end
		end
	else
		dataPrefix = NWB.data;
	end
	if (dataPrefix) then
		for k, v in pairs(NWB.songFlowers) do
			local time = (dataPrefix[k] + 1500) - GetServerTime();
			if (time > 0) then
				local minutes = string.format("%02.f", math.floor(time / 60));
	    		local seconds = string.format("%02.f", math.floor(time - minutes * 60));
				string = string .. " (" .. v.subZone .. " " .. minutes .. "m" .. seconds .. "s)";
				found = true;
	  		end
		end
		if (not found) then
			string = string .. " " .. L["noActiveTimers"] .. ".";
		end
	else
		string = string .. " " .. L["Can't find current layer or no timers active for this layer."] .. ".";
	end
	if (msg ~= nil and msg ~= "") then
		NWB:print(string .. layerMsg, msg);
	else
		NWB:print(string .. layerMsg);
	end
end

NWB.detectedPlayers = {};
NWB.lastUnboon = {};
local playerHasSongflower = {};
local f = CreateFrame("Frame");
f:RegisterEvent("PLAYER_TARGET_CHANGED");
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED");
f:RegisterEvent("PLAYER_ENTERING_WORLD");
f:RegisterEvent("CHAT_MSG_LOOT");
f:RegisterEvent("UPDATE_MOUSEOVER_UNIT");
f:SetScript('OnEvent', function(self, event, ...)
	if (event == "COMBAT_LOG_EVENT_UNFILTERED") then
		local _, _, zone = NWB:GetPlayerZonePosition();
		local timestamp, subEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, 
				destName, destFlags, destRaidFlags, spellID, spellName = CombatLogGetCurrentEventInfo();
		if ((subEvent == "SPELL_AURA_APPLIED" or subEvent == "SPELL_AURA_REFRESH")) then
			--Can't check for buffs here because often songflower won't be the first buff in combat log when someone logs in.
			--Then the player could be NWB.detectedPlayers right before their logon songflower buff is seen, triggering a false timer.
			--Other combat events we can use to check for players around us.
			if (zone == 1448) then
				if (sourceName) then
					if (string.match(sourceGUID, "Player")) then
						NWB:addDetectedPlayer(sourceName);
					end
				elseif (destName) then
					if (string.match(destGUID, "Player")) then
						NWB:addDetectedPlayer(destName);
					end
				end
			end
			if (spellName == L["Songflower Serenade"]) then
				if (destName == UnitName("player")) then
					--If buff is ours we'll validate it's a new buff incase we logon beside a songflower with the buff.
					local expirationTime = NWB:getBuffDuration(L["Songflower Serenade"], 3)
					if (expirationTime >= 3599) then
						local closestFlower = NWB:getClosestSongflower();
						if (NWB.data[closestFlower]) then
							NWB:songflowerPicked(closestFlower);
						end
					end
				elseif (not NWB.db.global.mySongflowerOnly) then
					local pvpType = GetZonePVPInfo();
					if (bit.band(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE
							and pvpType == "contested") then
						return;
					end
					local closestFlower = NWB:getClosestSongflower();
					if (NWB.data[closestFlower]) then
						NWB:songflowerPicked(closestFlower, destName, destFlags);
					end
					--Add this player to already seen with buff list.
					--This is done after the previously seen time checks in songflowerPicked();
					--A timer will be set if it's the first time seeing player with buff but not the first time seeing the player.
					--If we see a player twice in a row with the buff then it will be ignored during the checks in songflowerPicked();
					--This will make songflower timers very slightly less detectable, but far more reliable.
					NWB:hasSongflower(destName);
				end
			end
		--Doesn't show up in combat log, checking aura removed instead.
		--[[elseif (subEvent == "SPELL_CAST_SUCCESS") then
			if (spellID == 349863 and sourceName) then
				NWB.lastUnboon[sourceName] = GetTime();
			end]]
		else
			if (zone == 1448) then
				if (sourceName) then
					if (string.match(sourceGUID, "Player")) then
						NWB:addDetectedPlayer(sourceName);
					end
				elseif (destName) then
					if (string.match(destGUID, "Player")) then
						NWB:addDetectedPlayer(destName);
					end
				end
			end
		end
	elseif (event == "PLAYER_TARGET_CHANGED") then
		local _, _, zone = NWB:GetPlayerZonePosition();
		if (zone == 1448) then
			local name = UnitName("target");
			if (name) then
				NWB:addDetectedPlayer(UnitName("target"));
			end
		end
	elseif (event == "PLAYER_ENTERING_WORLD") then
		--Wipe felwood songflower detected players when leaving, it costs very little to just wipe this on every zone.
		NWB.detectedPlayers = {};
		NWB.lastUnboon = {};
		playerHasSongflower = {};
	elseif (event == "CHAT_MSG_LOOT") then
		local msg = ...;
		local name, otherPlayer;
		--Self receive multiple loot "You receive loot: [Item]x2"
		local itemLink, amount = string.match(msg, string.gsub(string.gsub(LOOT_ITEM_SELF_MULTIPLE, "%%s", "(.+)"), "%%d", "(%%d+)"));
    	if (not itemLink) then
    		--Self receive single loot "You receive loot: [Item]"
    		itemLink = msg:match(LOOT_ITEM_SELF:gsub("%%s", "(.+)"));
    		if (not itemLink) then
    			--Self receive multiple item "You receive item: [Item]x2"
    			itemLink, amount = string.match(msg, string.gsub(string.gsub(LOOT_ITEM_PUSHED_SELF_MULTIPLE, "%%s", "(.+)"), "%%d", "(%%d+)"));
    			--itemLink = msg:match(LOOT_ITEM_SELF:gsub("%%s", "(.+)"));
    			if (not itemLink) then
    	 			--Self receive single item "You receive item: [Item]"
    				itemLink = msg:match(LOOT_ITEM_PUSHED_SELF:gsub("%%s", "(.+)"));
    			end
    		end
    	end
		--If no matches for self loot then check other player loot msgs.
		if (not itemLink) then
    		--Other player receive multiple loot "Otherplayer receives loot: [Item]x2"
    		otherPlayer, itemLink, amount = string.match(msg, string.gsub(string.gsub(LOOT_ITEM_MULTIPLE, "%%s", "(.+)"), "%%d", "(%%d+)"));
    		if (not itemLink) then
    			--Other player receive single loot "Otherplayer receives loot: [Item]"
    			otherPlayer, itemLink = msg:match("^" .. LOOT_ITEM:gsub("%%s", "(.+)"));
    			if (not itemLink) then
    				--Other player loot multiple item "Otherplayer receives item: [Item]x2"
    				otherPlayer, itemLink, amount = string.match(msg, string.gsub(string.gsub(LOOT_ITEM_PUSHED_MULTIPLE, "%%s", "(.+)"), "%%d", "(%%d+)"));
    				if (not itemLink) then
    	 				--Other player receive single item "Otherplayer receives item: [Item]"
    					otherPlayer, itemLink = msg:match("^" .. LOOT_ITEM_PUSHED:gsub("%%s", "(.+)"));
    				end
    			end
    		end
    	end
    	--otherPlayer is basically a waste of time here, since it's a pushed item not a looted item the team doesn't see it be looted.
    	--But I'll keep my looted item function in tact anyway, maybe I'll track some other item here in the future.
    	local _, _, zone = NWB:GetPlayerZonePosition();
    	--Some uers seem to have an addon that repaces the Item global so we have to check for Item.CreateFromItemLink.
    	if (zone == 1448 and itemLink and Item.CreateFromItemLink) then
    		local item = Item:CreateFromItemLink(itemLink);
			if (item) then
				local itemID = item:GetItemID();
				if (itemID and itemID == 11951) then
					local closestTuber = NWB:getClosestTuber();
					if (NWB.data[closestTuber]) then
						NWB:tuberPicked(closestTuber, otherPlayer);
					end
				elseif (itemID and itemID == 11952) then
					local closestDragon = NWB:getClosestDragon();
					if (NWB.data[closestDragon]) then
						NWB:dragonPicked(closestDragon, otherPlayer);
					end
				end
			end
    	end
	elseif (event == "UPDATE_MOUSEOVER_UNIT") then
		NWB:updateMouseoverTarget();
	end
end)

function NWB:updateMouseoverTarget()
	local _, _, zone = NWB:GetPlayerZonePosition();
	if (zone == 1448) then
		local name, unit = GameTooltip:GetUnit();
		if (name) then
			NWB:addDetectedPlayer(name);
		end
	end
end

--Check tooltips for players while waiting at the songflower, doesn't really matter if it adds non-player stuff, it gets wiped when leaving.
--This shouldn't be done OnUpdate but it will do for now and only happens in felwood.
--Not sure how to detect tooltip changed, OnShow doesn't work when tooltip changes before fading out.
--This whole thing is pretty ugly right now.
--[[GameTooltip:HookScript("OnUpdate", function()
	--This may need some more work to handle custom tooltip addons like elvui etc.
	local _, _, zone = NWB:GetPlayerZonePosition();
	if (zone == 1448) then
		local name, unit = GameTooltip:GetUnit();
		NWB:debug("tooltip", name, unit)
		if (name) then
			NWB:addDetectedPlayer(name);
		end
		for i = 1, GameTooltip:NumLines() do
			local line =_G["GameTooltipTextLeft"..i];
			local text = line:GetText();
			if (text and text ~= nil and text ~= "") then
				local name;
				if (string.match(text, " ")) then
					name = NWB:stripColors(string.match(text, "%s(%S+)$"));
				else
					name = NWB:stripColors(text);
				end
			end
			--Iterate first line only.
			return;
		end
	end
end)]]

function NWB:addDetectedPlayer(name, skipTimeCheck)
	--Skip time check if it's a SPELL_AURA_APPLIED so we always update timestamp for people logging in with buffs beside us.
	--We check in NWB:setLayeredSongflowers() so we don't set a timer if it was a buff and player was seen less than 1 second ago (login).
	if (NWB.detectedPlayers[name] and (GetServerTime() - NWB.detectedPlayers[name]) < 180) then
		return;
	end
	--NWB:debug("Detected player:", name);
	NWB.detectedPlayers[name] = GetServerTime();
end

function NWB:hasSongflower(name)
	playerHasSongflower[name] = GetServerTime();
end

function NWB:setLayeredSongflowers()
	--No layered songflowers on the regions with 4+ layers, it's too much data to sync.
	--if (NWB.isLayered and not NWB.cnRealms[NWB.realm] and not NWB.twRealms[NWB.realm]
	--		and not NWB.krRealms[NWB.realm]) then
	--Enabled songflowers in all regions now, using better data compression.
	if (NWB.isLayered) then
		NWB.layeredSongflowers = true;
	end
end

--I record some data to try and make sure if another player picked flower infront of us it's valid and not an old buff.
--Check if player has been seen before (avoid logon buff aura gained events).
--Check if there is already a valid timer for the songflower (they should never be reset except server restart?)
local pickedTime = 0;
function NWB:songflowerPicked(type, otherPlayer, flags)
	local _, _, zone = NWB:GetPlayerZonePosition();
	if (zone ~= 1448) then
		--We're not in felwood.
		return;
	end
	if (iskd or not NWB:compSide(flags)) then
		return;
	end
	--If other player has just unbooned, an unboon shouldn't trigger a timer even if near a flower but bug happens so just incase.
	if (otherPlayer and NWB.lastUnboon[otherPlayer] and GetTime() - NWB.lastUnboon[otherPlayer] < 1) then
		NWB:debug("Player unbooned with sf buff at flower:", otherPlayer);
		return;
	end
	local me = UnitName("player");
	if (NWB.lastUnboon[me] and GetTime() - NWB.lastUnboon[me] < 1) then
		NWB:debug("Player unbooned with sf buff at flower:", otherPlayer);
		return;
	end
	--If other player has already been seen with a songflower buff.
	if (otherPlayer and playerHasSongflower[otherPlayer]) then
		NWB:debug("Player already seen with songflower:", otherPlayer);
		return;
	end
	--If other player has not been seen before it may be someone logging in with the buff.
	if (otherPlayer and not NWB.detectedPlayers[otherPlayer]) then
		NWB:debug("Previously unseen player with buff:", otherPlayer);
		return;
	end
	if (otherPlayer and (GetServerTime() - NWB.detectedPlayers[otherPlayer] > 600)) then
		NWB:debug("Player seen too long ago:", otherPlayer);
		return;
	end
	if (otherPlayer and (GetServerTime() - NWB.detectedPlayers[otherPlayer] < 1)) then
		--We're using auras to detect players, this will make sure logging in with a SF buff won't trigger a timer.
		--It will cycle all their buffs in combat log in he first second, after that we consider them valid to pick.
		NWB:debug("Player got SF buff too soon after seen:", otherPlayer);
		return;
	end
	if ((GetServerTime() - pickedTime) > 5) then
		--SetCVar("nameplateShowFriends", 1);
		--NWB:setCurrentLayerText("nameplate1");
		--SetCVar("nameplateShowFriends", 0)
		local layer, layerNum;
		if (NWB.isLayered and NWB:GetLayerCount() >= 2 and NWB.lastKnownLayerMapID and NWB.lastKnownLayerMapID > 0
				and NWB.lastKnownLayer and NWB.lastKnownLayer > 0) then
		--if (NWB.isLayered and NWB:GetLayerCount() >= 2 and NWB.lastKnownLayerMapID and NWB.lastKnownLayerMapID > 0) then
			layer = NWB.lastKnownLayerMapID;
			layerNum = NWB.lastKnownLayer;
		end
		--NWB:debug(NWB.lastKnownLayerMapID, NWB.lastKnownLayer);
		if (not layer or layer == 0) then
			layer = NWB.lastKnownLayerMapIDBackup;
		end
		local useSingleLayer = NWB:getSingleLayer();
		if (not layer and NWB.isLayered) then
			--If one layer exists only then just attach it even if we don't know which we're on.
			layer = useSingleLayer;
			layerNum = 1;
		end
		--NWB:debug(NWB.isLayered, NWB.layeredSongflowers, layer, layerNum, NWB:GetLayerCount(), NWB.lastKnownLayerMapID, NWB.lastKnownLayer);
		if (NWB.isLayered and NWB.layeredSongflowers and layer and layer > 0) then
			if (not layer or layer < 1) then
				NWB:debug("no known felwood layer");
				return;
			end
			if (not NWB.data.layers[layer]) then
				NWB:debug("felwood layer table is missing");
				return;
			end
			if (not NWB.data.layers[layer][type]) then
				NWB.data.layers[layer][type] = 0;
			end
			--Validate only if another player, we already check ours is valid by duration check.
			local timestamp = GetServerTime();
			if (otherPlayer and NWB.data.layers[layer][type] > (timestamp - 1440)) then
				NWB:debug("Trying to overwrite a layered valid songflower timer.", otherPlayer);
			else
				if (NWB:validateTimestamp(timestamp)) then
					NWB:debug("layered songflower picked2", otherPlayer);
					NWB.data.layers[layer][type] = timestamp;
					if (NWB.db.global.guildSongflower == true or NWB.db.global.guildSongflower == 1) then
						NWB:doFlowerMsg(type, layerNum);
						NWB:sendFlower("GUILD", type, nil, layerNum);
					end
					NWB:sendData("GUILD");
					NWB:sendData("YELL");
				end
			end
			--Set the non-layered timer also, we may use this later and it's not included in syncing data with others anyway.
			if (otherPlayer and NWB.data[type] > (timestamp - 1440)) then
				NWB:debug("Trying to overwrite a valid songflower timer.", otherPlayer);
				return;
			end
			if (NWB:validateTimestamp(timestamp)) then
				NWB.data[type] = timestamp;
				NWB:doFlowerMsg(type, layerNum);
			end
			pickedTime = timestamp;
		else
			local timestamp = GetServerTime();
			--Validate only if another player, we already check ours is valid by duration check.
			if (otherPlayer and NWB.data[type] > (timestamp - 1440)) then
				NWB:debug("Trying to overwrite a valid songflower timer.", otherPlayer);
				return;
			end
			if (NWB:validateTimestamp(timestamp)) then
				NWB:debug("songflower picked2", otherPlayer);
				NWB.data[type] = timestamp;
				if (NWB.db.global.guildSongflower == true or NWB.db.global.guildSongflower == 1) then
					NWB:doFlowerMsg(type, layerNum);
					NWB:sendFlower("GUILD", type);
				end
				NWB:sendData("GUILD");
				NWB:sendData("YELL");
				if (NWB.isLayered and NWB:GetLayerCount() >= 2 and NWB.layeredSongflowers
						and (GetServerTime() - NWB.lastJoinedGroup) > NWB.lastJoinedGroupCooldown) then
					NWB:print(L["flowerWarning"]);
				end
			end
			pickedTime = timestamp;
		end
	end
end

local flowerMsg = 0;
function NWB:doFlowerMsg(type, layer)
	local layerMsg = "";
	if (NWB.isLayered and layer and tonumber(layer) and NWB.doLayerMsg) then
		layerMsg = " (" .. L["Layer"] .. " " .. layer .. ")";
	end
	if (type and (GetServerTime() - flowerMsg) > 10) then
		if (NWB.db.global.guildSongflower == true or NWB.db.global.guildSongflower == 1) then
			NWB:sendGuildMsg(string.format(L["songflowerPicked"], L[NWB.songFlowers[type].subZone]) .. layerMsg, "guildSongflower", "songflower");
		end
		flowerMsg = GetServerTime();
	end
end

local tuberPickedTime = 0;
function NWB:tuberPicked(type, otherPlayer)
	local _, _, zone = NWB:GetPlayerZonePosition();
	if (zone ~= 1448) then
		--We're not in felwood.
		return;
	end
	if ((GetServerTime() - tuberPickedTime) > 5) then
		if (NWB.data[type] > (GetServerTime() - 1500)) then
			NWB:debug("Trying to overwrite a valid tuber timer.");
			return;
		end
		local timestamp = GetServerTime();
		if (NWB:validateTimestamp(timestamp)) then
			NWB.data[type] = timestamp;
			NWB:sendData("GUILD");
			NWB:sendData("YELL");
		end
		tuberPickedTime = timestamp;
	end
end

local dragonPickedTime = 0;
function NWB:dragonPicked(type, otherPlayer)
	local _, _, zone = NWB:GetPlayerZonePosition();
	if (zone ~= 1448) then
		--We're not in felwood.
		return;
	end
	if ((GetServerTime() - dragonPickedTime) > 5) then
		if (NWB.data[type] > (GetServerTime() - 1500)) then
			NWB:debug("Trying to overwrite a valid dragon timer.");
			return;
		end
		local timestamp = GetServerTime();
		if (NWB:validateTimestamp(timestamp)) then
			NWB.data[type] = timestamp;
			NWB:sendData("GUILD");
			NWB:sendData("YELL");
		end
		dragonPickedTime = timestamp;
	end
end

--Gets which songflower we are closest to, if we are actually beside one.
function NWB:getClosestSongflower()
	local x, y, zone = NWB:GetPlayerZonePosition();
	if (zone ~= 1448) then
		--We're not in felwood.
		return;
	end
	for k, v in pairs(NWB.songFlowers) do
		--This returns the distance in coords and not yards.
		local distance = NWB.dragonLib:GetWorldDistance(zone, x*100, y*100, v.x, v.y);
		if (distance <= 1.5) then
			return k;
		end
	end
end

function NWB:getClosestTuber()
	local x, y, zone = NWB:GetPlayerZonePosition();
	if (zone ~= 1448) then
		return;
	end
	for k, v in pairs(NWB.tubers) do
		local distance = NWB.dragonLib:GetWorldDistance(zone, x*100, y*100, v.x, v.y);
		if (distance <= 2) then
			return k;
		end
	end
end

function NWB:getClosestDragon()
	local x, y, zone = NWB:GetPlayerZonePosition();
	if (zone ~= 1448) then
		return;
	end
	for k, v in pairs(NWB.dragons) do
		local distance = NWB.dragonLib:GetWorldDistance(zone, x*100, y*100, v.x, v.y);
		if (distance <= 2) then
			return k;
		end
	end
end

--Update timers for Felwood worldmap when the map is open.
local mapSFFrames = {};
function NWB:updateFelwoodWorldmapMarker(type)
	if (NWB.isLayered and NWB.layeredSongflowers and string.match(type, "flower")) then
		--Flowers are only updated once per second not every frame, and only when an icon is visible.
		local count = 0;
		local tooltipText = "";
		local hasTimer;
		local layers = NWB.data.layers;
		for k, v in pairs(mapSFFrames) do
			--Remove any frames for any layer has been removed from db.
			--Note that layer1 frame is never added to the mapSFFrames table, only extra layer frames are.
			--Layer 1 frame is the same frame non-layered realms use and will always be shown if any layer has a timer.
			for kk, vv in pairs(v) do
				if (not NWB.data.layers[tonumber(kk)]) then
					_G[k .. "NWB"]["timerFrame" .. vv]:Hide();
					_G[k .. "NWB"]["timerFrame" .. vv] = nil;
					mapSFFrames[k][kk] = nil;
				end
			end
			for k, v in pairs(_G[k .. "NWB"].timerFrames) do
				if (not layers[v.layerID]) then
					v:Hide();
				end
			end
		end
		for k, v in NWB:pairsByKeys(layers) do
			count = count + 1;
			local frame;
			if (count == 1) then
				frame = _G[type .. "NWB"].timerFrame;
				if (not _G[type .. "NWB"]["timerFrame"].fs2) then
					_G[type .. "NWB"]["timerFrame"].fs2 = _G[type .. "NWB"]["timerFrame"]:CreateFontString(k .. "NWBTimerFrameFS2", "ARTWORK");
					--_G[type .. "NWB"]["timerFrame"].fs2:SetPoint("RIGHT", 17, 1);
					_G[type .. "NWB"]["timerFrame"].fs2:SetPoint("LEFT", _G[type .. "NWB"]["timerFrame"], "RIGHT", 1, 1);
					_G[type .. "NWB"]["timerFrame"].fs2:SetFont(NWB.regionFont, 13);
					_G[type .. "NWB"]["timerFrame"].fs2:SetText("|cff00ff00[" .. L["shortLayerPrefix"] .. count .. "]");
				end
			else
				if (_G[type .. "NWB"]["timerFrame" .. count]) then
					frame = _G[type .. "NWB"]["timerFrame" .. count];
				else
					--Create frame if doesn't exist.
					_G[type .. "NWB"]["timerFrame" .. count] = CreateFrame("Frame", k.. "TimerFrame" .. count, _G[type .. "NWB"], "TooltipBorderedFrameTemplate");
					_G[type .. "NWB"]["timerFrame" .. count]:SetFrameStrata("FULLSCREEN");
					_G[type .. "NWB"]["timerFrame" .. count]:SetFrameLevel(9);
					_G[type .. "NWB"]["timerFrame" .. count].fs = _G[type .. "NWB"]["timerFrame" .. count]:CreateFontString(k .. "NWBTimerFrameFS" .. count, "ARTWORK");
					_G[type .. "NWB"]["timerFrame" .. count].fs:SetPoint("CENTER", 0, 0.5);
					_G[type .. "NWB"]["timerFrame" .. count].fs:SetFont(NWB.regionFont, 12);
					_G[type .. "NWB"]["timerFrame" .. count].fs:SetText("00:00");
					--Outside frame layer text.
					_G[type .. "NWB"]["timerFrame" .. count].fs2 = _G[type .. "NWB"]["timerFrame" .. count]:CreateFontString(k .. "NWBTimerFrameFS2" .. count, "ARTWORK");
					--_G[type .. "NWB"]["timerFrame" .. count].fs2:SetPoint("RIGHT", 17, 1);
					_G[type .. "NWB"]["timerFrame" .. count].fs2:SetPoint("LEFT", _G[type .. "NWB"]["timerFrame" .. count], "RIGHT", 1, 1);
					_G[type .. "NWB"]["timerFrame" .. count].fs2:SetFont(NWB.regionFont, 13);
					_G[type .. "NWB"]["timerFrame" .. count].fs2:SetText("|cff00ff00[" .. L["shortLayerPrefix"] .. count .. "]");
					_G[type .. "NWB"]["timerFrame" .. count]:SetWidth(_G[type .. "NWB"]["timerFrame" .. count].fs:GetStringWidth() + 14);
					_G[type .. "NWB"]["timerFrame" .. count]:SetHeight(_G[type .. "NWB"]["timerFrame" .. count].fs:GetStringHeight() + 9);
					frame = _G[type .. count .. "NWB"];
					if (not mapSFFrames[type]) then
						mapSFFrames[type] = {};
					end
					mapSFFrames[type][k] = count;
				end
			end
			if (frame) then
				frame.layerID = k;
				--NWB:debug(_G[type .. "NWB"].timerFrames)
				_G[type .. "NWB"].timerFrames[count] = frame;
				local time = (NWB.data.layers[k][type] + 1500) - GetServerTime();
				if (NWB.db.global.showExpiredTimers and time < 1 and time > (0 - (60 * NWB.db.global.expiredTimersDuration))) then
					--Convert seconds left to positive.
					time = time * -1;
			    	local minutes = string.format("%02.f", math.floor(time / 60));
			    	local seconds = string.format("%02.f", math.floor(time - minutes * 60));
					--tooltipText = tooltipText .. "\n|Cffff2500"
					--		.. NWB:getTimeFormat(NWB.data[type] + 1500) .. " " .. L["spawn"] .. " (" .. L["expired"] .. ") (Layer " .. count .. ")|r";
					tooltipText = "|Cffff2500"
							.. NWB:getTimeFormat(NWB.data.layers[k][type] + 1500) .. " " .. L["spawn"] .. " (" .. L["expired"] .. ") (" .. L["Layer"] .. " " .. count .. ")|r\n" .. tooltipText
					frame.fs:SetText("|Cffff2500-" .. minutes .. ":" .. seconds);
					frame:SetWidth(42);
					frame:SetHeight(24);
					hasTimer = count;
					frame.hasTimer = true;
			  	elseif (time > 0) then
					--If timer is less than 25 minutes old then return time left.
			    	local minutes = string.format("%02.f", math.floor(time / 60));
			    	local seconds = string.format("%02.f", math.floor(time - minutes * 60));
			    	--tooltipText = tooltipText .. "\n" .. NWB:getTimeFormat(NWB.data[type] + 1500)
			    	--		.. " " .. L["spawn"] .. " (Layer " .. count .. ")";
			    	tooltipText = NWB:getTimeFormat(NWB.data.layers[k][type] + 1500)
			    			.. " " .. L["spawn"] .. " (" .. L["Layer"] .. " " .. count .. ")\n" .. tooltipText
					frame.fs:SetText(minutes .. ":" .. seconds);
					frame:SetWidth(42);
					frame:SetHeight(24);
					hasTimer = count;
					frame.hasTimer = true;
			  	else
			  		--tooltipText = tooltipText .. "\n" .. L["noTimer"] .. " (Layer " .. count .. ")";
			  		tooltipText = L["noTimer"] .. " (" .. L["Layer"] .. " " .. count .. ")\n" .. tooltipText
					frame:Hide();
					frame.fs:SetText(L["noTimer"]);
					frame:SetWidth(54);
					frame:SetHeight(22);
					frame.hasTimer = false;
				end
			end
		end
		if (hasTimer) then
			--Show all frames if any have an active timer.
			--[[for i = 1, count do
				if (i == 1) then
					_G[type .. "NWB"]["timerFrame"]:Show();
				elseif (_G[type .. "NWB"]["timerFrame" .. i]) then
					_G[type .. "NWB"]["timerFrame" .. i]:SetPoint("CENTER", 0, i * 18.5);
					_G[type .. "NWB"]["timerFrame" .. i]:Show();
				end
			end]]
			
			--Now we only show layers that have a timer instead.
			local offset = 0;
			for i = 1, count do
				if (i == 1) then
					if (_G[type .. "NWB"]["timerFrame"].hasTimer) then
						offset = offset + 18.5;
						_G[type .. "NWB"]["timerFrame"]:Show();
					end
				elseif (_G[type .. "NWB"]["timerFrame" .. i]) then
					if (_G[type .. "NWB"]["timerFrame" .. i].hasTimer) then
						offset = offset + 18.5;
						_G[type .. "NWB"]["timerFrame" .. i]:SetPoint("CENTER", 0, offset);
						_G[type .. "NWB"]["timerFrame" .. i]:Show();
					end
				end
			end
			
			--_G[type .. "NWB"].tooltip.fs:SetText("|CffDEDE42" .. _G[type .. "NWB"].name .. "|r\n" .. _G[type .. "NWB"].subZone .. tooltipText);
			_G[type .. "NWB"].tooltip.fs:SetText("|CffDEDE42" .. _G[type .. "NWB"].name .. "|r\n" .. _G[type .. "NWB"].subZone .. "\n" .. tooltipText);
		else
			_G[type .. "NWB"].tooltip.fs:SetText("|CffDEDE42" .. _G[type .. "NWB"].name .. "|r\n" .. _G[type .. "NWB"].subZone);
			_G[type .. "NWB"].timerFrame:Hide(); --Bug fix for when no layers are recorded yet.
			_G[type .. "NWBMini"].timerFrame:Hide();
		end
		_G[type .. "NWB"].tooltip:SetWidth(_G[type .. "NWB"].tooltip.fs:GetStringWidth() + 9);
		_G[type .. "NWB"].tooltip:SetHeight(_G[type .. "NWB"].tooltip.fs:GetStringHeight() + 9);
	else
		--Seconds left.
		local time = (NWB.data[type] + 1500) - GetServerTime();
		if (NWB.db.global.showExpiredTimers and time < 1 and time > (0 - (60 * NWB.db.global.expiredTimersDuration))) then
			--Convert seconds left to positive.
			time = time * -1;
	    	local minutes = string.format("%02.f", math.floor(time / 60));
	    	local seconds = string.format("%02.f", math.floor(time - minutes * 60));
	    	_G[type .. "NWB"].timerFrame:Show();
	    	local tooltipText = "|CffDEDE42" .. _G[type .. "NWB"].name .. "|r\n" .. _G[type .. "NWB"].subZone .. "\n"
					.. "|Cffff2500" .. NWB:getTimeFormat(NWB.data[type] + 1500) .. " " .. L["spawn"] .. " (" .. L["expired"] .. ")";
	    	_G[type .. "NWB"].tooltip.fs:SetText(tooltipText);
			_G[type .. "NWB"].tooltip:SetWidth(_G[type .. "NWB"].tooltip.fs:GetStringWidth() + 18);
			_G[type .. "NWB"].tooltip:SetHeight(_G[type .. "NWB"].tooltip.fs:GetStringHeight() + 12);
			_G[type .. "NWB"].timerFrame.fs:SetText("|Cffff2500-" .. minutes .. ":" .. seconds);
	  	elseif (time > 0) then
			--If timer is less than 25 minutes old then return time left.
	    	local minutes = string.format("%02.f", math.floor(time / 60));
	    	local seconds = string.format("%02.f", math.floor(time - minutes * 60));
	    	_G[type .. "NWB"].timerFrame:Show();
	    	local tooltipText = "|CffDEDE42" .. _G[type .. "NWB"].name .. "|r\n" .. _G[type .. "NWB"].subZone .. "\n"
	    			.. NWB:getTimeFormat(NWB.data[type] + 1500) .. " " .. L["spawn"];
	    	_G[type .. "NWB"].tooltip.fs:SetText(tooltipText);
			_G[type .. "NWB"].tooltip:SetWidth(_G[type .. "NWB"].tooltip.fs:GetStringWidth() + 18);
			_G[type .. "NWB"].tooltip:SetHeight(_G[type .. "NWB"].tooltip.fs:GetStringHeight() + 12);
			_G[type .. "NWB"].timerFrame.fs:SetText(minutes .. ":" .. seconds);
	  	else
		  	_G[type .. "NWB"].tooltip.fs:SetText("|CffDEDE42" .. _G[type .. "NWB"].name .. "|r\n" .. _G[type .. "NWB"].subZone);
			_G[type .. "NWB"].tooltip:SetWidth(_G[type .. "NWB"].tooltip.fs:GetStringWidth() + 18);
			_G[type .. "NWB"].tooltip:SetHeight(_G[type .. "NWB"].tooltip.fs:GetStringHeight() + 12);
		  	_G[type .. "NWB"].timerFrame:Hide();
		  	_G[type .. "NWB"].timerFrame.fs:SetText("");
		end
	end
end

--Update timer for minimap.
local minimapSFFrames = {};
function NWB:updateFelwoodMinimapMarker(type)
	if (NWB.layeredSongflowers and string.match(type, "flower")) then
		--Flowers are only updated once per second, not every frame.
		local count = 0;
		local tooltipText = "";
		local hasTimer;
		for k, v in pairs(minimapSFFrames) do
			--Remove any frames for any layer has been removed from db.
			--Note that layer1 frame is never added to the minimapSFFrames table, only extra layer frames are.
			--Layer 1 frame is the same frame non-layered realms use and will always be shown if any layer has a timer.
			for kk, vv in pairs(v) do
				if (not NWB.data.layers[tonumber(kk)]) then
					_G[k .. "NWBMini"]["timerFrame" .. vv]:Hide();
					_G[k .. "NWBMini"]["timerFrame" .. vv] = nil;
					minimapSFFrames[k][kk] = nil;
				end
			end
		end
		for k, v in NWB:pairsByKeys(NWB.data.layers) do
			count = count + 1;
			local frame;
			if (count == 1) then
				frame = _G[type .. "NWBMini"].timerFrame;
				if (not _G[type .. "NWBMini"]["timerFrame"].fs2) then
					_G[type .. "NWBMini"]["timerFrame"].fs2 = _G[type .. "NWBMini"]["timerFrame"]:CreateFontString(k .. "NWBMiniTimerFrameFS2", "ARTWORK");
					_G[type .. "NWBMini"]["timerFrame"].fs2:SetPoint("RIGHT", 17, 1);
					_G[type .. "NWBMini"]["timerFrame"].fs2:SetFont(NWB.regionFont, 11);
					_G[type .. "NWBMini"]["timerFrame"].fs2:SetText("|cff00ff00[" .. L["shortLayerPrefix"] .. count .. "]");
				end
			else
				if (_G[type .. "NWBMini"]["timerFrame" .. count]) then
					frame = _G[type .. "NWBMini"]["timerFrame" .. count];
				else
					--Create frame if doesn't exist.
					_G[type .. "NWBMini"]["timerFrame" .. count] = CreateFrame("Frame", k.. "TimerFrameMini" .. count, _G[type .. "NWBMini"], "TooltipBorderedFrameTemplate");
					_G[type .. "NWBMini"]["timerFrame" .. count]:SetFrameStrata("FULLSCREEN");
					_G[type .. "NWBMini"]["timerFrame" .. count]:SetFrameLevel(9);
					_G[type .. "NWBMini"]["timerFrame" .. count].fs = _G[type .. "NWBMini"]["timerFrame" .. count]:CreateFontString(k .. "NWBMiniTimerFrameFS" .. count, "ARTWORK");
					_G[type .. "NWBMini"]["timerFrame" .. count].fs:SetPoint("CENTER", 0, 0.5);
					_G[type .. "NWBMini"]["timerFrame" .. count].fs:SetFont(NWB.regionFont, 12);
					_G[type .. "NWBMini"]["timerFrame" .. count].fs:SetText("00:00");
					--Outside frame layer text.
					_G[type .. "NWBMini"]["timerFrame" .. count].fs2 = _G[type .. "NWBMini"]["timerFrame" .. count]:CreateFontString(k .. "NWBMiniTimerFrameFS2" .. count, "ARTWORK");
					_G[type .. "NWBMini"]["timerFrame" .. count].fs2:SetPoint("RIGHT", 17, 1);
					_G[type .. "NWBMini"]["timerFrame" .. count].fs2:SetFont(NWB.regionFont, 11);
					_G[type .. "NWBMini"]["timerFrame" .. count].fs2:SetText("|cff00ff00[" .. L["shortLayerPrefix"] .. count .. "]");
					_G[type .. "NWBMini"]["timerFrame" .. count]:SetWidth(_G[type .. "NWBMini"]["timerFrame" .. count].fs:GetStringWidth() + 14);
					_G[type .. "NWBMini"]["timerFrame" .. count]:SetHeight(_G[type .. "NWBMini"]["timerFrame" .. count].fs:GetStringHeight() + 9);
					frame = _G[type .. count .. "NWBMini"];
					if (not minimapSFFrames[type]) then
						minimapSFFrames[type] = {};
					end
					minimapSFFrames[type][k] = count;
				end
			end
			if (frame) then
				local time = 0
				local time = (NWB.data.layers[k][type] + 1500) - GetServerTime();
				if (NWB.db.global.showExpiredTimers and time < 1 and time > (0 - (60 * NWB.db.global.expiredTimersDuration))) then
					--Convert seconds left to positive.
					time = time * -1;
			    	local minutes = string.format("%02.f", math.floor(time / 60));
			    	local seconds = string.format("%02.f", math.floor(time - minutes * 60));
					--tooltipText = tooltipText .. "\n|Cffff2500"
					--		.. NWB:getTimeFormat(NWB.data.layers[k][type] + 1500) .. " " .. L["spawn"] .. " (" .. L["expired"] .. ") (Layer " .. count .. ")|r";
					tooltipText = "|Cffff2500"
							.. NWB:getTimeFormat(NWB.data.layers[k][type] + 1500) .. " " .. L["spawn"] .. " (" .. L["expired"] .. ") (" .. L["Layer"] .. " " .. count .. ")|r\n" .. tooltipText;
					frame.fs:SetText("|Cffff2500-" .. minutes .. ":" .. seconds);
					frame:SetWidth(frame.fs:GetStringWidth() + 14);
					frame:SetHeight(frame.fs:GetStringHeight() + 9);
					frame.hasTimer = true;
					hasTimer = count;
			  	elseif (time > 0) then
					--If timer is less than 25 minutes old then return time left.
			    	local minutes = string.format("%02.f", math.floor(time / 60));
			    	local seconds = string.format("%02.f", math.floor(time - minutes * 60));
			    	--tooltipText = tooltipText .. "\n" .. NWB:getTimeFormat(NWB.data.layers[k][type] + 1500)
			    	--		.. " " .. L["spawn"] .. " (Layer " .. count .. ")";
			    	tooltipText =  NWB:getTimeFormat(NWB.data.layers[k][type] + 1500)
			    			.. " " .. L["spawn"] .. " (" .. L["Layer"] .. " " .. count .. ")\n" .. tooltipText;
					frame.fs:SetText(minutes .. ":" .. seconds);
					frame:SetWidth(frame.fs:GetStringWidth() + 14);
					frame:SetHeight(frame.fs:GetStringHeight() + 9);
					hasTimer = count;
					frame.hasTimer = true;
			  	else
			  		--tooltipText = tooltipText .. "\n" .. L["noTimer"] .. " (Layer " .. count .. ")";
			  		tooltipText = L["noTimer"] .. " (" .. L["Layer"] .. " " .. count .. ")\n" .. tooltipText;
					frame:Hide();
					frame.fs:SetText(L["noTimer"]);
					frame:SetWidth(frame.fs:GetStringWidth() + 14);
					frame:SetHeight(frame.fs:GetStringHeight() + 9);
					frame.hasTimer = false;
				end
			end
		end
		if (hasTimer) then
			--Show all frames if any have an active timer.
			--[[for i = 1, count do
				if (i == 1) then
					_G[type .. "NWBMini"]["timerFrame"]:Show();
				elseif (_G[type .. "NWBMini"]["timerFrame" .. i]) then
					_G[type .. "NWBMini"]["timerFrame" .. i]:SetPoint("CENTER", 0, i * 18);
					_G[type .. "NWBMini"]["timerFrame" .. i]:Show();
				end
			end]]
			
			--Now we only show layers that have a timer instead.
			local offset = 0;
			for i = 1, count do
				if (i == 1) then
					if (_G[type .. "NWBMini"]["timerFrame"].hasTimer) then
						offset = offset + 18;
						_G[type .. "NWBMini"]["timerFrame"]:Show();
					end
				elseif (_G[type .. "NWBMini"]["timerFrame" .. i]) then
					if (_G[type .. "NWBMini"]["timerFrame" .. i].hasTimer) then
						offset = offset + 18;
						_G[type .. "NWBMini"]["timerFrame" .. i]:SetPoint("CENTER", 0, offset);
						_G[type .. "NWBMini"]["timerFrame" .. i]:Show();
					end
				end
			end
			
			--_G[type .. "NWBMini"].tooltip.fs:SetText("|CffDEDE42" .. _G[type .. "NWB"].name .. "|r\n" .. _G[type .. "NWB"].subZone .. tooltipText);
			_G[type .. "NWBMini"].tooltip.fs:SetText("|CffDEDE42" .. _G[type .. "NWB"].name .. "|r\n" .. _G[type .. "NWB"].subZone .. "\n" .. tooltipText);
		else
			_G[type .. "NWBMini"].tooltip.fs:SetText("|CffDEDE42" .. _G[type .. "NWB"].name .. "|r\n" .. _G[type .. "NWB"].subZone);
			_G[type .. "NWBMini"].timerFrame:Hide();
		end
		_G[type .. "NWBMini"].tooltip:SetWidth(_G[type .. "NWBMini"].tooltip.fs:GetStringWidth() + 9);
		_G[type .. "NWBMini"].tooltip:SetHeight(_G[type .. "NWBMini"].tooltip.fs:GetStringHeight() + 9);
	else
		--Seconds left.
		local time = (NWB.data[type] + 1500) - GetServerTime();
		if (NWB.db.global.showExpiredTimers and time < 1 and time > (0 - (60 * NWB.db.global.expiredTimersDuration))) then
			--Convert seconds left to positive.
			time = time * -1;
	    	local minutes = string.format("%02.f", math.floor(time / 60));
	    	local seconds = string.format("%02.f", math.floor(time - minutes * 60));
	    	_G[type .. "NWBMini"].timerFrame:Show();
			local tooltipText = "|CffDEDE42" .. _G[type .. "NWB"].name .. "|r\n" .. _G[type .. "NWB"].subZone .. "\n"
					.. "|Cffff2500" .. NWB:getTimeFormat(NWB.data[type] + 1500) .. " " .. L["spawn"] .. " (" .. L["expired"] .. ")";
	    	_G[type .. "NWBMini"].tooltip.fs:SetText(tooltipText);
	    	_G[type .. "NWBMini"].tooltip:SetWidth(_G[type .. "NWBMini"].tooltip.fs:GetStringWidth() + 9);
			_G[type .. "NWBMini"].tooltip:SetHeight(_G[type .. "NWBMini"].tooltip.fs:GetStringHeight() + 9);
			_G[type .. "NWBMini"].timerFrame.fs:SetText("|Cffff2500-" .. minutes .. ":" .. seconds);
	  	elseif (time > 0) then
			--If timer is less than 25 minutes old then return time left.
	    	local minutes = string.format("%02.f", math.floor(time / 60));
	    	local seconds = string.format("%02.f", math.floor(time - minutes * 60));
	    	_G[type .. "NWBMini"].timerFrame:Show();
	    	local tooltipText = "|CffDEDE42" .. _G[type .. "NWB"].name .. "|r\n" .. _G[type .. "NWB"].subZone .. "\n"
	    			.. NWB:getTimeFormat(NWB.data[type] + 1500) .. " " .. L["spawn"];
	    	_G[type .. "NWBMini"].tooltip.fs:SetText(tooltipText);
	    	_G[type .. "NWBMini"].tooltip:SetWidth(_G[type .. "NWBMini"].tooltip.fs:GetStringWidth() + 9);
			_G[type .. "NWBMini"].tooltip:SetHeight(_G[type .. "NWBMini"].tooltip.fs:GetStringHeight() + 9);
			_G[type .. "NWBMini"].timerFrame.fs:SetText(minutes .. ":" .. seconds);
	  	else
			_G[type .. "NWBMini"].tooltip.fs:SetText("|CffDEDE42" .. _G[type .. "NWB"].name .. "|r\n" .. _G[type .. "NWB"].subZone);
			_G[type .. "NWBMini"].tooltip:SetWidth(_G[type .. "NWBMini"].tooltip.fs:GetStringWidth() + 9);
			_G[type .. "NWBMini"].tooltip:SetHeight(_G[type .. "NWBMini"].tooltip.fs:GetStringHeight() + 9);
			_G[type .. "NWBMini"].timerFrame:Hide();
			_G[type .. "NWBMini"].timerFrame.fs:SetText(L["noTimer"]);
		end
	end
end

--Try lessen some taint issues by only creating minimap markers if felwood map is viewed.
--Bit scuffed but just seeing how it goes atm.
local createdFelwoodMarkers;
function NWB:createFelwoodMarkers()
	if (createdFelwoodMarkers) then
		return;
	end
	createdFelwoodMarkers = true;
	NWB:createSongflowerMarkers();
	NWB:createTuberMarkers();
	NWB:createDragonMarkers();
	NWB:refreshFelwoodMarkers();
	NWB:updateWorldbuffMarkersScale();
end

if (WorldMapFrame) then
	hooksecurefunc(WorldMapFrame, "OnMapChanged", function()
		if (WorldMapFrame:GetMapID() == 1448) then
			NWB:createFelwoodMarkers();
		end
	end)
	WorldMapFrame:HookScript("OnShow", function()
		if (WorldMapFrame:GetMapID() == 1448) then
			NWB:createFelwoodMarkers();
		end
	end)
end

local f = CreateFrame("Frame");
f:RegisterEvent("PLAYER_ENTERING_WORLD");
f:RegisterEvent("AREA_POIS_UPDATED");
f:SetScript("OnEvent", function(self, event, ...)
	local _, _, zone = NWB:GetPlayerZonePosition();
	if (zone == 1448) then
		NWB:createFelwoodMarkers();
	end
end)

function NWB:createSongflowerMarkers()
	local iconLocation = "Interface\\Icons\\spell_holy_mindvision";
	for k, v in pairs(NWB.songFlowers) do
		--Worldmap marker.
		local obj = CreateFrame("Frame", k .. "NWB", WorldMapFrame);
		obj.type = k;
		obj.name = L["Songflower"];
		obj.subZone = v.subZone;
		local bg = obj:CreateTexture(nil, "ARTWORK");
		bg:SetTexture(iconLocation);
		bg:SetAllPoints(obj);
		obj.texture = bg;
		obj:SetSize(15, 15);
		--World map tooltip.
		obj.tooltip = CreateFrame("Frame", k .. "Tooltip", WorldMapFrame, "TooltipBorderedFrameTemplate");
		obj.tooltip:SetPoint("CENTER", obj, "CENTER", 0, -36);
		obj.tooltip:SetFrameStrata("TOOLTIP");
		obj.tooltip:SetFrameLevel(9);
		obj.tooltip.fs = obj.tooltip:CreateFontString(k .. "NWBTooltipFS", "ARTWORK");
		obj.tooltip.fs:SetPoint("CENTER", 0, 0);
		obj.tooltip.fs:SetFont(NWB.regionFont, 12);
		obj.tooltip.fs:SetText("|CffDEDE42" .. L["Songflower"] .. "|r\n" .. v.subZone);
		obj.tooltip:SetWidth(obj.tooltip.fs:GetStringWidth() + 18);
		obj.tooltip:SetHeight(obj.tooltip.fs:GetStringHeight() + 12);
		obj:SetScript("OnEnter", function(self)
			obj.tooltip:Show();
		end)
		obj:SetScript("OnLeave", function(self)
			obj.tooltip:Hide();
		end)
		obj.tooltip:Hide();
		--Timer frame that sits above the icon when an active timer is found.
		obj.timerFrame = CreateFrame("Frame", k.. "TimerFrame", WorldMapFrame, "TooltipBorderedFrameTemplate");
		obj.timerFrame:SetPoint("CENTER", obj, "CENTER", 0, 20);
		obj.timerFrame:SetFrameStrata("FULLSCREEN");
		obj.timerFrame:SetFrameLevel(9);
		obj.timerFrame.fs = obj.timerFrame:CreateFontString(k .. "NWBTimerFrameFS", "ARTWORK");
		obj.timerFrame.fs:SetPoint("CENTER", 0, 0);
		obj.timerFrame.fs:SetFont(NWB.regionFont, 13);
		obj.timerFrame:SetWidth(42);
		obj.timerFrame:SetHeight(24);
		obj.timerFrames = {};
		obj.lastUpdate = 0;
		obj:SetScript("OnUpdate", function(self)
			if (GetServerTime() - obj.lastUpdate < 1) then
				--1 second throddle.
				return;
			end
			--Update timer when map is open.
			NWB:updateFelwoodWorldmapMarker(obj.type);
			obj.lastUpdate = GetServerTime();
		end)
		--Make it act like pin is the parent and not WorldMapFrame.
		obj:SetScript("OnHide", function(self)
			obj.timerFrame:Hide();
		end)
		obj:SetScript("OnShow", function(self)
			obj.timerFrame:Show();
		end)
		obj:SetScript("OnMouseDown", function(self, button)
			if (IsShiftKeyDown()) then
				local time = (NWB.data[obj.type] + 1500) - GetServerTime();
				if (NWB.isLayered and NWB.layeredSongflowers and NWB:GetLayerCount() >= 2 and NWB.lastKnownLayerMapID and NWB.lastKnownLayerMapID > 0
							and NWB.lastKnownLayer and NWB.lastKnownLayer > 0) then
					time = (NWB.data.layers[NWB.lastKnownLayerMapID][obj.type] + 1500) - GetServerTime();
				end
				if (time > 0) then
					local msg = string.format(L["singleSongflowerMsg"], NWB.songFlowers[obj.type].subZone, NWB:getTimeString(time, true));
					if (NWB.isLayered and NWB.layeredSongflowers and NWB:GetLayerCount() >= 2 and NWB.lastKnownLayerMapID and NWB.lastKnownLayerMapID > 0
							and NWB.lastKnownLayer and NWB.lastKnownLayer > 0) then
						msg = msg .. " (" .. L["Layer"] .. " " .. NWB.lastKnownLayer .. ")";
					elseif (NWB.isLayered and NWB.layeredSongflowers) then
						NWB:print("No layer currently known for Felwood, try targetting a NPC.");
						return;
					end
					if (button == "RightButton") then
						SendChatMessage("[NovaWorldBuffs] " .. msg, "say");
					else
						SendChatMessage("[WorldBuffs] " .. msg .. " (" .. NWB.songFlowers[obj.type].x .. ", " .. NWB.songFlowers[obj.type].y .. ")", "guild");
					end
				else
					NWB:print(L["noTimer"] .. " (" .. NWB.songFlowers[obj.type].subZone .. ").");
				end
			else
				NWB:openBuffListFrame();
			end
		end)
		
		--Minimap marker.
		local obj = CreateFrame("FRAME", k .. "NWBMini");
		obj.type = k;
		obj.name = L["Songflower"];
		obj.subZone = v.subZone;
		local bg = obj:CreateTexture(nil, "ARTWORK");
		bg:SetTexture(iconLocation);
		bg:SetAllPoints(obj);
		obj.texture = bg;
		obj:SetSize(12, 12);
		--Minimap tooltip.
		obj.tooltip = CreateFrame("Frame", k.. "Tooltip", MinimMapFrame, "TooltipBorderedFrameTemplate");
		obj.tooltip:SetPoint("CENTER", obj, "CENTER", 0, 18);
		obj.tooltip:SetFrameStrata("TOOLTIP");
		obj.tooltip:SetFrameLevel(9);
		obj.tooltip.fs = obj.tooltip:CreateFontString(k .. "NWBTooltipFS", "ARTWORK");
		obj.tooltip.fs:SetPoint("CENTER", 0, 0);
		obj.tooltip.fs:SetFont(NWB.regionFont, 8.5);
		obj.tooltip.fs:SetText("00:00");
		obj.tooltip:SetWidth(obj.tooltip.fs:GetStringWidth() + 9);
		obj.tooltip:SetHeight(obj.tooltip.fs:GetStringHeight() + 9);
		obj:SetScript("OnEnter", function(self)
			obj.tooltip:Show();
		end)
		obj:SetScript("OnLeave", function(self)
			obj.tooltip:Hide();
		end)
		--Timer frame that sits above the icon when an active timer is found.
		obj.timerFrame = CreateFrame("Frame", k.. "TimerFrameMini", obj, "TooltipBorderedFrameTemplate");
		obj.timerFrame:SetPoint("CENTER", 0, 18);
		obj.timerFrame:SetFrameStrata("FULLSCREEN");
		obj.timerFrame:SetFrameLevel(9);
		obj.timerFrame.fs = obj.timerFrame:CreateFontString(k .. "NWBTimerFrameFS", "ARTWORK");
		obj.timerFrame.fs:SetPoint("CENTER", 0, 0.5);
		obj.timerFrame.fs:SetFont(NWB.regionFont, 12);
		obj.timerFrame.fs:SetText("00:00");
		obj.timerFrame:SetWidth(obj.timerFrame.fs:GetStringWidth() + 14);
		obj.timerFrame:SetHeight(obj.timerFrame.fs:GetStringHeight() + 9);
		obj.lastUpdate = 0;
		obj:SetScript("OnUpdate", function(self)
			if (GetServerTime() - obj.lastUpdate < 1) then
				--1 second throddle.
				return;
			end
			--Update timer when minimap icon is in range.
			NWB:updateFelwoodMinimapMarker(obj.type);
			obj.timerFrame:SetWidth(obj.timerFrame.fs:GetStringWidth() + 14);
			obj.timerFrame:SetHeight(obj.timerFrame.fs:GetStringHeight() + 9);
			obj.lastUpdate = GetServerTime();
		end)
		obj.tooltip:Hide();
		obj:SetScript("OnMouseDown", function(self, button)
			if (IsShiftKeyDown()) then
				local time = (NWB.data[obj.type] + 1500) - GetServerTime();
				if (NWB.isLayered and NWB.layeredSongflowers and NWB:GetLayerCount() >= 2 and NWB.lastKnownLayerMapID and NWB.lastKnownLayerMapID > 0
							and NWB.lastKnownLayer and NWB.lastKnownLayer > 0) then
					time = (NWB.data.layers[NWB.lastKnownLayerMapID][obj.type] + 1500) - GetServerTime();
				end
				if (time > 0) then
					local msg = string.format(L["singleSongflowerMsg"], NWB.songFlowers[obj.type].subZone, NWB:getTimeString(time, true));
					if (NWB.isLayered and NWB.layeredSongflowers and NWB:GetLayerCount() >= 2 and NWB.lastKnownLayerMapID and NWB.lastKnownLayerMapID > 0
							and NWB.lastKnownLayer and NWB.lastKnownLayer > 0) then
						msg = msg .. " (" .. L["Layer"] .. " " .. NWB.lastKnownLayer .. ")";
					elseif (NWB.isLayered and NWB.layeredSongflowers) then
						NWB:print("No layer currently known for Felwood, try targetting a NPC.");
						return;
					end
					if (button == "RightButton") then
						SendChatMessage("[NovaWorldBuffs] " .. msg, "say");
					else
						SendChatMessage("[WorldBuffs] " .. msg .. " (" .. NWB.songFlowers[obj.type].x .. ", " .. NWB.songFlowers[obj.type].y .. ")", "guild");
					end
				else
					NWB:print(L["noTimer"] .. " (" .. NWB.songFlowers[obj.type].subZone .. ").");
				end
			else
				NWB:openBuffListFrame();
			end
		end)
	end
end

function NWB:createTuberMarkers()
	local iconLocation = "Interface\\Icons\\inv_misc_food_55";
	for k, v in pairs(NWB.tubers) do
		--Worldmap marker.
		local obj = CreateFrame("Frame", k .. "NWB", WorldMapFrame);
		obj.type = k;
		obj.name = L["Whipper Root Tuber"];
		obj.subZone = v.subZone;
		local bg = obj:CreateTexture(nil, "ARTWORK");
		bg:SetTexture(iconLocation);
		bg:SetAllPoints(obj);
		obj.texture = bg;
		obj:SetSize(12, 12);
		--World map tooltip.
		obj.tooltip = CreateFrame("Frame", k.. "Tooltip", WorldMapFrame, "TooltipBorderedFrameTemplate");
		obj.tooltip:SetPoint("CENTER", obj, "CENTER", 0, -36);
		obj.tooltip:SetFrameStrata("TOOLTIP");
		obj.tooltip:SetFrameLevel(9);
		obj.tooltip.fs = obj.tooltip:CreateFontString(k .. "NWBTooltipFS", "ARTWORK");
		obj.tooltip.fs:SetPoint("CENTER", 0, 0);
		obj.tooltip.fs:SetFont(NWB.regionFont, 12);
		obj.tooltip.fs:SetText("|CffDEDE42" .. L["Songflower"] .. "|r\n" .. v.subZone);
		obj.tooltip:SetWidth(obj.tooltip.fs:GetStringWidth() + 18);
		obj.tooltip:SetHeight(obj.tooltip.fs:GetStringHeight() + 12);
		obj:SetScript("OnEnter", function(self)
			obj.tooltip:Show();
		end)
		obj:SetScript("OnLeave", function(self)
			obj.tooltip:Hide();
		end)
		obj.tooltip:Hide();
		--Timer frame that sits above the icon when an active timer is found.
		obj.timerFrame = CreateFrame("Frame", k.. "TimerFrame", WorldMapFrame, "TooltipBorderedFrameTemplate");
		obj.timerFrame:SetPoint("CENTER", obj, "CENTER", 0, 17);
		obj.timerFrame:SetFrameStrata("FULLSCREEN");
		obj.timerFrame:SetFrameLevel(9);
		obj.timerFrame.fs = obj.timerFrame:CreateFontString(k .. "NWBTimerFrameFS", "ARTWORK");
		obj.timerFrame.fs:SetPoint("CENTER", 0, 0);
		obj.timerFrame.fs:SetFont(NWB.regionFont, 11);
		obj.timerFrame:SetWidth(38);
		obj.timerFrame:SetHeight(20);
		obj:SetScript("OnUpdate", function(self)
			--Update timer when map is open.
			NWB:updateFelwoodWorldmapMarker(obj.type);
			--obj.timerFrame:SetWidth(obj.timerFrame.fs:GetStringWidth() + 15);
			--obj.timerFrame:SetHeight(obj.timerFrame.fs:GetStringHeight() + 9);
		end)
		--Make it act like pin is the parent and not WorldMapFrame.
		obj:SetScript("OnHide", function(self)
			obj.timerFrame:Hide();
		end)
		obj:SetScript("OnShow", function(self)
			obj.timerFrame:Show();
		end)
		obj:SetScript("OnMouseDown", function(self)
			NWB:openBuffListFrame();
		end)
		
		--Minimap marker.
		local obj = CreateFrame("FRAME", k .. "NWBMini");
		obj.type = k;
		obj.name = L["Whipper Root Tuber"];
		obj.subZone = v.subZone;
		local bg = obj:CreateTexture(nil, "ARTWORK");
		bg:SetTexture(iconLocation);
		bg:SetAllPoints(obj);
		obj.texture = bg;
		obj:SetSize(12, 12);
		--Minimap tooltip.
		obj.tooltip = CreateFrame("Frame", k.. "Tooltip", MinimMapFrame, "TooltipBorderedFrameTemplate");
		obj.tooltip:SetPoint("CENTER", obj, "CENTER", 0, 18);
		obj.tooltip:SetFrameStrata("TOOLTIP");
		obj.tooltip:SetFrameLevel(9);
		obj.tooltip.fs = obj.tooltip:CreateFontString(k .. "NWBTooltipFS", "ARTWORK");
		obj.tooltip.fs:SetPoint("CENTER", 0, 0);
		obj.tooltip.fs:SetFont(NWB.regionFont, 8.5);
		obj.tooltip.fs:SetText("00:00");
		obj.tooltip:SetWidth(obj.tooltip.fs:GetStringWidth() + 9);
		obj.tooltip:SetHeight(obj.tooltip.fs:GetStringHeight() + 9);
		obj:SetScript("OnEnter", function(self)
			obj.tooltip:Show();
		end)
		obj:SetScript("OnLeave", function(self)
			obj.tooltip:Hide();
		end)
		--Timer frame that sits above the icon when an active timer is found.
		obj.timerFrame = CreateFrame("Frame", k.. "TimerFrameMini", obj, "TooltipBorderedFrameTemplate");
		obj.timerFrame:SetPoint("CENTER", 0, 18);
		obj.timerFrame:SetFrameStrata("FULLSCREEN");
		obj.timerFrame:SetFrameLevel(9);
		obj.timerFrame.fs = obj.timerFrame:CreateFontString(k .. "NWBTimerFrameFS", "ARTWORK");
		obj.timerFrame.fs:SetPoint("CENTER", 0, 0.5);
		obj.timerFrame.fs:SetFont(NWB.regionFont, 12);
		obj.timerFrame.fs:SetText("00:00");
		obj.timerFrame:SetWidth(obj.timerFrame.fs:GetStringWidth() + 14);
		obj.timerFrame:SetHeight(obj.timerFrame.fs:GetStringHeight() + 9);
		--Changed to show minimap timer awlways instead of on hover (if timer is active).
		obj:SetScript("OnUpdate", function(self)
			--Update timer when minimap icon is in range.
			NWB:updateFelwoodMinimapMarker(obj.type);
			obj.timerFrame:SetWidth(obj.timerFrame.fs:GetStringWidth() + 14);
			obj.timerFrame:SetHeight(obj.timerFrame.fs:GetStringHeight() + 9);
		end)
		obj.tooltip:Hide();
		obj:SetScript("OnMouseDown", function(self)
			NWB:openBuffListFrame();
		end)
	end
end

function NWB:createDragonMarkers()
	local iconLocation = "Interface\\Icons\\inv_misc_food_45";
	for k, v in pairs(NWB.dragons) do
		--Worldmap marker.
		local obj = CreateFrame("Frame", k .. "NWB", WorldMapFrame);
		obj.type = k;
		obj.name = L["Night Dragon's Breath"];
		obj.subZone = v.subZone;
		local bg = obj:CreateTexture(nil, "ARTWORK");
		bg:SetTexture(iconLocation);
		bg:SetAllPoints(obj);
		obj.texture = bg;
		obj:SetSize(12, 12);
		--World map tooltip.
		obj.tooltip = CreateFrame("Frame", k.. "Tooltip", WorldMapFrame, "TooltipBorderedFrameTemplate");
		obj.tooltip:SetPoint("CENTER", obj, "CENTER", 0, -36);
		obj.tooltip:SetFrameStrata("TOOLTIP");
		obj.tooltip:SetFrameLevel(9);
		obj.tooltip.fs = obj.tooltip:CreateFontString(k .. "NWBTooltipFS", "ARTWORK");
		obj.tooltip.fs:SetPoint("CENTER", 0, 0);
		obj.tooltip.fs:SetFont(NWB.regionFont, 12);
		obj.tooltip.fs:SetText("|CffDEDE42" .. L["Songflower"] .. "|r\n" .. v.subZone);
		obj.tooltip:SetWidth(obj.tooltip.fs:GetStringWidth() + 18);
		obj.tooltip:SetHeight(obj.tooltip.fs:GetStringHeight() + 12);
		obj:SetScript("OnEnter", function(self)
			obj.tooltip:Show();
		end)
		obj:SetScript("OnLeave", function(self)
			obj.tooltip:Hide();
		end)
		obj.tooltip:Hide();
		--Timer frame that sits above the icon when an active timer is found.
		obj.timerFrame = CreateFrame("Frame", k.. "TimerFrame", WorldMapFrame, "TooltipBorderedFrameTemplate");
		obj.timerFrame:SetPoint("CENTER", obj, "CENTER", 0, 17);
		obj.timerFrame:SetFrameStrata("FULLSCREEN");
		obj.timerFrame:SetFrameLevel(9);
		obj.timerFrame.fs = obj.timerFrame:CreateFontString(k .. "NWBTimerFrameFS", "ARTWORK");
		obj.timerFrame.fs:SetPoint("CENTER", 0, 0);
		obj.timerFrame.fs:SetFont(NWB.regionFont, 11);
		obj.timerFrame:SetWidth(38);
		obj.timerFrame:SetHeight(20);
		obj:SetScript("OnUpdate", function(self)
			--Update timer when map is open.
			NWB:updateFelwoodWorldmapMarker(obj.type);
			--obj.timerFrame:SetWidth(obj.timerFrame.fs:GetStringWidth() + 15);
			--obj.timerFrame:SetHeight(obj.timerFrame.fs:GetStringHeight() + 9);
		end)
		--Make it act like pin is the parent and not WorldMapFrame.
		obj:SetScript("OnHide", function(self)
			obj.timerFrame:Hide();
		end)
		obj:SetScript("OnShow", function(self)
			obj.timerFrame:Show();
		end)
		obj:SetScript("OnMouseDown", function(self)
			NWB:openBuffListFrame();
		end)
		
		--Minimap marker.
		local obj = CreateFrame("FRAME", k .. "NWBMini");
		obj.type = k;
		obj.name = L["Night Dragon's Breath"];
		obj.subZone = v.subZone;
		local bg = obj:CreateTexture(nil, "ARTWORK");
		bg:SetTexture(iconLocation);
		bg:SetAllPoints(obj);
		obj.texture = bg;
		obj:SetSize(12, 12);
		--Minimap tooltip.
		obj.tooltip = CreateFrame("Frame", k.. "Tooltip", MinimMapFrame, "TooltipBorderedFrameTemplate");
		obj.tooltip:SetPoint("CENTER", obj, "CENTER", 0, 18);
		obj.tooltip:SetFrameStrata("TOOLTIP");
		obj.tooltip:SetFrameLevel(9);
		obj.tooltip.fs = obj.tooltip:CreateFontString(k .. "NWBTooltipFS", "ARTWORK");
		obj.tooltip.fs:SetPoint("CENTER", 0, 0);
		obj.tooltip.fs:SetFont(NWB.regionFont, 8.5);
		obj.tooltip.fs:SetText("00:00");
		obj.tooltip:SetWidth(obj.tooltip.fs:GetStringWidth() + 9);
		obj.tooltip:SetHeight(obj.tooltip.fs:GetStringHeight() + 9);
		obj:SetScript("OnEnter", function(self)
			obj.tooltip:Show();
		end)
		obj:SetScript("OnLeave", function(self)
			obj.tooltip:Hide();
		end)
		--Timer frame that sits above the icon when an active timer is found.
		obj.timerFrame = CreateFrame("Frame", k.. "TimerFrameMini", obj, "TooltipBorderedFrameTemplate");
		obj.timerFrame:SetPoint("CENTER", 0, 18);
		obj.timerFrame:SetFrameStrata("FULLSCREEN");
		obj.timerFrame:SetFrameLevel(9);
		obj.timerFrame.fs = obj.timerFrame:CreateFontString(k .. "NWBTimerFrameFS", "ARTWORK");
		obj.timerFrame.fs:SetPoint("CENTER", 0, 0.5);
		obj.timerFrame.fs:SetFont(NWB.regionFont, 12);
		obj.timerFrame.fs:SetText("00:00");
		obj.timerFrame:SetWidth(obj.timerFrame.fs:GetStringWidth() + 14);
		obj.timerFrame:SetHeight(obj.timerFrame.fs:GetStringHeight() + 9);
		--Changed to show minimap timer awlways instead of on hover (if timer is active).
		obj:SetScript("OnUpdate", function(self)
			--Update timer when minimap icon is in range.
			NWB:updateFelwoodMinimapMarker(obj.type);
			obj.timerFrame:SetWidth(obj.timerFrame.fs:GetStringWidth() + 14);
			obj.timerFrame:SetHeight(obj.timerFrame.fs:GetStringHeight() + 9);
		end)
		obj.tooltip:Hide();
		obj:SetScript("OnMouseDown", function(self)
			NWB:openBuffListFrame();
		end)
	end
end

function NWB:refreshFelwoodMarkers()
	if (NWB.expansionNum > 3 or not createdFelwoodMarkers) then
		return;
	end
	for k, v in pairs(NWB.songFlowers) do
		NWB.dragonLibPins:RemoveWorldMapIcon(k .. "NWB", _G[k .. "NWB"]);
		NWB.dragonLibPins:RemoveMinimapIcon(k .. "NWBMini", _G[k .. "NWBMini"]);
		if (NWB.db.global.showSongflowerWorldmapMarkers) then
			NWB.dragonLibPins:AddWorldMapIconMap(k .. "NWB", _G[k .. "NWB"], 1448, v.x/100, v.y/100);
		end
		if (NWB.db.global.showSongflowerMinimapMarkers) then
			NWB.dragonLibPins:AddMinimapIconMap(k .. "NWBMini", _G[k .. "NWBMini"], 1448, v.x/100, v.y/100);
		end
	end
	for k, v in pairs(NWB.tubers) do
		NWB.dragonLibPins:RemoveWorldMapIcon(k .. "NWB", _G[k .. "NWB"]);
		NWB.dragonLibPins:RemoveMinimapIcon(k .. "NWBMini", _G[k .. "NWBMini"]);
		if (NWB.db.global.showTuberWorldmapMarkers) then
			NWB.dragonLibPins:AddWorldMapIconMap(k .. "NWB", _G[k .. "NWB"], 1448, v.x/100, v.y/100);
		end
		if (NWB.db.global.showTuberMinimapMarkers) then
			NWB.dragonLibPins:AddMinimapIconMap(k .. "NWBMini", _G[k .. "NWBMini"], 1448, v.x/100, v.y/100);
		end
	end
	for k, v in pairs(NWB.dragons) do
		NWB.dragonLibPins:RemoveWorldMapIcon(k .. "NWB", _G[k .. "NWB"]);
		NWB.dragonLibPins:RemoveMinimapIcon(k .. "NWBMini", _G[k .. "NWBMini"]);
		if (NWB.db.global.showDragonWorldmapMarkers) then
			NWB.dragonLibPins:AddWorldMapIconMap(k .. "NWB", _G[k .. "NWB"], 1448, v.x/100, v.y/100);
		end
		if (NWB.db.global.showDragonMinimapMarkers) then
			NWB.dragonLibPins:AddMinimapIconMap(k .. "NWBMini", _G[k .. "NWBMini"], 1448, v.x/100, v.y/100);
		end
	end
end