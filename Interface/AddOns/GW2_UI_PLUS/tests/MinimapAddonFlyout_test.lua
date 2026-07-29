local createdFrames = {}
local createdToggleCount = 0
local unpackValues = table.unpack or unpack

local function RemoveChild(parent, child)
    if not parent or not parent.children then return end
    for index = #parent.children, 1, -1 do
        if parent.children[index] == child then
            table.remove(parent.children, index)
        end
    end
end

local function NewTexture()
    return {
        alpha = 1,
        SetAlpha = function(self, value) self.alpha = value end,
    }
end

local function NewFrame(name, parent, width, objectType)
    local frame = {
        name = name,
        parent = nil,
        children = {},
        events = {},
        scripts = {},
        hooks = {},
        points = {},
        width = width or 25,
        height = width or 25,
        scale = 1,
        strata = "MEDIUM",
        level = 1,
        shown = true,
        mouseEnabled = true,
        objectType = objectType or "Button",
        normalTexture = NewTexture(),
        highlightTexture = NewTexture(),
        pushedTexture = NewTexture(),
    }

    function frame:GetName() return self.name end
    function frame:GetParent() return self.parent end
    function frame:SetParent(value)
        RemoveChild(self.parent, self)
        self.parent = value
        if value and value.children then
            value.children[#value.children + 1] = self
        end
    end
    function frame:GetChildren() return unpackValues(self.children) end
    function frame:GetWidth() return self.width end
    function frame:GetHeight() return self.height end
    function frame:SetWidth(value) self.width = value end
    function frame:SetSize(widthValue, heightValue)
        self.width = widthValue
        self.height = heightValue
    end
    function frame:GetScale() return self.scale end
    function frame:SetScale(value) self.scale = value end
    function frame:GetFrameStrata() return self.strata end
    function frame:SetFrameStrata(value) self.strata = value end
    function frame:GetFrameLevel() return self.level end
    function frame:SetFrameLevel(value) self.level = value end
    function frame:IsObjectType(value)
        return value == self.objectType
            or (self.objectType == "Button" and value == "Frame")
    end
    function frame:GetNumRegions() return 0 end
    function frame:GetNumPoints() return #self.points end
    function frame:GetPoint(index)
        return unpackValues(self.points[index or 1])
    end
    function frame:ClearAllPoints() self.points = {} end
    function frame:SetPoint(...)
        self.points[#self.points + 1] = {...}
    end
    function frame:RegisterEvent(event) self.events[event] = true end
    function frame:UnregisterEvent(event) self.events[event] = nil end
    function frame:SetScript(script, handler) self.scripts[script] = handler end
    function frame:HookScript(script, handler)
        self.hooks[script] = handler
    end
    function frame:HasScript(script)
        return self.scripts[script] ~= nil
    end
    function frame:Show() self.shown = true end
    function frame:Hide() self.shown = false end
    function frame:IsShown() return self.shown end
    function frame:EnableMouse(value) self.mouseEnabled = value end
    function frame:GetNormalTexture() return self.normalTexture end
    function frame:GetHighlightTexture() return self.highlightTexture end
    function frame:GetPushedTexture() return self.pushedTexture end
    function frame:GwCreateBackdrop() self.hasBackdrop = true end

    frame:SetParent(parent)
    if name then _G[name] = frame end
    return frame
end

GW2_UI_PLUS_SV = nil
UIParent = NewFrame("UIParent", nil, 1, "Frame")
Minimap = NewFrame("Minimap", UIParent, 140, "Frame")
Minimap:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -20, -20)

local addonButton = NewFrame("LibDBIcon10_Test", Minimap, 32, "Button")
addonButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 4, -4)
local originalPoint, originalRelativeTo, originalRelativePoint,
    originalX, originalY = addonButton:GetPoint(1)

local trackingButton =
    NewFrame("MiniMapTracking", Minimap, 32, "Button")
trackingButton:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 0, 0)

