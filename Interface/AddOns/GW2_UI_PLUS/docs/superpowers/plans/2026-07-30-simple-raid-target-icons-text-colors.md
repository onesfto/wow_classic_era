# SimpleRaidTargetIcons 文字配色实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将 SRTI 设置窗口的原生纯黄色文字改为 GW2 柔和层级配色，并保留启用与禁用状态变化。

**Architecture:** 在现有 SRTI 皮肤中增加四级语义颜色和集中式 `ApplyTextColors`。初次套皮肤后应用颜色，并安全后置钩住 `UpdateCB`、`UpdateDouble` 与 `UpdateBindings`，确保原插件刷新状态后重新恢复正确颜色；按键按钮文本会先剥离原生内嵌颜色标签。

**Tech Stack:** World of Warcraft Classic Lua、GW2_UI 皮肤模块、独立 Lua 测试脚本。

---

### Task 1：扩展失败测试

**Files:**
- Modify: `tests/SimpleRaidTargetIconsSkin_test.lua`

- [ ] **Step 1：扩展字体模拟以记录文字和颜色**

将 `NewFont` 的表字段扩展为：

```lua
local font = {
    fontPath = path,
    fontSize = size,
    fontFlags = flags,
    text = "",
}
```

在 `NewFont` 返回前增加：

```lua
function font:SetText(text)
    self.text = text
end
function font:GetText()
    return self.text
end
function font:SetTextColor(r, g, b, a)
    self.textColor = { r, g, b, a }
end
```

- [ ] **Step 2：扩展按钮和安全钩子模拟**

将 `NewButton` 替换为：

```lua
local function NewButton(text)
    local button = NewFrame({}, {}, "Button")
    button.fontString = NewFont("ButtonFont", 12, "")
    button.fontString:SetText(text or "")
    function button:GetFontString()
        return self.fontString
    end
    return button
end
```

在测试顶部增加：

```lua
local menuHooks = {}
```

将 `hooksecurefunc` 扩展为：

```lua
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
```

- [ ] **Step 3：构造标题、状态文字与按键刷新函数**

在 `SRTI:Options()` 开头设置：

```lua
SRTISaved = {
    ctrl = true,
    alt = false,
    shift = false,
    double = false,
}
```

创建菜单后增加：

```lua
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

menu.bindingkey1 = NewButton("|cffffd200未设置|r")
menu.bindingkey2 = NewButton("|cffffd200未设置|r")
menu.UpdateCB = function() end
menu.UpdateDouble = function() end
menu.UpdateBindings = function() end
```

- [ ] **Step 4：增加颜色、刷新和颜色标签断言**

在首次皮肤断言后增加：

```lua
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
```

- [ ] **Step 5：运行测试并确认因配色功能不存在而失败**

Run: `lua tests/SimpleRaidTargetIconsSkin_test.lua`

Expected: FAIL，错误包含“窗口标题应使用暖白色：未设置颜色”。

### Task 2：实现语义配色

**Files:**
- Modify: `skins/SimpleRaidTargetIcons.lua`
- Test: `tests/SimpleRaidTargetIconsSkin_test.lua`

- [ ] **Step 1：增加四级颜色与通用文字辅助函数**

在 `local GW` 后增加：

```lua
local TEXT_COLOR = {
    Header = { 1, 0.945, 0.8196 },
    Body = { 0.9, 0.9, 0.9 },
    Button = { 0.95, 0.95, 0.95 },
    Disabled = { 0.5, 0.5, 0.5 },
}

local function SetTextColor(fontString, color)
    if fontString and fontString.SetTextColor then
        fontString:SetTextColor(color[1], color[2], color[3], 1)
    end
end

local function StripColorCodes(text)
    if type(text) ~= "string" then return text end
    text = string.gsub(text, "|c%x%x%x%x%x%x%x%x", "")
    return string.gsub(text, "|r", "")
end
```

- [ ] **Step 2：让递归字体处理默认应用正文色**

在 `ApplyDefaultFont` 的 `SetFont` 后增加：

