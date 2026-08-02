# 玩家综合多栏排版 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将“框体 > 玩家 > 综合”的五个常用显示选项排成三栏加两栏，并复用动作条现有多栏渲染器。

**Architecture:** 保留 GW2_UI 原生玩家选项对象、控件、设置键和回调，只为目标选项添加 `gwPlusColumns` 布局元数据。使用 `ActionBarOptionsUtils.InitializePanel` 重建玩家综合页面的滚动视图，并补齐该工具对已有原生控件的刷新登记。

**Tech Stack:** Lua 5.1、GW2_UI 设置面板 API、GW2_UI_PLUS `ActionBarOptionsUtils`、Lua 运行时回归测试、POSIX shell 回归脚本。

---

## 文件结构

- 修改 `Modules/ActionBar/Options_Utils.lua`：让多栏渲染器复用原生 `option.__widget` 时，也将控件登记到 `panel.gwPlusWidgets`。
- 修改 `Modules/UnitFrames/PlayerResources.lua`：为玩家综合页面设置 `3 + 2` 列元数据，并改用动作条多栏初始化器。
- 创建 `tests/actionbar_options_utils_reuse_regression.lua`：验证原生控件复用和刷新登记。
- 修改 `tests/player_resource_panels_regression.lua`：验证目标选项顺序、列数及玩家页初始化入口。
- 修改 `tests/frame_settings_regression.sh`：增加布局实现的静态回归断言。

### Task 1: 原生控件复用登记

**Files:**
- Create: `tests/actionbar_options_utils_reuse_regression.lua`
- Modify: `Modules/ActionBar/Options_Utils.lua:124-163`

- [ ] **Step 1: 编写失败的原生控件复用测试**

创建测试并直接调用公开的 `CreateOptionWidget`：

```lua
local addonTable = {PlusActionBar = {}}
_G.GW2_ADDON = {GetSettingsTabFrame = true}

assert(loadfile("Modules/ActionBar/Options_Utils.lua"))(
    "GW2_UI_PLUS", addonTable)

local widget = {}
local option = {__widget = widget}
local panel = {}
local actual = addonTable.ActionBarOptionsUtils.CreateOptionWidget(
    panel, option)

assert(actual == widget, "未复用原生控件")
assert(option.__gwPlusWidget == widget, "未记录 Plus 控件引用")
assert(panel.gwPlusWidgets and panel.gwPlusWidgets[1] == widget,
    "原生控件未登记到面板刷新列表")
assert(#panel.gwPlusWidgets == 1, "原生控件被重复登记")

addonTable.ActionBarOptionsUtils.CreateOptionWidget(panel, option)
assert(#panel.gwPlusWidgets == 1, "重复初始化导致控件重复登记")

print("动作条原生控件复用回归检查通过")
```

- [ ] **Step 2: 运行测试并确认失败**

Run: `lua tests/actionbar_options_utils_reuse_regression.lua`

Expected: FAIL，错误为“原生控件未登记到面板刷新列表”。

- [ ] **Step 3: 最小实现唯一登记函数**

在 `CreateOptionWidget` 前添加统一登记函数，并让已有控件和新控件共用：

```lua
local function RegisterPanelWidget(panel, widget)
    panel.gwPlusWidgets = panel.gwPlusWidgets or {}
    for _, registered in ipairs(panel.gwPlusWidgets) do
        if registered == widget then return end
    end
    panel.gwPlusWidgets[#panel.gwPlusWidgets + 1] = widget
end

function Utils.CreateOptionWidget(panel, option)
    if option.__widget then
        option.__gwPlusWidget = option.__widget
        RegisterPanelWidget(panel, option.__widget)
        return option.__widget
    end
end
```

保留该函数现有的控件创建和初始化主体，并将函数末尾：

```lua
option.__gwPlusWidget = widget
panel.gwPlusWidgets = panel.gwPlusWidgets or {}
panel.gwPlusWidgets[#panel.gwPlusWidgets + 1] = widget
return widget
```

替换为：

```lua
option.__gwPlusWidget = widget
RegisterPanelWidget(panel, widget)
return widget
```

- [ ] **Step 4: 运行聚焦测试**

Run: `lua tests/actionbar_options_utils_reuse_regression.lua`

Expected: 输出“动作条原生控件复用回归检查通过”，退出状态为 0。

