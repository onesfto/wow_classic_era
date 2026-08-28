local _, addonTable = ...

local MINIMAP_DEFAULT = {
    point = "TOPRIGHT",
    relativePoint = "TOPRIGHT",
    xOfs = 0,
    yOfs = 0,
    hasMoved = false,
}
local ENERGY_BAR_DEFAULT = {
    point = "BOTTOM",
    relativePoint = "BOTTOM",
    xOfs = 0,
    yOfs = 150,
    hasMoved = false,
}
local CASTBAR_DEFAULT = {
    point = "BOTTOM",
    relativePoint = "BOTTOM",
    xOfs = 0,
    yOfs = 180,
    hasMoved = false,
}
local PLAYER_BUFF_DEFAULT = {
    point = "TOPRIGHT",
    relativePoint = "TOPRIGHT",
    xOfs = -160,
    yOfs = 0,
    hasMoved = false,
}
local PLAYER_DEBUFF_DEFAULT = {
    point = "CENTER",
    relativePoint = "CENTER",
    xOfs = -308,
    yOfs = 100,
    hasMoved = false,
}
local CLASS_POWER_DEFAULT = {
    point = "CENTER",
    relativePoint = "CENTER",
    xOfs = 0,
    yOfs = -160,
    hasMoved = false,
}
local PLAYER_FRAME_DEFAULT = {
    point = "CENTER",
    relativePoint = "CENTER",
    xOfs = -315,
    yOfs = -160,
    hasMoved = false,
}
local TARGET_FRAME_DEFAULT = {
    point = "CENTER",
    relativePoint = "CENTER",
    xOfs = 315,
    yOfs = -160,
    hasMoved = false,
}
local TARGET_TARGET_DEFAULT = {
    point = "CENTER",
    relativePoint = "CENTER",
    xOfs = 344,
    yOfs = -100,
    hasMoved = false,
}
local PET_HAPPINESS_DEFAULT = {
    point = "BOTTOM",
    relativePoint = "BOTTOM",
    xOfs = -285,
    yOfs = 205,
    hasMoved = false,
}
local PET_FEED_DEFAULT = {
    point = "BOTTOM",
    relativePoint = "BOTTOM",
    xOfs = -315,
    yOfs = 205,
    hasMoved = false,
}
local PET_FRAME_DEPENDENCE = {PETBAR_ENABLED = true}
local PLAYER_BUFFS_DEFAULT = {
    Seperate = 0,
    SortDir = "+",
    SortMethod = "INDEX",
    IconSize = 32,
    IconHeight = 32,
    KeepSizeRatio = true,
    GrowDirection = "DOWN",
    HorizontalSpacing = 0,
    VerticalSpacing = 10,
    MaxWraps = 3,
    WrapAfter = 10,
    NewAuraAnimation = true,
}
local PLAYER_BUFFS_LEGACY_DEFAULT = {
    Seperate = 0,
    SortDir = "+",
    SortMethod = "INDEX",
    IconSize = 32,
    IconHeight = 32,
    KeepSizeRatio = true,
    GrowDirection = "UP",
    HorizontalSpacing = 1,
    VerticalSpacing = 34,
    MaxWraps = 3,
    WrapAfter = 7,
    NewAuraAnimation = true,
}
local FIXED_SCALE_MOVERS = {
    {frame = "GW2UIPlayerBuffs", setting = "PlayerBuffFrame"},
    {frame = "GW2UIPlayerDebuffs", setting = "PlayerDebuffFrame"},
    {frame = "GwPlayerUnitFrame", setting = "player_pos"},
    {frame = "GwTargetUnitFrame", setting = "target_pos"},
}

local activeMover
local RefreshPanel
local auraProfileHookInstalled = false

local function IsPlusProfileDefault()
    return addonTable.PlusProfileDefaults
        and addonTable.PlusProfileDefaults.IsPlusProfileDefault
        and addonTable.PlusProfileDefaults.IsPlusProfileDefault()
end

local function CopyTable(source)
    if _G.GW2_ADDON and _G.GW2_ADDON.CopyTable then
        return _G.GW2_ADDON.CopyTable(source)
    end
    local copy = {}
    for key, value in pairs(source) do
        copy[key] = type(value) == "table" and CopyTable(value) or value
    end
    return copy
