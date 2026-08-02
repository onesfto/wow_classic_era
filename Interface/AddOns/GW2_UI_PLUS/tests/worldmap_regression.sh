#!/bin/sh
set -eu

lua - <<'LUA'
local addon = {}
assert(loadfile("Modules/WorldMap/Settings.lua"))("GW2_UI_PLUS", addon)

local db = addon.WorldMap.GetDB()
assert(db.showExploration == true)
assert(db.showPoiDungeons == true)
assert(db.battlefieldEnabled == false)
assert(db.showCoordinates == true)
assert(db.centerOnPlayer == nil)
assert(db.rememberZoom == nil)
assert(db.increaseZoom == nil)
assert(db.groupIconSize == nil)
assert(db.battlefieldUnlocked == nil)

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
grep -F 'AreaLabelOnUpdate' Modules/WorldMap/Core.lua >/dev/null
if rg -q 'InstantPanAndZoom|ApplyCenterOnPlayer|increaseZoom|groupIconSize|playerArrowSize' Modules/WorldMap/Core.lua; then
    echo "世界地图仍包含未要求的地图行为"
    exit 1
fi
if rg -q 'showPlayers|SetMovable|SetResizable|CenterOnPlayer' Modules/WorldMap/Battlefield.lua; then
    echo "战场地图仍包含未要求的附加功能"
    exit 1
fi
grep -F 'frame.cursor' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'frame.player' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'C_Timer.NewTicker(0.2' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'frame:SetPoint("BOTTOMLEFT", WorldMapFrame.ScrollContainer, "BOTTOMLEFT", 0, 0)' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'frame:SetPoint("BOTTOMRIGHT", WorldMapFrame.ScrollContainer, "BOTTOMRIGHT", 0, 0)' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'frame.player:SetPoint("LEFT", frame, "LEFT", 6, 0)' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'frame.cursor:SetPoint("RIGHT", frame, "RIGHT", -6, 0)' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'pages and pages.hud_worldmap' Modules/WorldMap/Options.lua >/dev/null
grep -F 'panel:AddGroupHeader("地图坐标")' Modules/WorldMap/Options.lua >/dev/null
grep -F 'panel:AddGroupHeader("地图内容")' Modules/WorldMap/Options.lua >/dev/null
grep -F 'panel:AddOptionColorPicker("未探索区域颜色"' Modules/WorldMap/Options.lua >/dev/null
grep -F '"未探索区域透明度", "explorationTintAlpha"' Modules/WorldMap/Options.lua >/dev/null
grep -F '"副本入口", "showPoiDungeons"' Modules/WorldMap/Options.lua >/dev/null
grep -F '"区域中转点", "showPoiZoneCrossings"' Modules/WorldMap/Options.lua >/dev/null
grep -F '"队友职业颜色图标", "classIcons"' Modules/WorldMap/Options.lua >/dev/null
grep -F '"区域等级", "showZoneLevels"' Modules/WorldMap/Options.lua >/dev/null
grep -F '"钓鱼等级", "showFishingLevels"' Modules/WorldMap/Options.lua >/dev/null
grep -F '"隐藏城镇图标", "hideTownCityIcons"' Modules/WorldMap/Options.lua >/dev/null
grep -F 'SetRow(3, dungeon, spiritHealer, zoneCrossing)' Modules/WorldMap/Options.lua >/dev/null
grep -F 'SetRow(3, friendlyTravel, opposingTravel, classIcons)' Modules/WorldMap/Options.lua >/dev/null
grep -F 'SetRow(3, zoneLevels, fishingLevels, townIcons)' Modules/WorldMap/Options.lua >/dev/null
grep -F 'SetRow(2, explorationColor, explorationOpacity)' Modules/WorldMap/Options.lua >/dev/null
grep -F 'SetRow(2, autoChangeZones, stationaryOpacity)' Modules/WorldMap/Options.lua >/dev/null
grep -F 'SetRow(2, hoverCancelsFade, movingOpacity)' Modules/WorldMap/Options.lua >/dev/null
grep -F 'SetRow(2, battlefield, battlefieldSize)' Modules/WorldMap/Options.lua >/dev/null
grep -F 'SetRow(2, battlefieldOpacity, battlefieldZoom)' Modules/WorldMap/Options.lua >/dev/null
grep -F 'addonTable.ActionBarOptionsUtils.InitializePanel(panel)' Modules/WorldMap/Options.lua >/dev/null
grep -F 'colorPicker = {"Button", "GwOptionBoxColorPickerTmpl"}' Modules/ActionBar/Options_Utils.lua >/dev/null
grep -F 'RemoveNativeCoordinateOptions(panel)' Modules/WorldMap/Options.lua >/dev/null
grep -F 'WORLDMAP_COORDS_TOGGLE' Modules/WorldMap/Options.lua >/dev/null
if rg -q '未探索区域(红色|绿色|蓝色)' Modules/WorldMap/Options.lua; then
    echo "未探索区域颜色必须使用颜色选择器"
    exit 1
fi
grep -F 'panel:AddGroupHeader("地图行为")' Modules/WorldMap/Options.lua >/dev/null
grep -F 'panel:AddGroupHeader("战场地图")' Modules/WorldMap/Options.lua >/dev/null
if rg -q '自动居中玩家|记住地图内部缩放|提高最大缩放|最大缩放倍数|队伍和团队图标大小|玩家箭头大小|图标与坐标|允许移动和缩放|战场地图自动居中玩家|战场队友图标大小|战场玩家箭头大小' Modules/WorldMap/Options.lua; then
    echo "世界地图面板仍包含未要求的选项"
    exit 1
fi
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
