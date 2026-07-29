local mainOnShow
local bodyText
local arrowIcon

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
    return font
end

local function NewFrame(objectType, width, height, regions, children)
    local frame = {
        objectType = objectType or "Frame",
        width = width or 0,
        height = height or 0,
        regions = regions or {},
        children = children or {},
        shown = false,
    }
    function frame:GetObjectType() return self.objectType end
    function frame:GetSize() return self.width, self.height end
    function frame:GetWidth() return self.width end
    function frame:GetRegions() return table.unpack(self.regions) end
    function frame:GetChildren() return table.unpack(self.children) end
    function frame:IsShown() return self.shown end
    function frame:HookScript(scriptType, func)
        if scriptType == "OnShow" then mainOnShow = func end
    end
    return frame
end

local function NewButton()
    return NewFrame("Button")
end

local Skin = {}
function Skin.Register(addonName, func)
    Skin.registeredAddon = addonName
    Skin.registeredFunc = func
end
function Skin.SkinFrame(frame)
    frame.frameSkinCalls = (frame.frameSkinCalls or 0) + 1
end
function Skin.SkinButton(button)
    button.buttonSkinCalls = (button.buttonSkinCalls or 0) + 1
end
function Skin.SkinDropDown(dropDown)
    dropDown.dropDownSkinCalls = (dropDown.dropDownSkinCalls or 0) + 1
end
function Skin.SkinScrollBar(scrollBar)
    scrollBar.scrollBarSkinCalls = (scrollBar.scrollBarSkinCalls or 0) + 1
end
function Skin.SkinEditBox(editBox)
    editBox.editBoxSkinCalls = (editBox.editBoxSkinCalls or 0) + 1
    editBox:SetFont("TemplateFont", 14, "THICKOUTLINE")
end

bodyText = NewFont("OriginalFont", 13, "OUTLINE")

local editBox = NewFrame("EditBox")
function editBox:GetFont()
    return self.fontPath or "OriginalEditFont", self.fontSize or 12,
        self.fontFlags or ""
end
function editBox:SetFont(path, size, flags)
    self.fontPath, self.fontSize, self.fontFlags = path, size, flags
end

local scrollBar = NewFrame("Slider")
local scrollFrame = NewFrame("ScrollFrame", 560, 440, {}, { editBox })
scrollFrame.ScrollBar = scrollBar
function scrollFrame:GwSkinScrollFrame()
    self.scrollFrameSkinCalls = (self.scrollFrameSkinCalls or 0) + 1
end
local textContainer = NewFrame("Frame", 600, 455, {}, { scrollFrame })

local dropDown = NewFrame("Frame", 200, 32)
dropDown.Button = {}
dropDown.Left = {}
dropDown.Middle = {}
dropDown.Right = {}

local exportButton = NewButton()
local exportArrowButton = NewButton()
arrowIcon = { hidden = false }
exportArrowButton.regions = { arrowIcon }
local importButton = NewButton()
local closeButton = NewButton()

local mainFrame = NewFrame("Frame", 650, 600, { bodyText }, {
    exportButton,
    exportArrowButton,
    importButton,
    closeButton,
    dropDown,
    textContainer,
})

local statusBar = NewFrame("StatusBar", 320, 18)
function statusBar:SetStatusBarTexture(texture)
    self.statusBarTexture = texture
end
local progressText = NewFont("OriginalFont", 12, "")
local progressFrame = NewFrame("Frame", 360, 70, { progressText }, {
    statusBar,
})
function progressFrame:GetFrameStrata() return "FULLSCREEN_DIALOG" end

local wrongProgress = NewFrame("Frame", 360, 70, {}, {
    NewFrame("StatusBar", 320, 18),
})
function wrongProgress:GetFrameStrata() return "DIALOG" end

UIParent = NewFrame("Frame", 0, 0, {}, {
    mainFrame,
    progressFrame,
    wrongProgress,
})

local addonTable = { Skin = Skin }
local chunk = assert(loadfile("skins/Myslot.lua"))
chunk("GW2_UI_PLUS", addonTable)

assert(Skin.registeredAddon == "Myslot",
    "皮肤必须注册到 Myslot")
Skin.registeredFunc()
assert(type(mainOnShow) == "function",
    "皮肤应等待匿名主窗口首次显示")

mainFrame.shown = true
mainOnShow(mainFrame)

assert(mainFrame.frameSkinCalls == 1,
    "主窗口应应用 GW2 背景")
assert(exportButton.buttonSkinCalls == 1
    and exportArrowButton.buttonSkinCalls == 1
    and importButton.buttonSkinCalls == 1
    and closeButton.buttonSkinCalls == 1,
    "主窗口直接按钮都应应用 GW2 材质")
assert(not arrowIcon.hidden, "选项箭头图标必须保留")
assert(dropDown.dropDownSkinCalls == 1,
    "配置下拉框应应用 GW2 材质")
assert(textContainer.frameSkinCalls == 1,
    "文本容器应应用 GW2 背景")
assert(scrollFrame.scrollFrameSkinCalls == 1
    and scrollBar.scrollBarSkinCalls == 1,
    "滚动框和滚动条应应用 GW2 材质")
assert(editBox.editBoxSkinCalls == 1,
    "导入导出编辑区应应用 GW2 材质")
assert(not scrollBar.buttonSkinCalls,
    "滚动条不得被普通按钮皮肤误处理")

assert(bodyText.fontPath == UNIT_NAME_FONT
    and bodyText.fontSize == 13
    and bodyText.fontFlags == "OUTLINE",
    "文字应只替换字体路径并保留字号与样式")
assert(editBox.fontPath == UNIT_NAME_FONT and editBox.fontSize == 12,
    "编辑区应使用 GW2 默认字体并保留字号")

assert(progressFrame.frameSkinCalls == 1,
    "导入进度窗口应应用 GW2 背景")
assert(statusBar.statusBarTexture
    == "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar.png",
    "导入进度条应使用 GW2 状态条材质")
assert(not wrongProgress.frameSkinCalls,
    "层级不匹配的窗口不得被误识别为导入进度窗口")

mainOnShow(mainFrame)
assert(mainFrame.frameSkinCalls == 1
    and progressFrame.frameSkinCalls == 1,
    "重复显示窗口不得重复应用皮肤")

print("MyslotSkin_test: OK")
