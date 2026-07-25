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

function NWB:openDmfHelperFrame()
	if (_G["NWBDmfFrame"]) then
		_G["NWBDmfFrame"]:Show();
	else
		NWB:print("DMF helper not available in this game version.");
	end
end

if (NWB.isClassic) then
	--DMF Helper Frame.
	--This helps using the stuck method for DMF buff people are already using on pvp realms for when factions are griefing each other.
	--If Blizzard is against using stuck in this way I'll be happy to remove this.
	local dmfTimerBar;
	local NWBDmfFrame = CreateFrame("Frame", "NWBDmfFrame", UIParent, NWB:addBackdrop());
	NWBDmfFrame:Hide();
	NWBDmfFrame:SetToplevel(true);
	NWBDmfFrame:SetMovable(true);
	NWBDmfFrame:EnableMouse(true);
	--tinsert(UISpecialFrames, "NWBDmfFrame");
	NWBDmfFrame:SetPoint("CENTER", UIParent, -325, 125);
	NWBDmfFrame:SetWidth(250);
	NWBDmfFrame:SetHeight(270);
	NWBDmfFrame:SetBackdrop({bgFile = "Interface\\Buttons\\WHITE8x8",insets = {top = 0, left = 0, bottom = 0, right = 0}});
	NWBDmfFrame:SetBackdropColor(0,0,0,.6);
	NWBDmfFrame:SetFrameLevel(128);
	NWBDmfFrame:SetFrameStrata("MEDIUM");
	NWBDmfFrame.fs = NWBDmfFrame:CreateFontString("NWBDmfFrameFS", "ARTWORK");
	NWBDmfFrame.fs:SetPoint("TOP", 0, -3);
	NWBDmfFrame.fs:SetFont(NWB.regionFont, 14);
	NWBDmfFrame.fs:SetText(NWB.prefixColor .. "NWB Stuck Helper");
	NWBDmfFrame.fs2 = NWBDmfFrame:CreateFontString("NWBDmfFrameFS2", "ARTWORK");
	NWBDmfFrame.fs2:SetPoint("TOP", 0, -65);
	NWBDmfFrame.fs2:SetFont(NWB.regionFont, 14);
	local iwtKeybind = "";
	NWBDmfFrame.fs2:SetText("Current Interact With Target keybind: |cffffa500" .. iwtKeybind);
	NWBDmfFrame.fs3 = NWBDmfFrame:CreateFontString("NWBDmfFrameFS", "ARTWORK");
	NWBDmfFrame.fs3:SetPoint("TOP", 0, -19);
	NWBDmfFrame.fs3:SetFont(NWB.regionFont, 14);
	NWBDmfFrame.fs3:SetText("|cffffff00Target Sayge and be in interact range\nbefore starting.");

	function NWB:updateInteractBindText()
		iwtKeybind = GetBindingKey("INTERACTTARGET");
		if (not iwtKeybind) then
			iwtKeybind = "None";
		end
		NWBDmfFrame.fs2:SetText("Current Interact With Target keybind:\n|cffffa500" .. iwtKeybind);
	end

	local NWBDmfDragFrame = CreateFrame("Frame", "NWBbuffListDragFrame", NWBDmfFrame);
	--NWBDmfDragFrame:SetToplevel(true);
	NWBDmfDragFrame:EnableMouse(true);
	NWBDmfDragFrame:SetWidth(205);
	NWBDmfDragFrame:SetHeight(38);
	NWBDmfDragFrame:SetPoint("TOP", 0, 4);
	NWBDmfDragFrame:SetFrameLevel(131);
	NWBDmfDragFrame.tooltip = CreateFrame("Frame", "NWBDmfDragTooltip", NWBDmfDragFrame, "TooltipBorderedFrameTemplate");
	NWBDmfDragFrame.tooltip:SetPoint("CENTER", NWBDmfDragFrame, "TOP", 0, 12);
	NWBDmfDragFrame.tooltip:SetFrameStrata("TOOLTIP");
	NWBDmfDragFrame.tooltip:SetFrameLevel(9);
	NWBDmfDragFrame.tooltip:SetAlpha(.8);
	NWBDmfDragFrame.tooltip.fs = NWBDmfDragFrame.tooltip:CreateFontString("NWBDmfDragTooltipFS", "ARTWORK");
	NWBDmfDragFrame.tooltip.fs:SetPoint("CENTER", 0, 0.5);
	NWBDmfDragFrame.tooltip.fs:SetFont(NWB.regionFont, 12);
	NWBDmfDragFrame.tooltip.fs:SetText(L["Hold to drag"]);
	NWBDmfDragFrame.tooltip:SetWidth(NWBDmfDragFrame.tooltip.fs:GetStringWidth() + 16);
	NWBDmfDragFrame.tooltip:SetHeight(NWBDmfDragFrame.tooltip.fs:GetStringHeight() + 10);
	NWBDmfDragFrame:SetScript("OnEnter", function(self)
		NWBDmfDragFrame.tooltip:Show();
	end)
	NWBDmfDragFrame:SetScript("OnLeave", function(self)
		NWBDmfDragFrame.tooltip:Hide();
	end)
	NWBDmfDragFrame.tooltip:Hide();
	NWBDmfDragFrame:SetScript("OnMouseDown", function(self, button)
		if (button == "LeftButton" and not self:GetParent().isMoving) then
			self:GetParent():StartMoving();
			self:GetParent().isMoving = true;
			--self:GetParent():SetUserPlaced(false);
		end
	end)
	NWBDmfDragFrame:SetScript("OnMouseUp", function(self, button)
		if (button == "LeftButton" and self:GetParent().isMoving) then
			self:GetParent():StopMovingOrSizing();
			self:GetParent().isMoving = false;
		end
	end)
	NWBDmfDragFrame:SetScript("OnHide", function(self)
		if (self:GetParent().isMoving) then
			self:GetParent():StopMovingOrSizing();
			self:GetParent().isMoving = false;
		end
	end)

	--Top right X close button.
	local NWBDmfFrameClose = CreateFrame("Button", "NWBDmfFrameFrameClose", NWBDmfFrame, "UIPanelCloseButton");
	NWBDmfFrameClose:SetPoint("TOPRIGHT", 0, 0);
	NWBDmfFrameClose:SetWidth(20);
	NWBDmfFrameClose:SetHeight(20);
	--NWBDmfFrameClose:SetFrameLevel(3);
	local clickedDmfFrameClose;
	NWBDmfFrameClose:SetScript("OnClick", function(self, arg)
		clickedDmfFrameClose = true;
		NWBDmfFrame:Hide();
		NWB:print("Closed DMF helper, to reopen it walk away from Sayge and back in again (This window can disabled in /nwb config).");
	end)
	--Adjust the X texture so it fits the entire frame and remove the empty clickable space around the close button.
	--Big thanks to Meorawr for this.
	NWBDmfFrameClose:GetNormalTexture():SetTexCoord(0.1875, 0.8125, 0.1875, 0.8125);
	NWBDmfFrameClose:GetHighlightTexture():SetTexCoord(0.1875, 0.8125, 0.1875, 0.8125);
	NWBDmfFrameClose:GetPushedTexture():SetTexCoord(0.1875, 0.8125, 0.1875, 0.8125);
	NWBDmfFrameClose:GetDisabledTexture():SetTexCoord(0.1875, 0.8125, 0.1875, 0.8125);

	--Start stuck button.
	local NWBDmfFrameStartStuckButton = CreateFrame("Button", "NWBDmfFrameStartStuckButton", NWBDmfFrame, "UIPanelButtonTemplate, SecureActionButtonTemplate");
	NWBDmfFrameStartStuckButton:SetAttribute("type", "macro");
	NWBDmfFrameStartStuckButton:SetAttribute("macrotext", "/click HelpFrameCharacterStuckStuck");
	--NWBDmfFrameStartStuckButton:SetPoint("Bottom", 0, 10);
	NWBDmfFrameStartStuckButton:SetPoint("BottomLeft", 3, 3);
	NWBDmfFrameStartStuckButton:SetWidth(120);
	NWBDmfFrameStartStuckButton:SetHeight(30);
	NWBDmfFrameStartStuckButton:SetText("Start Stuck");
	NWBDmfFrameStartStuckButton:SetNormalFontObject("GameFontNormal");
	local lastDmfStuckStartClick = 0;
	NWBDmfFrameStartStuckButton:SetScript("OnMouseDown", function(self, arg)
		lastDmfStuckStartClick = GetTime();
	end)
	NWBDmfFrameStartStuckButton.tooltip = CreateFrame("Frame", "NWBDmfFrameStartStuckButtonTooltip", NWBDmfFrameStartStuckButton, "TooltipBorderedFrameTemplate");
	NWBDmfFrameStartStuckButton.tooltip:SetPoint("CENTER", NWBDmfFrameStartStuckButton, "CENTER", 0, -50);
	NWBDmfFrameStartStuckButton.tooltip:SetFrameStrata("TOOLTIP");
	NWBDmfFrameStartStuckButton.tooltip:SetFrameLevel(140);
	NWBDmfFrameStartStuckButton.tooltip.fs = NWBDmfFrameStartStuckButton.tooltip:CreateFontString("NWBDmfFrameStartStuckButtonTooltipFS", "ARTWORK");
	NWBDmfFrameStartStuckButton.tooltip.fs:SetPoint("CENTER", 0, 0);
	NWBDmfFrameStartStuckButton.tooltip.fs:SetFont(NWB.regionFont, 12);
	NWBDmfFrameStartStuckButton.tooltip.fs:SetText("|CffDEDE42Start a |CFFFFA50010|CffDEDE42 second stuck timer\nwith auto resurrection.\nTarget Sayge and spam interact keybind.\n(This is the ingame Blizzard\nstuck helper with no logout)");
	NWBDmfFrameStartStuckButton.tooltip:SetWidth(NWBDmfFrameStartStuckButton.tooltip.fs:GetStringWidth() + 18);
	NWBDmfFrameStartStuckButton.tooltip:SetHeight(NWBDmfFrameStartStuckButton.tooltip.fs:GetStringHeight() + 12);
	NWBDmfFrameStartStuckButton:SetScript("OnEnter", function(self)
		NWBDmfFrameStartStuckButton.tooltip:Show();
	end)
	NWBDmfFrameStartStuckButton:SetScript("OnLeave", function(self)
		NWBDmfFrameStartStuckButton.tooltip:Hide();
	end)
	NWBDmfFrameStartStuckButton.tooltip:Hide();

	--Stop stuck button.
	local NWBDmfFrameStopStuckButton = CreateFrame("Button", "NWBDmfFrameStopStuckButton", NWBDmfFrame, "UIPanelButtonTemplate, SecureActionButtonTemplate");
	NWBDmfFrameStopStuckButton:SetAttribute("type", "macro");
	NWBDmfFrameStopStuckButton:SetAttribute("macrotext", "/stopcasting");
	NWBDmfFrameStopStuckButton:SetPoint("BottomLeft", 3, 3);
	NWBDmfFrameStopStuckButton:SetWidth(120);
	NWBDmfFrameStopStuckButton:SetHeight(30);
	NWBDmfFrameStopStuckButton:SetText("Cancel");
	NWBDmfFrameStopStuckButton:SetNormalFontObject("GameFontNormal");
	local lastDmfStuckStopClick = 0;
	NWBDmfFrameStopStuckButton:SetScript("OnMouseDown", function(self, arg)
		lastDmfStuckStopClick = GetTime();
	end)
	NWBDmfFrameStopStuckButton:Hide();

	--Start logout button.
	local NWBDmfFrameStartLogoutButton = CreateFrame("Button", "NWBDmfFrameStartLogoutButton", NWBDmfFrame, "UIPanelButtonTemplate, SecureActionButtonTemplate");
	NWBDmfFrameStartLogoutButton:SetAttribute("type", "macro");
	NWBDmfFrameStartLogoutButton:SetAttribute("macrotext", "/camp");
	NWBDmfFrameStartLogoutButton:SetPoint("BottomRight", -3, 3);
	NWBDmfFrameStartLogoutButton:SetWidth(120);
	NWBDmfFrameStartLogoutButton:SetHeight(30);
	--NWBDmfFrameStartLogoutButton:SetFrameLevel(130);
	NWBDmfFrameStartLogoutButton:SetText("Start Logout");
	NWBDmfFrameStartLogoutButton:SetNormalFontObject("GameFontNormal");
	local lastDmfLogoutStartClick = 0;
	NWBDmfFrameStartLogoutButton:SetScript("OnMouseDown", function(self, arg)
		lastDmfLogoutStartClick = GetTime();
	end)
	NWBDmfFrameStartLogoutButton.tooltip = CreateFrame("Frame", "NWBDmfFrameStartLogoutButtonTooltip", NWBDmfFrameStartLogoutButton, "TooltipBorderedFrameTemplate");
	NWBDmfFrameStartLogoutButton.tooltip:SetPoint("CENTER", NWBDmfFrameStartLogoutButton, "CENTER", 0, -50);
	NWBDmfFrameStartLogoutButton.tooltip:SetFrameStrata("TOOLTIP");
	NWBDmfFrameStartLogoutButton.tooltip:SetFrameLevel(140);
	NWBDmfFrameStartLogoutButton.tooltip.fs = NWBDmfFrameStartLogoutButton.tooltip:CreateFontString("NWBDmfFrameStartLogoutButtonTooltipFS", "ARTWORK");
	NWBDmfFrameStartLogoutButton.tooltip.fs:SetPoint("CENTER", 0, 0);
	NWBDmfFrameStartLogoutButton.tooltip.fs:SetFont(NWB.regionFont, 12);
	NWBDmfFrameStartLogoutButton.tooltip.fs:SetText("|CffDEDE42Start a |CFFFFA50020|CffDEDE42 second logout timer\nwith auto resurrection.\nTarget Sayge and spam interact keybind.\n(This requires using the website\nstuck helper while offline)");
	NWBDmfFrameStartLogoutButton.tooltip:SetWidth(NWBDmfFrameStartLogoutButton.tooltip.fs:GetStringWidth() + 18);
	NWBDmfFrameStartLogoutButton.tooltip:SetHeight(NWBDmfFrameStartLogoutButton.tooltip.fs:GetStringHeight() + 12);
	NWBDmfFrameStartLogoutButton:SetScript("OnEnter", function(self)
		NWBDmfFrameStartLogoutButton.tooltip:Show();
	end)
	NWBDmfFrameStartLogoutButton:SetScript("OnLeave", function(self)
		NWBDmfFrameStartLogoutButton.tooltip:Hide();
	end)
	NWBDmfFrameStartLogoutButton.tooltip:Hide();

	--Stop logout button.
	local NWBDmfFrameStopLogoutButton = CreateFrame("Button", "NWBDmfFrameStopLogoutButton", NWBDmfFrame, "UIPanelButtonTemplate, SecureActionButtonTemplate");
	local dmfStopLogoutMacro = [=[
	/run for i=1,STATICPOPUP_NUMDIALOGS do if _G["StaticPopup"..i].which=="CAMP" then _G["StaticPopup"..i.."Button1"]:Click() end end
	]=]
	NWBDmfFrameStopLogoutButton:SetAttribute("type", "macro");
	NWBDmfFrameStopLogoutButton:SetAttribute("macrotext", dmfStopLogoutMacro);
	NWBDmfFrameStopLogoutButton:SetPoint("BottomRight", -3, 3);
	NWBDmfFrameStopLogoutButton:SetWidth(120);
	NWBDmfFrameStopLogoutButton:SetHeight(30);
	--NWBDmfFrameStopLogoutButton:SetFrameLevel(141);
	NWBDmfFrameStopLogoutButton:SetText("Cancel");
	NWBDmfFrameStopLogoutButton:SetNormalFontObject("GameFontNormal");
	local lastDmfLogoutStopClick = 0;
	NWBDmfFrameStopLogoutButton:SetScript("OnMouseDown", function(self, arg)
		lastDmfLogoutStopClick = GetTime();
	end)
	NWBDmfFrameStopLogoutButton:Hide();

	--Interact keybind button.
	local NWBChangeInteractKeybindButton = CreateFrame("Button", "NWBChangeInteractKeybindButton", NWBDmfFrame, "UIPanelButtonTemplate");
	--NWBChangeInteractKeybindButton:SetPoint("TopLeft", 28, -85);
	NWBChangeInteractKeybindButton:SetPoint("TOP", 0, -95);
	NWBChangeInteractKeybindButton:SetWidth(120);
	NWBChangeInteractKeybindButton:SetHeight(20);
	NWBChangeInteractKeybindButton:SetText("Change Keybind");
	NWBChangeInteractKeybindButton:SetNormalFontObject("GameFontNormalSmall");
	--[[NWBChangeInteractKeybindButton:SetScript("OnClick", function(self, arg)
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION);
		KeyBindingFrame_LoadUI();
		KeyBindingFrame.mode = 1;
		ShowUIPanel(KeyBindingFrame);
		--Go to the targeting category.
		KeyBindingFrameCategoryListButton5:Click();
		KeyBindingFrameScrollFrame.ScrollBar:SetValue(999);
		for i = 1, 20 do
			local binding = _G["KeyBindingFrameKeyBinding" .. i];
			if (binding and binding.description
					and binding.description:GetText() == BINDING_NAME_INTERACTTARGET) then
				binding.description:SetText(BINDING_NAME_INTERACTTARGET .. "  |CFFFFFFFF<- HERE");
			end
		end
	end)]]
	NWBChangeInteractKeybindButton:SetScript("OnClick", function(self, arg)
		Settings.OpenToCategory(Settings.KEYBINDINGS_CATEGORY_ID);
		local children = {SettingsPanel.Container.SettingsList.ScrollBox.ScrollTarget:GetChildren()};
		for k, v in pairs(children) do
			if (v.Button and v.Button.Text and v.Button.Text:GetText() == BINDING_HEADER_TARGETING) then
				v.Button:Click();
				SettingsPanel.Container.SettingsList.ScrollBar:SetScrollPercentage(50);
			end
		end
	end)
	NWBChangeInteractKeybindButton.tooltip = CreateFrame("Frame", "NWBChangeInteractKeybindButtonTooltip", NWBChangeInteractKeybindButton, "TooltipBorderedFrameTemplate");
	NWBChangeInteractKeybindButton.tooltip:SetPoint("CENTER", NWBChangeInteractKeybindButton, "CENTER", 0, -40);
	NWBChangeInteractKeybindButton.tooltip:SetFrameStrata("TOOLTIP");
	NWBChangeInteractKeybindButton.tooltip:SetFrameLevel(140);
	NWBChangeInteractKeybindButton.tooltip.fs = NWBChangeInteractKeybindButton.tooltip:CreateFontString("NWBChangeInteractKeybindButtonTooltipFS", "ARTWORK");
	NWBChangeInteractKeybindButton.tooltip.fs:SetPoint("CENTER", 0, 0);
	NWBChangeInteractKeybindButton.tooltip.fs:SetFont(NWB.regionFont, 12);
	NWBChangeInteractKeybindButton.tooltip.fs:SetText("|CffDEDE42Opens the keybinds menu.\nKeybinds -> Targeting -> Interact With Target");
	NWBChangeInteractKeybindButton.tooltip:SetWidth(NWBChangeInteractKeybindButton.tooltip.fs:GetStringWidth() + 18);
	NWBChangeInteractKeybindButton.tooltip:SetHeight(NWBChangeInteractKeybindButton.tooltip.fs:GetStringHeight() + 12);
	NWBChangeInteractKeybindButton:SetScript("OnEnter", function(self)
		NWBChangeInteractKeybindButton.tooltip:Show();
	end)
	NWBChangeInteractKeybindButton:SetScript("OnLeave", function(self)
		NWBChangeInteractKeybindButton.tooltip:Hide();
	end)
	NWBChangeInteractKeybindButton.tooltip:Hide();

	function NWB:createDmfHelperButtons()
		if (not NWB.dmfChatCountdown) then
			NWB.dmfChatCountdown = CreateFrame("CheckButton", "NWBDMFChatCountdown", NWBDmfFrame, "ChatConfigCheckButtonTemplate");
			NWB.dmfChatCountdown:SetPoint("BOTTOMLEFT", 30, 120);
			NWBDMFChatCountdownText:SetText("Group Chat Countdown");
			NWB.dmfChatCountdown.tooltip = "Countdown the seconds left until resurrection in party/raid chat? This is for friends helping you by ressing first to take some hits.";
			--NWB.dmfChatCountdown:SetFrameStrata("HIGH");
			NWB.dmfChatCountdown:SetFrameLevel(132);
			NWB.dmfChatCountdown:SetWidth(24);
			NWB.dmfChatCountdown:SetHeight(24);
			NWB.dmfChatCountdown:SetChecked(NWB.db.global.dmfChatCountdown);
			NWB.dmfChatCountdown:SetScript("OnClick", function()
				local value = NWB.dmfChatCountdown:GetChecked();
				NWB.db.global.dmfChatCountdown = value;
			end)
			NWB.dmfChatCountdown:SetHitRectInsets(0, 0, -10, 7);
		end
		if (not NWB.dmfAutoResButton) then
			NWB.dmfAutoResButton = CreateFrame("CheckButton", "NWBDMFAutoResButton", NWBDmfFrame, "ChatConfigCheckButtonTemplate");
			NWB.dmfAutoResButton:SetPoint("BOTTOMLEFT", 30, 88);
			NWBDMFAutoResButtonText:SetText("Auto Resurrect");
			NWB.dmfAutoResButton.tooltip = "Auto accept resurrect right before you logout/stuck?\nSet how many seconds before the timer ends to res below.";
			--NWB.dmfAutoResButton:SetFrameStrata("HIGH");
			--NWB.dmfAutoResButton:SetFrameLevel(3);
			NWB.dmfAutoResButton:SetWidth(24);
			NWB.dmfAutoResButton:SetHeight(24);
			NWB.dmfAutoResButton:SetChecked(NWB.db.global.dmfAutoRes);
			NWB.dmfAutoResButton:SetScript("OnClick", function()
				local value = NWB.dmfAutoResButton:GetChecked();
				NWB.db.global.dmfAutoRes = value;
			end)
			NWB.dmfAutoResButton:SetHitRectInsets(0, 0, -10, 7);
		end
		if (not NWB.dmfAutoResSlider) then
			NWB.dmfAutoResSlider = CreateFrame("Slider", "NWBDMFAutoResSlider", NWBDmfFrame, "UISliderTemplate");
			--Slider template currently bugged, need to create some elements ourself.
			NWB.dmfAutoResSlider.High = NWB.dmfAutoResSlider:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			NWB.dmfAutoResSlider.High:SetPoint("TOPRIGHT", NWB.dmfAutoResSlider, "BOTTOMRIGHT");
			NWB.dmfAutoResSlider.Low = NWB.dmfAutoResSlider:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall");
			NWB.dmfAutoResSlider.Low:SetPoint("TOPLEFT", NWB.dmfAutoResSlider, "BOTTOMLEFT");
			NWB.dmfAutoResSlider.Text = NWB.dmfAutoResSlider:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
			NWB.dmfAutoResSlider.Text:SetPoint("BOTTOM", NWB.dmfAutoResSlider, "TOP");
			NWB.dmfAutoResSlider:SetPoint("BOTTOM", 0, 50);
			NWBDMFAutoResSlider.Text:SetText("Auto Resurrect Seconds Left");
			NWB.dmfAutoResSlider.tooltipText = "How many seconds left on logout/stuck will we auto resurrect at?";
			--NWB.dmfAutoResSlider:SetFrameStrata("HIGH");
			--NWB.dmfAutoResSlider:SetFrameLevel(5);
			NWB.dmfAutoResSlider:SetWidth(180);
			NWB.dmfAutoResSlider:SetHeight(16);
			NWB.dmfAutoResSlider:SetMinMaxValues(1, 5);
			NWB.dmfAutoResSlider:SetObeyStepOnDrag(true);
			NWB.dmfAutoResSlider:SetValueStep(0.5);
			NWB.dmfAutoResSlider:SetStepsPerPage(0.5);
			NWB.dmfAutoResSlider:SetValue(NWB.db.global.dmfAutoResTime);
			NWBDMFAutoResSlider.Low:SetText("1");
			NWBDMFAutoResSlider.High:SetText("5");
			NWBDMFAutoResSlider:HookScript("OnValueChanged", function(self, value)
				NWB.db.global.dmfAutoResTime = value;
				NWB.dmfAutoResSlider.editBox:SetText(value);
			end)
			--Some of this was taken from AceGUI.
			local function EditBox_OnEscapePressed(frame)
				frame:ClearFocus();
			end
			local function EditBox_OnEnterPressed(frame)
				local value = frame:GetText();
				value = tonumber(value);
				if value then
					PlaySound(856);
					NWB.db.global.dmfAutoResTime = value;
					NWB.dmfAutoResSlider:SetValue(value);
					frame:ClearFocus();
				else
					--If not a valid number reset the box.
					NWB.dmfAutoResSlider.editBox:SetText(NWB.db.global.dmfAutoResTime);
					frame:ClearFocus();
				end
			end
			local function EditBox_OnEnter(frame)
				frame:SetBackdropBorderColor(0.5, 0.5, 0.5, 1);
			end
			local function EditBox_OnLeave(frame)
				frame:SetBackdropBorderColor(0.3, 0.3, 0.3, 0.8);
			end
			local ManualBackdrop = {
				bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
				edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
				tile = true, edgeSize = 1, tileSize = 5,
			};
			NWB.dmfAutoResSlider.editBox = CreateFrame("EditBox", nil, NWB.dmfAutoResSlider, NWB:addBackdrop());
			NWB.dmfAutoResSlider.editBox:SetAutoFocus(false);
			NWB.dmfAutoResSlider.editBox:SetFontObject(GameFontHighlightSmall);
			NWB.dmfAutoResSlider.editBox:SetPoint("TOP", NWB.dmfAutoResSlider, "BOTTOM");
			NWB.dmfAutoResSlider.editBox:SetHeight(14);
			NWB.dmfAutoResSlider.editBox:SetWidth(40);
			NWB.dmfAutoResSlider.editBox:SetJustifyH("CENTER");
			NWB.dmfAutoResSlider.editBox:EnableMouse(true);
			NWB.dmfAutoResSlider.editBox:SetBackdrop(ManualBackdrop);
			NWB.dmfAutoResSlider.editBox:SetBackdropColor(0, 0, 0, 0.5);
			NWB.dmfAutoResSlider.editBox:SetBackdropBorderColor(0.3, 0.3, 0.30, 0.80);
			NWB.dmfAutoResSlider.editBox:SetScript("OnEnter", EditBox_OnEnter);
			NWB.dmfAutoResSlider.editBox:SetScript("OnLeave", EditBox_OnLeave);
			NWB.dmfAutoResSlider.editBox:SetScript("OnEnterPressed", EditBox_OnEnterPressed);
			NWB.dmfAutoResSlider.editBox:SetScript("OnEscapePressed", EditBox_OnEscapePressed);
			NWB.dmfAutoResSlider.editBox:SetText(NWB.db.global.dmfAutoResTime);
		end
	end

	NWBDmfFrame:SetScript("OnShow", function(self)
		NWB:updateInteractBindText();
		NWB:createDmfHelperButtons();
		NWBDmfFrameStartLogoutButton:Show();
		NWBDmfFrameStopLogoutButton:Hide();
		NWBDmfFrameStartStuckButton:Show();
		NWBDmfFrameStopStuckButton:Hide();
	end)

	local doDmfScan = false;
	local f = CreateFrame("Frame");
	local lastDmfPoisChange = 0;
	local lastDmfPoisZone;
	local scanCheckEnabled;
	local dmfStuckResTimer, dmfLogoutResTimer, dmfChatTimer;
	local dmfChatTickerCount = 0;
	f:RegisterEvent("PLAYER_ENTERING_WORLD");
	f:RegisterEvent("AREA_POIS_UPDATED");
	f:RegisterEvent("UNIT_SPELLCAST_START");
	f:RegisterEvent("UNIT_SPELLCAST_STOP");
	f:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED");
	f:RegisterEvent("PLAYER_CAMPING");
	f:RegisterEvent("UPDATE_BINDINGS");
	f:RegisterEvent("PLAYER_UNGHOST");
	f:SetScript("OnEvent", function(self, event, ...)
		if (event == "PLAYER_ENTERING_WORLD" or event == "AREA_POIS_UPDATED") then
			--Must use GetServerTime() and not GetTime() for logon or its unreliable.
			lastDmfPoisChange = GetServerTime();
			local subZone = GetSubZoneText();
			local _, _, zone = NWB:GetPlayerZonePosition();
			if (NWB.isDmfUp and NWB:verifyDmfZone() and not doDmfScan) then
				NWB:debug("Starting DMF scan.");
				doDmfScan = true;
				NWB:dmfPosTicker();
			elseif (doDmfScan and (not NWB.isDmfUp or not zone)) then
				doDmfScan = false;
			end
			lastDmfPoisZone = subZone;
		elseif (event == "UNIT_SPELLCAST_START") then
			local unit, _, spellID = ...;
			if (unit == "player" and spellID == 7355 and (GetTime() - lastDmfStuckStartClick) < 10) then
				if (UnitIsGhost("player")) then
					local stuckTime = 10;
					local duration = stuckTime - NWB.db.global.dmfAutoResTime;
					if (NWB.db.global.dmfAutoRes) then
						NWB:print("Target Sayge and spam press your Interact With Target keybind now, resurrection in " .. duration ..  " seconds.");
						dmfStuckResTimer = C_Timer.NewTimer(duration, function()
							RetrieveCorpse();
						end)
						dmfChatTickerCount = math.floor(duration);
						dmfChatTimer = C_Timer.NewTicker(1, function()
							NWB:dmfChatTicker();
						end, math.floor(duration))
						if (NWB.db.global.dmfChatCountdown) then
							NWB:dmfSendGroup("Starting resurrection countdown.");
						end
						dmfTimerBar = NWB:createTimerBar(NWBDmfFrame:GetWidth(), 30, duration, "Resurrection");
						dmfTimerBar:SetPoint("TOP", NWBDmfFrame, "BOTTOM", 0, 0);
						dmfTimerBar:SetFill(true);
						dmfTimerBar:SetColor(255, 165, 0);
						dmfTimerBar:Start();
						NWBDmfFrameStartStuckButton:Hide();
						NWBDmfFrameStopStuckButton:Show();
					else
						NWB:print("Stuck started (Auto resurrection disabled).");
					end
				else
					NWB:print("You must be a ghost to use this.");
				end
			end
		elseif (event == "UNIT_SPELLCAST_STOP") then
			local unit, _, spellID = ...;
			if (unit == "player" and spellID == 7355 and dmfStuckResTimer) then
				NWB:debug("cancelled res timer")
				if (dmfStuckResTimer._remainingIterations and dmfStuckResTimer._remainingIterations > 0) then
					if (NWB.db.global.dmfChatCountdown) then
						NWB:dmfSendGroup("Cancelled resurrection countdown.");
					else
						NWB:print("Cancelled resurrection countdown.");
					end
				end
				dmfStuckResTimer:Cancel();
				dmfChatTimer:Cancel();
				dmfLogoutResTimer = nil;
				dmfChatTimer = nil;
				if (dmfTimerBar) then
					dmfTimerBar:Stop();
					dmfTimerBar = nil;
				end
				NWBDmfFrameStartStuckButton:Show();
				NWBDmfFrameStopStuckButton:Hide();
			end
		elseif (event == "PLAYER_CAMPING") then
			if (GetTime() - lastDmfLogoutStartClick < 10) then
				if (UnitIsGhost("player")) then
					local logoutTime = 20;
					local duration = logoutTime - NWB.db.global.dmfAutoResTime;
					if (NWB.db.global.dmfAutoRes) then
						NWB:print("Target Sayge and spam press your Interact With Target keybind now, resurrection in " .. duration ..  " seconds.");
						dmfLogoutResTimer = C_Timer.NewTimer(duration, function()
							RetrieveCorpse();
						end)
						dmfChatTickerCount = math.floor(duration);
						dmfChatTimer = C_Timer.NewTicker(1, function()
							NWB:dmfChatTicker();
						end, math.floor(duration))
						if (NWB.db.global.dmfChatCountdown) then
							NWB:dmfSendGroup("Starting resurrection countdown.");
						end
						dmfTimerBar = NWB:createTimerBar(NWBDmfFrame:GetWidth(), 30, duration, "Resurrection");
						dmfTimerBar:SetPoint("TOP", NWBDmfFrame, "BOTTOM", 0, 0);
						dmfTimerBar:SetFill(true);
						dmfTimerBar:SetColor(255, 165, 0);
						dmfTimerBar:Start();
						NWBDmfFrameStartLogoutButton:Hide();
						NWBDmfFrameStopLogoutButton:Show();
						--NWBDmfFrameStartStuckButton:Hide();
						--NWBDmfFrameStopStuckButton:Show();
					else
						NWB:print("Logout started (Auto resurrection disabled).");
					end
				else
					NWB:print("You must be a ghost to use this.");
				end
			end
		elseif (event == "UPDATE_BINDINGS") then
			NWB:updateInteractBindText();
		elseif (event == "PLAYER_UNGHOST") then
			local _, _, zone = NWB:GetPlayerZonePosition();
			if (NWB:verifyDmfZone()) then
				NWBDmfFrameStartLogoutButton:Show();
				NWBDmfFrameStopLogoutButton:Hide();
				--NWBDmfFrameStartStuckButton:Show();
				--NWBDmfFrameStopStuckButton:Hide();
			end
		end
	end)

	function NWB:createTimerBar(width, height, duration, label)
		local bar = NWB.candyBar:New("Interface\\RaidFrame\\Raid-Bar-Hp-Fill", width, height);
		bar:SetLabel(label);
		bar:SetDuration(duration);
		return bar;
	end

	function NWB.cancelLogout()
		if (dmfLogoutResTimer) then
			dmfLogoutResTimer:Cancel();
			dmfChatTimer:Cancel();
			dmfLogoutResTimer = nil;
			dmfChatTimer = nil;
			NWBDmfFrameStartLogoutButton:Show();
			NWBDmfFrameStopLogoutButton:Hide();
			--NWBDmfFrameStartStuckButton:Show();
			--NWBDmfFrameStopStuckButton:Hide();
			if (NWB.db.global.dmfChatCountdown) then
				NWB:dmfSendGroup("Cancelled resurrection countdown.");
			else
				NWB:print("Cancelled resurrection countdown.");
			end
			if (dmfTimerBar) then
				dmfTimerBar:Stop();
				dmfTimerBar = nil;
			end
			NWBDmfFrameStopLogoutButton:Hide();
		end
	end

	hooksecurefunc("CancelLogout", NWB.cancelLogout);

	function NWB:dmfChatTicker(first)
		dmfChatTickerCount = dmfChatTickerCount - 1;
		if (NWB.db.global.dmfChatCountdown and NWB.db.global.dmfAutoRes) then
			if (dmfChatTickerCount == 10) then
				NWB:dmfSendGroup("Resurrection in 10 seconds.");
			elseif (dmfChatTickerCount == 5) then
				NWB:dmfSendGroup("Resurrection in 5 seconds.");
			elseif (dmfChatTickerCount == 4) then
				NWB:dmfSendGroup("Resurrection in 4 seconds.");
			elseif (dmfChatTickerCount == 3) then
				NWB:dmfSendGroup("Resurrection in 3 seconds.");
			elseif (dmfChatTickerCount == 2) then
				NWB:dmfSendGroup("Resurrection in 2 seconds.");
			elseif (dmfChatTickerCount == 1) then
				NWB:dmfSendGroup("Resurrection in 1 second.");
			elseif (dmfChatTickerCount == 0) then
				NWB:dmfSendGroup("Resurrecting Now!");
			end
		end
	end

	function NWB:dmfSendGroup(msg)
		if (IsInRaid()) then
			SendChatMessage(msg, "RAID");
		elseif (IsInGroup()) then
			SendChatMessage(msg, "PARTY");
		end
	end

	function NWB:verifyDmfZone()
		local _, _, zone = NWB:GetPlayerZonePosition();
		if ((zone == 1429 and NWB.faction == "Horde") or (zone == 1412 and NWB.faction == "Alliance")) then
			return true;
		end
	end

	function NWB:verifyDmfPos()
		--English only for starters while testing.
		--if (not LOCALE_enUS and not LOCALE_enGB) then
		--	return;
		--end
		if (not UnitIsGhost("player")) then
			return;
		end
		if (NWB.faction == "Horde") then
			local x, y, zone = NWB:GetPlayerZonePosition();
			--Only works within a square around Goldshire DMF.
			if (zone ~= 1429 or (y > 0.69853476638874 or y < 0.6824626793253
					or x > 0.42938295086608 or x < 0.41670588083958)) then
				return;
			end
		elseif (NWB.faction == "Alliance") then
			--Only works within a square around Mulgore DMF.
			local x, y, zone = NWB:GetPlayerZonePosition();
			if (zone ~= 1412 or (y > 0.394447705692 or y < 0.37847691674407
					or x > 0.37333657662182 or x < 0.36484996019735)) then
				return;
			end
		end
		return true;
	end

	function NWB:dmfPosTicker()
		if (not doDmfScan or not NWB:verifyDmfZone()) then
			NWB:debug("Stopping DMF scan.");
			NWB:disableDmfFrame();
			clickedDmfFrameClose = nil;
			return;
		end
		if (NWB:verifyDmfPos()) then
			NWB:enableDmfFrame();
		else
			NWB:disableDmfFrame();
		end
		C_Timer.After(1, function()
			NWB:dmfPosTicker();
		end)
	end

	SLASH_NWBDMFHELPERCMD1, SLASH_NWBDMFHELPERCMD2 = '/dmfhelper', '/stuckhelper';
	function SlashCmdList.NWBDMFHELPERCMD(msg, editBox)
		NWBDmfFrame:Show();
	end

	function NWB:enableDmfFrame()
		local pvpType = GetZonePVPInfo();
		if (not UnitIsGhost("player") or not NWB.db.global.dmfFrame or pvpType ~= "hostile") then
			return;
		end
		if (NWB.db.global.dmfFrame and not NWBDmfFrame:IsShown() and not clickedDmfFrameClose) then
			NWBDmfFrame:Show();
			NWB:debug("Showing DMF frame.");
		end
	end

	function NWB:disableDmfFrame()
		clickedDmfFrameClose = nil;
		if (NWBDmfFrame:IsShown()) then
			NWBDmfFrame:Hide();
			NWB:debug("Hiding DMF frame.");
		end
	end
end