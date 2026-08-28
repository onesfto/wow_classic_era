local _, addonTable = ...

addonTable.WorldMapData = addonTable.WorldMapData or {}
local WorldMapData = addonTable.WorldMapData

WorldMapData.reveal = WorldMapData.reveal or {}
WorldMapData.icons = WorldMapData.icons or {}
WorldMapData.levels = {
    [1411] = {minLevel = 1, maxLevel = 10, minFish = "1"},
    [1412] = {minLevel = 1, maxLevel = 10, minFish = "1"},
    [1413] = {minLevel = 10, maxLevel = 25, minFish = "1"},
    [1416] = {minLevel = 30, maxLevel = 40, minFish = "130"},
    [1417] = {minLevel = 30, maxLevel = 40, minFish = "130"},
    [1418] = {minLevel = 35, maxLevel = 45},
    [1419] = {minLevel = 45, maxLevel = 55},
    [1420] = {minLevel = 1, maxLevel = 10, minFish = "1"},
    [1421] = {minLevel = 10, maxLevel = 20, minFish = "1"},
    [1422] = {minLevel = 51, maxLevel = 58, minFish = "205"},
    [1423] = {minLevel = 53, maxLevel = 60, minFish = "330"},
    [1424] = {minLevel = 20, maxLevel = 30, minFish = "55"},
    [1425] = {minLevel = 40, maxLevel = 50, minFish = "205"},
    [1426] = {minLevel = 1, maxLevel = 10, minFish = "1"},
    [1427] = {minLevel = 43, maxLevel = 50},
    [1428] = {minLevel = 50, maxLevel = 58, minFish = "330"},
    [1429] = {minLevel = 1, maxLevel = 10, minFish = "1"},
    [1430] = {minLevel = 55, maxLevel = 60, minFish = "330"},
    [1431] = {minLevel = 18, maxLevel = 30, minFish = "55"},
    [1432] = {minLevel = 10, maxLevel = 20, minFish = "1"},
    [1433] = {minLevel = 15, maxLevel = 25, minFish = "55"},
    [1434] = {minLevel = 30, maxLevel = 45, minFish = "130 (205)"},
    [1435] = {minLevel = 35, maxLevel = 45, minFish = "130"},
    [1436] = {minLevel = 10, maxLevel = 20, minFish = "1"},
    [1437] = {minLevel = 20, maxLevel = 30, minFish = "130"},
    [1438] = {minLevel = 1, maxLevel = 10, minFish = "1"},
    [1439] = {minLevel = 10, maxLevel = 20, minFish = "1"},
    [1440] = {minLevel = 18, maxLevel = 30, minFish = "55"},
    [1441] = {minLevel = 25, maxLevel = 35, minFish = "130"},
    [1442] = {minLevel = 15, maxLevel = 27, minFish = "55"},
    [1443] = {minLevel = 30, maxLevel = 40, minFish = "130"},
    [1444] = {minLevel = 40, maxLevel = 50, minFish = "205 (330)"},
    [1445] = {minLevel = 35, maxLevel = 45, minFish = "130"},
    [1446] = {minLevel = 40, maxLevel = 50, minFish = "205"},
    [1447] = {minLevel = 45, maxLevel = 55, minFish = "205 (330)"},
    [1448] = {minLevel = 48, maxLevel = 55, minFish = "205"},
    [1449] = {minLevel = 48, maxLevel = 55, minFish = "205"},
    [1450] = {minFish = "205"},
    [1451] = {minLevel = 55, maxLevel = 60, minFish = "330"},
    [1452] = {minLevel = 55, maxLevel = 60, minFish = "330"},
}
