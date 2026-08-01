local _, addonTable = ...

local WorldMap = addonTable.WorldMap
local WorldMapData = addonTable.WorldMapData
if not WorldMap or not WorldMapData then return end

local floor, ceil, max, min = math.floor, math.ceil, math.max, math.min
local explorationHooks = setmetatable({}, {__mode = "k"})
local poiProvider
local lastMapID, lastPlayerMapID
local rememberedZoom
local centerElapsed, zoomHooked = 0, false
local areaLabelScripts = setmetatable({}, {__mode = "k"})
local centerFrame = CreateFrame("Frame")

function WorldMap.ShouldShowPoi(pinInfo, db, faction)
    local kind = pinInfo and pinInfo[1]
    if kind == "Dungeon" or kind == "Raid" or kind == "Dunraid" then
        return db.showPoiDungeons
    elseif kind == "Spirit" then
        return db.showPoiSpiritHealers
    elseif kind == "Arrow" then
        return db.showPoiZoneCrossings
    elseif kind == "FlightN" or kind == "TravelN" then
        return db.showPoiFriendlyTravel or db.showPoiOpposingTravel
    elseif kind == "FlightA" or kind == "TravelA" then
        return faction == "Alliance" and db.showPoiFriendlyTravel
            or faction == "Horde" and db.showPoiOpposingTravel
    elseif kind == "FlightH" or kind == "TravelH" then
        return faction == "Horde" and db.showPoiFriendlyTravel
            or faction == "Alliance" and db.showPoiOpposingTravel
    end
    return false
end

local function GetLevelText(pinInfo)
    if not WorldMap.Get("showZoneLevels") or not pinInfo[7] then return pinInfo[4] end
    local playerLevel = UnitLevel("player")
    local color = playerLevel < pinInfo[7] and GetQuestDifficultyColor(pinInfo[7])
        or playerLevel > pinInfo[8] and GetQuestDifficultyColor(pinInfo[8] - 2)
        or QuestDifficultyColors.difficult
    return string.format("%s%s (%d-%d)|r", pinInfo[4], ConvertRGBtoColorString(color), pinInfo[7], pinInfo[8])
end

local function RefreshPoiProvider(self)
    self:GetMap():RemoveAllPinsByTemplate("GwPlusWorldMapPoiPinTemplate")
    local mapID = self:GetMap():GetMapID()
    local pins = WorldMapData.icons[mapID]
    if not pins then return end
    local faction = UnitFactionGroup("player")
    local db = WorldMap.GetDB()
    for _, pinInfo in ipairs(pins) do
        if WorldMap.ShouldShowPoi(pinInfo, db, faction) then
            self:GetMap():AcquirePin("GwPlusWorldMapPoiPinTemplate", {
                position = CreateVector2D(pinInfo[2] / 100, pinInfo[3] / 100),
                name = GetLevelText(pinInfo), description = pinInfo[5], atlasName = pinInfo[6],
                zoneCrossing = pinInfo[13], rotation = pinInfo[12], kind = pinInfo[1],
            })
        end
    end
end

_G.GwPlusWorldMapPoiPinMixin = BaseMapPoiPinMixin:CreateSubPin("PIN_FRAME_LEVEL_DUNGEON_ENTRANCE")
function _G.GwPlusWorldMapPoiPinMixin:OnAcquired(info)
    BaseMapPoiPinMixin.OnAcquired(self, info)
    self.zoneCrossing = info.zoneCrossing
    if info.rotation then self.Texture:SetRotation(info.rotation); self.HighlightTexture:SetRotation(info.rotation) end
end
function _G.GwPlusWorldMapPoiPinMixin:OnMouseUp(button)
    if button == "LeftButton" and self.zoneCrossing then WorldMapFrame:SetMapID(self.zoneCrossing)
    elseif button == "RightButton" then WorldMapFrame:NavigateToParentMap() end
end