- [ ] **Step 5: 提交共享工具改动**

```bash
git add Modules/ActionBar/Options_Utils.lua tests/actionbar_options_utils_reuse_regression.lua
git diff --cached --check
git commit -m "fix: 登记多栏布局复用的原生控件"
```

### Task 2: 玩家综合三栏加两栏布局

**Files:**
- Modify: `tests/player_resource_panels_regression.lua:1-150`
- Modify: `tests/frame_settings_regression.sh:55-70`
- Modify: `Modules/UnitFrames/PlayerResources.lua:15-215,270-310`

- [ ] **Step 1: 扩充玩家综合测试数据**

为两个下拉项增加辅助函数：

```lua
local function DropdownOption(optionName, dependence)
    local option = ValueOption(optionName, dependence)
    option.optionType = "dropdown"
    return option
end
```

在 `playerGeneral.gwOptions` 的迁移选项之后、`PLAYER_WIDTH` 之前加入五个真实设置键：

```lua
ValueOption("PLAYER_AS_TARGET_FRAME_ALT_BACKGROUND"),
ValueOption("player_CLASS_COLOR"),
ValueOption("PLAYER_SHOW_PVP_INDICATOR"),
DropdownOption("PLAYER_UNIT_HEALTH"),
DropdownOption("playerFrameHealthBarTexture"),
ValueOption("PLAYER_WIDTH"),
```

- [ ] **Step 2: 编写失败的布局断言**

将 `ActionBarOptionsUtils.InitializePanel` 改为记录接收的面板，并在 `PreparePlayerResourcePanel` 后加入：

```lua
local initializedPanels = {}

addonTable.ActionBarOptionsUtils = {
    InitializePanel = function(panel)
        initializedPanels[#initializedPanels + 1] = panel
    end,
    RefreshPanel = function(panel)
        refreshCounts[panel.panelId] = (refreshCounts[panel.panelId] or 0) + 1
    end,
}

assert(initializedPanels[1] == playerGeneral,
    "玩家综合未使用动作条多栏初始化器")

local expectedGeneralColumns = {
    GW2PlusNormalPlayerFrameEnabled = false,
    PLAYER_AS_TARGET_FRAME_ALT_BACKGROUND = 3,
    player_CLASS_COLOR = 3,
    PLAYER_SHOW_PVP_INDICATOR = 3,
    PLAYER_UNIT_HEALTH = 2,
    playerFrameHealthBarTexture = 2,
    PLAYER_WIDTH = false,
}
for _, option in ipairs(playerGeneral.gwOptions) do
    local key = option.optionName or option.name
    local expectedColumn = expectedGeneralColumns[key]
    assert(expectedColumn ~= nil, "玩家综合存在未预期选项: " .. key)
    assert((option.gwPlusColumns or false) == expectedColumn,
        key .. " 列数错误")
end
```

新建主开关时设置 `normalPlayerFrame.optionName = "GW2PlusNormalPlayerFrameEnabled"`，让测试和设置注册使用稳定键名。

- [ ] **Step 3: 增加静态失败断言**

在 `tests/frame_settings_regression.sh` 中加入：

```sh
grep -F 'PLAYER_AS_TARGET_FRAME_ALT_BACKGROUND = 3,' "$resources_file" >/dev/null
grep -F 'player_CLASS_COLOR = 3,' "$resources_file" >/dev/null
grep -F 'PLAYER_SHOW_PVP_INDICATOR = 3,' "$resources_file" >/dev/null
grep -F 'PLAYER_UNIT_HEALTH = 2,' "$resources_file" >/dev/null
grep -F 'playerFrameHealthBarTexture = 2,' "$resources_file" >/dev/null
grep -F 'Utils.InitializePanel(playerGeneral)' "$resources_file" >/dev/null
```

- [ ] **Step 4: 运行测试并确认失败**

Run: `lua tests/player_resource_panels_regression.lua`

Expected: FAIL，错误为“玩家综合未使用动作条多栏初始化器”或目标选项列数错误。

Run: `sh tests/frame_settings_regression.sh`

Expected: FAIL，因为五个列映射和初始化器调用尚未实现。

- [ ] **Step 5: 添加目标选项列映射**

在 `MOVED_GENERAL_OPTION_NAMES` 后加入：

