local _, addonTable = ...

local WorldMap = addonTable.WorldMap
if not WorldMap then return end

-- 与「组件 -> 工具栏」共用的固定分列布局：连续同列数选项严格同一行。
local function SetRow(columnCount, ...)
    for index = 1, select("#", ...) do
        local option = select(index, ...)
        if option then option.gwPlusColumns = columnCount end
    end
end

local nativeCoordinateOptions = {
    WORLDMAP_COORDS_TOGGLE = true,
    WORLDMAP_COORDS_POSITION = true,
    WORLDMAP_COORDS_X_OFFSET = true,
    WORLDMAP_COORDS_Y_OFFSET = true,
}

-- 本体地图坐标允许自由定位；本模块改为固定底部横排，因此移除旧设置组。
local function RemoveNativeCoordinateOptions(panel)
    local options = panel and panel.gwOptions
    if not options then return end
    for index = #options, 1, -1 do
        local option = options[index]
        if option and nativeCoordinateOptions[option.optionName] then
            table.remove(options, index)
            local header = options[index - 1]
            if header and header.optionType == "header" then
                table.remove(options, index - 1)
            end
        end
    end
end

local function AddToggle(panel, label, key, desc, dependence, master)
    local option = panel:AddOption(label, desc, {
        getter = function() return WorldMap.Get(key) end,
        setter = function(value) WorldMap.Set(key, value); WorldMap.Apply() end,
        getDefault = function() return WorldMap.defaults[key] end,
        dependence = dependence,
        isMasterToggle = master,
    })
    if option then option.optionName = "GW2PlusWorldMap_" .. key end
    return option
end

local function AddSlider(panel, label, key, low, high, step, desc, dependence)
    local option = panel:AddOptionSlider(label, desc, {
        min = low, max = high, step = step, decimalNumbers = step < 1 and 1 or 0,
        getter = function() return WorldMap.Get(key) end,
        setter = function(value) WorldMap.Set(key, value); WorldMap.Apply() end,
        getDefault = function() return WorldMap.defaults[key] end,
        dependence = dependence,
    })
    if option then option.optionName = "GW2PlusWorldMap_" .. key end
    return option
end

local function AddExplorationColorPicker(panel, dependence)
    local option = panel:AddOptionColorPicker("未探索区域颜色", nil, {
        getter = function()
            local tint = WorldMap.Get("explorationTint")
            return {r = tint[1], g = tint[2], b = tint[3]}
        end,
        setter = function(color)
            if type(color) ~= "table" then return end
            local tint = WorldMap.Get("explorationTint")
            tint[1] = math.max(0, math.min(1, tonumber(color.r) or tint[1]))
            tint[2] = math.max(0, math.min(1, tonumber(color.g) or tint[2]))
            tint[3] = math.max(0, math.min(1, tonumber(color.b) or tint[3]))
            WorldMap.Apply()
        end,
        getDefault = function()
            local tint = WorldMap.defaults.explorationTint
            return {r = tint[1], g = tint[2], b = tint[3]}
        end,
        dependence = dependence,
    })
    if option then option.optionName = "GW2PlusWorldMap_explorationTint" end
    return option
end

