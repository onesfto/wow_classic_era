local _, addonTable = ...

local OPTION_TARGETS = {
    CHATFRAME_ENABLED = "enhancement",
    CHAT_USE_GW2_STYLE = "enhancement",
    CHAT_FIND_URL = "enhancement",
    CHAT_HYPERLINK_TOOLTIP = "enhancement",
    CHAT_SHORT_CHANNEL_NAMES = "enhancement",
    CHAT_SHOW_LFG_ICONS = "enhancement",
    CHAT_CLASS_COLOR_MENTIONS = "enhancement",
    CHAT_KEYWORDS_EMOJI = "enhancement",
    CHAT_SOCIAL_LINK = "enhancement",
    copyChatLines = "enhancement",
    GW2PlusChatWindow_ClassColor = "enhancement",

    GW2PlusChatWindow_Enable = "layout",
    GW2PlusChatWindow_Width = "layout",
    GW2PlusChatWindow_Height = "layout",
    GW2PlusChatWindow_OffsetX = "layout",
    GW2PlusChatWindow_OffsetY = "layout",
    GW2PlusChatWindow_ResetPosition = "layout",
    CHATFRAME_FADE = "layout",
    CHATFRAME_EDITBOX_HIDE = "layout",
    GW2PlusChatWindow_EditBoxTop = "layout",
    CHAT_BUTTONS_POSITION = "layout",
    CHAT_NUM_SCROLL_MESSAGES = "layout",
    CHAT_SCROLL_DOWN_INTERVAL = "layout",

    chatHistory = "messages",
    historySize = "messages",
    CHAT_MAX_COPY_CHAT_LINES = "messages",
    CHAT_ADD_TIMESTAMP_TO_ALL = "messages",
    timeStampFormat = "messages",
    CHAT_KEYWORDS = "messages",
    CHAT_KEYWORDS_ALERT_COLOR = "messages",
    CHAT_KEYWORDS_ALERT_NEW = "messages",
    interruptAnnounce = "messages",
    CHAT_SPAM_INTERVAL_TIMER = "messages",
    CHAT_INCOMBAT_TEXT_REPEAT = "messages",
    GW2PlusChatWindow_HideJoinLeave = "messages",
    GW2PlusChatWindow_TrimRepeat = "messages",
    GW2PlusChatWindow_BlacklistEnable = "messages",
    GW2PlusChatWindow_Blacklist = "messages",
    GW2PlusChatWindow_HideBugGrabberSpam = "messages",
}

local categoryPanels

local function RemoveArrayValue(list, value)
    if not list then return end
    for index = #list, 1, -1 do
        if list[index] == value then
            table.remove(list, index)
        end
    end
end

local function UnregisterPanelWidgets(GW, panel)
    local registry = GW.SettingsWidgetRegistry
    local bucket = registry and registry.byPanel and registry.byPanel[panel]
    if not bucket then return end

    for index = #bucket.entries, 1, -1 do
        local entry = bucket.entries[index]
        RemoveArrayValue(registry.list, entry)
        if entry.optionName and registry.byOptionName then
            local entries = registry.byOptionName[entry.optionName]
            RemoveArrayValue(entries, entry)
            if entries and #entries == 0 then
                registry.byOptionName[entry.optionName] = nil
            end
        end
        if entry.widget then
            entry.widget:Hide()
            entry.widget.__gwRegEntry = nil
        end
    end
    registry.byPanel[panel] = nil
end

local function ClearSourcePanel(GW, panel)
    UnregisterPanelWidgets(GW, panel)
    for _, option in ipairs(panel.gwOptions or {}) do
        if option.__widget then
            option.__widget:Hide()
        end
        option.__widget = nil
        option.__gwPlusWidget = nil
    end
    panel.gwOptions = {}
    panel:Hide()
end

local function CollectOptions(nativePanel, chatWindowPanel)
    local options = {}
    for _, panel in ipairs({nativePanel, chatWindowPanel}) do
        for _, option in ipairs(panel.gwOptions or {}) do
            if option.optionName then
                options[option.optionName] = option
            end
        end
    end
    return options
end

local function FindHistoryReset(nativePanel)
    local options = nativePanel.gwOptions or {}
    for index, option in ipairs(options) do
        if option.optionName == "historySize" then
            local reset = options[index + 1]
            if reset and reset.optionType == "button" then
                return reset
            end
        end
    end
end