```lua
SetTextColor(object, TEXT_COLOR.Body)
```

- [ ] **Step 3：实现集中式状态配色**

在 `ApplyFonts` 后增加：

```lua
local function StyleBindingButton(button)
    local fontString = button and button.GetFontString
        and button:GetFontString()
    if not fontString then return end
    local text = fontString:GetText()
    local cleanText = StripColorCodes(text)
    if cleanText ~= text then fontString:SetText(cleanText) end
    SetTextColor(fontString, TEXT_COLOR.Button)
end

local function ApplyTextColors(menu)
    if not menu then return end

    SetTextColor(menu.title, TEXT_COLOR.Header)
    SetTextColor(menu.optionheader, TEXT_COLOR.Header)
    SetTextColor(menu.bindingtext, TEXT_COLOR.Header)
    SetTextColor(menu.thirdpartytext, TEXT_COLOR.Header)

    local saved = _G.SRTISaved or {}
    local singleEnabled = saved.ctrl or saved.alt or saved.shift
    local singleColor = singleEnabled and TEXT_COLOR.Header
        or TEXT_COLOR.Disabled
    SetTextColor(menu.singletext, singleColor)
    SetTextColor(menu.modifiertext, singleColor)
    SetTextColor(_G.SRTIcb4Text,
        singleEnabled and TEXT_COLOR.Body or TEXT_COLOR.Disabled)

    local doubleColor = saved.double and TEXT_COLOR.Header
        or TEXT_COLOR.Disabled
    SetTextColor(menu.doubletext, doubleColor)
    for _, fontString in ipairs({
        _G.SRTIslider1Text,
        _G.SRTIslider1Low,
        _G.SRTIslider1High,
        _G.SRTIcb6Text,
    }) do
        SetTextColor(fontString,
            saved.double and TEXT_COLOR.Body or TEXT_COLOR.Disabled)
    end

    if menu.test then
        SetTextColor(menu.test.help, TEXT_COLOR.Disabled)
    end
    StyleBindingButton(menu.bindingkey1)
    StyleBindingButton(menu.bindingkey2)
end
```

- [ ] **Step 4：钩住状态刷新并首次应用颜色**

在 `ApplySettingsSkin()` 的 `ApplyFonts(menu)` 后增加：

```lua
ApplyTextColors(menu)

for _, method in ipairs({ "UpdateCB", "UpdateDouble", "UpdateBindings" }) do
    if type(menu[method]) == "function" then
        hooksecurefunc(menu, method, function()
            ApplyTextColors(menu)
        end)
    end
end
```

- [ ] **Step 5：运行专项测试**

Run: `lua tests/SimpleRaidTargetIconsSkin_test.lua`

Expected: `SimpleRaidTargetIconsSkin_test: OK`

- [ ] **Step 6：提交测试与实现**

```bash
git add tests/SimpleRaidTargetIconsSkin_test.lua skins/SimpleRaidTargetIcons.lua
git commit -m "皮肤：调整 SRTI 文字配色"
```

### Task 3：验证

**Files:**
- Verify: `skins/SimpleRaidTargetIcons.lua`
- Verify: `tests/SimpleRaidTargetIconsSkin_test.lua`

- [ ] **Step 1：检查 Lua 语法与专项行为**

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

Expected: SRTI 及其他测试通过；允许保留当前分支既有的 `MinimapAddonFlyout_test.lua:243` 和此前确认的 `SettingsStructure_test.lua:104` 两项无关失败。

- [ ] **Step 3：检查提交范围**

Run:

```bash
git diff --check HEAD^..HEAD -- \
    Interface/AddOns/GW2_UI_PLUS/skins/SimpleRaidTargetIcons.lua \
    Interface/AddOns/GW2_UI_PLUS/tests/SimpleRaidTargetIconsSkin_test.lua
git status --short -- \
    skins/SimpleRaidTargetIcons.lua \
    tests/SimpleRaidTargetIconsSkin_test.lua
```

Expected: 差异检查无输出，两个目标文件没有未提交修改。
