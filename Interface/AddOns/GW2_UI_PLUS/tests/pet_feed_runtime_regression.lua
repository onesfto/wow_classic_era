local function NewFrame()
    local frame = {shown = false, attributes = {}, scripts = {}}
    function frame:SetSize(width, height) self.width, self.height = width, height end
    function frame:SetShown(value) self.shown = value end
    function frame:Show() self.shown = true end
    function frame:Hide() self.shown = false end
    function frame:IsShown() return self.shown end
    function frame:RegisterEvent() end
    function frame:SetScript(event, callback) self.scripts[event] = callback end
    function frame:HookScript(event, callback)
        local previous = self.scripts[event]
        self.scripts[event] = function(...)
            if previous then previous(...) end
            callback(...)
        end
    end
    function frame:RegisterForClicks() end
    function frame:SetAttribute(key, value) self.attributes[key] = value end
    function frame:ClearAttribute(key) self.attributes[key] = nil end
    function frame:CreateTexture()
        local texture = {}
        function texture:SetAllPoints() end
        function texture:SetSize(width, height)
            texture.width, texture.height = width, height
        end
        function texture:SetPoint() end
        function texture:SetTexture(value) texture.texture = value end
        function texture:SetTexCoord(...) texture.texCoord = {...} end
        function texture:SetVertexColor(...) texture.color = {...} end
        return texture
    end
    function frame:SetHighlightTexture(value)
        self.highlightTexture = self.highlightTexture or self:CreateTexture()
        self.highlightTexture:SetTexture(value)
    end
    function frame:GetHighlightTexture() return self.highlightTexture end
    function frame:SetPushedTexture(value)
        self.pushedTexture = self.pushedTexture or self:CreateTexture()
        self.pushedTexture:SetTexture(value)
    end
    function frame:GetPushedTexture() return self.pushedTexture end
    function frame:CreateFontString()
        local text = {}
        function text:SetPoint() end
        function text:SetText(value) text.value = value end
        return text
    end
    return frame
end

local inCombat = false
local bagItem = {itemID = 5525, stackCount = 4, iconFileID = 12345,
    hyperlink = "|cff1eff00|Hitem:5525::::::::|h[食物]|h|r"}
_G.GW2_UI_PLUS_SV = nil
_G.GwPlusPetFeed = NewFrame()
local protectedClickCalls = 0
_G.GwPlusPetFeed.scripts.OnClick = function()
    protectedClickCalls = protectedClickCalls + 1
end
_G.CreateFrame = function() return NewFrame() end
_G.InCombatLockdown = function() return inCombat end
_G.GetSpellInfo = function() return "Feed Pet", nil, 54321 end
_G.GetCVarBool = function() return false end
_G.UnitClass = function() return "猎人", "HUNTER" end
_G.UnitExists = function(unit) return unit == "pet" end
_G.HasPetUI = function() return true, true end
_G.UnitCreatureFamily = function() return "狼" end
_G.UnitLevel = function() return 60 end
_G.UnitName = function() return "灰狼" end
_G.GetPetFoodTypes = function() return "Fish" end
_G.GetItemInfo = function(itemID)
    return "食物" .. itemID, "item:" .. itemID, 1, 50
end
_G.C_Container = {
    GetContainerNumSlots = function(bag) return bag == 0 and 2 or 0 end,
    GetContainerItemInfo = function(bag, slot)
        return bag == 0 and slot == 2 and bagItem or nil
    end,
}
_G.GetNumQuestLogEntries = function() return 0 end
_G.SendChatMessage = function() end
_G.DEFAULT_CHAT_FRAME = {AddMessage = function(_, message) _G.lastMessage = message end}

local addonTable = {}
assert(loadfile("Modules/UnitFrames/PetFeedData.lua"))(
    "GW2_UI_PLUS", addonTable)
assert(loadfile("Modules/UnitFrames/PetFeed.lua"))(
    "GW2_UI_PLUS", addonTable)
local feed = assert(addonTable.PetFeed)
local db = feed.InitDB()
assert(db.buttonSize == 25 and db.useLowLevelFirst
        and db.avoidQuestFood and db.alertType == 1,
    "宠物喂食默认值错误")
feed.AttachButton(_G.GwPlusPetFeed)
assert(_G.GwPlusPetFeed.attributes.type1 == "spell"
        and _G.GwPlusPetFeed.attributes.spell1 == "Feed Pet",
    "喂食按钮安全法术属性错误")
local feedTexCoord = _G.GwPlusPetFeed.icon.texCoord or {}
assert(feedTexCoord[1] == 0.1
        and feedTexCoord[2] == 0.9
        and feedTexCoord[3] == 0.1
        and feedTexCoord[4] == 0.9
        and _G.GwPlusPetFeed.highlightTexture
        and _G.GwPlusPetFeed.highlightTexture.texture
            == "Interface/AddOns/GW2_UI/textures/uistuff/ui-quickslot-depress.png"
        and _G.GwPlusPetFeed.pushedTexture
        and _G.GwPlusPetFeed.pushedTexture.texture
            == "Interface/AddOns/GW2_UI/textures/uistuff/actionbutton-pressed.png",
    "喂食按钮未使用动作条同款高亮和图标裁剪")

assert(feed.Refresh())
assert(_G.GwPlusPetFeed.shown and _G.GwPlusPetFeed.hasFood
        and _G.GwPlusPetFeed.attributes["target-bag"] == 0
        and _G.GwPlusPetFeed.attributes["target-slot"] == 2
        and _G.GwPlusPetFeed.count.value == "4",
    "有食物时按钮或安全目标未刷新")

