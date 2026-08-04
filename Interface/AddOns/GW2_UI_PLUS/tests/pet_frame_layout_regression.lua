local function Noop() end

local addonTable = {
    PlusActionBar = {
        SIZE_MIN = 12,
        SIZE_MAX = 64,
        MULTIBARS = {},
        InitDB = function()
            GW2_UI_PLUS_ActionBarSV = GW2_UI_PLUS_ActionBarSV or {}
            return GW2_UI_PLUS_ActionBarSV
        end,
        QueueOutOfCombat = function() return false end,
    },
}

_G.GW2_ADDON = {}
_G.GW2_UI_PLUS_SV = {}
_G.GW2_UI_PLUS_ActionBarSV = {}
_G.NUM_PET_ACTION_SLOTS = 10
_G.InCombatLockdown = function() return false end
_G.CreateFrame = function()
    return {
        RegisterEvent = Noop,
        SetScript = Noop,
    }
end

local layoutChunk = assert(loadfile("Modules/ActionBar/Layout.lua"))
layoutChunk("GW2_UI_PLUS", addonTable)
local layout = assert(addonTable.PlusActionBarLayout)

local simpleChunk = assert(loadfile("Modules/ActionBar/Options_SimpleBar.lua"))
simpleChunk("GW2_UI_PLUS", addonTable)

local points, width = layout.CalculateGrid(10, 10, 36, 3, false, 20, 6)
assert(points[6].x == 195, "第六列不应提前插入中缝")
assert(points[7].x == 254, "第七列应在第六列后插入中缝")
assert(width == 20 + 10 * 36 + 9 * 3, "中缝没有计入网格宽度")

local noGapPoints, noGapWidth = layout.CalculateGrid(6, 6, 36, 3, false, 20, 6)
assert(noGapPoints[6].x == 195, "少于七个按钮时不应插入中缝")
assert(noGapWidth == 6 * 36 + 5 * 3, "少于七个按钮时网格宽度不应增加")

local petChunk = assert(loadfile("Modules/UnitFrames/PetFrame.lua"))
petChunk("GW2_UI_PLUS", addonTable)
local petFrame = assert(addonTable.PlusPetFrame)

local db = petFrame.InitDB()
assert(db.portraitPosition == "RIGHT", "宠物头像默认位置错误")
assert(db.healthWidth == 230, "宠物生命条默认宽度错误")
assert(db.healthHeight == 16, "宠物生命条默认高度错误")
assert(db.powerHeight == 2, "宠物能量条默认高度错误")
assert(db.portraitSize == 60, "宠物头像默认尺寸错误")
assert(db.portraitOffsetX == 0 and db.portraitOffsetY == 0,
    "宠物头像默认偏移错误")
assert(db.happinessEnabled == true and db.feedEnabled == true,
    "宠物独立图标默认启用状态错误")
assert(addonTable.PlusActionBar.InitDB().petBarMiddleGap == 0,
    "宠物技能条默认中间空隙错误")

local right = petFrame.CalculateLayout({
    portraitPosition = "RIGHT",
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
})
local rightWithLargePetBar = petFrame.CalculateLayout({
    portraitPosition = "RIGHT",
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
})
assert(right.contentWidth == rightWithLargePetBar.contentWidth
        and right.contentHeight == rightWithLargePetBar.contentHeight,
    "技能条尺寸不应改变宠物头像和资源条框体尺寸")
assert(right.portrait.shown and right.happiness == nil,
    "右侧头像布局不应再包含绑定在框体内的欢乐度")
assert(right.bars.width == right.energy.width,
    "能量条宽度必须与生命条宽度一致")

local hidden = petFrame.CalculateLayout({
    portraitPosition = "HIDDEN",
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
})
assert(not hidden.portrait.shown and hidden.happiness == nil,
    "隐藏头像时只应隐藏头像，布局结果不应包含欢乐度")

local top = petFrame.CalculateLayout({
    portraitPosition = "TOP",
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
})
assert(top.portrait.x == (top.contentWidth - top.portrait.width) / 2
        and top.health.x == (top.contentWidth - top.health.width) / 2
        and top.portrait.y < top.bars.y,
    "中上布局应将头像组置于资源条上方")

