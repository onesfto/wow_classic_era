local _, addonTable = ...
-- 注意：不在顶层检查 GW2_ADDON，避免模块加载失败

local MainBar = {}
addonTable.ActionBarOptionsMainBar = MainBar

function MainBar.AddMainBarOptions(panel)
    -- 延迟获取依赖
    local GW = _G.GW2_ADDON
    if not GW then return end
    local AB = addonTable.PlusActionBar
    if not AB then return end
    local Utils = addonTable.ActionBarOptionsUtils
    if not Utils then return end

    local HOTKEY_POSITION_VALUES = Utils.HOTKEY_POSITION_VALUES
    local HOTKEY_POSITION_NAMES = Utils.HOTKEY_POSITION_NAMES
    local ApplyLayout = Utils.ApplyLayout

    local db, defaults = AB.InitDB(), AB.defaults
    panel:AddOption("显示主动作条", nil, {
        getter = function() return db.mainBarShown end,
        setter = function(value) db.mainBarShown = value end,
        getDefault = function() return true end,
        callback = ApplyLayout,
        isMasterToggle = true,
    })
    panel:AddGroupHeader("按钮")
    local mainSize = panel:AddOptionSlider("尺寸", nil, {
        min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1,
        getter = function() return db.mainBarSize end,
        setter = function(value) db.mainBarSize = value end,
        getDefault = function() return defaults.mainBarSize end,
        callback = AB.ApplyMainBarLayout,
        groupHeaderName = "按钮",
    })
    if mainSize then mainSize.gwPlusColumns = 2 end
    local mainSpacing = panel:AddOptionSlider("间距", nil, {
        min = 0, max = 20, step = 0.1, decimalNumbers = 1,
        getter = function() return GW.settings.MAINBAR_MARGIIN or 5 end,
        setter = function(value) GW.settings.MAINBAR_MARGIIN = value end,
        getDefault = function() return 5 end,
        callback = AB.ApplyMainBarLayout,
        groupHeaderName = "按钮",
    })
    if mainSpacing then mainSpacing.gwPlusColumns = 2 end
    local mainCount = panel:AddOptionSlider("按钮数", nil, {
        min = 1, max = 12, step = 1,
        getter = function() return db.mainBarCount end,
        setter = function(value) db.mainBarCount = value end,
        getDefault = function() return defaults.mainBarCount end,
        callback = function() AB.ApplyMainBarLayout(); Utils.RefreshPanel(panel) end,
        groupHeaderName = "按钮",
    })
    if mainCount then mainCount.gwPlusColumns = 2 end
    local mainColumns = panel:AddOptionSlider("行按钮数", nil, {
        min = 1, max = 12, step = 1,
        getter = function() return math.min(db.mainBarColumns, db.mainBarCount) end,
        setter = function(value) db.mainBarColumns = value end,
        getDefault = function() return defaults.mainBarColumns end,
        callback = AB.ApplyMainBarLayout,
        groupHeaderName = "按钮",
    })
    if mainColumns then mainColumns.gwPlusColumns = 2 end
    local mainGlobeGap = panel:AddOptionSlider("中间空隙", nil, {
        min = 0, max = 400, step = 1,
        getter = function() return db.mainBarGlobeGap or 0 end,
        setter = function(value) db.mainBarGlobeGap = value end,
        getDefault = function() return defaults.mainBarGlobeGap end,
        callback = AB.ApplyMainBarLayout,
        groupHeaderName = "按钮",
    })
    if mainGlobeGap then mainGlobeGap.gwPlusColumns = 2 end
    local rangeIndicator = panel:AddOptionDropdown("范围提示", nil, {
        optionsList = {"RED_INDICATOR", "RED_OVERLAY", "BOTH", "NONE"},
        optionNames = {"红点", "红色覆盖", "两者", "无"},
        getter = function() return GW.settings.MAINBAR_RANGEINDICATOR end,
        setter = function(value) GW.settings.MAINBAR_RANGEINDICATOR = value end,
        getDefault = function() return "RED_INDICATOR" end,
        callback = function() if GW.UpdateMainBarHot then GW.UpdateMainBarHot() end end,
        groupHeaderName = "按钮",
    })
    if rangeIndicator then rangeIndicator.gwPlusColumns = 2 end
    panel:AddGroupHeader("快捷键")
    panel:AddOption("显示快捷键", nil, {
        getter = function() return db.mainBarShowHotkey end,
        setter = function(value) db.mainBarShowHotkey = value end,
        getDefault = function() return defaults.mainBarShowHotkey end,
        callback = AB.ApplyMainBarText,
        groupHeaderName = "快捷键",
    })
    local hotkeyPosition = panel:AddOptionDropdown("位置", nil, {
        optionsList = HOTKEY_POSITION_VALUES,
        optionNames = HOTKEY_POSITION_NAMES,
        getter = function() return db.mainBarHotkeyPosition end,
        setter = function(value) db.mainBarHotkeyPosition = value end,
        getDefault = function() return defaults.mainBarHotkeyPosition end,
        callback = AB.ApplyMainBarText,
        groupHeaderName = "快捷键",
    })
    if hotkeyPosition then hotkeyPosition.gwPlusColumns = 2 end
    local hotkeySize = panel:AddOptionSlider("字体大小", nil, {
        min = 8, max = 48, step = 1,
        getter = function() return db.mainBarHotkeySize end,
        setter = function(value) db.mainBarHotkeySize = value end,
        getDefault = function() return defaults.mainBarHotkeySize end,
        callback = AB.ApplyMainBarText,
        groupHeaderName = "快捷键",
    })
    if hotkeySize then hotkeySize.gwPlusColumns = 2 end
    for _, entry in ipairs({
        {"X 偏移", "mainBarHotkeyX"},
        {"Y 偏移", "mainBarHotkeyY"},
    }) do
        local label, key = entry[1], entry[2]
        local option = panel:AddOptionSlider(label, nil, {
            min = -20, max = 20, step = 1,
            getter = function() return db[key] end,
            setter = function(value) db[key] = value end,
            getDefault = function() return defaults[key] end,
            callback = AB.ApplyMainBarText,
            groupHeaderName = "快捷键",
        })
        if option then option.gwPlusColumns = 2 end
    end
    panel:AddGroupHeader("宏名称")
    panel:AddOption("显示宏名称", nil, {
        getter = function() return db.mainBarShowMacro end,
        setter = function(value) db.mainBarShowMacro = value end,
        getDefault = function() return defaults.mainBarShowMacro end,
        callback = AB.ApplyMainBarText,
        groupHeaderName = "宏名称",
    })
    local macroPosition = panel:AddOptionDropdown("位置", nil, {
        optionsList = HOTKEY_POSITION_VALUES,
        optionNames = HOTKEY_POSITION_NAMES,
        getter = function() return db.mainBarMacroPosition end,
        setter = function(value) db.mainBarMacroPosition = value end,
        getDefault = function() return defaults.mainBarMacroPosition end,
        callback = AB.ApplyMainBarText,
        groupHeaderName = "宏名称",
    })
    if macroPosition then macroPosition.gwPlusColumns = 2 end
    local macroSize = panel:AddOptionSlider("字体大小", nil, {
        min = 8, max = 48, step = 1,
        getter = function() return db.mainBarMacroSize end,
        setter = function(value) db.mainBarMacroSize = value end,
        getDefault = function() return defaults.mainBarMacroSize end,
        callback = AB.ApplyMainBarText,
        groupHeaderName = "宏名称",
    })
    if macroSize then macroSize.gwPlusColumns = 2 end
    for _, entry in ipairs({
        {"X 偏移", "mainBarMacroX", -20, 20},
        {"Y 偏移", "mainBarMacroY", -20, 20},
    }) do
        local label, key, minimum, maximum =
            entry[1], entry[2], entry[3], entry[4]
        local option = panel:AddOptionSlider(label, nil, {
            min = minimum, max = maximum, step = 1,
            getter = function() return db[key] end,
            setter = function(value) db[key] = value end,
            getDefault = function() return defaults[key] end,
            callback = AB.ApplyMainBarText,
            groupHeaderName = "宏名称",
        })
        if option then option.gwPlusColumns = 2 end
    end
    Utils.AddResetButton(panel, function()
        db.mainBarShown = true
        db.mainBarSize = defaults.mainBarSize
        db.mainBarCount = defaults.mainBarCount
        db.mainBarColumns = defaults.mainBarColumns
        db.mainBarShowHotkey = defaults.mainBarShowHotkey
        db.mainBarHotkeyPosition = defaults.mainBarHotkeyPosition
        db.mainBarHotkeyX = defaults.mainBarHotkeyX
        db.mainBarHotkeyY = defaults.mainBarHotkeyY
        db.mainBarHotkeySize = defaults.mainBarHotkeySize
        db.mainBarShowMacro = defaults.mainBarShowMacro
        db.mainBarMacroPosition = defaults.mainBarMacroPosition
        db.mainBarMacroX = defaults.mainBarMacroX
        db.mainBarMacroY = defaults.mainBarMacroY
        db.mainBarMacroSize = defaults.mainBarMacroSize
        GW.settings.MAINBAR_MARGIIN = Utils.NativeDefault("MAINBAR_MARGIIN", 5)
        GW.settings.MAINBAR_RANGEINDICATOR =
            Utils.NativeDefault("MAINBAR_RANGEINDICATOR", "RED_INDICATOR")
        if _G.MainActionBar then _G.MainActionBar:Show() end
        AB.ApplyMainBarLayout()
        Utils.ApplyFader()
        Utils.ResetMover(_G.MainActionBar)
    end)
end
