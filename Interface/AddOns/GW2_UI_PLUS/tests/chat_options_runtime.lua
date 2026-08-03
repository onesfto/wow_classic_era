local function Noop() end

local function CreateTextRegion()
    return {
        SetFont = Noop,
        SetTextColor = Noop,
        SetText = Noop,
    }
end

local function AddOption(panel, optionType, name, values)
    values = values or {}
    if values.hidden then return end
    local option = {
        name = name,
        optionType = optionType,
        dependence = values.dependence,
        isMasterToggle = values.isMasterToggle,
        optionName = values.getterSetter,
    }
    panel.gwOptions[#panel.gwOptions + 1] = option
    return option
end

function CreateFrame()
    local panel = {
        gwOptions = {},
        header = CreateTextRegion(),
        breadcrumb = CreateTextRegion(),
        sub = CreateTextRegion(),
    }
    function panel:AddOption(name, _, values)
        return AddOption(self, "boolean", name, values)
    end
    function panel:AddOptionButton(name, _, values)
        return AddOption(self, "button", name, values)
    end
    function panel:AddOptionDropdown(name, _, values)
        return AddOption(self, "dropdown", name, values)
    end
    function panel:AddOptionSlider(name, _, values)
        return AddOption(self, "slider", name, values)
    end
    function panel:AddGroupHeader(name)
        return AddOption(self, "header", name, {})
    end
    return panel
end

C_AddOns = {IsAddOnLoaded = function() return true end}
DEFAULT_CHAT_FRAME = {AddMessage = Noop}
GW2_ADDON = {
    GetSettingsTabFrame = function() return true end,
    Colors = {TextColors = {LightHeader = {GetRGB = function()
        return 1, 1, 1
    end}}},
}
GW2_UI_PLUS_ChatBarSV = {
    enable = true,
    hidden = {},
}

local buttonKeys = {
    "SAY", "YELL", "GUILD", "PARTY", "RAID", "INSTANCE_CHAT",
    "GENERAL", "TRADE", "LOOK_FOR_GROUP", "PIG", "BIGFOOTWORLD",
    "EMOJI", "ROLL", "MACRO", "DBM", "ATLASLOOT", "BIAOGE",
    "MEETINGHORN", "MRT",
}
local buttons = {}
for _, key in ipairs(buttonKeys) do
    buttons[#buttons + 1] = {key = key}
end

local addonTable = {
    SetPanelTitle = Noop,
    ChatBar = {
        BUTTONS = buttons,
        defaults = {offsetX = 0, offsetY = 0},
        InitDB = Noop,
        UpdatePoint = Noop,
        UpdateScale = Noop,
        UpdateFade = Noop,
        UpdateLayout = Noop,
        UpdateBlockedIcons = Noop,
        GetChatWindowList = function() return {"综合"} end,
    },
}

assert(loadfile("Modules/ChatBar/Options.lua"))("GW2_UI_PLUS", addonTable)
local panel = assert(addonTable.BuildChatBarPanel({}))
local optionNames = {}
local dependentCount = 0
for _, option in ipairs(panel.gwOptions) do
    if option.dependence then
        dependentCount = dependentCount + 1
        assert(option.optionName, "依赖控件缺少 optionName: " .. option.name)
        assert(not optionNames[option.optionName],
            "依赖控件 optionName 重复: " .. option.optionName)
        optionNames[option.optionName] = true
        assert(option.dependence.GW2PlusChatBar_Enable == true,
            "依赖控件未绑定频道按钮主开关: " .. option.name)
    end
end

assert(dependentCount == 27,
    "频道按钮依赖控件数量异常: " .. dependentCount)
print("聊天选项运行时检查通过")
