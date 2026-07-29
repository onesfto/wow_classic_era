local openSackHook
local fontObjectHook
local bodyText
local closeButton
local unrelatedButton

UNIT_NAME_FONT = "GWDefaultFont"

local function NewFont(path, size, flags)
    local font = {
        fontPath = path,
        fontSize = size,
        fontFlags = flags,
    }
    function font:GetFont()
        return self.fontPath, self.fontSize, self.fontFlags
    end
    function font:SetFont(newPath, newSize, newFlags)
        self.fontPath = newPath
        self.fontSize = newSize
        self.fontFlags = newFlags
    end
    function font:SetFontObject(fontObject)
        self.fontPath = fontObject.path
        self.fontSize = fontObject.size
        self.fontFlags = fontObject.flags
    end
    return font
end

local function NewFrame(regions, children)
    local frame = {
        regions = regions or {},
        children = children or {},
    }
    function frame:GetRegions()
        return table.unpack(self.regions)
    end
    function frame:GetChildren()
        return table.unpack(self.children)
    end
    return frame
end

local function NewButton(onClick)
    local button = NewFrame()
    function button:GetObjectType()
        return "Button"
    end
    function button:GetScript(scriptType)
        if scriptType == "OnClick" then return onClick end
    end
    return button
end

local function NewTab()
    local tab = NewFrame()
    function tab:GwSkinTab()
        self.tabSkinCalls = (self.tabSkinCalls or 0) + 1
    end
    return tab
end

local Skin = {}
function Skin.Register(addonName, func)
    Skin.registeredAddon = addonName
    Skin.registeredFunc = func
end
function Skin.SkinFrame(frame)
    frame.skinFrameCalls = (frame.skinFrameCalls or 0) + 1
end
function Skin.SkinScrollBar(scrollBar)
    if scrollBar then
        scrollBar.scrollBarSkinCalls = (scrollBar.scrollBarSkinCalls or 0) + 1
    end
end
function Skin.SkinButton(button)
    if button then
        button.buttonSkinCalls = (button.buttonSkinCalls or 0) + 1
    end
end
function Skin.SkinClose(button)
    if button then
        button.closeSkinCalls = (button.closeSkinCalls or 0) + 1
    end
end

function hooksecurefunc(target, method, func)
    if target == BugSack and method == "OpenSack" then
        openSackHook = func
    elseif method == "SetFontObject" then
        fontObjectHook = func
    else
        error("unexpected hook: " .. tostring(method))
    end
end

BugSack = {}
function BugSack:CloseSack() end
function BugSack:OpenSack()
    if BugSackFrame then return end

    bodyText = NewFont("OriginalBodyFont", 13, "OUTLINE")
    BugSackScrollText = NewFont("OriginalErrorFont", 15, "")
    BugSackScrollScrollBar = NewFrame()
    BugSackScroll = NewFrame({}, { BugSackScrollText })
    function BugSackScroll:GwSkinScrollFrame()
        self.scrollFrameSkinCalls = (self.scrollFrameSkinCalls or 0) + 1
    end
    BugSackScroll.ScrollBar = BugSackScrollScrollBar

    BugSackTabAll = NewTab()
    BugSackTabSession = NewTab()
    BugSackTabLast = NewTab()
    BugSackPrevButton = NewButton()
    BugSackSendButton = NewButton()
    BugSackNextButton = NewButton()
    closeButton = NewButton(BugSack.CloseSack)
    unrelatedButton = NewButton(function() end)
    BugSackFrame = NewFrame(
        { bodyText },
        { BugSackScroll, closeButton, unrelatedButton }
    )
end

local addonTable = { Skin = Skin }
local chunk = assert(loadfile("skins/BugSack.lua"))
chunk("GW2_UI_PLUS", addonTable)

assert(Skin.registeredAddon == "BugSack", "皮肤必须注册到 BugSack")
assert(type(Skin.registeredFunc) == "function", "皮肤注册回调必须存在")

Skin.registeredFunc()
assert(type(openSackHook) == "function", "应安全钩住 BugSack:OpenSack")

BugSack:OpenSack()
openSackHook(BugSack)

assert(BugSackFrame.skinFrameCalls == 1, "主窗口应应用一次 GW2 面板材质")
assert(BugSackTabAll.tabSkinCalls == 1
    and BugSackTabSession.tabSkinCalls == 1
    and BugSackTabLast.tabSkinCalls == 1,
    "三个标签页都应应用 GW2 材质")
assert(BugSackScroll.scrollFrameSkinCalls == 1, "滚动区域应应用 GW2 材质")
assert(BugSackScrollScrollBar.scrollBarSkinCalls == 1, "滚动条应应用 GW2 材质")
assert(BugSackPrevButton.buttonSkinCalls == 1
    and BugSackSendButton.buttonSkinCalls == 1
    and BugSackNextButton.buttonSkinCalls == 1,
    "三个底部按钮都应应用 GW2 普通按钮材质")
assert(closeButton.closeSkinCalls == 1,
    "右上角关闭按钮应应用 GW2 关闭按钮材质")
assert(not unrelatedButton.buttonSkinCalls and not unrelatedButton.closeSkinCalls,
    "无关按钮不得被误处理")

assert(bodyText.fontPath == UNIT_NAME_FONT and bodyText.fontSize == 13
    and bodyText.fontFlags == "OUTLINE",
    "正文应只替换字体路径并保留字号与样式")
assert(BugSackScrollText.fontPath == UNIT_NAME_FONT
    and BugSackScrollText.fontSize == 15,
    "错误文本应替换字体路径并保留当前字号")

BugSackScrollText:SetFontObject({ path = "AnotherFont", size = 19, flags = "" })
fontObjectHook(BugSackScrollText)
assert(BugSackScrollText.fontPath == UNIT_NAME_FONT
    and BugSackScrollText.fontSize == 19,
    "设置页修改字号后应保留新字号并恢复默认字体")

openSackHook(BugSack)
assert(BugSackFrame.skinFrameCalls == 1
    and BugSackTabAll.tabSkinCalls == 1
    and BugSackScroll.scrollFrameSkinCalls == 1
    and BugSackPrevButton.buttonSkinCalls == 1
    and closeButton.closeSkinCalls == 1,
    "重复打开窗口不得重复应用皮肤")

print("BugSackSkin_test: OK")
