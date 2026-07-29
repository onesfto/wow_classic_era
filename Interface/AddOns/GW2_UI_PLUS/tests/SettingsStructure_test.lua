local function Read(path)
    local file = assert(io.open(path, "r"))
    local source = file:read("*a")
    file:close()
    return source
end

local mainMenu = Read("MainMenu/MainMenu.lua")
local playerAuras = Read("MainMenu/PlayerAuras.lua")
local targetMenuPos = assert(mainMenu:find(
    'CreateMenuButton("目标", "target_general", false, false)',
    1, true), "框体菜单必须包含目标入口")
local targetOfTargetMenuPos = assert(mainMenu:find(
    'CreateMenuButton("目标的目标", "target_of_target", false, false)',
    1, true), "框体菜单必须包含独立的目标的目标入口")
local petMenuPos = assert(mainMenu:find(
    'CreateMenuButton("宠物", "player_pet", false, false)',
    1, true), "框体菜单必须包含宠物入口")
assert(targetMenuPos < targetOfTargetMenuPos
    and targetOfTargetMenuPos < petMenuPos,
    "目标的目标必须排列在目标与宠物之间")
assert(not mainMenu:find("MergeTargetOfTargetSettings", 1, true),
    "目标页面不能继续合并目标的目标设置")
assert(mainMenu:find(
        "HideEmbeddedFader(embeddedPanels.target_general, faderLabel)",
        1, true)
    and mainMenu:find(
        "HideEmbeddedFader(embeddedPanels.target_of_target, faderLabel)",
        1, true),
    "目标与目标的目标页面都必须隐藏原生隐藏器")
assert(not mainMenu:find("RAID_STYLE_PARTY_AND_FRAMES", 1, true),
    "框体菜单不能处理小队的同时显示队伍和团队框架设置")
for _, required in ipairs({
    '{"增益光环", "player_buff_aura"}',
    '{"减益光环", "player_debuff_aura"}',
    'group = "PlayerBuffs"',
    'group = "PlayerDebuffs"',
    "PreparePlayerAuraPanel",
    "ShowPlayerAuraPanelView",
    "RestorePlayerAuraPanel",
}) do
    assert(mainMenu:find(required, 1, true),
        "玩家光环拆分缺少结构：" .. required)
end
assert(not mainMenu:find('{"光环", "player_aura"}', 1, true),
    "玩家菜单不能继续显示合并的光环入口")
assert(playerAuras:find("playerBuffAurasEnabled", 1, true)
    and playerAuras:find("playerDebuffAurasEnabled", 1, true),
    "两个光环页面必须使用独立保存键")

local toc = Read("GW2_UI_PLUS.toc")
local playerAuraPos = assert(
    toc:find("MainMenu/PlayerAuras.lua", 1, true),
    "TOC 必须加载玩家光环控制器")
local mainMenuPos = assert(
    toc:find("MainMenu/MainMenu.lua", 1, true),
    "TOC 必须加载框体菜单")
assert(playerAuraPos < mainMenuPos,
    "玩家光环控制器必须在框体菜单之前加载")

local options = Read("ActionBar/Options.lua")
local core = Read("core.lua")
local diagnostics = Read("fixes/Diagnostics.lua")
local layout = Read("ActionBar/Layout.lua")
local actionbar = Read("ActionBar/ActionBar.lua")

assert(options:find("BuildActionBarTab", 1, true),
    "动作条设置应提供顶级标签构建入口")
for _, pageName in ipairs({
    "综合", "主动作条", "多动作条", "姿态条", "宠物动作条", "法师动作条",
}) do
    assert(options:find(pageName, 1, true), "缺少动作条子页：" .. pageName)
end
assert(options:find("actionbar_general", 1, true),
    "应识别并隐藏 GW2 UI 原生动作条设置")
assert(not core:find("BuildActionBarPanel", 1, true),
    "附加组件分类不能继续注册旧动作条入口")
assert(not options:find("addonTable.BuildActionBarPanel", 1, true),
    "旧的 Plus 动作条面板不能继续暴露构建入口")
assert(core:find("BuildActionBarTab", 1, true),
    "核心应注册新的顶级动作条标签")
assert(not options:find("血球与施法条", 1, true),
    "动作条设置不能继续包含血球与施法条分组")
for _, removedSetting in ipairs({
    "GW2PlusAB_GlobeScale",
    "GW2PlusAB_CastbarScale",
    "mainBarGlobeGap",
    "globeScale",
    "castingbar_pos_scale",
    "PLAYER_AS_TARGET_FRAME",
    "ApplyGlobeScale",
    "ApplyCastbarScale",
    "GetCastbarScale",
}) do
    assert(not options:find(removedSetting, 1, true),
        "动作条设置仍包含已移除的血球/施法条逻辑：" .. removedSetting)
end
for _, removedCastbarLogic in ipairs({
    "GetCastbarScale",
    "ApplyCastbarScale",
    "castingbar_pos_scale",
    "GwCastingBarPlayer",
}) do
    assert(not actionbar:find(removedCastbarLogic, 1, true),
        "动作条核心仍包含已移除的施法条逻辑：" .. removedCastbarLogic)
end
local mainBarOptions = options:match(
    "local function AddMainBarOptions%(panel%)(.-)local function AddMultiBarOptions")
assert(mainBarOptions and not mainBarOptions:find("GW.ShowRlPopup", 1, true),
    "主动作条恢复默认全部即时生效，不应提示重新加载界面")
local generalOptions = options:match(
    "local function AddGeneralOptions%(panel%)(.-)local function AddMainBarOptions")
