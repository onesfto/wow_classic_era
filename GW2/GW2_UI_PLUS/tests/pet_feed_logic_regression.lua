local addonTable = {}
assert(loadfile("Modules/UnitFrames/PetFeedData.lua"))(
    "GW2_UI_PLUS", addonTable)
assert(loadfile("Modules/UnitFrames/PetFeed.lua"))(
    "GW2_UI_PLUS", addonTable)

local feed = assert(addonTable.PetFeed)
addonTable.PetFeedFoodData = {
    [101] = {major = 1, category = "basic", priority = 2, diet = "Meat"},
    [102] = {major = 1, category = "wellfed", priority = 3, diet = "Meat"},
    [103] = {major = 1, category = "basic", priority = 2, diet = "Fish"},
    [104] = {major = 1, category = "basic", priority = 2, diet = "Meat"},
    [105] = {major = 1, category = "basic", priority = 2, diet = "Meat"},
}

local entries = {
    {itemID = 101, bag = 0, slot = 1, count = 5, level = 50, name = "肉干"},
    {itemID = 102, bag = 0, slot = 2, count = 1, level = 45, name = "大餐"},
    {itemID = 103, bag = 0, slot = 3, count = 1, level = 50, name = "鱼"},
    {itemID = 104, bag = 0, slot = 4, count = 2, level = 49, name = "魔法肉"},
    {itemID = 105, bag = 0, slot = 5, count = 1, level = 45, name = "任务肉"},
}

local context = {
    petLevel = 50,
    diets = {"Meat"},
    questFood = {[105] = 1},
    counts = {[105] = 1},
    family = "猫科",
}

local settings = {
    useLowLevelFirst = true,
    avoidQuestFood = true,
    excludedCategories = {},
    excludedFoods = {},
    foodLog = {},
}

local foods = feed.FilterAndSort(entries, context, settings)
assert(#foods == 3, "饮食、等级差和任务保护过滤错误")
assert(foods[1].itemID == 104 and foods[2].itemID == 101,
    "优先低等级食物时排序错误")
assert(foods[3].itemID == 102, "同类别食物排序错误")

settings.excludedCategories.wellfed = true
settings.excludedFoods[101] = true
foods = feed.FilterAndSort(entries, context, settings)
assert(#foods == 1 and foods[1].itemID == 104,
    "类别和单个食物禁用未生效")

settings.foodLog[context.family] = {good = {}, bad = {[104] = "魔法肉"}}
foods = feed.FilterAndSort(entries, context, settings)
assert(#foods == 0, "失败食物记忆未跳过已知失败食物")

local fallback = feed.FilterAndSort(entries, context, settings, true)
assert(#fallback == 3 and fallback[1].itemID == 105,
    "备用食物应只绕过用户禁用项并保留饮食和等级过滤")

settings.excludedCategories = {}
settings.excludedFoods = {}
settings.foodLog = {}
settings.useLowLevelFirst = false
foods = feed.FilterAndSort(entries, context, settings)
assert(foods[1].itemID == 101 and foods[2].itemID == 104,
    "优先高等级食物时排序错误")

print("宠物喂食纯逻辑回归检查通过")
