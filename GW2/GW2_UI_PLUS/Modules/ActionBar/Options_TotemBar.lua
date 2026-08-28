local _, addonTable = ...
-- 注意：不在顶层检查 GW2_ADDON，避免模块加载失败

local TotemBar = {}
addonTable.ActionBarOptionsTotemBar = TotemBar

function TotemBar.AddTotemBarOptions(panel)
    -- 延迟获取依赖
    local GW = _G.GW2_ADDON
    if not GW then return end
    local AB = addonTable.PlusActionBar
    if not AB then return end
    local Utils = addonTable.ActionBarOptionsUtils
    if not Utils then return end
    local function Native(key, fallback)
        local defaults = Utils.NativeDefault("TotemBar", {})
        return defaults[key] ~= nil and defaults[key] or fallback
    end
    local function Default(key, fallback)
        return Utils.ActionBarDefault(
            "TotemBar." .. key, Native(key, fallback))
    end

    local applyVisibility = function()
        if _G.GwTotemBar then _G.GwTotemBar:UpdateVisibility() end
        if addonTable.PlusFader then addonTable.PlusFader.Refresh() end
    end
    local applyLayout = function()
        if _G.GwTotemBar then _G.GwTotemBar:PositionAndSizeUpdate() end
    end
    panel:AddOption("显示图腾条", nil, {
        getter = function() return GW.settings.TotemBar.enabled end,
        setter = function(value) GW.settings.TotemBar.enabled = value end,
        getDefault = function() return Default("enabled", true) end,
        callback = applyVisibility,
        isMasterToggle = true,
    })
    panel:AddOptionDropdown("增长方向", nil, {
        optionsList = {"HORIZONTAL", "VERTICAL"},
        optionNames = {"水平", "垂直"},
        getter = function() return GW.settings.TotemBar.growDirection end,
        setter = function(value) GW.settings.TotemBar.growDirection = value end,
        getDefault = function()
            return Default("growDirection", "HORIZONTAL")
        end,
        callback = applyLayout,
    })
    panel:AddOptionDropdown("排序方向", nil, {
        optionsList = {"ASC", "DSC"},
        optionNames = {"升序", "降序"},
        getter = function() return GW.settings.TotemBar.sortDirection end,
        setter = function(value) GW.settings.TotemBar.sortDirection = value end,
        getDefault = function() return Default("sortDirection", "ASC") end,
        callback = applyLayout,
    })
    local sizeOption = panel:AddOptionSlider("尺寸", nil, {
        min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1, decimalNumbers = 0,
        getter = function() return GW.settings.TotemBar.buttonSize end,
        setter = function(value) GW.settings.TotemBar.buttonSize = value end,
        getDefault = function() return Default("buttonSize", 32) end,
        callback = applyLayout,
    })
    if sizeOption then sizeOption.gwPlusColumns = 2 end
    local spacingOption = panel:AddOptionSlider("间距", nil, {
        min = 0, max = 20, step = 1, decimalNumbers = 0,
        getter = function() return GW.settings.TotemBar.spacing end,
        setter = function(value) GW.settings.TotemBar.spacing = value end,
        getDefault = function() return Default("spacing", 2) end,
        callback = applyLayout,
    })
    if spacingOption then spacingOption.gwPlusColumns = 2 end
    Utils.AddResetButton(panel, function()
        GW.settings.TotemBar.enabled = Default("enabled", true)
        GW.settings.TotemBar.growDirection =
            Default("growDirection", "HORIZONTAL")
        GW.settings.TotemBar.sortDirection =
            Default("sortDirection", "ASC")
        GW.settings.TotemBar.buttonSize = Default("buttonSize", 32)
        GW.settings.TotemBar.spacing = Default("spacing", 2)
        applyVisibility()
        applyLayout()
        Utils.ResetMover(_G.GwTotemBar)
    end)
end
local NATIVE_ACTIONBAR_PANEL_IDS = {
    actionbar_general = true,
    actionbar_main = true,
    actionbar_extra = true,
    actionbar_stance = true,
}
