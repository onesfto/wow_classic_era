local _, addonTable = ...
-- 注意：不在顶层检查 GW2_ADDON，避免模块加载失败

local General = {}
addonTable.ActionBarOptionsGeneral = General

function General.AddGeneralOptions(panel)
    -- 延迟获取依赖
    local GW = _G.GW2_ADDON
    if not GW then return end
    local AB = addonTable.PlusActionBar
    if not AB then return end
    local Utils = addonTable.ActionBarOptionsUtils
    if not Utils then return end

    local db, defaults = AB.InitDB(), AB.defaults
    -- 第一行：启用 | 仅在已使用按键上显示标签
    local enableOption = panel:AddOption("启用", "这是 GW2 UI 原生总开关，修改后需要重新加载界面。", {
        getter = function() return GW.settings.ACTIONBARS_ENABLED end,
        setter = function(value) GW.settings.ACTIONBARS_ENABLED = value end,
        getDefault = function()
            return Utils.ActionBarDefault("ACTIONBARS_ENABLED", true)
        end,
        callback = function() GW.ShowRlPopup = true end,
        isMasterToggle = true,
    })
    if enableOption then enableOption.gwPlusColumns = 2 end
    local usedOnlyOption = panel:AddOption("仅在已使用按键上显示标签", "只在有技能的按钮上显示快捷键标签。", {
        getter = function() return GW.settings.BUTTON_ASSIGNMENTS_USED_ONLY end,
        setter = function(value) GW.settings.BUTTON_ASSIGNMENTS_USED_ONLY = value end,
        getDefault = function()
            return Utils.ActionBarDefault(
                "BUTTON_ASSIGNMENTS_USED_ONLY",
                Utils.NativeDefault("BUTTON_ASSIGNMENTS_USED_ONLY", false))
        end,
        callback = function()
            if GW.UpdateMainBarHot then GW.UpdateMainBarHot() end
            if GW.UpdateMultibarButtons then GW.UpdateMultibarButtons() end
        end,
    })
    if usedOnlyOption then usedOnlyOption.gwPlusColumns = 2 end

    -- 第二行：空槽透明度（独占一行）
    panel:AddOptionSlider("空槽透明度", "设置空动作槽的透明度。", {
        min = 0, max = 1, step = 0.1, decimalNumbers = 1,
        getter = function() return GW.settings.ACTIONBAR_BACKGROUND_ALPHA end,
        setter = function(value) GW.settings.ACTIONBAR_BACKGROUND_ALPHA = value end,
        getDefault = function()
            return Utils.ActionBarDefault(
                "ACTIONBAR_BACKGROUND_ALPHA",
                Utils.NativeDefault("ACTIONBAR_BACKGROUND_ALPHA", 0.4))
        end,
        callback = function()
            if GW.UpdateMainBarHot then GW.UpdateMainBarHot() end
            if GW.UpdateMultibarButtons then GW.UpdateMultibarButtons() end
        end,
    })

    panel:AddOptionButton("恢复空的动作条槽位",
        "当暴雪编辑模式隐藏了空动作条槽位时，在全部 8 个动作条上恢复空槽位。", {
        callback = function()
            if GW.MakeActionbuttonsVisible then
                GW.MakeActionbuttonsVisible()
            end
        end,
    })

    panel:AddGroupHeader("全局渐隐")
    -- 第一行：启用 | 战斗中不渐隐
    local fadeEnableOption = panel:AddOption("启用", "鼠标离开后统一降低所选动作条的透明度。", {
        getter = function() return db.fadeEnable end,
        setter = function(value) db.fadeEnable = value end,
        getDefault = function()
            return Utils.ActionBarDefault("fadeEnable", defaults.fadeEnable)
        end,
        callback = Utils.ApplyFader,
        isMasterToggle = true,
        groupHeaderName = "全局渐隐",
    })
    if fadeEnableOption then fadeEnableOption.gwPlusColumns = 2 end
    local keepInCombatOption = panel:AddOption("战斗中不渐隐", nil, {
        getter = function() return db.keepInCombat end,
        setter = function(value) db.keepInCombat = value end,
        getDefault = function()
            return Utils.ActionBarDefault("keepInCombat", defaults.keepInCombat)
        end,
        callback = Utils.ApplyFader,
        groupHeaderName = "全局渐隐",
    })
    if keepInCombatOption then keepInCombatOption.gwPlusColumns = 2 end
    -- 第二行：淡出后透明度 | 淡出延迟
    local fadeAlphaOption = panel:AddOptionSlider("透明度", nil, {
        min = 0, max = 1, step = 0.05, decimalNumbers = 2,
        getter = function() return db.fadeAlpha end,
        setter = function(value) db.fadeAlpha = value end,
        getDefault = function()
            return Utils.ActionBarDefault("fadeAlpha", defaults.fadeAlpha)
        end,
        callback = Utils.ApplyFader,
        groupHeaderName = "全局渐隐",
    })
    if fadeAlphaOption then fadeAlphaOption.gwPlusColumns = 2 end
    local fadeDelayOption = panel:AddOptionSlider("淡出延迟", nil, {
        min = 0, max = 5, step = 0.1, decimalNumbers = 1,
        getter = function() return db.fadeDelay end,
        setter = function(value) db.fadeDelay = value end,
        getDefault = function()
            return Utils.ActionBarDefault("fadeDelay", defaults.fadeDelay)
        end,
        callback = Utils.ApplyFader,
        groupHeaderName = "全局渐隐",
    })
    if fadeDelayOption then fadeDelayOption.gwPlusColumns = 2 end
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
        {"fadeTotemBar", "图腾条"},
        {"fadeMageBar", "法师动作条"},
    }
    for _, entry in ipairs(bars) do
        local key, name = entry[1], entry[2]
        local option = panel:AddOption(name, "动作条设为不显示时，此项自动失效并完全跳过换装处理。", {
            getter = function() return db[key] end,
            setter = function(value) db[key] = value end,
            getDefault = function()
                return Utils.ActionBarDefault(key, defaults[key])
            end,
            callback = Utils.ApplyFader,
            groupHeaderName = "参与渐隐的动作条",
        })
        if option then option.gwPlusColumns = 4 end
    end
    Utils.AddResetButton(panel, function()
        local defaultActionbarsEnabled = Utils.ActionBarDefault(
            "ACTIONBARS_ENABLED", true)
        local actionbarsEnabledChanged = GW.settings.ACTIONBARS_ENABLED ~= defaultActionbarsEnabled
        GW.settings.ACTIONBARS_ENABLED = defaultActionbarsEnabled
        GW.settings.BUTTON_ASSIGNMENTS_USED_ONLY = Utils.ActionBarDefault(
            "BUTTON_ASSIGNMENTS_USED_ONLY",
            Utils.NativeDefault("BUTTON_ASSIGNMENTS_USED_ONLY", false))
        GW.settings.ACTIONBAR_BACKGROUND_ALPHA = Utils.ActionBarDefault(
            "ACTIONBAR_BACKGROUND_ALPHA",
            Utils.NativeDefault("ACTIONBAR_BACKGROUND_ALPHA", 0.4))
        for _, key in ipairs({
            "fadeEnable", "fadeAlpha", "fadeDelay", "keepInCombat",
            "fadeBar1", "fadeBar2", "fadeBar3", "fadeBar4", "fadeBar5",
            "fadeBar6", "fadeBar7", "fadeBar8", "fadeStanceBar",
            "fadePetBar", "fadeTotemBar", "fadeMageBar",
        }) do
            db[key] = Utils.ActionBarDefault(key, defaults[key])
        end
        Utils.ApplyFader()
        if actionbarsEnabledChanged then
            GW.ShowRlPopup = true
        end
    end)
end
