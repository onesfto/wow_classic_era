local optionsHook
local fontHooks = {}
local menuHooks = {}
local bodyText
local model
local unrelatedButton

UNIT_NAME_FONT = "GWDefaultFont"
GW2_ADDON = {
    BackdropTemplates = {
        DefaultWithSmallBorder = "DefaultWithSmallBorder",
    },
}

local function NewFont(path, size, flags)
    local font = {
        fontPath = path,
        fontSize = size,
        fontFlags = flags,
        text = "",
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
    function font:SetText(text)
        self.text = text
    end
    function font:GetText()
        return self.text
    end
    function font:SetTextColor(r, g, b, a)
        self.textColor = { r, g, b, a }
    end
    return font
end

local function NewFrame(regions, children, objectType)
    local frame = {
        regions = regions or {},
        children = children or {},
        objectType = objectType or "Frame",
    }
    function frame:GetRegions()
        return table.unpack(self.regions)
    end
    function frame:GetChildren()
        return table.unpack(self.children)
    end
    function frame:GetObjectType()
        return self.objectType
    end
    return frame
end

local function NewButton(text)
    local button = NewFrame({}, {}, "Button")
    button.fontString = NewFont("ButtonFont", 12, "")
    button.fontString:SetText(text or "")
    function button:GetFontString()
        return self.fontString
    end
    return button
end

local function NewCheckBox()
    return NewFrame({}, {}, "CheckButton")
end

local function NewSlider()
    return NewFrame({}, {}, "Slider")
end

local Skin = {}
function Skin.Register(addonName, func)
    Skin.registeredAddon = addonName
    Skin.registeredFunc = func
end
function Skin.SkinFrame(frame, template)
    frame.frameSkinCalls = (frame.frameSkinCalls or 0) + 1
    frame.frameTemplate = template
end
function Skin.SkinCheckBox(checkBox)
    checkBox.checkSkinCalls = (checkBox.checkSkinCalls or 0) + 1
end
function Skin.SkinSlider(slider)
    slider.sliderSkinCalls = (slider.sliderSkinCalls or 0) + 1
end
function Skin.SkinButton(button)
    button.buttonSkinCalls = (button.buttonSkinCalls or 0) + 1
end
function Skin.SkinClose(button)
    button.closeSkinCalls = (button.closeSkinCalls or 0) + 1
end

function hooksecurefunc(target, method, func)
    if target == SRTI and method == "Options" then
        optionsHook = func
    elseif method == "SetFontObject" then
        fontHooks[target] = func
    elseif target == SRTI.menu then
        menuHooks[method] = func
    else
        error("unexpected hook: " .. tostring(method))
    end
end

SRTI = {}
function SRTI:Options()
    SRTISaved = {
        ctrl = true,
        alt = false,
        shift = false,
        double = false,
    }

    bodyText = NewFont("OriginalFont", 12, "OUTLINE")
    model = NewFrame()
    unrelatedButton = NewButton()

    local singleFrame = NewFrame()
    local doubleFrame = NewFrame()
    local bindingFrame = NewFrame()
    local hoverFrame = NewFrame()
    local options = NewFrame({}, {
        singleFrame,
        doubleFrame,
        bindingFrame,
        hoverFrame,
    })
    options.singleframe = singleFrame
    options.doubleframe = doubleFrame
    options.bindingframe = bindingFrame
    options.hoverframe = hoverFrame

    local testFrame = NewFrame({}, { model })
    local thirdPartyCheck = NewCheckBox()
    local thirdParty = NewFrame({}, { thirdPartyCheck })

    local menu = NewFrame({ bodyText }, {
        options,
        testFrame,
        thirdParty,
        unrelatedButton,
    })
    menu.options = options
    menu.test = testFrame
    menu.thirdparty = thirdParty
    menu.thirdPartyCheck = thirdPartyCheck
    menu.title = NewFont("OriginalFont", 14, "")
    menu.optionheader = NewFont("OriginalFont", 12, "")
    menu.singletext = NewFont("OriginalFont", 12, "")
    menu.modifiertext = NewFont("OriginalFont", 12, "")
    menu.doubletext = NewFont("OriginalFont", 12, "")
    menu.bindingtext = NewFont("OriginalFont", 12, "")
    menu.test.help = NewFont("OriginalFont", 11, "")

    SRTIcb4Text = NewFont("OriginalFont", 12, "")
    SRTIcb6Text = NewFont("OriginalFont", 12, "")
    SRTIslider1Text = NewFont("OriginalFont", 12, "")
    SRTIslider1Low = NewFont("OriginalFont", 11, "")
    SRTIslider1High = NewFont("OriginalFont", 11, "")

    menu.closebutton = NewButton()
    menu.shift = NewCheckBox()
    menu.ctrl = NewCheckBox()
    menu.alt = NewCheckBox()
    menu.singlehover = NewCheckBox()
    menu.doublecb = NewCheckBox()
    menu.doublehover = NewCheckBox()
    menu.bindinghover = NewCheckBox()
    menu.doublespeed = NewSlider()
    menu.hovertime = NewSlider()
    menu.radialscale = NewSlider()
    menu.bindingkey1 = NewButton("|cffffd200未设置|r")
    menu.bindingkey2 = NewButton("|cffffd200未设置|r")
    menu.unbindingkey1 = NewButton()
    menu.unbindingkey2 = NewButton()
    menu.UpdateCB = function() end
    menu.UpdateDouble = function() end
    menu.UpdateBindings = function() end
    self.menu = menu
end

local addonTable = { Skin = Skin }
local chunk = assert(loadfile("skins/SimpleRaidTargetIcons.lua"))
chunk("GW2_UI_PLUS", addonTable)

assert(Skin.registeredAddon == "SimpleRaidTargetIcons",
    "皮肤必须注册到 SimpleRaidTargetIcons")
Skin.registeredFunc()
assert(type(optionsHook) == "function", "应钩住 SRTI.Options 动态建窗")

SRTI:Options()
optionsHook(SRTI)

local menu = SRTI.menu
assert(menu.frameSkinCalls == 1 and menu.options.frameSkinCalls == 1
    and menu.test.frameSkinCalls == 1,
    "主窗口、选项区和测试区应应用 GW2 背景")
assert(menu.options.singleframe.frameTemplate == "DefaultWithSmallBorder"
    and menu.options.doubleframe.frameTemplate == "DefaultWithSmallBorder"
    and menu.options.bindingframe.frameTemplate == "DefaultWithSmallBorder"
    and menu.options.hoverframe.frameTemplate == "DefaultWithSmallBorder",
    "四个分组框应使用 GW2 小边框背景")
assert(menu.ctrl.checkSkinCalls == 1
    and menu.doublecb.checkSkinCalls == 1
    and menu.thirdPartyCheck.checkSkinCalls == 1,
    "设置复选框和第三方复选框应应用 GW2 材质")
assert(menu.doublespeed.sliderSkinCalls == 1
    and menu.hovertime.sliderSkinCalls == 1
    and menu.radialscale.sliderSkinCalls == 1,
    "三个滑块应应用 GW2 材质")
assert(menu.bindingkey1.buttonSkinCalls == 1
    and menu.bindingkey2.buttonSkinCalls == 1,
    "两个按键按钮应应用 GW2 普通按钮材质")
assert(menu.unbindingkey1.closeSkinCalls == 1
    and menu.unbindingkey2.closeSkinCalls == 1
    and menu.closebutton.closeSkinCalls == 1,
    "清除绑定和窗口关闭按钮应应用 GW2 关闭按钮材质")
assert(not unrelatedButton.buttonSkinCalls and not unrelatedButton.closeSkinCalls,
    "无关按钮不得被误处理")
assert(not model.frameSkinCalls, "角色模型不得应用面板皮肤")

local function AssertColor(fontString, r, g, b, message)
    local color = assert(fontString.textColor, message .. "：未设置颜色")
    local epsilon = 0.001
    assert(math.abs(color[1] - r) < epsilon
        and math.abs(color[2] - g) < epsilon
        and math.abs(color[3] - b) < epsilon, message)
end

AssertColor(menu.title, 1, 0.945, 0.8196, "窗口标题应使用暖白色")
AssertColor(bodyText, 0.9, 0.9, 0.9, "普通正文应使用浅灰白色")
AssertColor(menu.singletext, 1, 0.945, 0.8196,
    "启用的单击分组标题应使用暖白色")
AssertColor(menu.doubletext, 0.5, 0.5, 0.5,
    "禁用的双击分组标题应使用灰色")
AssertColor(menu.test.help, 0.5, 0.5, 0.5,
    "测试说明应使用灰色")
AssertColor(menu.bindingkey1:GetFontString(), 0.95, 0.95, 0.95,
    "按键按钮文字应使用亮灰白色")
assert(menu.bindingkey1:GetFontString():GetText() == "未设置",
    "按键按钮文字应移除原生黄色颜色标签")

SRTISaved.ctrl = false
menuHooks.UpdateCB(menu)
AssertColor(menu.singletext, 0.5, 0.5, 0.5,
    "关闭全部修饰键后单击分组标题应变为禁用色")

SRTISaved.double = true
menuHooks.UpdateDouble(menu)
AssertColor(menu.doubletext, 1, 0.945, 0.8196,
    "启用双击后分组标题应恢复暖白色")
AssertColor(SRTIcb6Text, 0.9, 0.9, 0.9,
    "启用双击后相关选项应恢复正文色")

menu.bindingkey1:GetFontString():SetText("|cffffd200未设置|r")
menuHooks.UpdateBindings(menu)
assert(menu.bindingkey1:GetFontString():GetText() == "未设置",
    "按键刷新后仍应移除原生黄色颜色标签")

assert(bodyText.fontPath == UNIT_NAME_FONT and bodyText.fontSize == 12
    and bodyText.fontFlags == "OUTLINE",
    "字体应只替换路径并保留字号与样式")
bodyText:SetFontObject({ path = "DisabledFont", size = 10, flags = "" })
fontHooks[bodyText](bodyText)
assert(bodyText.fontPath == UNIT_NAME_FONT and bodyText.fontSize == 10,
    "字体对象刷新后应保留新字号并恢复 GW2 字体")

optionsHook(SRTI)
assert(menu.frameSkinCalls == 1 and menu.ctrl.checkSkinCalls == 1,
    "重复打开设置窗口不得重复应用皮肤")

print("SimpleRaidTargetIconsSkin_test: OK")