assert(generalOptions
    and generalOptions:find("actionbarsEnabledChanged", 1, true)
    and generalOptions:find("if actionbarsEnabledChanged then", 1, true),
    "综合恢复默认仅在动作条总开关实际变化时提示重新加载")
local multiBarOptions = options:match(
    "local function AddMultiBarOptions%(panel%)(.-)local function AddSimpleBarOptions")
local _, multiBarShownDefaultCount =
    (multiBarOptions or ""):gsub("selectedBar <= 5", "")
assert(multiBarShownDefaultCount >= 2,
    "多动作条默认值和恢复默认都应让动作条 6–8 保持隐藏")
local showBarPosition =
    (multiBarOptions or ""):find('panel:AddOption("显示动作条"', 1, true)
local invertPosition =
    (multiBarOptions or ""):find('panel:AddOption("倒序排列"', 1, true)
local countPosition =
    (multiBarOptions or ""):find('panel:AddOptionSlider("按钮数"', 1, true)
assert(showBarPosition and invertPosition and countPosition
    and showBarPosition < invertPosition and invertPosition < countPosition,
    "显示动作条与倒序排列应相邻")
assert((multiBarOptions or ""):find(
        "if showBarOption then showBarOption.gwPlusColumns = 2 end", 1, true)
    and (multiBarOptions or ""):find(
        "if invertOption then invertOption.gwPlusColumns = 2 end", 1, true),
    "显示动作条与倒序排列应使用同一行两列布局")

local _, resetCount = options:gsub("\"恢复默认\"", "")
local _, resetCallCount = options:gsub("AddResetButton%(panel", "")
assert(resetCount >= 1 and resetCallCount >= 5,
    "所有动作条子页都应提供恢复默认按钮")
assert(not options:find("gwPlusCompactButton", 1, true),
    "动作条恢复默认按钮应使用附加组件设置页的整行样式")
assert(options:find('data.option.optionType == "button"', 1, true)
    and options:find('widget:SetPoint("BOTTOMLEFT", row, "BOTTOMLEFT", 8, 8)', 1, true),
    "恢复默认按钮应使用原生 40 像素行高及上下各 8 像素留白")
assert(options:find("AB.RefreshMoverOptionPanel()", 1, true),
    "恢复默认后应同步刷新 HUD 编辑界面的动作条参数")
assert(options:find("gwPlusColumns = 4", 1, true),
    "参与渐隐的动作条应标记为每行四项")
assert(options:find("local columnCount = option.gwPlusColumns", 1, true),
    "动作条设置渲染器应支持通用分栏")
assert(options:find("local function LayoutCompactSlider", 1, true)
    and options:find("widget.slider:SetSize(sliderWidth, 20)", 1, true)
    and options:find("widget.inputFrame:SetPoint", 1, true),
    "多列滑块必须按列宽重新排列标题、轨道和输入框")
assert(options:find("local function LayoutCompactDropdown", 1, true)
    and options:find("widget.dropDown:SetSize", 1, true),
    "半行位置下拉框必须使用紧凑布局")
for _, columns in ipairs({2, 5}) do
    assert(options:find("gwPlusColumns = " .. columns, 1, true),
        "动作条设置缺少 " .. columns .. " 列布局")
end
assert(not options:find("gwPlusColumns = 3", 1, true),
    "滑块每行最多只能排列两项")
for _, label in ipairs({"按钮数", "行按钮数", "尺寸", "间距",
    "X 偏移", "Y 偏移", "字体大小"}) do
    assert(options:find('"' .. label .. '"', 1, true),
        "动作条设置缺少简化标签：" .. label)
end
assert(options:find("mainBarMacroSize", 1, true)
    and options:find("mainBarHotkeyPosition", 1, true)
    and options:find("mainBarMacroPosition", 1, true)
    and options:find("MacroPosition", 1, true)
    and options:find("HotkeySize", 1, true)
    and options:find("MacroSize", 1, true),
    "动作条设置应提供快捷键和宏名称字体大小")
for _, position in ipairs({
    "TOPLEFT", "TOP", "TOPRIGHT", "CENTER",
    "BOTTOMLEFT", "BOTTOM", "BOTTOMRIGHT",
}) do
    assert(options:find('"' .. position .. '"', 1, true),
        "快捷键位置缺少选项：" .. position)
end
assert(options:find('AddOptionDropdown("位置"', 1, true)
    and options:find('"HotkeyPosition"', 1, true)
    and options:find('positionOption.gwPlusColumns = 2', 1, true)
    and options:find('hotkeySizeOption.gwPlusColumns = 2', 1, true),
    "快捷键位置与字体大小必须排列在同一行")
assert(not options:find('AddOptionSlider("列数"', 1, true)
    and options:find("min = 0, max = 20", 1, true)
    and options:find("db.petBarSize", 1, true),
    "设置页必须使用行按钮数、0–20 间距并提供宠物动作条尺寸")
assert(options:find("gwPlusDisabled = not isMage", 1, true),
    "非 法师的法师动作条设置必须不可点击")
assert(not options:find('if select(2, UnitClass("player")) == "MAGE" then', 1, true),
    "法师动作条页面应对其他职业可见")
assert(diagnostics:find('msg == "hotkey"', 1, true)
    and diagnostics:find("PrintHotkeyDiagnostics", 1, true)
    and layout:find("function Layout.PrintHotkeyDiagnostics()", 1, true)
    and layout:find("GetNumPoints", 1, true)
    and layout:find("GetJustifyH", 1, true),
    "快捷键位置问题必须提供存档值、锚点和对齐方式诊断")

print("SettingsStructure_test: OK")