local oldBagItem = bagItem
bagItem = {itemID = 5527, stackCount = 2, iconFileID = 12346,
    hyperlink = "item:5527"}
inCombat = true
feed.RequestRefresh()
assert(_G.GwPlusPetFeed.attributes["target-slot"] == 2,
    "战斗中不应修改安全目标属性")
inCombat = false
feed.RequestRefresh()
assert(_G.GwPlusPetFeed.attributes["target-slot"] == 2
        and _G.GwPlusPetFeed.count.value == "2",
    "脱战后未执行排队刷新")

bagItem = nil
feed.Refresh()
assert(_G.GwPlusPetFeed.shown and not _G.GwPlusPetFeed.hasFood
        and _G.GwPlusPetFeed.attributes["target-bag"] == nil
        and _G.GwPlusPetFeed.icon.color[1] < 1,
    "无食物时按钮应保留、清除目标并置灰")
bagItem = oldBagItem
_G.GW2_UI_PLUS_SV.petFrame = {feedEnabled = false}
inCombat = true
feed.UpdateVisibility(false)
assert(feed.refreshQueued, "战斗中关闭喂食应排队到脱战后刷新")
inCombat = false
feed.RequestRefresh()
assert(not _G.GwPlusPetFeed.shown, "关闭喂食后背包刷新不应显示按钮")
_G.GW2_UI_PLUS_SV.petFrame.feedEnabled = true

local notifications = 0
local openSettingsCalls = 0
local originalNotifyFallback = feed.NotifyFallback
local originalOpenSettings = feed.OpenSettings
feed.NotifyFallback = function() notifications = notifications + 1 end
feed.OpenSettings = function() openSettingsCalls = openSettingsCalls + 1 end
_G.GwPlusPetFeed.food = {itemID = 5525, name = "备用食物"}
_G.GwPlusPetFeed.isFallback = true
_G.GwPlusPetFeed.feedError = "需要确认"
_G.IsAltKeyDown = function() return false end
local preClick = _G.GwPlusPetFeed.scripts.PreClick
local postClick = _G.GwPlusPetFeed.scripts.PostClick
preClick(_G.GwPlusPetFeed, "LeftButton", true)
postClick(_G.GwPlusPetFeed, "LeftButton", true)
preClick(_G.GwPlusPetFeed, "LeftButton", false)
postClick(_G.GwPlusPetFeed, "LeftButton", false)
assert(notifications == 1, "备用食物提示不能因按键方向重复触发")
preClick(_G.GwPlusPetFeed, "RightButton", true)
preClick(_G.GwPlusPetFeed, "RightButton", false)
local onClick = _G.GwPlusPetFeed.scripts.OnClick
assert(onClick, "喂食按钮未注册普通点击处理")
assert(openSettingsCalls == 0, "右键不应由安全按钮 PreClick 打开设置")
onClick(_G.GwPlusPetFeed, "RightButton", true)
onClick(_G.GwPlusPetFeed, "RightButton", false)
assert(openSettingsCalls == 1, "右键打开设置不能因按键方向重复触发")
assert(protectedClickCalls == 2, "右键处理不应覆盖安全按钮原有点击处理")
feed.NotifyFallback = originalNotifyFallback
feed.OpenSettings = originalOpenSettings

local settingsOpened = false
local settingsTab = {}
function settingsTab:OpenSettingsToPanel(panelID)
    settingsOpened = panelID == "pet_feed"
end
_G.GW2_ADDON = {
    GetSettingsTabFrame = function() return settingsTab end,
}
assert(originalOpenSettings(), "喂食设置入口 fallback 调用失败")
assert(settingsOpened, "喂食设置入口未打开 pet_feed 页面")
_G.GW2_ADDON = nil

local panel = {options = {}}
function panel:AddOption(name, _, values)
    values.name, values.optionName = name, values.optionName
    self.options[#self.options + 1] = values
    return values
end
function panel:AddOptionSlider(name, desc, values)
    values.name, values.optionType = name, "slider"
    self.options[#self.options + 1] = values
    return values
end
function panel:AddOptionDropdown(name, desc, values)
    values.name, values.optionType = name, "dropdown"
    self.options[#self.options + 1] = values
    return values
end
function panel:AddOptionButton(name, desc, values)
    values.name, values.optionType = name, "button"
    self.options[#self.options + 1] = values
    return values
end
local originalGetItemInfo = _G.GetItemInfo
_G.GetItemInfo = function() return nil end
feed.AddOptions(panel, {PETBAR_ENABLED = true})
local byName = {}
for _, option in ipairs(panel.options) do byName[option.name] = option end
assert(byName["图标尺寸"].min == 16 and byName["图标尺寸"].max == 64,
    "喂食图标尺寸选项范围错误")
assert(byName["禁用食物类别"].checkbox
        and #byName["禁用食物类别"].optionsList == 4,
    "食物类别多选设置错误")
assert(byName["禁用单个食物"].checkbox
        and #byName["禁用单个食物"].optionsList == 220
        and #byName["禁用单个食物"].optionNames == 220
        and byName["禁用单个食物"].optionNames[1]
            == tostring(byName["禁用单个食物"].optionsList[1])
        and byName["禁用单个食物"].maxButtons == 10,
    "单个食物多选设置错误")
assert(not byName["恢复本组默认"], "喂食页不应显示恢复本组默认按钮")
_G.GetItemInfo = originalGetItemInfo

local gfwButton = {hidden = false}
function gfwButton:Hide() self.hidden = true end
_G.FOM_FeedButton = gfwButton
feed.HideGFWButton()
assert(gfwButton.hidden, "GFW 共存时重复按钮未隐藏")

print("宠物喂食运行时回归检查通过")
