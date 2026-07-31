# GW2_UI_PLUS 主菜单框体实施计划

> 本文档随 GW2 UI Plus 插件保存。

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 在不修改 GW2_UI 原生文件的前提下，新增“主菜单”顶级设置标签，复用玩家、目标、宠物、小队原生页面，并按指定纹理替换三个标签图标。

**Architecture:** `MainMenu/MainMenu.lua` 通过设置菜单数据源按 `panelId` 找到四个原生页面，在主菜单打开时临时迁移当前页面，离开时完整恢复父级、锚点和显示状态。`MainMenu/SettingsIcon.lua` 独立定位原配置标签按钮并替换图标；Action Bar 只修改自己的注册图标。`core.lua` 负责按顺序调用三个入口。

**Tech Stack:** World of Warcraft Classic Era Lua 5.1 API、GW2_UI 设置窗口模板、Lua 5.5 本地回归测试。

---

## 文件结构

- 新建 `Interface/AddOns/GW2_UI_PLUS/Modules/MainMenu/MainMenu.lua`：查找原生页面、保存/恢复页面状态、构建主菜单标签。
- 新建 `Interface/AddOns/GW2_UI_PLUS/Modules/MainMenu/SettingsIcon.lua`：只替换原“设置/配置”标签按钮图标。
- 新建 `Interface/AddOns/GW2_UI_PLUS/tests/MainMenu_test.lua`：验证页面定位、迁移、恢复、菜单选择及注册。
- 新建 `Interface/AddOns/GW2_UI_PLUS/tests/SettingsIcons_test.lua`：验证三个标签图标及文件边界。
- 修改 `Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc`：在 `core.lua` 前加载两个主菜单模块。
- 修改 `Interface/AddOns/GW2_UI_PLUS/core.lua`：构建 Action Bar 后构建主菜单并应用配置图标。
- 修改 `Interface/AddOns/GW2_UI_PLUS/Modules/ActionBar/Options.lua`：仅替换 Action Bar 标签纹理。

### 任务 1：先锁定标签图标与模块加载边界

**文件：**
- 新建：`Interface/AddOns/GW2_UI_PLUS/tests/SettingsIcons_test.lua`
- 修改：`Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc`
- 新建：`Interface/AddOns/GW2_UI_PLUS/Modules/MainMenu/SettingsIcon.lua`
- 修改：`Interface/AddOns/GW2_UI_PLUS/Modules/ActionBar/Options.lua:1282`
- 修改：`Interface/AddOns/GW2_UI_PLUS/core.lua:218-224`

- [ ] **步骤 1：编写失败测试**

```lua
local function Read(path)
    local file = assert(io.open(path, "r"))
    local source = file:read("*a")
    file:close()
    return source
end

local toc = Read("GW2_UI_PLUS.toc")
local icons = Read("MainMenu/SettingsIcon.lua")
local actionBar = Read("ActionBar/Options.lua")
local core = Read("core.lua")

assert(toc:find("MainMenu/SettingsIcon.lua", 1, true),
    "TOC 应加载独立的配置标签图标模块")
assert(actionBar:find(
    "Interface/AddOns/GW2_UI/textures/character/tabicon-glyph.png",
    1, true), "动作条应使用 tabicon-glyph")
assert(icons:find(
    "Interface/AddOns/GW2_UI/textures/Auction/tabicon_sell.png",
    1, true), "原设置/配置标签应使用 tabicon_sell")
assert(core:find("ApplySettingsTabIcon", 1, true),
    "核心应调用独立图标模块")
assert(not icons:find("BuildMainMenuTab", 1, true),
    "配置标签图标模块不应负责主菜单框体")

print("SettingsIcons_test: OK")
```

- [ ] **步骤 2：运行测试并确认失败**

运行：`lua tests/SettingsIcons_test.lua`

预期：因 `MainMenu/SettingsIcon.lua` 不存在而失败。

- [ ] **步骤 3：实现最小图标模块**

在 `MainMenu/SettingsIcon.lua` 写入：

