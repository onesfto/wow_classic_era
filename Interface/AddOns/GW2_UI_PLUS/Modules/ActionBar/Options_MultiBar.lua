local _, addonTable = ...
-- 注意：不在顶层检查 GW2_ADDON，避免模块加载失败

local MultiBar = {}
addonTable.ActionBarOptionsMultiBar = MultiBar

function MultiBar.AddMultiBarOptions(panel)
    -- 延迟获取依赖
    local GW = _G.GW2_ADDON
    if not GW then return end
    local AB = addonTable.PlusActionBar
    if not AB then return end
    local Utils = addonTable.ActionBarOptionsUtils
    if not Utils then return end

    local HOTKEY_POSITION_VALUES = Utils.HOTKEY_POSITION_VALUES
    local HOTKEY_POSITION_NAMES = Utils.HOTKEY_POSITION_NAMES

    local db = AB.InitDB()
    local selectedBar = 2
    local layout = addonTable.PlusActionBarLayout
    local function Prefix() return "bar" .. selectedBar end
    local function Native()
        local info = AB.MULTIBARS[selectedBar]
        return info and GW.settings[info.setting]
    end
    local function ApplyCurrent()
        if layout then layout.ApplyMultiBar(selectedBar) end
        Utils.ApplyFader()
    end
    local function ApplyCurrentText()
        if layout then layout.ApplyMultiBarText(selectedBar) end
    end
    panel:AddOptionDropdown("正在设置", nil, {
        optionsList = {2, 3, 4, 5, 6, 7, 8},
        optionNames = {"动作条 2", "动作条 3", "动作条 4", "动作条 5",
            "动作条 6", "动作条 7", "动作条 8"},
        getter = function() return selectedBar end,
        setter = function(value) selectedBar = value end,
        getDefault = function() return 2 end,
        callback = function() Utils.RefreshPanel(panel) end,
    })
    local showBarOption = panel:AddOption("显示动作条", nil, {
        getter = function() return db[Prefix() .. "Shown"] end,
        setter = function(value) db[Prefix() .. "Shown"] = value end,
        getDefault = function() return selectedBar <= 5 end,
        callback = ApplyCurrent,
        isMasterToggle = true,
    })
    if showBarOption then showBarOption.gwPlusColumns = 2 end
    local invertOption = panel:AddOption("倒序排列", nil, {
        getter = function() return Native().invert end,
        setter = function(value) Native().invert = value end,
        getDefault = function() return false end,
        callback = ApplyCurrent,
    })
    if invertOption then invertOption.gwPlusColumns = 2 end
    local countOption = panel:AddOptionSlider("按钮数", nil, {
        min = 1, max = 12, step = 1,
        getter = function() return db[Prefix() .. "Count"] end,
        setter = function(value) db[Prefix() .. "Count"] = value end,
        getDefault = function() return 12 end,
        callback = function() ApplyCurrent(); Utils.RefreshPanel(panel) end,
    })
    if countOption then countOption.gwPlusColumns = 2 end
    local columnsOption = panel:AddOptionSlider("行按钮数", nil, {
        min = 1, max = 12, step = 1,
        getter = function()
            return math.min(db[Prefix() .. "Columns"], db[Prefix() .. "Count"])
        end,
        setter = function(value) db[Prefix() .. "Columns"] = value end,
        getDefault = function() return selectedBar <= 3 and 6 or 1 end,
        callback = ApplyCurrent,
    })
    if columnsOption then columnsOption.gwPlusColumns = 2 end
    local sizeOption = panel:AddOptionSlider("尺寸", nil, {
        min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1,
        getter = function() return AB.GetMultiBarSize(selectedBar) end,
        setter = function(value) AB.SetMultiBarSize(selectedBar, value) end,
        getDefault = function() return 36 end,
        callback = ApplyCurrent,
    })
    if sizeOption then sizeOption.gwPlusColumns = 2 end
    local spacingOption = panel:AddOptionSlider("间距", nil, {
        min = 0, max = 20, step = 0.1, decimalNumbers = 1,
        getter = function() return db[Prefix() .. "Spacing"] end,
        setter = function(value) db[Prefix() .. "Spacing"] = value end,
        getDefault = function() return 2 end,
        callback = ApplyCurrent,
    })
    if spacingOption then spacingOption.gwPlusColumns = 2 end
    panel:AddGroupHeader("快捷键")
    panel:AddOption("显示快捷键", nil, {
        getter = function() return db[Prefix() .. "ShowHotkey"] end,
        setter = function(value) db[Prefix() .. "ShowHotkey"] = value end,
        getDefault = function() return true end,
        callback = ApplyCurrentText,
        groupHeaderName = "快捷键",
    })
    local positionOption = panel:AddOptionDropdown("位置", nil, {
        optionsList = HOTKEY_POSITION_VALUES,
        optionNames = HOTKEY_POSITION_NAMES,
        getter = function() return db[Prefix() .. "HotkeyPosition"] end,
        setter = function(value) db[Prefix() .. "HotkeyPosition"] = value end,
        getDefault = function() return "TOPLEFT" end,
        callback = ApplyCurrentText,
        groupHeaderName = "快捷键",
    })
    if positionOption then positionOption.gwPlusColumns = 2 end
    local hotkeySizeOption = panel:AddOptionSlider("字体大小", nil, {
        min = 8, max = 48, step = 1,
        getter = function() return db[Prefix() .. "HotkeySize"] end,
        setter = function(value) db[Prefix() .. "HotkeySize"] = value end,
        getDefault = function() return 12 end,
        callback = ApplyCurrentText,
        groupHeaderName = "快捷键",
    })
    if hotkeySizeOption then hotkeySizeOption.gwPlusColumns = 2 end
    for _, entry in ipairs({
        {"X 偏移", "HotkeyX", -20, 20, 0},
        {"Y 偏移", "HotkeyY", -20, 20, 0},
    }) do
        local label, key, minimum, maximum, default =
            entry[1], entry[2], entry[3], entry[4], entry[5]
        local option = panel:AddOptionSlider(label, nil, {
            min = minimum, max = maximum, step = 1,
            getter = function() return db[Prefix() .. key] end,
            setter = function(value) db[Prefix() .. key] = value end,
            getDefault = function() return default end,
            callback = ApplyCurrentText,
            groupHeaderName = "快捷键",
        })
        if option then option.gwPlusColumns = 2 end
    end
    panel:AddGroupHeader("宏名称")
    panel:AddOption("显示宏名称", nil, {
        getter = function() return db[Prefix() .. "ShowMacro"] end,
        setter = function(value) db[Prefix() .. "ShowMacro"] = value end,
        getDefault = function() return false end,
        callback = ApplyCurrentText,
        groupHeaderName = "宏名称",
    })
    local macroPosition = panel:AddOptionDropdown("位置", nil, {
        optionsList = HOTKEY_POSITION_VALUES,
        optionNames = HOTKEY_POSITION_NAMES,
        getter = function() return db[Prefix() .. "MacroPosition"] end,
        setter = function(value) db[Prefix() .. "MacroPosition"] = value end,
        getDefault = function() return "BOTTOM" end,
        callback = ApplyCurrentText,
        groupHeaderName = "宏名称",
    })
    if macroPosition then macroPosition.gwPlusColumns = 2 end
    local macroSize = panel:AddOptionSlider("字体大小", nil, {
        min = 8, max = 48, step = 1,
        getter = function() return db[Prefix() .. "MacroSize"] end,
        setter = function(value) db[Prefix() .. "MacroSize"] = value end,
        getDefault = function() return 12 end,
        callback = ApplyCurrentText,
        groupHeaderName = "宏名称",
    })
    if macroSize then macroSize.gwPlusColumns = 2 end
    for _, entry in ipairs({
        {"X 偏移", "MacroX", -20, 20, 0},
        {"Y 偏移", "MacroY", -20, 20, 0},
    }) do
        local label, key, minimum, maximum, default =
            entry[1], entry[2], entry[3], entry[4], entry[5]
        local option = panel:AddOptionSlider(label, nil, {
            min = minimum, max = maximum, step = 1,
            getter = function() return db[Prefix() .. key] end,
            setter = function(value) db[Prefix() .. key] = value end,
            getDefault = function() return default end,
            callback = ApplyCurrentText,
            groupHeaderName = "宏名称",
        })
        if option then option.gwPlusColumns = 2 end
    end
    Utils.AddResetButton(panel, function()
        local prefix = Prefix()
        local info = AB.MULTIBARS[selectedBar]
        local native = Native()
        local nativeDefaults = info and Utils.NativeDefault(info.setting, {}) or {}
        db[prefix .. "Shown"] = selectedBar <= 5
        db[prefix .. "Count"] = 12
        db[prefix .. "Columns"] = nativeDefaults.ButtonsPerRow
            or (selectedBar <= 3 and 6 or 1)
        db[prefix .. "Spacing"] = Utils.NativeDefault("MULTIBAR_MARGIIN", 2)
        db[prefix .. "ShowHotkey"] =
            Utils.NativeDefault("BUTTON_ASSIGNMENTS", true)
        db[prefix .. "HotkeyPosition"] = "TOPLEFT"
        db[prefix .. "HotkeyX"], db[prefix .. "HotkeyY"] = 0, 0
        db[prefix .. "HotkeySize"] = 12
        db[prefix .. "ShowMacro"] =
            Utils.NativeDefault("SHOWACTIONBAR_MACRO_NAME_ENABLED", false)
        db[prefix .. "MacroPosition"] = "BOTTOM"
        db[prefix .. "MacroX"], db[prefix .. "MacroY"] = 0, 0
        db[prefix .. "MacroSize"] = 12
        if native then native.invert = nativeDefaults.invert == true end
        AB.SetMultiBarSize(selectedBar, 36)
        ApplyCurrent()
        Utils.ResetMover(info and _G[info.frame])
    end)
end
