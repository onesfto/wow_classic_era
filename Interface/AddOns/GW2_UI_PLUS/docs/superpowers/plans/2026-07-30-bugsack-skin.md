# BugSack 轻量皮肤实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 为 BugSack 主错误窗口应用 GW2 面板、标签页、滚动区域材质和默认字体，同时保留原布局、按钮外观与字号设置。

**Architecture:** 新增一个独立 BugSack 皮肤模块，通过现有 `Skin.Register` 注册。模块安全钩住 `BugSack:OpenSack()`，在 BugSack 首次动态创建命名窗口后幂等处理材质，并递归替换现有文字的字体路径；错误文本后续切换字体对象时再次只替换路径、保留新字号。

**Tech Stack:** World of Warcraft Classic Lua、GW2_UI Toolkit API、独立 Lua 测试脚本。

---

## 文件结构

- 新建 `skins/BugSack.lua`：负责 BugSack 动态窗口探测、材质应用、字体替换和字号更新兼容。
- 新建 `tests/BugSackSkin_test.lua`：使用最小 WoW API 模拟验证注册、动态创建、材质、字体和幂等行为。
- 修改 `GW2_UI_PLUS.toc`：在皮肤内核之后载入 BugSack 皮肤。

### Task 1：建立失败测试

**Files:**
- Create: `tests/BugSackSkin_test.lua`

- [ ] **Step 1：编写动态建窗与皮肤行为测试**

创建完整的 `tests/BugSackSkin_test.lua`：

```lua
local openSackHook
local fontObjectHook
local bodyText

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
    BugSackFrame = NewFrame({ bodyText }, { BugSackScroll })
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
    and BugSackScroll.scrollFrameSkinCalls == 1,
    "重复打开窗口不得重复应用皮肤")

print("BugSackSkin_test: OK")
```

- [ ] **Step 2：运行测试并确认因皮肤文件不存在而失败**

Run: `lua tests/BugSackSkin_test.lua`

Expected: FAIL，错误包含 `cannot open skins/BugSack.lua`。

- [ ] **Step 3：提交失败测试**

```bash
git add tests/BugSackSkin_test.lua
git commit -m "测试：覆盖 BugSack 轻量皮肤"
```

### Task 2：实现 BugSack 轻量皮肤

**Files:**
- Create: `skins/BugSack.lua`
- Modify: `GW2_UI_PLUS.toc`
- Test: `tests/BugSackSkin_test.lua`

- [ ] **Step 1：实现保留字号的字体替换**

在 `skins/BugSack.lua` 中定义：

```lua
local _, addonTable = ...
local Skin = addonTable.Skin
if not Skin then return end

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
    if frame.GetChildren then
        for _, child in ipairs({ frame:GetChildren() }) do
            ApplyFonts(child)
        end
    end
end
```

- [ ] **Step 2：实现幂等材质处理与字号更新钩子**

在同一文件中添加：

```lua
local function ApplyWindowSkin()
    local frame = _G.BugSackFrame
    if not frame or frame.__gwBugSackSkinned then return end
    frame.__gwBugSackSkinned = true

    Skin.SkinFrame(frame)

    for _, name in ipairs({
        "BugSackTabAll",
        "BugSackTabSession",
        "BugSackTabLast",
    }) do
        local tab = _G[name]
        if tab and tab.GwSkinTab then tab:GwSkinTab() end
    end

    local scroll = _G.BugSackScroll
    if scroll and scroll.GwSkinScrollFrame then scroll:GwSkinScrollFrame() end
    Skin.SkinScrollBar(_G.BugSackScrollScrollBar
        or (scroll and scroll.ScrollBar))

    ApplyFonts(frame)

    local textArea = _G.BugSackScrollText
    if textArea and not textArea.__gwBugSackFontHooked then
        textArea.__gwBugSackFontHooked = true
        hooksecurefunc(textArea, "SetFontObject", function(self)
            ApplyDefaultFont(self)
        end)
    end
end
```

- [ ] **Step 3：注册并钩住 BugSack 动态建窗**

在文件末尾添加：

```lua
addonTable.BugSackSkin = {
    Apply = ApplyWindowSkin,
}

Skin.Register("BugSack", function()
    local bugSack = _G.BugSack
    if not bugSack or type(bugSack.OpenSack) ~= "function" then return end

    if not bugSack.__gwPlusSkinHooked then
        bugSack.__gwPlusSkinHooked = true
        hooksecurefunc(bugSack, "OpenSack", ApplyWindowSkin)
    end
    ApplyWindowSkin()
end)
```

- [ ] **Step 4：把皮肤文件加入加载清单**

在 `GW2_UI_PLUS.toc` 的 `skins/Core.lua` 后加入：

```text
skins/Core.lua
skins/BugSack.lua
skins/MailLogger.lua
```

- [ ] **Step 5：运行专项测试并确认通过**

Run: `lua tests/BugSackSkin_test.lua`

Expected: `BugSackSkin_test: OK`

- [ ] **Step 6：提交实现**

```bash
git add skins/BugSack.lua GW2_UI_PLUS.toc
git commit -m "皮肤：添加 BugSack 轻量主题"
```

### Task 3：回归与静态验证

**Files:**
- Verify: `skins/BugSack.lua`
- Verify: `tests/BugSackSkin_test.lua`
- Verify: `GW2_UI_PLUS.toc`

- [ ] **Step 1：检查 Lua 语法**

Run: `luac -p skins/BugSack.lua tests/BugSackSkin_test.lua`

Expected: 无输出，退出码为 0。

- [ ] **Step 2：运行全部独立 Lua 测试**

Run:

```bash
for test_file in tests/*_test.lua; do
    lua "$test_file"
done
```

Expected: 每个测试打印 `OK`，命令退出码为 0。

- [ ] **Step 3：检查差异与加载顺序**

Run:

```bash
git diff --check HEAD^
git status --short -- skins/BugSack.lua tests/BugSackSkin_test.lua GW2_UI_PLUS.toc
```

Expected: `git diff --check` 无输出；三个目标文件没有未提交修改。

- [ ] **Step 4：游戏内手动验收**

进入游戏后执行 `/bugsack` 或点击 BugSack 图标，确认：

1. 主窗口、三个标签页和滚动条使用 GW2 材质。
2. 普通按钮、关闭按钮和布局保持原样。
3. 错误文字使用 GW2 默认字体。
4. 在 BugSack 设置中切换字号后，字号变化且字体仍保持 GW2 默认字体。
