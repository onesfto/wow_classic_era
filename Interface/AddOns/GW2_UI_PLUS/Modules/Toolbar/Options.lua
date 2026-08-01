local _, addonTable = ...
local GW = _G.GW2_ADDON
local Toolbar = addonTable.Toolbar
if not GW or not GW.GetSettingsTabFrame or not Toolbar then return end
local function SetOptionName(option, name)
    if option then option.optionName = name end
    return option
end
local function AddEnable(panel, moduleKey, optionName)
    local module = Toolbar[moduleKey]
    local option = panel:AddOption("启用", nil, {
        getter = function() return Toolbar.InitDB()[moduleKey].enabled end,
        setter = function(value) module.SetEnabled(value) end,
        getDefault = function()
            return Toolbar.defaults[moduleKey].enabled
        end,
        isMasterToggle = true,
    })
    SetOptionName(option, optionName)
end
local function AddScale(panel, moduleKey, optionName)
    local module = Toolbar[moduleKey]
    local option = panel:AddOptionSlider("缩放", nil, {
        min = 0.5, max = 2, step = 0.05, decimalNumbers = 2,
        getter = function() return Toolbar.InitDB()[moduleKey].scale end,
        setter = function(value) module.SetScale(value) end,
        getDefault = function() return Toolbar.defaults[moduleKey].scale end,
        callback = function() module.Refresh() end,
    })
    SetOptionName(option, optionName)
end
local function AddReset(panel, moduleKey, optionNames)
    panel:AddOptionButton("重置", "恢复本组默认设置并移回默认位置。", {
        callback = function()
            Toolbar[moduleKey].Reset()
            for _, optionName in ipairs(optionNames) do
                Toolbar.RedrawOption(optionName)
            end
        end,
        isNegativeButton = true,
    })
