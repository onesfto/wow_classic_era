local _, addonTable = ...
-- 注意：不在顶层检查 GW2_ADDON，因为此时它可能还未初始化

local function RedrawSlider(optionName)
    local GW = _G.GW2_ADDON
    if not GW then return end
    local widget = GW.FindSettingsWidgetByOption and GW.FindSettingsWidgetByOption(optionName)
    if not widget or widget.optionType ~= "slider" or not widget.get then return end
    local value = widget.get()
    if widget.slider then widget.slider:SetValue(value) end
    if widget.inputFrame and widget.inputFrame.input then
        widget.inputFrame.input:SetText(string.format("%." .. (widget.decimalNumbers or 0) .. "f", value))
    end
end

local function BuildPanel(parent)
    -- 延迟检查，确保在调用时才验证依赖
    local GW = _G.GW2_ADDON
    if not GW or not GW.GetSettingsTabFrame then return end
    local ChatWindow = addonTable.ChatWindow
    if not ChatWindow then return end
    local db = ChatWindow.InitDB()
    local defaults = ChatWindow.defaults
    local panel = CreateFrame("Frame", nil, parent, "GwSettingsPanelTmpl")
    panel.panelId = "gw2_ui_plus_chatwindow"
    if panel.header then
        panel.header:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 20)
        if GW.Colors and GW.Colors.TextColors then
            panel.header:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
        end
        panel.header:SetText("附加组件")
    end
    if panel.breadcrumb then
        panel.breadcrumb:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
        if GW.Colors and GW.Colors.TextColors then
            panel.breadcrumb:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
        end
        panel.breadcrumb:SetText("聊天窗口")
    end
    addonTable.SetPanelTitle(panel, "附加组件", "聊天窗口")
    if panel.sub then
        panel.sub:SetFont(UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
        panel.sub:SetTextColor(181 / 255, 160 / 255, 128 / 255)
        panel.sub:SetText("主聊天窗的位置、外观与消息过滤")
    end
    local optEnable = panel:AddOption("固定位置与大小", "由本插件接管主聊天窗的位置和大小，每次登录都强制应用。关闭后交还给暴雪的默认行为，切换需要重载界面。", {
        getter = function() return db.enable end,
        setter = function(value) db.enable = value end,
        getDefault = function() return defaults.enable end,
        callback = function() GW.ShowRlPopup = true end,
        isMasterToggle = true,
    })
    if optEnable then optEnable.optionName = "GW2PlusChatWindow_Enable" end
    local dep = {["GW2PlusChatWindow_Enable"] = true}
    local optW = panel:AddOptionSlider("宽度", "主聊天窗的宽度（像素）", {
        min = 200, max = 1200, step = 1, decimalNumbers = 0,
        getter = function() return db.width end,
        setter = function(value) db.width = value end,
        getDefault = function() return defaults.width end,
        callback = function() ChatWindow.Apply() end,
        dependence = dep,
    })
    if optW then optW.optionName = "GW2PlusChatWindow_Width" end
    local optH = panel:AddOptionSlider("高度", "主聊天窗的高度（像素）", {
        min = 100, max = 800, step = 1, decimalNumbers = 0,
        getter = function() return db.height end,
        setter = function(value) db.height = value end,
        getDefault = function() return defaults.height end,
        callback = function() ChatWindow.Apply() end,
        dependence = dep,
    })
    if optH then optH.optionName = "GW2PlusChatWindow_Height" end
    local optX = panel:AddOptionSlider("左边距", "聊天窗左边到屏幕左边的距离，0 为紧贴", {
        min = 0, max = 800, step = 1, decimalNumbers = 0,
        getter = function() return db.offsetX end,
        setter = function(value) db.offsetX = value end,
        getDefault = function() return defaults.offsetX end,
        callback = function() ChatWindow.ApplyPosition() end,
        dependence = dep,
    })
    if optX then optX.optionName = "GW2PlusChatWindow_OffsetX" end
    local optY = panel:AddOptionSlider("下边距", "聊天窗底边到屏幕底边的距离。输入栏挂在聊天窗下方，所以这里要留出输入栏的高度；开了「输入栏移到顶部」之后就可以调到 0 紧贴。", {
        min = 0, max = 800, step = 1, decimalNumbers = 0,
        getter = function() return db.offsetY end,
        setter = function(value) db.offsetY = value end,
        getDefault = function() return defaults.offsetY end,
        callback = function() ChatWindow.ApplyPosition() end,
        dependence = dep,
    })
    if optY then optY.optionName = "GW2PlusChatWindow_OffsetY" end
    local optResetPosition = panel:AddOptionButton("恢复默认", "宽 400、高 200、位置 37 / 46", {
        callback = function()
            db.width, db.height = defaults.width, defaults.height
            db.offsetX, db.offsetY = defaults.offsetX, defaults.offsetY
            ChatWindow.ApplyPosition()
            RedrawSlider("GW2PlusChatWindow_Width")
            RedrawSlider("GW2PlusChatWindow_Height")
            RedrawSlider("GW2PlusChatWindow_OffsetX")
            RedrawSlider("GW2PlusChatWindow_OffsetY")
        end,
        isNegativeButton = true,
        dependence = dep,
    })
    if optResetPosition then
        optResetPosition.optionName = "GW2PlusChatWindow_ResetPosition"
    end
    panel:AddGroupHeader("外观")
    local optClassColor = panel:AddOption("玩家名用职业颜色", "聊天里的发言人名字按职业着色。和本体的「提及时用职业色」不是一回事——那个管的是消息正文里提到的名字。", {
        getter = function() return db.classColor end,
        setter = function(value) db.classColor = value end,
        getDefault = function() return defaults.classColor end,
        callback = function() ChatWindow.ApplyClassColor() end,
    })
    if optClassColor then
        optClassColor.optionName = "GW2PlusChatWindow_ClassColor"
    end
    local optEditBoxTop = panel:AddOption("输入栏移到顶部", "把聊天输入框从聊天窗下方挪到窗口顶端。挪上去之后「下边距」就可以调到 0 让聊天窗紧贴屏幕底边。切换需要重载界面。", {
        getter = function() return db.editBoxTop end,
        setter = function(value) db.editBoxTop = value end,
        getDefault = function() return defaults.editBoxTop end,
        callback = function() GW.ShowRlPopup = true end,
    })
    if optEditBoxTop then
        optEditBoxTop.optionName = "GW2PlusChatWindow_EditBoxTop"
    end
    local optButtonsPosition = panel:AddOptionDropdown("聊天按钮位置", "聊天控制按钮（菜单、频道、社交）放在哪。选「顶部」或「右侧」会把它们收进一条悬浮小条，聊天窗就能贴住屏幕边缘。与本体「聊天」面板里的是同一个设置。", {
        optionsList = {"LEFT", "TOP", "RIGHT"},
        optionNames = {"左侧", "顶部", "右侧"},
        getter = function() return GW.settings and GW.settings.CHAT_BUTTONS_POSITION end,
        setter = function(value)
            if GW.settings then GW.settings.CHAT_BUTTONS_POSITION = value end
        end,
        getDefault = function() return "LEFT" end,
        callback = function()
            if GW.UpdateChatButtonsPosition then GW.UpdateChatButtonsPosition() end
        end,
    })
    if optButtonsPosition then
        optButtonsPosition.optionName = "GW2PlusChatWindow_ButtonsPosition"
    end
    panel:AddGroupHeader("消息过滤")
    local optHideJoinLeave = panel:AddOption("不显示进入/离开频道信息", "屏蔽「XXX 加入了频道」「XXX 离开了频道」这类刷屏。", {
        getter = function() return db.hideJoinLeave end,
        setter = function(value) db.hideJoinLeave = value end,
        getDefault = function() return defaults.hideJoinLeave end,
    })
    if optHideJoinLeave then
        optHideJoinLeave.optionName = "GW2PlusChatWindow_HideJoinLeave"
    end
    local optTrimRepeat = panel:AddOption("重复符号、词、句裁减", "把频道消息里连续重复的符号、叠字、整段复读压掉。物品链接不受影响。只作用于编号频道。", {
        getter = function() return db.trimRepeat end,
        setter = function(value) db.trimRepeat = value end,
        getDefault = function() return defaults.trimRepeat end,
    })
    if optTrimRepeat then
        optTrimRepeat.optionName = "GW2PlusChatWindow_TrimRepeat"
    end
    local optBlack = panel:AddOption("启用关键词黑名单", "消息正文或发送者名字里出现下面任一关键词，整条消息就不显示。作用于编号频道、说话和大喊。", {
        getter = function() return db.blacklistEnable end,
        setter = function(value) db.blacklistEnable = value end,
        getDefault = function() return defaults.blacklistEnable end,
    })
    if optBlack then optBlack.optionName = "GW2PlusChatWindow_BlacklistEnable" end
    local optBlacklist = panel:AddOptionText("关键词", "多个关键词用逗号隔开，中英文逗号都认，不区分大小写。\n\n例如：\n代练, 金币, 出售账号", {
        getter = function() return db.blacklist end,
        setter = function(value) db.blacklist = value end,
        getDefault = function() return defaults.blacklist end,
        callback = function() ChatWindow.RebuildBlacklist() end,
        dependence = {["GW2PlusChatWindow_BlacklistEnable"] = true},
    })
    if optBlacklist then
        optBlacklist.optionName = "GW2PlusChatWindow_Blacklist"
    end
    local optHideBugGrabberSpam = panel:AddOption("不显示「界面错误太多」提示", "屏蔽 BugGrabber 的洪水保护警告（「用户界面有太多的错误……」）。这条消息响起来的时候 BugGrabber 已经停止记录错误了，屏蔽的只是提示、不是错误本身——真有插件在疯狂报错还是得去 BugSack 里看。", {
        getter = function() return db.hideBugGrabberSpam end,
        setter = function(value) db.hideBugGrabberSpam = value end,
        getDefault = function() return defaults.hideBugGrabberSpam end,
    })
    if optHideBugGrabberSpam then
        optHideBugGrabberSpam.optionName =
            "GW2PlusChatWindow_HideBugGrabberSpam"
    end
    return panel
end
addonTable.BuildChatWindowPanel = BuildPanel
