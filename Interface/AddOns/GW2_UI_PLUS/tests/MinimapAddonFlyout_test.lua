local createdFrames = {}

GW2_UI_PLUS_SV = nil
UIParent = {}
Minimap = {}
C_Timer = {After = function(_, callback) callback() end}
GW2_ADDON = {
    settings = {MINIMAP_ENABLED = false},
}

function CreateFrame(_, name)
    local frame = {
        name = name,
        events = {},
        scripts = {},
    }
    function frame:RegisterEvent(event) self.events[event] = true end
    function frame:UnregisterEvent(event) self.events[event] = nil end
    function frame:SetScript(script, handler) self.scripts[script] = handler end
    createdFrames[#createdFrames + 1] = frame
    if name then _G[name] = frame end
    return frame
end

local addonTable = {}
assert(loadfile("Minimap/AddonFlyout.lua"))(
    "GW2_UI_PLUS", addonTable)

local Flyout = assert(addonTable.MinimapAddonFlyout,
    "应导出独立插件悬浮按钮模块")
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

print("MinimapAddonFlyout_test: OK")
