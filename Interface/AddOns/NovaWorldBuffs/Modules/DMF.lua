-------------------
---NovaWorldBuffs--
-------------------

local addonName, addon = ...;
local NWB = addon.a;
local L = LibStub("AceLocale-3.0"):GetLocale("NovaWorldBuffs");

--------------------------------------------------------------
---Warning: The following Darkmoon Faire code is a shitshow---
---					Enter at own risk					   ---
--------------------------------------------------------------

SLASH_NWBDMFCMD1 = '/dmf';
function SlashCmdList.NWBDMFCMD(msg, editBox)
	if (msg) then
		msg = string.lower(msg);
	end
	if (msg == "helper" or msg == "helpers") then
		NWB:openDmfHelperFrame();
		return;
	end
	if (msg == "map") then
		WorldMapFrame:Show();
		if (NWB.dmfZone == "Outlands") then
			WorldMapFrame:SetMapID(1952);
		elseif (NWB.dmfZone == "Mulgore") then
			WorldMapFrame:SetMapID(1412); 
		else
			WorldMapFrame:SetMapID(1429);
		end
		return;
	end
	if (msg == "options" or msg == "option" or msg == "config" or msg == "menu") then
		NWB:openConfig();
		return;
	end
	local output, dmfFound;
	local zone = NWB:getDmfZoneString();
	local timeString = NWB:getDmfTimeString();
	if (timeString == "Error getting Darkmoon Faire timer.") then
		output = timeString;
	else
		output = timeString .. " (" .. zone .. ")";
	end
	if (output) then
		if (msg ~= nil and msg ~= "") then
			NWB:print(output, msg, "[NWB]");
		else
			NWB:print(output);
		end
	end
	local dmfCooldown, noMsgs = NWB:getDmfCooldown();
	if (dmfCooldown > 0 and not noMsgs) then
		output = string.format(L["dmfBuffCooldownMsg"],  NWB:getTimeString(dmfCooldown, true));
		dmfFound = true;
	end
	--[[if (NWB.data.myChars[UnitName("player")].buffs) then
		for k, v in pairs(NWB.data.myChars[UnitName("player")].buffs) do
			if (v.type == "dmf" and (v.timeLeft + 7200) > 0 and not v.noMsgs) then
				output = string.format(L["dmfBuffCooldownMsg"],  NWB:getTimeString(v.timeLeft + 7200, true));
				dmfFound = true;
				break;
			end
		end
	end]]
	if (not dmfFound) then
		output = L["dmfBuffReady"];
	end
	if (msg == nil or msg == "") then
		NWB:print(output);
	end
end

function NWB:getDmfTimeString()
	local timestamp, timeLeft, type = NWB:getDmfData();
	if (timestamp == 0) then
		return "Error getting Darkmoon Faire timer.";
	end
	local msg, dateString;
	if (timestamp) then
 		if (NWB.db.global.timeStampFormat == 12) then
			dateString = date("%a %b %d", timestamp) .. " " .. gsub(string.lower(date("%I:%M%p", timestamp)), "^0", "");
		else
			dateString = date("%x %X", timestamp);
		end
		dateString = NWB:getTimeFormat(timestamp, true);
		if (type == "start") then
			msg = string.format(L["dmfSpawns"], NWB:getTimeString(timeLeft, true), dateString);
		else
			msg = string.format(L["dmfEnds"],NWB:getTimeString(timeLeft, true), dateString);
		end
		return msg;
	end
end

--Static dates that don't fall within the "first friday of every month construction starts" rule.
--It seems like Blizzard just start entering random dates instead of following the above rule now.
--Or there's a new formula I can't work out yet.
--These are friday dates when construction starts, taken from the retail calendar.
NWB.staticDmfDates = {};
function NWB:setDmfDates()
	if (NWB.isClassic) then
		NWB.staticDmfDates = {
			--[[[1] = { --July 30th setup, August 1st start 2021.
				day = 30,
				month = 7,
				year = 2021,
				zone = "Mulgore",
			},
			[2] = { --October 29th setup, October 31st start 2021.
				day = 29,
				month = 10,
				year = 2021,
				zone = "Elwynn Forest",
			},]]
		}
	end
end
--This needs to check for the next spawn.
--But also the last spawn within the last 7 days.
local dmfZoneStatic = "";
function NWB:getNextStaticDate(useNext)
	local foundCount, lastStaticDmf = 0, 0;
	local utcdate = date("!*t", GetServerTime());
	local currentUTC = time(utcdate);
	for k, v in ipairs(NWB.staticDmfDates) do
		local timeTable = {year = v.year, month = v.month, day = v.day, hour = 0, min = 0, sec = 0};
		local time = time(timeTable);
		--If this date is within the last 8 days and the next 31 days.
		--Within last 11 days to account for friday to sunday and so it works in all timezones
		--If it's past the despawn time we skip it anyway.
		if (time > (currentUTC - 950400) and time - currentUTC < 2678400
				--And if the last static dmf date wasn't within last 11 days.
				--This is to find out if current dmf is a static or formula date.
				--So if the current dmf up is not a static date it will keep showing dmf as up
				--and not use a forward static date within the next 31 days.
				and currentUTC - lastStaticDmf > 950400) then
			foundCount = foundCount + 1;
			--If useNext is specified then we try and find the next month, skipping first found.
			if (not useNext or foundCount > 1) then
				dmfZoneStatic = v.zone;
				return timeTable, lastStaticDmf;
			end
		end
		lastStaticDmf = time;
	end
	return nil, lastStaticDmf;
end