local function BuildWorldMapOptions(settingsTab)
    local GW = _G.GW2_ADDON
    local tab = settingsTab or (GW and GW.GetSettingsTabFrame
        and GW.GetSettingsTabFrame())
    local pages = tab and tab.gwPlusEmbeddedPanels
    local panel = pages and pages.hud_worldmap
    if not panel or panel.gwPlusWorldMapOptions then return false end
    panel.gwPlusWorldMapOptions = true
    RemoveNativeCoordinateOptions(panel)

    panel:AddGroupHeader("地图坐标")
    AddToggle(panel, "启用", "showCoordinates", "固定显示在地图内容区底部：左侧玩家坐标，右侧光标坐标。")

    panel:AddGroupHeader("地图内容")
    local dungeon = AddToggle(panel, "副本入口", "showPoiDungeons", nil)
    local spiritHealer = AddToggle(panel, "灵魂医者", "showPoiSpiritHealers", nil)
    local zoneCrossing = AddToggle(panel, "区域中转点", "showPoiZoneCrossings", nil)
    SetRow(3, dungeon, spiritHealer, zoneCrossing)
    local friendlyTravel = AddToggle(panel, "同阵营旅行点", "showPoiFriendlyTravel", "飞行点、船、飞艇和地铁。")
    local opposingTravel = AddToggle(panel, "对立阵营旅行点", "showPoiOpposingTravel", nil)
    local classIcons = AddToggle(panel, "队友职业颜色图标", "classIcons", nil)
    SetRow(3, friendlyTravel, opposingTravel, classIcons)
    local zoneLevels = AddToggle(panel, "区域等级", "showZoneLevels", nil)
    local fishingLevels = AddToggle(panel, "钓鱼等级", "showFishingLevels", nil)
    local townIcons = AddToggle(panel, "隐藏城镇图标", "hideTownCityIcons", nil)
    SetRow(3, zoneLevels, fishingLevels, townIcons)

    panel:AddGroupHeader("未探索区域")
    local exploration = AddToggle(panel, "启用", "showExploration", "显示尚未探索的地图区域。", nil, true)
    local explorationDependence = exploration and {[exploration.optionName] = true} or nil
    local explorationColor = AddExplorationColorPicker(panel, explorationDependence)
    local explorationOpacity = AddSlider(panel, "未探索区域透明度", "explorationTintAlpha", 0.1, 1, 0.1, nil, explorationDependence)
    SetRow(2, explorationColor, explorationOpacity)

    panel:AddGroupHeader("地图行为")
    local autoChangeZones = AddToggle(panel, "自动切换当前区域", "autoChangeZones", nil)
    local stationaryOpacity = AddSlider(panel, "站定透明度", "stationaryOpacity", 0.1, 1, 0.1)
    SetRow(2, autoChangeZones, stationaryOpacity)
    local hoverCancelsFade = AddToggle(panel, "悬停取消渐隐", "useStationaryOpacityOnHover", nil)
    local movingOpacity = AddSlider(panel, "移动透明度", "movingOpacity", 0.1, 1, 0.1)
    SetRow(2, hoverCancelsFade, movingOpacity)

    panel:AddGroupHeader("战场地图")
    local battlefield = AddToggle(panel, "启用", "battlefieldEnabled", nil, nil, true)
    local battleDependence = battlefield and {[battlefield.optionName] = true} or nil
    local battlefieldSize = AddSlider(panel, "尺寸", "battlefieldSize", 150, 1200, 1, nil, battleDependence)
    SetRow(2, battlefield, battlefieldSize)
    local battlefieldOpacity = AddSlider(panel, "透明度", "battlefieldOpacity", 0.1, 1, 0.1, nil, battleDependence)
    local battlefieldZoom = AddSlider(panel, "缩放", "battlefieldMaxZoom", 1, 6, 0.1, nil, battleDependence)
    SetRow(2, battlefieldOpacity, battlefieldZoom)
    if addonTable.ActionBarOptionsUtils then
        addonTable.ActionBarOptionsUtils.InitializePanel(panel)
    elseif GW.RefreshSettingsPanel then
        GW.RefreshSettingsPanel(panel)
    end
    return true
end

addonTable.BuildWorldMapOptions = BuildWorldMapOptions

local attempts = 0
local function WaitForPanel()
    if BuildWorldMapOptions() then return end
    attempts = attempts + 1
    if attempts < 30 then C_Timer.After(0.5, WaitForPanel) end
end

local events = CreateFrame("Frame")
events:RegisterEvent("PLAYER_LOGIN")
events:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    C_Timer.After(0, WaitForPanel)
end)
