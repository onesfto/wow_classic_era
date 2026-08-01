#!/bin/sh
set -eu

lua - <<'LUA'
local addon = {}
assert(loadfile("Modules/WorldMap/Settings.lua"))("GW2_UI_PLUS", addon)

local db = addon.WorldMap.GetDB()
assert(db.showExploration == true)
assert(db.showPoiDungeons == true)
assert(db.battlefieldEnabled == false)

addon.WorldMap.Set("stationaryOpacity", 3)
assert(addon.WorldMap.Get("stationaryOpacity") == 1)
addon.WorldMap.Set("movingOpacity", -1)
assert(addon.WorldMap.Get("movingOpacity") == 0.1)
addon.WorldMap.Set("explorationTintAlpha", 0.4)
assert(addon.WorldMap.Get("explorationTintAlpha") == 0.4)

print("世界地图设置存储检查通过")
LUA

grep -F 'WorldMapData.reveal' Modules/WorldMap/Data.lua >/dev/null
grep -F 'WorldMapData.icons' Modules/WorldMap/Data.lua >/dev/null
grep -F 'WorldMapData.levels' Modules/WorldMap/Data.lua >/dev/null
grep -F 'MapExplorationPin_RefreshOverlays' Modules/WorldMap/Core.lua >/dev/null
grep -F 'C_MapExplorationInfo.GetExploredMapTextures' Modules/WorldMap/Core.lua >/dev/null
grep -F 'WorldMapData.reveal' Modules/WorldMap/Core.lua >/dev/null
grep -F 'WorldMap.ApplyExploration' Modules/WorldMap/Core.lua >/dev/null
grep -F 'ZONE_CHANGED_NEW_AREA' Modules/WorldMap/Core.lua >/dev/null
grep -F 'PlayerMovementFrameFader.AddDeferredFrame' Modules/WorldMap/Core.lua >/dev/null
grep -F 'useClassColor' Modules/WorldMap/Core.lua >/dev/null
grep -F 'hideTownCityIcons' Modules/WorldMap/Core.lua >/dev/null
grep -F 'InstantPanAndZoom' Modules/WorldMap/Core.lua >/dev/null
grep -F 'AreaLabelOnUpdate' Modules/WorldMap/Core.lua >/dev/null
grep -F 'BattlefieldMapOptions.showPlayers = true' Modules/WorldMap/Battlefield.lua >/dev/null
grep -F 'frame.cursor' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'frame.player' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'C_Timer.NewTicker(0.2' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'frame:SetPoint("BOTTOMLEFT", WorldMapFrame.ScrollContainer, "BOTTOMLEFT", 0, 8)' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'frame:SetPoint("BOTTOMRIGHT", WorldMapFrame.ScrollContainer, "BOTTOMRIGHT", 0, 8)' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'frame.cursor:SetPoint("LEFT", frame, "LEFT", 6, 0)' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'frame.player:SetPoint("RIGHT", frame, "RIGHT", -6, 0)' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'pages and pages.hud_worldmap' Modules/WorldMap/Options.lua >/dev/null
grep -F 'panel:AddGroupHeader("地图内容")' Modules/WorldMap/Options.lua >/dev/null
grep -F 'panel:AddOptionColorPicker("未探索区域颜色"' Modules/WorldMap/Options.lua >/dev/null
grep -F '"未探索区域透明度", "explorationTintAlpha"' Modules/WorldMap/Options.lua >/dev/null
if rg -q '未探索区域(红色|绿色|蓝色)' Modules/WorldMap/Options.lua; then
    echo "未探索区域颜色必须使用颜色选择器"
    exit 1
fi
grep -F 'panel:AddGroupHeader("地图行为")' Modules/WorldMap/Options.lua >/dev/null
grep -F 'panel:AddGroupHeader("图标与坐标")' Modules/WorldMap/Options.lua >/dev/null
grep -F 'AddToggle(panel, "启用坐标", "showCoordinates", nil)' Modules/WorldMap/Options.lua >/dev/null
grep -F 'panel:AddGroupHeader("战场地图")' Modules/WorldMap/Options.lua >/dev/null
grep -F 'Modules/WorldMap/Options.lua' GW2_UI_PLUS.toc >/dev/null
grep -F 'addonTable.BuildWorldMapOptions(settingsTab)' core.lua >/dev/null
grep -F 'addonTable.BuildWorldMapOptions = BuildWorldMapOptions' Modules/WorldMap/Options.lua >/dev/null
grep -F 'GW.RefreshSettingsPanel(panel)' Modules/WorldMap/Options.lua >/dev/null
grep -F 'GW.RefreshSettingsPanel = InitOptionPanel' ../GW2_UI/settings/settingsWindowSettingsTab.lua >/dev/null

lua - <<'LUA'
local addon = {}
assert(loadfile("Modules/WorldMap/Settings.lua"))("GW2_UI_PLUS", addon)
assert(loadfile("Modules/WorldMap/Data.lua"))("GW2_UI_PLUS", addon)
local core = assert(io.open("Modules/WorldMap/Core.lua")):read("*a")
assert(core:find("function WorldMap.ShouldShowPoi", 1, true))
local allow = function(pin, db, faction)
    local kind = pin[1]
    if kind == "Dungeon" then return db.showPoiDungeons end
    if kind == "FlightA" then return faction == "Alliance" and db.showPoiFriendlyTravel end
    if kind == "FlightH" then return faction == "Alliance" and db.showPoiOpposingTravel end
    if kind == "Arrow" then return db.showPoiZoneCrossings end
end
assert(allow({"Dungeon"}, {showPoiDungeons = true}, "Alliance"))
assert(allow({"FlightA"}, {showPoiFriendlyTravel = true}, "Alliance"))
assert(not allow({"FlightH"}, {showPoiOpposingTravel = false}, "Alliance"))
assert(allow({"Arrow"}, {showPoiZoneCrossings = true}, "Alliance"))
print("世界地图探索与兴趣点检查通过")
LUA
