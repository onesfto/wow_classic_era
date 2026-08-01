local _, addonTable = ...
-- 模块级变量，延迟初始化避免顶层依赖检查失败
local GW, AB, Utils, General, MainBar, MultiBar, SimpleBar, MageBar, TotemBar
local HOTKEY_POSITION_VALUES, HOTKEY_POSITION_NAMES
local RefreshPanel, ApplyFader, ApplyLayout, NativeDefault
local AddResetButton, ResetMover, RedrawSlider
local InitializePanel, CreatePanel

-- NATIVE_ACTIONBAR_PANEL_IDS 和 HideNativeActionBarSettings 已迁移到 Settings/HideNativeSettings.lua

-- 延迟初始化函数，在需要时才检查依赖
local function EnsureDeps()
    if GW then return true end -- 已初始化

    GW = _G.GW2_ADDON
    if not GW or not GW.GetSettingsTabFrame then
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS ActionBar Options: GW2_ADDON 不可用")
        return false
    end

    AB = addonTable.PlusActionBar
    if not AB then
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS ActionBar Options: PlusActionBar 模块未加载")
        return false
    end

    Utils = addonTable.ActionBarOptionsUtils
    General = addonTable.ActionBarOptionsGeneral
    MainBar = addonTable.ActionBarOptionsMainBar
    MultiBar = addonTable.ActionBarOptionsMultiBar
    SimpleBar = addonTable.ActionBarOptionsSimpleBar
    MageBar = addonTable.ActionBarOptionsMageBar
    TotemBar = addonTable.ActionBarOptionsTotemBar

    if not Utils or not General then
        DEFAULT_CHAT_FRAME:AddMessage("GW2_UI_PLUS ActionBar Options: 缺少依赖模块")
        return false
    end

    -- 从 Utils 获取辅助函数
    HOTKEY_POSITION_VALUES = Utils.HOTKEY_POSITION_VALUES
    HOTKEY_POSITION_NAMES = Utils.HOTKEY_POSITION_NAMES
    RefreshPanel = Utils.RefreshPanel
    ApplyFader = Utils.ApplyFader
    ApplyLayout = Utils.ApplyLayout
    NativeDefault = Utils.NativeDefault
    AddResetButton = Utils.AddResetButton
    ResetMover = Utils.ResetMover
    RedrawSlider = Utils.RedrawSlider
    InitializePanel = Utils.InitializePanel
    CreatePanel = Utils.CreatePanel

    return true
end

-- 辅助函数包装器（调用子模块的函数）
local function AddGeneralOptions(panel)
    if General and General.AddGeneralOptions then
        General.AddGeneralOptions(panel)
    end
end

local function AddMainBarOptions(panel)
    if MainBar and MainBar.AddMainBarOptions then
        MainBar.AddMainBarOptions(panel)
    end
end

local function AddMultiBarOptions(panel)
    if MultiBar and MultiBar.AddMultiBarOptions then
        MultiBar.AddMultiBarOptions(panel)
    end
end

local function AddTotemBarOptions(panel)
    if TotemBar and TotemBar.AddTotemBarOptions then
        TotemBar.AddTotemBarOptions(panel)
    end
end

local function AddMageOptions(panel)
    if MageBar and MageBar.AddMageOptions then
        MageBar.AddMageOptions(panel)
    end
end

local function BuildPanel(parent)
    if not EnsureDeps() then return end
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
local function BuildActionBarTab(settingsTab, settingsWindow)
    if not EnsureDeps() then return end
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
        {"姿态条", "gw2_plus_actionbar_stance", "姿态动作按钮", function(panel) SimpleBar.AddSimpleBarOptions(panel, "stance") end},
        {"宠物动作条", "gw2_plus_actionbar_pet", "仅调整宠物动作按钮", function(panel) SimpleBar.AddSimpleBarOptions(panel, "pet") end},
        {"图腾条", "gw2_plus_actionbar_totem", "图腾动作按钮", AddTotemBarOptions},
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
        if not panel then return end
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
    -- HideNativeActionBarSettings 已迁移到 Settings/HideNativeSettings.lua，由 PrepareUnitFrameSettings 统一调用
end
addonTable.PlusSettingsLayout = addonTable.PlusSettingsLayout or {}
addonTable.PlusSettingsLayout.InitializePanel = InitializePanel
addonTable.PlusSettingsLayout.RefreshPanel = RefreshPanel
addonTable.BuildActionBarTab = BuildActionBarTab
