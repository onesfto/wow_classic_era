local unpackValues = table.unpack or unpack
unpack = unpack or table.unpack
local createdFrames = {}
local moversByName = {}

local function NewRegion()
    local region = {
        shown = true,
        alpha = 1,
        points = {},
    }
    function region:SetTexture(value) self.texture = value end
    function region:SetAtlas(value) self.atlas = value end
    function region:SetTexCoord(...) self.texCoord = {...} end
    function region:SetDesaturated(value) self.desaturated = value end
    function region:SetAlpha(value) self.alpha = value end
    function region:SetShown(value) self.shown = value end
    function region:Show() self.shown = true end
    function region:Hide() self.shown = false end
    function region:ClearAllPoints() self.points = {} end
    function region:SetPoint(...) self.points[#self.points + 1] = {...} end
    function region:SetAllPoints() end
    function region:SetSize(width, height)
        self.width, self.height = width, height
    end
    function region:SetWidth(width) self.width = width end
    function region:SetFont(...) self.font = {...} end
    function region:SetText(value) self.text = value end
    function region:SetTextColor(...) self.textColor = {...} end
    function region:SetJustifyH(value) self.justifyH = value end
    return region
end

local function NewFrame(name, parent)
    local frame = {
        name = name,
        parent = parent,
        children = {},
        events = {},
        scripts = {},
        points = {},
        attributes = {},
        shown = true,
        enabled = true,
        width = 1,
        height = 1,
        scale = 1,
        level = 1,
    }
    function frame:GetName() return self.name end
    function frame:GetParent() return self.parent end
    function frame:SetParent(value) self.parent = value end
    function frame:SetSize(width, height)
        self.width, self.height = width, height
    end
    function frame:GetSize() return self.width, self.height end
    function frame:SetWidth(width) self.width = width end
    function frame:SetHeight(height) self.height = height end
    function frame:GetWidth() return self.width end
    function frame:GetHeight() return self.height end
    function frame:SetScale(scale) self.scale = scale end
    function frame:GetScale() return self.scale end
    function frame:SetFrameStrata(value) self.strata = value end
    function frame:GetFrameLevel() return self.level end
    function frame:SetFrameLevel(value) self.level = value end
    function frame:ClearAllPoints() self.points = {} end
    function frame:SetPoint(...)
        self.points[#self.points + 1] = {...}
    end
    function frame:GetPoint(index)
        return unpackValues(self.points[index or 1] or {})
    end
    function frame:Show() self.shown = true end
    function frame:Hide() self.shown = false end
    function frame:SetShown(value) self.shown = value == true end
    function frame:IsShown() return self.shown end
    function frame:SetEnabled(value) self.enabled = value == true end
    function frame:IsEnabled() return self.enabled end
    function frame:SetAlpha(value) self.alpha = value end
    function frame:RegisterForClicks() end
    function frame:RegisterEvent(event) self.events[event] = true end
    function frame:UnregisterEvent(event) self.events[event] = nil end
    function frame:UnregisterAllEvents() self.events = {} end
    function frame:SetScript(script, callback)
        self.scripts[script] = callback
    end
    function frame:HookScript(script, callback)
        self.scripts[script] = callback
    end
    function frame:SetAttribute(key, value) self.attributes[key] = value end
    function frame:GetAttribute(key) return self.attributes[key] end
    function frame:SetFrameRef(key, value) self[key] = value end
    function frame:SetBackdrop(value) self.backdrop = value end
    function frame:SetBackdropColor(...) self.backdropColor = {...} end
    function frame:SetBackdropBorderColor(...)
        self.backdropBorderColor = {...}
    end
    function frame:CreateTexture()
        local texture = NewRegion()
        self.children[#self.children + 1] = texture
        return texture
    end
    function frame:CreateFontString()
        local text = NewRegion()
        self.children[#self.children + 1] = text
        return text
    end

    if name then _G[name] = frame end
    createdFrames[#createdFrames + 1] = frame
    return frame
end

UIParent = NewFrame("UIParent")
GameTooltip = {
    SetOwner = function() end,
    SetText = function() end,
    AddLine = function() end,
    Show = function() end,
    Hide = function() end,
}
UNIT_NAME_FONT = "Fonts/FRIZQT__.TTF"
GW2_UI_PLUS_SV = nil

function CreateFrame(_, name, parent)
    return NewFrame(name, parent)
end
function hooksecurefunc() end
function RegisterStateDriver() end
function UnregisterStateDriver() end
function InCombatLockdown() return false end
function UnitExists() return false end
function IsInGroup() return false end
function IsInRaid() return false end
function UnitIsGroupLeader() return false end
function UnitIsGroupAssistant() return false end
function GetServerTime() return 1000 end
function GetFramerate() return 60 end
function GetNetStats() return 0, 0, 30, 40 end
function GameTime_GetLocalTime() return "12:00" end
function SetCVar() end

GW2_ADDON = {
    settings = {},
    globalDefault = {profile = {}},
    MOVABLE_FRAMES = {},
    CopyTable = function(source)
        local target = {}
        for key, value in pairs(source) do
            if type(value) == "table" then
                target[key] = GW2_ADDON.CopyTable(value)
            else
                target[key] = value
            end
        end
        return target
    end,
    RegisterMovableFrame = function(frame, displayName, settingName)
        local mover = NewFrame("Mover_" .. settingName, UIParent)
        mover.enable = true
        mover.savedPoint = GW2_ADDON.settings[settingName]
        frame.gwMover = mover
        GW2_ADDON.MOVABLE_FRAMES[#GW2_ADDON.MOVABLE_FRAMES + 1] = mover
        moversByName[displayName] = mover
    end,
    ToggleMover = function(mover, enabled)
        mover.enable = enabled == true
    end,
    CreateRaidControlFrame = function()
        if _G.GwManageGroupButton then return end
        local button = NewFrame("GwManageGroupButton", UIParent)
        button.fadeOut = function() end
        button.fadeIn = function() end
        NewFrame("GwGroupManage", UIParent)
    end,
    globalSettings = {
        RegisterCallback = function() end,
    },
}

local addonTable = {}
for _, path in ipairs({
    "Toolbar/Core.lua",
    "Toolbar/GroupManage.lua",
    "Toolbar/QuickBar.lua",
    "Toolbar/MarkerBar.lua",
    "Toolbar/PerformanceBar.lua",
}) do
    assert(loadfile(path))("GW2_UI_PLUS", addonTable)
end

local function FireEvent(event)
    local snapshot = {}
    for index, frame in ipairs(createdFrames) do snapshot[index] = frame end
    for _, frame in ipairs(snapshot) do
        if frame.events[event] and frame.scripts.OnEvent then
            frame.scripts.OnEvent(frame, event)
        end
    end
end

FireEvent("PLAYER_LOGIN")
FireEvent("PLAYER_ENTERING_WORLD")

local Toolbar = assert(addonTable.Toolbar)
for _, moduleKey in ipairs({
    "groupManage", "quickBar", "markerBar", "performanceBar",
}) do
    local module = assert(Toolbar[moduleKey], "模块未加载：" .. moduleKey)
    assert(module.frame, "运行框未创建：" .. moduleKey)
    assert(module.frame.gwMover, "mover 未注册：" .. moduleKey)
    assert(module.frame.gwMover.enable == true,
        "关闭功能时 mover 仍须出现在编辑界面：" .. moduleKey)
end

for _, name in ipairs({"队伍管理", "快捷条", "标记条", "性能条"}) do
    assert(moversByName[name], "编辑界面缺少：" .. name)
end
assert(#GW2_ADDON.MOVABLE_FRAMES == 4,
    "四个功能应各注册一个且只注册一个 mover")

Toolbar.markerBar.SetEnabled(true)
assert(Toolbar.markerBar.frame:IsShown(),
    "标记条启用后即使没有目标也必须显示")
Toolbar.performanceBar.SetEnabled(true)
assert(Toolbar.performanceBar.frame:IsShown(),
    "性能条启用后必须显示")

local performancePoint =
    GW2_ADDON.settings.GW2PlusToolbarPerformanceBarPos
assert(performancePoint.xOfs == -260,
    "性能条默认位置必须避开右上角小地图")

print("ToolbarBehavior_test: OK")
