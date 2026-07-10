local _, ns = ...

local onesftoConfig = {
    ["core"] = {
        ["clamp"] = true,
        ["lock"] = false,
        ["northTag"] = false,
        ["shape"] = "Interface\\AddOns\\SexyMap\\shapes\\circle.tga",
        ["autoZoom"] = 5,
        ["rightClickToConfig"] = true,
    },
    ["coordinates"] = {
        ["enabled"] = false,
        ["fontColor"] = {},
        ["xOffset"] = 0,
        ["monochrome"] = false,
        ["updateRate"] = 1,
        ["yOffset"] = 10,
        ["font"] = "默认",
        ["borderColor"] = {},
        ["coordPrecision"] = "%d,%d",
        ["backgroundColor"] = {},
        ["outline"] = "NONE",
    },
    ["buttons"] = {
        ["radius"] = 10,
        ["lockDragging"] = false,
        ["allowDragging"] = true,
        ["visibilitySettings"] = {
            ["MinimapZoomIn"] = "never",
            ["MiniMapMailFrame"] = "always",
            ["GameTimeFrame"] = "hover",
            ["MiniMapWorldMapButton"] = "never",
            ["MinimapZoomOut"] = "never",
            ["GarrisonLandingPageMinimapButton"] = "always",
            ["MiniMapBattlefieldFrame"] = "always",
            ["MiniMapTracking"] = "hover",
            ["LFGMinimapFrame"] = "always",
            ["TimeManagerClockButton"] = "hover",
            ["SexyMapZoneTextButton"] = "always",
        },
        ["dragPositions"] = {},
        ["controlVisibility"] = true,
    },
    ["movers"] = {
        ["lockDurability"] = false,
        ["lockObjectives"] = false,
        ["moveDurability"] = false,
        ["lockCaptureBar"] = false,
        ["moveVehicle"] = false,
        ["lockVehicle"] = false,
        ["moverPositions"] = {},
        ["lockTopWidget"] = false,
        ["moveBuffs"] = false,
        ["moveTopWidget"] = false,
        ["lockBuffs"] = false,
        ["moveCaptureBar"] = false,
        ["moveObjectives"] = false,
    },
    ["clock"] = {
        ["bgColor"] = { ["a"] = 1, ["b"] = 0, ["g"] = 0, ["r"] = 0 },
        ["font"] = "默认",
        ["fontColor"] = {},
        ["borderColor"] = { ["a"] = 1, ["b"] = 0, ["g"] = 0, ["r"] = 0 },
        ["xOffset"] = 0,
        ["monochrome"] = false,
        ["outline"] = "NONE",
        ["yOffset"] = 0,
    },
    ["borders"] = {
        ["applyPreset"] = false,
        ["borders"] = {
            {
                ["name"] = "Rune 1",
                ["r"] = 0.3098039215686275,
                ["scale"] = 1.4,
                ["rotSpeed"] = -30,
                ["g"] = 0.4784313725490196,
                ["texture"] = 165630,
            },
            {
                ["a"] = 0.3799999952316284,
                ["rotSpeed"] = 60,
                ["r"] = 0.196078431372549,
                ["scale"] = 2.1,
                ["name"] = "Rune 2",
                ["g"] = 0.2901960784313725,
                ["texture"] = 165638,
            },
            {
                ["a"] = 0.3,
                ["name"] = "Fade",
                ["r"] = 0,
                ["scale"] = 1.6,
                ["g"] = 0.2235294117647059,
                ["texture"] = 167062,
            },
        },
        ["backdrop"] = {
            ["show"] = false,
            ["textureColor"] = {},
            ["settings"] = {
                ["bgFile"] = "Interface\\Tooltips\\UI-Tooltip-Background",
                ["edgeFile"] = "Interface\\Tooltips\\UI-Tooltip-Border",
                ["tile"] = false,
                ["edgeSize"] = 16,
                ["insets"] = {
                    ["top"] = 4,
                    ["right"] = 4,
                    ["left"] = 4,
                    ["bottom"] = 4,
                },
            },
            ["borderColor"] = {},
            ["scale"] = 1,
        },
        ["hideBlizzard"] = true,
    },
    ["zonetext"] = {
        ["outline"] = "NONE",
        ["fontColor"] = {},
        ["xOffset"] = 0,
        ["monochrome"] = false,
        ["yOffset"] = 0,
        ["bgColor"] = { ["a"] = 1, ["b"] = 0, ["g"] = 0, ["r"] = 0 },
        ["font"] = "默认",
        ["useSecureButton"] = false,
        ["borderColor"] = { ["a"] = 1, ["b"] = 0, ["g"] = 0, ["r"] = 0 },
    },
    ["ping"] = {
        ["showPing"] = true,
        ["showAt"] = "map",
    },
}

local function CopyTable(src, dest)
    for k, v in pairs(src) do
        if type(v) == "table" then
            dest[k] = type(dest[k]) == "table" and dest[k] or {}
            CopyTable(v, dest[k])
        else
            dest[k] = v
        end
    end
end

local function ApplySexyMapConfig()
    if SexyMap2DB then
        local myKey = UnitName("player") .. "-" .. GetRealmName()
        SexyMap2DB[myKey] = SexyMap2DB[myKey] or {}
        CopyTable(onesftoConfig, SexyMap2DB[myKey])
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, addon)
    if addon == "SexyMap" then
        ApplySexyMapConfig()
    end
end)

-- In case SexyMap loaded before Onesfto
if IsAddOnLoaded("SexyMap") then
    ApplySexyMapConfig()
end
