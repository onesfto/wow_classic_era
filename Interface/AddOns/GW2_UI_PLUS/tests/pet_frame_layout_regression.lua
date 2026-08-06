local function Noop() end

local addonTable = {
    PlusActionBar = {
        SIZE_MIN = 12,
        SIZE_MAX = 64,
        MULTIBARS = {},
        InitDB = function()
            GW2_UI_PLUS_ActionBarSV = GW2_UI_PLUS_ActionBarSV or {}
            local db = GW2_UI_PLUS_ActionBarSV
            if db.petBarMiddleGap == nil then db.petBarMiddleGap = 0 end
            if db.petBarGapPosition == nil then
                db.petBarGapPosition = "MIDDLE"
            end
            return db
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

local function NewLayoutNode()
    local node = {
        updateBarSizeCalls = 0,
        fillAmount = 0,
        visibleFillAmount = 0,
    }
    function node:SetSize(width, height)
        self.width, self.height = width, height
    end
    function node:ClearAllPoints() end
    function node:SetPoint() end
    function node:SetShown(value) self.shown = value end
    function node:Hide() self.shown = false end
    function node:UpdateBarSize() self.updateBarSizeCalls = self.updateBarSizeCalls + 1 end
    function node:GetFillAmount() return self.fillAmount end
    function node:ForceFillAmount(value)
        self.fillAmount = value
        self.visibleFillAmount = value
    end
    return node
end

local db = petFrame.InitDB()
assert(db.portraitPosition == "RIGHT", "宠物头像默认位置错误")
assert(db.portraitEnabled == true, "宠物头像默认启用状态错误")
assert(db.healthWidth == 230, "宠物生命条默认宽度错误")
assert(db.healthHeight == 16, "宠物生命条默认高度错误")
assert(db.powerHeight == 2, "宠物能量条默认高度错误")
assert(db.portraitSize == 60, "宠物头像默认尺寸错误")
assert(db.portraitOffsetX == 0 and db.portraitOffsetY == 0,
    "宠物头像默认偏移错误")
assert(db.happinessEnabled == true and db.feedEnabled == true,
    "宠物独立图标默认启用状态错误")
assert(addonTable.PlusActionBar.InitDB().petBarMiddleGap == 0,
    "宠物技能条默认上下空隙错误")
assert(addonTable.PlusActionBar.InitDB().petBarGapPosition == "MIDDLE",
    "宠物技能条默认空隙位置错误")

local petHealth = NewLayoutNode()
petHealth.text = NewLayoutNode()
petHealth.internalBar = NewLayoutNode()
petHealth.fillAmount = 0
petHealth.visibleFillAmount = 0.4
local petPower = NewLayoutNode()
petPower.internalBar = NewLayoutNode()
local petMain = NewLayoutNode()
petMain.gwMover = NewLayoutNode()
petMain.Background = NewLayoutNode()
petMain.health = petHealth
petMain.healthString = petHealth.text
petMain.powerbar = petPower
petMain.portraitBackground = NewLayoutNode()
petMain.portrait = NewLayoutNode()
function petMain:UpdateHealthBar(forceUpdate)
    self.updateHealthBarCalls = (self.updateHealthBarCalls or 0) + 1
    self.healthRefreshWidth = self.health.width
    self.healthRefreshForced = forceUpdate
    self.health.visibleFillAmount = 0.75
end
_G.GwPlayerPetFrame = petMain
db.healthWidth = 310
assert(petFrame.ApplyLayout(), "宠物生命条宽度更新失败")
assert(petHealth.width == 310 and petHealth.internalBar.width == 310
        and petPower.width == 310
        and petHealth.updateBarSizeCalls == 1
        and petPower.updateBarSizeCalls == 1
        and petMain.updateHealthBarCalls == 1
        and petMain.healthRefreshWidth == 310
        and petMain.healthRefreshForced == true
        and petHealth.visibleFillAmount == 0.75,
    "宠物生命条宽度变化后红色填充未按新宽度重算")
db.healthWidth = 230
_G.GwPlayerPetFrame = nil

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
    "技能条尺寸不应改变宠物资源条主体尺寸")
assert(right.portrait.shown and right.happiness == nil,
    "右侧头像布局不应再包含绑定在框体内的欢乐度")
assert(right.contentWidth == 232 and right.contentHeight == 20
        and right.health.x == 1 and right.health.y == 0,
    "右侧头像不应改变生命条主体的尺寸和坐标")
assert(right.bars.width == right.energy.width,
    "能量条宽度必须与生命条宽度一致")

local hidden = petFrame.CalculateLayout({
    portraitEnabled = false,
    portraitPosition = "TOP",
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
})
assert(not hidden.portrait.shown and hidden.happiness == nil
        and hidden.contentWidth == right.contentWidth
        and hidden.contentHeight == right.contentHeight
        and hidden.health.x == right.health.x
        and hidden.health.y == right.health.y,
    "隐藏头像时不应保留头像占用的布局空间")

local top = petFrame.CalculateLayout({
    portraitPosition = "TOP",
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
})
assert(top.contentWidth == right.contentWidth
        and top.contentHeight == right.contentHeight
        and top.health.x == right.health.x
        and top.health.y == right.health.y
        and top.portrait.x == (right.contentWidth - top.portrait.width) / 2
        and top.portrait.y == -(top.portrait.height + 4),
    "中上布局应将头像居中置于资源条上方")

local bottom = petFrame.CalculateLayout({
    portraitPosition = "BOTTOM",
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
})
assert(bottom.contentWidth == right.contentWidth
        and bottom.contentHeight == right.contentHeight
        and bottom.health.x == right.health.x
        and bottom.health.y == right.health.y
        and bottom.portrait.x == (right.contentWidth - bottom.portrait.width) / 2
        and bottom.portrait.y == right.contentHeight + 4,
    "中下布局应将头像居中置于资源条下方")

local left = petFrame.CalculateLayout({
    portraitPosition = "LEFT",
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
})
assert(left.portrait.shown and left.portrait.x == -left.portrait.width
        and left.portrait.y == (right.contentHeight - left.portrait.height) / 2
        and left.health.x == right.health.x
        and left.health.y == right.health.y
        and left.happiness == nil,
    "左侧布局应将头像垂直居中置于生命条左侧")
local rightCentered = petFrame.CalculateLayout({
    portraitPosition = "RIGHT",
    healthWidth = 230,
    healthHeight = 16,
    powerHeight = 2,
})
assert(rightCentered.portrait.x == right.contentWidth
        and rightCentered.portrait.y
            == (right.contentHeight - rightCentered.portrait.height) / 2,
    "右侧布局应将头像垂直居中置于生命条右侧")
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
assert(adjustedPortrait.portrait.x == right.contentWidth + 12
        and adjustedPortrait.portrait.y
            == (right.contentHeight - adjustedPortrait.portrait.height) / 2 - 9,
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
assert(expandedPortrait.contentWidth == right.contentWidth
        and expandedPortrait.contentHeight == right.contentHeight
        and expandedPortrait.portrait.x == right.contentWidth - 300
        and expandedPortrait.health.x == right.health.x
        and expandedPortrait.health.y == right.health.y,
    "宠物头像偏移不应改变资源条主体布局")

local unsupportedMiddlePoints, unsupportedMiddleWidth,
    unsupportedMiddleHeight = layout.CalculatePetBarGrid(8, 3, 36, 3, 20)
assert(unsupportedMiddlePoints[7].x == 0
        and unsupportedMiddlePoints[7].y == 78
        and unsupportedMiddlePoints[8].x == 39
        and unsupportedMiddlePoints[8].y == 78
        and unsupportedMiddleWidth == 3 * 36 + 2 * 3
        and unsupportedMiddleHeight == 3 * 36 + 2 * 3,
    "非两行上下结构不应增加纵向空隙")
local petRowsPoints, petRowsWidth, petRowsHeight =
    layout.CalculatePetBarGrid(10, 5, 36, 3, 20)
assert(petRowsPoints[6].x == 0 and petRowsPoints[6].y == 59
        and petRowsWidth == 5 * 36 + 4 * 3
        and petRowsHeight == 2 * 36 + 3 + 20,
    "多行宠物技能条必须在行间加入上下空隙")
local function AssertPetMiddleLayout(buttonCount, columns, rows, message)
    local points, width, height = layout.CalculatePetBarGrid(
        buttonCount, columns, 36, 3, 20)
    local splitRow = rows / 2
    local firstLowerButton = splitRow * columns + 1
    assert(points[1].y == 0
            and points[firstLowerButton - 1].y == (splitRow - 1) * 39
            and points[firstLowerButton].y == splitRow * 39 + 20
            and points[buttonCount].y == (rows - 1) * 39 + 20
            and width == columns * 36 + (columns - 1) * 3
            and height == rows * 36 + (rows - 1) * 3 + 20,
        message)
end
AssertPetMiddleLayout(2, 1, 2, "2/1上下空隙结构错误")
AssertPetMiddleLayout(4, 1, 4, "4/1上下空隙结构错误")
AssertPetMiddleLayout(6, 1, 6, "6/1上下空隙结构错误")
AssertPetMiddleLayout(8, 1, 8, "8/1上下空隙结构错误")
AssertPetMiddleLayout(10, 1, 10, "10/1上下空隙结构错误")
AssertPetMiddleLayout(4, 2, 2, "4/2上下空隙结构错误")
AssertPetMiddleLayout(6, 3, 2, "6/3上下空隙结构错误")
AssertPetMiddleLayout(8, 4, 2, "8/4上下空隙结构错误")
AssertPetMiddleLayout(10, 5, 2, "10/5上下空隙结构错误")
AssertPetMiddleLayout(8, 2, 4, "8/2上下空隙结构错误")
local function AssertPetUnevenMiddleLayout(buttonCount, columns)
    local points, width, height = layout.CalculatePetBarGrid(
        buttonCount, columns, 36, 3, 20)
    local lowerCount = buttonCount - columns
    local message = string.format("%d/%d上下空隙结构错误",
        buttonCount, columns)
    assert(points[1].x == 0 and points[1].y == 0
            and points[columns].x == (columns - 1) * 39
            and points[columns].y == 0
            and points[columns + 1].x == 0
            and points[columns + 1].y == 59
            and points[buttonCount].x == (lowerCount - 1) * 39
            and points[buttonCount].y == 59
            and width == columns * 36 + (columns - 1) * 3
            and height == 2 * 36 + 3 + 20,
        message)
end
for _, layoutSpec in ipairs({
    {3, 2}, {4, 3}, {5, 3}, {5, 4}, {6, 4}, {6, 5},
    {7, 4}, {7, 5}, {7, 6}, {8, 5}, {8, 6}, {8, 7},
    {9, 5}, {9, 6}, {9, 7}, {9, 8},
    {10, 6}, {10, 7}, {10, 8}, {10, 9},
}) do
    AssertPetUnevenMiddleLayout(layoutSpec[1], layoutSpec[2])
end
local function AssertPetSideLayout(buttonCount, columns, expected, expectedWidth,
                                   expectedHeight, message)
    local points, width, height = layout.CalculatePetBarGrid(
        buttonCount, columns, 36, 3, 20, "SIDE")
    assert(width == expectedWidth and height == expectedHeight, message)
    for index, coordinate in ipairs(expected) do
        assert(points[index].x == coordinate.x
                and points[index].y == coordinate.y,
            message .. ":按钮" .. index)
    end
end
AssertPetSideLayout(10, 10, {
    {x = 0, y = 0}, {x = 39, y = 0}, {x = 78, y = 0},
    {x = 117, y = 0}, {x = 156, y = 0}, {x = 215, y = 0},
    {x = 254, y = 0}, {x = 293, y = 0}, {x = 332, y = 0},
    {x = 371, y = 0},
}, 10 * 36 + 9 * 3 + 20, 36, "10/10左右空隙结构错误")
AssertPetSideLayout(8, 8, {
    {x = 0, y = 0}, {x = 39, y = 0}, {x = 78, y = 0},
    {x = 117, y = 0}, {x = 176, y = 0}, {x = 215, y = 0},
    {x = 254, y = 0}, {x = 293, y = 0},
}, 8 * 36 + 7 * 3 + 20, 36, "8/8左右空隙结构错误")
AssertPetSideLayout(6, 6, {
    {x = 0, y = 0}, {x = 39, y = 0}, {x = 78, y = 0},
    {x = 137, y = 0}, {x = 176, y = 0}, {x = 215, y = 0},
}, 6 * 36 + 5 * 3 + 20, 36, "6/6左右空隙结构错误")
AssertPetSideLayout(4, 4, {
    {x = 0, y = 0}, {x = 39, y = 0}, {x = 98, y = 0},
    {x = 137, y = 0},
}, 4 * 36 + 3 * 3 + 20, 36, "4/4左右空隙结构错误")
AssertPetSideLayout(2, 2, {
    {x = 0, y = 0}, {x = 59, y = 0},
}, 2 * 36 + 3 + 20, 36, "2/2左右空隙结构错误")
AssertPetSideLayout(8, 4, {
    {x = 0, y = 0}, {x = 39, y = 0}, {x = 98, y = 0},
    {x = 137, y = 0}, {x = 0, y = 39}, {x = 39, y = 39},
    {x = 98, y = 39}, {x = 137, y = 39},
}, 4 * 36 + 3 * 3 + 20, 2 * 36 + 3, "8/4左右空隙结构错误")
AssertPetSideLayout(4, 2, {
    {x = 0, y = 0}, {x = 59, y = 0},
    {x = 0, y = 39}, {x = 59, y = 39},
}, 2 * 36 + 3 + 20, 2 * 36 + 3, "4/2左右空隙结构错误")
AssertPetSideLayout(6, 2, {
    {x = 0, y = 0}, {x = 59, y = 0},
    {x = 0, y = 39}, {x = 59, y = 39},
    {x = 0, y = 78}, {x = 59, y = 78},
}, 2 * 36 + 3 + 20, 3 * 36 + 2 * 3, "6/2左右空隙结构错误")
AssertPetSideLayout(8, 2, {
    {x = 0, y = 0}, {x = 59, y = 0},
    {x = 0, y = 39}, {x = 59, y = 39},
    {x = 0, y = 78}, {x = 59, y = 78},
    {x = 0, y = 117}, {x = 59, y = 117},
}, 2 * 36 + 3 + 20, 4 * 36 + 3 * 3, "8/2左右空隙结构错误")
AssertPetSideLayout(10, 2, {
    {x = 0, y = 0}, {x = 59, y = 0},
    {x = 0, y = 39}, {x = 59, y = 39},
    {x = 0, y = 78}, {x = 59, y = 78},
    {x = 0, y = 117}, {x = 59, y = 117},
    {x = 0, y = 156}, {x = 59, y = 156},
}, 2 * 36 + 3 + 20, 5 * 36 + 4 * 3, "10/2左右空隙结构错误")
local unsupportedSidePoints, unsupportedSideWidth, unsupportedSideHeight =
    layout.CalculatePetBarGrid(10, 5, 36, 3, 20, "SIDE")
assert(unsupportedSidePoints[1].x == 0 and unsupportedSidePoints[5].x == 156
        and unsupportedSidePoints[6].x == 0 and unsupportedSidePoints[10].x == 156
        and unsupportedSidePoints[6].y == 39
        and unsupportedSideWidth == 5 * 36 + 4 * 3
        and unsupportedSideHeight == 2 * 36 + 3,
    "非白名单结构不应增加左右空隙或改成列优先")
local partialSidePoints, partialSideWidth, partialSideHeight =
    layout.CalculatePetBarGrid(10, 6, 36, 3, 20, "SIDE")
assert(partialSidePoints[7].x == 0 and partialSidePoints[7].y == 39
        and partialSidePoints[10].x == 3 * 39
        and partialSidePoints[10].y == 39
        and partialSideWidth == 6 * 36 + 5 * 3
        and partialSideHeight == 2 * 36 + 3,
    "左右模式不应为两行上多下少结构增加横向空隙")
local singleRowPoints, singleRowWidth, singleRowHeight =
    layout.CalculatePetBarGrid(10, 10, 36, 3, 20)
assert(singleRowPoints[10].y == 0
        and singleRowWidth == 10 * 36 + 9 * 3
        and singleRowHeight == 36,
    "单行宠物技能条不应增加上下空隙")

local function NewPanel()
    local panel = {gwOptions = {}}
    function panel:AddOption(name, _, values)
        values.name, values.optionType = name, "boolean"
        self.gwOptions[#self.gwOptions + 1] = values
        return values
    end
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
framePanel.gwOptions = {
    {
        optionName = "PETBAR_ENABLED",
        name = "启用",
        optionType = "boolean",
        isMasterToggle = true,
    },
    {
        optionName = "PET_FLOATING_COMBAT_TEXT",
        name = "显示头像伤害",
        optionType = "boolean",
        dependence = {PETBAR_ENABLED = true},
    },
    {
        optionName = "PET_HEALTH_VALUE_RAW",
        name = "显示生命值",
        optionType = "boolean",
        dependence = {PETBAR_ENABLED = true},
    },
    {
        optionName = "playerPetFrameHealthBarTexture",
        name = "生命条材质",
        optionType = "dropdown",
        dependence = {PETBAR_ENABLED = true},
    },
    {
        optionName = "petFrameFader",
        name = "显隐",
        optionType = "dropdown",
        groupHeaderName = "显隐",
        dependence = {PETBAR_ENABLED = true},
    },
    {
        optionName = "PET_AURAS_UNDER",
        name = "光环位置",
        optionType = "boolean",
        groupHeaderName = "光环",
        dependence = {PETBAR_ENABLED = true},
    },
    {
        optionName = "pet_pos_scale",
        name = "缩放",
        optionType = "slider",
        groupHeaderName = "大小",
        dependence = {PETBAR_ENABLED = true},
    },
}
petFrame.AddOptions(framePanel)
local auxiliaryPanel = NewPanel()
petFrame.AddAuxiliaryOptions(auxiliaryPanel)
local auxiliaryOptionsByName = {}
for _, option in ipairs(auxiliaryPanel.gwOptions) do
    auxiliaryOptionsByName[option.optionName] = option
end
assert(auxiliaryOptionsByName.GW2PlusPetHappinessEnabled.name == "启用"
        and auxiliaryOptionsByName.GW2PlusPetFeedEnabled.name == "启用"
        and auxiliaryOptionsByName.GW2PlusPetHappinessEnabled.name
            ~= "启用欢乐度",
    "欢乐度和喂食主开关文案错误")
local frameOptionNames = {}
for _, option in ipairs(framePanel.gwOptions) do
    frameOptionNames[#frameOptionNames + 1] = option.optionName or option.name
end
local expectedFrameOptionNames = {
    "PETBAR_ENABLED", "头像", "GW2PlusPetPortraitEnabled",
    "PET_FLOATING_COMBAT_TEXT", "GW2PlusPetFramePortraitPosition",
    "GW2PlusPetFramePortraitSize", "GW2PlusPetFramePortraitOffsetX",
    "GW2PlusPetFramePortraitOffsetY", "playerPetFrameHealthBarTexture",
    "大小", "pet_pos_scale", "GW2PlusPetFrameHealthWidth",
    "GW2PlusPetFrameHealthHeight", "GW2PlusPetFramePowerHeight",
}
for index, expected in ipairs(expectedFrameOptionNames) do
    assert(frameOptionNames[index] == expected,
        "宠物综合设置顺序错误: " .. tostring(frameOptionNames[index]))
end
local portraitEnabledOption = framePanel.gwOptions[3]
assert(portraitEnabledOption.name == "启用头像"
        and portraitEnabledOption.groupHeaderName == "头像"
        and portraitEnabledOption.gwPlusColumns == 2,
    "宠物头像独立开关分组错误")
local portraitDamageOption = framePanel.gwOptions[4]
assert(portraitDamageOption.name == "头像框显示伤害"
        and portraitDamageOption.groupHeaderName == "头像"
        and portraitDamageOption.gwPlusColumns == 2,
    "宠物头像框伤害选项分组错误")
local portraitOption = framePanel.gwOptions[5]
assert(table.concat(portraitOption.optionsList, ",")
        == "TOP,BOTTOM,LEFT,RIGHT"
        and table.concat(portraitOption.optionNames, ",")
            == "中上,中下,左边,右边"
        and portraitOption.name == "位置"
        and portraitOption.groupHeaderName == "头像"
        and portraitOption.gwPlusColumns == 2,
    "宠物头像位置选项顺序错误")
local portraitSizeOption = framePanel.gwOptions[6]
assert(portraitSizeOption.min == 20 and portraitSizeOption.max == 200
        and portraitSizeOption.step == 1
        and portraitSizeOption.name == "尺寸"
        and portraitSizeOption.groupHeaderName == "头像"
        and portraitSizeOption.gwPlusColumns == 2,
    "宠物头像尺寸范围错误")
local portraitOffsetXOption = framePanel.gwOptions[7]
local portraitOffsetYOption = framePanel.gwOptions[8]
assert(portraitOffsetXOption.min == -300
        and portraitOffsetXOption.max == 300
        and portraitOffsetYOption.min == -100
        and portraitOffsetYOption.max == 100
        and portraitOffsetXOption.name == "X 偏移"
        and portraitOffsetYOption.name == "Y 偏移"
        and portraitOffsetXOption.gwPlusColumns == 2
        and portraitOffsetYOption.gwPlusColumns == 2,
    "宠物头像偏移范围错误")
local textureOption = framePanel.gwOptions[9]
assert(textureOption.name == "生命条材质"
        and textureOption.groupHeaderName == "头像"
        and not textureOption.gwPlusColumns,
    "生命条材质分组错误")
local scaleOption = framePanel.gwOptions[11]
assert(scaleOption.name == "缩放指数"
        and scaleOption.groupHeaderName == "大小"
        and not scaleOption.gwPlusColumns,
    "宠物缩放选项分组错误")
for index = 12, 14 do
    assert(framePanel.gwOptions[index].groupHeaderName == "大小"
            and not framePanel.gwOptions[index].gwPlusColumns,
        "宠物大小选项分组错误")
end
for _, option in ipairs(framePanel.gwOptions) do
    assert(option.name ~= "恢复本组默认",
        "宠物综合页不应保留分组恢复按钮")
end
portraitEnabledOption.setter(false)
assert(db.portraitEnabled == false, "宠物头像开关未写入设置")
db.portraitSize = 120
db.portraitOffsetX = 40
db.portraitOffsetY = -30
petFrame.ResetLayoutDefaults()
assert(db.portraitEnabled == true and db.portraitSize == 60
        and db.portraitOffsetX == 0
        and db.portraitOffsetY == 0,
    "宠物头像设置恢复默认失败")
for _, option in ipairs(framePanel.gwOptions) do
    if option.optionName and option.optionName ~= "PETBAR_ENABLED"
        and option.optionName ~= "PET_HEALTH_VALUE_RAW"
        and option.optionName ~= "petFrameFader"
        and option.optionName ~= "PET_AURAS_UNDER" then
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
    "GW2PlusPetBarGapPosition", "GW2PlusPetBarMiddleGap",
}
for index, expected in ipairs(expectedActionOptionNames) do
    assert(actionOptionNames[index] == expected,
        "动作条宠物技能条设置顺序错误: " .. tostring(actionOptionNames[index]))
end
local gapPositionOption = actionPanel.gwOptions[6]
assert(gapPositionOption.name == "空隙位置"
        and table.concat(gapPositionOption.optionsList, ",")
            == "SIDE,MIDDLE"
        and table.concat(gapPositionOption.optionNames, ",")
            == "左右,上下"
        and gapPositionOption.gwPlusColumns == 2,
    "宠物技能条空隙位置选项错误")
local gapSizeOption = actionPanel.gwOptions[7]
assert(gapSizeOption.name == "空隙大小"
        and gapSizeOption.gwPlusColumns == 2,
    "宠物技能条空隙大小选项错误")
gapPositionOption.setter("SIDE")
assert(addonTable.PlusActionBar.InitDB().petBarGapPosition == "SIDE",
    "宠物技能条空隙位置未写入设置")
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