local petBattle = false
local scheduledDelays = {}
C_Timer = {
    After = function(delay, callback)
        scheduledDelays[#scheduledDelays + 1] = delay
        callback()
    end,
}
C_PetBattles = {IsInBattle = function() return petBattle end}
function InCombatLockdown() return false end
function UIFrameFadeIn(frame) frame:Show() end
function UIFrameFadeOut(frame) frame:Hide() end

GW2_ADDON = {
    settings = {MINIMAP_ENABLED = false},
    BackdropTemplates = {DefaultWithSmallBorder = {}},
    NoOp = function() end,
}

function CreateFrame(objectType, name, parent, template)
    local frame = NewFrame(name, parent, nil, objectType)
    if template == "GwAddonToggle" then
        createdToggleCount = createdToggleCount + 1
        frame.container = NewFrame(nil, frame, 35, "Frame")
        frame.container:Hide()
    end
    createdFrames[#createdFrames + 1] = frame
    return frame
end

local addonTable = {}
assert(loadfile("Minimap/AddonFlyout.lua"))(
    "GW2_UI_PLUS", addonTable)

local Flyout = assert(addonTable.MinimapAddonFlyout,
    "应导出独立插件悬浮按钮模块")
local driverFrame = assert(createdFrames[1],
    "模块应创建事件驱动框")
local db = Flyout.InitDB()
assert(db.minimapAddonFlyoutEnabled == true,
    "插件悬浮按钮首次应默认开启")
assert(Flyout.IsEnabled() == true,
    "默认保存值应启用插件悬浮按钮")

GW2_ADDON.settings.MINIMAP_ENABLED = true
assert(Flyout.IsEnabled() == true,
    "插件悬浮按钮不得依赖 GW2_UI 小地图开关")
assert(type(GW2_ADDON.CreateMinimapButtonsSack) == "function",
    "应接管 GW2_UI 的悬浮按钮创建入口")
assert(type(GW2_ADDON.UpdateMinimapButtonsSack) == "function",
    "应接管 GW2_UI 的悬浮按钮刷新入口")

GW2_UI_PLUS_SV.minimapAddonFlyoutEnabled = false
GW2_ADDON.CreateMinimapButtonsSack()
assert(Flyout.GetToggle() ~= nil,
    "开关关闭时仍须为 GW2_UI 小地图提供兼容入口")
assert(Flyout.GetToggle():IsShown() == false,
    "开关关闭时兼容入口必须保持隐藏")
Flyout.SetEnabled(true)

Flyout.Apply()
local firstToggle = Flyout.GetToggle()
assert(firstToggle ~= nil, "开启时应创建插件悬浮入口")
assert(addonButton:GetParent() == firstToggle.container,
    "符合条件的插件按钮应收纳进悬浮栏")
assert(trackingButton:GetParent() == Minimap,
    "暴雪原生小地图控件不应被收纳")

Flyout.Apply()
assert(Flyout.GetToggle() == firstToggle,
    "重复应用应复用同一悬浮入口")
assert(createdToggleCount == 1,
    "重复应用不得创建第二个悬浮入口")

Flyout.SetEnabled(false)
assert(firstToggle:IsShown() == false,
    "关闭后应隐藏悬浮入口")
assert(addonButton:GetParent() == Minimap,
    "关闭后应恢复插件按钮原父级")
local point, relativeTo, relativePoint, x, y = addonButton:GetPoint(1)
assert(point == originalPoint and relativeTo == originalRelativeTo
    and relativePoint == originalRelativePoint
    and x == originalX and y == originalY,
    "关闭后应恢复插件按钮原锚点")

GW2_ADDON.settings.MINIMAP_ENABLED = false
Flyout.SetEnabled(true)
assert(addonButton:GetParent() == firstToggle.container,
    "关闭 GW2_UI 小地图时仍应收纳插件按钮")
assert(createdToggleCount == 1,
    "重新启用仍应复用现有入口")

local adoptedButton =
    NewFrame("LibDBIcon10_Adopted", firstToggle.container, 32, "Button")
adoptedButton:SetPoint(
    "RIGHT", firstToggle.container, "RIGHT", -32, 0)
Flyout.Apply()
Flyout.SetEnabled(false)
assert(adoptedButton:GetParent() == Minimap,
    "接管已有入口时也应纳管并恢复其中的插件按钮")

Flyout.SetEnabled(true)
local blockedAdoptedButton =
    NewFrame("LibDBIcon10_Blocked", firstToggle.container, 32, "Button")
blockedAdoptedButton:SetPoint(
    "RIGHT", firstToggle.container, "RIGHT", -59, 0)
petBattle = true
Flyout.Apply()
assert(blockedAdoptedButton:GetWidth() == 32,
    "宠物对战中不得提前修改待接管按钮")
Flyout.SetEnabled(false)
assert(driverFrame.events.PET_BATTLE_CLOSE == true,
    "宠物对战中延后的操作应监听宠物对战结束")
driverFrame.scripts.OnEvent(driverFrame, "PET_BATTLE_CLOSE")
assert(driverFrame.events.PET_BATTLE_CLOSE == true,
    "首次关闭事件仍处于宠物对战时应继续监听")
petBattle = false
driverFrame.scripts.OnEvent(driverFrame, "PET_BATTLE_CLOSE")
assert(adoptedButton:GetParent() == Minimap,
    "宠物对战结束后应立即应用延后的恢复")
assert(blockedAdoptedButton:GetParent() == Minimap,
    "宠物对战结束后应接管并恢复入口内遗留按钮")

Flyout.SetEnabled(true)
scheduledDelays = {}
driverFrame.scripts.OnEvent(driverFrame, "ADDON_LOADED")
local hasOneSecondScan
local hasFiveSecondScan
for _, delay in ipairs(scheduledDelays) do
    if delay == 1 then hasOneSecondScan = true end
    if delay == 5 then hasFiveSecondScan = true end
end
assert(hasOneSecondScan and hasFiveSecondScan,
    "插件加载后应安排两次扫描以发现较晚创建的小地图按钮")

print("MinimapAddonFlyout_test: OK")