local bottom = petFrame.CalculateLayout({
    portraitPosition = "BOTTOM",
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
})
assert(bottom.portrait.x == (bottom.contentWidth - bottom.portrait.width) / 2
        and bottom.health.x == (bottom.contentWidth - bottom.health.width) / 2
        and bottom.portrait.y > bottom.bars.y,
    "中下布局应将头像组置于资源条下方")

local left = petFrame.CalculateLayout({
    portraitPosition = "LEFT",
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
})
assert(left.portrait.shown and left.portrait.x < left.health.x
        and left.happiness == nil,
    "左侧布局应将头像放在生命条左侧")
local wide = petFrame.CalculateLayout({
    portraitPosition = "RIGHT",
    healthWidth = 310,
    healthHeight = 24,
    powerHeight = 7,
})
assert(wide.health.width == 310 and wide.energy.width == 310,
    "生命条宽度变化后能量条未同步")
assert(wide.health.height == 24 and wide.energy.height == 7,
    "资源条高度未按设置应用")

local adjustedPortrait = petFrame.CalculateLayout({
    portraitPosition = "RIGHT",
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
    portraitSize = 80,
    portraitOffsetX = 12,
    portraitOffsetY = 9,
})
assert(adjustedPortrait.portrait.width == 80
        and adjustedPortrait.portrait.height == 80,
    "宠物头像尺寸未按设置应用")
assert(adjustedPortrait.portrait.x == right.portrait.x + 12
        and adjustedPortrait.portrait.y - adjustedPortrait.health.y == -9,
    "宠物头像偏移未按 X 向右、Y 向上应用")

local expandedPortrait = petFrame.CalculateLayout({
    portraitPosition = "RIGHT",
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
    portraitSize = 80,
    portraitOffsetX = -300,
    portraitOffsetY = 0,
})
assert(expandedPortrait.portrait.x >= 0
        and expandedPortrait.portrait.x + expandedPortrait.portrait.width
            <= expandedPortrait.contentWidth
        and expandedPortrait.health.x >= 0,
    "宠物头像负偏移后布局内容未保持完整")

local multiRowPoints = layout.CalculatePetBarGrid(8, 7, 36, 3, 20)
assert(multiRowPoints[7].x == 254 and multiRowPoints[8].x == 0
        and multiRowPoints[8].y == 39,
    "多行宠物技能条未复用固定列坐标")

