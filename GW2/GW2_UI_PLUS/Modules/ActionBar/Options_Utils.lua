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
    colorPicker = {"Button", "GwOptionBoxColorPickerTmpl"},
    header = {"Frame", "GwOptionBoxHeader"},
    subHeader = {"Frame", "GwOptionBoxSubHeader"},
}
Utils.HEADER_EXTENT = 40
Utils.HEADER_OPTION_GAP = 8
Utils.MASTER_TOGGLE_SEPARATOR_EXTENT = 5
Utils.HOTKEY_POSITION_VALUES = {
    "TOPLEFT", "TOP", "TOPRIGHT", "CENTER",
    "BOTTOMLEFT", "BOTTOM", "BOTTOMRIGHT",
}
Utils.HOTKEY_POSITION_NAMES = {
    "左上", "上", "右上", "居中",
    "左下", "下", "右下",
}

local function UpdateMasterToggleStyle(widget, hovered)
    if not widget or not widget.isMasterToggle then return end
    local checked = widget.checkbutton and widget.checkbutton:GetChecked()
    local r, g, b = GW.Colors.TextColors.LightHeader:GetRGB()
    if widget.masterToggleBg then
        local textWidth = widget.title:GetStringWidth()
        widget.masterToggleBg:SetWidth(math.max(
            80, math.min(textWidth + 22, widget:GetWidth() - 36)))
        widget.masterToggleBg:SetColorTexture(
            r, g, b, hovered and 0.16 or (checked and 0.08 or 0))
    end
    widget.masterToggleAccent:SetColorTexture(
        r, g, b, checked and 0.75 or (hovered and 0.35 or 0))
end

local function SetupMasterToggleStyle(widget)
    if not widget or not widget.isMasterToggle
        or widget.masterToggleStyleHooked then
        return
    end
    widget.masterToggleStyleHooked = true
    widget.masterToggleBg = widget:CreateTexture(nil, "BACKGROUND")
    widget.masterToggleBg:SetPoint("LEFT", widget.title, "LEFT", -9, 0)
    widget.masterToggleBg:SetHeight(24)
    widget.masterToggleAccent = widget:CreateTexture(nil, "ARTWORK")
    widget.masterToggleAccent:SetPoint("TOPLEFT", -2, -3)
    widget.masterToggleAccent:SetPoint("BOTTOMLEFT", -2, 3)
    widget.masterToggleAccent:SetWidth(2)
    widget:HookScript("OnEnter", function(self)
        UpdateMasterToggleStyle(self, true)
    end)
    widget:HookScript("OnLeave", function(self)
        UpdateMasterToggleStyle(self, false)
    end)
    widget:HookScript("OnClick", function(self)
        UpdateMasterToggleStyle(self, self:IsMouseOver())
    end)
    if widget.checkbutton then
        widget.checkbutton:HookScript("OnEnter", function()
            UpdateMasterToggleStyle(widget, true)
        end)
        widget.checkbutton:HookScript("OnLeave", function()
            UpdateMasterToggleStyle(widget, false)
        end)
        widget.checkbutton:HookScript("OnClick", function()
            UpdateMasterToggleStyle(widget, widget:IsMouseOver())
        end)
        hooksecurefunc(widget.checkbutton, "SetChecked", function()
            UpdateMasterToggleStyle(widget, widget:IsMouseOver())
        end)
    end
    UpdateMasterToggleStyle(widget, false)
end

local function SetMasterToggleSeparatorShown(row, shown)
    if shown then
        if not row.masterToggleSeparator then
            row.masterToggleSeparator = row:CreateTexture(nil, "ARTWORK")
            row.masterToggleSeparator:SetTexture(
                "Interface/AddOns/GW2_UI/textures/hud/levelreward-sep.png")
            row.masterToggleSeparator:SetTexCoord(0.5, 1, 0, 1)
            row.masterToggleSeparator:SetSize(275, 2)
        end
        row.masterToggleSeparator:ClearAllPoints()
        row.masterToggleSeparator:SetPoint("TOPLEFT", 8, 5)
        row.masterToggleSeparator:Show()
    elseif row.masterToggleSeparator then
        row.masterToggleSeparator:Hide()
    end
