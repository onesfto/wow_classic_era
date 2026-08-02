local _, addonTable = ...
-- 注意：不在顶层检查 GW2_ADDON，因为此时它可能还未初始化
-- 改为在 BuildPanel 函数内部检查

local IsLoaded = (_G.C_AddOns and _G.C_AddOns.IsAddOnLoaded) or _G.IsAddOnLoaded
local GROUPS = {
    {header = "聊天频道", keys = {"SAY", "YELL", "GUILD", "PARTY", "RAID", "INSTANCE_CHAT",
                                  "GENERAL", "TRADE", "LOOK_FOR_GROUP", "PIG", "BIGFOOTWORLD"}},
    {header = "快捷功能", keys = {"EMOJI", "ROLL", "MACRO"}},
    {header = "插件入口", keys = {"DBM", "ATLASLOOT", "BIAOGE", "MEETINGHORN", "MRT"}},
}
local BUTTON_LABEL = {
    SAY = "说", YELL = "喊", GUILD = "会", PARTY = "队", RAID = "团", INSTANCE_CHAT = "战",
    GENERAL = "综", TRADE = "交", LOOK_FOR_GROUP = "组",
    PIG = "P（PIG 频道）", BIGFOOTWORLD = "世（大脚世界频道）",
    EMOJI = "表（表情）", ROLL = "骰（Roll）", MACRO = "宏（宏命令）",
    DBM = "距（DBM 测距）", ATLASLOOT = "掉（AtlasLoot）", BIAOGE = "金（表格）",
    MEETINGHORN = "集（集结号）", MRT = "M（MRT 团队检查）",
}

local function GetDef(key)
    local ChatBar = addonTable.ChatBar
    if not ChatBar then return end
    for _, def in ipairs(ChatBar.BUTTONS) do
        if def.key == key then return def end
    end
end