local function NewPanel()
    local panel = {gwOptions = {}}
    function panel:AddGroupHeader(name, values)
        values = values or {}
        values.name, values.optionType = name, "header"
        self.gwOptions[#self.gwOptions + 1] = values
        return values
    end
    function panel:AddOptionDropdown(name, _, values)
        values.name, values.optionType = name, "dropdown"
        self.gwOptions[#self.gwOptions + 1] = values
        return values
    end
    function panel:AddOptionSlider(name, _, values)
        values.name, values.optionType = name, "slider"
        self.gwOptions[#self.gwOptions + 1] = values
        return values
    end
    function panel:AddOptionButton(name, _, values)
        values.name, values.optionType = name, "button"
        self.gwOptions[#self.gwOptions + 1] = values
        return values
    end
    return panel
end

local framePanel = NewPanel()
petFrame.AddOptions(framePanel)
local frameOptionNames = {}
for _, option in ipairs(framePanel.gwOptions) do
    frameOptionNames[#frameOptionNames + 1] = option.optionName or option.name
end
local expectedFrameOptionNames = {
    "头像与资源条", "GW2PlusPetFramePortraitPosition",
    "GW2PlusPetFramePortraitSize", "GW2PlusPetFramePortraitOffsetX",
    "GW2PlusPetFramePortraitOffsetY",
    "GW2PlusPetFrameHealthWidth", "GW2PlusPetFrameHealthHeight",
    "GW2PlusPetFramePowerHeight", "恢复本组默认",
}
for index, expected in ipairs(expectedFrameOptionNames) do
    assert(frameOptionNames[index] == expected,
        "宠物综合设置顺序错误: " .. tostring(frameOptionNames[index]))
end
local portraitOption = framePanel.gwOptions[2]
assert(table.concat(portraitOption.optionsList, ",")
        == "TOP,BOTTOM,LEFT,RIGHT,HIDDEN"
        and table.concat(portraitOption.optionNames, ",")
            == "中上,中下,左边,右边,隐藏",
    "宠物头像位置选项顺序错误")
local portraitSizeOption = framePanel.gwOptions[3]
assert(portraitSizeOption.min == 20 and portraitSizeOption.max == 200
        and portraitSizeOption.step == 1,
    "宠物头像尺寸范围错误")
local portraitOffsetXOption = framePanel.gwOptions[4]
local portraitOffsetYOption = framePanel.gwOptions[5]
assert(portraitOffsetXOption.min == -200
        and portraitOffsetXOption.max == 200
        and portraitOffsetYOption.min == -200
        and portraitOffsetYOption.max == 200,
    "宠物头像偏移范围错误")
db.portraitSize = 120
db.portraitOffsetX = 40
db.portraitOffsetY = -30
petFrame.ResetLayoutDefaults()
assert(db.portraitSize == 60 and db.portraitOffsetX == 0
        and db.portraitOffsetY == 0,
    "宠物头像设置恢复默认失败")
for _, option in ipairs(framePanel.gwOptions) do
    if option.optionName and option.optionName ~= "恢复本组默认" then
        assert(option.dependence and option.dependence.PETBAR_ENABLED == true,
            "宠物新增设置缺少 PETBAR_ENABLED 依赖: " .. option.optionName)
    end
end
local actionPanel = NewPanel()
addonTable.ActionBarOptionsSimpleBar.AddPetBarLayoutOptions(actionPanel, Noop)
local actionOptionNames = {}
for _, option in ipairs(actionPanel.gwOptions) do
    actionOptionNames[#actionOptionNames + 1] = option.optionName or option.name
end
local expectedActionOptionNames = {
    "技能条", "GW2PlusPetBarSize", "GW2PlusPetBarSpacing",
    "GW2PlusPetBarCount", "GW2PlusPetBarColumns",
    "GW2PlusPetBarMiddleGap",
}
for index, expected in ipairs(expectedActionOptionNames) do
    assert(actionOptionNames[index] == expected,
        "动作条宠物技能条设置顺序错误: " .. tostring(actionOptionNames[index]))
end
for _, option in ipairs(actionPanel.gwOptions) do
    if option.optionName == "GW2PlusPetBarSize" then option.setter(49) end
end

local settingsSource = assert(io.open("Modules/Settings/Settings.lua")):read("*a")
assert(not settingsSource:find('"pet_skill"', 1, true),
    "宠物框体菜单不应包含技能条子菜单")
local petMenuStart = assert(settingsSource:find(
    "local PET_PAGE_DEFINITIONS", 1, true))
local petMenuEnd = assert(settingsSource:find(
    "local PET_VIEW_DEFINITIONS", petMenuStart, true))
local petMenu = settingsSource:sub(petMenuStart, petMenuEnd - 1)
local expectedPetPages = {
    '{"综合", "pet_general"}',
    '{"欢乐度", "pet_happiness"}',
    '{"喂食", "pet_feed"}',
    '{"渐隐", "pet_fader"}',
    '{"光环", "pet_aura"}',
}
for _, expected in ipairs(expectedPetPages) do
    assert(petMenu:find(expected, 1, true),
        "宠物菜单缺少子页面: " .. expected)
end
assert(settingsSource:find('petExpanded = panelId == "pet_general"', 1, true)
        and settingsSource:find('or panelId == "pet_aura"', 1, true),
    "宠物子菜单展开状态错误")
assert(not petFrame.CalculateSkillAnchor and not petFrame.AddSkillOptions,
    "宠物框体模块不应暴露技能条布局接口")
assert(layout.EnsurePetBar and layout.GetPetBarFrame,
    "动作条布局模块缺少独立宠物动作条接口")

print("宠物框体布局回归检查通过")