```lua
local GENERAL_OPTION_COLUMNS = {
    PLAYER_AS_TARGET_FRAME_ALT_BACKGROUND = 3,
    player_CLASS_COLOR = 3,
    PLAYER_SHOW_PVP_INDICATOR = 3,
    PLAYER_UNIT_HEALTH = 2,
    playerFrameHealthBarTexture = 2,
}
```

新建主开关后设置稳定名称，并在重建 `gwOptions` 时只给目标选项设置列数：

```lua
normalPlayerFrame.optionName = "GW2PlusNormalPlayerFrameEnabled"
playerGeneral.gwOptions = {normalPlayerFrame}
for _, option in ipairs(kept) do
    option.gwPlusColumns = GENERAL_OPTION_COLUMNS[option.optionName]
    playerGeneral.gwOptions[#playerGeneral.gwOptions + 1] = option
end
Utils.InitializePanel(playerGeneral)
```

- [ ] **Step 6: 删除被替代的旧两栏打包器**

从 `Modules/UnitFrames/PlayerResources.lua` 删除仅供玩家综合旧布局使用的 `FORCE_NEW_LINE_TYPES`、`ResolveForceNewLine`、`IsMasterToggle`、`PackOptionsIntoRows` 和 `BuildOptionsDataProvider`。保留资源子页面的 `InitializeResourcePanel`，它已经调用同一个 `Utils.InitializePanel`。

- [ ] **Step 7: 运行聚焦测试**

Run: `lua tests/player_resource_panels_regression.lua`

Expected: 输出“玩家资源面板行为回归检查通过”，退出状态为 0。

Run: `sh tests/frame_settings_regression.sh`

Expected: 输出“框体设置回归检查通过”，退出状态为 0。

- [ ] **Step 8: 只提交本任务对应补丁**

`Modules/UnitFrames/PlayerResources.lua` 和 `tests/player_resource_panels_regression.lua` 已包含用户未提交改动，不能整文件暂存。使用交互式分块暂存并检查缓存区：

```bash
git add -p -- Modules/UnitFrames/PlayerResources.lua tests/player_resource_panels_regression.lua
git add tests/frame_settings_regression.sh
git diff --cached --check
git diff --cached -- Modules/UnitFrames/PlayerResources.lua tests/player_resource_panels_regression.lua tests/frame_settings_regression.sh
git commit -m "feat: 重排玩家综合显示选项"
```

缓存区必须只包含 `GENERAL_OPTION_COLUMNS`、玩家综合初始化器切换、旧打包器移除、布局测试数据和断言；不得包含能量条尺寸或编辑模式尺寸改动。

### Task 3: 完整验证

**Files:**
- Verify: `Modules/ActionBar/Options_Utils.lua`
- Verify: `Modules/UnitFrames/PlayerResources.lua`
- Verify: `tests/actionbar_options_utils_reuse_regression.lua`
- Verify: `tests/player_resource_panels_regression.lua`
- Verify: `tests/frame_settings_regression.sh`

- [ ] **Step 1: 运行相关设置布局回归测试**

```bash
lua tests/actionbar_options_utils_reuse_regression.lua
lua tests/player_resource_panels_regression.lua
sh tests/frame_settings_regression.sh
sh tests/toolbar_layout_regression.sh
sh tests/panel_title_regression.sh
```

Expected: 五个命令均退出 0，分别输出对应的通过信息，无 Lua 错误。

- [ ] **Step 2: 执行语法与补丁检查**

```bash
luac -p Modules/ActionBar/Options_Utils.lua
luac -p Modules/UnitFrames/PlayerResources.lua
git diff --check
git status --short
```

Expected: 两个 Lua 文件语法检查退出 0；`git diff --check` 无输出；状态中原有用户改动仍然存在且未被回退。

- [ ] **Step 3: 游戏内验证**

启动经典怀旧服并执行 `/reload`，打开“Plus > 框体 > 玩家 > 综合”，确认：

```text
启用                                           独占一行
显示另一种背景材质 | 显示职业颜色 | PvP指示器   三栏
显示生命值数值     | 生命条材质                  两栏
```

依次切换三个开关和两个下拉框，确认控件立即刷新、禁用状态正确、无 BugGrabber 报错；开启 `/console taintLog 1` 后进入和离开战斗，确认没有新增污染记录。