local function MapExplorationPin_RefreshOverlays(pin, fullUpdate)
    if not WorldMap.Get("showExploration") then return end
    local mapID = pin:GetMap():GetMapID()
    local artID = mapID and C_Map.GetMapArtID(mapID)
    local reveal = artID and WorldMapData.reveal[artID]
    if not reveal then return end
    local explored = {}
    for _, info in ipairs(C_MapExplorationInfo.GetExploredMapTextures(mapID) or {}) do
        explored[info.textureWidth .. ":" .. info.textureHeight .. ":" .. info.offsetX .. ":" .. info.offsetY] = true
    end
    local layer = (C_Map.GetMapArtLayers(mapID) or {})[pin:GetMap():GetCanvasContainer():GetCurrentLayerIndex()]
    if not layer then return end
    local tint = WorldMap.Get("explorationTint")
    for key, files in pairs(reveal) do
        if not explored[key] then
            local width, height, x, y = strsplit(":", key)
            local texture = pin.overlayTexturePool:Acquire()
            texture:SetSize(tonumber(width), tonumber(height))
            texture:SetPoint("TOPLEFT", tonumber(x), -tonumber(y))
            texture:SetTexture(tonumber((strsplit(",", files))), nil, nil, "TRILINEAR")
            texture:SetVertexColor(tint[1], tint[2], tint[3], tint[4])
            texture:SetDrawLayer("ARTWORK", -1)
            texture:Show()
            if fullUpdate and pin.textureLoadGroup then pin.textureLoadGroup:AddTexture(texture) end
        end
    end
end

function WorldMap.ApplyExploration()
    if not _G.WorldMapFrame then return end
    for pin in WorldMapFrame:EnumeratePinsByTemplate("MapExplorationPinTemplate") do
        if not explorationHooks[pin] then
            hooksecurefunc(pin, "RefreshOverlays", MapExplorationPin_RefreshOverlays)
            explorationHooks[pin] = true
        end
        pin:RefreshOverlays(true)
    end
end

function WorldMap.ApplyPoi()
    if poiProvider then poiProvider:RefreshAllData() end
end

function WorldMap.ApplyAutoChangeZones()
    if not WorldMap.Get("autoChangeZones") or not _G.WorldMapFrame then return end
    local currentMap = WorldMapFrame:GetMapID()
    local currentPlayerMap = C_Map.GetBestMapForUnit("player")
    if currentMap == lastPlayerMapID and currentPlayerMap and C_Map.MapHasArt(currentPlayerMap) then
        WorldMapFrame:SetMapID(currentPlayerMap)
    end
    lastMapID, lastPlayerMapID = WorldMapFrame:GetMapID(), currentPlayerMap
end

function WorldMap.ApplyGroupIcons()
    if not _G.WorldMapFrame then return end
    for pin in WorldMapFrame:EnumeratePinsByTemplate("GroupMembersPinTemplate") do
        local provider = pin.dataProvider
        if provider then
            local sizes = provider:GetUnitPinSizesTable()
            sizes.party, sizes.raid, sizes.player = WorldMap.Get("groupIconSize"), WorldMap.Get("groupIconSize"), WorldMap.Get("playerArrowSize")
            pin:SetAppearanceField("party", "useClassColor", WorldMap.Get("classIcons"))
            pin:SetAppearanceField("raid", "useClassColor", WorldMap.Get("classIcons"))
            pin:SynchronizePinSizes()
        end
    end
end

function WorldMap.ApplyOpacity()
    if not _G.WorldMapFrame or not _G.PlayerMovementFrameFader then return end
    PlayerMovementFrameFader.AddDeferredFrame(WorldMapFrame, WorldMap.Get("movingOpacity"), WorldMap.Get("stationaryOpacity"), 0.5, function()
        return not WorldMapFrame:IsMouseOver() or not WorldMap.Get("useStationaryOpacityOnHover")
    end)
end

local function CenterMapOnPlayer(_, delta)
    if not WorldMap.Get("centerOnPlayer") or not WorldMapFrame:IsShown() then return end
    centerElapsed = centerElapsed + delta
    if centerElapsed < 2 or IsShiftKeyDown() or WorldMapFrame.ScrollContainer:IsPanning() then return end
    centerElapsed = 0
    local position = C_Map.GetPlayerMapPosition(WorldMapFrame:GetMapID(), "player")
    if position then WorldMapFrame.ScrollContainer:SetPanTarget(position.x, position.y) end
end

function WorldMap.ApplyCenterOnPlayer()
    centerFrame:SetScript("OnUpdate", CenterMapOnPlayer)
end