local dmfTextures = {
	--Calander textures for each dmf display type.
	[235451] = "Start Mulgore",
	--[235450] = "Days inbetween Mulgore",
	[235449] = "End Mulgore",
	[235455] = "Start Shat",
	--[235454] = "Days inbetween Shat",
	[235453] = "End Shat",
	[235448] = "Start Elwynn",
	--[235447] = "Days inbetween Elwynn",
	[235446] = "End Elwynn",
};

--Timestamp, seconds left, type (start/end), zone.
local dmfCalenderCache = {
	dmfTimestampCache = 0;
	dmfTimeLeftCache = 0;
	dmfTypeCache = "",
	dmfZoneCache = "",
};

local function getNextDmfCalender()
	if (CalendarFrame and CalendarFrame:IsShown()) then
		--Use cache if it's open so we don't change page while player is looking at it.
		--Maybe there's a way to calc from current month without SetAbsMonth() updating the UI?
		return dmfCalenderCache.dmfTimestampCache, dmfCalenderCache.dmfTimeLeftCache, dmfCalenderCache.dmfTypeCache, dmfCalenderCache.dmfZoneCache;
	end
	local eventStart, eventEnd;
	local nextStart, nextEnd = 0, 0;
	local now = C_DateAndTime.GetCurrentCalendarTime();
	--Record current month so we can subtract it from offsetTime.month so we always start at 0 but can +1 next month when needed too.
	local month = now.month;
	C_Calendar.SetAbsMonth(now.month, now.year);
	for dayOffset = 0, 60 do
		local offsetTime = C_DateAndTime.AdjustTimeByDays(now, dayOffset);
		for eventIndex = 1, C_Calendar.GetNumDayEvents(offsetTime.month - month, offsetTime.monthDay) do
			local event = C_Calendar.GetDayEvent(offsetTime.month - month, offsetTime.monthDay, eventIndex);
			--Get next dmf start or end time, whichever is next after current time.
			if (event and dmfTextures[event.iconTexture]) then
				if (event.sequenceType == "START") then
					--Fix date table structure so it works with time().
					event.startTime.day = event.startTime.monthDay;
					local timestamp = time(event.startTime);
					--Only record the first in the future.
					if (timestamp > GetServerTime()) then
						local zone;
						if (event.iconTexture == 235448) then
							zone = "Elwynn Forest";
						elseif (event.iconTexture == 235455) then
							zone = "Outlands";
						else
							zone = "Mulgore";
						end
						local timeLeft = timestamp - GetServerTime();
						local type = "start";
						dmfCalenderCache.dmfTimestampCache, dmfCalenderCache.dmfTimeLeftCache, dmfCalenderCache.dmfTypeCache, dmfCalenderCache.dmfZoneCache = timestamp, timeLeft, type, zone;
						return timestamp, timeLeft, type, zone;
					end
				elseif (event.sequenceType == "END") then
					event.endTime.day = event.endTime.monthDay;
					local timestamp = time(event.endTime);
					if (timestamp > GetServerTime()) then
						local zone;
						if (event.iconTexture == 235446) then
							zone = "Elwynn Forest";
						elseif (event.iconTexture == 235453) then
							zone = "Outlands";
						else
							zone = "Mulgore";
						end
						local timeLeft = timestamp - GetServerTime();
						local type = "end";
						dmfCalenderCache.dmfTimestampCache, dmfCalenderCache.dmfTimeLeftCache, dmfCalenderCache.dmfTypeCache, dmfCalenderCache.dmfZoneCache = timestamp, timeLeft, type, zone;
						return timestamp, timeLeft, type, zone;
					end
				end
			end
		end
	end
end