```lua
local _, addonTable = ...

local SETTINGS_ICON =
    "Interface/AddOns/GW2_UI/textures/Auction/tabicon_sell.png"

local function ApplySettingsTabIcon(settingsWindow)
    if not settingsWindow or not settingsWindow.tabButtons then return false end
    for _, button in ipairs(settingsWindow.tabButtons) do
        if button.panelName == "GwSettingsSettings" and button.icon then
            button.icon:SetTexture(SETTINGS_ICON)
            return true
        end
    end
    return false
end

addonTable.ApplySettingsTabIcon = ApplySettingsTabIcon
```

在 `GW2_UI_PLUS.toc` 的 Action Bar 模块之后、`core.lua` 之前加入：

```text
MainMenu/SettingsIcon.lua
```

把 `ActionBar/Options.lua` 的标签注册改为：

```lua
settingsWindow:AddTab(
    "Interface/AddOns/GW2_UI/textures/character/tabicon-glyph.png", tab)
```

在 `core.lua` 的 Action Bar 构建调用后加入：

```lua
if addonTable.ApplySettingsTabIcon then
    addonTable.ApplySettingsTabIcon(_G.GwSettingsWindow)
end
```

- [ ] **步骤 4：运行图标测试**

运行：`lua tests/SettingsIcons_test.lua`

预期：输出 `SettingsIcons_test: OK`。

- [ ] **步骤 5：提交图标改动**

```bash
git add Interface/AddOns/GW2_UI_PLUS/Modules/MainMenu/SettingsIcon.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/SettingsIcons_test.lua \
  Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc \
  Interface/AddOns/GW2_UI_PLUS/Modules/ActionBar/Options.lua \
  Interface/AddOns/GW2_UI_PLUS/core.lua
git commit -m "功能：调整设置标签图标"
```

### 任务 2：测试原生页面定位、迁移与恢复

**文件：**
- 新建：`Interface/AddOns/GW2_UI_PLUS/tests/MainMenu_test.lua`
- 新建：`Interface/AddOns/GW2_UI_PLUS/Modules/MainMenu/MainMenu.lua`
- 修改：`Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc`

- [ ] **步骤 1：编写失败测试的框体与数据源替身**

在 `tests/MainMenu_test.lua` 写入可记录父级、锚点、显示状态与脚本的最小框体替身：

```lua
local function NewFrame(parent)
    local frame = {parent = parent, shown = false, points = {}}
    function frame:GetParent() return self.parent end
    function frame:SetParent(value) self.parent = value end
    function frame:IsShown() return self.shown end
    function frame:SetShown(value) self.shown = value end
    function frame:Show()
        self.shown = true
        if self.scripts and self.scripts.OnShow then self.scripts.OnShow(self) end
    end
    function frame:Hide()
        self.shown = false
        if self.scripts and self.scripts.OnHide then self.scripts.OnHide(self) end
    end
    function frame:GetNumPoints() return #self.points end
    function frame:GetPoint(index) return table.unpack(self.points[index]) end
    function frame:ClearAllPoints() self.points = {} end
    function frame:SetPoint(...) self.points[#self.points + 1] = {...} end
    function frame:SetSize(width, height)
        self.width, self.height = width, height
    end
    function frame:SetScript(name, callback)
        self.scripts = self.scripts or {}
        self.scripts[name] = callback
    end
    return frame
end

unpack = table.unpack

local nativeParent = NewFrame()
local pages = {}
for _, panelId in ipairs({
    "player_general", "target_general", "player_pet", "party_general",
}) do
    local page = NewFrame(nativeParent)
    page.panelId = panelId
    page:SetPoint("TOPLEFT", nativeParent, "TOPLEFT", 0, 0)
    pages[panelId] = page
end
pages.player_general.shown = true

local provider = {}
function provider:ForEach(callback)
    for _, page in pairs(pages) do
        callback({isSubCat = true, itemData = {frame = page}})
    end
end

local settingsTab = NewFrame()
settingsTab.menu = {
    ScrollBox = {GetDataProvider = function() return provider end},
}
```

