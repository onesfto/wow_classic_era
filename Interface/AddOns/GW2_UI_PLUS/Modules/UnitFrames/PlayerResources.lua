local _, addonTable = ...
-- 模块级变量，延迟初始化避免顶层依赖检查失败
local GW, AB, Utils

local function EnsureDeps()
    if GW then return true end -- 已初始化
    GW = _G.GW2_ADDON
    AB = addonTable.PlusActionBar
    Utils = addonTable.ActionBarOptionsUtils
    if not GW or not AB or not Utils then
        return false
    end
    return true
end

local STATUS_DEFAULTS = {
    energyBarShowValue = true,
    energyBarWidth = 300,
    energyBarHeight = 15,
    resourceBarShowValue = true,
    resourceBarWidth = 300,
}
local MOVED_GENERAL_OPTION_NAMES = {
    HEALTHGLOBE_ENABLED = true,
    POWERBAR_ENABLED = true,
    PLAYER_AS_TARGET_FRAME = true,
    showDodgebar = true,
    PLAYER_TRACKED_DODGEBAR_SPELL = true,
}
local GENERAL_OPTION_ORDER = {
    "PLAYER_AS_TARGET_FRAME_ALT_BACKGROUND",
    "player_CLASS_COLOR",
    "PLAYER_SHOW_PVP_INDICATOR",
    "PLAYER_UNIT_HEALTH",
    "playerFrameHealthBarTexture",
}
local GENERAL_OPTION_NAMES = {}
for _, optionName in ipairs(GENERAL_OPTION_ORDER) do
    GENERAL_OPTION_NAMES[optionName] = true
end
local function SetRow(columnCount, ...)
    for index = 1, select("#", ...) do
        local option = select(index, ...)
        if option then option.gwPlusColumns = columnCount end
    end
end
local resourcePanels
local hooksInstalled = false
local profileHookInstalled = false
local RefreshResourcePanels
local InitStatusDB
local ApplyEnergyBarSize
local ApplyEnergyBarScale
local GetEnergyBarSize
local SetEnergyBarSize
local ApplyResourceBarSize
local GetResourceBarWidth
local SetResourceBarWidth

local function GetCastbarDefaultWidth()
    return AB and AB.defaults and AB.defaults.castbarWidth or 300
end

local function GetCastbarDefaultHeight()
    return AB and AB.defaults and AB.defaults.castbarHeight or 15
end

InitStatusDB = function()
    GW2_UI_PLUS_PlayerStatusSV = GW2_UI_PLUS_PlayerStatusSV or {}
    for key, value in pairs(STATUS_DEFAULTS) do
        if GW2_UI_PLUS_PlayerStatusSV[key] == nil then
            GW2_UI_PLUS_PlayerStatusSV[key] = value
        end
    end
    local energyWidth = tonumber(GW2_UI_PLUS_PlayerStatusSV.energyBarWidth)
    if not energyWidth or energyWidth < 100 or energyWidth > 600 then
        GW2_UI_PLUS_PlayerStatusSV.energyBarWidth = STATUS_DEFAULTS.energyBarWidth
    else
        GW2_UI_PLUS_PlayerStatusSV.energyBarWidth = energyWidth
    end
    local energyHeight = tonumber(GW2_UI_PLUS_PlayerStatusSV.energyBarHeight)
    if not energyHeight or energyHeight < 1 or energyHeight > 100 then
        GW2_UI_PLUS_PlayerStatusSV.energyBarHeight = STATUS_DEFAULTS.energyBarHeight
    else
        GW2_UI_PLUS_PlayerStatusSV.energyBarHeight = energyHeight
    end
    local resourceWidth = tonumber(
        GW2_UI_PLUS_PlayerStatusSV.resourceBarWidth)
    if not resourceWidth or resourceWidth < 100 or resourceWidth > 600 then
        GW2_UI_PLUS_PlayerStatusSV.resourceBarWidth = STATUS_DEFAULTS.resourceBarWidth
    else
        GW2_UI_PLUS_PlayerStatusSV.resourceBarWidth = resourceWidth
    end
    return GW2_UI_PLUS_PlayerStatusSV
end
local function FindOption(options, optionName)
    for _, option in ipairs(options or {}) do
        if option.optionName == optionName then
            return option
        end
    end
end
local function CloneOption(
    source, name, groupName, columns, dependence)
    if not source then return end
    local clone = {}
    for key, value in pairs(source) do
        if key ~= "__widget" and key ~= "__gwPlusWidget" then
            clone[key] = value
        end
    end
    clone.name = name or source.name
    clone.groupHeaderName = groupName
    clone.gwPlusColumns = columns
    if dependence ~= nil then
        clone.dependence = dependence
    end
    return clone
