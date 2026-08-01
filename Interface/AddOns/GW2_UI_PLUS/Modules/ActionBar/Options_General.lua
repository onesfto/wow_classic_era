local _, addonTable = ...
local GW = _G.GW2_ADDON
if not GW or not GW.GetSettingsTabFrame then return end
local AB = addonTable.PlusActionBar
if not AB then return end
local Utils = addonTable.ActionBarOptionsUtils
if not Utils then return end
local General = {}
addonTable.ActionBarOptionsGeneral = General
function General.AddGeneralOptions(panel)
    local db, defaults = AB.InitDB(), AB.defaults
    panel:AddOption("启用 GW2 UI 动作条", "这是 GW2 UI 原生总开关，修改后需要重新加载界面。", {
        getter = function() return GW.settings.ACTIONBARS_ENABLED end,
        setter = function(value) GW.settings.ACTIONBARS_ENABLED = value end,
        getDefault = function() return true end,
        callback = function() GW.ShowRlPopup = true end,
        isMasterToggle = true,
    })
    panel:AddGroupHeader("全局渐隐")
    panel:AddOption("启用全局渐隐", "鼠标离开后统一降低所选动作条的透明度。", {
        getter = function() return db.fadeEnable end,
        setter = function(value) db.fadeEnable = value end,
        getDefault = function() return defaults.fadeEnable end,
        callback = Utils.ApplyFader,
        isMasterToggle = true,
        groupHeaderName = "全局渐隐",
    })
    panel:AddOptionSlider("淡出后透明度", nil, {
        min = 0, max = 1, step = 0.05, decimalNumbers = 2,
        getter = function() return db.fadeAlpha end,
        setter = function(value) db.fadeAlpha = value end,
        getDefault = function() return defaults.fadeAlpha end,
        callback = Utils.ApplyFader,
        groupHeaderName = "全局渐隐",
    })
    panel:AddOptionSlider("淡出延迟", nil, {
        min = 0, max = 5, step = 0.1, decimalNumbers = 1,
        getter = function() return db.fadeDelay end,
        setter = function(value) db.fadeDelay = value end,
        getDefault = function() return defaults.fadeDelay end,
        callback = Utils.ApplyFader,
        groupHeaderName = "全局渐隐",
    })
    panel:AddOption("战斗中不渐隐", nil, {
        getter = function() return db.keepInCombat end,
        setter = function(value) db.keepInCombat = value end,
        getDefault = function() return defaults.keepInCombat end,
        callback = Utils.ApplyFader,
        groupHeaderName = "全局渐隐",
    })
    panel:AddGroupHeader("参与渐隐的动作条")
    local bars = {
        {"fadeBar1", "主动作条"},
        {"fadeBar2", "动作条 2"},
        {"fadeBar3", "动作条 3"},
        {"fadeBar4", "动作条 4"},
        {"fadeBar5", "动作条 5"},
        {"fadeBar6", "动作条 6"},
        {"fadeBar7", "动作条 7"},
        {"fadeBar8", "动作条 8"},
        {"fadeStanceBar", "姿态条"},
        {"fadePetBar", "宠物动作条"},
        {"fadeMageBar", "法师动作条"},
    }
    for _, entry in ipairs(bars) do
        local key, name = entry[1], entry[2]
        local option = panel:AddOption(name, "动作条设为不显示时，此项自动失效并完全跳过换装处理。", {
            getter = function() return db[key] end,
            setter = function(value) db[key] = value end,
            getDefault = function() return defaults[key] end,
            callback = Utils.ApplyFader,
            groupHeaderName = "参与渐隐的动作条",
        })
        if option then option.gwPlusColumns = 4 end
    end
    Utils.AddResetButton(panel, function()
        local defaultActionbarsEnabled = Utils.NativeDefault("ACTIONBARS_ENABLED", true)
        local actionbarsEnabledChanged = GW.settings.ACTIONBARS_ENABLED ~= defaultActionbarsEnabled
        GW.settings.ACTIONBARS_ENABLED = defaultActionbarsEnabled
        for _, key in ipairs({
            "fadeEnable", "fadeAlpha", "fadeDelay", "keepInCombat",
            "fadeBar1", "fadeBar2", "fadeBar3", "fadeBar4", "fadeBar5",
            "fadeBar6", "fadeBar7", "fadeBar8", "fadeStanceBar",
            "fadePetBar", "fadeMageBar",
        }) do
            db[key] = defaults[key]
        end
        Utils.ApplyFader()
        if actionbarsEnabledChanged then
            GW.ShowRlPopup = true
        end
    end)
end
