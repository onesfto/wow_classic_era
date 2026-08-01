local _, addonTable = ...
local GW = _G.GW2_ADDON
if not GW or not GW.GetSettingsTabFrame then return end
local AB = addonTable.PlusActionBar
if not AB then return end
local Utils = {}
addonTable.ActionBarOptionsUtils = Utils
Utils.WIDGET_TEMPLATES = {
    boolean = {"Button", "GwOptionBoxTmpl"},
    slider = {"Button", "GwOptionBoxSliderTmpl"},
    dropdown = {"Button", "GwOptionBoxDropDownTmpl"},
    text = {"Button", "GwOptionBoxTextTmpl"},
    button = {"Button", "GwButtonTextTmpl"},
    header = {"Frame", "GwOptionBoxHeader"},
    subHeader = {"Frame", "GwOptionBoxSubHeader"},
}
Utils.HEADER_EXTENT = 40
Utils.HEADER_OPTION_GAP = 8
Utils.HOTKEY_POSITION_VALUES = {
    "TOPLEFT", "TOP", "TOPRIGHT", "CENTER",
    "BOTTOMLEFT", "BOTTOM", "BOTTOMRIGHT",
}
Utils.HOTKEY_POSITION_NAMES = {
    "左上", "上", "右上", "居中",
    "左下", "下", "右下",
}
function Utils.RedrawSlider(optionName)
    local widget = GW.FindSettingsWidgetByOption and GW.FindSettingsWidgetByOption(optionName)
    if not widget or widget.optionType ~= "slider" or not widget.get then return end
    local value = widget.get()
    if widget.slider then widget.slider:SetValue(value) end
    if widget.inputFrame and widget.inputFrame.input then
        widget.inputFrame.input:SetText(string.format("%." .. (widget.decimalNumbers or 0) .. "f", value))
    end
