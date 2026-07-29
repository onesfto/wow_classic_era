-- GW2_UI_PLUS 小地图插件悬浮按钮
-- 独立保存和控制，不读取 GW2_UI 的小地图启用状态。

local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local Flyout = {}
addonTable.MinimapAddonFlyout = Flyout

function Flyout.InitDB()
    GW2_UI_PLUS_SV = GW2_UI_PLUS_SV or {}
    if GW2_UI_PLUS_SV.minimapAddonFlyoutEnabled == nil then
        GW2_UI_PLUS_SV.minimapAddonFlyoutEnabled = true
    end
    return GW2_UI_PLUS_SV
end

function Flyout.IsEnabled()
    return Flyout.InitDB().minimapAddonFlyoutEnabled ~= false
end

GW.CreateMinimapButtonsSack = function()
    if Flyout.Apply then Flyout.Apply() end
end

GW.UpdateMinimapButtonsSack = function()
    if Flyout.Refresh then Flyout.Refresh() end
end
