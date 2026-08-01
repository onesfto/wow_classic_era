# MailLogger GW2 皮肤实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 在不修改 MailLogger 原插件的前提下，为其三个窗口和全部控件应用 GW2 风格，并在交易记录窗口新增“日历”“设置”按钮。

**Architecture:** `skins/Core.lua` 增加下拉框和输入框的通用皮肤接口；新的 `skins/MailLogger.lua` 通过 MailLogger 事件帧的后置钩子，在原插件初始化完成后识别匿名窗口并递归美化。交易记录窗口的新增入口调用 MailLogger 已注册的斜杠命令，避免复制或访问其私有插件表。

**Tech Stack:** WoW Classic Era Lua 5.1 API、GW2_UI toolkit、GW2_UI_PLUS 皮肤注册器、独立 Lua 模拟测试、`luac -p`、SHA-256。

---

## 文件结构

- 修改 `Interface/AddOns/GW2_UI_PLUS/skins/Core.lua`：增加通用下拉框和输入框皮肤方法。
- 创建 `Interface/AddOns/GW2_UI_PLUS/skins/MailLogger.lua`：窗口发现、控件美化、布局、新按钮和重建处理。
- 修改 `Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc`：在皮肤内核后加载 MailLogger 皮肤。
- 创建 `Interface/AddOns/GW2_UI_PLUS/tests/SkinControls_test.lua`：验证通用控件方法的分派和幂等。
- 创建 `Interface/AddOns/GW2_UI_PLUS/tests/MailLoggerSkin_test.lua`：用模拟 Frame 验证窗口发现、布局、按钮和重建。

### Task 1：通用下拉框与输入框标准

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/skins/Core.lua`
- Create: `Interface/AddOns/GW2_UI_PLUS/tests/SkinControls_test.lua`

- [ ] **Step 1：编写失败测试**

测试加载 `skins/Core.lua` 后调用两个新接口，确认下拉框优先使用经典 `GwSkinDropDownMenu`，输入框剥离纹理、创建背景、应用字体，并且重复调用不重复处理：

```lua
Skin.SkinDropDown(dropdown, 120)
Skin.SkinDropDown(dropdown, 120)
assert(dropdown.dropDownCalls == 1)
assert(dropdown.width == 120)

Skin.SkinEditBox(editBox)
Skin.SkinEditBox(editBox)
assert(editBox.stripCalls == 1)
assert(editBox.backdropCalls == 1)
assert(editBox.fontCalls == 1)
```

- [ ] **Step 2：运行测试并确认失败**

Run:

```bash
cd "/Applications/World of Warcraft/_classic_era_/Interface/AddOns/GW2_UI_PLUS"
lua tests/SkinControls_test.lua
```

Expected: FAIL，提示 `SkinDropDown` 或 `SkinEditBox` 不存在。

- [ ] **Step 3：实现最小通用接口**

在 `Skin.SkinScrollBar` 后增加：

```lua
function Skin.SkinDropDown(dropdown, width)
    if not dropdown or dropdown.__gwSkinnedDropDown then return end
    dropdown.__gwSkinnedDropDown = true

    if dropdown.GwSkinDropDownMenu and (dropdown.Button or dropdown:GetName()) then
        dropdown:GwSkinDropDownMenu()
    elseif dropdown.GwHandleDropDownBox then
        dropdown:GwHandleDropDownBox()
    end

    if width then dropdown:SetWidth(width) end
end

function Skin.SkinEditBox(editBox)
    if not editBox or editBox.__gwSkinnedEditBox then return end
    editBox.__gwSkinnedEditBox = true

    if editBox.GwStripTextures then editBox:GwStripTextures() end
    if editBox.GwCreateBackdrop then
        editBox:GwCreateBackdrop(GW and GW.BackdropTemplates
            and GW.BackdropTemplates.DefaultWithSmallBorder)
    end
    Skin.SkinFont(editBox, "Normal")
