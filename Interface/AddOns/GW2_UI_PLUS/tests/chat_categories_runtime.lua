local function Noop() end

local function CreateTextRegion()
    return {
        SetFont = Noop,
        SetTextColor = Noop,
        SetText = Noop,
    }
end

local function CreatePanel(parent, initializeOptions)
    local panel = {
        parent = parent,
        gwOptions = initializeOptions and {} or nil,
        header = CreateTextRegion(),
        breadcrumb = CreateTextRegion(),
        sub = CreateTextRegion(),
        hidden = false,
    }
    function panel:GetParent() return self.parent end
    function panel:Hide() self.hidden = true end
    function panel:AddGroupHeader(name)
        local option = {name = name, optionType = "header"}
        self.gwOptions = self.gwOptions or {}
        self.gwOptions[#self.gwOptions + 1] = option
        return option
    end
    return panel
end

function CreateFrame(_, _, parent)
    return CreatePanel(parent, false)
end

DEFAULT_CHAT_FRAME = {AddMessage = Noop}
DAMAGE_TEXT_FONT = "damage-font"
UNIT_NAME_FONT = "unit-font"

local registry = {
    list = {},
    byPanel = setmetatable({}, {__mode = "k"}),
    byOptionName = {},
}
local dependenciesChecked = false
GW2_ADDON = {
    SettingsWidgetRegistry = registry,
    Colors = {TextColors = {LightHeader = {GetRGB = function()
        return 1, 1, 1
    end}}},
    CheckDependencies = function() dependenciesChecked = true end,
}

local function RegisterPanel(panel)
    local bucket = {entries = {}, panel = panel}
    registry.byPanel[panel] = bucket
    for _, option in ipairs(panel.gwOptions) do
        local widget = option.__widget or {
            Hide = function(self) self.hidden = true end,
        }
        for key, value in pairs(option) do
            if key ~= "__widget" then widget[key] = value end
        end
        option.__widget = widget
        local entry = {
            widget = widget,
            panel = panel,
            optionName = option.optionName,
        }
        widget.__gwRegEntry = entry
        bucket.entries[#bucket.entries + 1] = entry
        registry.list[#registry.list + 1] = entry
        if option.optionName then
            local entries = registry.byOptionName[option.optionName] or {}
            registry.byOptionName[option.optionName] = entries
            entries[#entries + 1] = entry
        end
    end
end

function GW2_ADDON.RefreshSettingsPanel(panel)
    RegisterPanel(panel)
end

local nativeTargets = {
    CHATFRAME_ENABLED = "enhancement",
    CHAT_USE_GW2_STYLE = "enhancement",
    CHAT_FIND_URL = "enhancement",
    CHAT_HYPERLINK_TOOLTIP = "enhancement",
    CHAT_SHORT_CHANNEL_NAMES = "enhancement",
    CHAT_SHOW_LFG_ICONS = "enhancement",
    CHAT_CLASS_COLOR_MENTIONS = "enhancement",
    CHAT_KEYWORDS_EMOJI = "enhancement",
    copyChatLines = "enhancement",
    CHATFRAME_FADE = "layout",
    CHATFRAME_EDITBOX_HIDE = "layout",
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
}
local plusTargets = {
    GW2PlusChatWindow_ClassColor = "enhancement",
    GW2PlusChatWindow_Enable = "layout",
    GW2PlusChatWindow_Width = "layout",
    GW2PlusChatWindow_Height = "layout",
    GW2PlusChatWindow_OffsetX = "layout",
    GW2PlusChatWindow_OffsetY = "layout",
    GW2PlusChatWindow_ResetPosition = "layout",
    GW2PlusChatWindow_EditBoxTop = "layout",
    GW2PlusChatWindow_HideJoinLeave = "messages",
    GW2PlusChatWindow_TrimRepeat = "messages",
    GW2PlusChatWindow_BlacklistEnable = "messages",
    GW2PlusChatWindow_Blacklist = "messages",
    GW2PlusChatWindow_HideBugGrabberSpam = "messages",
}

local parent = {}
local nativePanel = CreatePanel(parent, true)
for optionName in pairs(nativeTargets) do
    local option = {
        name = optionName,
        optionName = optionName,
        optionType = optionName == "historySize" and "slider" or "boolean",
    }
    if optionName == "CHAT_SPAM_INTERVAL_TIMER" then
        option.dependence = {CHATFRAME_ENABLED = true}
    end
    nativePanel.gwOptions[#nativePanel.gwOptions + 1] = option
    if optionName == "historySize" then
        nativePanel.gwOptions[#nativePanel.gwOptions + 1] = {
            name = "清空历史",
            optionType = "button",
        }
    end
end

local chatWindowPanel = CreatePanel(parent, true)
for optionName in pairs(plusTargets) do
    local option = {
        name = optionName,
        optionName = optionName,
        optionType = "boolean",
    }
    if optionName == "GW2PlusChatWindow_Blacklist" then
        option.dependence = {GW2PlusChatWindow_BlacklistEnable = true}
    end
    chatWindowPanel.gwOptions[#chatWindowPanel.gwOptions + 1] = option
end
chatWindowPanel.gwOptions[#chatWindowPanel.gwOptions + 1] = {
    name = "重复入口",
    optionName = "GW2PlusChatWindow_ButtonsPosition",
    optionType = "dropdown",
}
local chatBarPanel = CreatePanel(parent, true)

RegisterPanel(nativePanel)
RegisterPanel(chatWindowPanel)
local oldWidgets = {}
for _, entry in ipairs(registry.list) do
    oldWidgets[#oldWidgets + 1] = entry.widget
end

local addonTable = {SetPanelTitle = Noop}
assert(loadfile("Modules/Settings/ChatCategories.lua"))(
    "GW2_UI_PLUS", addonTable)
local panels = assert(addonTable.BuildChatCategoryPanels(
    nativePanel, chatWindowPanel, chatBarPanel))

assert(registry.byPanel[nativePanel] == nil,
    "原生聊天面板注册桶未移除")
assert(registry.byPanel[chatWindowPanel] == nil,
    "旧聊天窗口面板注册桶未移除")
for _, widget in ipairs(oldWidgets) do
    assert(widget.hidden, "旧来源控件未隐藏")
    assert(widget.__gwRegEntry == nil, "旧来源控件仍持有注册项")
end

local expectedPanels = {
    enhancement = panels.enhancement,
    layout = panels.layout,
    messages = panels.messages,
}
for optionName, target in pairs(nativeTargets) do
    local entries = registry.byOptionName[optionName]
    assert(entries and #entries == 1,
        "原生设置未唯一注册: " .. optionName)
    assert(entries[1].panel == expectedPanels[target],
        "原生设置页面归属错误: " .. optionName)
end
for optionName, target in pairs(plusTargets) do
    local entries = registry.byOptionName[optionName]
    assert(entries and #entries == 1,
        "Plus 设置未唯一注册: " .. optionName)
    assert(entries[1].panel == expectedPanels[target],
        "Plus 设置页面归属错误: " .. optionName)
end
assert(registry.byOptionName.GW2PlusChatWindow_ButtonsPosition == nil,
    "重复的聊天按钮位置入口仍被注册")
assert(registry.byOptionName.GW2PlusChatHistoryReset
    and #registry.byOptionName.GW2PlusChatHistoryReset == 1,
    "清空聊天历史未注册到新页面")

local spam = registry.byOptionName.CHAT_SPAM_INTERVAL_TIMER[1].widget
assert(spam.dependence and spam.dependence.CHATFRAME_ENABLED == true,
    "跨页聊天主开关依赖丢失")
local blacklist =
    registry.byOptionName.GW2PlusChatWindow_Blacklist[1].widget
assert(blacklist.dependence
    and blacklist.dependence.GW2PlusChatWindow_BlacklistEnable == true,
    "黑名单输入框依赖丢失")
assert(registry.byOptionName.CHAT_KEYWORDS[1].widget.name == "高亮关键词",
    "高亮关键词名称未区分")
assert(blacklist.name == "黑名单关键词", "黑名单关键词名称未区分")
assert(dependenciesChecked, "新页面创建后未刷新设置依赖")
print("聊天分类运行时检查通过")
