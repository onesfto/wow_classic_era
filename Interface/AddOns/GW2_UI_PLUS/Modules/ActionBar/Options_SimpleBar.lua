local _, addonTable = ...
-- 注意：不在顶层检查 GW2_ADDON，避免模块加载失败

local SimpleBar = {}
addonTable.ActionBarOptionsSimpleBar = SimpleBar

function SimpleBar.ResetPetBarLayout()
    local AB = addonTable.PlusActionBar
    if not AB then return end
    local db = AB.InitDB()
    local maximum = NUM_PET_ACTION_SLOTS or 10
    db.petBarSize = 36
    db.petBarSpacing = 3
    db.petBarCount = maximum
    db.petBarColumns = math.min(5, maximum)
    db.petBarMiddleGap = 0
end

function SimpleBar.AddPetBarLayoutOptions(panel, apply, dependence)
    local AB = addonTable.PlusActionBar
    if not panel or not AB then return end
    local db = AB.InitDB()
    local maximum = NUM_PET_ACTION_SLOTS or 10
    local groupName = "技能条"
    local header = panel:AddGroupHeader(groupName, {dependence = dependence})
    local function Config(name, key, optionName, minimum, maximumValue, default)
        local option = panel:AddOptionSlider(name, nil, {
            min = minimum, max = maximumValue, step = 1,
            getter = function() return db[key] end,
            setter = function(value) db[key] = value end,
            getDefault = function() return default end,
            callback = apply,
            dependence = dependence,
            groupHeaderName = groupName,
        })
        if option then option.optionName = optionName end
        if option then option.gwPlusColumns = 2 end
        return option
    end
    local size = Config("尺寸", "petBarSize", "GW2PlusPetBarSize",
        AB.SIZE_MIN, AB.SIZE_MAX, 36)
    local spacing = Config("间距", "petBarSpacing", "GW2PlusPetBarSpacing",
        0, 20, 3)
    local count = Config("按钮数", "petBarCount", "GW2PlusPetBarCount",
        1, maximum, maximum)
    local columns = panel:AddOptionSlider("行按钮数", nil, {
        min = 1, max = maximum, step = 1,
        getter = function()
            return math.min(db.petBarColumns, db.petBarCount)
        end,
        setter = function(value) db.petBarColumns = value end,
        getDefault = function() return 5 end,
        callback = apply,
        dependence = dependence,
        groupHeaderName = groupName,
    })
    if columns then
        columns.optionName = "GW2PlusPetBarColumns"
        columns.gwPlusColumns = 2
    end
    local middleGap = Config("中间空隙", "petBarMiddleGap",
        "GW2PlusPetBarMiddleGap", 0, 400, 0)
    return header, size, spacing, count, columns, middleGap
end