end
local function RemoveOptionDependency(option, dependencyName)
    if not option then return end
    local dependence = option.dependence
    if dependence then
        dependence[dependencyName] = nil
        if not next(dependence) then
            option.dependence = nil
        end
    end
    local widget = option.__widget
    if widget then
        local widgetDependence = widget.dependence
        if widgetDependence then
            widgetDependence[dependencyName] = nil
            if not next(widgetDependence) then
                widget.dependence = nil
            end
        end
        widget.dependenciesInfo = nil
    end
end
local function PrepareGeneralPanel(playerGeneral)
    if playerGeneral.__gwPlusGeneralPrepared then return end
    local kept = {}
    local grouped = {}
    for _, option in ipairs(playerGeneral.gwOptions or {}) do
        if option.hidden then
            if option.__widget then option.__widget:Hide() end
        elseif not MOVED_GENERAL_OPTION_NAMES[option.optionName] then
            RemoveOptionDependency(option, "PLAYER_AS_TARGET_FRAME")
            if GENERAL_OPTION_NAMES[option.optionName] then
                grouped[option.optionName] = option
            else
                kept[#kept + 1] = option
            end
        else
            if option.__widget then
                option.__widget:Hide()
            end
        end
    end
    local normalPlayerFrame = playerGeneral:AddOption(
        "启用", "只控制普通玩家框体，不影响球状血条。", {
            getter = AB.IsNormalPlayerFrameEnabled,
            setter = AB.SetNormalPlayerFrameEnabled,
            getDefault = function() return true end,
            callback = function()
                AB.SyncPlayerHudEnabled()
                if GW.updateSettingsFrameSettingsValue then
                    GW.updateSettingsFrameSettingsValue(
                        "HEALTHGLOBE_ENABLED",
                        GW.settings.HEALTHGLOBE_ENABLED, false)
                end
                AB.ApplyNormalPlayerFrameVisibility()
                if addonTable.PlusEnergyTicker then
                    addonTable.PlusEnergyTicker.Refresh()
                end
            end,
            isMasterToggle = true,
    })
    normalPlayerFrame.optionName = "GW2PlusNormalPlayerFrameEnabled"
    playerGeneral.gwOptions = {normalPlayerFrame}
    for _, optionName in ipairs(GENERAL_OPTION_ORDER) do
        local option = grouped[optionName]
        if option then
            option.gwPlusColumns = nil
            playerGeneral.gwOptions[#playerGeneral.gwOptions + 1] = option
        end
    end
    for _, option in ipairs(kept) do
        option.gwPlusColumns = nil
        playerGeneral.gwOptions[#playerGeneral.gwOptions + 1] = option
    end
    SetRow(3,
        grouped["PLAYER_AS_TARGET_FRAME_ALT_BACKGROUND"],
        grouped["player_CLASS_COLOR"],
        grouped["PLAYER_SHOW_PVP_INDICATOR"])
    playerGeneral.gwPlusColumnGap = 8
    Utils.InitializePanel(playerGeneral)
    C_Timer.After(0, function()
        if playerGeneral.gwOptions then
            Utils.InitializePanel(playerGeneral)
        end
    end)
    playerGeneral.__gwPlusGeneralPrepared = true
end
local function ClearBarText(bar)
    if not bar then return end
    if bar.label then bar.label:SetText("") end
    if bar.powerBarString then bar.powerBarString:SetText("") end
end
local function RemoveFromList(list, value)
    if type(list) ~= "table" then return end
    for index = #list, 1, -1 do
        if list[index] == value then
            table.remove(list, index)
        end
    end
end
ApplyEnergyBarScale = function()
    local bar = _G.GwPlayerPowerBar
    local function Apply()
        if GW.settings then GW.settings.PowerBar_pos_scale = 1 end
        if not bar then return end
        if bar.SetScale then bar:SetScale(1) end
        if bar.gwMover then
            bar.gwMover.optionScaleable = false
            RemoveFromList(GW.scaleableFrames, bar.gwMover)
            RemoveFromList(GW.scaleableMainHudFrames, bar.gwMover)
            if bar.gwMover.SetScale then bar.gwMover:SetScale(1) end
        end
    end
    if bar and AB and AB.QueueOutOfCombat
        and AB.QueueOutOfCombat("energyBarScale", Apply) then
        return
    end
    Apply()
end
ApplyEnergyBarSize = function()
    ApplyEnergyBarScale()
    local bar = _G.GwPlayerPowerBar
    if not bar then return end
    local status = InitStatusDB()
    local width = tonumber(status.energyBarWidth) or STATUS_DEFAULTS.energyBarWidth
    local height = tonumber(status.energyBarHeight) or STATUS_DEFAULTS.energyBarHeight
    bar:SetSize(width, height)
    if bar.decay then
        bar.decay:SetSize(width, height)
    end
end
GetEnergyBarSize = function()
    local status = InitStatusDB()
    return status.energyBarWidth, status.energyBarHeight
end
SetEnergyBarSize = function(width, height, apply)
    local status = InitStatusDB()
    width = tonumber(width)
    height = tonumber(height)
    if width then
        status.energyBarWidth = math.max(100, math.min(600, width))
    end
    if height then
        status.energyBarHeight = math.max(1, math.min(100, height))
    end
    if apply ~= false then ApplyEnergyBarSize() end
end
addonTable.GetPlayerEnergyBarSize = GetEnergyBarSize
addonTable.SetPlayerEnergyBarSize = SetEnergyBarSize
addonTable.ApplyPlayerEnergyBarScale = ApplyEnergyBarScale

local function ApplyResourceBarScale()
    if not GW or not GW.settings then return end
    GW.settings.ClasspowerBar_pos_scale = 1

    local classPower = _G.GwPlayerClassPower
    if not classPower then return end
    classPower:SetScale(1)
    local mover = classPower.gwMover
    if not mover then return end
    mover.optionScaleable = false
    RemoveFromScaleList(GW.scaleableFrames, mover)
    RemoveFromScaleList(GW.scaleableMainHudFrames, mover)
    mover:SetScale(1)
end

local function GetResourceBars(classPower)
    local bars = {
        classPower.defaultResourceBar,
        classPower.customResourceBar,
        classPower.exbar,
        classPower.exbarSecret,
        classPower.lmb,
        classPower.lmbSecret,
    }
    return bars
end

local function CaptureResourceBarRatio(bar)
    if bar.gwPlusResourceBarRatio then
        return bar.gwPlusResourceBarRatio
    end
    local width, height = bar:GetSize()
    if not width or not height or width <= 0 or height <= 0 then
        return nil
    end
    bar.gwPlusResourceBarRatio = height / width
    return bar.gwPlusResourceBarRatio
end

ApplyResourceBarSize = function()
    local status = InitStatusDB()
    local width = tonumber(status.resourceBarWidth)
        or STATUS_DEFAULTS.resourceBarWidth
    ApplyResourceBarScale()

    local classPower = _G.GwPlayerClassPower
    if not classPower then return end
    for _, bar in ipairs(GetResourceBars(classPower)) do
        if bar then
            local ratio = CaptureResourceBarRatio(bar)
            if ratio then
                local height = math.max(1, width * ratio)
                bar:SetSize(width, height)
                if bar.decay then
                    bar.decay:SetSize(width, height)
                end
                if bar.runicmask then
                    bar.runicmask:SetSize(width, height)
                end
            end
        end
    end
end

GetResourceBarWidth = function()
    return tonumber(InitStatusDB().resourceBarWidth)
        or STATUS_DEFAULTS.resourceBarWidth
end

SetResourceBarWidth = function(width, apply)
    width = tonumber(width)
    if width then
        InitStatusDB().resourceBarWidth = math.max(100, math.min(600, width))
    end
    if apply ~= false then ApplyResourceBarSize() end
end

addonTable.GetPlayerResourceBarWidth = GetResourceBarWidth
addonTable.SetPlayerResourceBarWidth = SetResourceBarWidth
addonTable.ApplyPlayerResourceBarSize = ApplyResourceBarSize
local function ApplyEnergyValueVisibility()
    local show = InitStatusDB().energyBarShowValue == true
    local bars = {
        _G.GwPlayerPowerBar,
        _G.GwPlayerUnitFrame and _G.GwPlayerUnitFrame.powerbar,
    }
    for _, bar in pairs(bars) do
        if bar then
            bar.showBarValues = show
            if show and bar.UpdatePowerData then
                bar:UpdatePowerData()
            elseif not show then
                ClearBarText(bar)
            end
        end
    end
end
local function ApplyResourceValueVisibility()
    local show = InitStatusDB().resourceBarShowValue == true
    local classPower = _G.GwPlayerClassPower
    if not classPower then return end
    local bars = {
        classPower.exbar,
        classPower.lmb,
    }
    if GW.Retail then
        bars[#bars + 1] = classPower.exbarSecret
        bars[#bars + 1] = classPower.lmbSecret
    end
    for _, bar in pairs(bars) do
        if bar then
            bar.showBarValues = show
            if not show then ClearBarText(bar) end
        end
    end
    if show then
        if classPower.exbar and classPower.exbar.UpdatePowerData then
            classPower.exbar:UpdatePowerData()
        end
        if classPower.lmb and classPower.lmb.UpdatePowerData then
            classPower.lmb:UpdatePowerData(0, "MANA")
        end
        if GW.Retail then
            if classPower.exbarSecret
                and classPower.exbarSecret.UpdatePowerData then
                classPower.exbarSecret:UpdatePowerData()
            end
            if classPower.lmbSecret
                and classPower.lmbSecret.UpdatePowerData then
                classPower.lmbSecret:UpdatePowerData(0, "MANA")
            end
        end
    end
end
local function ApplyValueVisibility()
    ApplyEnergyValueVisibility()
    ApplyResourceValueVisibility()
end
local function SyncAdditionalEnergyBar()
    if not GW.settings then return end
    ApplyEnergyBarSize()
    GW.settings.PLAYER_AS_TARGET_FRAME_SHOW_RESSOURCEBAR =
        GW.settings.POWERBAR_ENABLED == true
    if _G.GwPlayerPowerBar and _G.GwPlayerPowerBar.ToggleBar then
        _G.GwPlayerPowerBar:ToggleBar()
    end
    if _G.GwPlayerClassPower and GW.UpdateClassPowerExtraManabar then
        GW.UpdateClassPowerExtraManabar()
    end
    if addonTable.PlusEnergyTicker then
        addonTable.PlusEnergyTicker.Refresh()
    end
end
local function QueueValueRefresh()
    C_Timer.After(0, function()
        ApplyEnergyBarSize()
        ApplyResourceBarSize()
        ApplyValueVisibility()
        if addonTable.PlusEnergyTicker then
            addonTable.PlusEnergyTicker.Refresh()
        end
    end)
end
local function InstallValueHooks()
    if hooksInstalled then return end
    hooksInstalled = true
    if _G.GwPlayerPowerBarMixin
        and _G.GwPlayerPowerBarMixin.ToggleSettings then
        hooksecurefunc(
            _G.GwPlayerPowerBarMixin, "ToggleSettings", QueueValueRefresh)
    end
    if _G.GwPlayerUnitFrameMixin
        and _G.GwPlayerUnitFrameMixin.ToggleSettings then
        hooksecurefunc(
            _G.GwPlayerUnitFrameMixin, "ToggleSettings", QueueValueRefresh)
    end
    if GW.UpdateClasspowerSetting then
        hooksecurefunc(GW, "UpdateClasspowerSetting", QueueValueRefresh)
    end
    if GW.UpdateClassPowerExtraManabar then
        hooksecurefunc(
            GW, "UpdateClassPowerExtraManabar", QueueValueRefresh)
    end
end
local function InstallProfileHook()
    if profileHookInstalled
        or not GW.globalSettings
        or not GW.globalSettings.RegisterCallback then
        return
    end
    profileHookInstalled = true
    GW.globalSettings.RegisterCallback(
        resourcePanels, "OnProfileChanged", function()
            SyncAdditionalEnergyBar()
            QueueValueRefresh()
            if RefreshResourcePanels then RefreshResourcePanels() end
        end)
end
local function GetSettingByPath(path)
    local value = GW.settings
    for key in string.gmatch(path or "", "[^%.]+") do
        if type(value) ~= "table" then return nil end
        value = value[key]
    end
    return value
end
local function SetWidgetEnabled(widget, enabled)
    if not widget or not widget.title then return end
    widget:SetAlpha(enabled and 1 or 0.55)
    if widget.optionType == "button" then
        if enabled then
            if widget.Enable then widget:Enable() end
        elseif widget.Disable then
            widget:Disable()
        end
        return
    end
    if widget.optionType == "header"
        or widget.optionType == "subHeader" then
        widget.title:SetTextColor(
            GW.Colors.TextColors.LightHeader:GetRGB())
        return
    end
    if widget.isMasterToggle then
        widget.title:SetTextColor(
            GW.Colors.TextColors.LightHeader:GetRGB())
    else
        widget.title:SetTextColor(
            enabled and 1 or 0.4,
            enabled and 1 or 0.4,
            enabled and 1 or 0.4)
    end
    if widget.optionType == "boolean" and widget.checkbutton then
        if enabled then
            widget.checkbutton:Enable()
        else
            widget.checkbutton:Disable()
        end
    elseif widget.optionType == "slider" then
        if widget.slider then
            if enabled then widget.slider:Enable() else widget.slider:Disable() end
        end
        if widget.inputFrame and widget.inputFrame.input then
            widget.inputFrame.input:SetEnabled(enabled)
        end
    elseif widget.optionType == "dropdown" and widget.dropDown then
        if enabled then
            widget.dropDown:Enable()
        else
            widget.dropDown:Disable()
        end
    elseif widget.optionType == "text"
        and widget.inputFrame and widget.inputFrame.input then
        widget.inputFrame.input:SetEnabled(enabled)
    end
end
local function DependencyMatches(current, expected)
    if type(expected) ~= "table" then return current == expected end
    for _, value in ipairs(expected) do
        if current == value then return true end
    end
    return false
end
local function ApplyPanelDependencies(panel)
    local byOptionName = {}
    for _, widget in ipairs(panel.gwPlusWidgets or {}) do
        if widget.optionName then
            byOptionName[widget.optionName] = widget
        end
    end
    for _, widget in ipairs(panel.gwPlusWidgets or {}) do
        local enabled = true
        for settingName, expected in pairs(widget.dependence or {}) do
            local source = byOptionName[settingName]
            local current
            if source and source.get then
                current = source.get()
            else
                current = GetSettingByPath(settingName)
            end
            if not DependencyMatches(current, expected) then
                enabled = false
                break
            end
        end
        SetWidgetEnabled(widget, enabled)
    end
end
local function RefreshResourcePanel(panel)
    Utils.RefreshPanel(panel)
    ApplyPanelDependencies(panel)
end
local function WrapRefreshCallback(panel, option)
    local original = option.callback
    option.callback = function(...)
        if original then original(...) end
        C_Timer.After(0, function()
            RefreshResourcePanel(panel)
        end)
    end
    return option
end
local function AddClonedOption(
    panel, source, name, groupName, columns, dependence, refresh)
    local option = CloneOption(
        source, name, groupName, columns, dependence)
    if not option then return end
    if refresh then WrapRefreshCallback(panel, option) end
    panel.gwOptions[#panel.gwOptions + 1] = option
    return option
end
local function SetOptionColumns(option, columns, optionName)
    if not option then return end
    option.gwPlusColumns = columns
    if optionName then option.optionName = optionName end
end
local function CreateResourcePanel(parent, panelId, breadcrumb, sub)
    local panel = CreateFrame(
        "Frame", nil, parent, "GwSettingsPanelTmpl")
    panel.panelId = panelId
    panel.gwPlusColumnGap = 8
    panel.gwOptions = {}
    panel.header:SetFont(
        DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 20)
    panel.header:SetTextColor(
        GW.Colors.TextColors.LightHeader:GetRGB())
    panel.header:SetText("玩家")
    panel.breadcrumb:SetFont(
        DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
    panel.breadcrumb:SetTextColor(
        GW.Colors.TextColors.LightHeader:GetRGB())
    panel.breadcrumb:SetText(breadcrumb)
    addonTable.SetPanelTitle(panel, "玩家", breadcrumb)
    panel.sub:SetFont(UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
    panel.sub:SetTextColor(181 / 255, 160 / 255, 128 / 255)
    panel.sub:SetText(sub)
    return panel
end
local function InitializeResourcePanel(panel, preserveConfiguredColumns)
    for _, option in ipairs(panel.gwOptions or {}) do
        option.forceNewLine = true
        if not preserveConfiguredColumns then
            option.gwPlusColumns = nil
        end
        option.groupHeaderName = nil
    end
    Utils.InitializePanel(panel)
    panel:HookScript("OnShow", function()
        RefreshResourcePanel(panel)
    end)
    panel:Hide()
end
local function CreateResourcePanels(
    playerGeneral, resourcePanel, castbarPanel, options)
    local parent = playerGeneral:GetParent()
    local panels = {
        gw2_plus_player_globe = CreateResourcePanel(
            parent, "gw2_plus_player_globe", "血球和贴图",
            "调整玩家血球、HUD 贴图和位移条。"),
        gw2_plus_player_castbar = CreateResourcePanel(
            parent, "gw2_plus_player_castbar", "施法条",
            "调整玩家施法条。"),
        gw2_plus_player_energy = CreateResourcePanel(
            parent, "gw2_plus_player_energy", "能量条",
            "调整玩家能量条和回复提示。"),
        gw2_plus_player_resource = CreateResourcePanel(
            parent, "gw2_plus_player_resource", "资源条",
            "调整玩家职业资源条。"),
        gw2_plus_player_xp = CreateResourcePanel(
            parent, "gw2_plus_player_xp", "经验槽",
            "调整玩家经验槽。"),
    }
    local panel = panels.gw2_plus_player_globe
    local globeEnabled = panel:AddOption(
        "启用",
        "普通玩家框体由“综合 → 启用”独立控制。切换后需要重新加载界面。",
        {
            getter = AB.IsGlobeStyleEnabled,
            setter = AB.SetGlobeStyleEnabled,
            getDefault = function() return true end,
            callback = function() GW.ShowRlPopup = true end,
            groupHeaderName = "血球和贴图",
            isMasterToggle = true,
        })
    SetOptionColumns(globeEnabled, nil, "GW2PlusGlobeEnabled")
    WrapRefreshCallback(panel, globeEnabled)
    local dynamicHud = panel:AddOption(
        "血球贴图",
        "动态更改 HUD 背景",
        {
            getter = function() return GW.settings.HUD_SPELL_SWAP end,
            setter = function(value)
                GW.settings.HUD_SPELL_SWAP = value
            end,
            getDefault = function() return true end,
            groupHeaderName = "血球和贴图",
            dependence = {GW2PlusGlobeEnabled = true},
        }
    )
    SetOptionColumns(dynamicHud, 2, "HUD_SPELL_SWAP")
    local optHudBg = panel:AddOption(
        "动作条贴图",
        "在不同状态下（战斗、低血量、水中、灵魂状态等）动作条背景会改变颜色",
        {
            getter = function() return GW.settings.HUD_BACKGROUND end,
            setter = function(value)
                GW.settings.HUD_BACKGROUND = value
                if GW.ToggleHudBackground then GW.ToggleHudBackground() end
            end,
            getDefault = function() return true end,
            groupHeaderName = "血球和贴图",
            dependence = {GW2PlusGlobeEnabled = true},
        }
    )
    SetOptionColumns(optHudBg, 2, "HUD_BACKGROUND")
    AddClonedOption(
        panel, options.dodgeBar, "显示位移条", "血球和贴图", 2,
        {GW2PlusGlobeEnabled = true}, true)
    AddClonedOption(
        panel, options.dodgeAbility, "位移条技能", "血球和贴图", 2,
        {GW2PlusGlobeEnabled = true, showDodgebar = true})
    panel:AddOptionSlider(
        "缩放", nil, {
            min = 0.5,
            max = 2,
            step = 0.05,
            decimalNumbers = 2,
            getter = function() return AB.InitDB().globeScale end,
            setter = function(value)
                AB.InitDB().globeScale = value
            end,
            getDefault = function() return AB.defaults.globeScale end,
            callback = AB.ApplyGlobeScale,
            dependence = {GW2PlusGlobeEnabled = true},
            groupHeaderName = "血球和贴图",
        })
    panel = panels.gw2_plus_player_castbar
    AddClonedOption(
        panel, options.castEnabled, "启用", "施法条", nil, nil, true)
    AddClonedOption(
        panel, options.ticks, "跳数", "施法条", 3)
    AddClonedOption(
        panel, options.advancedCast, "高级施法条",
        "施法条", 3, nil, true)
    AddClonedOption(
        panel, options.spellQueue, "显示法术队列窗口",
        "施法条", 3)
    local castWidth = panel:AddOptionSlider(
        "宽度", nil, {
            min = 100,
            max = 600,
            step = 1,
            decimalNumbers = 0,
            getter = function()
                return AB.InitDB().castbarWidth or GetCastbarDefaultWidth()
            end,
            setter = function(value)
                AB.InitDB().castbarWidth = value
            end,
            getDefault = GetCastbarDefaultWidth,
            callback = AB.ApplyCastbarSize,
            dependence = {CASTINGBAR_ENABLED = true},
            groupHeaderName = "施法条",
            forceNewLine = false,
        })
    SetOptionColumns(castWidth, nil, "castbarWidth")
    local castHeight = panel:AddOptionSlider(
        "高度", nil, {
            min = 10,
            max = 100,
            step = 1,
            decimalNumbers = 0,
            getter = function()
                return AB.InitDB().castbarHeight or GetCastbarDefaultHeight()
            end,
            setter = function(value)
                AB.InitDB().castbarHeight = value
            end,
            getDefault = GetCastbarDefaultHeight,
            callback = AB.ApplyCastbarSize,
            dependence = {CASTINGBAR_ENABLED = true},
            groupHeaderName = "施法条",
            forceNewLine = false,
        })
    SetOptionColumns(castHeight, nil, "castbarHeight")
    panel = panels.gw2_plus_player_xp
    local xpEnabled = panel:AddOption(
        "启用",
        "显示经验槽",
        {
            getter = function() return GW.settings.XPBAR_ENABLED end,
            setter = function(value)
                GW.settings.XPBAR_ENABLED = value
                GW.ShowRlPopup = true
            end,
            getDefault = function() return true end,
            groupHeaderName = "经验槽",
            isMasterToggle = true,
        }
    )
    SetOptionColumns(xpEnabled, 2, "GW2PlusXpEnabled")
    local xpQuestPercent = panel:AddOption(
        "任务经验值百分比",
        "显示任务奖励经验所占升级经验的百分比",
        {
            getter = function() return GW.settings.QUEST_XP_PERCENT end,
            setter = function(value)
                GW.settings.QUEST_XP_PERCENT = value
            end,
            getDefault = function() return false end,
            groupHeaderName = "经验槽",
            dependence = {GW2PlusXpEnabled = true},
        }
    )
    SetOptionColumns(xpQuestPercent, 2, "QUEST_XP_PERCENT")
    panel = panels.gw2_plus_player_energy
    AddClonedOption(
        panel, options.energyTicker, "能量/法力回复提示",
        "能量条", 2, {}, true)
    AddClonedOption(
        panel, options.fiveSecondRule, "5秒规则：显示剩余时间",
        "能量条", 2, {PLAYER_ENERGY_MANA_TICK = true})
    AddClonedOption(
        panel, options.energyTickerCombat,
        "仅在战斗中显示能量/法力回复提示", "能量条", nil,
        {PLAYER_ENERGY_MANA_TICK = true})
    panel:AddGroupHeader("额外能量条")
    local energyEnabled = AddClonedOption(
        panel, options.powerBar, "启用",
        "额外能量条", nil, nil, true)
    energyEnabled.isMasterToggle = false
    local originalEnergyCallback = energyEnabled.callback
    energyEnabled.callback = function(...)
        if originalEnergyCallback then originalEnergyCallback(...) end
        SyncAdditionalEnergyBar()
        QueueValueRefresh()
    end
    local energyValue = panel:AddOption(
        "在条上显示数字", nil, {
            getter = function()
                return InitStatusDB().energyBarShowValue
            end,
            setter = function(value)
                InitStatusDB().energyBarShowValue = value == true
            end,
            getDefault = function()
                return STATUS_DEFAULTS.energyBarShowValue
            end,
            callback = ApplyEnergyValueVisibility,
            dependence = {POWERBAR_ENABLED = true},
            groupHeaderName = "额外能量条",
        })
    SetOptionColumns(energyEnabled, 2, "POWERBAR_ENABLED")
    SetOptionColumns(energyValue, 2, "GW2PlusEnergyShowValue")
    local energyWidth = panel:AddOptionSlider(
        "宽度", nil, {
            min = 100,
            max = 600,
            step = 1,
            decimalNumbers = 0,
            getter = function()
                local width = GetEnergyBarSize()
                return width
            end,
            setter = function(value)
                SetEnergyBarSize(value, nil, false)
            end,
            getDefault = function()
                return STATUS_DEFAULTS.energyBarWidth
            end,
            callback = ApplyEnergyBarSize,
            dependence = {POWERBAR_ENABLED = true},
            groupHeaderName = "额外能量条",
        })
    SetOptionColumns(energyWidth, nil, "energyBarWidth")
    local energyHeight = panel:AddOptionSlider(
        "高度", nil, {
            min = 1,
            max = 100,
            step = 1,
            decimalNumbers = 0,
            getter = function()
                local _, height = GetEnergyBarSize()
                return height
            end,
            setter = function(value)
                local width = GetEnergyBarSize()
                SetEnergyBarSize(width, value, false)
            end,
            getDefault = function()
                return STATUS_DEFAULTS.energyBarHeight
            end,
            callback = ApplyEnergyBarSize,
            dependence = {POWERBAR_ENABLED = true},
            groupHeaderName = "额外能量条",
        })
    SetOptionColumns(energyHeight, nil, "energyBarHeight")
    panel = panels.gw2_plus_player_resource
    AddClonedOption(
        panel, options.classPowerEnabled, "启用",
        "资源条", 2, nil, true)
    local resourceValue = panel:AddOption(
        "在条上显示数值", nil, {
            getter = function()
                return InitStatusDB().resourceBarShowValue
            end,
            setter = function(value)
                InitStatusDB().resourceBarShowValue = value == true
            end,
            getDefault = function()
                return STATUS_DEFAULTS.resourceBarShowValue
            end,
            callback = ApplyResourceValueVisibility,
            dependence = {CLASS_POWER = true},
            groupHeaderName = "资源条",
        })
    SetOptionColumns(
        resourceValue, 2, "GW2PlusResourceShowValue")
    local resourceWidth = panel:AddOptionSlider(
        "宽度", nil, {
            min = 100,
            max = 600,
            step = 1,
            decimalNumbers = 0,
            getter = GetResourceBarWidth,
            setter = function(value)
                SetResourceBarWidth(value, false)
            end,
            getDefault = function()
                return STATUS_DEFAULTS.resourceBarWidth
            end,
            callback = ApplyResourceBarSize,
            dependence = {CLASS_POWER = true},
            groupHeaderName = "资源条",
        })
    SetOptionColumns(resourceWidth, nil, "resourceBarWidth")
    AddClonedOption(
        panel, options.anchor, "锚点", "资源条", 2)
    AddClonedOption(
        panel, options.customSide, "侧边", "资源条", 2)
    AddClonedOption(
        panel, options.offsetX, "X 偏移", "资源条", 2)
    AddClonedOption(
        panel, options.offsetY, "Y 偏移", "资源条", 2)
    AddClonedOption(
        panel, options.gap, "间距", "资源条", nil)
    AddClonedOption(
        panel, options.classPowerCombat,
        "仅在战斗中显示", "资源条", nil)
    for _, currentPanel in pairs(panels) do
        local preserveColumns = currentPanel == panels.gw2_plus_player_globe
            or currentPanel == panels.gw2_plus_player_castbar
            or currentPanel == panels.gw2_plus_player_energy
        InitializeResourcePanel(
            currentPanel, preserveColumns)
    end
    resourcePanels = panels
    RefreshResourcePanels = function()
        for _, currentPanel in pairs(resourcePanels) do
            RefreshResourcePanel(currentPanel)
        end
        if addonTable.PlusEnergyTicker then
            addonTable.PlusEnergyTicker.Refresh()
        end
    end
    return panels
end
local function CollectRequiredOptions(
    generalOptions, resourceOptions, castOptions)
    local options = {
        powerBar = FindOption(generalOptions, "POWERBAR_ENABLED"),
        dodgeBar = FindOption(generalOptions, "showDodgebar"),
        dodgeAbility = FindOption(
            generalOptions, "PLAYER_TRACKED_DODGEBAR_SPELL"),
        castEnabled = FindOption(castOptions, "CASTINGBAR_ENABLED"),
        advancedCast = FindOption(castOptions, "CASTINGBAR_DATA"),
        spellQueue = FindOption(
            castOptions, "PLAYER_CASTBAR_SHOW_SPELL_QUEUEWINDOW"),
        ticks = FindOption(castOptions, "showPlayerCastBarTicks"),
        energyTicker = FindOption(
            resourceOptions, "PLAYER_ENERGY_MANA_TICK"),
        fiveSecondRule = FindOption(
            resourceOptions, "PLAYER_5SR_TIMER"),
        energyTickerCombat = FindOption(
            resourceOptions, "PLAYER_ENERGY_MANA_TICK_HIDE_OFC"),
        classPowerEnabled = FindOption(resourceOptions, "CLASS_POWER"),
        anchor = FindOption(
            resourceOptions, "CLASSPOWER_ANCHOR_MODE"),
        customSide = FindOption(
            resourceOptions, "CLASSPOWER_CUSTOMRESOURCEBAR_SIDE"),
        offsetX = FindOption(
            resourceOptions, "CLASSPOWER_ANCHOR_OFFSET_X"),
        offsetY = FindOption(
            resourceOptions, "CLASSPOWER_ANCHOR_OFFSET_Y"),
        gap = FindOption(
            resourceOptions, "CLASSPOWER_CUSTOMRESOURCEBAR_GAP"),
        classPowerCombat = FindOption(
            resourceOptions, "CLASSPOWER_ONLY_SHOW_IN_COMBAT"),
    }
    for _, key in ipairs({
        "powerBar",
        "dodgeBar",
        "dodgeAbility",
        "castEnabled",
        "advancedCast",
        "spellQueue",
        "ticks",
        "energyTicker",
        "fiveSecondRule",
        "energyTickerCombat",
        "classPowerEnabled",
        "anchor",
        "customSide",
        "offsetX",
        "offsetY",
        "gap",
        "classPowerCombat",
    }) do
        if not options[key] then return end
    end
    return options
end
local function PreparePlayerResourcePanel(
    playerGeneral, resourcePanel, castbarPanel)
    -- 延迟获取依赖
    if not EnsureDeps() then
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS PlayerResources: 依赖未就绪")
        return
    end

    if resourcePanels then return resourcePanels end
    if not playerGeneral or not resourcePanel or not castbarPanel then
        return
    end
    local generalOptions = playerGeneral.gwOptions or {}
    local resourceOptions = resourcePanel.gwOptions or {}
    local castOptions = castbarPanel.gwOptions or {}
    local options = CollectRequiredOptions(
        generalOptions, resourceOptions, castOptions)
    if not options then return end
    InitStatusDB()
    local actionBarDB = AB.InitDB()
    local castbarDefaultWidth = GetCastbarDefaultWidth()
    local castbarDefaultHeight = GetCastbarDefaultHeight()
    if (tonumber(actionBarDB.castbarWidth) or castbarDefaultWidth) < 100
        or (tonumber(actionBarDB.castbarWidth) or castbarDefaultWidth) > 600 then
        actionBarDB.castbarWidth = castbarDefaultWidth
    end
    if (tonumber(actionBarDB.castbarHeight) or castbarDefaultHeight) < 10
        or (tonumber(actionBarDB.castbarHeight) or castbarDefaultHeight) > 100 then
        actionBarDB.castbarHeight = castbarDefaultHeight
    end
    PrepareGeneralPanel(playerGeneral)
    local panels = CreateResourcePanels(
        playerGeneral, resourcePanel, castbarPanel, options)
    if not panels then return end
    InstallValueHooks()
    InstallProfileHook()
    SyncAdditionalEnergyBar()
    ApplyResourceBarSize()
    QueueValueRefresh()
    if RefreshResourcePanels then RefreshResourcePanels() end
    return panels
end
addonTable.PreparePlayerResourcePanel = PreparePlayerResourcePanel