end

local function GetPathValue(root, path)
    if type(root) ~= "table" or type(path) ~= "string" then
        return nil
    end
    local value = root
    for key in string.gmatch(path, "[^%.]+") do
        if type(value) ~= "table" then return nil end
        value = value[key]
    end
    return value
end

local PLUS_PROFILE_OPTION_ALIASES = {
    GW2PlusNormalPlayerFrameEnabled = "HEALTHGLOBE_ENABLED",
    GW2PlusTargetTargetEnabled = "target_TARGET_ENABLED",
}
local PLUS_SAVED_OPTION_PATHS = {
    GW2PlusEnergyShowValue = {
        "GW2_UI_PLUS_PlayerStatusSV", "energyBarShowValue",
    },
    GW2PlusResourceShowValue = {
        "GW2_UI_PLUS_PlayerStatusSV", "resourceBarShowValue",
    },
    playerBuffAurasEnabled = {
        "GW2_UI_PLUS_SV", "playerBuffAurasEnabled",
    },
    playerDebuffAurasEnabled = {
        "GW2_UI_PLUS_SV", "playerDebuffAurasEnabled",
    },
    energyBarWidth = {
        "GW2_UI_PLUS_PlayerStatusSV", "energyBarWidth",
    },
    energyBarHeight = {
        "GW2_UI_PLUS_PlayerStatusSV", "energyBarHeight",
    },
    resourceBarWidth = {
        "GW2_UI_PLUS_PlayerStatusSV", "resourceBarWidth",
    },
    castbarWidth = {"GW2_UI_PLUS_ActionBarSV", "castbarWidth"},
    castbarHeight = {"GW2_UI_PLUS_ActionBarSV", "castbarHeight"},
}

local function GetPlusOptionDefault(optionName)
    if not IsPlusProfileDefault() or not optionName then
        return nil, false
    end

    local defaults = addonTable.PlusProfileDefaults
    if not defaults then return nil, false end

    if optionName == "XPBAR_ENABLED" then
        return defaults.GetExperienceBarDefault(), true
    end

    local profilePath = PLUS_PROFILE_OPTION_ALIASES[optionName]
        or optionName
    local value = GetPathValue(defaults.Profile, profilePath)
    if value ~= nil then return CopyTable(value), true end

    local path = PLUS_SAVED_OPTION_PATHS[optionName]
    if not path then return nil, false end
    value = defaults.SavedVariables
    for index = 1, #path do
        value = value and value[path[index]]
    end
    if value == nil then return nil, false end
    return CopyTable(value), true
end

local function ApplyOptionValue(option, value)
    if type(value) == "table" then value = CopyTable(value) end
    if option.hasCheckbox and type(option.optionsList) == "table"
        and type(value) == "table" then
        for _, optionKey in ipairs(option.optionsList) do
            if value[optionKey] ~= nil then
                option.set(value[optionKey], optionKey)
            end
        end
        if option.callback then option.callback() end
        return
    end

    option.set(value)
    if not option.callback then return end
    if option.optionType == "text" then
        local widget = option.__widget or option.__gwPlusWidget
        local input = widget and widget.inputFrame and widget.inputFrame.input
        if input then input:SetText(value or "") end
        if input then option.callback(input) end
        return
    end
    option.callback(value, option.optionName)
end

local function GetPlusMoverDefault(settingName, fallback)
    local defaults = addonTable.PlusProfileDefaults
    local value = defaults and defaults.Profile
        and defaults.Profile[settingName]
    return value or fallback
end

local function RestoreOptionDefault(option)
    if not option or option.gwPlusMoverControl
        or not option.getDefault or not option.set then
        return
    end
    if option.hasCheckbox and type(option.optionsList) == "table" then
        for _, optionKey in ipairs(option.optionsList) do
            option.set(option.getDefault(optionKey), optionKey)
        end
        if option.callback then option.callback() end
        return
    end
    ApplyOptionValue(option, option.getDefault())
end

