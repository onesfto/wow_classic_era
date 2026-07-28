-- GW2_UI_PLUS 动作条 —— 设置面板
-- 挂在 GW2_UI 设置窗口的「附加组件 → 动作条」下。

local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW or not GW.GetSettingsTabFrame then return end

local AB = addonTable.PlusActionBar
if not AB then return end

-- 改了配置值滑块不会自己重绘，手动把 widget 的显示值拉回来
local function RedrawSlider(optionName)
    local widget = GW.FindSettingsWidgetByOption and GW.FindSettingsWidgetByOption(optionName)
    if not widget or widget.optionType ~= "slider" or not widget.get then return end
    local value = widget.get()
    if widget.slider then widget.slider:SetValue(value) end
    if widget.inputFrame and widget.inputFrame.input then
        widget.inputFrame.input:SetText(string.format("%." .. (widget.decimalNumbers or 0) .. "f", value))
    end
end

local function BuildPanel(parent)
    local db = AB.InitDB()
    local defaults = AB.defaults
    local isMage = select(2, UnitClass("player")) == "MAGE"

    local panel = CreateFrame("Frame", nil, parent, "GwSettingsPanelTmpl")
    panel.panelId = "gw2_ui_plus_actionbar"

    if panel.header then
        panel.header:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 20)
        if GW.Colors and GW.Colors.TextColors then
            panel.header:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
        end
        panel.header:SetText("附加组件")
        panel.header:SetWidth(panel.header:GetStringWidth() + 10)
    end
    if panel.breadcrumb then
        panel.breadcrumb:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
        if GW.Colors and GW.Colors.TextColors then
            panel.breadcrumb:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
        end
        panel.breadcrumb:SetText("动作条")
    end
    if panel.sub then
        panel.sub:SetFont(UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
        panel.sub:SetTextColor(181 / 255, 160 / 255, 128 / 255)
        panel.sub:SetText("全局渐隐、按钮尺寸与法师动作条")
    end

    local function Refresh()
        if addonTable.PlusFader then
            addonTable.PlusFader.Refresh()
        end
    end

    ----------------------------------------------------------------------------
    -- 一、全局渐隐
    ----------------------------------------------------------------------------

    local optFade = panel:AddOption("启用全局渐隐", "平时把动作条淡下去，鼠标移上去才亮起来。和本体「动作条」面板里每条那个「显示」下拉是两套独立机制，一个管框体自己的透明度、一个管这里的父级透明度，两边相乘——本体那边设成「一直显示」，就完全由这里说话。", {
        getter = function() return db.fadeEnable end,
        setter = function(value) db.fadeEnable = value end,
        getDefault = function() return defaults.fadeEnable end,
        callback = Refresh,
        isMasterToggle = true,
    })
    if optFade then optFade.optionName = "GW2PlusAB_FadeEnable" end

    local fadeDep = {["GW2PlusAB_FadeEnable"] = true}

    local optAlpha = panel:AddOptionSlider("淡出后透明度", "0 是完全看不见。", {
        min = 0, max = 1, step = 0.05, decimalNumbers = 2,
        getter = function() return db.fadeAlpha end,
        setter = function(value) db.fadeAlpha = value end,
        getDefault = function() return defaults.fadeAlpha end,
        callback = Refresh,
        dependence = fadeDep,
    })
    if optAlpha then optAlpha.optionName = "GW2PlusAB_FadeAlpha" end

    local optDelay = panel:AddOptionSlider("淡出延迟", "鼠标离开动作条之后等多久开始变淡（秒）。", {
        min = 0, max = 5, step = 0.1, decimalNumbers = 1,
        getter = function() return db.fadeDelay end,
        setter = function(value) db.fadeDelay = value end,
        getDefault = function() return defaults.fadeDelay end,
        callback = Refresh,
        dependence = fadeDep,
    })
    if optDelay then optDelay.optionName = "GW2PlusAB_FadeDelay" end

    panel:AddSubGroupHeader("这些时候保持全亮")

    panel:AddOption("战斗中", nil, {
        getter = function() return db.keepInCombat end,
        setter = function(value) db.keepInCombat = value end,
        getDefault = function() return defaults.keepInCombat end,
        callback = Refresh,
        dependence = fadeDep,
        groupHeaderName = "这些时候保持全亮",
    })
    panel:AddOption("有目标时", nil, {
        getter = function() return db.keepOnTarget end,
        setter = function(value) db.keepOnTarget = value end,
        getDefault = function() return defaults.keepOnTarget end,
        callback = Refresh,
        dependence = fadeDep,
        groupHeaderName = "这些时候保持全亮",
    })
    panel:AddOption("施法或引导时", nil, {
        getter = function() return db.keepOnCasting end,
        setter = function(value) db.keepOnCasting = value end,
        getDefault = function() return defaults.keepOnCasting end,
        callback = Refresh,
        dependence = fadeDep,
        groupHeaderName = "这些时候保持全亮",
    })
    panel:AddOption("生命值不满时", nil, {
        getter = function() return db.keepOnHealth end,
        setter = function(value) db.keepOnHealth = value end,
        getDefault = function() return defaults.keepOnHealth end,
        callback = Refresh,
        dependence = fadeDep,
        groupHeaderName = "这些时候保持全亮",
    })

    panel:AddSubGroupHeader("作用于哪些条")

    local fadeBars = {
        {key = "fadeBar1", name = "动作条 1（主动作条）"},
        {key = "fadeBar2", name = "动作条 2"},
        {key = "fadeBar3", name = "动作条 3"},
        {key = "fadeBar4", name = "动作条 4"},
        {key = "fadeBar5", name = "动作条 5"},
        {key = "fadeBar6", name = "动作条 6"},
        {key = "fadeBar7", name = "动作条 7"},
        {key = "fadeBar8", name = "动作条 8"},
        {key = "fadeStanceBar", name = "姿态动作条"},
        {key = "fadePetBar", name = "宠物动作条", desc = "只作用于宠物动作按钮，宠物血条不受影响。"},
        {key = "fadeMageBar", name = "法师动作条"},
    }

    for _, entry in ipairs(fadeBars) do
        panel:AddOption(entry.name, entry.desc, {
            getter = function() return db[entry.key] end,
            setter = function(value) db[entry.key] = value end,
            getDefault = function() return defaults[entry.key] end,
            callback = Refresh,
            dependence = fadeDep,
            groupHeaderName = "作用于哪些条",
        })
    end

    ----------------------------------------------------------------------------
    -- 二、按钮尺寸
    ----------------------------------------------------------------------------

    panel:AddGroupHeader("按钮尺寸")

    local sizeOptionNames = {}

    local optMainSize = panel:AddOptionSlider("动作条 1（主动作条）", "主动作条的按钮大小。", {
        min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1, decimalNumbers = 0,
        getter = function() return db.mainBarSize end,
        setter = function(value) db.mainBarSize = value end,
        getDefault = function() return defaults.mainBarSize end,
        callback = function() AB.ApplyMainBarLayout() end,
        groupHeaderName = "按钮尺寸",
    })
    if optMainSize then
        optMainSize.optionName = "GW2PlusAB_MainBarSize"
        sizeOptionNames[#sizeOptionNames + 1] = "GW2PlusAB_MainBarSize"
    end

    for index = 2, 8 do
        local optName = "GW2PlusAB_BarSize" .. index
        local opt = panel:AddOptionSlider("动作条 " .. index, nil, {
            min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1, decimalNumbers = 0,
            getter = function() return AB.GetMultiBarSize(index) end,
            setter = function(value) AB.SetMultiBarSize(index, value) end,
            getDefault = function() return 36 end,
            callback = function() AB.ApplyMultiBarSizes() end,
            groupHeaderName = "按钮尺寸",
        })
        if opt then
            opt.optionName = optName
            sizeOptionNames[#sizeOptionNames + 1] = optName
        end
    end

    panel:AddOptionButton("恢复默认", "主动作条回到 48，其余七条回到 36。", {
        callback = function()
            db.mainBarSize = defaults.mainBarSize
            for index = 2, 8 do
                AB.SetMultiBarSize(index, 36)
            end
            AB.ApplyMainBarLayout()
            AB.ApplyMultiBarSizes()
            for _, name in ipairs(sizeOptionNames) do
                RedrawSlider(name)
            end
        end,
        isNegativeButton = true,
        groupHeaderName = "按钮尺寸",
    })

    ----------------------------------------------------------------------------
    -- 三、法师动作条
    ----------------------------------------------------------------------------

    local MageBar = addonTable.PlusMageBar

    panel:AddGroupHeader("法师动作条", {hidden = not isMage})

    if isMage and MageBar then
        local optMage = panel:AddOption("启用法师动作条", "把传送、传送门、造食物、造水、魔法宝石收进一条独立的动作条，鼠标悬停在按钮上展开同组的其它等级/目的地。位置在 HUD 移动模式（/gw2 → 移动界面）里拖。", {
            getter = function() return db.mageBarEnable end,
            setter = function(value) db.mageBarEnable = value end,
            getDefault = function() return defaults.mageBarEnable end,
            callback = function() MageBar.Toggle() end,
            isMasterToggle = true,
            groupHeaderName = "法师动作条",
        })
        if optMage then optMage.optionName = "GW2PlusAB_MageBarEnable" end

        local mageDep = {["GW2PlusAB_MageBarEnable"] = true}

        panel:AddOption("竖向排列", "按钮上下排，弹出条往左边展开。", {
            getter = function() return db.mageBarVertical end,
            setter = function(value) db.mageBarVertical = value end,
            getDefault = function() return defaults.mageBarVertical end,
            callback = function() MageBar.Update() end,
            dependence = mageDep,
            groupHeaderName = "法师动作条",
        })

        local mageGroups = {
            {key = "mageBarTeleport", name = "传送"},
            {key = "mageBarPortal", name = "传送门"},
            {key = "mageBarFood", name = "造食物"},
            {key = "mageBarWater", name = "造水"},
            {key = "mageBarGem", name = "魔法宝石"},
        }
        for _, entry in ipairs(mageGroups) do
            panel:AddOption(entry.name, nil, {
                getter = function() return db[entry.key] end,
                setter = function(value) db[entry.key] = value end,
                getDefault = function() return defaults[entry.key] end,
                callback = function() MageBar.Update() end,
                dependence = mageDep,
                groupHeaderName = "法师动作条",
            })
        end

        local optMageSize = panel:AddOptionSlider("按钮尺寸", nil, {
            min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1, decimalNumbers = 0,
            getter = function() return db.mageBarSize end,
            setter = function(value) db.mageBarSize = value end,
            getDefault = function() return defaults.mageBarSize end,
            callback = function() MageBar.Update() end,
            dependence = mageDep,
            groupHeaderName = "法师动作条",
        })
        if optMageSize then optMageSize.optionName = "GW2PlusAB_MageBarSize" end
    end

    return panel
end

--------------------------------------------------------------------------------
-- 顶级“动作条”标签
--------------------------------------------------------------------------------

local WIDGET_TEMPLATES = {
    boolean = {"Button", "GwOptionBoxTmpl"},
    slider = {"Button", "GwOptionBoxSliderTmpl"},
    dropdown = {"Button", "GwOptionBoxDropDownTmpl"},
    text = {"Button", "GwOptionBoxTextTmpl"},
    button = {"Button", "GwButtonTextTmpl"},
    header = {"Frame", "GwOptionBoxHeader"},
    subHeader = {"Frame", "GwOptionBoxSubHeader"},
}

local HEADER_EXTENT = 40
local HEADER_OPTION_GAP = 8
local HOTKEY_POSITION_VALUES = {
    "TOPLEFT", "TOP", "TOPRIGHT", "CENTER",
    "BOTTOMLEFT", "BOTTOM", "BOTTOMRIGHT",
}
local HOTKEY_POSITION_NAMES = {
    "左上", "上", "右上", "居中",
    "左下", "下", "右下",
}

local function CreatePanel(parent, panelId, breadcrumb, description)
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

local function CreateOptionWidget(panel, option)
    local config = WIDGET_TEMPLATES[option.optionType]
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
        and HEADER_OPTION_GAP or 0
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

local function InitializePanel(panel)
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
                row.widgets[#row.widgets + 1] = CreateOptionWidget(panel, grouped)
                index = index + 1
            end
            rows[#rows + 1] = row
        else
            rows[#rows + 1] = {
                option = option,
                widget = CreateOptionWidget(panel, option),
                topPadding = topPadding,
            }
            index = index + 1
        end
    end

    local view = CreateScrollBoxListLinearView()
    view:SetElementExtentCalculator(function(_, data)
        local extent = (data.option.optionType == "header"
            or data.option.optionType == "subHeader"
            or data.option.optionType == "button") and HEADER_EXTENT or 46
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

local function RefreshPanel(panel)
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

local function ApplyFader()
    if addonTable.PlusFader then addonTable.PlusFader.Refresh() end
end

local function ApplyLayout()
    if addonTable.PlusActionBarLayout then
        addonTable.PlusActionBarLayout.RefreshAll()
    end
end

local function NativeDefault(key, fallback)
    local profile = GW.globalDefault and GW.globalDefault.profile
    local value = profile and profile[key]
    return value ~= nil and value or fallback
end

local function AddResetButton(panel, callback)
    local option = panel:AddOptionButton("恢复默认", "恢复当前页面的设置；有对应动作条时，也会移回默认位置。", {
        callback = function()
            callback()
            RefreshPanel(panel)
            if AB.RefreshMoverOptionPanel then
                AB.RefreshMoverOptionPanel()
            end
        end,
        isNegativeButton = true,
    })
    return option
end

local function ResetMover(frame)
    AB.ResetMoverPosition(frame)
end

local function AddGeneralOptions(panel)
    local db, defaults = AB.InitDB(), AB.defaults
    panel:AddOption("启用 GW2 UI 动作条", "这是 GW2 UI 原生总开关，修改后需要重新加载界面。", {
        getter = function() return GW.settings.ACTIONBARS_ENABLED end,
        setter = function(value) GW.settings.ACTIONBARS_ENABLED = value end,
        getDefault = function() return true end,
        callback = function() GW.ShowRlPopup = true end,
        isMasterToggle = true,
    })
    panel:AddGroupHeader("全局渐隐")
    panel:AddOption("启用全局渐隐", "鼠标离开后统一降低所选动作条的透明度。", {
        getter = function() return db.fadeEnable end,
        setter = function(value) db.fadeEnable = value end,
        getDefault = function() return defaults.fadeEnable end,
        callback = ApplyFader,
        isMasterToggle = true,
        groupHeaderName = "全局渐隐",
    })
    panel:AddOptionSlider("淡出后透明度", nil, {
        min = 0, max = 1, step = 0.05, decimalNumbers = 2,
        getter = function() return db.fadeAlpha end,
        setter = function(value) db.fadeAlpha = value end,
        getDefault = function() return defaults.fadeAlpha end,
        callback = ApplyFader,
        groupHeaderName = "全局渐隐",
    })
    panel:AddOptionSlider("淡出延迟", nil, {
        min = 0, max = 5, step = 0.1, decimalNumbers = 1,
        getter = function() return db.fadeDelay end,
        setter = function(value) db.fadeDelay = value end,
        getDefault = function() return defaults.fadeDelay end,
        callback = ApplyFader,
        groupHeaderName = "全局渐隐",
    })
    panel:AddOption("战斗中不渐隐", nil, {
        getter = function() return db.keepInCombat end,
        setter = function(value) db.keepInCombat = value end,
        getDefault = function() return defaults.keepInCombat end,
        callback = ApplyFader,
        groupHeaderName = "全局渐隐",
    })

    panel:AddGroupHeader("参与渐隐的动作条")
    local bars = {
        {"fadeBar1", "主动作条"},
        {"fadeBar2", "动作条 2"},
        {"fadeBar3", "动作条 3"},
        {"fadeBar4", "动作条 4"},
        {"fadeBar5", "动作条 5"},
        {"fadeBar6", "动作条 6"},
        {"fadeBar7", "动作条 7"},
        {"fadeBar8", "动作条 8"},
        {"fadeStanceBar", "姿态条"},
        {"fadePetBar", "宠物动作条"},
        {"fadeMageBar", "法师动作条"},
    }
    for _, entry in ipairs(bars) do
        local key, name = entry[1], entry[2]
        local option = panel:AddOption(name, "动作条设为不显示时，此项自动失效并完全跳过换装处理。", {
            getter = function() return db[key] end,
            setter = function(value) db[key] = value end,
            getDefault = function() return defaults[key] end,
            callback = ApplyFader,
            groupHeaderName = "参与渐隐的动作条",
        })
        if option then option.gwPlusColumns = 4 end
    end

    AddResetButton(panel, function()
        local defaultActionbarsEnabled =
            NativeDefault("ACTIONBARS_ENABLED", true)
        local actionbarsEnabledChanged =
            GW.settings.ACTIONBARS_ENABLED ~= defaultActionbarsEnabled
        GW.settings.ACTIONBARS_ENABLED = defaultActionbarsEnabled
        for _, key in ipairs({
            "fadeEnable", "fadeAlpha", "fadeDelay", "keepInCombat",
            "fadeBar1", "fadeBar2", "fadeBar3", "fadeBar4", "fadeBar5",
            "fadeBar6", "fadeBar7", "fadeBar8", "fadeStanceBar",
            "fadePetBar", "fadeMageBar",
        }) do
            db[key] = defaults[key]
        end
        ApplyFader()
        if actionbarsEnabledChanged then
            GW.ShowRlPopup = true
        end
    end)
end

local function AddMainBarOptions(panel)
    local db, defaults = AB.InitDB(), AB.defaults
    panel:AddOption("显示主动作条", nil, {
        getter = function() return db.mainBarShown end,
        setter = function(value) db.mainBarShown = value end,
        getDefault = function() return true end,
        callback = ApplyLayout,
        isMasterToggle = true,
    })
    panel:AddGroupHeader("按钮")
    local mainSize = panel:AddOptionSlider("尺寸", nil, {
        min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1,
        getter = function() return db.mainBarSize end,
        setter = function(value) db.mainBarSize = value end,
        getDefault = function() return defaults.mainBarSize end,
        callback = AB.ApplyMainBarLayout,
        groupHeaderName = "按钮",
    })
    if mainSize then mainSize.gwPlusColumns = 2 end
    local mainSpacing = panel:AddOptionSlider("间距", nil, {
        min = 0, max = 20, step = 0.1, decimalNumbers = 1,
        getter = function() return GW.settings.MAINBAR_MARGIIN or 5 end,
        setter = function(value) GW.settings.MAINBAR_MARGIIN = value end,
        getDefault = function() return 5 end,
        callback = AB.ApplyMainBarLayout,
        groupHeaderName = "按钮",
    })
    if mainSpacing then mainSpacing.gwPlusColumns = 2 end
    local mainCount = panel:AddOptionSlider("按钮数", nil, {
        min = 1, max = 12, step = 1,
        getter = function() return db.mainBarCount end,
        setter = function(value) db.mainBarCount = value end,
        getDefault = function() return defaults.mainBarCount end,
        callback = function() AB.ApplyMainBarLayout(); RefreshPanel(panel) end,
        groupHeaderName = "按钮",
    })
    if mainCount then mainCount.gwPlusColumns = 2 end
    local mainColumns = panel:AddOptionSlider("行按钮数", nil, {
        min = 1, max = 12, step = 1,
        getter = function() return math.min(db.mainBarColumns, db.mainBarCount) end,
        setter = function(value) db.mainBarColumns = value end,
        getDefault = function() return defaults.mainBarColumns end,
        callback = AB.ApplyMainBarLayout,
        groupHeaderName = "按钮",
    })
    if mainColumns then mainColumns.gwPlusColumns = 2 end
    panel:AddOptionDropdown("范围提示", nil, {
        optionsList = {"RED_INDICATOR", "RED_OVERLAY", "BOTH", "NONE"},
        optionNames = {"红点", "红色覆盖", "两者", "无"},
        getter = function() return GW.settings.MAINBAR_RANGEINDICATOR end,
        setter = function(value) GW.settings.MAINBAR_RANGEINDICATOR = value end,
        getDefault = function() return "RED_INDICATOR" end,
        callback = function() if GW.UpdateMainBarHot then GW.UpdateMainBarHot() end end,
        groupHeaderName = "按钮",
    })
    panel:AddGroupHeader("快捷键")
    panel:AddOption("显示快捷键", nil, {
        getter = function() return db.mainBarShowHotkey end,
        setter = function(value) db.mainBarShowHotkey = value end,
        getDefault = function() return defaults.mainBarShowHotkey end,
        callback = AB.ApplyMainBarText,
        groupHeaderName = "快捷键",
    })
    local hotkeyPosition = panel:AddOptionDropdown("位置", nil, {
        optionsList = HOTKEY_POSITION_VALUES,
        optionNames = HOTKEY_POSITION_NAMES,
        getter = function() return db.mainBarHotkeyPosition end,
        setter = function(value) db.mainBarHotkeyPosition = value end,
        getDefault = function() return defaults.mainBarHotkeyPosition end,
        callback = AB.ApplyMainBarText,
        groupHeaderName = "快捷键",
    })
    if hotkeyPosition then hotkeyPosition.gwPlusColumns = 2 end
    local hotkeySize = panel:AddOptionSlider("字体大小", nil, {
        min = 8, max = 48, step = 1,
        getter = function() return db.mainBarHotkeySize end,
        setter = function(value) db.mainBarHotkeySize = value end,
        getDefault = function() return defaults.mainBarHotkeySize end,
        callback = AB.ApplyMainBarText,
        groupHeaderName = "快捷键",
    })
    if hotkeySize then hotkeySize.gwPlusColumns = 2 end
    for _, entry in ipairs({
        {"X 偏移", "mainBarHotkeyX"},
        {"Y 偏移", "mainBarHotkeyY"},
    }) do
        local label, key = entry[1], entry[2]
        local option = panel:AddOptionSlider(label, nil, {
            min = -20, max = 20, step = 1,
            getter = function() return db[key] end,
            setter = function(value) db[key] = value end,
            getDefault = function() return defaults[key] end,
            callback = AB.ApplyMainBarText,
            groupHeaderName = "快捷键",
        })
        if option then option.gwPlusColumns = 2 end
    end

    panel:AddGroupHeader("宏名称")
    panel:AddOption("显示宏名称", nil, {
        getter = function() return db.mainBarShowMacro end,
        setter = function(value) db.mainBarShowMacro = value end,
        getDefault = function() return defaults.mainBarShowMacro end,
        callback = AB.ApplyMainBarText,
        groupHeaderName = "宏名称",
    })
    local macroPosition = panel:AddOptionDropdown("位置", nil, {
        optionsList = HOTKEY_POSITION_VALUES,
        optionNames = HOTKEY_POSITION_NAMES,
        getter = function() return db.mainBarMacroPosition end,
        setter = function(value) db.mainBarMacroPosition = value end,
        getDefault = function() return defaults.mainBarMacroPosition end,
        callback = AB.ApplyMainBarText,
        groupHeaderName = "宏名称",
    })
    if macroPosition then macroPosition.gwPlusColumns = 2 end
    local macroSize = panel:AddOptionSlider("字体大小", nil, {
        min = 8, max = 48, step = 1,
        getter = function() return db.mainBarMacroSize end,
        setter = function(value) db.mainBarMacroSize = value end,
        getDefault = function() return defaults.mainBarMacroSize end,
        callback = AB.ApplyMainBarText,
        groupHeaderName = "宏名称",
    })
    if macroSize then macroSize.gwPlusColumns = 2 end
    for _, entry in ipairs({
        {"X 偏移", "mainBarMacroX", -20, 20},
        {"Y 偏移", "mainBarMacroY", -20, 20},
    }) do
        local label, key, minimum, maximum =
            entry[1], entry[2], entry[3], entry[4]
        local option = panel:AddOptionSlider(label, nil, {
            min = minimum, max = maximum, step = 1,
            getter = function() return db[key] end,
            setter = function(value) db[key] = value end,
            getDefault = function() return defaults[key] end,
            callback = AB.ApplyMainBarText,
            groupHeaderName = "宏名称",
        })
        if option then option.gwPlusColumns = 2 end
    end

    AddResetButton(panel, function()
        db.mainBarShown = true
        db.mainBarSize = defaults.mainBarSize
        db.mainBarCount = defaults.mainBarCount
        db.mainBarColumns = defaults.mainBarColumns
        db.mainBarShowHotkey = defaults.mainBarShowHotkey
        db.mainBarHotkeyPosition = defaults.mainBarHotkeyPosition
        db.mainBarHotkeyX = defaults.mainBarHotkeyX
        db.mainBarHotkeyY = defaults.mainBarHotkeyY
        db.mainBarHotkeySize = defaults.mainBarHotkeySize
        db.mainBarShowMacro = defaults.mainBarShowMacro
        db.mainBarMacroPosition = defaults.mainBarMacroPosition
        db.mainBarMacroX = defaults.mainBarMacroX
        db.mainBarMacroY = defaults.mainBarMacroY
        db.mainBarMacroSize = defaults.mainBarMacroSize
        GW.settings.MAINBAR_MARGIIN = NativeDefault("MAINBAR_MARGIIN", 5)
        GW.settings.MAINBAR_RANGEINDICATOR =
            NativeDefault("MAINBAR_RANGEINDICATOR", "RED_INDICATOR")
        if _G.MainActionBar then _G.MainActionBar:Show() end
        AB.ApplyMainBarLayout()
        ApplyFader()
        ResetMover(_G.MainActionBar)
    end)
end

local function AddMultiBarOptions(panel)
    local db = AB.InitDB()
    local selectedBar = 2
    local layout = addonTable.PlusActionBarLayout

    local function Prefix() return "bar" .. selectedBar end
    local function Native()
        local info = AB.MULTIBARS[selectedBar]
        return info and GW.settings[info.setting]
    end
    local function ApplyCurrent()
        if layout then layout.ApplyMultiBar(selectedBar) end
        ApplyFader()
    end
    local function ApplyCurrentText()
        if layout then layout.ApplyMultiBarText(selectedBar) end
    end

    panel:AddOptionDropdown("正在设置", nil, {
        optionsList = {2, 3, 4, 5, 6, 7, 8},
        optionNames = {"动作条 2", "动作条 3", "动作条 4", "动作条 5",
            "动作条 6", "动作条 7", "动作条 8"},
        getter = function() return selectedBar end,
        setter = function(value) selectedBar = value end,
        getDefault = function() return 2 end,
        callback = function() RefreshPanel(panel) end,
    })
    local showBarOption = panel:AddOption("显示动作条", nil, {
        getter = function() return db[Prefix() .. "Shown"] end,
        setter = function(value) db[Prefix() .. "Shown"] = value end,
        getDefault = function() return selectedBar <= 5 end,
        callback = ApplyCurrent,
        isMasterToggle = true,
    })
    if showBarOption then showBarOption.gwPlusColumns = 2 end
    local invertOption = panel:AddOption("倒序排列", nil, {
        getter = function() return Native().invert end,
        setter = function(value) Native().invert = value end,
        getDefault = function() return false end,
        callback = ApplyCurrent,
    })
    if invertOption then invertOption.gwPlusColumns = 2 end
    local countOption = panel:AddOptionSlider("按钮数", nil, {
        min = 1, max = 12, step = 1,
        getter = function() return db[Prefix() .. "Count"] end,
        setter = function(value) db[Prefix() .. "Count"] = value end,
        getDefault = function() return 12 end,
        callback = function() ApplyCurrent(); RefreshPanel(panel) end,
    })
    if countOption then countOption.gwPlusColumns = 2 end
    local columnsOption = panel:AddOptionSlider("行按钮数", nil, {
        min = 1, max = 12, step = 1,
        getter = function()
            return math.min(db[Prefix() .. "Columns"], db[Prefix() .. "Count"])
        end,
        setter = function(value) db[Prefix() .. "Columns"] = value end,
        getDefault = function() return selectedBar <= 3 and 6 or 1 end,
        callback = ApplyCurrent,
    })
    if columnsOption then columnsOption.gwPlusColumns = 2 end
    local sizeOption = panel:AddOptionSlider("尺寸", nil, {
        min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1,
        getter = function() return AB.GetMultiBarSize(selectedBar) end,
        setter = function(value) AB.SetMultiBarSize(selectedBar, value) end,
        getDefault = function() return 36 end,
        callback = ApplyCurrent,
    })
    if sizeOption then sizeOption.gwPlusColumns = 2 end
    local spacingOption = panel:AddOptionSlider("间距", nil, {
        min = 0, max = 20, step = 0.1, decimalNumbers = 1,
        getter = function() return db[Prefix() .. "Spacing"] end,
        setter = function(value) db[Prefix() .. "Spacing"] = value end,
        getDefault = function() return 2 end,
        callback = ApplyCurrent,
    })
    if spacingOption then spacingOption.gwPlusColumns = 2 end
    panel:AddGroupHeader("快捷键")
    panel:AddOption("显示快捷键", nil, {
        getter = function() return db[Prefix() .. "ShowHotkey"] end,
        setter = function(value) db[Prefix() .. "ShowHotkey"] = value end,
        getDefault = function() return true end,
        callback = ApplyCurrentText,
        groupHeaderName = "快捷键",
    })
    local positionOption = panel:AddOptionDropdown("位置", nil, {
        optionsList = HOTKEY_POSITION_VALUES,
        optionNames = HOTKEY_POSITION_NAMES,
        getter = function() return db[Prefix() .. "HotkeyPosition"] end,
        setter = function(value) db[Prefix() .. "HotkeyPosition"] = value end,
        getDefault = function() return "TOPLEFT" end,
        callback = ApplyCurrentText,
        groupHeaderName = "快捷键",
    })
    if positionOption then positionOption.gwPlusColumns = 2 end
    local hotkeySizeOption = panel:AddOptionSlider("字体大小", nil, {
        min = 8, max = 48, step = 1,
        getter = function() return db[Prefix() .. "HotkeySize"] end,
        setter = function(value) db[Prefix() .. "HotkeySize"] = value end,
        getDefault = function() return 12 end,
        callback = ApplyCurrentText,
        groupHeaderName = "快捷键",
    })
    if hotkeySizeOption then hotkeySizeOption.gwPlusColumns = 2 end
    for _, entry in ipairs({
        {"X 偏移", "HotkeyX", -20, 20, 0},
        {"Y 偏移", "HotkeyY", -20, 20, 0},
    }) do
        local label, key, minimum, maximum, default =
            entry[1], entry[2], entry[3], entry[4], entry[5]
        local option = panel:AddOptionSlider(label, nil, {
            min = minimum, max = maximum, step = 1,
            getter = function() return db[Prefix() .. key] end,
            setter = function(value) db[Prefix() .. key] = value end,
            getDefault = function() return default end,
            callback = ApplyCurrentText,
            groupHeaderName = "快捷键",
        })
        if option then option.gwPlusColumns = 2 end
    end
    panel:AddGroupHeader("宏名称")
    panel:AddOption("显示宏名称", nil, {
        getter = function() return db[Prefix() .. "ShowMacro"] end,
        setter = function(value) db[Prefix() .. "ShowMacro"] = value end,
        getDefault = function() return false end,
        callback = ApplyCurrentText,
        groupHeaderName = "宏名称",
    })
    local macroPosition = panel:AddOptionDropdown("位置", nil, {
        optionsList = HOTKEY_POSITION_VALUES,
        optionNames = HOTKEY_POSITION_NAMES,
        getter = function() return db[Prefix() .. "MacroPosition"] end,
        setter = function(value) db[Prefix() .. "MacroPosition"] = value end,
        getDefault = function() return "BOTTOM" end,
        callback = ApplyCurrentText,
        groupHeaderName = "宏名称",
    })
    if macroPosition then macroPosition.gwPlusColumns = 2 end
    local macroSize = panel:AddOptionSlider("字体大小", nil, {
        min = 8, max = 48, step = 1,
        getter = function() return db[Prefix() .. "MacroSize"] end,
        setter = function(value) db[Prefix() .. "MacroSize"] = value end,
        getDefault = function() return 12 end,
        callback = ApplyCurrentText,
        groupHeaderName = "宏名称",
    })
    if macroSize then macroSize.gwPlusColumns = 2 end
    for _, entry in ipairs({
        {"X 偏移", "MacroX", -20, 20, 0},
        {"Y 偏移", "MacroY", -20, 20, 0},
    }) do
        local label, key, minimum, maximum, default =
            entry[1], entry[2], entry[3], entry[4], entry[5]
        local option = panel:AddOptionSlider(label, nil, {
            min = minimum, max = maximum, step = 1,
            getter = function() return db[Prefix() .. key] end,
            setter = function(value) db[Prefix() .. key] = value end,
            getDefault = function() return default end,
            callback = ApplyCurrentText,
            groupHeaderName = "宏名称",
        })
        if option then option.gwPlusColumns = 2 end
    end

    AddResetButton(panel, function()
        local prefix = Prefix()
        local info = AB.MULTIBARS[selectedBar]
        local native = Native()
        local nativeDefaults = info and NativeDefault(info.setting, {}) or {}
        db[prefix .. "Shown"] = selectedBar <= 5
        db[prefix .. "Count"] = 12
        db[prefix .. "Columns"] = nativeDefaults.ButtonsPerRow
            or (selectedBar <= 3 and 6 or 1)
        db[prefix .. "Spacing"] = NativeDefault("MULTIBAR_MARGIIN", 2)
        db[prefix .. "ShowHotkey"] =
            NativeDefault("BUTTON_ASSIGNMENTS", true)
        db[prefix .. "HotkeyPosition"] = "TOPLEFT"
        db[prefix .. "HotkeyX"], db[prefix .. "HotkeyY"] = 0, 0
        db[prefix .. "HotkeySize"] = 12
        db[prefix .. "ShowMacro"] =
            NativeDefault("SHOWACTIONBAR_MACRO_NAME_ENABLED", false)
        db[prefix .. "MacroPosition"] = "BOTTOM"
        db[prefix .. "MacroX"], db[prefix .. "MacroY"] = 0, 0
        db[prefix .. "MacroSize"] = 12
        if native then native.invert = nativeDefaults.invert == true end
        AB.SetMultiBarSize(selectedBar, 36)
        ApplyCurrent()
        ResetMover(info and _G[info.frame])
    end)
end

local function AddSimpleBarOptions(panel, kind)
    local db = AB.InitDB()
    local layout = addonTable.PlusActionBarLayout
    local isStance = kind == "stance"
    local prefix = isStance and "stanceBar" or "petBar"
    local apply = isStance and layout.ApplyStanceBar or layout.ApplyPetBar
    panel:AddOption("显示" .. (isStance and "姿态条" or "宠物动作条"), nil, {
        getter = function() return db[prefix .. "Shown"] end,
        setter = function(value) db[prefix .. "Shown"] = value end,
        getDefault = function() return true end,
        callback = function() apply(); ApplyFader() end,
        isMasterToggle = true,
    })
    local countOption = panel:AddOptionSlider("按钮数", nil, {
        min = 1, max = 10, step = 1,
        getter = function() return db[prefix .. "Count"] end,
        setter = function(value) db[prefix .. "Count"] = value end,
        getDefault = function() return 10 end,
        callback = apply,
    })
    if countOption then countOption.gwPlusColumns = 2 end
    local columnsOption = panel:AddOptionSlider("行按钮数", nil, {
        min = 1, max = 10, step = 1,
        getter = function() return math.min(db[prefix .. "Columns"], db[prefix .. "Count"]) end,
        setter = function(value) db[prefix .. "Columns"] = value end,
        getDefault = function() return isStance and 1 or 5 end,
        callback = apply,
    })
    if columnsOption then columnsOption.gwPlusColumns = 2 end
    if isStance then
        panel:AddOptionDropdown("增长方向", nil, {
            optionsList = {"UP", "DOWN", "LEFT", "RIGHT"},
            optionNames = {"向上", "向下", "向左", "向右"},
            getter = function() return GW.settings.StanceBar.growDirection end,
            setter = function(value) GW.settings.StanceBar.growDirection = value end,
            getDefault = function() return "UP" end,
            callback = apply,
        })
        local sizeOption = panel:AddOptionSlider("尺寸", nil, {
            min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1,
            getter = function() return GW.settings.StanceBar.buttonSize end,
            setter = function(value) GW.settings.StanceBar.buttonSize = value end,
            getDefault = function() return 36 end,
            callback = apply,
        })
        if sizeOption then sizeOption.gwPlusColumns = 2 end
        local spacingOption = panel:AddOptionSlider("间距", nil, {
            min = 0, max = 20, step = 1,
            getter = function() return GW.settings.StanceBar.spacing end,
            setter = function(value) GW.settings.StanceBar.spacing = value end,
            getDefault = function() return 2 end,
            callback = apply,
        })
        if spacingOption then spacingOption.gwPlusColumns = 2 end
    else
        local sizeOption = panel:AddOptionSlider("尺寸", nil, {
            min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1,
            getter = function() return db.petBarSize end,
            setter = function(value) db.petBarSize = value end,
            getDefault = function() return 36 end,
            callback = apply,
        })
        if sizeOption then sizeOption.gwPlusColumns = 2 end
        local spacingOption = panel:AddOptionSlider("间距", nil, {
            min = 0, max = 20, step = 1,
            getter = function() return db.petBarSpacing end,
            setter = function(value) db.petBarSpacing = value end,
            getDefault = function() return 3 end,
            callback = apply,
        })
        if spacingOption then spacingOption.gwPlusColumns = 2 end
    end
    panel:AddGroupHeader("快捷键")
    panel:AddOption("显示快捷键", nil, {
        getter = function() return db[prefix .. "ShowHotkey"] end,
        setter = function(value) db[prefix .. "ShowHotkey"] = value end,
        getDefault = function() return true end,
        callback = apply,
        groupHeaderName = "快捷键",
    })
    local positionOption = panel:AddOptionDropdown("位置", nil, {
        optionsList = HOTKEY_POSITION_VALUES,
        optionNames = HOTKEY_POSITION_NAMES,
        getter = function() return db[prefix .. "HotkeyPosition"] end,
        setter = function(value) db[prefix .. "HotkeyPosition"] = value end,
        getDefault = function() return "TOPRIGHT" end,
        callback = apply,
        groupHeaderName = "快捷键",
    })
    if positionOption then positionOption.gwPlusColumns = 2 end
    local hotkeySizeOption = panel:AddOptionSlider("字体大小", nil, {
        min = 8, max = 48, step = 1,
        getter = function() return db[prefix .. "HotkeySize"] end,
        setter = function(value) db[prefix .. "HotkeySize"] = value end,
        getDefault = function() return 12 end,
        callback = apply,
        groupHeaderName = "快捷键",
    })
    if hotkeySizeOption then hotkeySizeOption.gwPlusColumns = 2 end
    for _, entry in ipairs({
        {"X 偏移", "HotkeyX", -20, 20, 0},
        {"Y 偏移", "HotkeyY", -20, 20, 0},
    }) do
        local label, key, minimum, maximum, default =
            entry[1], entry[2], entry[3], entry[4], entry[5]
        local option = panel:AddOptionSlider(label, nil, {
            min = minimum, max = maximum, step = 1,
            getter = function() return db[prefix .. key] end,
            setter = function(value) db[prefix .. key] = value end,
            getDefault = function() return default end,
            callback = apply,
            groupHeaderName = "快捷键",
        })
        if option then option.gwPlusColumns = 2 end
    end

    AddResetButton(panel, function()
        db[prefix .. "Shown"] = true
        db[prefix .. "Count"] = 10
        db[prefix .. "Columns"] = isStance and 1 or 5
        db[prefix .. "ShowHotkey"] = true
        db[prefix .. "HotkeyPosition"] = "TOPRIGHT"
        db[prefix .. "HotkeyX"], db[prefix .. "HotkeyY"] = 0, 0
        db[prefix .. "HotkeySize"] = 12
        if isStance then
            local stanceDefaults = NativeDefault("StanceBar", {})
            GW.settings.StanceBar.growDirection =
                stanceDefaults.growDirection or "UP"
            GW.settings.StanceBar.buttonSize = 36
            GW.settings.StanceBar.spacing = stanceDefaults.spacing or 2
        else
            db.petBarSize = 36
            db.petBarSpacing = 3
        end
        apply()
        ApplyFader()
        ResetMover(isStance and _G.GwStanceBar or _G.GwPlayerPetFrame)
    end)
end

local function AddMageOptions(panel)
    local db, defaults = AB.InitDB(), AB.defaults
    local MageBar = addonTable.PlusMageBar
    local isMage = select(2, UnitClass("player")) == "MAGE"
    local enableOption = panel:AddOption("显示法师动作条", nil, {
        getter = function() return isMage and db.mageBarEnable end,
        setter = function(value) db.mageBarEnable = value end,
        getDefault = function() return defaults.mageBarEnable end,
        callback = function() if MageBar then MageBar.Toggle() end; ApplyFader() end,
        isMasterToggle = true,
    })
    if enableOption then
        enableOption.optionName = "GW2PlusAB_MageBarEnable"
        enableOption.gwPlusColumns = 2
        enableOption.gwPlusDisabled = not isMage
    end
    local mageDep = {["GW2PlusAB_MageBarEnable"] = true}
    local verticalOption = panel:AddOption("竖向排列", nil, {
        getter = function() return db.mageBarVertical end,
        setter = function(value) db.mageBarVertical = value end,
        getDefault = function() return defaults.mageBarVertical end,
        callback = function() if MageBar then MageBar.Update() end end,
        dependence = mageDep,
    })
    if verticalOption then
        verticalOption.gwPlusColumns = 2
        verticalOption.gwPlusDisabled = not isMage
    end
    for _, entry in ipairs({
        {"mageBarTeleport", "传送"}, {"mageBarPortal", "传送门"},
        {"mageBarFood", "造食物"}, {"mageBarWater", "造水"}, {"mageBarGem", "魔法宝石"},
    }) do
        local key, name = entry[1], entry[2]
        local option = panel:AddOption(name, nil, {
            getter = function() return db[key] end,
            setter = function(value) db[key] = value end,
            getDefault = function() return defaults[key] end,
            callback = function() if MageBar then MageBar.Update() end end,
            dependence = mageDep,
        })
        if option then
            option.gwPlusColumns = 5
            option.gwPlusDisabled = not isMage
        end
    end
    local sizeOption = panel:AddOptionSlider("尺寸", nil, {
        min = AB.SIZE_MIN, max = AB.SIZE_MAX, step = 1,
        getter = function() return db.mageBarSize end,
        setter = function(value) db.mageBarSize = value end,
        getDefault = function() return defaults.mageBarSize end,
        callback = function() if MageBar then MageBar.UpdateSize() end end,
        dependence = mageDep,
    })
    if sizeOption then sizeOption.gwPlusDisabled = not isMage end

    local resetOption = AddResetButton(panel, function()
        for _, key in ipairs({
            "mageBarEnable", "mageBarSize", "mageBarVertical",
            "mageBarTeleport", "mageBarPortal", "mageBarFood",
            "mageBarWater", "mageBarGem",
        }) do
            db[key] = defaults[key]
        end
        if MageBar then MageBar.Update() end
        ApplyFader()
        ResetMover(MageBar and MageBar.bar)
    end)
    if resetOption then resetOption.gwPlusDisabled = not isMage end
end

local NATIVE_ACTIONBAR_PANEL_IDS = {
    actionbar_general = true,
    actionbar_main = true,
    actionbar_extra = true,
    actionbar_stance = true,
}

local function HideNativeActionBarSettings(settingsTab)
    local scrollBox = settingsTab and settingsTab.menu and settingsTab.menu.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not provider then return end

    local nativeParent
    provider:ForEach(function(data)
        if data.isSubCat and data.itemData and data.itemData.frame
            and NATIVE_ACTIONBAR_PANEL_IDS[data.itemData.frame.panelId] then
            nativeParent = data.parent
        end
    end)
    if not nativeParent then return end

    local filtered = CreateDataProvider()
    provider:ForEach(function(data)
        if data.itemData ~= nativeParent and data.parent ~= nativeParent then
            filtered:Insert(data)
        elseif data.isSubCat and data.itemData and data.itemData.frame
            and GW.SettingsWidgetRegistry and GW.SettingsWidgetRegistry.byPanel then
            GW.SettingsWidgetRegistry.byPanel[data.itemData.frame] = nil
        end
    end)
    scrollBox:SetDataProvider(filtered, ScrollBoxConstants.RetainScrollPosition)
end

local function BuildActionBarTab(settingsTab, settingsWindow)
    if not settingsWindow or settingsWindow.gwPlusActionBarTab then return end

    local tab = CreateFrame("Frame", nil, settingsWindow, "GwSettingsSettingsTabTemplate")
    tab.name = "GwSettingsActionBar"
    tab.headerBreadcrumbText = "动作条"
    tab.menu.search:Hide()
    tab.menu.ScrollBox:Hide()
    tab.menu.ScrollBar:Hide()

    local pageDefinitions = {
        {"综合", "gw2_plus_actionbar_general", "全局显示与渐隐", AddGeneralOptions},
        {"主动作条", "gw2_plus_actionbar_main", "主动作条布局与文字", AddMainBarOptions},
        {"多动作条", "gw2_plus_actionbar_multi", "动作条 2–8 独立布局", AddMultiBarOptions},
        {"姿态条", "gw2_plus_actionbar_stance", "姿态动作按钮", function(panel) AddSimpleBarOptions(panel, "stance") end},
        {"宠物动作条", "gw2_plus_actionbar_pet", "仅调整宠物动作按钮", function(panel) AddSimpleBarOptions(panel, "pet") end},
    }
    pageDefinitions[#pageDefinitions + 1] =
        {"法师动作条", "gw2_plus_actionbar_mage", "法师专属法术分组", AddMageOptions}

    local panels, buttons = {}, {}
    local function SelectPage(index)
        for pageIndex, panel in ipairs(panels) do
            panel:SetShown(pageIndex == index)
            buttons[pageIndex].activeTexture:SetShown(pageIndex == index)
        end
        if panels[index] then RefreshPanel(panels[index]) end
    end

    for index, definition in ipairs(pageDefinitions) do
        local panel = CreatePanel(tab, definition[2], definition[1], definition[3])
        definition[4](panel)
        InitializePanel(panel)
        panels[index] = panel

        local button = CreateFrame("Button", nil, tab.menu, "GwSettingsSettingsTabMenuButtonTemplate")
        button:SetSize(221, 36)
        button:SetPoint("TOPLEFT", tab.menu, "TOPLEFT", 0, -8 - ((index - 1) * 36))
        button.arrow:Hide()
        button.text:SetPoint("LEFT", button, "LEFT", 20, 0)
        button.text:SetText(definition[1])
        button.hover:SetTexture("Interface/AddOns/GW2_UI/textures/character/menu-hover.png")
        local pageIndex = index
        button:SetScript("OnClick", function() SelectPage(pageIndex) end)
        buttons[index] = button
    end

    tab.callbackOnClose = function() end
    settingsWindow:AddTab("Interface/AddOns/GW2_UI/textures/character/tabicon-glyph.png", tab)
    local tabButton = settingsWindow.tabButtons[#settingsWindow.tabButtons]
    if tabButton and tabButton.icon then
        tabButton.icon:SetTexCoord(0.505, 1, 0, 0.625)
    end
    table.insert(settingsWindow.tabs, tab)
    settingsWindow.gwPlusActionBarTab = tab
    SelectPage(1)
    tab:Hide()

    HideNativeActionBarSettings(settingsTab)
    if not settingsTab.gwPlusActionBarFilterHooked then
        settingsTab.gwPlusActionBarFilterHooked = true
        hooksecurefunc(settingsTab, "AddSettingsPanel", function()
            C_Timer.After(0, function() HideNativeActionBarSettings(settingsTab) end)
        end)
    end
end

addonTable.PlusSettingsLayout = addonTable.PlusSettingsLayout or {}
addonTable.PlusSettingsLayout.InitializePanel = InitializePanel
addonTable.PlusSettingsLayout.RefreshPanel = RefreshPanel

addonTable.BuildActionBarTab = BuildActionBarTab