function SimpleBar.AddSimpleBarOptions(panel, kind)
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
    local layout = addonTable.PlusActionBarLayout
    local isStance = kind == "stance"
    local prefix = isStance and "stanceBar" or "petBar"
    local function Default(key, fallback)
        if not isStance then return fallback end
        return Utils.ActionBarDefault(key, fallback)
    end
    local apply = isStance and layout.ApplyStanceBar or layout.ApplyPetBar
    panel:AddOption("显示" .. (isStance and "姿态条" or "宠物动作条"), nil, {
        getter = function() return db[prefix .. "Shown"] end,
        setter = function(value) db[prefix .. "Shown"] = value end,
        getDefault = function()
            return Default(prefix .. "Shown", true)
        end,
        callback = function() apply(); Utils.ApplyFader() end,
        isMasterToggle = true,
    })
    if isStance then
        panel:AddOptionDropdown("收纳按钮", "控制姿态条收纳按钮的显示方式。", {
            optionsList = {"show", "hide", "hover"},
            optionNames = {"显示", "隐藏", "悬停显示"},
            getter = function() return db.stanceBarCollapseButton end,
            setter = function(value) db.stanceBarCollapseButton = value end,
            getDefault = function()
                return Default("stanceBarCollapseButton", "hover")
            end,
            callback = apply,
        })
    end
    if isStance then
        local countOption = panel:AddOptionSlider("按钮数", nil, {
            min = 1, max = 10, step = 1,
            getter = function() return db[prefix .. "Count"] end,
            setter = function(value) db[prefix .. "Count"] = value end,
            getDefault = function()
                return Default(prefix .. "Count", 10)
            end,
            callback = apply,
        })
        if countOption then countOption.gwPlusColumns = 2 end
        local columnsOption = panel:AddOptionSlider("行按钮数", nil, {
            min = 1, max = 10, step = 1,
            getter = function()
                return math.min(db[prefix .. "Columns"], db[prefix .. "Count"])
            end,
            setter = function(value) db[prefix .. "Columns"] = value end,
            getDefault = function()
                return Default(prefix .. "Columns", 1)
            end,
            callback = apply,
        })
        if columnsOption then columnsOption.gwPlusColumns = 2 end
        panel:AddOptionDropdown("增长方向", nil, {
            optionsList = {"UP", "DOWN", "LEFT", "RIGHT"},
            optionNames = {"向上", "向下", "向左", "向右"},
            getter = function() return GW.settings.StanceBar.growDirection end,
            setter = function(value) GW.settings.StanceBar.growDirection = value end,
            getDefault = function()
                local native = Utils.NativeDefault("StanceBar", {})
                return Default("StanceBar.growDirection",
                    native.growDirection or "UP")
            end,
            callback = apply,
        })
        local sizeOption = panel:AddOptionSlider("尺寸", nil, {
            min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1,
            getter = function() return GW.settings.StanceBar.buttonSize end,
            setter = function(value) GW.settings.StanceBar.buttonSize = value end,
            getDefault = function()
                local native = Utils.NativeDefault("StanceBar", {})
                return Default("StanceBar.buttonSize",
                    native.buttonSize or 36)
            end,
            callback = apply,
        })
        if sizeOption then sizeOption.gwPlusColumns = 2 end
        local spacingOption = panel:AddOptionSlider("间距", nil, {
            min = 0, max = 20, step = 1,
            getter = function() return GW.settings.StanceBar.spacing end,
            setter = function(value) GW.settings.StanceBar.spacing = value end,
            getDefault = function()
                local native = Utils.NativeDefault("StanceBar", {})
                return Default("StanceBar.spacing", native.spacing or 2)
            end,
            callback = apply,
        })
        if spacingOption then spacingOption.gwPlusColumns = 2 end
    else
        SimpleBar.AddPetBarLayoutOptions(panel, apply)
    end
    panel:AddGroupHeader("快捷键")
    panel:AddOption("显示快捷键", nil, {
        getter = function() return db[prefix .. "ShowHotkey"] end,
        setter = function(value) db[prefix .. "ShowHotkey"] = value end,
        getDefault = function()
            return Default(prefix .. "ShowHotkey", true)
        end,
        callback = apply,
        groupHeaderName = "快捷键",
    })
    local positionOption = panel:AddOptionDropdown("位置", nil, {
        optionsList = HOTKEY_POSITION_VALUES,
        optionNames = HOTKEY_POSITION_NAMES,
        getter = function() return db[prefix .. "HotkeyPosition"] end,
        setter = function(value) db[prefix .. "HotkeyPosition"] = value end,
        getDefault = function()
            return Default(prefix .. "HotkeyPosition", "TOPRIGHT")
        end,
        callback = apply,
        groupHeaderName = "快捷键",
    })
    if positionOption then positionOption.gwPlusColumns = 2 end
    local hotkeySizeOption = panel:AddOptionSlider("字体大小", nil, {
        min = 8, max = 48, step = 1,
        getter = function() return db[prefix .. "HotkeySize"] end,
        setter = function(value) db[prefix .. "HotkeySize"] = value end,
        getDefault = function()
            return Default(prefix .. "HotkeySize", 12)
        end,
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
            getDefault = function()
                return Default(prefix .. key, default)
            end,
            callback = apply,
            groupHeaderName = "快捷键",
        })
        if option then option.gwPlusColumns = 2 end
    end
    Utils.AddResetButton(panel, function()
        db[prefix .. "Shown"] = Default(prefix .. "Shown", true)
        db[prefix .. "Count"] = Default(prefix .. "Count", 10)
        db[prefix .. "Columns"] = Default(
            prefix .. "Columns", isStance and 1 or 5)
        db[prefix .. "ShowHotkey"] = Default(
            prefix .. "ShowHotkey", true)
        db[prefix .. "HotkeyPosition"] = Default(
            prefix .. "HotkeyPosition", "TOPRIGHT")
        db[prefix .. "HotkeyX"] = Default(prefix .. "HotkeyX", 0)
        db[prefix .. "HotkeyY"] = Default(prefix .. "HotkeyY", 0)
        db[prefix .. "HotkeySize"] = Default(prefix .. "HotkeySize", 12)
        if isStance then
            db.stanceBarCollapseButton = Default(
                "stanceBarCollapseButton", "hover")
            if GW.settings.StanceBar then
                GW.settings.StanceBar.containerState = "open"
            end
            local stanceDefaults = Utils.ActionBarDefault(
                "StanceBar", Utils.NativeDefault("StanceBar", {}))
            GW.settings.StanceBar.growDirection =
                stanceDefaults.growDirection or "UP"
            GW.settings.StanceBar.buttonSize =
                stanceDefaults.buttonSize or 36
            GW.settings.StanceBar.spacing = stanceDefaults.spacing or 2
        else
            SimpleBar.ResetPetBarLayout()
        end
        apply()
        Utils.ApplyFader()
        local moverFrame
        if isStance then
            moverFrame = _G.GwStanceBar
        elseif layout and layout.EnsurePetBar then
            moverFrame = layout.EnsurePetBar()
        end
        Utils.ResetMover(moverFrame)
    end)
end
