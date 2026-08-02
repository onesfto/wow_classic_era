# 玩家状态设置拆分 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将玩家“状态条”组合设置拆成血球和贴图、施法条、能量条、资源条、经验槽 5 个独立菜单，并让每个选项独占一行。

**Architecture:** 保留 `PlayerResources.lua` 现有选项来源、设置回调、依赖计算和状态同步，只将单一 `statusPanel` 改为按面板 ID 保存的 5 个面板。`HideNativeSettings.lua` 接收面板表，`Settings.lua` 将面板表合并进页面索引并注册 5 个玩家子菜单。

**Tech Stack:** World of Warcraft Classic Era Lua 5.1、GW2_UI 设置面板模板、POSIX shell 文本回归测试。

---

### Task 1: 添加菜单与布局回归断言

**Files:**
- Modify: `tests/frame_settings_regression.sh`

- [ ] **Step 1: 写入失败测试**

在现有框体设置断言之后加入：

```sh
resources_file="Modules/UnitFrames/PlayerResources.lua"

grep -F '{"血球和贴图", "gw2_plus_player_globe"}' "$settings_file" >/dev/null
grep -F '{"施法条", "gw2_plus_player_castbar"}' "$settings_file" >/dev/null
grep -F '{"能量条", "gw2_plus_player_energy"}' "$settings_file" >/dev/null
grep -F '{"资源条", "gw2_plus_player_resource"}' "$settings_file" >/dev/null
grep -F '{"经验槽", "gw2_plus_player_xp"}' "$settings_file" >/dev/null
if grep -F '{"状态条", "player_classpower"}' "$settings_file" >/dev/null; then
    exit 1
fi
grep -F 'settingsTab.gwPlusPlayerResourcePanels' "$settings_file" >/dev/null
grep -F 'option.forceNewLine = true' "$resources_file" >/dev/null
if grep -F 'AddGroupHeader(panel,' "$resources_file" >/dev/null; then
    exit 1
fi
```

- [ ] **Step 2: 运行测试并确认失败原因**

Run: `sh tests/frame_settings_regression.sh`

Expected: FAIL，因为 `PLAYER_PAGE_DEFINITIONS` 尚未包含 5 个新面板 ID，且仍包含“状态条”。

- [ ] **Step 3: 提交红灯测试**

```bash
git add tests/frame_settings_regression.sh
git commit -m "test: 添加玩家状态面板拆分回归检查"
```

### Task 2: 将组合状态页面拆成 5 个独立面板

**Files:**
- Modify: `Modules/UnitFrames/PlayerResources.lua:37-741`
- Modify: `Modules/Settings/HideNativeSettings.lua:363-371`

- [ ] **Step 1: 将单面板状态改为面板表**

用面板表和统一刷新函数替代 `statusPanel`/`RefreshStatusPanel`：

```lua
local resourcePanels

local function RefreshResourcePanels()
    for _, panel in pairs(resourcePanels or {}) do
        Utils.RefreshPanel(panel)
        ApplyPanelDependencies(panel)
    end
    if addonTable.PlusEnergyTicker then
        addonTable.PlusEnergyTicker.Refresh()
    end
end
```

配置切换回调和需要刷新依赖的选项统一调用 `RefreshResourcePanels()`，不再比较单一 `statusPanel`。

- [ ] **Step 2: 添加独立面板创建与单行布局助手**

```lua
local function CreateResourcePanel(parent, panelId, breadcrumb, sub)
    local panel = CreateFrame(
        "Frame", nil, parent, "GwSettingsPanelTmpl")
    panel.panelId = panelId
    addonTable.SetPanelTitle(panel, "玩家", breadcrumb)
    panel.sub:SetText(sub)
    return panel
end

local function InitializeResourcePanel(panel)
    for _, option in ipairs(panel.gwOptions or {}) do
        option.forceNewLine = true
        option.groupHeaderName = nil
    end
    Utils.InitializePanel(panel)
    panel:HookScript("OnShow", function()
        Utils.RefreshPanel(panel)
        ApplyPanelDependencies(panel)
    end)
    panel:Hide()
end
```

`CreateResourcePanel` 继续设置现有字体和颜色，面包屑分别为“血球和贴图”“施法条”“能量条”“资源条”“经验槽”。不调用 `AddGroupHeader`，因此页面内不显示重复分组标题。

- [ ] **Step 3: 将原有 5 个分组分别填入独立面板**

创建并返回以下表：

```lua
local panels = {
    gw2_plus_player_globe = CreateResourcePanel(
        playerGeneral:GetParent(), "gw2_plus_player_globe",
        "血球和贴图", "调整玩家血球、HUD 贴图和位移条。"),
    gw2_plus_player_castbar = CreateResourcePanel(
        playerGeneral:GetParent(), "gw2_plus_player_castbar",
        "施法条", "调整玩家施法条。"),
    gw2_plus_player_energy = CreateResourcePanel(
        playerGeneral:GetParent(), "gw2_plus_player_energy",
        "能量条", "调整玩家能量条和回复提示。"),
    gw2_plus_player_resource = CreateResourcePanel(
        playerGeneral:GetParent(), "gw2_plus_player_resource",
        "资源条", "调整玩家职业资源条。"),
    gw2_plus_player_xp = CreateResourcePanel(
        playerGeneral:GetParent(), "gw2_plus_player_xp",
        "经验槽", "调整玩家经验槽。"),
}
```