end
```

测试桩必须提供 `GetName`、`SetWidth`、`GwSkinDropDownMenu`、`GwStripTextures`、`GwCreateBackdrop` 和 `GwSetFontTemplate`。

- [ ] **Step 4：运行测试和语法检查**

Run:

```bash
lua tests/SkinControls_test.lua
luac -p skins/Core.lua tests/SkinControls_test.lua
```

Expected: 输出 `SkinControls_test: OK`，`luac` 退出码为 0。

- [ ] **Step 5：提交通用控件改动**

```bash
git add Interface/AddOns/GW2_UI_PLUS/skins/Core.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/SkinControls_test.lua
git commit -m "功能：补充皮肤通用下拉框和输入框"
```

### Task 2：匿名窗口发现与基础皮肤

**Files:**
- Create: `Interface/AddOns/GW2_UI_PLUS/skins/MailLogger.lua`
- Create: `Interface/AddOns/GW2_UI_PLUS/tests/MailLoggerSkin_test.lua`

- [ ] **Step 1：为窗口发现编写失败测试**

模拟 `UIParent:GetChildren()` 返回三个 MailLogger 窗口和一个同尺寸但没有原始标题纹理的干扰窗口。三个目标窗口分别带有以下特征：

```lua
local settings = NewFrame(380, 510, "Interface/DialogFrame/UI-DialogBox-Header")
local output = NewFrame(360, 510, "Interface/DialogFrame/UI-DialogBox-Header")
local calendar = NewFrame(320, 320, "Interface/DialogFrame/UI-DialogBox-Header")
local unrelated = NewFrame(380, 510, "Interface/OtherAddon/header")
```

调用测试接口：

```lua
MailLoggerSkin.ScanWindows()
assert(settings.__gwMailLoggerKind == "settings")
assert(output.__gwMailLoggerKind == "output")
assert(calendar.__gwMailLoggerKind == "calendar")
assert(unrelated.__gwMailLoggerKind == nil)
```

- [ ] **Step 2：运行测试并确认失败**

Run:

```bash
lua tests/MailLoggerSkin_test.lua
```

Expected: FAIL，提示 `skins/MailLogger.lua` 或 `ScanWindows` 不存在。

- [ ] **Step 3：实现窗口识别与状态容器**

创建模块骨架并导出测试接口：

```lua
local _, addonTable = ...
local Skin = addonTable.Skin
if not Skin then return end

local MailLoggerSkin = {
    frames = {},
}
addonTable.MailLoggerSkin = MailLoggerSkin

local HEADER_TEXTURE = "interface/dialogframe/ui-dialogbox-header"

local function HasOriginalHeader(frame)
    local texture = frame.texture
    local path = texture and texture.GetTexture and texture:GetTexture()
    return type(path) == "string" and path:lower() == HEADER_TEXTURE
end

local function GetWindowKind(frame)
    if not HasOriginalHeader(frame) then return end
    local width, height = frame:GetSize()
    if height == 510 and width == 380 then return "settings" end
    if height == 510 and (width == 360 or width == 470) then return "output" end
    if height == 320 and width == 320 then return "calendar" end
end
```

`ScanWindows` 遍历 `UIParent:GetChildren()`，只处理通过纹理和尺寸双重校验的直接子级，并把最新窗口存入 `MailLoggerSkin.frames[kind]`。

- [ ] **Step 4：为内嵌标题区和递归控件皮肤编写失败测试**

在三个窗口中放入 Button、CheckButton、EditBox、ScrollFrame、下拉 Frame 和 FontString，调用扫描后断言：

```lua
assert(settings.__gwMailLoggerSkinned)
assert(settings.inlineHeader)
assert(settings.texture.hidden)
assert(button.skinCalls == 1)
assert(check.skinCalls == 1)
assert(editBox.editSkinCalls == 1)
assert(scrollBar.skinCalls == 1)
assert(dropdown.dropDownCalls == 1)
```

重复调用 `ScanWindows()`，断言所有调用次数不增加。

- [ ] **Step 5：实现内嵌标题与递归控件皮肤**

实现以下边界清晰的本地函数：

```lua
local function AddInlineHeader(frame)
    if frame.inlineHeader then return end
    local header = CreateFrame("Frame", nil, frame, "GwFrameHeader")
    header:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -1)
    header:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -1)
    header:EnableMouse(true)
    header:RegisterForDrag("LeftButton")
    header:SetScript("OnDragStart", function() frame:StartMoving() end)
    header:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)
    frame.inlineHeader = header
