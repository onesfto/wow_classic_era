# BugSack 按钮皮肤实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 为 BugSack 三个底部按钮和右上角匿名关闭按钮应用对应的 GW2 按钮材质。

**Architecture:** 在现有 `skins/BugSack.lua` 的幂等窗口处理函数中，按全局名称处理三个底部按钮；只扫描主窗口直接子控件，并通过 `OnClick` 脚本与 `BugSack.CloseSack` 相等来识别匿名关闭按钮。测试扩展现有 WoW API 模拟，覆盖正确按钮、无关按钮和重复调用。

**Tech Stack:** World of Warcraft Classic Lua、GW2_UI 皮肤辅助函数、独立 Lua 测试脚本。

---

### Task 1：扩展失败测试

**Files:**
- Modify: `tests/BugSackSkin_test.lua`

- [ ] **Step 1：增加按钮测试对象和皮肤调用记录**

在 `NewFrame` 后增加：

```lua
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
```

在 `Skin.SkinScrollBar` 后增加：

```lua
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
```

- [ ] **Step 2：在模拟建窗中创建目标按钮与无关按钮**

在 `BugSack:OpenSack()` 前定义：

```lua
function BugSack:CloseSack() end
```

在模拟建窗末尾用以下内容替换原 `BugSackFrame` 创建行：

```lua
BugSackPrevButton = NewButton()
BugSackSendButton = NewButton()
BugSackNextButton = NewButton()
closeButton = NewButton(BugSack.CloseSack)
unrelatedButton = NewButton(function() end)
BugSackFrame = NewFrame(
    { bodyText },
    { BugSackScroll, closeButton, unrelatedButton }
)
```

- [ ] **Step 3：增加正确识别与幂等断言**

在滚动条断言后增加：

```lua
assert(BugSackPrevButton.buttonSkinCalls == 1
    and BugSackSendButton.buttonSkinCalls == 1
    and BugSackNextButton.buttonSkinCalls == 1,
    "三个底部按钮都应应用 GW2 普通按钮材质")
assert(closeButton.closeSkinCalls == 1,
    "右上角关闭按钮应应用 GW2 关闭按钮材质")
assert(not unrelatedButton.buttonSkinCalls and not unrelatedButton.closeSkinCalls,
    "无关按钮不得被误处理")
```

把重复调用断言扩展为：

```lua
assert(BugSackFrame.skinFrameCalls == 1
    and BugSackTabAll.tabSkinCalls == 1
    and BugSackScroll.scrollFrameSkinCalls == 1
    and BugSackPrevButton.buttonSkinCalls == 1
    and closeButton.closeSkinCalls == 1,
    "重复打开窗口不得重复应用皮肤")
```

- [ ] **Step 4：运行测试并确认因按钮尚未处理而失败**

Run: `lua tests/BugSackSkin_test.lua`

Expected: FAIL，错误为尝试比较 `BugSackPrevButton.buttonSkinCalls`，或断言“三个底部按钮都应应用 GW2 普通按钮材质”失败。

### Task 2：实现按钮皮肤

**Files:**
- Modify: `skins/BugSack.lua`
- Test: `tests/BugSackSkin_test.lua`

- [ ] **Step 1：实现三个命名按钮处理**

在 `ApplyFonts` 后增加：

```lua
local function SkinBottomButtons()
    for _, name in ipairs({
        "BugSackPrevButton",
        "BugSackSendButton",
        "BugSackNextButton",
    }) do
        Skin.SkinButton(_G[name])
    end
end
```

- [ ] **Step 2：实现匿名关闭按钮精确识别**

继续增加：

```lua
local function SkinCloseButton(frame)
    local bugSack = _G.BugSack
    if not frame or not frame.GetChildren or not bugSack then return end

    for _, child in ipairs({ frame:GetChildren() }) do
        if child.GetObjectType and child:GetObjectType() == "Button"
            and child.GetScript
            and child:GetScript("OnClick") == bugSack.CloseSack then
            Skin.SkinClose(child)
            return
        end
    end
end
```

- [ ] **Step 3：接入现有幂等窗口处理**

在 `ApplyWindowSkin()` 的滚动条处理之后、`ApplyFonts(frame)` 之前加入：

```lua
SkinBottomButtons()
SkinCloseButton(frame)
```

- [ ] **Step 4：运行专项测试**

Run: `lua tests/BugSackSkin_test.lua`

Expected: `BugSackSkin_test: OK`

- [ ] **Step 5：提交测试与实现**

```bash
git add tests/BugSackSkin_test.lua skins/BugSack.lua
git commit -m "皮肤：美化 BugSack 按钮"
```

### Task 3：验证

**Files:**
- Verify: `skins/BugSack.lua`
- Verify: `tests/BugSackSkin_test.lua`

- [ ] **Step 1：检查 Lua 语法和专项行为**

Run:

```bash
luac -p skins/BugSack.lua tests/BugSackSkin_test.lua
lua tests/BugSackSkin_test.lua
```

Expected: 语法检查无输出，测试打印 `BugSackSkin_test: OK`。

- [ ] **Step 2：运行回归测试**

Run:

```bash
for test_file in tests/*_test.lua; do
    lua "$test_file"
done
```

Expected: BugSack 及其他测试通过；允许保留用户已确认忽略的 `tests/SettingsStructure_test.lua:104` 既有动作条失败。

- [ ] **Step 3：检查差异**

Run:

```bash
git diff --check HEAD^
git status --short -- skins/BugSack.lua tests/BugSackSkin_test.lua
```

Expected: 差异检查无输出，两个目标文件没有未提交修改。
