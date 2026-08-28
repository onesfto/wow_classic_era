local _, addonTable = ...
-- 注意：不在顶层检查 GW2_ADDON，因为此时它可能还未初始化

local function SetOptionName(option, name)
    if option then option.optionName = name end
    return option
end

local function SetInline(option)
    if option then option.forceNewLine = false end
    return option
end

-- 连续设置相同列数时，ActionBarOptionsUtils 会将它们严格排在同一行。
local function SetRow(columnCount, ...)
    for index = 1, select("#", ...) do
        local option = select(index, ...)
        if option then option.gwPlusColumns = columnCount end
    end
end

local function AddEnable(panel, moduleKey, optionName)
    local Toolbar = addonTable.Toolbar
    if not Toolbar then return end
    local module = Toolbar[moduleKey]
    local option = panel:AddOption("启用", nil, {
        getter = function() return Toolbar.InitDB()[moduleKey].enabled end,
        setter = function(value) module.SetEnabled(value) end,
        getDefault = function()
            return Toolbar.defaults[moduleKey].enabled
        end,
        isMasterToggle = true,
    })
    return SetOptionName(option, optionName)
end

local function AddScale(panel, moduleKey, optionName)
    local Toolbar = addonTable.Toolbar
    if not Toolbar then return end
    local module = Toolbar[moduleKey]
    local option = panel:AddOptionSlider("缩放", nil, {
        min = 0.5, max = 2, step = 0.05, decimalNumbers = 2,
        getter = function() return Toolbar.InitDB()[moduleKey].scale end,
        setter = function(value) module.SetScale(value) end,
        getDefault = function() return Toolbar.defaults[moduleKey].scale end,
        callback = function() module.Refresh() end,
    })
    return SetInline(SetOptionName(option, optionName))
end

local function AddGroupManageFadeOption(panel)
    local GW = _G.GW2_ADDON
    if not GW or not GW.settings then return end
    local option = panel:AddOption("渐隐", "鼠标离开队伍管理栏时渐隐。", {
        getter = function()
            return GW.settings.FADE_GROUP_MANAGE_FRAME == true
        end,
        setter = function(value)
            GW.settings.FADE_GROUP_MANAGE_FRAME = value == true
            if GW.ToggleRaidControllFrame then
                GW.ToggleRaidControllFrame()
            end
        end,
        getDefault = function()
            local defaults = GW.globalDefault and GW.globalDefault.profile
            return defaults and defaults.FADE_GROUP_MANAGE_FRAME == true
        end,
        dependence = { ["PARTY_FRAMES"] = true },
    })
    return SetInline(SetOptionName(option, "FADE_GROUP_MANAGE_FRAME"))
end

local function AddMoverToggle(panel, moduleKey)
    local option = panel:AddOptionButton(
        "解锁/锁定", "解锁后可拖动界面组件；再次点击即可锁定。", {
            callback = function()
                addonTable.Toolbar.ToggleComponentMover(moduleKey)
            end,
        })
    return SetInline(option)
end

local function AddReset(panel, moduleKey, optionNames, callback, label)
    local option = panel:AddOptionButton(
        label or "重置", "恢复本组默认设置并移回默认位置。", {
        callback = function()
            local Toolbar = addonTable.Toolbar
            local module = Toolbar and Toolbar[moduleKey]
            if not module or not module.Reset then return end
            module.Reset()
            if callback then callback() end
            for _, optionName in ipairs(optionNames) do
                Toolbar.RedrawOption(optionName)
            end
        end,
        isNegativeButton = true,
    })
    return SetInline(option)
end

local function GetNativeDefault(GW, setting, fallback)
    local defaults = GW and GW.globalDefault and GW.globalDefault.profile
    local value = defaults and defaults[setting]
    return value == nil and fallback or value
end