local function CreatePanel(GW, parent, panelId, breadcrumb, description)
    local panel = CreateFrame("Frame", nil, parent, "GwSettingsPanelTmpl")
    panel.panelId = panelId
    panel.gwOptions = {}
    panel.header:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 20)
    panel.header:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
    panel.header:SetText("聊天")
    panel.breadcrumb:SetFont(
        DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
    panel.breadcrumb:SetTextColor(
        GW.Colors.TextColors.LightHeader:GetRGB())
    panel.breadcrumb:SetText(breadcrumb)
    addonTable.SetPanelTitle(panel, "聊天", breadcrumb)
    panel.sub:SetFont(UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
    panel.sub:SetTextColor(181 / 255, 160 / 255, 128 / 255)
    panel.sub:SetText(description)
    return panel
end

local function AppendOption(panel, options, key, groupName)
    local option = options[key]
    if not option then return end
    option.groupHeaderName = groupName
    panel.gwOptions[#panel.gwOptions + 1] = option
    return option
end

local function AppendGroup(panel, options, groupName, keys)
    panel:AddGroupHeader(groupName)
    for _, key in ipairs(keys) do
        AppendOption(panel, options, key, groupName)
    end
end

local function BuildEnhancementPanel(GW, parent, options)
    local panel = CreatePanel(
        GW, parent, "gw2_ui_plus_chat_enhancement", "聊天增强",
        "调整聊天消息的样式、链接与快捷交互。")
    AppendOption(panel, options, "CHATFRAME_ENABLED")
    AppendGroup(panel, options, "消息显示", {
        "CHAT_USE_GW2_STYLE",
        "CHAT_SHORT_CHANNEL_NAMES",
        "CHAT_SHOW_LFG_ICONS",
        "CHAT_CLASS_COLOR_MENTIONS",
        "GW2PlusChatWindow_ClassColor",
        "CHAT_KEYWORDS_EMOJI",
    })
    AppendGroup(panel, options, "链接与复制", {
        "CHAT_FIND_URL",
        "CHAT_HYPERLINK_TOOLTIP",
        "CHAT_SOCIAL_LINK",
        "copyChatLines",
    })
    return panel
end

local function BuildLayoutPanel(GW, parent, options)
    local panel = CreatePanel(
        GW, parent, "gw2_ui_plus_chat_layout", "窗口布局",
        "调整主聊天窗口的位置、外观与滚动行为。")
    AppendOption(panel, options, "GW2PlusChatWindow_Enable")
    AppendGroup(panel, options, "位置与大小", {
        "GW2PlusChatWindow_Width",
        "GW2PlusChatWindow_Height",
        "GW2PlusChatWindow_OffsetX",
        "GW2PlusChatWindow_OffsetY",
        "GW2PlusChatWindow_ResetPosition",
    })
    AppendGroup(panel, options, "外观与操作", {
        "CHATFRAME_FADE",
        "CHATFRAME_EDITBOX_HIDE",
        "GW2PlusChatWindow_EditBoxTop",
        "CHAT_BUTTONS_POSITION",
    })
    AppendGroup(panel, options, "滚动", {
        "CHAT_NUM_SCROLL_MESSAGES",
        "CHAT_SCROLL_DOWN_INTERVAL",
    })
    return panel
end

local function BuildMessagesPanel(GW, parent, options, historyReset)
    local panel = CreatePanel(
        GW, parent, "gw2_ui_plus_chat_messages", "消息管理",
        "调整聊天记录、关键词提醒与消息过滤。")
    historyReset.optionName = "GW2PlusChatHistoryReset"
    options.GW2PlusChatHistoryReset = historyReset

    AppendGroup(panel, options, "记录与时间", {
        "chatHistory",
        "historySize",
        "GW2PlusChatHistoryReset",
        "CHAT_MAX_COPY_CHAT_LINES",
        "CHAT_ADD_TIMESTAMP_TO_ALL",
        "timeStampFormat",
    })
    local option = options.CHAT_KEYWORDS
    option.name = "高亮关键词"
    AppendGroup(panel, options, "关键词与通报", {
        "CHAT_KEYWORDS",
        "CHAT_KEYWORDS_ALERT_COLOR",
        "CHAT_KEYWORDS_ALERT_NEW",
        "interruptAnnounce",
    })
    option = options.GW2PlusChatWindow_Blacklist
    option.name = "黑名单关键词"
    AppendGroup(panel, options, "过滤与保护", {
        "CHAT_SPAM_INTERVAL_TIMER",
        "CHAT_INCOMBAT_TEXT_REPEAT",
        "GW2PlusChatWindow_HideJoinLeave",
        "GW2PlusChatWindow_TrimRepeat",
        "GW2PlusChatWindow_BlacklistEnable",
        "GW2PlusChatWindow_Blacklist",
        "GW2PlusChatWindow_HideBugGrabberSpam",
    })
    return panel
end

local function BuildChatCategoryPanels(
    nativePanel, chatWindowPanel, chatBarPanel)
    if categoryPanels then return categoryPanels end

    local GW = _G.GW2_ADDON
    if not GW or not GW.RefreshSettingsPanel
        or not GW.SettingsWidgetRegistry or not nativePanel
        or not chatWindowPanel or not chatBarPanel then
        return
    end

    local options = CollectOptions(nativePanel, chatWindowPanel)
    local historyReset = FindHistoryReset(nativePanel)
    for optionName in pairs(OPTION_TARGETS) do
        if optionName ~= "CHAT_SOCIAL_LINK" and not options[optionName] then
            if DEFAULT_CHAT_FRAME then
                DEFAULT_CHAT_FRAME:AddMessage(
                    "GW2_UI_PLUS: 缺少聊天设置选项: " .. optionName)
            end
            return
        end
    end
    if not historyReset then
        if DEFAULT_CHAT_FRAME then
            DEFAULT_CHAT_FRAME:AddMessage(
                "GW2_UI_PLUS: 缺少清空聊天历史选项")
        end
        return
    end

    local parent = chatWindowPanel:GetParent()
    ClearSourcePanel(GW, nativePanel)
    ClearSourcePanel(GW, chatWindowPanel)

    categoryPanels = {
        enhancement = BuildEnhancementPanel(GW, parent, options),
        layout = BuildLayoutPanel(GW, parent, options),
        chatBar = chatBarPanel,
        messages = BuildMessagesPanel(GW, parent, options, historyReset),
    }
    GW.RefreshSettingsPanel(categoryPanels.enhancement)
    GW.RefreshSettingsPanel(categoryPanels.layout)
    GW.RefreshSettingsPanel(categoryPanels.messages)
    categoryPanels.enhancement:Hide()
    categoryPanels.layout:Hide()
    categoryPanels.messages:Hide()
    if GW.CheckDependencies then GW.CheckDependencies() end
    return categoryPanels
end

addonTable.BuildChatCategoryPanels = BuildChatCategoryPanels