local function SetInline(option)
    if option then option.forceNewLine = false end
    return option
end

local function SetRow(columnCount, ...)
    for index = 1, select("#", ...) do
        local option = select(index, ...)
        if option then option.gwPlusColumns = columnCount end
    end
end

local function GetMover(frameName)
    local frame = _G[frameName]
    return frame, frame and frame.gwMover
end

local function SetMoverLocked(mover, locked)
    if not mover then return end
    mover.gwPlusUnlocked = not locked
    mover:EnableMouse(not locked)
    mover:SetMovable(not locked)
    if locked then mover:Hide() else mover:Show() end
end

local function ToggleHudMover(frameName)
    local GW = _G.GW2_ADDON
    if InCombatLockdown and InCombatLockdown() then
        if GW and GW.Notice then GW.Notice("战斗中无法移动组件。") end
        return
    end
    local _, mover = GetMover(frameName)
    if not mover then
        if GW and GW.Notice then GW.Notice("该组件尚未加载。") end
        return
    end
    if mover.gwPlusUnlocked then
        SetMoverLocked(mover, true)
        activeMover = nil
        if GW and GW.Notice then GW.Notice("组件已锁定。") end
        return
    end
    SetMoverLocked(activeMover, true)
    activeMover = mover
    SetMoverLocked(mover, false)
    if GW and GW.Notice then GW.Notice("组件已解锁，可直接拖动。") end
end

local function ResetHudMover(frameName, settingName, defaultPoint)
    local GW = _G.GW2_ADDON
    local frame, mover = GetMover(frameName)
    local profile = GW and GW.globalDefault and GW.globalDefault.profile
    local point = (IsPlusProfileDefault() and defaultPoint)
        or (profile and profile[settingName])
    if not GW or not GW.settings or not point then
        return
    end
    local function Apply()
        local saved = CopyTable(point)
        GW.settings[settingName] = saved
        if not frame or not mover then return end
        mover.defaultPoint = CopyTable(point)
        mover.savedPoint = CopyTable(point)
        mover:ClearAllPoints()
        mover:SetPoint(
            point.point, UIParent, point.relativePoint,
            point.xOfs, point.yOfs)
        frame.isMoved = false
        frame:SetAttribute("isMoved", false)
        if mover.postdrag then mover.postdrag(frame) end
        if (settingName == "PlayerBuffFrame"
            or settingName == "PlayerDebuffFrame")
            and GW.UpdateAuraHeader then
            GW.UpdateAuraHeader(frame)
        end
        if GW.UpdateMatchingLayout then
            GW.UpdateMatchingLayout(mover, saved)
        end
    end
    if InCombatLockdown and InCombatLockdown() then
        if GW.CombatQueue then
            GW.CombatQueue:Queue("GW2PlusReset" .. settingName, Apply, {})
        end
    else
        Apply()
    end
end

local function ApplyMoverDefault(frameName, settingName, defaultPoint)
    local GW = _G.GW2_ADDON
    if not GW or not GW.settings or not IsPlusProfileDefault()
        or not defaultPoint then
        return
    end

    local frame, mover = GetMover(frameName)
    if mover then mover.defaultPoint = CopyTable(defaultPoint) end
    local saved = rawget(GW.settings, settingName)
    if type(saved) ~= "table" or saved.hasMoved ~= true then
        ResetHudMover(frameName, settingName, defaultPoint)
    end
end