local function ApplyRoleBarScale(value)
    local frame = _G.GW_RaidCounter_Frame
    if not frame then return end
    addonTable.Toolbar.QueueOutOfCombat(
        "GW2PlusToolbarRoleBarScale",
        function() frame:SetScale(value, true) end)
end

local function AddRoleBarOptions(panel)
    local Toolbar = addonTable.Toolbar
    local GW = _G.GW2_ADDON
    if not Toolbar or not GW or not GW.settings then return end

    local enable = panel:AddOption("启用", nil, {
        getter = function() return GW.settings.ROLE_BAR ~= "NEVER" end,
        setter = function(value)
            local db = Toolbar.InitDB().roleBar
            if value then
                GW.settings.ROLE_BAR = db.lastVisibility
                    or GetNativeDefault(GW, "ROLE_BAR", "IN_RAID")
            else
                if GW.settings.ROLE_BAR ~= "NEVER" then
                    db.lastVisibility = GW.settings.ROLE_BAR
                end
                GW.settings.ROLE_BAR = "NEVER"
            end
            if GW.UpdateRaidCounterVisibility then
                GW.UpdateRaidCounterVisibility()
            end
        end,
        getDefault = function()
            return GetNativeDefault(GW, "ROLE_BAR", "IN_RAID") ~= "NEVER"
        end,
        isMasterToggle = true,
    })
    enable = SetOptionName(enable, "ROLE_BAR")

    local scale = panel:AddOptionSlider("缩放", nil, {
        min = 0.5, max = 2, step = 0.05, decimalNumbers = 2,
        getter = function()
            return GW.settings.ROLE_BAR_pos_scale
                or GetNativeDefault(GW, "ROLE_BAR_pos_scale", 1)
        end,
        setter = function(value)
            value = math.max(0.5, math.min(2, tonumber(value) or 1))
            GW.settings.ROLE_BAR_pos_scale = value
            ApplyRoleBarScale(value)
        end,
        getDefault = function()
            return GetNativeDefault(GW, "ROLE_BAR_pos_scale", 1)
        end,
    })
    scale = SetInline(SetOptionName(scale, "ROLE_BAR_pos_scale"))
    return enable, scale
end

local function ResetRoleBar()
    local Toolbar = addonTable.Toolbar
    local GW = _G.GW2_ADDON
    if not Toolbar or not GW or not GW.settings then return end
    local defaultVisibility = GetNativeDefault(GW, "ROLE_BAR", "IN_RAID")
    local defaultScale = GetNativeDefault(GW, "ROLE_BAR_pos_scale", 1)
    local defaultPoint = GetNativeDefault(GW, "ROLE_BAR_pos")
    GW.settings.ROLE_BAR = defaultVisibility
    GW.settings.ROLE_BAR_pos_scale = defaultScale
    Toolbar.InitDB().roleBar.lastVisibility = defaultVisibility
    if GW.UpdateRaidCounterVisibility then GW.UpdateRaidCounterVisibility() end

    if type(defaultPoint) == "table" then
        GW.settings.ROLE_BAR_pos = Toolbar.CopyTable(defaultPoint)
    end
    local frame = _G.GW_RaidCounter_Frame
    if not frame then return end
    Toolbar.QueueOutOfCombat("GW2PlusToolbarRoleBarReset", function()
        frame:SetScale(defaultScale, true)
        local mover = frame.gwMover
        if not mover or type(defaultPoint) ~= "table" then return end
        local point = Toolbar.CopyTable(defaultPoint)
        mover.savedPoint = Toolbar.CopyTable(point)
        mover:ClearAllPoints()
        mover:SetPoint(
            point.point, UIParent, point.relativePoint, point.xOfs, point.yOfs)
        frame.isMoved = false
        frame:SetAttribute("isMoved", false)
    end)
end

