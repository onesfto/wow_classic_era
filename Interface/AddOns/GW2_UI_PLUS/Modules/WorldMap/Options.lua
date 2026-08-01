local _, addonTable = ...

local WorldMap = addonTable.WorldMap
if not WorldMap then return end

local function AddToggle(panel, label, key, desc, dependence, master)
    local option = panel:AddOption(label, desc, {
        getter = function() return WorldMap.Get(key) end,
        setter = function(value) WorldMap.Set(key, value); WorldMap.Apply() end,
        getDefault = function() return WorldMap.defaults[key] end,
        dependence = dependence,
        isMasterToggle = master,
    })
    if option then option.optionName = "GW2PlusWorldMap_" .. key end
    return option and option.optionName
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
end

local function BuildWorldMapOptions(settingsTab)
    local GW = _G.GW2_ADDON
    local tab = settingsTab or (GW and GW.GetSettingsTabFrame
        and GW.GetSettingsTabFrame())
    local pages = tab and tab.gwPlusEmbeddedPanels
    local panel = pages and pages.hud_worldmap
    if not panel or panel.gwPlusWorldMapOptions then return false end
    panel.gwPlusWorldMapOptions = true

    panel:AddGroupHeader("地图内容")
    local exploration = AddToggle(panel, "未探索区域", "showExploration", "显示尚未探索的地图区域。", nil, true)
    local explorationDependence = {[exploration] = true}
    AddExplorationColorPicker(panel, explorationDependence)
    AddSlider(panel, "未探索区域透明度", "explorationTintAlpha", 0.1, 1, 0.1, nil, explorationDependence)
    AddToggle(panel, "副本和团队入口", "showPoiDungeons", nil)
    AddToggle(panel, "同阵营交通点", "showPoiFriendlyTravel", "飞行点、船、飞艇和地铁。")
    AddToggle(panel, "敌对阵营交通点", "showPoiOpposingTravel", nil)
    AddToggle(panel, "灵魂医者", "showPoiSpiritHealers", nil)
    AddToggle(panel, "区域出口箭头", "showPoiZoneCrossings", nil)
    AddToggle(panel, "显示区域和副本等级", "showZoneLevels", nil)
    AddToggle(panel, "显示最低钓鱼技能", "showFishingLevels", nil)
    AddToggle(panel, "隐藏大陆城镇和城市图标", "hideTownCityIcons", nil)

    panel:AddGroupHeader("地图行为")
    AddToggle(panel, "自动切换当前区域", "autoChangeZones", nil)
    AddToggle(panel, "自动居中玩家", "centerOnPlayer", nil)
    AddToggle(panel, "记住地图内部缩放", "rememberZoom", nil)
    local increaseZoom = AddToggle(panel, "提高最大缩放", "increaseZoom", nil, nil, true)
    AddSlider(panel, "最大缩放倍数", "increaseZoomMax", 1, 6, 0.1, nil, {[increaseZoom] = true})
    AddSlider(panel, "静止时透明度", "stationaryOpacity", 0.1, 1, 0.1)
    AddSlider(panel, "移动时透明度", "movingOpacity", 0.1, 1, 0.1)
    AddToggle(panel, "鼠标悬停保持静止透明度", "useStationaryOpacityOnHover", nil)

    panel:AddGroupHeader("图标与坐标")
    AddToggle(panel, "队伍和团队图标职业染色", "classIcons", nil)
    AddSlider(panel, "队伍和团队图标大小", "groupIconSize", 12, 80, 1)
    AddSlider(panel, "玩家箭头大小", "playerArrowSize", 12, 80, 1)
    AddToggle(panel, "启用坐标", "showCoordinates", nil)

    panel:AddGroupHeader("战场地图")
    local battlefield = AddToggle(panel, "启用战场地图增强", "battlefieldEnabled", nil, nil, true)
    local battleDependence = {[battlefield] = true}
    AddToggle(panel, "允许移动和缩放", "battlefieldUnlocked", nil, battleDependence)
    AddSlider(panel, "战场地图尺寸", "battlefieldSize", 150, 1200, 1, nil, battleDependence)
    AddSlider(panel, "战场地图透明度", "battlefieldOpacity", 0.1, 1, 0.1, nil, battleDependence)
    AddSlider(panel, "战场地图最大缩放", "battlefieldMaxZoom", 1, 6, 0.1, nil, battleDependence)
    AddToggle(panel, "战场地图自动居中玩家", "battlefieldCenterOnPlayer", nil, battleDependence)
    AddSlider(panel, "战场队友图标大小", "battlefieldGroupIconSize", 12, 80, 1, nil, battleDependence)
    AddSlider(panel, "战场玩家箭头大小", "battlefieldPlayerArrowSize", 12, 80, 1, nil, battleDependence)
    if GW.RefreshSettingsPanel then
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