end
function Utils.CreatePanel(parent, panelId, breadcrumb, description)
    local panel = CreateFrame("Frame", nil, parent, "GwSettingsPanelTmpl")
    panel.panelId = panelId
    panel.header:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 20)
    panel.header:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
    panel.header:SetText("动作条")
    panel.header:SetWidth(panel.header:GetStringWidth() + 10)
    panel.breadcrumb:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
    panel.breadcrumb:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
    panel.breadcrumb:SetText(breadcrumb)
    panel.sub:SetFont(UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
    panel.sub:SetTextColor(181 / 255, 160 / 255, 128 / 255)
    panel.sub:SetText(description or "")
    return panel
end
function Utils.CreateOptionWidget(panel, option)
    local config = Utils.WIDGET_TEMPLATES[option.optionType]
    if not config then return end
    local widget = CreateFrame(config[1], nil, panel, config[2])
    widget:Hide()
    widget.displayName = option.name
    for key, value in pairs(option) do widget[key] = value end
    widget.title:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
    widget.title:SetShadowColor(0, 0, 0, 1)
    widget.title:SetText(widget.displayName or "")
    widget.title:SetTextColor(1, 1, 1)
    GW.SettingsInitOptionWidget(widget, option, panel)
    if option.gwPlusDisabled then
        widget:SetAlpha(0.55)
        if widget.optionType == "boolean" and widget.checkbutton then
            widget.checkbutton:Disable()
        elseif widget.optionType == "slider" then
            if widget.slider then widget.slider:Disable() end
            if widget.inputFrame and widget.inputFrame.input then
                widget.inputFrame.input:Disable()
            end
        elseif widget.optionType == "dropdown" and widget.dropDown then
            widget.dropDown:Disable()
        elseif widget.optionType == "button" then
            widget:Disable()
        end
    end
    option.__gwPlusWidget = widget
    panel.gwPlusWidgets = panel.gwPlusWidgets or {}
    panel.gwPlusWidgets[#panel.gwPlusWidgets + 1] = widget
    return widget
end
local function GetTopPadding(options, index)
    local previous = options[index - 1]
    return previous
        and (previous.optionType == "header"
            or previous.optionType == "subHeader")
        and Utils.HEADER_OPTION_GAP or 0
end
local function LayoutCompactSlider(widget, width)
    if not widget.slider or not widget.inputFrame then return end
    local edge = 5
    local titleWidth = 58
    local inputWidth = width >= 240 and 46 or 40
    local gap = 6
    local sliderWidth = math.max(
        width - (edge * 2) - titleWidth - inputWidth - (gap * 2), 48)
    widget.title:ClearAllPoints()
    widget.title:SetPoint("LEFT", widget, "LEFT", edge, 0)
    widget.title:SetWidth(titleWidth)
    widget.title:SetJustifyH("LEFT")
    widget.slider:ClearAllPoints()
    widget.slider:SetPoint("LEFT", widget, "LEFT",
        edge + titleWidth + gap, 0)
    widget.slider:SetSize(sliderWidth, 20)
    if widget.slider.sliderMinText then
        widget.slider.sliderMinText:SetWidth(math.max(sliderWidth / 2, 24))
    end
    if widget.slider.sliderMaxText then
        widget.slider.sliderMaxText:SetWidth(math.max(sliderWidth / 2, 24))
    end
    widget.inputFrame:ClearAllPoints()
    widget.inputFrame:SetPoint("LEFT", widget.slider, "RIGHT", gap, 0)
    widget.inputFrame:SetSize(inputWidth, 20)
end
local function LayoutCompactDropdown(widget, width)
    if not widget.dropDown then return end
    local edge = 5
    local titleWidth = 58
    local gap = 6
    local dropdownWidth = math.max(
        width - (edge * 2) - titleWidth - gap, 80)
    widget.title:ClearAllPoints()
    widget.title:SetPoint("LEFT", widget, "LEFT", edge, 0)
    widget.title:SetWidth(titleWidth)
    widget.title:SetJustifyH("LEFT")
    widget.dropDown:ClearAllPoints()
    widget.dropDown:SetPoint("LEFT", widget, "LEFT",
        edge + titleWidth + gap, 0)
    widget.dropDown:SetSize(dropdownWidth, 25)
end
local function LayoutCompactText(widget, width)
    if not widget.inputFrame then return end
    local edge = 5
    local titleWidth = 76
    local gap = 6
    local inputWidth = math.max(
        width - (edge * 2) - titleWidth - gap, 70)
    widget.title:ClearAllPoints()
    widget.title:SetPoint("LEFT", widget, "LEFT", edge, 0)
    widget.title:SetWidth(titleWidth)
    widget.title:SetJustifyH("LEFT")
    widget.inputFrame:ClearAllPoints()
    widget.inputFrame:SetPoint(
        "LEFT", widget, "LEFT", edge + titleWidth + gap, 0)
    widget.inputFrame:SetSize(inputWidth, 20)
end
function Utils.InitializePanel(panel)
    local options = panel.gwOptions or {}
    local rows = {}
    local index = 1
    while index <= #options do
        local option = options[index]
        local columnCount = option.gwPlusColumns
        local topPadding = GetTopPadding(options, index)
        if columnCount and columnCount > 1 then
            local row = {
                option = option,
                widgets = {},
                topPadding = topPadding,
                columnCount = columnCount,
            }
            for column = 1, columnCount do
                local grouped = options[index]
                if not grouped or grouped.gwPlusColumns ~= columnCount then break end
                row.widgets[#row.widgets + 1] = Utils.CreateOptionWidget(panel, grouped)
                index = index + 1
            end
            rows[#rows + 1] = row
        else
            rows[#rows + 1] = {
                option = option,
                widget = Utils.CreateOptionWidget(panel, option),
                topPadding = topPadding,
            }
            index = index + 1
        end
    end
    local view = CreateScrollBoxListLinearView()
    view:SetElementExtentCalculator(function(_, data)
        local extent = (data.option.optionType == "header"
            or data.option.optionType == "subHeader"
            or data.option.optionType == "button") and Utils.HEADER_EXTENT or 46
        return extent + (data.topPadding or 0)
    end)
    view:SetElementInitializer("GwFrameTemplate", function(row, data)
        if row.gwPlusWidgets then
            for _, oldWidget in ipairs(row.gwPlusWidgets) do
                oldWidget:Hide()
                oldWidget:ClearAllPoints()
                oldWidget:SetParent(panel)
            end
        end
        row:SetWidth(566)
        row.gwPlusWidgets = data.widgets or {data.widget}
        local width = data.widgets and (550 / data.columnCount) or 550
        for column, widget in ipairs(row.gwPlusWidgets) do
            widget:SetParent(row)
            widget:ClearAllPoints()
            if not data.widgets and data.option.optionType == "button" then
                widget:SetPoint("TOPLEFT", row, "TOPLEFT",
                    8, -8 - (data.topPadding or 0))
                widget:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 8, 8)
                widget:SetWidth(550)
            else
                widget:SetPoint("TOPLEFT", row, "TOPLEFT",
                    8 + ((column - 1) * width), -3 - (data.topPadding or 0))
                widget:SetSize(width, 40)
            end
            if data.widgets and widget.title then
                widget.title:SetWidth(math.max(width - 40, 40))
            end
            if data.widgets and widget.optionType == "slider" then
                LayoutCompactSlider(widget, width)
            elseif data.widgets and widget.optionType == "dropdown" then
                LayoutCompactDropdown(widget, width)
            elseif data.widgets and widget.optionType == "text" then
                LayoutCompactText(widget, width)
            end
            widget:Show()
        end
    end)
    view:SetElementResetter(function(row)
        for _, widget in ipairs(row.gwPlusWidgets or {}) do
            widget:Hide()
            widget:ClearAllPoints()
            widget:SetParent(panel)
        end
        row.gwPlusWidgets = nil
    end)
    ScrollUtil.InitScrollBoxListWithScrollBar(panel.scroll.ScrollBox, panel.scroll.ScrollBar, view)
    GW.HandleTrimScrollBar(panel.scroll.ScrollBar)
    GW.HandleScrollControls(panel.scroll)
    panel.scroll.ScrollBar:SetHideIfUnscrollable(true)
    panel.scroll.ScrollBox:SetDataProvider(CreateDataProvider(rows), ScrollBoxConstants.RetainScrollPosition)
end
function Utils.RefreshPanel(panel)
    if panel.gwPlusRefreshing then return end
    panel.gwPlusRefreshing = true
    for _, widget in ipairs(panel.gwPlusWidgets or {}) do
        if widget.optionType == "boolean" and widget.checkbutton then
            widget.checkbutton:SetChecked(widget.get())
        elseif widget.optionType == "slider" and widget.slider then
            local value = widget.get()
            widget.slider:SetValue(value)
            if widget.inputFrame and widget.inputFrame.input then
                widget.inputFrame.input:SetText(string.format(
                    "%." .. (widget.decimalNumbers or 0) .. "f", value))
            end
        elseif widget.optionType == "dropdown" and widget.dropDown
            and widget.dropDown.GenerateMenu then
            widget.dropDown:GenerateMenu()
        end
    end
    panel.gwPlusRefreshing = false
end
function Utils.ApplyFader()
    if addonTable.PlusFader then addonTable.PlusFader.Refresh() end
end
function Utils.ApplyLayout()
    if addonTable.PlusActionBarLayout then
        addonTable.PlusActionBarLayout.RefreshAll()
    end
end
function Utils.NativeDefault(key, fallback)
    local profile = GW.globalDefault and GW.globalDefault.profile
    local value = profile and profile[key]
    return value ~= nil and value or fallback
end
function Utils.AddResetButton(panel, callback)
    local option = panel:AddOptionButton("恢复默认", "恢复当前页面的设置；有对应动作条时，也会移回默认位置。", {
        callback = function()
            callback()
            Utils.RefreshPanel(panel)
            if AB.RefreshMoverOptionPanel then
                AB.RefreshMoverOptionPanel()
            end
        end,
        isNegativeButton = true,
    })
    return option
end
function Utils.ResetMover(frame)
    AB.ResetMoverPosition(frame)
end
