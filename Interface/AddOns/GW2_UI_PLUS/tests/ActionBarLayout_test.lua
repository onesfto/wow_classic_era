GW2_ADDON = {
    settings = {
        MULTIBAR_MARGIIN = 2,
        BUTTON_ASSIGNMENTS = true,
    },
}
function hooksecurefunc(target, method, callback)
    local original = target[method]
    target[method] = function(self, ...)
        original(self, ...)
        callback(self, ...)
    end
end
local saved = {
    bar2HotkeyX = 7,
    bar2HotkeyY = -4,
    bar2HotkeySize = 18,
}
local addonTable = {
    PlusActionBar = {
        MULTIBARS = {},
        SIZE_MIN = 12,
        SIZE_MAX = 64,
        QueueOutOfCombat = function() return false end,
        InitDB = function() return saved end,
    },
}

local chunk = assert(loadfile("ActionBar/Layout.lua"))
chunk("GW2_UI_PLUS", addonTable)

local Layout = assert(addonTable.PlusActionBarLayout, "动作条布局模块没有创建")
local AB = addonTable.PlusActionBar

local db = AB.InitDB()
assert(db.mainBarShown and db.bar2Shown and db.bar5Shown
    and db.bar6Shown == false and db.bar7Shown == false
    and db.bar8Shown == false,
    "动作条 2–5 应默认显示，动作条 6–8 应默认隐藏")
assert(db.bar2HotkeyPosition == "TOPLEFT"
    and db.stanceBarHotkeyPosition == "TOPRIGHT"
    and db.petBarHotkeyPosition == "TOPRIGHT",
    "多动作条快捷键必须默认左上，姿态条和宠物条必须默认右上")
assert(db.bar2MacroPosition == "BOTTOM"
    and db.bar8MacroPosition == "BOTTOM",
    "多动作条宏名称必须默认下")
assert(db.petBarSize == 36, "宠物动作条尺寸必须默认 36")
assert(db.bar2HotkeyX == 7 and db.bar2HotkeyY == -4
    and db.bar2HotkeySize == 18,
    "升级快捷键位置时必须保留原有偏移和字体大小")
db.bar4Shown = false
assert(not AB.IsBarShown("bar4") and AB.IsBarShown("bar3"),
    "动作条显示状态应由统一接口读取")

local columns, rows = Layout.ClampGrid(7, 12, 20)
assert(columns == 7 and rows == 1, "列数必须收紧到显示按钮数")

columns, rows = Layout.ClampGrid(10, 3, 10)
assert(columns == 3 and rows == 4, "10 个按钮、3 列应得到 4 行")