end
local function BuildToolbarPanel(parent)
    local panel = CreateFrame("Frame", nil, parent, "GwSettingsPanelTmpl")
    panel.panelId = "gw2_ui_plus_toolbar"
    if panel.header then
        panel.header:SetFont(
            DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 20)
        if GW.Colors and GW.Colors.TextColors then
            panel.header:SetTextColor(
                GW.Colors.TextColors.LightHeader:GetRGB())
        end
        panel.header:SetText("附加组件")
        panel.header:SetWidth(panel.header:GetStringWidth() + 10)
    end
    if panel.breadcrumb then
        panel.breadcrumb:SetFont(
            DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
        if GW.Colors and GW.Colors.TextColors then
            panel.breadcrumb:SetTextColor(
                GW.Colors.TextColors.LightHeader:GetRGB())
        end
        panel.breadcrumb:SetText("工具条")
    end
    if panel.sub then
        panel.sub:SetFont(
            UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
        panel.sub:SetTextColor(181 / 255, 160 / 255, 128 / 255)
        panel.sub:SetText("队伍、快捷操作、目标标记与性能信息")
    end
    Toolbar.InitDB()
    panel:AddGroupHeader("队伍管理")
    AddEnable(
        panel, "groupManage", "GW2PlusToolbarGroupManageEnable")
    AddScale(
        panel, "groupManage", "GW2PlusToolbarGroupManageScale")
    AddReset(panel, "groupManage", {
        "GW2PlusToolbarGroupManageEnable",
        "GW2PlusToolbarGroupManageScale",
    })
    panel:AddGroupHeader("快捷条")
    AddEnable(panel, "quickBar", "GW2PlusToolbarQuickBarEnable")
    AddScale(panel, "quickBar", "GW2PlusToolbarQuickBarScale")
    local buttonNames = {
        leave = "离开队伍",
        teleport = "随机副本传送",
        convert = "小队/团队转换",
        reset = "重置副本",
        timer = "时间",
        role = "职责确认",
        ready = "就位确认",
        countdown = "倒计时",
    }
    for _, key in ipairs({
        "leave", "teleport", "convert", "reset",
        "timer", "role", "ready", "countdown",
    }) do
        local buttonKey = key
        panel:AddOption(buttonNames[buttonKey], nil, {
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
    end
    panel:AddOption("24 小时制", nil, {
        getter = function() return Toolbar.InitDB().quickBar.use24Hour end,
        setter = function(value) Toolbar.quickBar.SetUse24Hour(value) end,
        getDefault = function() return false end,
    })
    panel:AddOption("隐藏时间按钮背景", nil, {
        getter = function()
            return Toolbar.InitDB().quickBar.hideTimerBackground
        end,
        setter = function(value)
            Toolbar.quickBar.SetHideTimerBackground(value)
        end,
        getDefault = function() return false end,
    })
    panel:AddOptionSlider("默认倒计时", "单位：秒", {
        min = 3, max = 180, step = 1, decimalNumbers = 0,
        getter = function()
            return Toolbar.InitDB().quickBar.countdownSeconds
        end,
        setter = function(value)
            Toolbar.quickBar.SetCountdownSeconds(value)
        end,
        getDefault = function() return 10 end,
    })
    panel:AddOption("系统语音读秒", "倒计时最后五秒使用客户端语音。", {
        getter = function()
            return Toolbar.InitDB().quickBar.countdownVoice
        end,
        setter = function(value)
            Toolbar.quickBar.SetCountdownVoice(value)
        end,
        getDefault = function() return true end,
    })
    panel:AddOptionButton("试听语音", "播放当前选择的五秒读秒语音。", {
        callback = function() Toolbar.quickBar.PreviewVoice() end,
    })
    AddReset(panel, "quickBar", {
        "GW2PlusToolbarQuickBarEnable",
        "GW2PlusToolbarQuickBarScale",
    })
    panel:AddOptionDropdown("时间模式", nil, {
        optionsList = {"COMBAT", "CLOCK", "DYNAMIC"},
        optionNames = {"战斗计时", "本地时间", "动态"},
        getter = function() return Toolbar.InitDB().quickBar.timerMode end,
        setter = function(value) Toolbar.quickBar.SetTimerMode(value) end,
        getDefault = function() return "COMBAT" end,
    })
    panel:AddOptionDropdown("语音类型", nil, {
        optionsList = {0, 1},
        optionNames = {"系统默认", "备用语音"},
        getter = function() return Toolbar.InitDB().quickBar.voiceType end,
        setter = function(value) Toolbar.quickBar.SetVoiceType(value) end,
        getDefault = function() return 0 end,
    })
    panel:AddGroupHeader("标记条")
    AddEnable(panel, "markerBar", "GW2PlusToolbarMarkerBarEnable")
    AddScale(panel, "markerBar", "GW2PlusToolbarMarkerBarScale")
    AddReset(panel, "markerBar", {
        "GW2PlusToolbarMarkerBarEnable",
        "GW2PlusToolbarMarkerBarScale",
    })
    panel:AddGroupHeader("性能条")
    AddEnable(
        panel, "performanceBar", "GW2PlusToolbarPerformanceBarEnable")
    local width = panel:AddOptionSlider("宽度", nil, {
        min = 120, max = 500, step = 1, decimalNumbers = 0,
        getter = function() return Toolbar.InitDB().performanceBar.width end,
        setter = function(value)
            Toolbar.performanceBar.SetSize("width", value)
        end,
        getDefault = function() return Toolbar.defaults.performanceBar.width end,
    })
    SetOptionName(width, "GW2PlusToolbarPerformanceBarWidth")
    local height = panel:AddOptionSlider("高度", nil, {
        min = 18, max = 60, step = 1, decimalNumbers = 0,
        getter = function() return Toolbar.InitDB().performanceBar.height end,
        setter = function(value)
            Toolbar.performanceBar.SetSize("height", value)
        end,
        getDefault = function() return Toolbar.defaults.performanceBar.height end,
    })
    SetOptionName(height, "GW2PlusToolbarPerformanceBarHeight")
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
        SetOptionName(
            metricOption,
            "GW2PlusToolbarPerformanceBar" .. metricKey)
    end
    AddReset(panel, "performanceBar", {
        "GW2PlusToolbarPerformanceBarEnable",
        "GW2PlusToolbarPerformanceBarWidth",
        "GW2PlusToolbarPerformanceBarHeight",
    })
    return panel
end
addonTable.BuildToolbarPanel = BuildToolbarPanel