将原 `CreateStatusPanel` 内各组选项原样放入对应面板。保留所有 getter、setter、默认值、callback、optionName 和 dependence；只去掉 `groupHeaderName`，并由 `InitializeResourcePanel` 强制每个选项换行。

- [ ] **Step 4: 返回并保存完整面板表**

```lua
if resourcePanels then return resourcePanels end
-- 收集来源选项并准备综合页面后创建五个面板
resourcePanels = CreateResourcePanels(
    playerGeneral, resourcePanel, castbarPanel, options)
InstallValueHooks()
InstallProfileHook()
SyncAdditionalEnergyBar()
QueueValueRefresh()
RefreshResourcePanels()
return resourcePanels
```

`InstallProfileHook` 以 `resourcePanels` 作为回调 owner，并在配置切换时刷新所有面板。

- [ ] **Step 5: 在原生设置准备阶段保存面板表**

```lua
local panels = addonTable.PreparePlayerResourcePanel(
    embeddedPanels.player_general,
    embeddedPanels.player_classpower,
    embeddedPanels.player_castbar)
if panels then
    settingsTab.gwPlusPlayerResourcePanels = panels
end
```

- [ ] **Step 6: 运行语法检查与红灯测试**

Run: `luac -p Modules/UnitFrames/PlayerResources.lua Modules/Settings/HideNativeSettings.lua`

Expected: PASS，无输出。

Run: `sh tests/frame_settings_regression.sh`

Expected: FAIL，失败点仅剩 `Settings.lua` 尚未注册新菜单。

### Task 3: 注册 5 个玩家子菜单并移除状态条入口

**Files:**
- Modify: `Modules/Settings/Settings.lua:28-34,111-117,1365-1395,1517-1537`
- Modify: `Docs/SETTINGS_ARCHITECTURE.md:58-69`
- Modify: `Docs/modules/MainMenu-MovedSettings.md:8-35`

- [ ] **Step 1: 替换玩家菜单定义**

```lua
local PLAYER_PAGE_DEFINITIONS = {
    {"综合", "player_general"},
    {"血球和贴图", "gw2_plus_player_globe"},
    {"施法条", "gw2_plus_player_castbar"},
    {"能量条", "gw2_plus_player_energy"},
    {"资源条", "gw2_plus_player_resource"},
    {"经验槽", "gw2_plus_player_xp"},
    {"渐隐", "player_fader"},
    {"增益光环", "player_buff_aura"},
    {"减益光环", "player_debuff_aura"},
}
```

删除 `FRAME_PANEL_TEXT.player_classpower`，不再把组合页面映射为玩家菜单页面。

- [ ] **Step 2: 将自定义面板合并到页面索引**

```lua
for panelId, panel in pairs(
    settingsTab.gwPlusPlayerResourcePanels or {}) do
    found[panelId] = panel
end
```

保留原生 `player_classpower` 和 `player_castbar` 在 `REQUIRED_PAGE_IDS` 中，因为它们仍是克隆选项的来源，但不作为可见菜单项。

- [ ] **Step 3: 用菜单定义判断玩家展开状态**

添加：

```lua
local PLAYER_PAGE_IDS = {}
for _, definition in ipairs(PLAYER_PAGE_DEFINITIONS) do
    PLAYER_PAGE_IDS[definition[2]] = true
end
```

然后将 `SelectPage` 中的玩家页面判断替换为：

```lua
playerExpanded = PLAYER_PAGE_IDS[panelId] == true
```

- [ ] **Step 4: 更新菜单结构文档**

将两份设置说明中的“玩家 > 状态条”结构改为 5 个同级页面，明确每个选项独占一行；不修改其他模块说明。

- [ ] **Step 5: 运行专项测试与语法检查**

Run: `sh tests/frame_settings_regression.sh`

Expected: 输出 `框体设置回归检查通过`。

Run: `luac -p Modules/UnitFrames/PlayerResources.lua Modules/Settings/HideNativeSettings.lua Modules/Settings/Settings.lua`

Expected: PASS，无输出。

- [ ] **Step 6: 提交实现**

```bash
git add Modules/UnitFrames/PlayerResources.lua Modules/Settings/HideNativeSettings.lua Modules/Settings/Settings.lua Docs/SETTINGS_ARCHITECTURE.md Docs/modules/MainMenu-MovedSettings.md
git commit -m "feat: 拆分玩家状态设置面板"
```

### Task 4: 完整回归验证

**Files:**
- Test: `tests/*.sh`

- [ ] **Step 1: 运行全部 shell 回归测试**

Run: `for test_file in tests/*.sh; do sh "$test_file"; done`

Expected: 每个脚本均退出 0，包含 `框体设置回归检查通过`，无失败输出。

- [ ] **Step 2: 检查变更范围与空白错误**

Run: `git diff --check HEAD~2..HEAD`

Expected: PASS，无输出。

Run: `git status --short`

Expected: 只显示任务开始前已经存在的用户修改，不出现本任务未提交文件。