end
```

隐藏 `frame.texture`，把窗口现有标题 FontString 移入 `inlineHeader`；遍历 `frame:GetRegions()` 统一 FontString；递归遍历 `frame:GetChildren()`，按 `GetObjectType()` 调用 `Skin.SkinButton`、`Skin.SkinCheckBox`、`Skin.SkinEditBox`、`Skin.SkinDropDown` 和 `Skin.SkinScrollBar`。每个窗口使用 `__gwMailLoggerSkinned` 保证幂等。

- [ ] **Step 6：运行窗口测试和语法检查**

Run:

```bash
lua tests/MailLoggerSkin_test.lua
luac -p skins/MailLogger.lua tests/MailLoggerSkin_test.lua
```

Expected: 输出 `MailLoggerSkin_test: OK`，`luac` 退出码为 0。

- [ ] **Step 7：提交基础皮肤**

```bash
git add Interface/AddOns/GW2_UI_PLUS/skins/MailLogger.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/MailLoggerSkin_test.lua
git commit -m "功能：添加 MailLogger 基础窗口皮肤"
```

### Task 3：交易记录布局与新增入口

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/skins/MailLogger.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/tests/MailLoggerSkin_test.lua`

- [ ] **Step 1：编写底部布局失败测试**

在模拟输出窗口放入原有 6 个底部按钮，原始横坐标依次为 20、70、120、170、220、290。扫描后断言：

```lua
assert(output:GetWidth() == 470)
assert(#output.bottomButtons == 8)
assert(output.bottomButtons[6]:GetText() == "日历")
assert(output.bottomButtons[7]:GetText() == "设置")
assert(output.bottomButtons[8]:GetText() == CLOSE)
```

同时断言正文 ScrollFrame 的右边界随新宽度扩展，按钮宽度依次为 `45, 45, 45, 45, 55, 55, 55, 50`，相邻间距为 5px，左右边距为 20px。

- [ ] **Step 2：实现输出窗口布局**

实现 `LayoutOutput(frame)`：

```lua
local BUTTON_WIDTHS = {45, 45, 45, 45, 55, 55, 55, 50}

frame:SetWidth(470)
for index, button in ipairs(buttons) do
    button:ClearAllPoints()
    button:SetWidth(BUTTON_WIDTHS[index])
    if index == 1 then
        button:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 20, 10)
    else
        button:SetPoint("LEFT", buttons[index - 1], "RIGHT", 5, 0)
    end
end
```

原有 6 个底部按钮按原始横坐标排序；创建“日历”“设置”按钮并插入“关闭”之前。输出 ScrollFrame 保持左边界，右边界改为距窗口右侧 45px，滚动条随父级移动。

- [ ] **Step 3：编写新增按钮行为失败测试**

提供 `SlashCmdList.MLC` 测试桩并模拟日历显示状态：

```lua
calendar:Hide()
calendarButton:GetScript("OnClick")()
assert(lastSlashCommand == "all")

calendar:Show()
calendarButton:GetScript("OnClick")()
assert(not calendar:IsShown())

settingsButton:GetScript("OnClick")()
assert(lastSlashCommand == "gui")
```

- [ ] **Step 4：实现新增按钮行为**

```lua
calendarButton:SetScript("OnClick", function()
    local calendar = MailLoggerSkin.frames.calendar
    if calendar and calendar:IsShown() then
        calendar:Hide()
    elseif SlashCmdList and SlashCmdList.MLC then
        SlashCmdList.MLC("all")
    end
end)

settingsButton:SetScript("OnClick", function()
    if SlashCmdList and SlashCmdList.MLC then
        SlashCmdList.MLC("gui")
    end
end)
```

- [ ] **Step 5：编写窗口重建失败测试**

第一次扫描后向 `UIParent` 加入新的 380×510 设置窗口和新的 360×510 输出窗口；触发旧设置窗口任一按钮的后置点击钩子，断言新窗口得到皮肤和新增按钮，旧窗口没有重复元素。

- [ ] **Step 6：实现事件驱动重扫**

给设置窗口的直接 Button 子级各安装一次 `HookScript("OnClick", MailLoggerSkin.ScanWindows)`，使用按钮私有标记避免重复钩子。扫描时同时识别 360px 的新输出窗口和已经处理过的 470px 输出窗口，始终让 `frames` 指向最新的未隐藏重建对象。