end
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
    panel.breadcrumb:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
    panel.breadcrumb:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
    panel.breadcrumb:SetText(breadcrumb)
    addonTable.SetPanelTitle(panel, "动作条", breadcrumb)
    panel.sub:SetFont(UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
    panel.sub:SetTextColor(181 / 255, 160 / 255, 128 / 255)
    panel.sub:SetText(description or "")
    return panel
end
local function RegisterPanelWidget(panel, widget)
    panel.gwPlusWidgets = panel.gwPlusWidgets or {}
    for _, registered in ipairs(panel.gwPlusWidgets) do
        if registered == widget then return end
    end
    panel.gwPlusWidgets[#panel.gwPlusWidgets + 1] = widget
end
function Utils.CreateOptionWidget(panel, option)
    if option.__widget then
        option.__gwPlusWidget = option.__widget
        RegisterPanelWidget(panel, option.__widget)
        return option.__widget
    end
    local config = Utils.WIDGET_TEMPLATES[option.optionType]
    if not config then return end
    local widget = CreateFrame(config[1], nil, panel, config[2])
    widget:Hide()
    widget.displayName = option.name
    for key, value in pairs(option) do widget[key] = value end
    widget.title:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
    widget.title:SetShadowColor(0, 0, 0, 1)
    widget.title:SetText(widget.displayName or "")
    if option.isMasterToggle then
        widget.title:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
    else
        widget.title:SetTextColor(1, 1, 1)
    end
    GW.SettingsInitOptionWidget(widget, option, panel)
    SetupMasterToggleStyle(widget)
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
    RegisterPanelWidget(panel, widget)
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
local function LayoutCompactColorPicker(widget, width)
    if not widget.button then return end
    local edge = 5
    local titleWidth = 76
    local gap = 6
    local buttonWidth = math.max(width - (edge * 2) - titleWidth - gap, 80)
    widget.title:ClearAllPoints()
    widget.title:SetPoint("LEFT", widget, "LEFT", edge, 0)
    widget.title:SetWidth(titleWidth)
    widget.title:SetJustifyH("LEFT")
    widget.button:ClearAllPoints()
    widget.button:SetPoint("LEFT", widget, "LEFT", edge + titleWidth + gap, 0)
    widget.button:SetSize(buttonWidth, 20)
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
        local previous = options[index - 1]
        local nextOption = options[index]
        if previous and previous.isMasterToggle and nextOption
            and not nextOption.isMasterToggle then
            rows[#rows + 1] = {kind = "masterToggleSeparator"}
        end
    end
    local view = CreateScrollBoxListLinearView()
    view:SetElementExtentCalculator(function(_, data)
        if data.kind == "masterToggleSeparator" then
            return Utils.MASTER_TOGGLE_SEPARATOR_EXTENT
        end
        local extent = (data.option.optionType == "header"
            or data.option.optionType == "subHeader"
            or data.option.optionType == "button"
            or data.option.isMasterToggle) and Utils.HEADER_EXTENT or 46
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
        if data.kind == "masterToggleSeparator" then
            row.gwPlusWidgets = nil
            SetMasterToggleSeparatorShown(row, true)
            return
        end
        SetMasterToggleSeparatorShown(row, false)
        row.gwPlusWidgets = data.widgets or {data.widget}
        local gap = 0
        local width = 550
        if data.widgets then
            local columnCount = data.columnCount
            gap = panel.gwPlusColumnGap or 0
            local totalGap = gap * (columnCount - 1)
            width = (550 - totalGap) / columnCount
        end
        for column, widget in ipairs(row.gwPlusWidgets) do
            widget:SetParent(row)
            widget:ClearAllPoints()
            if not data.widgets and data.option.optionType == "button" then
                widget:SetPoint("TOPLEFT", row, "TOPLEFT",
                    8, -8 - (data.topPadding or 0))
                widget:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 8, 8)
                widget:SetWidth(550)
            elseif not data.widgets and widget.isMasterToggle then
                widget:SetPoint("TOPLEFT", row, "TOPLEFT", 8, -8)
                widget:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 8, 8)
                widget:SetWidth(550)
            elseif data.widgets and widget.optionType == "button" then
                -- 原生布局为 40 高的行保留上下各 8 像素，按钮实际高度为 24。
                widget:SetPoint("TOPLEFT", row, "TOPLEFT",
                    8 + ((column - 1) * (width + gap)),
                    -8 - (data.topPadding or 0))
                widget:SetSize(width, 24)
            else
                widget:SetPoint("TOPLEFT", row, "TOPLEFT",
                    8 + ((column - 1) * (width + gap)),
                    -3 - (data.topPadding or 0))
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
            elseif data.widgets and widget.optionType == "colorPicker" then
                LayoutCompactColorPicker(widget, width)
            end
            if widget.isMasterToggle then
                UpdateMasterToggleStyle(widget, false)
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
        SetMasterToggleSeparatorShown(row, false)
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
function Utils.ActionBarDefault(key, fallback)
    local defaults = addonTable.PlusProfileDefaults
    if defaults and defaults.IsPlusProfileDefault
        and defaults.IsPlusProfileDefault()
        and defaults.GetActionBarDefault then
        local value = defaults.GetActionBarDefault(key)
        if value ~= nil then return value end
    end
    local value = Utils.NativeDefault(key, nil)
    if value ~= nil then return value end
    return fallback
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