local points, width, height = Layout.CalculateGrid(7, 3, 38, 2)
assert(#points == 7, "应只生成指定数量的按钮位置")
assert(points[1].x == 0 and points[1].y == 0, "第一个按钮应位于左上角")
assert(points[4].x == 0 and points[4].y == 40, "第四个按钮应换到第二行")
assert(width == 118 and height == 118, "网格尺寸应包含按钮间距但不多算尾部间距")

points = Layout.CalculateGrid(4, 2, 30, 5, true)
assert(points[1].buttonIndex == 4 and points[4].buttonIndex == 1,
    "倒序排列应只改变按钮顺序")

local function NewText(initialText)
    local text = {shown = true, alpha = 1, text = initialText or ""}
    function text:SetShown(value) self.shown = value and true or false end
    function text:IsShown() return self.shown end
    function text:Show() self.shown = true end
    function text:Hide() self.shown = false end
    function text:SetAlpha(value) self.alpha = value end
    function text:GetAlpha() return self.alpha end
    function text:SetText(value) self.text = value or "" end
    function text:GetText() return self.text end
    function text:SetFormattedText(format, ...)
        self.text = string.format(format, ...)
    end
    function text:SetTextColor(...) self.color = {...} end
    function text:GetTextColor() return 1, 1, 1, 1 end
    function text:ClearAllPoints() self.points = {} end
    function text:SetPoint(...)
        self.points = self.points or {}
        self.points[#self.points + 1] = {...}
        self.point = self.points[#self.points]
    end
    function text:GetNumPoints() return #(self.points or {}) end
    function text:GetPoint(index)
        local point = (self.points or {})[index or 1]
        if point then return point[1], point[2], point[3], point[4], point[5] end
    end
    function text:SetWidth(value) self.width = value end
    function text:SetHeight(value) self.height = value end
    function text:SetSize(width, height) self.width, self.height = width, height end
    function text:SetWordWrap(value) self.wordWrap = value end
    function text:SetNonSpaceWrap(value) self.nonSpaceWrap = value end
    function text:SetJustifyH(value) self.justifyH = value end
    function text:GetJustifyH() return self.justifyH end
    function text:SetJustifyV(value) self.justifyV = value end
    function text:GetJustifyV() return self.justifyV end
    function text:GetFont() return self.fontPath or "TestFont",
        self.fontSize or 12, self.fontFlags or "OUTLINE" end
    function text:SetFont(path, size, flags)
        self.fontPath, self.fontSize, self.fontFlags = path, size, flags
    end
    return text
end

local function NewButton()
    local button = {HotKey = NewText("K"), Name = NewText("宏")}
    function button:SetShown(value) self.shown = value end
    function button:SetSize(width, height) self.width, self.height = width, height end
    function button:GetWidth() return self.width end
    function button:GetHeight() return self.height end
    function button:GetSize() return self.width, self.height end
    function button:ClearAllPoints() end
    function button:SetPoint(...) self.point = {...} end
    -- Plus 现在给文字建独立代理层，模拟按钮要能造 FontString
    function button:CreateFontString() return NewText() end
    return button
end

local frame = {gw_Buttons = {}}
for index = 1, 12 do frame.gw_Buttons[index] = NewButton() end
function frame:SetSize(width, height) self.width, self.height = width, height end
function frame:SetShown(value) self.shown = value end

GW2_ADDON.settings.MultiBarBottomLeft = {ButtonsPerRow = 6, invert = false}
AB.MULTIBARS[2] = {
    setting = "MultiBarBottomLeft",
    frame = "GwMultiBarBottomLeft",
}
AB.GetMultiBarSize = function() return 38 end
GwMultiBarBottomLeft = frame
db.bar2Count = 7
db.bar2Columns = 3
db.bar2Spacing = 2
db.bar2ShowHotkey = false
db.bar2HotkeySize = 18
db.bar2HotkeyX = 0
db.bar2HotkeyY = 0
db.bar2ShowMacro = true
db.bar2MacroSize = 20

Layout.ApplyMultiBar(2)
assert(frame.gw_Buttons[7].shown and not frame.gw_Buttons[8].shown,
    "多动作条只应显示配置数量内的按钮")
assert(frame.width == 118 and frame.height == 118,
    "多动作条框体尺寸应匹配实际网格")
local hotkeyProxy = frame.gw_Buttons[1].HotKey.gwPlusProxy
local macroProxy = frame.gw_Buttons[1].Name.gwPlusProxy
assert(hotkeyProxy and macroProxy,
    "快捷键和宏名称都必须建出独立的代理文字层")
assert(hotkeyProxy.shown == false and macroProxy.shown == true,
    "快捷键和宏名称必须按当前动作条独立设置")
assert(hotkeyProxy.text == "K" and macroProxy.text == "宏",
    "代理文字层必须同步原生文字内容")
assert(hotkeyProxy.fontSize == 18 and macroProxy.fontSize == 20,
    "快捷键和宏名称必须应用各自的字体大小")
assert(hotkeyProxy.point[1] == "TOPLEFT"
    and hotkeyProxy.point[3] == "TOPLEFT"
    and hotkeyProxy.justifyH == "LEFT"
    and hotkeyProxy.justifyV == "TOP"
    and macroProxy.point[1] == "BOTTOM"
    and macroProxy.point[3] == "BOTTOM"
    and macroProxy.justifyH == "CENTER"
    and macroProxy.justifyV == "BOTTOM",
    "快捷键应默认左上，宏名称应默认下")

-- 问题 1 的回归点：原生文字层只被设成透明，宽高和字体都不许动，
-- 否则 GW2 UI 的 updateMacroName 那套会把按钮撑大
assert(frame.gw_Buttons[1].HotKey.alpha == 0
    and frame.gw_Buttons[1].Name.alpha == 0,
    "原生文字层必须保持透明，显示交给代理层")
assert(frame.gw_Buttons[1].Name.width == nil
    and frame.gw_Buttons[1].Name.height == nil
    and frame.gw_Buttons[1].Name.fontSize == nil,
    "开启宏名称不得修改原生文字层的宽高和字体，否则按钮尺寸会变")
assert(frame.gw_Buttons[1].showMacroName == false,
    "必须关掉本体的宏名称分支，避免它重设原生文字层")
assert(math.abs(frame.gw_Buttons[1].width - 38) < 0.5,
    "开启宏名称后按钮尺寸必须保持不变")

local hotkeyCases = {
    {"TOPLEFT", "LEFT", "TOP"},
    {"TOP", "CENTER", "TOP"},
    {"TOPRIGHT", "RIGHT", "TOP"},
    {"CENTER", "CENTER", "MIDDLE"},
    {"BOTTOMLEFT", "LEFT", "BOTTOM"},
    {"BOTTOM", "CENTER", "BOTTOM"},
    {"BOTTOMRIGHT", "RIGHT", "BOTTOM"},
}
db.bar2ShowHotkey = true
db.bar2HotkeyX = 3
db.bar2HotkeyY = -2
local seenAnchors = {}
for _, case in ipairs(hotkeyCases) do
    db.bar2HotkeyPosition = case[1]
    Layout.ApplyMultiBar(2)
    local proxy = frame.gw_Buttons[1].HotKey.gwPlusProxy
    assert(#proxy.points == 1
        and proxy.points[1][1] == case[1]
        and proxy.points[1][2] == frame.gw_Buttons[1]
        and proxy.points[1][3] == case[1]
        and proxy.points[1][4] == 3 and proxy.points[1][5] == -2,
        case[1] .. " 必须锚在按钮的同名锚点上并使用原始 X/Y 偏移")
    assert(proxy.justifyH == case[2] and proxy.justifyV == case[3],
        case[1] .. " 的文字对齐方式不正确")
    -- 七个位置必须互不重合：锚点组合不能重复
    local key = case[1] .. "|" .. case[2] .. "|" .. case[3]
    assert(not seenAnchors[key], case[1] .. " 与其他位置产生了重合的锚点组合")
    seenAnchors[key] = true
end

-- 问题 2 的回归点：GW2 UI 事后重设原生文字层（FixHotKeyPosition 那一套）
-- 不得影响代理层的位置
db.bar2HotkeyPosition = "TOPLEFT"
db.bar2HotkeyX = 4
db.bar2HotkeyY = -3
Layout.ApplyMultiBar(2)
local nativeHotkey = frame.gw_Buttons[1].HotKey
nativeHotkey:ClearAllPoints()
nativeHotkey:SetPoint("CENTER", frame.gw_Buttons[1], "BOTTOM", 0, 5)
nativeHotkey:SetJustifyH("CENTER")
nativeHotkey:SetWidth(frame.gw_Buttons[1].width)
local hotkeyProxy2 = nativeHotkey.gwPlusProxy
assert(#hotkeyProxy2.points == 1
    and hotkeyProxy2.points[1][1] == "TOPLEFT"
    and hotkeyProxy2.points[1][4] == 4
    and hotkeyProxy2.points[1][5] == -3
    and hotkeyProxy2.justifyH == "LEFT",
    "GW2 UI 重设原生快捷键后，代理层的位置和对齐必须保持 Plus 的配置")

-- 原生层改文本时代理层要跟上，改 alpha 时不许把原生层显出来
nativeHotkey:SetText("S1")
assert(hotkeyProxy2.text == "S1", "原生快捷键文本变化必须同步到代理层")
nativeHotkey:SetAlpha(1)
assert(nativeHotkey.alpha == 0, "原生文字层被重新显示时必须再压回透明")

db.bar2MacroPosition = "TOP"
db.bar2MacroX, db.bar2MacroY = 2, -1
Layout.ApplyMultiBar(2)
local macroName = frame.gw_Buttons[1].Name
assert(macroName.gwPlusTextPosition == "TOP"
    and macroName.gwPlusProxy.justifyH == "CENTER"
    and macroName.gwPlusProxy.point[4] == 2
    and macroName.gwPlusProxy.point[5] == -1,
    "多动作条宏名称必须使用独立位置和偏移")

local petFrame = {buttons = {}}
for index = 1, 10 do
    local button = NewButton()
    button.width, button.height = 32, 32
    petFrame.buttons[index] = button
end
GwPlayerPetFrame = petFrame
db.petBarCount = 10
db.petBarColumns = 5
db.petBarSize = 50
db.petBarSpacing = 4
Layout.ApplyPetBar()
-- ApplyPetBar 会把 button.point 覆盖成锚点名字符串（本体 mover 要用），
-- 所以位置断言读 gwX
assert(petFrame.buttons[1].width == 50
    and petFrame.buttons[2].gwX == 57,
    "宠物动作条必须使用独立尺寸和间距计算按钮布局")

db.bar2Shown = true
frame.shown = false
function frame:IsShown() return self.shown end
assert(not AB.IsBarActive("bar2"),
    "动作条框体实际隐藏时，即使保存值为显示也不能视为有效显示")
frame.shown = true
assert(AB.IsBarActive("bar2"),
    "保存值与框体都显示时，动作条才应视为有效显示")
db.bar2Shown = false
assert(not AB.IsBarActive("bar2"),
    "保存值为隐藏时，框体状态不能令动作条重新生效")

print("ActionBarLayout_test: OK")
