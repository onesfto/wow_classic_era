# Myslot 主窗口轻量皮肤实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 为 Myslot 导入/导出主窗口和导入进度窗口应用 GW2 材质与默认字体。

**Architecture:** 新增独立 Myslot 皮肤模块，通过库引用或严格结构特征找到匿名主窗口，并在首次 `OnShow` 时处理完整控件树。主窗口只处理直接按钮，并精确识别下拉框和包含滚动框的文本容器；进度窗口通过尺寸、层级和状态条组合识别。

**Tech Stack:** World of Warcraft Classic Lua、GW2_UI Toolkit API、独立 Lua 测试脚本。

---

## 文件结构

- 新建 `skins/Myslot.lua`：窗口识别、材质和字体处理。
- 新建 `tests/MyslotSkin_test.lua`：覆盖匿名窗口识别、控件范围、进度条与幂等性。
- 修改 `GW2_UI_PLUS.toc`：载入 Myslot 皮肤。

### Task 1：建立失败测试

**Files:**
- Create: `tests/MyslotSkin_test.lua`

- [ ] **Step 1：创建完整测试脚本**

```lua
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
```

- [ ] **Step 2：运行测试并确认因皮肤文件不存在而失败**

Run: `lua tests/MyslotSkin_test.lua`

Expected: FAIL，错误包含 `cannot open skins/Myslot.lua`。

### Task 2：实现 Myslot 轻量皮肤

**Files:**
- Create: `skins/Myslot.lua`
- Modify: `GW2_UI_PLUS.toc`
- Test: `tests/MyslotSkin_test.lua`

- [ ] **Step 1：创建完整皮肤模块**

```lua
-- Myslot 导入/导出主窗口轻量皮肤。

local _, addonTable = ...
local Skin = addonTable.Skin
if not Skin then return end

local STATUS_BAR_TEXTURE =
    "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar.png"

local function Rounded(value)
    return value and math.floor(value + 0.5)
end

local function GetChildren(frame)
    if not frame or not frame.GetChildren then return {} end
    return { frame:GetChildren() }
end

local function ApplyDefaultFont(object)
    if not object or not object.GetFont or not object.SetFont then return end
    local _, size, flags = object:GetFont()
    if not size then return end
    object:SetFont(UNIT_NAME_FONT, size, flags)
end

local function ApplyFonts(frame)
    if not frame then return end
    ApplyDefaultFont(frame)
    if frame.GetRegions then
        for _, region in ipairs({ frame:GetRegions() }) do
            ApplyDefaultFont(region)
        end
    end
    for _, child in ipairs(GetChildren(frame)) do
        ApplyFonts(child)
    end
end

local function FindDirectChild(frame, objectType)
    for _, child in ipairs(GetChildren(frame)) do
        if child.GetObjectType and child:GetObjectType() == objectType then
            return child
        end
    end
end

local function IsDropDown(frame)
    return frame and frame.GetObjectType
        and frame:GetObjectType() == "Frame"
        and frame.Button and (frame.Left or frame.Middle or frame.Right)
end

local function SkinTextArea(frame)
    local scrollFrame = FindDirectChild(frame, "ScrollFrame")
    if not scrollFrame then return false end
    local editBox = FindDirectChild(scrollFrame, "EditBox")
    local _, editSize, editFlags
    if editBox and editBox.GetFont then
        _, editSize, editFlags = editBox:GetFont()
    end

    Skin.SkinFrame(frame)
    if scrollFrame.GwSkinScrollFrame then
        scrollFrame:GwSkinScrollFrame()
    end
    Skin.SkinScrollBar(scrollFrame.ScrollBar)
    Skin.SkinEditBox(editBox)
    if editBox and editSize and editBox.SetFont then
        editBox:SetFont(UNIT_NAME_FONT, editSize, editFlags)
    end
    return true
end

local function SkinMainFrame(frame)
    if not frame or frame.__gwMyslotSkinned then return end
    frame.__gwMyslotSkinned = true

    Skin.SkinFrame(frame)
    for _, child in ipairs(GetChildren(frame)) do
        local objectType = child.GetObjectType and child:GetObjectType()
        if objectType == "Button" then
            Skin.SkinButton(child)
        elseif IsDropDown(child) then
            Skin.SkinDropDown(child,
                child.GetWidth and child:GetWidth())
        elseif objectType == "Frame" then
            SkinTextArea(child)
        end
    end
    ApplyFonts(frame)
end

local function FindStatusBar(frame)
    return FindDirectChild(frame, "StatusBar")
end

local function IsProgressFrame(frame)
    if not frame or not frame.GetSize or not frame.GetFrameStrata then
        return false
    end
    local width, height = frame:GetSize()
    return Rounded(width) == 360
        and Rounded(height) == 70
        and frame:GetFrameStrata() == "FULLSCREEN_DIALOG"
        and FindStatusBar(frame) ~= nil
end

local function SkinProgressFrames()
    for _, frame in ipairs(GetChildren(_G.UIParent)) do
        if IsProgressFrame(frame) and not frame.__gwMyslotProgressSkinned then
            frame.__gwMyslotProgressSkinned = true
            Skin.SkinFrame(frame)
            local statusBar = FindStatusBar(frame)
            statusBar:SetStatusBarTexture(STATUS_BAR_TEXTURE)
            ApplyFonts(frame)
        end
    end
end

local function CountDirectButtons(frame)
    local count = 0
    for _, child in ipairs(GetChildren(frame)) do
        if child.GetObjectType and child:GetObjectType() == "Button" then
            count = count + 1
        end
    end
    return count
end

local function IsMainFrame(frame)
    if not frame or not frame.GetSize then return false end
    local width, height = frame:GetSize()
    return Rounded(width) == 650
        and Rounded(height) == 600
        and CountDirectButtons(frame) >= 4
end

local function FindMainFrame()
    local lib = _G.LibStub and _G.LibStub.GetLibrary
        and _G.LibStub:GetLibrary("Myslot-5.0", true)
    if lib and lib.MainFrame then return lib.MainFrame end

    for _, frame in ipairs(GetChildren(_G.UIParent)) do
        if IsMainFrame(frame) then return frame end
    end
end

Skin.Register("Myslot", function()
    local frame = FindMainFrame()
    if not frame then return end

    if not frame.__gwMyslotShowHooked then
        frame.__gwMyslotShowHooked = true
        frame:HookScript("OnShow", function(self)
            SkinMainFrame(self)
            SkinProgressFrames()
        end)
    end

    SkinProgressFrames()
    if frame.IsShown and frame:IsShown() then
        SkinMainFrame(frame)
    end
end)
```