local function BuildPanel(parent)
    -- 延迟检查，确保在调用时才验证依赖
    local GW = _G.GW2_ADDON
    if not GW then
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS ChatBar: GW2_ADDON 不存在")
        return
    end
    if not GW.GetSettingsTabFrame then
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS ChatBar: GetSettingsTabFrame 不存在")
        return
    end
    local ChatBar = addonTable.ChatBar
    if not ChatBar then
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS ChatBar: addonTable.ChatBar 不存在")
        return
    end

    ChatBar.InitDB()
    local panel = CreateFrame("Frame", nil, parent, "GwSettingsPanelTmpl")
    panel.panelId = "gw2_ui_plus_chatbar"
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
        panel.breadcrumb:SetText("频道按钮")
    end
    addonTable.SetPanelTitle(panel, "附加组件", "频道按钮")
    if panel.sub then
        panel.sub:SetFont(UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
        panel.sub:SetTextColor(181 / 255, 160 / 255, 128 / 255)
        panel.sub:SetText("聊天栏频道快捷切换与插件快捷入口")
    end
    local db = GW2_UI_PLUS_ChatBarSV
    local optEnable = panel:AddOption("启用", "在聊天栏旁显示频道按钮条。切换后需要重载界面。", {
        getter = function() return db.enable end,
        setter = function(value) db.enable = value end,
        getDefault = function() return true end,
        callback = function() GW.ShowRlPopup = true end,
        isMasterToggle = true,
    })
    if optEnable then optEnable.optionName = "GW2PlusChatBar_Enable" end
    local dep = {["GW2PlusChatBar_Enable"] = true}
    panel:AddGroupHeader("基本设置")
    panel:AddOption("鼠标离开渐隐", "鼠标离开聊天栏和按钮条时淡出", {
        getter = function() return db.fadeOnLeave end,
        setter = function(value) db.fadeOnLeave = value end,
        getDefault = function() return false end,
        callback = function() ChatBar.UpdateFade() end,
        dependence = dep,
    })
    panel:AddOption("动态显隐", "不在公会/队伍/团队/战场时，自动隐藏对应的频道按钮", {
        getter = function() return db.autoHide end,
        setter = function(value) db.autoHide = value end,
        getDefault = function() return true end,
        callback = function() ChatBar.UpdateLayout() end,
        dependence = dep,
    })
    panel:AddGroupHeader("位置与外观")
    panel:AddOptionDropdown("附着位置", "按钮条相对聊天栏的位置", {
        optionsList = {1, 2},
        optionNames = {"附着于聊天栏上方", "附着于聊天栏下方"},
        getter = function() return db.anchor end,
        setter = function(value) db.anchor = tonumber(value) or 1 end,
        getDefault = function() return 1 end,
        callback = function() ChatBar.UpdatePoint() end,
        dependence = dep,
    })
    local optX = panel:AddOptionSlider("X 偏移", "按钮条的水平偏移", {
        min = -200, max = 200, step = 1, decimalNumbers = 0,
        getter = function() return db.offsetX end,
        setter = function(value) db.offsetX = value end,
        getDefault = function() return ChatBar.defaults.offsetX end,
        callback = function() ChatBar.UpdatePoint() end,
        dependence = dep,
    })
    if optX then optX.optionName = "GW2PlusChatBar_OffsetX" end
    local optY = panel:AddOptionSlider("Y 偏移", "按钮条的垂直偏移", {
        min = -200, max = 200, step = 1, decimalNumbers = 0,
        getter = function() return db.offsetY end,
        setter = function(value) db.offsetY = value end,
        getDefault = function() return ChatBar.defaults.offsetY end,
        callback = function() ChatBar.UpdatePoint() end,
        dependence = dep,
    })
    if optY then optY.optionName = "GW2PlusChatBar_OffsetY" end
    local optScale = panel:AddOptionSlider("缩放", "按钮条的整体缩放", {
        min = 0.8, max = 1.6, step = 0.01, decimalNumbers = 2,
        getter = function() return db.scale end,
        setter = function(value) db.scale = value end,
        getDefault = function() return 1.0 end,
        callback = function() ChatBar.UpdateScale() end,
        dependence = dep,
    })
    if optScale then optScale.optionName = "GW2PlusChatBar_Scale" end
    local function RedrawSlider(optionName)
        local widget = GW.FindSettingsWidgetByOption and GW.FindSettingsWidgetByOption(optionName)
        if not widget or widget.optionType ~= "slider" or not widget.get then return end
        local value = widget.get()
        if widget.slider then widget.slider:SetValue(value) end
        if widget.inputFrame and widget.inputFrame.input then
            widget.inputFrame.input:SetText(string.format("%." .. (widget.decimalNumbers or 0) .. "f", value))
        end
    end
    panel:AddOptionButton("重置位置与缩放", "把偏移和缩放恢复为默认值", {
        callback = function()
            db.offsetX = ChatBar.defaults.offsetX
            db.offsetY = ChatBar.defaults.offsetY
            db.scale = ChatBar.defaults.scale
            ChatBar.UpdatePoint()
            ChatBar.UpdateScale()
            RedrawSlider("GW2PlusChatBar_OffsetX")
            RedrawSlider("GW2PlusChatBar_OffsetY")
            RedrawSlider("GW2PlusChatBar_Scale")
        end,
        isNegativeButton = true,
        dependence = dep,
    })
    panel:AddGroupHeader("聊天频道")
    local windows = ChatBar.GetChatWindowList()
    if #windows > 0 then
        panel:AddOptionDropdown("频道屏蔽控制窗口", "右键屏蔽频道时，作用于哪个聊天窗口", {
            optionsList = windows,
            optionNames = windows,
            getter = function() return db.banWindow or windows[1] end,
            setter = function(value) db.banWindow = value end,
            getDefault = function() return windows[1] end,
            callback = function() ChatBar.UpdateBlockedIcons() end,
            dependence = dep,
        })
    end
    for _, group in ipairs(GROUPS) do
        local added = group.header == "聊天频道"
        for _, key in ipairs(group.keys) do
            local def = GetDef(key)
            if def and (not def.addon or IsLoaded(def.addon)) then
                if not added then
                    panel:AddGroupHeader(group.header)
                    added = true
                end
                panel:AddOption(BUTTON_LABEL[key] or key, nil, {
                    getter = function() return not db.hidden[key] end,
                    setter = function(value) db.hidden[key] = (not value) or nil end,
                    getDefault = function() return true end,
                    callback = function() ChatBar.UpdateLayout() end,
                    dependence = dep,
                })
            end
        end
    end
    return panel
end
addonTable.BuildChatBarPanel = BuildPanel