local function RestorePanelDefaults(
    panel, frameName, settingName, defaultPoint, onComplete)
    local GW = _G.GW2_ADDON
    local options = {}
    for _, option in ipairs(panel.gwOptions or {}) do
        options[#options + 1] = option
    end
    local function Apply()
        for _, option in ipairs(options) do
            local value, hasPlusDefault =
                GetPlusOptionDefault(option.optionName)
            if hasPlusDefault and option.set then
                ApplyOptionValue(option, value)
            else
                RestoreOptionDefault(option)
            end
        end
        ResetHudMover(frameName, settingName, defaultPoint)
        RefreshPanel(panel)
        if GW and GW.CheckDependencies then GW.CheckDependencies() end
        if onComplete then onComplete() end
    end
    if InCombatLockdown and InCombatLockdown() then
        if GW and GW.CombatQueue then
            GW.CombatQueue:Queue(
                "GW2PlusRestore" .. settingName, Apply, {})
        elseif GW and GW.Notice then
            GW.Notice("战斗中无法恢复组件设置。")
        end
        return
    end
    Apply()
end

local function ApplyEnergyBarDefault()
    ApplyMoverDefault(
        "GwPlayerPowerBar", "PowerBar_pos", ENERGY_BAR_DEFAULT)
end

local function ApplyCastbarDefault()
    ApplyMoverDefault(
        "GwCastingBarPlayer", "castingbar_pos", CASTBAR_DEFAULT)
end

local function ApplyPlayerBuffSettingsDefault()
    local GW = _G.GW2_ADDON
    if not GW or not IsPlusProfileDefault() then return end

    local current = rawget(GW.settings, "PlayerBuffs")
    if type(current) ~= "table" then
        current = {}
        GW.settings.PlayerBuffs = current
    end

    local changed = false
    for key, value in pairs(PLAYER_BUFFS_DEFAULT) do
        if current[key] == nil
            or current[key] == PLAYER_BUFFS_LEGACY_DEFAULT[key] then
            current[key] = value
            changed = true
            if GW.updateSettingsFrameSettingsValue then
                GW.updateSettingsFrameSettingsValue(
                    "PlayerBuffs." .. key, value, false)
            end
        end
    end

    if changed and GW.UpdateAuraHeader and not InCombatLockdown() then
        local frame = _G.GW2UIPlayerBuffs
        if frame then GW.UpdateAuraHeader(frame) end
    end
end

local function RemoveFromList(list, value)
    if type(list) ~= "table" then return end
    for index = #list, 1, -1 do
        if list[index] == value then
            table.remove(list, index)
        end
    end
end

local function ApplyPlayerBuffScale()
    local GW = _G.GW2_ADDON
    if GW and GW.settings then
        for _, info in ipairs(FIXED_SCALE_MOVERS) do
            GW.settings[info.setting .. "_scale"] = 1
        end
    end
    if not GW then return end

    if GW.globalSettings and GW.globalSettings.RegisterCallback
        and not auraProfileHookInstalled then
        auraProfileHookInstalled = true
        GW.globalSettings.RegisterCallback(
            addonTable, "OnProfileChanged", ApplyPlayerBuffScale)
    end

    if InCombatLockdown and InCombatLockdown() then return end
    for _, info in ipairs(FIXED_SCALE_MOVERS) do
        local frame = _G[info.frame]
        if frame then
            if frame.SetScale then frame:SetScale(1) end
            local mover = frame.gwMover
            if mover then
                mover.optionScaleable = false
                RemoveFromList(GW.scaleableFrames, mover)
                RemoveFromList(GW.scaleableMainHudFrames, mover)
                if mover.SetScale then mover:SetScale(1) end
            end
        end
    end
end

function addonTable.RestorePlayerCastbarDefaults(onComplete)
    local panel = addonTable.gwPlusPlayerCastbarPanel
    if not panel then
        local GW = _G.GW2_ADDON
        local tab = GW and GW.GetSettingsTabFrame
            and GW.GetSettingsTabFrame()
        local resources = tab and tab.gwPlusPlayerResourcePanels
        panel = resources and resources.gw2_plus_player_castbar
    end
    if not panel then return false end
    RestorePanelDefaults(
        panel, "GwCastingBarPlayer", "castingbar_pos", CASTBAR_DEFAULT,
        onComplete)
    return true
end

function addonTable.RestorePlayerEnergyBarDefaults(onComplete)
    local panel = addonTable.gwPlusPlayerEnergyPanel
    if not panel then
        local GW = _G.GW2_ADDON
        local tab = GW and GW.GetSettingsTabFrame
            and GW.GetSettingsTabFrame()
        local resources = tab and tab.gwPlusPlayerResourcePanels
        panel = resources and resources.gw2_plus_player_energy
    end
    if not panel then return false end
    RestorePanelDefaults(
        panel, "GwPlayerPowerBar", "PowerBar_pos", ENERGY_BAR_DEFAULT,
        function()
            if addonTable.ApplyPlayerEnergyBarScale then
                addonTable.ApplyPlayerEnergyBarScale()
            end
            if onComplete then onComplete() end
        end)
    return true
end

local function RefreshAuraOption(option)
    if not option or not option.get then return end
    local widget = option.__widget or option.__gwPlusWidget
    if not widget then return end
    local value = option.get()
    if option.optionType == "boolean" then
        if widget.checkbutton then widget.checkbutton:SetChecked(value) end
    elseif option.optionType == "slider" then
        if widget.slider then widget.slider:SetValue(value) end
        local input = widget.inputFrame and widget.inputFrame.input
        if input then
            input:SetText(string.format(
                "%." .. (option.decimalNumbers or 0) .. "f", value))
        end
    elseif option.optionType == "dropdown" then
        if widget.dropDown and widget.dropDown.GenerateMenu then
            widget.dropDown:GenerateMenu()
        end
    elseif option.optionType == "text" then
        local input = widget.inputFrame and widget.inputFrame.input
        if input then input:SetText(value or "") end
    elseif option.optionType == "colorPicker" then
        if widget.button and widget.button.bg and type(value) == "table" then
            widget.button.bg:SetColorTexture(value.r, value.g, value.b)
        end
    elseif option.optionType == "list" and widget.RefreshList then
        widget:RefreshList()
    end
end

local function RefreshAuraPanel(panel, view)
    if not panel or not view then return end
    panel.gwOptions = view.options
    for _, option in ipairs(view.options or {}) do
        RefreshAuraOption(option)
    end
    if panel.scroll and panel.scroll.ScrollBox then
        panel.scroll.ScrollBox:SetDataProvider(
            view.provider, ScrollBoxConstants.RetainScrollPosition)
    end
    local GW = _G.GW2_ADDON
    if GW and GW.CheckDependencies then GW.CheckDependencies() end
end

RefreshPanel = function(panel)
    local auraView = panel and panel.__gwPlusActiveAuraView
    if auraView then
        RefreshAuraPanel(panel, auraView)
        return
    end
    local Utils = addonTable.ActionBarOptionsUtils
    if panel and panel.gwPlusWidgets
        and Utils and Utils.InitializePanel then
        Utils.InitializePanel(panel)
        return
    end
    local GW = _G.GW2_ADDON
    if GW and GW.RefreshSettingsPanel then GW.RefreshSettingsPanel(panel) end
end

local function ApplyMinimapDefault()
    local GW = _G.GW2_ADDON
    local saved = GW and GW.settings and rawget(GW.settings, "MinimapPos")
    if not GW or not IsPlusProfileDefault() then return end
    if type(saved) ~= "table" or saved.hasMoved ~= true then
        ResetHudMover("Minimap", "MinimapPos", MINIMAP_DEFAULT)
    end
end

local function CreateMoverControls(
    panel, frameName, settingName, defaultPoint, restorePanel,
    restoreOptions, dependence)
    local mover = SetInline(panel:AddOptionButton(
        "解锁/锁定", "解锁后可拖动组件；再次点击即可锁定。", {
            callback = function() ToggleHudMover(frameName) end,
            dependence = dependence,
        }))
    if mover then mover.gwPlusMoverControl = true end
    local resetLabel = restorePanel and "恢复默认" or "重置位置"
    local reset = SetInline(panel:AddOptionButton(
        resetLabel,
        restorePanel and "恢复当前页面的全部参数和位置。"
            or "移回默认位置。", {
            callback = function()
                if restorePanel then
                    local originalOptions
                    if restoreOptions then
                        originalOptions = panel.gwOptions
                        panel.gwOptions = restoreOptions
                    end
                    RestorePanelDefaults(
                        panel, frameName, settingName, defaultPoint)
                    if originalOptions then
                        panel.gwOptions = originalOptions
                    end
                else
                    ResetHudMover(frameName, settingName, defaultPoint)
                end
            end,
            isNegativeButton = true,
            dependence = dependence,
        }))
    if reset then reset.gwPlusMoverControl = true end
    return mover, reset
end

local function AddMoverControls(
    panel, frameName, settingName, defaultPoint, restorePanel,
    showGroupHeader)
    if not panel or panel.gwPlusMoverControls then return end
    panel.gwPlusMoverControls = true
    if showGroupHeader ~= false then
        panel:AddGroupHeader("位置")
    end
    local mover, reset = CreateMoverControls(
        panel, frameName, settingName, defaultPoint, restorePanel)
    SetRow(2, mover, reset)
    RefreshPanel(panel)
end

local function AddViewMoverControls(
    panel, view, frameName, settingName, defaultPoint, dependence)
    if not panel or not view or view.gwPlusMoverControls then return end
    local providerKind = panel.gwPlusWidgets and "plus" or "native"
    if providerKind == "native" then
        local hasPlusRows = false
        view.provider:ForEach(function(data)
            if not data.kind
                and (data.widgets or (data.option and not data.cols)) then
                hasPlusRows = true
            end
        end)
        if hasPlusRows then providerKind = "plus" end
    end
    local originalOptions = panel.gwOptions
    panel.gwOptions = {}
    local mover, reset = CreateMoverControls(
        panel, frameName, settingName, defaultPoint, true, view.options,
        dependence)
    panel.gwOptions = originalOptions
    if not mover or not reset then return end

    local moverWidget, resetWidget
    if providerKind == "plus" then
        local Utils = addonTable.ActionBarOptionsUtils
        if not Utils or not Utils.CreateOptionWidget then return end
        moverWidget = Utils.CreateOptionWidget(panel, mover)
        resetWidget = Utils.CreateOptionWidget(panel, reset)
        if not moverWidget or not resetWidget then return end
    end

    local previousOption = view.options[#view.options]
    view.options[#view.options + 1] = mover
    view.options[#view.options + 1] = reset
    SetRow(2, mover, reset)
    if previousOption and previousOption.isMasterToggle then
        view.provider:Insert({
            index = #view.options - 1,
            kind = "masterToggleSeparator",
            panel = panel,
        })
    end
    local row = {
        index = #view.options,
        panel = panel,
    }
    if providerKind == "plus" then
        row.option = mover
        row.widgets = {moverWidget, resetWidget}
        row.columnCount = 2
    else
        row.cols = {mover, reset}
    end
    view.provider:Insert(row)
    view.gwPlusMoverControls = true
end

local function AddAuraMoverControls(
    panel, view, frameName, settingName, defaultPoint)
    AddViewMoverControls(
        panel, view, frameName, settingName, defaultPoint)
end

local function AddPanelRestoreControl(panel)
    if not panel or panel.gwPlusPanelRestoreControl then return end
    panel.gwPlusPanelRestoreControl = true
    panel:AddOptionButton(
        "恢复默认", "恢复当前页面的全部参数。", {
            callback = function()
                RestorePanelDefaults(panel)
            end,
            isNegativeButton = true,
        })
    RefreshPanel(panel)
end

function addonTable.BuildHudMoverOptions(settingsTab)
    local GW = _G.GW2_ADDON
    local tab = settingsTab or (GW and GW.GetSettingsTabFrame
        and GW.GetSettingsTabFrame())
    local pages = tab and tab.gwPlusEmbeddedPanels
    if not pages then return false end
    local resources = tab.gwPlusPlayerResourcePanels or {}
    addonTable.gwPlusPlayerCastbarPanel = resources.gw2_plus_player_castbar
    addonTable.gwPlusPlayerEnergyPanel = resources.gw2_plus_player_energy
    local playerDefault = GetPlusMoverDefault(
        "player_pos", PLAYER_FRAME_DEFAULT)
    local debuffDefault = GetPlusMoverDefault(
        "PlayerDebuffFrame", PLAYER_DEBUFF_DEFAULT)
    local classPowerDefault = GetPlusMoverDefault(
        "ClasspowerBar_pos", CLASS_POWER_DEFAULT)
    local targetDefault = GetPlusMoverDefault(
        "target_pos", TARGET_FRAME_DEFAULT)
    ApplyMinimapDefault()
    ApplyCastbarDefault()
    ApplyEnergyBarDefault()
    ApplyPlayerBuffSettingsDefault()
    ApplyMoverDefault(
        "GW2UIPlayerBuffs", "PlayerBuffFrame", PLAYER_BUFF_DEFAULT)
    ApplyMoverDefault(
        "GW2UIPlayerDebuffs", "PlayerDebuffFrame", debuffDefault)
    ApplyMoverDefault(
        "GwPlayerClassPower", "ClasspowerBar_pos", classPowerDefault)
    ApplyMoverDefault(
        "GwPlayerUnitFrame", "player_pos", playerDefault)
    ApplyMoverDefault(
        "GwTargetUnitFrame", "target_pos", targetDefault)
    ApplyPlayerBuffScale()
    local microPanel = pages and pages.hud_microbar
    local minimapPanel = pages and pages.hud_minimap
    AddMoverControls(
        microPanel, "Gw2MicroBarFrame", "MicromenuPos")
    AddMoverControls(
        minimapPanel, "Minimap", "MinimapPos", MINIMAP_DEFAULT,
        false, false)
    AddMoverControls(
        pages.player_general,
        "GwPlayerUnitFrame", "player_pos", playerDefault, true, false)
    local auraPanel = pages.player_aura
    local auraViews = auraPanel and auraPanel.__gwPlusAuraViews
    if auraViews then
        AddAuraMoverControls(
            auraPanel, auraViews.buff,
            "GW2UIPlayerBuffs", "PlayerBuffFrame", PLAYER_BUFF_DEFAULT)
        AddAuraMoverControls(
            auraPanel, auraViews.debuff,
            "GW2UIPlayerDebuffs", "PlayerDebuffFrame", debuffDefault)
    end
    AddMoverControls(
        resources.gw2_plus_player_castbar,
        "GwCastingBarPlayer", "castingbar_pos", CASTBAR_DEFAULT,
        true, false)
    AddMoverControls(
        resources.gw2_plus_player_energy,
        "GwPlayerPowerBar", "PowerBar_pos", ENERGY_BAR_DEFAULT,
        true, false)
    AddMoverControls(
        resources.gw2_plus_player_resource,
        "GwPlayerClassPower", "ClasspowerBar_pos", classPowerDefault,
        true, false)
    local targetViews = pages.target_general
        and pages.target_general.__gwPlusTargetViews
    AddViewMoverControls(
        pages.target_general,
        targetViews and targetViews.target_general,
        "GwTargetUnitFrame", "target_pos", targetDefault)
    local targetTargetState = pages.target_of_target
        and pages.target_of_target.__gwPlusTargetTargetFaderState
    AddViewMoverControls(
        pages.target_of_target,
        targetTargetState and targetTargetState.views.general,
        "GwTargetTargetUnitFrame", "targettarget_pos",
        GetPlusMoverDefault("targettarget_pos", TARGET_TARGET_DEFAULT))
    local petState = pages.player_pet
        and pages.player_pet.__gwPlusPetFaderState
    AddViewMoverControls(
        pages.player_pet,
        petState and petState.views.general,
        "GwPlayerPetFrame", "pet_pos", nil, PET_FRAME_DEPENDENCE)
    AddViewMoverControls(
        pages.player_pet,
        petState and petState.views.happiness,
        "GwPlusPetHappiness", "PetHappiness_pos", PET_HAPPINESS_DEFAULT,
        PET_FRAME_DEPENDENCE)
    AddViewMoverControls(
        pages.player_pet,
        petState and petState.views.feed,
        "GwPlusPetFeed", "PetFeed_pos", PET_FEED_DEFAULT,
        PET_FRAME_DEPENDENCE)
    AddPanelRestoreControl(resources.gw2_plus_player_globe)
    return true
end

local attempts = 0
local function WaitForPanels()
    if addonTable.BuildHudMoverOptions() then return end
    attempts = attempts + 1
    if attempts < 30 then C_Timer.After(0.5, WaitForPanels) end
end

local events = CreateFrame("Frame")
events:RegisterEvent("PLAYER_LOGIN")
events:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    C_Timer.After(0, WaitForPanels)
end)
