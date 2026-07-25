-------------------
---NovaWorldBuffs--
-------------------

--This is not the complete layering system, much of it is intergrated elsewhere in the addon.
--I've started moving some stuff here to keep track of things better and to work with the new multiple continents system.

local addonName, addon = ...;
local NWB = addon.a;

NWB.layerMapWhitelist2 = {
	[1411] = {
		name = "Durotar",
		id = 1,
	},
};
local function getContinentNum(mapID)

end