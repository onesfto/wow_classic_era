local _, addonTable = ...

local WorldMap = addonTable.WorldMap
if not WorldMap then return end

WorldMap.Coordinates = WorldMap.Coordinates or {}
local Coordinates = WorldMap.Coordinates
local frame, ticker

local function Update()
    if not frame or not WorldMapFrame:IsShown() then return end
    local x, y = WorldMapFrame.ScrollContainer:GetNormalizedCursorPosition()
    if x and y and x >= 0 and y >= 0 then
        frame.cursor:SetFormattedText("%s: %.1f, %.1f", MOUSE_LABEL, x * 100, y * 100)
    else
        frame.cursor:SetFormattedText("%s:", MOUSE_LABEL)
    end
    local mapID = C_Map.GetBestMapForUnit("player")
    local position = mapID and C_Map.GetPlayerMapPosition(mapID, "player")
    if position and position.x ~= 0 and position.y ~= 0 then
        frame.player:SetFormattedText("%s: %.1f, %.1f", PLAYER, position.x * 100, position.y * 100)
    else
        frame.player:SetFormattedText("%s:", PLAYER)
    end
end

function Coordinates.Apply()
    if not frame then return end
    frame:SetShown(WorldMap.Get("showCoordinates"))
end

local function Initialize()
    if frame or not _G.WorldMapFrame then return end
    frame = CreateFrame("Frame", nil, WorldMapFrame.ScrollContainer, "BackdropTemplate")
    frame:SetPoint("BOTTOMLEFT", WorldMapFrame.ScrollContainer, "BOTTOMLEFT", 0, 0)
    frame:SetPoint("BOTTOMRIGHT", WorldMapFrame.ScrollContainer, "BOTTOMRIGHT", 0, 0)
    frame:SetHeight(20)
    frame:SetBackdrop({bgFile = "Interface\\ChatFrame\\ChatFrameBackground"})
    frame:SetBackdropColor(0, 0, 0, 0.55)
    frame.player = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    frame.player:SetPoint("LEFT", frame, "LEFT", 6, 0)
    frame.cursor = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    frame.cursor:SetPoint("RIGHT", frame, "RIGHT", -6, 0)
    WorldMapFrame:HookScript("OnShow", function()
        Coordinates.Apply()
        if WorldMap.Get("showCoordinates") and not ticker then ticker = C_Timer.NewTicker(0.2, Update) end
        Update()
    end)
    WorldMapFrame:HookScript("OnHide", function()
        if ticker then ticker:Cancel(); ticker = nil end
    end)
    Coordinates.Apply()
end

local events = CreateFrame("Frame")
events:RegisterEvent("PLAYER_LOGIN")
events:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    local GW = _G.GW2_ADDON
    if GW then GW.AddCoordsToWorldMap = function() end end
    Initialize()
end)
