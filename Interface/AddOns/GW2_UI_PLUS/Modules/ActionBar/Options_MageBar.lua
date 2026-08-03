local _, addonTable = ...
-- 注意：不在顶层检查 GW2_ADDON，避免模块加载失败

local MageBar = {}
addonTable.ActionBarOptionsMageBar = MageBar

function MageBar.AddMageOptions(panel)
    -- 延迟获取依赖
    local GW = _G.GW2_ADDON
    if not GW then return end
    local AB = addonTable.PlusActionBar
    if not AB then return end
    local Utils = addonTable.ActionBarOptionsUtils
    if not Utils then return end

    local db, defaults = AB.InitDB(), AB.defaults
    local MageBar = addonTable.PlusMageBar
    local isMage = select(2, UnitClass("player")) == "MAGE"
    local function Default(key, fallback)
        return Utils.ActionBarDefault(key, fallback)
    end
    local enableOption = panel:AddOption("显示法师动作条", nil, {
        getter = function() return isMage and db.mageBarEnable end,
        setter = function(value) db.mageBarEnable = value end,
        getDefault = function()
            return Default("mageBarEnable", defaults.mageBarEnable)
        end,
        callback = function() if MageBar then MageBar.Toggle() end; Utils.ApplyFader() end,
        isMasterToggle = true,
    })
    if enableOption then
        enableOption.optionName = "GW2PlusAB_MageBarEnable"
        enableOption.gwPlusColumns = 2
        enableOption.gwPlusDisabled = not isMage
    end
    local mageDep = {["GW2PlusAB_MageBarEnable"] = true}
    local verticalOption = panel:AddOption("竖向排列", nil, {
        getter = function() return db.mageBarVertical end,
        setter = function(value) db.mageBarVertical = value end,
        getDefault = function()
            return Default("mageBarVertical", defaults.mageBarVertical)
        end,
        callback = function() if MageBar then MageBar.Update() end end,
        dependence = mageDep,
    })
    if verticalOption then
        verticalOption.gwPlusColumns = 2
        verticalOption.gwPlusDisabled = not isMage
    end
    for _, entry in ipairs({
        {"mageBarTeleport", "传送"}, {"mageBarPortal", "传送门"},
        {"mageBarFood", "造食物"}, {"mageBarWater", "造水"}, {"mageBarGem", "魔法宝石"},
    }) do
        local key, name = entry[1], entry[2]
        local option = panel:AddOption(name, nil, {
            getter = function() return db[key] end,
            setter = function(value) db[key] = value end,
            getDefault = function()
                return Default(key, defaults[key])
            end,
            callback = function() if MageBar then MageBar.Update() end end,
            dependence = mageDep,
        })
        if option then
            option.gwPlusColumns = 5
            option.gwPlusDisabled = not isMage
        end
    end
    local sizeOption = panel:AddOptionSlider("尺寸", nil, {
        min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1,
        getter = function() return db.mageBarSize end,
        setter = function(value) db.mageBarSize = value end,
        getDefault = function()
            return Default("mageBarSize", defaults.mageBarSize)
        end,
        callback = function() if MageBar then MageBar.UpdateSize() end end,
        dependence = mageDep,
    })
    if sizeOption then sizeOption.gwPlusDisabled = not isMage end
    local resetOption = Utils.AddResetButton(panel, function()
        for _, key in ipairs({
            "mageBarEnable", "mageBarSize", "mageBarVertical",
            "mageBarTeleport", "mageBarPortal", "mageBarFood",
            "mageBarWater", "mageBarGem",
        }) do
            db[key] = Default(key, defaults[key])
        end
        if MageBar then MageBar.Update() end
        Utils.ApplyFader()
        Utils.ResetMover(MageBar and MageBar.bar)
    end)
    if resetOption then resetOption.gwPlusDisabled = not isMage end
end