- [ ] **步骤 2：补齐构建所需替身并声明行为断言**

继续写入：

```lua
local createdButtons = {}
function CreateFrame(kind, _, parent)
    local frame = NewFrame(parent)
    if kind == "Button" then
        frame.text = {SetPoint = function() end, SetText = function(self, v) self.value = v end}
        frame.arrow = {Hide = function() end}
        frame.hover = {SetTexture = function() end}
        frame.activeTexture = {SetShown = function(self, v) self.shown = v end}
        createdButtons[#createdButtons + 1] = frame
    else
        frame.menu = {
            search = {Hide = function() end},
            ScrollBox = {Hide = function() end},
            ScrollBar = {Hide = function() end},
        }
    end
    return frame
end

local settingsWindow = NewFrame()
settingsWindow.tabs, settingsWindow.tabButtons = {}, {}
function settingsWindow:AddTab(icon, panel)
    self.addedIcon, self.addedPanel = icon, panel
end

GW2_ADDON = {}
local addonTable = {}
assert(loadfile("MainMenu/MainMenu.lua"))("GW2_UI_PLUS", addonTable)
addonTable.BuildMainMenuTab(settingsTab, settingsWindow)

assert(settingsWindow.addedIcon ==
    "Interface/AddOns/GW2_UI/textures/uistuff/tabicon_profiles.png",
    "主菜单应使用 tabicon_profiles")
assert(#createdButtons == 4, "主菜单应创建四个左侧按钮")
assert(pages.player_general:GetParent() == nativeParent,
    "插件加载时不应提前迁移玩家页")

settingsWindow.addedPanel:Show()
assert(pages.player_general:GetParent() == settingsWindow.addedPanel
    and pages.player_general:IsShown(), "默认应迁移并显示玩家页")
assert(pages.target_general:GetParent() == nativeParent,
    "未选择页面应留在原父级")

createdButtons[2].scripts.OnClick()
assert(pages.player_general:GetParent() == nativeParent
    and pages.player_general:IsShown(), "切页时应恢复玩家页原状态")
assert(pages.target_general:GetParent() == settingsWindow.addedPanel
    and pages.target_general:IsShown(), "点击目标应迁移并显示目标页")

settingsWindow.addedPanel.callbackOnClose()
assert(pages.target_general:GetParent() == nativeParent
    and not pages.target_general:IsShown(), "离开标签应恢复目标页原状态")
assert(pages.target_general:GetNumPoints() == 1
    and select(2, pages.target_general:GetPoint(1)) == nativeParent,
    "离开标签应恢复原锚点")

print("MainMenu_test: OK")
```

- [ ] **步骤 3：运行测试并确认失败**

运行：`lua tests/MainMenu_test.lua`

预期：因 `MainMenu/MainMenu.lua` 不存在或未提供 `BuildMainMenuTab` 而失败。

- [ ] **步骤 4：实现页面查找和状态保存/恢复**

在 `MainMenu/MainMenu.lua` 定义以下接口：

```lua
local _, addonTable = ...

local MAIN_MENU_ICON =
    "Interface/AddOns/GW2_UI/textures/uistuff/tabicon_profiles.png"

local PAGE_DEFINITIONS = {
    {"玩家", "player_general"},
    {"目标", "target_general"},
    {"宠物", "player_pet"},
    {"小队", "party_general"},
}

local function FindNativePages(settingsTab)
    local found = {}
    local scrollBox = settingsTab and settingsTab.menu
        and settingsTab.menu.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not provider then return end
    provider:ForEach(function(data)
        local frame = data.isSubCat and data.itemData and data.itemData.frame
        if frame and frame.panelId then found[frame.panelId] = frame end
    end)
    for _, definition in ipairs(PAGE_DEFINITIONS) do
        if not found[definition[2]] then return end
    end
    return found
end

local function CaptureFrame(frame)
    local state = {
        parent = frame:GetParent(),
        shown = frame:IsShown(),
        points = {},
    }
    for index = 1, frame:GetNumPoints() do
        state.points[index] = {frame:GetPoint(index)}
    end
    return state
end

local function RestoreFrame(frame, state)
    frame:Hide()
    frame:SetParent(state.parent)
    frame:ClearAllPoints()
    for _, point in ipairs(state.points) do frame:SetPoint(unpack(point)) end
    frame:SetShown(state.shown)
end
```

