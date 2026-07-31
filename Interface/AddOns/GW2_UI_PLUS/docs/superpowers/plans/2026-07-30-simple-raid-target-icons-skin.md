# SimpleRaidTargetIcons 轻量皮肤实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 为 `/srti` 设置窗口应用 GW2 背景、字体及控件材质，不改变布局、模型和设置功能。

**Architecture:** 新增独立皮肤模块，通过现有皮肤内核注册 `SimpleRaidTargetIcons`。模块安全钩住 `SRTI.Options` 以覆盖首次动态建窗，随后按插件公开字段精确处理面板、复选框、滑块和按钮，并递归替换字体路径、兼容后续 `SetFontObject` 刷新。

**Tech Stack:** World of Warcraft Classic Lua、GW2_UI Toolkit API、独立 Lua 测试脚本。

---

## 文件结构

- 新建 `skins/SimpleRaidTargetIcons.lua`：动态建窗钩子及设置窗口轻量皮肤。
- 新建 `tests/SimpleRaidTargetIconsSkin_test.lua`：验证材质、字体、范围隔离和幂等性。
- 修改 `GW2_UI_PLUS.toc`：在皮肤内核之后载入新皮肤。

### Task 1：建立失败测试

**Files:**
- Create: `tests/SimpleRaidTargetIconsSkin_test.lua`

- [ ] **Step 1：创建完整测试脚本**

```lua
local optionsHook
local fontHooks = {}
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

local function NewButton()
    return NewFrame({}, {}, "Button")
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
    else
        error("unexpected hook: " .. tostring(method))
    end
end

SRTI = {}
function SRTI:Options()
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
    menu.bindingkey1 = NewButton()
    menu.bindingkey2 = NewButton()
    menu.unbindingkey1 = NewButton()
    menu.unbindingkey2 = NewButton()
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
```

- [ ] **Step 2：运行测试并确认因皮肤文件不存在而失败**

Run: `lua tests/SimpleRaidTargetIconsSkin_test.lua`

Expected: FAIL，错误包含 `cannot open skins/SimpleRaidTargetIcons.lua`。

### Task 2：实现轻量皮肤

**Files:**
- Create: `skins/SimpleRaidTargetIcons.lua`
- Modify: `GW2_UI_PLUS.toc`
- Test: `tests/SimpleRaidTargetIconsSkin_test.lua`

- [ ] **Step 1：创建完整皮肤模块**

