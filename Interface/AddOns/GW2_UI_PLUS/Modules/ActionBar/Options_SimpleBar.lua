local _, addonTable = ...
local GW = _G.GW2_ADDON
if not GW or not GW.GetSettingsTabFrame then return end
local AB = addonTable.PlusActionBar
if not AB then return end
local Utils = addonTable.ActionBarOptionsUtils
if not Utils then return end

local SimpleBar = {}
addonTable.ActionBarOptionsSimpleBar = SimpleBar

function SimpleBar.AddSimpleBarOptions(panel, kind)
    local db = AB.InitDB()
    local layout = addonTable.PlusActionBarLayout
    local isStance = kind == "stance"
    local prefix = isStance and "stanceBar" or "petBar"
    local apply = isStance and layout.ApplyStanceBar or layout.ApplyPetBar
    panel:AddOption("显示" .. (isStance and "姿态条" or "宠物动作条"), nil, {
        getter = function() return db[prefix .. "Shown"] end,
        setter = function(value) db[prefix .. "Shown"] = value end,
        getDefault = function() return true end,
        callback = function() apply(); Utils.ApplyFader() end,
        isMasterToggle = true,
    })
    local countOption = panel:AddOptionSlider("按钮数", nil, {
        min = 1, max = 10, step = 1,
        getter = function() return db[prefix .. "Count"] end,
        setter = function(value) db[prefix .. "Count"] = value end,
        getDefault = function() return 10 end,
        callback = apply,
    })
    if countOption then countOption.gwPlusColumns = 2 end
    local columnsOption = panel:AddOptionSlider("行按钮数", nil, {
        min = 1, max = 10, step = 1,
        getter = function() return math.min(db[prefix .. "Columns"], db[prefix .. "Count"]) end,
        setter = function(value) db[prefix .. "Columns"] = value end,
        getDefault = function() return isStance and 1 or 5 end,
        callback = apply,
    })
    if columnsOption then columnsOption.gwPlusColumns = 2 end
    if isStance then
        panel:AddOptionDropdown("增长方向", nil, {
            optionsList = {"UP", "DOWN", "LEFT", "RIGHT"},
            optionNames = {"向上", "向下", "向左", "向右"},
            getter = function() return GW.settings.StanceBar.growDirection end,
            setter = function(value) GW.settings.StanceBar.growDirection = value end,
            getDefault = function() return "UP" end,
            callback = apply,
        })
        local sizeOption = panel:AddOptionSlider("尺寸", nil, {
            min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1,
            getter = function() return GW.settings.StanceBar.buttonSize end,
            setter = function(value) GW.settings.StanceBar.buttonSize = value end,
            getDefault = function() return 36 end,
            callback = apply,
        })
        if sizeOption then sizeOption.gwPlusColumns = 2 end
        local spacingOption = panel:AddOptionSlider("间距", nil, {
            min = 0, max = 20, step = 1,
            getter = function() return GW.settings.StanceBar.spacing end,
            setter = function(value) GW.settings.StanceBar.spacing = value end,
            getDefault = function() return 2 end,
            callback = apply,
        })
        if spacingOption then spacingOption.gwPlusColumns = 2 end
    else
        local sizeOption = panel:AddOptionSlider("尺寸", nil, {
            min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1,
            getter = function() return db.petBarSize end,
            setter = function(value) db.petBarSize = value end,
            getDefault = function() return 36 end,
            callback = apply,
        })
        if sizeOption then sizeOption.gwPlusColumns = 2 end
        local spacingOption = panel:AddOptionSlider("间距", nil, {
            min = 0, max = 20, step = 1,
            getter = function() return db.petBarSpacing end,
            setter = function(value) db.petBarSpacing = value end,
            getDefault = function() return 3 end,
            callback = apply,
        })
        if spacingOption then spacingOption.gwPlusColumns = 2 end
    end
    panel:AddGroupHeader("快捷键")
    panel:AddOption("显示快捷键", nil, {
        getter = function() return db[prefix .. "ShowHotkey"] end,
        setter = function(value) db[prefix .. "ShowHotkey"] = value end,
        getDefault = function() return true end,
        callback = apply,
        groupHeaderName = "快捷键",
    })
    local positionOption = panel:AddOptionDropdown("位置", nil, {
        optionsList = HOTKEY_POSITION_VALUES,
        optionNames = HOTKEY_POSITION_NAMES,
        getter = function() return db[prefix .. "HotkeyPosition"] end,
        setter = function(value) db[prefix .. "HotkeyPosition"] = value end,
        getDefault = function() return "TOPRIGHT" end,
        callback = apply,
        groupHeaderName = "快捷键",
    })
    if positionOption then positionOption.gwPlusColumns = 2 end
    local hotkeySizeOption = panel:AddOptionSlider("字体大小", nil, {
        min = 8, max = 48, step = 1,
        getter = function() return db[prefix .. "HotkeySize"] end,
        setter = function(value) db[prefix .. "HotkeySize"] = value end,
        getDefault = function() return 12 end,
        callback = apply,
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
            getter = function() return db[prefix .. key] end,
            setter = function(value) db[prefix .. key] = value end,
            getDefault = function() return default end,
            callback = apply,
            groupHeaderName = "快捷键",
        })
        if option then option.gwPlusColumns = 2 end
    end
    Utils.AddResetButton(panel, function()
        db[prefix .. "Shown"] = true
        db[prefix .. "Count"] = 10
        db[prefix .. "Columns"] = isStance and 1 or 5
        db[prefix .. "ShowHotkey"] = true
        db[prefix .. "HotkeyPosition"] = "TOPRIGHT"
        db[prefix .. "HotkeyX"], db[prefix .. "HotkeyY"] = 0, 0
        db[prefix .. "HotkeySize"] = 12
        if isStance then
            local stanceDefaults = Utils.NativeDefault("StanceBar", {})
            GW.settings.StanceBar.growDirection =
                stanceDefaults.growDirection or "UP"
            GW.settings.StanceBar.buttonSize = 36
            GW.settings.StanceBar.spacing = stanceDefaults.spacing or 2
        else
            db.petBarSize = 36
            db.petBarSpacing = 3
        end
        apply()
        Utils.ApplyFader()
        Utils.ResetMover(isStance and _G.GwStanceBar or _G.GwPlayerPetFrame)
    end)
end
