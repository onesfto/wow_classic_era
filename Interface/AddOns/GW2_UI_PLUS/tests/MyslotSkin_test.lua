local mainOnShow
local bodyText
local exportArrowIcon
local importArrowIcon
local createdDropDown
local secureHooks = {}

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

local function NewArrowIcon()
    local icon = {
        texture = "Interface\\ChatFrame\\ChatFrameExpandArrow",
        drawLayer = "ARTWORK",
    }
    function icon:GetObjectType() return "Texture" end
    function icon:GetTexture() return self.texture end
    function icon:SetDrawLayer(layer, subLevel)
        self.drawLayer, self.subLevel = layer, subLevel
    end
    function icon:Show() self.shown = true end
    return icon
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

function CreateFrame(objectType, name, parent, template)
    local frame = NewFrame(objectType, 0, 0)
    frame.parent = parent
    frame.template = template
    function frame:SetSize(width, height)
        self.width, self.height = width, height
    end
    function frame:SetPoint(...)
        self.point = { ... }
    end
    function frame:EnableMouse(enabled) self.mouseEnabled = enabled end
    function frame:Enable() self.enabled = true end
    function frame:RegisterForClicks(...) self.registeredClicks = { ... } end
    function frame:GwHandleDropDownBox(_, _, _, width)
        self.gwDropDownWidth = width
    end
    function frame:SetText(text) self.text = text end
    function frame:SetScript(scriptType, func)
        self.scripts = self.scripts or {}
        self.scripts[scriptType] = func
    end
    function frame:HookScript(scriptType, func)
        self.hooks = self.hooks or {}
        self.hooks[scriptType] = func
    end
    createdDropDown = frame
    return frame
end

function hooksecurefunc(functionName, func)
    secureHooks[functionName] = func
end

function UIDropDownMenu_SetText(dropDown, text)
    dropDown.Text:SetText(text)
    if secureHooks.UIDropDownMenu_SetText then
        secureHooks.UIDropDownMenu_SetText(dropDown, text)
    end
end

function ToggleDropDownMenu(level, value, dropDown, anchor)
    dropDown.lastToggle = { level = level, anchor = anchor }
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

local dropDownText = NewFont("OriginalFont", 12, "")
function dropDownText:GetText() return self.text or "法师-火法" end
function dropDownText:SetText(text) self.text = text end
local dropDown = NewFrame("Frame", 240, 32, { dropDownText })
dropDown.Text = dropDownText
dropDown.Button = {
    EnableMouse = function(self, enabled) self.mouseEnabled = enabled end,
}
dropDown.Left = {}
dropDown.Middle = {}
dropDown.Right = {}
function dropDown:SetAlpha(alpha) self.alpha = alpha end
function dropDown:EnableMouse(enabled) self.mouseEnabled = enabled end

local exportButton = NewButton()
local exportArrowButton = NewButton()
exportArrowIcon = NewArrowIcon()
exportArrowButton.regions = { exportArrowIcon }
local importButton = NewButton()
local importArrowButton = NewButton()
importArrowIcon = NewArrowIcon()
importArrowButton.regions = { importArrowIcon }
local closeButton = NewButton()

local mainFrame = NewFrame("Frame", 650, 600, { bodyText }, {
    exportButton,
    exportArrowButton,
    importButton,
    importArrowButton,
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

local invalidChild = {
    GetSize = function()
        error("calling 'GetSize' on bad self")
    end,
    GetFrameStrata = function()
        return "FULLSCREEN_DIALOG"
    end,
}

UIParent = NewFrame("Frame", 0, 0, {}, {
    invalidChild,
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
    and importArrowButton.buttonSkinCalls == 1
    and closeButton.buttonSkinCalls == 1,
    "主窗口直接按钮都应应用 GW2 材质")
assert(exportArrowIcon.drawLayer == "OVERLAY"
    and importArrowIcon.drawLayer == "OVERLAY",
    "导入导出选项按钮的箭头图标必须显示在按钮材质上方")
assert(createdDropDown
    and createdDropDown.template == "WowStyle1DropdownTemplate"
    and createdDropDown.gwDropDownWidth == 200,
    "配置下拉框应使用 GW2 设置页同款原生下拉控件")
assert(createdDropDown.point[1] == "LEFT"
    and createdDropDown.point[2] == dropDown
    and createdDropDown.point[4] == 16
    and dropDown.alpha == 0
    and dropDown.mouseEnabled == false,
    "原生下拉控件应覆盖并接管旧式下拉框")
assert(createdDropDown.text == "法师-火法",
    "原生下拉控件应同步当前配置名称")
UIDropDownMenu_SetText(dropDown, "牧师-戒律")
assert(createdDropDown.text == "牧师-戒律",
    "配置名称变化后应同步到原生下拉控件")
createdDropDown.scripts.OnClick(createdDropDown)
assert(dropDown.lastToggle and dropDown.lastToggle.anchor == createdDropDown,
    "点击原生下拉控件应打开 Myslot 原有菜单")
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