```lua
-- SimpleRaidTargetIcons 设置窗口轻量皮肤。

local _, addonTable = ...
local Skin = addonTable.Skin
if not Skin then return end

local GW = _G.GW2_ADDON

local function ApplyDefaultFont(object)
    if not object or not object.GetFont or not object.SetFont then return end
    local _, size, flags = object:GetFont()
    if not size then return end
    object:SetFont(UNIT_NAME_FONT, size, flags)

    if object.SetFontObject and not object.__gwSRTIFontHooked then
        object.__gwSRTIFontHooked = true
        hooksecurefunc(object, "SetFontObject", function(self)
            local _, newSize, newFlags = self:GetFont()
            if newSize then self:SetFont(UNIT_NAME_FONT, newSize, newFlags) end
        end)
    end
end

local function ApplyFonts(frame)
    if not frame then return end
    ApplyDefaultFont(frame)
    if frame.GetRegions then
        for _, region in ipairs({ frame:GetRegions() }) do
            ApplyDefaultFont(region)
        end
    end
    if frame.GetChildren then
        for _, child in ipairs({ frame:GetChildren() }) do
            ApplyFonts(child)
        end
    end
end

local function SkinPanel(frame, small)
    local template = small and GW and GW.BackdropTemplates
        and GW.BackdropTemplates.DefaultWithSmallBorder
    Skin.SkinFrame(frame, template)
end

local function SkinThirdPartyCheckBoxes(frame)
    if not frame or not frame.GetChildren then return end
    for _, child in ipairs({ frame:GetChildren() }) do
        if child.GetObjectType and child:GetObjectType() == "CheckButton" then
            Skin.SkinCheckBox(child)
        end
    end
end

local function ApplySettingsSkin()
    local srti = _G.SRTI
    local menu = srti and srti.menu
    if not menu or menu.__gwSRTISkinned then return end
    menu.__gwSRTISkinned = true

    SkinPanel(menu)
    SkinPanel(menu.options)
    SkinPanel(menu.test)
    SkinPanel(menu.thirdparty)

    local options = menu.options
    if options then
        SkinPanel(options.singleframe, true)
        SkinPanel(options.doubleframe, true)
        SkinPanel(options.bindingframe, true)
        SkinPanel(options.hoverframe, true)
    end

    for _, checkBox in ipairs({
        menu.shift,
        menu.ctrl,
        menu.alt,
        menu.singlehover,
        menu.doublecb,
        menu.doublehover,
        menu.bindinghover,
    }) do
        Skin.SkinCheckBox(checkBox)
    end
    SkinThirdPartyCheckBoxes(menu.thirdparty)

    for _, slider in ipairs({
        menu.doublespeed,
        menu.hovertime,
        menu.radialscale,
    }) do
        Skin.SkinSlider(slider)
    end

    Skin.SkinButton(menu.bindingkey1)
    Skin.SkinButton(menu.bindingkey2)
    Skin.SkinClose(menu.unbindingkey1)
    Skin.SkinClose(menu.unbindingkey2)
    Skin.SkinClose(menu.closebutton)

    ApplyFonts(menu)
end

addonTable.SimpleRaidTargetIconsSkin = {
    Apply = ApplySettingsSkin,
}

Skin.Register("SimpleRaidTargetIcons", function()
    local srti = _G.SRTI
    if not srti or type(srti.Options) ~= "function" then return end

    if not srti.__gwPlusSkinHooked then
        srti.__gwPlusSkinHooked = true
        hooksecurefunc(srti, "Options", ApplySettingsSkin)
    end
    ApplySettingsSkin()
end)
```

- [ ] **Step 2：把皮肤加入 TOC**

在 `skins/BugSack.lua` 后加入：

```text
skins/BugSack.lua
skins/SimpleRaidTargetIcons.lua
skins/MailLogger.lua
```

- [ ] **Step 3：运行专项测试**

Run: `lua tests/SimpleRaidTargetIconsSkin_test.lua`

Expected: `SimpleRaidTargetIconsSkin_test: OK`

- [ ] **Step 4：提交测试与实现**

```bash
git add tests/SimpleRaidTargetIconsSkin_test.lua skins/SimpleRaidTargetIcons.lua GW2_UI_PLUS.toc
git commit -m "皮肤：添加 SRTI 设置窗口主题"
```

### Task 3：验证

**Files:**
- Verify: `skins/SimpleRaidTargetIcons.lua`
- Verify: `tests/SimpleRaidTargetIconsSkin_test.lua`
- Verify: `GW2_UI_PLUS.toc`

- [ ] **Step 1：检查 Lua 语法与专项测试**

Run:

```bash
luac -p skins/SimpleRaidTargetIcons.lua tests/SimpleRaidTargetIconsSkin_test.lua
lua tests/SimpleRaidTargetIconsSkin_test.lua
```

Expected: 语法检查无输出，测试打印 `SimpleRaidTargetIconsSkin_test: OK`。

- [ ] **Step 2：运行全量回归**

Run:

```bash
for test_file in tests/*_test.lua; do
    lua "$test_file"
done
```

Expected: SRTI 及其他测试通过；允许保留用户已确认忽略的 `tests/SettingsStructure_test.lua:104` 既有动作条失败。

- [ ] **Step 3：检查提交范围**

Run:

```bash
git diff --check HEAD^..HEAD -- \
    Interface/AddOns/GW2_UI_PLUS/Modules/skins/SimpleRaidTargetIcons.lua \
    Interface/AddOns/GW2_UI_PLUS/tests/SimpleRaidTargetIconsSkin_test.lua \
    Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc
git status --short -- \
    skins/SimpleRaidTargetIcons.lua \
    tests/SimpleRaidTargetIconsSkin_test.lua \
    GW2_UI_PLUS.toc
```

Expected: 差异检查无输出，三个目标文件没有未提交修改。