- [ ] **Step 2：把皮肤加入 TOC**

在 `skins/SimpleRaidTargetIcons.lua` 后加入：

```text
skins/SimpleRaidTargetIcons.lua
skins/Myslot.lua
skins/MailLogger.lua
```

- [ ] **Step 3：运行专项测试**

Run: `lua tests/MyslotSkin_test.lua`

Expected: `MyslotSkin_test: OK`

- [ ] **Step 4：提交测试与实现**

```bash
git add tests/MyslotSkin_test.lua skins/Myslot.lua GW2_UI_PLUS.toc
git commit -m "皮肤：添加 Myslot 主窗口主题"
```

### Task 3：验证

**Files:**
- Verify: `skins/Myslot.lua`
- Verify: `tests/MyslotSkin_test.lua`
- Verify: `GW2_UI_PLUS.toc`

- [ ] **Step 1：检查 Lua 语法与专项行为**

Run:

```bash
luac -p skins/Myslot.lua tests/MyslotSkin_test.lua
lua tests/MyslotSkin_test.lua
```

Expected: 语法检查无输出，测试打印 `MyslotSkin_test: OK`。

- [ ] **Step 2：运行全量回归**

Run:

```bash
for test_file in tests/*_test.lua; do
    lua "$test_file"
done
```

Expected: Myslot 及其他测试通过；允许保留此前确认的 `SettingsStructure_test.lua:104` 动作条既有失败。

- [ ] **Step 3：检查提交范围**

Run:

```bash
git diff --check HEAD^..HEAD -- \
    Interface/AddOns/GW2_UI_PLUS/Modules/skins/Myslot.lua \
    Interface/AddOns/GW2_UI_PLUS/tests/MyslotSkin_test.lua \
    Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc
git status --short -- \
    skins/Myslot.lua \
    tests/MyslotSkin_test.lua \
    GW2_UI_PLUS.toc
```

Expected: 差异检查无输出，三个目标文件没有未提交修改。