- [ ] **步骤 5：实现主菜单标签和四页切换**

继续在同一文件实现：

```lua
local function BuildMainMenuTab(settingsTab, settingsWindow)
    if not settingsWindow or settingsWindow.gwPlusMainMenuTab then return end
    local pages = FindNativePages(settingsTab)
    if not pages then
        if DEFAULT_CHAT_FRAME then
            DEFAULT_CHAT_FRAME:AddMessage(
                "GW2_UI_PLUS: 主菜单未找到完整的原生设置页面。")
        end
        return
    end

    local tab = CreateFrame(
        "Frame", nil, settingsWindow, "GwSettingsSettingsTabTemplate")
    tab.name = "GwSettingsMainMenu"
    tab.headerBreadcrumbText = "主菜单"
    tab.menu.search:Hide()
    tab.menu.ScrollBox:Hide()
    tab.menu.ScrollBar:Hide()

    local buttons, currentFrame, currentState = {}
    local selectedIndex = 1
    local function RestoreCurrent()
        if currentFrame and currentState then
            RestoreFrame(currentFrame, currentState)
        end
        currentFrame, currentState = nil, nil
    end
    local function SelectPage(index)
        RestoreCurrent()
        selectedIndex = index
        local frame = pages[PAGE_DEFINITIONS[index][2]]
        currentFrame, currentState = frame, CaptureFrame(frame)
        frame:Hide()
        frame:SetParent(tab)
        frame:ClearAllPoints()
        frame:SetPoint("TOPLEFT", tab, "TOPLEFT", 0, 0)
        frame:SetPoint("BOTTOMRIGHT", tab, "BOTTOMRIGHT", 0, 0)
        frame:Show()
        for buttonIndex, button in ipairs(buttons) do
            button.activeTexture:SetShown(buttonIndex == index)
        end
    end

    for index, definition in ipairs(PAGE_DEFINITIONS) do
        local button = CreateFrame(
            "Button", nil, tab.menu, "GwSettingsSettingsTabMenuButtonTemplate")
        button:SetSize(221, 36)
        button:SetPoint("TOPLEFT", tab.menu, "TOPLEFT",
            0, -8 - ((index - 1) * 36))
        button.arrow:Hide()
        button.text:SetPoint("LEFT", button, "LEFT", 20, 0)
        button.text:SetText(definition[1])
        button.hover:SetTexture(
            "Interface/AddOns/GW2_UI/textures/character/menu-hover.png")
        local pageIndex = index
        button:SetScript("OnClick", function() SelectPage(pageIndex) end)
        buttons[index] = button
    end

    tab:SetScript("OnShow", function() SelectPage(selectedIndex) end)
    tab.callbackOnClose = RestoreCurrent
    settingsWindow:AddTab(MAIN_MENU_ICON, tab)
    table.insert(settingsWindow.tabs, tab)
    settingsWindow.gwPlusMainMenuTab = tab
    tab:Hide()
end

addonTable.BuildMainMenuTab = BuildMainMenuTab
```

- [ ] **步骤 6：把主菜单模块加入 TOC**

在 `GW2_UI_PLUS.toc` 的 `MainMenu/SettingsIcon.lua` 之前加入：

```text
MainMenu/MainMenu.lua
```

- [ ] **步骤 7：运行主菜单单元测试**

运行：`lua tests/MainMenu_test.lua`

预期：输出 `MainMenu_test: OK`。

- [ ] **步骤 8：提交主菜单核心**

