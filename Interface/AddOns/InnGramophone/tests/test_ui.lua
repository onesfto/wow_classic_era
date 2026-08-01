local scriptPath = debug.getinfo(1, "S").source:sub(2)
local root = scriptPath:match("^(.*)/tests/test_ui%.lua$")

unpack = unpack or table.unpack

local framesByName = {}
local fontStrings = {}
local textures = {}

local methods = {}

function methods:SetScript(name, callback)
    self.scripts[name] = callback
end

function methods:GetScript(name)
    return self.scripts[name]
end

function methods:SetText(text)
    self.text = text
end

function methods:GetText()
    return self.text
end

function methods:SetValue(value)
    self.value = value
    if self.scripts.OnValueChanged then
        self.scripts.OnValueChanged(self, value)
    end
end

function methods:GetValue()
    return self.value or 0
end

function methods:Show()
    self.shown = true
    if self.scripts.OnShow then
        self.scripts.OnShow(self)
    end
end

function methods:Hide()
    self.shown = false
    if self.scripts.OnHide then
        self.scripts.OnHide(self)
    end
end

function methods:IsShown()
    return self.shown
end

function methods:GetName()
    return self.name
end

function methods:SetBackdrop(backdrop)
    self.backdrop = backdrop
end

function methods:SetTexture(path)
    self.texture = path
end

function methods:CreateTexture()
    local texture = CreateFrame("Texture")
    table.insert(textures, texture)
    return texture
end

function methods:CreateFontString()
    local fontString = CreateFrame("FontString")
    table.insert(fontStrings, fontString)
    return fontString
end

setmetatable(methods, {
    __index = function(_, key)
        local noOp = function() end
        rawset(methods, key, noOp)
        return noOp
    end,
})

local function newFrame(name)
    local frame = {
        name = name,
        scripts = {},
        shown = true,
    }
    setmetatable(frame, {__index = methods})
    if name then
        framesByName[name] = frame
    end
    return frame
end

function CreateFrame(_, name)
    return newFrame(name)
end

UIParent = newFrame("UIParent")
Minimap = newFrame("Minimap")
GameTooltip = newFrame("GameTooltip")
UISpecialFrames = {}
SlashCmdList = {}
DEFAULT_CHAT_FRAME = {AddMessage = function() end}

local masterVolume = "1"

function GetCVar()
    return masterVolume
end

function SetCVar(_, value)
    masterVolume = tostring(value)
end

function GetTime()
    return 100
end

function PlaySoundFile()
    return true, 42
end

function StopSound() end

C_Timer = {
    NewTimer = function()
        return {Cancel = function() end}
    end,
}

local addon = {}
assert(loadfile(root .. "/Core.lua"))("InnGramophone", addon)
assert(loadfile(root .. "/BuiltinTracks.lua"))("InnGramophone", addon)
assert(loadfile(root .. "/LocalTracks.lua"))("InnGramophone", addon)
assert(loadfile(root .. "/UI.lua"))("InnGramophone", addon)

local function assertEqual(actual, expected, message)
    if actual ~= expected then
        error(("%s：期望 %s，实际 %s"):format(message, tostring(expected), tostring(actual)), 2)
    end
end

local function assertTrue(value, message)
    if not value then
        error(message, 2)
    end
end

assertTrue(addon.ui ~= nil, "应创建 UI 命名空间")
assertTrue(addon.ui.frame ~= nil, "应创建播放器主窗口")
assertEqual(addon.ui.frame.backdrop.bgFile, "Interface\\Buttons\\WHITE8X8", "背景纹理路径")
assertEqual(#addon.ui.sourceButtons, 3, "应创建三个曲库筛选")
assertTrue(#addon.ui.rows >= 10, "歌曲列表应至少显示十行")
assertTrue(addon.ui.previousButton:GetScript("OnClick") ~= nil, "上一首按钮应可点击")
assertTrue(addon.ui.playButton:GetScript("OnClick") ~= nil, "播放按钮应可点击")
assertTrue(addon.ui.nextButton:GetScript("OnClick") ~= nil, "下一首按钮应可点击")
assertTrue(addon.ui.modeButton:GetScript("OnClick") ~= nil, "模式按钮应可点击")
assertTrue(addon.ui.minimapButton ~= nil, "应创建小地图入口")
assertTrue(type(SlashCmdList.INNGRAMOPHONE) == "function", "应注册斜杠命令")

for _, texture in ipairs(textures) do
    assertTrue(not texture.texture or not texture.texture:find("\\\\", 1, true), "纹理路径不应包含连续反斜杠")
end
for _, fontString in ipairs(fontStrings) do
    assertTrue(
        type(fontString.text) ~= "string" or not fontString.text:find("\\n", 1, true),
        "界面文字不应显示字面量换行符"
    )
end

addon.ui.frame:Hide()
SlashCmdList.INNGRAMOPHONE("")
assertTrue(addon.ui.frame:IsShown(), "斜杠命令应打开播放器")
SlashCmdList.INNGRAMOPHONE("")
assertTrue(not addon.ui.frame:IsShown(), "再次输入命令应关闭播放器")

print("全部通过：游戏内界面结构与入口")