local function CreateToolbarPage(parent, panelId, breadcrumb, description)
    local GW = _G.GW2_ADDON
    local panel = CreateFrame("Frame", nil, parent, "GwSettingsPanelTmpl")
    panel.panelId = panelId
    if panel.header then
        panel.header:SetFont(
            DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 20)
        if GW.Colors and GW.Colors.TextColors then
            panel.header:SetTextColor(
                GW.Colors.TextColors.LightHeader:GetRGB())
        end
        panel.header:SetText("附加组件")
    end
    if panel.breadcrumb then
        panel.breadcrumb:SetFont(
            DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
        if GW.Colors and GW.Colors.TextColors then
            panel.breadcrumb:SetTextColor(
                GW.Colors.TextColors.LightHeader:GetRGB())
        end
        panel.breadcrumb:SetText(breadcrumb)
    end
    addonTable.SetPanelTitle(panel, "工具条", breadcrumb)
    if panel.sub then
        panel.sub:SetFont(
            UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
        panel.sub:SetTextColor(181 / 255, 160 / 255, 128 / 255)
        panel.sub:SetText(description)
    end
    return panel
end

local function InitializeToolbarPage(page)
    local GW = _G.GW2_ADDON
    if GW and GW.RefreshSettingsPanel then
        GW.RefreshSettingsPanel(page)
    end
    local Utils = addonTable.ActionBarOptionsUtils
    if Utils and Utils.InitializePanel then
        Utils.InitializePanel(page)
    end
end

local function AddGroupManageOptions(panel)
    local Toolbar = addonTable.Toolbar
    AddEnable(panel, "groupManage", "GW2PlusToolbarGroupManageEnable")
    AddGroupManageFadeOption(panel)
    AddScale(panel, "groupManage", "GW2PlusToolbarGroupManageScale")
    local groupMover = AddMoverToggle(panel, "groupManage")
    local groupReset = AddReset(panel, "groupManage", {
        "GW2PlusToolbarGroupManageEnable",
        "GW2PlusToolbarGroupManageScale",
        "FADE_GROUP_MANAGE_FRAME",
    }, function()
        local GW = _G.GW2_ADDON
        local defaults = GW and GW.globalDefault and GW.globalDefault.profile
        if not GW or not GW.settings or not defaults then return end
        GW.settings.FADE_GROUP_MANAGE_FRAME =
            defaults.FADE_GROUP_MANAGE_FRAME == true
        if GW.ToggleRaidControllFrame then GW.ToggleRaidControllFrame() end
    end, "重置位置")
    SetRow(2, groupMover, groupReset)
end

local function AddQuickBarOptions(panel)
    local Toolbar = addonTable.Toolbar
    AddEnable(panel, "quickBar", "GW2PlusToolbarQuickBarEnable")
    local quickScale = AddScale(
        panel, "quickBar", "GW2PlusToolbarQuickBarScale")
    local buttonNames = {
        leave = "离开队伍",
        convert = "小队/团队转换",
        reset = "重置副本",
        timer = "时间",
        role = "职责确认",
        ready = "就位确认",
        countdown = "倒计时",
    }
    local quickButtons = {}
    for _, key in ipairs({
        "leave", "convert", "reset",
        "timer", "role", "ready", "countdown",
    }) do
        local buttonKey = key
        local buttonOption = panel:AddOption(buttonNames[buttonKey], nil, {
            getter = function()
                return Toolbar.InitDB().quickBar.buttons[buttonKey]
            end,
            setter = function(value)
                Toolbar.quickBar.SetButtonShown(buttonKey, value)
            end,
            getDefault = function()
                return Toolbar.defaults.quickBar.buttons[buttonKey]
            end,
        })
        quickButtons[buttonKey] = SetInline(SetOptionName(
            buttonOption, "GW2PlusToolbarQuickBarButton" .. buttonKey))
    end
    SetRow(4, quickButtons.leave, quickButtons.convert,
        quickButtons.reset, quickButtons.timer)
    SetRow(4, quickButtons.role, quickButtons.ready,
        quickButtons.countdown)
    local use24Hour = panel:AddOption("24 小时制", nil, {
        getter = function() return Toolbar.InitDB().quickBar.use24Hour end,
        setter = function(value) Toolbar.quickBar.SetUse24Hour(value) end,
        getDefault = function() return false end,
    })
    use24Hour = SetInline(SetOptionName(
        use24Hour, "GW2PlusToolbarQuickBarUse24Hour"))
    SetRow(4, quickButtons.role, quickButtons.ready,
        quickButtons.countdown, use24Hour)
    local countdownSeconds = panel:AddOptionSlider("默认倒计时", "单位：秒", {
        min = 3, max = 10, step = 1, decimalNumbers = 0,
        getter = function()
            return Toolbar.InitDB().quickBar.countdownSeconds
        end,
        setter = function(value)
            Toolbar.quickBar.SetCountdownSeconds(value)
        end,
        getDefault = function() return 10 end,
    })
    SetInline(SetOptionName(
        countdownSeconds, "GW2PlusToolbarQuickBarCountdownSeconds"))
    local timerMode = panel:AddOptionDropdown("时间模式", nil, {
        optionsList = {"COMBAT", "CLOCK", "DYNAMIC"},
        optionNames = {"战斗计时", "本地时间", "动态"},
        getter = function() return Toolbar.InitDB().quickBar.timerMode end,
        setter = function(value) Toolbar.quickBar.SetTimerMode(value) end,
        getDefault = function() return "COMBAT" end,
    })
    SetInline(SetOptionName(timerMode, "GW2PlusToolbarQuickBarTimerMode"))
    local countdownVoice = panel:AddOption(
        "系统语音读秒", "倒计时最后五秒使用客户端语音。", {
        getter = function()
            return Toolbar.InitDB().quickBar.countdownVoice
        end,
        setter = function(value)
            Toolbar.quickBar.SetCountdownVoice(value)
        end,
        getDefault = function() return true end,
    })
    SetInline(SetOptionName(
        countdownVoice, "GW2PlusToolbarQuickBarCountdownVoice"))
    local previewVoice = panel:AddOptionButton("试听语音", "播放当前选择的五秒读秒语音。", {
        callback = function() Toolbar.quickBar.PreviewVoice() end,
    })
    SetInline(previewVoice)
    SetRow(2, countdownVoice, previewVoice)
    local quickMover = AddMoverToggle(panel, "quickBar")
    local quickReset = AddReset(panel, "quickBar", {
        "GW2PlusToolbarQuickBarEnable",
        "GW2PlusToolbarQuickBarScale",
        "GW2PlusToolbarQuickBarButtonleave",
        "GW2PlusToolbarQuickBarButtonconvert",
        "GW2PlusToolbarQuickBarButtonreset",
        "GW2PlusToolbarQuickBarButtontimer",
        "GW2PlusToolbarQuickBarButtonrole",
        "GW2PlusToolbarQuickBarButtonready",
        "GW2PlusToolbarQuickBarButtoncountdown",
        "GW2PlusToolbarQuickBarUse24Hour",
        "GW2PlusToolbarQuickBarCountdownSeconds",
        "GW2PlusToolbarQuickBarTimerMode",
        "GW2PlusToolbarQuickBarCountdownVoice",
    }, nil, "重置位置")
    SetRow(2, quickMover, quickReset)
end

local function AddMarkerBarOptions(panel)
    local Toolbar = addonTable.Toolbar
    AddEnable(panel, "markerBar", "GW2PlusToolbarMarkerBarEnable")
    local hideBackground = panel:AddOption("隐藏背景", nil, {
        getter = function()
            return Toolbar.InitDB().markerBar.hideBackground
        end,
        setter = function(value) Toolbar.markerBar.SetHideBackground(value) end,
        getDefault = function()
            return Toolbar.defaults.markerBar.hideBackground
        end,
    })
    SetInline(SetOptionName(
        hideBackground, "GW2PlusToolbarMarkerBarHideBackground"))
    local hideWhenNoPermission = panel:AddOption("无权限时隐藏", nil, {
        getter = function()
            return Toolbar.InitDB().markerBar.hideWhenNoPermission
        end,
        setter = function(value)
            Toolbar.markerBar.SetHideWhenNoPermission(value)
        end,
        getDefault = function()
            return Toolbar.defaults.markerBar.hideWhenNoPermission
        end,
    })
    SetInline(SetOptionName(
        hideWhenNoPermission, "GW2PlusToolbarMarkerBarHideWhenNoPermission"))
    local hideWhenNoTarget = panel:AddOption("无目标时隐藏", nil, {
        getter = function()
            return Toolbar.InitDB().markerBar.hideWhenNoTarget
        end,
        setter = function(value)
            Toolbar.markerBar.SetHideWhenNoTarget(value)
        end,
        getDefault = function()
            return Toolbar.defaults.markerBar.hideWhenNoTarget
        end,
    })
    SetInline(SetOptionName(
        hideWhenNoTarget, "GW2PlusToolbarMarkerBarHideWhenNoTarget"))
    local hideWhenSolo = panel:AddOption("单人时隐藏", nil, {
        getter = function()
            return Toolbar.InitDB().markerBar.hideWhenSolo
        end,
        setter = function(value)
            Toolbar.markerBar.SetHideWhenSolo(value)
        end,
        getDefault = function()
            return Toolbar.defaults.markerBar.hideWhenSolo
        end,
    })
    SetInline(SetOptionName(
        hideWhenSolo, "GW2PlusToolbarMarkerBarHideWhenSolo"))
    AddScale(panel, "markerBar", "GW2PlusToolbarMarkerBarScale")
    local markerMover = AddMoverToggle(panel, "markerBar")
    local markerReset = AddReset(panel, "markerBar", {
        "GW2PlusToolbarMarkerBarEnable",
        "GW2PlusToolbarMarkerBarScale",
        "GW2PlusToolbarMarkerBarHideBackground",
        "GW2PlusToolbarMarkerBarHideWhenNoPermission",
        "GW2PlusToolbarMarkerBarHideWhenNoTarget",
        "GW2PlusToolbarMarkerBarHideWhenSolo",
    }, nil, "重置位置")
    SetRow(2, markerMover, markerReset)
end

local function AddRoleBarPageOptions(panel)
    local Toolbar = addonTable.Toolbar
    AddRoleBarOptions(panel)
    local roleMover = AddMoverToggle(panel, "roleBar")
    local roleReset = panel:AddOptionButton("重置", "恢复角色职责列的默认设置和位置。", {
        callback = function()
            ResetRoleBar()
            Toolbar.RedrawOption("ROLE_BAR")
            Toolbar.RedrawOption("ROLE_BAR_pos_scale")
        end,
        isNegativeButton = true,
    })
    SetInline(roleReset)
    SetRow(2, roleMover, roleReset)
end

local function AddPerformanceBarOptions(panel)
    local Toolbar = addonTable.Toolbar
    AddEnable(panel, "performanceBar", "GW2PlusToolbarPerformanceBarEnable")
    local alignment = panel:AddOptionDropdown("对齐", nil, {
        optionsList = {"LEFT", "CENTER", "RIGHT"},
        optionNames = {"左对齐", "居中", "右对齐"},
        getter = function()
            return Toolbar.InitDB().performanceBar.alignment
        end,
        setter = function(value) Toolbar.performanceBar.SetAlignment(value) end,
        getDefault = function()
            return Toolbar.defaults.performanceBar.alignment
        end,
    })
    SetInline(SetOptionName(
        alignment, "GW2PlusToolbarPerformanceBarAlignment"))
    local width = panel:AddOptionSlider("宽度", nil, {
        min = 120, max = 500, step = 1, decimalNumbers = 0,
        getter = function() return Toolbar.InitDB().performanceBar.width end,
        setter = function(value)
            Toolbar.performanceBar.SetSize("width", value)
        end,
        getDefault = function() return Toolbar.defaults.performanceBar.width end,
    })
    SetInline(SetOptionName(width, "GW2PlusToolbarPerformanceBarWidth"))
    local height = panel:AddOptionSlider("高度", nil, {
        min = 18, max = 60, step = 1, decimalNumbers = 0,
        getter = function() return Toolbar.InitDB().performanceBar.height end,
        setter = function(value)
            Toolbar.performanceBar.SetSize("height", value)
        end,
        getDefault = function() return Toolbar.defaults.performanceBar.height end,
    })
    SetInline(SetOptionName(height, "GW2PlusToolbarPerformanceBarHeight"))
    local metricOptions = {}
    for _, metric in ipairs({
        {"showFPS", "显示 FPS"},
        {"showHome", "显示本地延迟"},
        {"showWorld", "显示世界延迟"},
    }) do
        local metricKey = metric[1]
        local metricOption = panel:AddOption(metric[2], nil, {
            getter = function()
                return Toolbar.InitDB().performanceBar[metricKey]
            end,
            setter = function(value)
                Toolbar.performanceBar.SetMetric(metricKey, value)
            end,
            getDefault = function()
                return Toolbar.defaults.performanceBar[metricKey]
            end,
        })
        metricOptions[#metricOptions + 1] = SetInline(SetOptionName(
            metricOption, "GW2PlusToolbarPerformanceBar" .. metricKey))
    end
    SetRow(3, metricOptions[1], metricOptions[2], metricOptions[3])
    local performanceMover = AddMoverToggle(panel, "performanceBar")
    local performanceReset = AddReset(panel, "performanceBar", {
        "GW2PlusToolbarPerformanceBarEnable",
        "GW2PlusToolbarPerformanceBarAlignment",
        "GW2PlusToolbarPerformanceBarWidth",
        "GW2PlusToolbarPerformanceBarHeight",
        "GW2PlusToolbarPerformanceBarshowFPS",
        "GW2PlusToolbarPerformanceBarshowHome",
        "GW2PlusToolbarPerformanceBarshowWorld",
    }, nil, "重置位置")
    SetRow(2, performanceMover, performanceReset)
end

local function BuildToolbarPanel(parent)
    local GW = _G.GW2_ADDON
    if not GW or not GW.GetSettingsTabFrame then return end
    local Toolbar = addonTable.Toolbar
    if not Toolbar then return end

    local root = CreateFrame("Frame", nil, parent, "GwSettingsPanelTmpl")
    root.panelId = "gw2_ui_plus_toolbar"

    Toolbar.InitDB()
    local pageDefinitions = {
        {"标记条", "gw2_ui_plus_toolbar_marker", "目标标记快捷操作", AddMarkerBarOptions},
        {"快捷条", "gw2_ui_plus_toolbar_quick", "队伍快捷操作与倒计时", AddQuickBarOptions},
        {"队伍管理", "gw2_ui_plus_toolbar_group", "队伍管理栏显示与位置", AddGroupManageOptions},
        {"角色职责", "gw2_ui_plus_toolbar_role", "角色职责列显示与位置", AddRoleBarPageOptions},
        {"性能条", "gw2_ui_plus_toolbar_performance", "帧率与网络延迟信息", AddPerformanceBarOptions},
    }
    local pages = {}

    for index, definition in ipairs(pageDefinitions) do
        local page = CreateToolbarPage(
            root, definition[2], definition[1], definition[3])
        definition[4](page)
        InitializeToolbarPage(page)
        pages[index] = page
    end

    root.toolbarPages = {}
    for index, definition in ipairs(pageDefinitions) do
        root.toolbarPages[index] = {name = definition[1], panel = pages[index]}
    end
    Toolbar.optionsPanels = pages
    return root
end
addonTable.BuildToolbarPanel = BuildToolbarPanel