```bash
git add Interface/AddOns/GW2_UI_PLUS/Modules/MainMenu/MainMenu.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/MainMenu_test.lua \
  Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc
git commit -m "功能：新增主菜单设置框体"
```

### 任务 3：接入核心并验证无原生文件改动

**文件：**
- 修改：`Interface/AddOns/GW2_UI_PLUS/core.lua:218-228`
- 修改：`Interface/AddOns/GW2_UI_PLUS/tests/SettingsStructure_test.lua`

- [ ] **步骤 1：扩展结构测试**

在 `tests/SettingsStructure_test.lua` 读取 `MainMenu/MainMenu.lua` 与 `GW2_UI_PLUS.toc`，增加：

```lua
local mainMenu = Read("MainMenu/MainMenu.lua")
local toc = Read("GW2_UI_PLUS.toc")

for _, panelId in ipairs({
    "player_general", "target_general", "player_pet", "party_general",
}) do
    assert(mainMenu:find(panelId, 1, true),
        "主菜单缺少原生页面：" .. panelId)
end
assert(mainMenu:find("BuildMainMenuTab", 1, true),
    "主菜单应暴露顶级标签构建入口")
assert(core:find("BuildMainMenuTab", 1, true),
    "核心应注册主菜单顶级标签")
assert(toc:find("MainMenu/MainMenu.lua", 1, true),
    "TOC 应加载主菜单模块")
```

- [ ] **步骤 2：运行测试并确认失败**

运行：`lua tests/SettingsStructure_test.lua`

预期：核心尚未调用 `BuildMainMenuTab`，断言失败。

- [ ] **步骤 3：在核心注册主菜单**

在 `core.lua` 的 Action Bar 注册后、配置图标应用前加入：

```lua
if addonTable.BuildMainMenuTab then
    addonTable.BuildMainMenuTab(settingsTab, _G.GwSettingsWindow)
end
```

- [ ] **步骤 4：运行相关测试**

运行：

```bash
lua tests/MainMenu_test.lua
lua tests/SettingsIcons_test.lua
lua tests/SettingsStructure_test.lua
```

预期：三个测试均输出 `OK`。

- [ ] **步骤 5：检查修改范围**

运行：

```bash
git diff --check
git status --short -- Interface/AddOns/GW2_UI_PLUS
git diff --name-only -- Interface/AddOns/GW2_UI
```

预期：

- `git diff --check` 无输出；
- 改动只包含本计划列出的 GW2_UI_PLUS 文件；
- `git diff --name-only -- Interface/AddOns/GW2_UI` 无输出。

- [ ] **步骤 6：提交接入改动**

```bash
git add Interface/AddOns/GW2_UI_PLUS/core.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/SettingsStructure_test.lua
git commit -m "功能：接入主菜单设置标签"
```

### 任务 4：游戏内验收

**文件：**
- 不修改文件。

- [ ] **步骤 1：重载界面**

在游戏聊天框执行：

```text
/reload
```

预期：无 Lua 错误，GW2_UI 设置窗口可正常打开。

- [ ] **步骤 2：验证三个标签图标**

打开 GW2_UI 设置窗口，确认：

- 原设置/配置标签显示 `tabicon_sell`；
- Action Bar 标签显示 `tabicon-glyph`；
- 主菜单标签显示 `tabicon_profiles`。

- [ ] **步骤 3：验证四个主菜单页面**

进入“主菜单”，依次点击“玩家、目标、宠物、小队”。

预期：左侧选中高亮随点击切换；右侧显示对应原生设置；任意开关与滑块行为和原入口一致。

- [ ] **步骤 4：验证页面恢复**

离开“主菜单”，回到原设置/配置标签，分别打开原“玩家”和“单位框体”入口。

预期：原入口仍存在；玩家、目标、宠物、小队页面均能显示，布局未偏移。

- [ ] **步骤 5：最终自动化回归**

运行：

```bash
for test in tests/*_test.lua; do lua "$test" || exit 1; done
```

预期：全部测试输出 `OK`，命令退出码为 0。