--DMF spawns the following monday after first friday of the month at daily reset time.
--Whole region shares time of day for spawn (I think).
--Realms within the region possibly don't all spawn at same moment though, realms may wait for their own monday.
--(Bug: US player reported it showing 1 day late DMF end time while on OCE realm, think this whole thing needs rewriting tbh).
function NWB:getDmfStartEnd(month, nextYear, recalc)
	if (NWB.isSOD) then
		local region = NWB:GetCurrentRegion();
		local calcStart;
		--Elywwn Forest start times in the past to calc from.
		--Using normal classic spawn times for now, but maybe it just spawns at midnight on all SoD servers?
		--I may change this to realm names later instead, region may be unreliable with US client on EU region if that issue still exists.
		--if (NWB.realm == "Shadowstrike (AU)" or NWB.realm == "Penance (AU)") then
		if (region == 1 and string.match(NWB.realm, "(AU)")) then
			--OCE Sunday 5pm UTC reset time (4am monday server time).
			calcStart = 1700416800; --Sunday, November 19, 2023 6:00:00 PM.
		elseif (region == 1) then
			--US Sunday 11pm UTC reset time (4am monday server time).
			--Unlike normal classic, in SoD it seems all US realms use the same timezone MST?
			calcStart = 1700478000; --Monday, November 20, 2023 11:00:00 AM UTC.
		elseif (region == 2) then
			--Korea 1am UTC monday (9am monday local) reset time.
			--(TW seems to be region 2 for some reason also? Hopefully they have same DMF spawn).
			--I can change it to server name based if someone from KR says this spawn time is wrong.
			calcStart = 1702890000; --Monday, December 18, 2023 9:00:00 AM UTC.
		elseif (region == 3) then
			--EU Monday 4am UTC reset time.
			calcStart = 1702872000; --Monday, December 18, 2023 4:00:00 AM UTC.
		elseif (region == 4) then
			--Taiwan 1am UTC monday (9am monday local) reset time.
			calcStart = 1702861200; --Monday, December 18, 2023 1:00:00 AM.
		elseif (region == 5) then
			--China 8pm UTC sunday (4am monday local) reset time.
			calcStart = 1702843200; --Sunday, December 17, 2023 8:00:00 PM UTC.
		end
		if (calcStart) then
			--Spawns change with DST by 1 hour UTC.
			local start = calcStart;
			local isDST = NWB:isDST();
			if (isDST) then
				--World event timers go forward but dmf goes backwards..?
				start = start - 3600;
			end
			--2 week cycle.
			--local utc = time(date("*t"));
			local utc = GetServerTime();
			local secondsSinceFirstReset = utc - start;
			--Divide seconds elapsed since our static timestamp in the past by the cycle time (3.5h).
			--Get the floor of secondsSinceFirstReset / cycle time
			--Divide seconds elapsed since our static timestamp in the past by the cycle time (3.5h).
			--Get the floor of that result (which would be last reset if multipled by cycle time) then add 1 for next reset, then multiply by cycle time.
			--This calc gets the next dmf start in the future and not the last start.
			local dmfStart = start + ((math.floor(secondsSinceFirstReset / 1209600) + 1) * 1209600);
			if (utc < dmfStart - 604800) then
				--If next future dmf start is more than 1 week away then the previous dmf is still up so remove 2 weeks and calc for that instead.
				dmfStart = dmfStart - 1209600;
			end
			local dmfEnd = dmfStart + 604800;
			local timeLeft = dmfStart - utc;
			return dmfStart, dmfEnd, start;
		end
	else
		local startOffset, endOffset, validRegion, isDst;
		local  minOffset, hourOffset, dayOffset = 0, 0, 0;
		local region = NWB:GetCurrentRegion();
		--I may change this to realm names later instead, region may be unreliable with US client on EU region if that issue still exists.
		if (NWB.realm == "Arugal" or NWB.realm == "Felstriker" or NWB.realm == "Remulos" or NWB.realm == "Yojamba") then
			--OCE Sunday 12pm UTC reset time (4am monday server time).
			dayOffset = 2; --2 days after friday (sunday).
			--Change this to saturday instead of of friday to try fix classic era calcs.
			--Changed back to friday now.
			--dayOffset = 1;
			hourOffset = 18; -- 6pm.
			validRegion = true;
		elseif (NWB.realm == "Arcanite Reaper" or NWB.realm == "Old Blanchy" or NWB.realm == "Anathema" or NWB.realm == "Azuresong"
				or NWB.realm == "Kurinnaxx" or NWB.realm == "Myzrael" or NWB.realm == "Rattlegore" or NWB.realm == "Smolderweb"
				or NWB.realm == "Thunderfury" or NWB.realm == "Atiesh" or NWB.realm == "Bigglesworth" or NWB.realm == "Blaumeux"
				or NWB.realm == "Fairbanks" or NWB.realm == "Grobbulus" or NWB.realm == "Whitemane") then
			--US west Sunday 11am UTC reset time (4am monday server time).
			dayOffset = 2; --2 days after friday (sunday).
			--dayOffset = 1;
			hourOffset = 11; -- 11am.
			validRegion = true;
		elseif (region == 1) then
			--US east + Latin Sunday 8am UTC reset time (4am monday server time).
			dayOffset = 2; --2 days after friday (sunday).
			--dayOffset = 1;
			hourOffset = 8; -- 8am.
			validRegion = true;
		elseif (region == 2) then
			--Korea 1am UTC monday (9am monday local) reset time.
			--(TW seems to be region 2 for some reason also? Hopefully they have same DMF spawn).
			--I can change it to server name based if someone from KR says this spawn time is wrong.
			dayOffset = 3;
			--dayOffset = 2;
			hourOffset = 1;
			validRegion = true;
		elseif (region == 3) then
			--EU Monday 4am UTC reset time.
			dayOffset = 3; --3 days after friday (monday).
			--dayOffset = 2;
			hourOffset = 2; -- 4am.
			validRegion = true;
		elseif (region == 4) then
			--Taiwan 1am UTC monday (9am monday local) reset time.
			dayOffset = 3;
			--dayOffset = 2;
			hourOffset = 1;
			validRegion = true;
		elseif (region == 5) then
			--China 8pm UTC sunday (4am monday local) reset time.
			dayOffset = 2;
			--dayOffset = 1;
			hourOffset = 20;
			validRegion = true;
		end
		--Create current UTC date table.
		local data = date("!*t", GetServerTime());
		local dataLocalTime = date("*t", GetServerTime());
		--Spawns change with DST by 1 hour UTC to stay the same server time.
		if (dataLocalTime.isdst) then
			hourOffset = hourOffset - 1;
		end
		--If month is specified then use that month instead (next dmf spawn is next month);
		if (month) then
			data.month = month;
		end
		--If nextYear is true then next dmf spawn is next year (we're in december right now).
		if (nextYear) then
			data.year = data.year + 1;
		end
		local dmfStartDay;
		--[[for i = 1, 7 do
			--Iterate the first 7 days in the month to find first friday.
			local time = date("!*t", time({year = data.year, month = data.month, day = i}));
			--if (time.wday == 6) then
			--Change this saturday instead of of friday to try fix classic era calcs.
			if (time.wday == 7) then
				--If day of the week (wday) is 6 (friday) then set this as first friday of the month.
				dmfStartDay = i;
			end
		end]]
		local timeTable;
		--This was fixed in a hotfix apparently, back to first friday.
		--[[if (NWB.isTBC) then
			--In TBC it seems to just be the first monday of the month?
			for i = 1, 7 do
				if (date("%w", time({year = data.year, month = data.month, day = i})) == "1") then
					dmfStartDay = i;
					break;
				end
			end
			if (not dmfStartDay) then
				return;
			end
			timeTable = {year = data.year, month = data.month, day = dmfStartDay, hour = hourOffset, min = minOffset, sec = 0};
		else]]
			--There was an issue with using the date table above for a single user, thier client couldn't get the first day of the month correct.
			--It was correct using %w instead so we'll just go with that for now.
			for i = 1, 7 do
				--Iterate the first 7 days in the month to find first friday.
				--This was using saturday for a while which seemed correct when friday wasn't during some months, but now friday seems right again..
				--If this is changed the offset says above needs adjusting to match.
				--0 = Sunday -> 6 = Saturday.
				if (date("%w", time({year = data.year, month = data.month, day = i})) == "5") then
					--If day of the week (wday) is 6 (friday) then set this as first friday of the month.
					dmfStartDay = i;
					break;
				end
			end
			if (not dmfStartDay) then
				--How is it possible this could fail to be found above? It was reported to have failed by a user.
				return;
			end
			timeTable = {year = data.year, month = data.month, day = dmfStartDay + dayOffset, hour = hourOffset, min = minOffset, sec = 0};
		--end
		local dataNextStatic, lastStaticDmf = NWB:getNextStaticDate();
		local utcdate   = date("!*t", GetServerTime());
		local localdate = date("*t", GetServerTime());
		localdate.isdst = false;
		local secondsDiff = difftime(time(utcdate), time(localdate));
		--local secondsDiff = difftime(time(localdate), time(utcdate));
		--local secondsDiffTest = difftime(time(utcdate), time(localdate));
		--NWB:debug(secondsDiff);
		local dmfStart;
		--if (secondsDiff > 0) then
		--	dmfStart = time(timeTable) - secondsDiff;
		--else
		--	dmfStart = time(timeTable) + secondsDiff;
		--end
		dmfStart = time(timeTable) - secondsDiff;
		--local dmfStart = time(timeTable) - secondsDiff;
		if (not lastStaticDmf) then
			lastStaticDmf = 0;
		end
		local dmfStartStatic = 0;
		if (dataNextStatic) then
			--Use next static instead if there is a valid static date set for next spawn.
			data = dataNextStatic;
			--Convert to a timestamp and add our region offsets.
			local staticTimestamp = time(dataNextStatic);
			local staticOffset = 0;
			staticOffset = staticOffset + (dayOffset * 86400);
			staticOffset = staticOffset + (hourOffset * 3600);
			staticOffset = staticOffset + (minOffset * 60);
			local staticOffsetTimestamp = staticTimestamp + staticOffset;
			local staticDateUTC = date("*t", staticOffsetTimestamp);
			dmfStartStatic = time(staticDateUTC) - secondsDiff;
			if (GetServerTime() > dmfStart + 604800) then
				local dataNextStatic = NWB:getNextStaticDate(true);
				if (dataNextStatic) then
					local staticTimestamp = time(dataNextStatic);
					local staticOffset = 0;
					staticOffset = staticOffset + (dayOffset * 86400);
					staticOffset = staticOffset + (hourOffset * 3600);
					staticOffset = staticOffset + (minOffset * 60);
					local staticOffsetTimestamp = staticTimestamp + staticOffset;
					local staticDateUTC = date("*t", staticOffsetTimestamp);
					--dmfStart = time(staticDateUTC) - secondsDiff;
					dmfStartStatic = time(staticDateUTC) - secondsDiff;
				end
			--else
				--dmfStart = dmfStartStatic;
			end
		end
	
		if (dmfStartStatic > GetServerTime() + 1296000 and dmfStartStatic < GetServerTime() - 1296000
				and dmfStart < GetServerTime() + 950400 and dmfStart > GetServerTime() - 950400) then
			--If formula date is within 11 days and there's no static date within the next or past 15 days then force use the forumla date.
			--So we don't get next static date within 31 days while the forumla dmf is still up.
			--This will probably create wrong next dmf date for the first day or 2 after dmf ends but it's good enough for now.
			--This while thing needs a rewrite.
		--elseif (dataNextStatic and dataNextStatic > 0) then
		elseif (dmfStartStatic and dmfStartStatic > 0) then
			dmfStart = dmfStartStatic;
		end
		--This is basically just adjusting for my shitty local offset code since all regions spawn on monday.
		--My offset code will get the time right but sometimes the day behind, so adjust to monday if it's sunday.
		--It needs fixing later, but all regions start on monday/tuesday so this works for now..
		--This also helps with playing from a diff timezone than the server issues.
		if (date("%w", dmfStart) == "0") then
			--Not sure if whole region spawns at the same moment or if each realm waits for their own monday.
			--All realms spawn same time of day, but possibly not same UTC day depending on timezone.
			--Just incase each realm waits for monday we can add a day here.
			dmfStart = dmfStart + 86400;
		end
		--Add 7 days to get end timestamp.
		local dmfEnd = dmfStart + 604800;
		--Only return if we have set daily reset offsets for this region.
		if (not recalc and lastStaticDmf + 604800 > GetServerTime() - 1296000
			and (dmfStartStatic == 0 or dmfStartStatic > GetServerTime() + 3456000)) then
			local data = date("!*t", GetServerTime());
			if (data.month == 12) then
				data.month = 1;
				return NWB:getDmfStartEnd(data.month, true, true);
			else
				data.month = data.month + 1
				return NWB:getDmfStartEnd(data.month, nil, true);
			end
		elseif (validRegion) then
			return dmfStart, dmfEnd;
		end
	end
end

function NWB:getDmfData()
	if (NWB.isSOD) then
		local dmfStart, dmfEnd, calcStart = NWB:getDmfStartEnd();
		local timestamp, timeLeft, type;
		local cycleCount = 0;
		if (dmfStart and dmfEnd) then
			if (GetServerTime() < dmfStart) then
				--It's before the start of dmf.
				timestamp = dmfStart;
				type = "start";
				timeLeft = dmfStart - GetServerTime();
				NWB.isDmfUp = nil;
			elseif (GetServerTime() < dmfEnd) then
				--It's after dmf started and before the end.
				timestamp = dmfEnd;
				type = "end";
				timeLeft = dmfEnd - GetServerTime();
				NWB.isDmfUp = true;
			elseif (GetServerTime() >= dmfEnd) then
				--It's after dmf ended so calc next months dmf instead.
				local data = date("!*t", GetServerTime());
				if (data.month == 12) then
					dmfStart, dmfEnd = NWB:getDmfStartEnd(1, true);
				else
					dmfStart, dmfEnd = NWB:getDmfStartEnd(data.month + 1);
				end
				timestamp = dmfStart;
				type = "start";
				timeLeft = dmfStart - GetServerTime();
				NWB.isDmfUp = nil;
			end
			if (timestamp) then
				local weeks = (timestamp - calcStart) / 604800;
				local twoWeeks = (timestamp - calcStart) / 1209600;
				--Check if weeks since calc started is divisble by 4.
				if (((dmfStart - calcStart) / 604800) % 4 == 0) then
					NWB.dmfZone = "Elwynn Forest";
				else
					NWB.dmfZone = "Mulgore";
				end
				return timestamp, timeLeft, type;
			end
		end
	elseif (NWB.isClassic or NWB.isTBC) then
		local dmfStart, dmfEnd = NWB:getDmfStartEnd();
		local timestamp, timeLeft, type;
		if (dmfStart and dmfEnd) then
			if (GetServerTime() < dmfStart) then
				--It's before the start of dmf.
				timestamp = dmfStart;
				type = "start";
				timeLeft = dmfStart - GetServerTime();
				NWB.isDmfUp = nil;
			elseif (GetServerTime() < dmfEnd) then
				--It's after dmf started and before the end.
				timestamp = dmfEnd;
				type = "end";
				timeLeft = dmfEnd - GetServerTime();
				NWB.isDmfUp = true;
			elseif (GetServerTime() > dmfEnd) then
				--It's after dmf ended so calc next months dmf instead.
				local data = date("!*t", GetServerTime());
				if (data.month == 12) then
					dmfStart, dmfEnd = NWB:getDmfStartEnd(1, true);
				else
					dmfStart, dmfEnd = NWB:getDmfStartEnd(data.month + 1);
				end
				timestamp = dmfStart;
				type = "start";
				timeLeft = dmfStart - GetServerTime();
				NWB.isDmfUp = nil;
			end
			local zone;
			local startMonth = tonumber(date("%m", dmfStart));
			local startDay = tonumber(date("%d", dmfStart));
			--If it starts at the end of the month then change which zone it starts in.
			if (startDay > 20) then
				startMonth = startMonth + 1;
			end
			if (NWB.isTBC) then
				--[[if (startMonth == 2 or startMonth == 5 or startMonth == 8 or startMonth == 11) then
					zone = "Outlands";
				elseif (startMonth == 1 or startMonth == 4 or startMonth == 7 or startMonth == 10) then
					zone = "Mulgore";
				else
					zone = "Elwynn Forest";
				end]]
				--It's different in anni.
				if (startMonth == 4 or startMonth == 7 or startMonth == 10 or startMonth == 1) then
					zone = "Outlands";
				elseif (startMonth == 3 or startMonth == 6 or startMonth == 9 or startMonth == 12) then
					zone = "Elwynn Forest";
				else
					zone = "Mulgore";
				end
			else
				if (startMonth % 2 == 0) then
					--These were swapped around manually by Blizzard but now it seems to be swapped back to be in sync with era realms.
					--if (NWB.isTBC or NWB.realmsTBC) then
					--	zone = "Elwynn Forest";
					--else
						zone = "Mulgore";
					--end
				else
					--if (NWB.isTBC or NWB.realmsTBC) then
					--	zone = "Mulgore";
					--else
						zone = "Elwynn Forest";
					--end
		 
				end
			end
			--Zone override for static dates.
			if (dmfZoneStatic ~= "") then
				zone = dmfZoneStatic;
			end
			NWB.dmfZone = zone;
			--Timestamp of next start or end event, seconds left untill that event, and type of event.
			return timestamp, timeLeft, type;
		end
	else
		local timestamp, timeLeft, type, zone = getNextDmfCalender();
		if (not timestamp) then
			--Calander lookup has failed, could be becaus Blizzard hasn't added next month data like has happen now at 2022 end.
			return 0, 0, "";
		end
		NWB.dmfZone = zone;
		return timestamp, timeLeft, type;
	end
end

function NWB:getDmfZoneString()
	if (NWB.dmfZone == "Outlands") then
		return L["Outlands"];
	elseif (NWB.dmfZone == "Mulgore") then
		return L["mulgore"];
	else
		return L["elwynnForest"];
	end
end

function NWB:checkDmfBuffReset(isLogon)
	if (NWB.isHardcore or not NWB.isClassic) then
		return;
	end
	local charString = "";
	local count = 0;
	local foundThisCharDmfReset;
	local me = UnitName("player");
	for realm, realmData in pairs(NWB.db.global) do
		if (type(realmData) == "table" and realm ~= "minimapIcon" and realm ~= "versions") then
			for faction, factionData in pairs(realmData) do
				if (type(factionData) == "table" and factionData.myChars) then
					for char, charData in pairs(factionData.myChars) do
						local lastOnline;
						if (char == me and isLogon) then
							--Use a cache recorded before the ticker starts for checks at logon.
							lastOnline = NWB.lastOnlineCache;
						else
							lastOnline = charData.lo;
						end
						if (charData.dmfCooldown and lastOnline and charData.dmfCooldown > 0 and GetServerTime() - lastOnline > 691200) then
							--If been offline over a week just reset it, the cooldown doesn't seem to persist between dmf even if offline the whole time and not rested?
							--Reset dmf buff cooldown data, needs to still be a number and lower than -99990.
							charData.dmfCooldown = -99999;
						end
						if (charData.dmfCooldown and lastOnline and charData.resting and charData.dmfCooldown > 0 and GetServerTime() - lastOnline > 28800) then
							if (not NWB:isDMFBooned(char, realm)) then
								--If 8+ hours offline and in rested area and have dmf buff cooldwn.
								count = count + 1;
								local _, _, _, classColorHex = GetClassColor(charData.englishClass);
								local text = "|c" .. classColorHex .. char .. "-" .. realm .. "|r";
								if (count == 1) then
									charString = text;
								else
									charString = charString .. ", " .. text;
								end
								--Reset dmf buff cooldown data, needs to still be a number and lower than -99990.
								charData.dmfCooldown = -99999;
								if (char == me) then
									foundThisCharDmfReset = true;
								end
							end
						end
					end
				end
			end
		end
	end
	if (NWB.isDmfUp and charString ~= "") then
		NWB:print(L["dmfLogonBuffResetMsg"] .. ": " .. charString);
		return foundThisCharDmfReset;
	end
end

function NWB:updateDmfMarkers(type)
	local timestamp, timeLeft, type = NWB:getDmfData();
	local text = "";
	if (not timestamp or timestamp < 1) then
		text = text .. L["noTimer"];
	else
		if (type == "start") then
			text = text .. string.format(L["startsIn"], NWB:getTimeString(timeLeft, true, "short"));
		else
			text = text .. string.format(L["endsIn"], NWB:getTimeString(timeLeft, true, "short"));
		end
	end
	if (timeLeft and timeLeft > 0) then
		local tooltipText = "|Cff00ff00" .. L["Darkmoon Faire"] .. "|CffDEDE42\n";
		if (type == "start") then
			tooltipText = tooltipText .. string.format(L["startsIn"], NWB:getTimeString(timeLeft, true)) .. "\n";
		else
			tooltipText = tooltipText .. string.format(L["endsIn"], NWB:getTimeString(timeLeft, true)) .. "\n";
		end
    	tooltipText = tooltipText .. NWB:getTimeFormat(timestamp, true);
    	local dmfFound;
    	local buffText = "";
    	if (NWB.isDmfUp or NWB.isAlwaysDMF) then
    		local dmfCooldown, noMsgs = NWB:getDmfCooldown();
			if (dmfCooldown > 0 and not noMsgs) then
				buffText = "\n" .. string.format(L["dmfBuffCooldownMsg"],  NWB:getTimeString(dmfCooldown, true));
				dmfFound = true;
			end
    		--[[if (NWB.data.myChars[UnitName("player")].buffs) then
				for k, v in pairs(NWB.data.myChars[UnitName("player")].buffs) do
					if (v.type == "dmf" and (v.timeLeft + 7200) > 0 and not v.noMsgs) then
						buffText = "\n" .. string.format(L["dmfBuffCooldownMsg"],  NWB:getTimeString((v.timeLeft + 7200), true));
						dmfFound = true;
						break;
					end
				end
			end]]
    		if (not dmfFound) then
    			buffText = "\n" .. L["dmfBuffReady"];
    		end
    	end
    	tooltipText = tooltipText .. buffText;
    	_G["NWBDMF"].tooltip.fs:SetText(tooltipText);
    	_G["NWBDMF"].tooltip:SetWidth(_G["NWBDMF"].tooltip.fs:GetStringWidth() + 18);
		_G["NWBDMF"].tooltip:SetHeight(_G["NWBDMF"].tooltip.fs:GetStringHeight() + 12);
		_G["NWBDMFContinent"].tooltip.fs:SetText(tooltipText);
    	_G["NWBDMFContinent"].tooltip:SetWidth(_G["NWBDMFContinent"].tooltip.fs:GetStringWidth() + 12);
		_G["NWBDMFContinent"].tooltip:SetHeight(_G["NWBDMFContinent"].tooltip.fs:GetStringHeight() + 12);
		--_G["NWBDMF"]:Show();
  		--_G["NWBDMFContinent"]:Show();
  	else
  		--_G["NWBDMF"]:Hide();
  		--_G["NWBDMFContinent"]:Hide();
  	end
	return text;
end

function NWB:createDmfMarkers()
	--Darkmoon Faire zone map marker.
	local icon = "Interface\\AddOns\\NovaWorldBuffs\\Media\\dmf";
	local obj = CreateFrame("Frame", "NWBDMF", WorldMapFrame);
	local bg = obj:CreateTexture(nil, "ARTWORK");
	bg:SetTexture(icon);
	bg:SetAllPoints(obj);
	obj.texture = bg;
	obj:SetSize(23, 23);
	--Worldmap tooltip.
	obj.tooltip = CreateFrame("Frame", "NWBDMFTooltip", WorldMapFrame, "TooltipBorderedFrameTemplate");
	obj.tooltip:SetPoint("CENTER", obj, "CENTER", 0, 46);
	obj.tooltip:SetFrameStrata("TOOLTIP");
	obj.tooltip:SetFrameLevel(9);
	obj.tooltip.fs = obj.tooltip:CreateFontString("NWBDMFTooltipFS", "ARTWORK");
	obj.tooltip.fs:SetPoint("CENTER", 0, 0);
	obj.tooltip.fs:SetFont(NWB.regionFont, 14);
	obj.tooltip.fs:SetText("|Cff00ff00Darkmoon Faire");
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
	obj.timerFrame = CreateFrame("Frame", "NWBDMFTimerFrame", WorldMapFrame, "TooltipBorderedFrameTemplate");
	obj.timerFrame:SetPoint("CENTER", obj, "CENTER", 0, -21);
	obj.timerFrame:SetFrameStrata("FULLSCREEN");
	obj.timerFrame:SetFrameLevel(9);
	obj.timerFrame.fs = obj.timerFrame:CreateFontString("NWBDMFTimerFrameFS", "ARTWORK");
	obj.timerFrame.fs:SetPoint("CENTER", 0, 0);
	obj.timerFrame.fs:SetFont(NWB.regionFont, 13);
	obj.timerFrame:SetWidth(54);
	obj.timerFrame:SetHeight(24);
	obj:SetScript("OnUpdate", function(self)
		--Update timer when map is open.
		obj.timerFrame.fs:SetText(NWB:updateDmfMarkers());
		obj.timerFrame:SetWidth(obj.timerFrame.fs:GetStringWidth() + 10);
		obj.timerFrame:SetHeight(obj.timerFrame.fs:GetStringHeight() + 10);
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
	
	--Darkmoon Faire continent marker.
	local obj = CreateFrame("Frame", "NWBDMFContinent", WorldMapFrame);
	local bg = obj:CreateTexture(nil, "ARTWORK");
	bg:SetTexture(icon);
	bg:SetAllPoints(obj);
	obj.texture = bg;
	obj:SetSize(14, 14);
	obj:SetFrameStrata("High");
	obj:SetFrameLevel(9);
	--Worldmap tooltip.
	obj.tooltip = CreateFrame("Frame", "NWBDMFContinentTooltip", WorldMapFrame, "TooltipBorderedFrameTemplate");
	obj.tooltip:SetPoint("CENTER", obj, "CENTER", 0, 46);
	obj.tooltip:SetFrameStrata("TOOLTIP");
	obj.tooltip:SetFrameLevel(9);
	obj.tooltip.fs = obj.tooltip:CreateFontString("NWBDMFContinentTooltipFS", "ARTWORK");
	obj.tooltip.fs:SetPoint("CENTER", 0, 0);
	obj.tooltip.fs:SetFont(NWB.regionFont, 14);
	obj.tooltip.fs:SetText("|Cff00ff00Darkmoon Faire");
	obj.tooltip:SetWidth(obj.tooltip.fs:GetStringWidth() + 18);
	obj.tooltip:SetHeight(obj.tooltip.fs:GetStringHeight() + 12);
	obj:SetScript("OnEnter", function(self)
		obj.tooltip:Show(); --5:34 2h4m
	end)
	obj:SetScript("OnLeave", function(self)
		obj.tooltip:Hide();
	end)
	obj.tooltip:Hide();
	obj:SetScript("OnUpdate", function(self)
		--Updatetooltip  timer when map is open.
		NWB:updateDmfMarkers();
	end)
	obj:SetScript("OnMouseDown", function(self)
		NWB:openBuffListFrame();
	end)
	NWB:refreshDmfMarkers();
end

function NWB:refreshDmfMarkers()
	if (not NWB.dmfZone) then
		return;
	end
	--Mulgore and Elwynn are both slightly south (+1 coord) of the actual DMF spot in continent maps to not clash with other addon quest markers.
	--Players need to be able to hover DMF marker easily to see buff cooldown etc.
	local x, y, mapID, worldX, worldY, worldMapID;
	if (NWB.dmfZone == "Outlands") then
		x, y, mapID = 34.8, 34.6, 1952;
		worldX, worldY, worldMapID = 44.6, 69.5, 1945;
	elseif (NWB.dmfZone == "Mulgore") then
		x, y, mapID = 36.8, 37.6, 1412;
		worldX, worldY, worldMapID = 45.95, 59.6, 1414;
	else
		x, y, mapID = 42, 70, 1429;
		worldX, worldY, worldMapID = 45.2, 73.55, 1415;
	end
	NWB.dragonLibPins:RemoveWorldMapIcon("NWBDMF", _G["NWBDMF"]);
	if (NWB.db.global.showDmfMap) then
		NWB.dragonLibPins:AddWorldMapIconMap("NWBDMF", _G["NWBDMF"], mapID, x/100, y/100, HBD_PINS_WORLDMAP_SHOW_PARENT);
		NWB.dragonLibPins:AddWorldMapIconMap("NWBDMFContinent", _G["NWBDMFContinent"], worldMapID, worldX/100, worldY/100, HBD_PINS_WORLDMAP_SHOW_WORLD, "TOOLTIP");
	end
end

WorldMapFrame:HookScript("OnShow", function()
	NWB:refreshDmfMarkers();
	NWB:refreshWorldbuffMarkers();
end)

function NWB:fixMapMarkers()
	--Fix a bug with tooltips not showing first time opening the map.
	--Running this twice taints the blizzard raid frames (wtf?)
	--WorldMapFrame:Show();
	--WorldMapFrame:SetMapID(1448);
	--WorldMapFrame:Hide();
end

function NWB:addDMFMinimapString(tooltip)
	if (not NWB.isSOD) then
		return;
	end
	local text;
	--Check if previous line is a seperator so we don't double up.
	if (_G[tooltip:GetName() .. "TextLeft" .. tooltip:NumLines()] and _G[tooltip:GetName() .. "TextLeft" .. tooltip:NumLines()]:GetText() ~= " ") then
		tooltip:AddLine(" ");
		if (not tooltip.NWBSeparator5) then
		    tooltip.NWBSeparator5 = tooltip:CreateTexture(nil, "BORDER");
		    tooltip.NWBSeparator5:SetColorTexture(0.6, 0.6, 0.6, 0.85);
		    tooltip.NWBSeparator5:SetHeight(1);
		    tooltip.NWBSeparator5:SetPoint("LEFT", 10, 0);
		    tooltip.NWBSeparator5:SetPoint("RIGHT", -10, 0);
		end
		tooltip.NWBSeparator5:SetPoint("TOP", _G[tooltip:GetName() .. "TextLeft" .. tooltip:NumLines()], "CENTER");
		tooltip.NWBSeparator5:Show();
	end
	local timestamp, timeLeft, type = NWB:getDmfData();
	local zone = NWB.dmfZone;
	if (zone == "Elwynn Forest") then
		zone = "Elwynn";
	end
	--NWB.isDmfUp = true;
	local text = "";
	if (not timestamp or timestamp < 1) then
		text = text .. L["noTimer"];
	else
		if (type == "start") then
			text = text .. L["dmfAbbreviation"] .. " (" .. zone .. ") " .. string.lower(string.format(L["startsIn"], "|cFF9CD6DE" .. NWB:getTimeString(timeLeft, true, "medium") .. "|r"));
		else
			text = text .. string.format(L["endsIn"], "|cFF9CD6DE" .. NWB:getTimeString(timeLeft, true, "medium") .. "|r") .. " (" .. zone .. ")";
		end
	end
	local dateString = "";
	if (IsShiftKeyDown()) then
		if (NWB.db.global.timeStampFormat == 12) then
			dateString = " (" .. date("%A", timestamp) .. " " .. gsub(date("%I:%M", timestamp), "^0", "")
					.. string.lower(date("%p", timestamp)) .. ")";
		else
			dateString = " (" .. date("%A %H:%M", timestamp) .. ")";
		end
	end
	if (NWB.isDmfUp) then
		tooltip:AddLine("|cFF00C800" .. L["Darkmoon Faire is up"] .. "|r");
		tooltip:AddLine(text .. dateString);
		local dmfCooldown, noMsgs = NWB:getDmfCooldown();
		if (dmfCooldown > 0) then
			tooltip:AddLine(string.format(L["dmfBuffCooldownMsg"],  NWB:getTimeString(dmfCooldown, true, "short")));
		else
			tooltip:AddLine(L["dmfBuffReady"]);
		end
	else
		tooltip:AddLine(text .. dateString);
	end
	if (NWB.isSOD) then
		--Bundle bi-weekly day reset with dmf minimap tooltip.
		local biWeeklyReset = NWB:getBiWeeklyReset();
		if (biWeeklyReset) then
			local biWeeklyDateString = "";
			if (IsShiftKeyDown()) then
				if (NWB.db.global.timeStampFormat == 12) then
					biWeeklyDateString = " (" .. date("%A", biWeeklyReset) .. " " .. gsub(date("%I:%M", biWeeklyReset), "^0", "")
							.. string.lower(date("%p", biWeeklyReset)) .. ")";
				else
					biWeeklyDateString = " (" .. date("%A %H:%M", biWeeklyReset) .. ")";
				end
			end
			tooltip:AddLine("|cFF00C800" .. L["Bi-Weekly raid reset"] .. ":|r |cFF9CD6DE" .. NWB:getTimeString(biWeeklyReset - GetServerTime(), true, "medium")
					.. "|r" .. biWeeklyDateString .. "|r");
		end
		--Bundle 3 day reset with dmf minimap tooltip.
		local threeDayReset = NWB:getThreeDayReset();
		if (threeDayReset and threeDayReset ~= 0) then
			local threeDateString = "";
			if (IsShiftKeyDown()) then
				if (NWB.db.global.timeStampFormat == 12) then
					threeDateString = " (" .. date("%A", threeDayReset) .. " " .. gsub(date("%I:%M", threeDayReset), "^0", "")
							.. string.lower(date("%p", threeDayReset)) .. ")";
				else
					threeDateString = " (" .. date("%A %H:%M", threeDayReset) .. ")";
				end
			end
			tooltip:AddLine("|cFF00C800" .. L["3 day raid reset"] .. " (BFD):|r |cFF9CD6DE" .. NWB:getTimeString(threeDayReset - GetServerTime(), true, "medium")
					.. "|r" .. threeDateString .. "|r");
		end
	elseif (NWB.isClassic) then
		--Bundle 3 day reset with dmf minimap tooltip.
		local threeDayReset = NWB:getThreeDayReset();
		if (threeDayReset and threeDayReset ~= 0) then
			local threeDateString = "";
			if (IsShiftKeyDown()) then
				if (NWB.db.global.timeStampFormat == 12) then
					threeDateString = " (" .. date("%A", threeDayReset) .. " " .. gsub(date("%I:%M", threeDayReset), "^0", "")
							.. string.lower(date("%p", threeDayReset)) .. ")";
				else
					threeDateString = " (" .. date("%A %H:%M", threeDayReset) .. ")";
				end
			end
			tooltip:AddLine("|cFF00C800" .. L["3 day raid reset"] .. ":|r |cFF9CD6DE" .. NWB:getTimeString(threeDayReset - GetServerTime(), true, "short")
					.. "|r" .. threeDateString .. "|r");
		end
	end
	tooltip:AddLine(" ");
	if (not tooltip.NWBSeparator6) then
	    tooltip.NWBSeparator6 = tooltip:CreateTexture(nil, "BORDER");
	    tooltip.NWBSeparator6:SetColorTexture(0.6, 0.6, 0.6, 0.85);
	    tooltip.NWBSeparator6:SetHeight(1);
	    tooltip.NWBSeparator6:SetPoint("LEFT", 10, 0);
	    tooltip.NWBSeparator6:SetPoint("RIGHT", -10, 0);
	end
	tooltip.NWBSeparator6:SetPoint("TOP", _G[tooltip:GetName() .. "TextLeft" .. tooltip:NumLines()], "CENTER");
	tooltip.NWBSeparator6:Show();
end