function WorldMap.ApplyZoom()
    if zoomHooked or not _G.WorldMapFrame then return end
    zoomHooked = true
    hooksecurefunc(WorldMapFrame.ScrollContainer, "CreateZoomLevels", function(container)
        if not WorldMap.Get("increaseZoom") or container.gwPlusZoomUpdating then return end
        container.gwPlusZoomUpdating = true
        local layers = C_Map.GetMapArtLayers(container.mapID)
        if layers then
            for _, layer in ipairs(layers) do layer.maxScale = layer.maxScale * WorldMap.Get("increaseZoomMax") end
            container:CreateZoomLevels()
        end
        container.gwPlusZoomUpdating = nil
    end)
    WorldMapFrame:HookScript("OnHide", function()
        if WorldMap.Get("rememberZoom") then
            rememberedZoom = {mapID = WorldMapFrame:GetMapID(), scale = WorldMapFrame.ScrollContainer:GetCanvasScale(), x = WorldMapFrame.ScrollContainer:GetNormalizedHorizontalScroll(), y = WorldMapFrame.ScrollContainer:GetNormalizedVerticalScroll()}
        end
    end)
    WorldMapFrame:HookScript("OnShow", function()
        if rememberedZoom and WorldMap.Get("rememberZoom") and rememberedZoom.mapID == WorldMapFrame:GetMapID() then
            C_Timer.After(0, function()
                WorldMapFrame.ScrollContainer:InstantPanAndZoom(rememberedZoom.scale, rememberedZoom.x, rememberedZoom.y)
                WorldMapFrame.ScrollContainer:SetPanTarget(rememberedZoom.x, rememberedZoom.y)
            end)
        end
    end)
end

hooksecurefunc(BaseMapPoiPinMixin, "OnAcquired", function(pin)
    if not WorldMap.Get("hideTownCityIcons") or not _G.WorldMapFrame then return end
    local mapID = WorldMapFrame:GetMapID()
    if mapID ~= 1414 and mapID ~= 1415 and mapID ~= 947 then return end
    local texture = pin.Texture
    if texture and texture:GetTexture() == 136441 then
        local left, top, right, bottom = texture:GetTexCoord()
        if (left == 0.5 or left == 0.625) and top == 0 and right == left and bottom == 0.125 then pin:Hide() end
    end
end)

local function AreaLabelOnUpdate(label)
    local map = label.dataProvider and label.dataProvider:GetMap()
    if not map or not map:IsCanvasMouseFocus() then return end
    local mapID = map:GetMapID()
    local x, y = map:GetNormalizedCursorPosition()
    local info = x and C_Map.GetMapInfoAtPosition(mapID, x, y)
    if not info or not WorldMap.Get("showZoneLevels") then return end
    local data = WorldMapData.levels[info.mapID]
    if not data then return end
    local name, description = info.name, nil
    if data.minLevel and data.maxLevel then name = string.format("%s (%d-%d)", name, data.minLevel, data.maxLevel) end
    if WorldMap.Get("showFishingLevels") and data.minFish then description = FISHING .. ": " .. data.minFish end
    label:SetLabel(MAP_AREA_LABEL_TYPE.AREA_NAME, name, description)
    label:EvaluateLabels()
end

function WorldMap.ApplyZoneLevels()
    if not _G.WorldMapFrame then return end
    for provider in next, WorldMapFrame.dataProviders do
        if provider.setAreaLabelCallback and provider.Label and not areaLabelScripts[provider.Label] then
            areaLabelScripts[provider.Label] = provider.Label:GetScript("OnUpdate")
            provider.Label:SetScript("OnUpdate", AreaLabelOnUpdate)
        end
    end
end

function WorldMap.Apply()
    WorldMap.ApplyExploration(); WorldMap.ApplyPoi(); WorldMap.ApplyGroupIcons(); WorldMap.ApplyOpacity(); WorldMap.ApplyCenterOnPlayer(); WorldMap.ApplyZoom(); WorldMap.ApplyZoneLevels()
    if WorldMap.Battlefield then WorldMap.Battlefield.Apply() end
    if WorldMap.Coordinates then WorldMap.Coordinates.Apply() end
end

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:RegisterEvent("ZONE_CHANGED")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventFrame:RegisterEvent("ZONE_CHANGED_INDOORS")
eventFrame:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_LOGIN" and _G.WorldMapFrame and not poiProvider then
        poiProvider = CreateFromMixins(MapCanvasDataProviderMixin)
        function poiProvider:RefreshAllData() RefreshPoiProvider(self) end
        WorldMapFrame:AddDataProvider(poiProvider)
        lastMapID, lastPlayerMapID = WorldMapFrame:GetMapID(), C_Map.GetBestMapForUnit("player")
        WorldMap.Apply()
    elseif event ~= "PLAYER_LOGIN" then WorldMap.ApplyAutoChangeZones() end
end)