- [ ] **Step 7：运行完整测试**

Run:

```bash
lua tests/SkinControls_test.lua
lua tests/MailLoggerSkin_test.lua
luac -p skins/Core.lua skins/MailLogger.lua \
  tests/SkinControls_test.lua tests/MailLoggerSkin_test.lua
```

Expected: 两个测试均输出 `OK`，`luac` 退出码为 0。

- [ ] **Step 8：提交布局与交互**

```bash
git add Interface/AddOns/GW2_UI_PLUS/skins/MailLogger.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/MailLoggerSkin_test.lua
git commit -m "功能：扩展 MailLogger 记录窗口入口"
```

### Task 4：加载接入与最终验证

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc`
- Modify: `Interface/AddOns/GW2_UI_PLUS/skins/MailLogger.lua`

- [ ] **Step 1：编写加载注册失败断言**

在 `MailLoggerSkin_test.lua` 记录 `Skin.Register` 参数，并断言：

```lua
assert(registeredAddon == "MailLogger")
assert(type(registeredSkin) == "function")
```

执行注册回调后模拟 `_G.MailLoggerFrame:HookScript("OnEvent", ...)`；调用后置事件处理器时才允许扫描窗口。

- [ ] **Step 2：实现加载时序**

在 `skins/MailLogger.lua` 末尾注册：

```lua
Skin.Register("MailLogger", function()
    local eventFrame = _G.MailLoggerFrame
    if eventFrame and not eventFrame.__gwMailLoggerHooked then
        eventFrame.__gwMailLoggerHooked = true
        eventFrame:HookScript("OnEvent", function(_, event, addonName)
            if event == "ADDON_LOADED" and addonName == "MailLogger" then
                MailLoggerSkin.ScanWindows()
            end
        end)
    end
    MailLoggerSkin.ScanWindows()
end)
```

这样既覆盖 GW2_UI_PLUS 先加载、MailLogger 后初始化，也覆盖 MailLogger 已经初始化后再补跑皮肤。

- [ ] **Step 3：加入 TOC**

在 `skins/Core.lua` 之后、`skins/NovaWorldBuffs.lua` 之前加入：

```text
skins/MailLogger.lua
```

- [ ] **Step 4：运行全部自动验证**

Run:

```bash
cd "/Applications/World of Warcraft/_classic_era_/Interface/AddOns/GW2_UI_PLUS"
lua tests/SkinControls_test.lua
lua tests/MailLoggerSkin_test.lua
find . -name '*.lua' -print0 | xargs -0 -n 1 luac -p
git diff --check
```

Expected: 两个测试输出 `OK`；所有 Lua 文件语法检查通过；`git diff --check` 无输出。

- [ ] **Step 5：确认 MailLogger 原目录未改变**

Run:

```bash
cd "/Applications/World of Warcraft/_classic_era_/Interface/AddOns"
find MailLogger -type f -print0 | sort -z | xargs -0 shasum -a 256
```

Expected: 与设计阶段记录的 15 个文件 SHA-256 完全一致；特别是 `GUI.lua` 为 `b8f9dbb1c61ef3346c10c8ef1a2b34da2ba8c3745f0f6d203200442a53370972`，`Config.lua` 为 `aeb84aeed1f709cb1b27c72ff0750138dd33aaea3cf6a325085574b850e4f3cc`，`Calendar.lua` 为 `b34a0e386e8ba7a93bef9fac65aa1a810f2d7d8fe6eed6ebbc6fe6f05dc702d2`。

- [ ] **Step 6：检查任务范围**

Run:

```bash
git status --short -- \
  Interface/AddOns/GW2_UI_PLUS \
  docs/superpowers/plans/2026-07-28-maillogger-skin.md
git diff --name-only HEAD -- \
  Interface/AddOns/GW2_UI_PLUS \
  docs/superpowers/plans/2026-07-28-maillogger-skin.md
```

Expected: 本任务只新增或修改计划列出的文件；仓库中其他既有改动不进入本任务提交。

- [ ] **Step 7：提交加载接入**

```bash
git add Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc \
  Interface/AddOns/GW2_UI_PLUS/skins/MailLogger.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/SkinControls_test.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/MailLoggerSkin_test.lua
git commit -m "功能：接入 MailLogger GW2 皮肤"
```
