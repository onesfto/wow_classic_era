# GW2_UI_PLUS 玩家状态条面板实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将“玩家 → 资源条”改成支持固定多列行序的“玩家 → 状态条”，拆分能量条与资源条数值开关，并让回复提示同时显示在玩家框体和独立能量条。

**Architecture:** `ActionBar/Options.lua` 暴露现有多列设置布局器；`MainMenu/PlayerResources.lua` 建立独立的 Plus 状态条页面并复用原生选项的 getter、setter 与回调；`MainMenu/EnergyTicker.lua` 镜像原生回复提示到第二个能量条。普通综合页面仍只做原生选项筛选，不修改 GW2_UI 文件。

**Tech Stack:** Lua 5.1、World of Warcraft Frame API、GW2_UI 设置控件模板、ScrollBox、SavedVariables。

**验证约束：** 用户明确要求不运行游戏测试或自动化测试。本计划只执行 `luac -p`、静态结构检查、空白检查和 GW2_UI 原生目录校验。

---

### Task 1: 导出现有多列设置布局器

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua`

- [ ] **Step 1: 让多列布局支持文本输入控件**

在 `WIDGET_TEMPLATES` 中加入：

```lua
text = {"Button", "GwOptionBoxTextTmpl"},
```

增加紧凑文本布局：

```lua
local function LayoutCompactText(widget, width)
    if not widget.inputFrame then return end

    local edge, titleWidth, gap = 5, 76, 6
    local inputWidth = math.max(width - (edge * 2) - titleWidth - gap, 70)

    widget.title:ClearAllPoints()
    widget.title:SetPoint("LEFT", widget, "LEFT", edge, 0)
    widget.title:SetWidth(titleWidth)
    widget.title:SetJustifyH("LEFT")

    widget.inputFrame:ClearAllPoints()
    widget.inputFrame:SetPoint(
        "LEFT", widget, "LEFT", edge + titleWidth + gap, 0)
    widget.inputFrame:SetSize(inputWidth, 20)
end
```

在多列行初始化器的滑块、下拉框分支后加入：

```lua
elseif data.widgets and widget.optionType == "text" then
    LayoutCompactText(widget, width)
```

- [ ] **Step 2: 导出 ActionBar 已使用的布局函数**

在 `BuildActionBarTab` 导出之前增加：

```lua
addonTable.PlusSettingsLayout = addonTable.PlusSettingsLayout or {}
addonTable.PlusSettingsLayout.InitializePanel = InitializePanel
addonTable.PlusSettingsLayout.RefreshPanel = RefreshPanel
```

ActionBar 自己继续调用本地 `InitializePanel` 和 `RefreshPanel`，行为不变；状态条页面通过 `addonTable.PlusSettingsLayout` 复用同一实现。

- [ ] **Step 3: 做局部语法检查**

Run:

```bash
luac -p Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua
```

Expected: exit code `0`，无输出。

---

### Task 2: 增加第二处能量/法力回复提示

**Files:**
- Create: `Interface/AddOns/GW2_UI_PLUS/MainMenu/EnergyTicker.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc`

- [ ] **Step 1: 注册独立状态条 SavedVariables 与模块顺序**

把 TOC 的 SavedVariables 改为包含：

```text
GW2_UI_PLUS_PlayerStatusSV
```

并在 `ActionBar/Options.lua` 后、`MainMenu/PlayerResources.lua` 前加入：

```text
MainMenu/EnergyTicker.lua
```

- [ ] **Step 2: 创建只负责显示同步的镜像提示条**

`EnergyTicker.lua` 暴露：

```lua
local _, addonTable = ...
local GW = _G.GW2_ADDON
local Ticker = {}
addonTable.PlusEnergyTicker = Ticker

function Ticker.Refresh()
end
```

模块为 `Gw2ManaTicker` 和德鲁伊的 `Gw2EnergyTicker` 各准备一个镜像框体。镜像使用与原生一致的：

```lua
"Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar-bg.png"
"Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar.png"
```

镜像每 `0.05` 秒从原生提示条复制：

```lua
local minimum, maximum = source.statusBar:GetMinMaxValues()
mirror.statusBar:SetMinMaxValues(minimum, maximum)
mirror.statusBar:SetValue(source.statusBar:GetValue())
mirror.statusBar:SetStatusBarColor(source.statusBar:GetStatusBarColor())
mirror.statusBar.label:SetText(source.statusBar.label:GetText() or "")
```

如果原生提示条挂在 `GwPlayerUnitFrame`，镜像锚到 `GwPlayerPowerBar`；如果原生提示条挂在独立能量条，镜像锚到 `GwPlayerUnitFrame.powerbar`。只有以下条件同时成立才显示镜像：

```lua
GW.settings.POWERBAR_ENABLED
GW.settings.PLAYER_ENERGY_MANA_TICK
_G.GwPlayerPowerBar
_G.GwPlayerUnitFrame
```

镜像的显示状态跟随原生提示条，因此“仅在战斗中显示”和德鲁伊形态切换在两处保持一致。

- [ ] **Step 3: 提供刷新入口**

`Ticker.Refresh()` 完成三件事：

```lua
-- 1. 找到原生 Gw2ManaTicker / Gw2EnergyTicker
-- 2. 为当前缺少提示条的能量条选择镜像锚点
-- 3. 按 POWERBAR_ENABLED、PLAYER_ENERGY_MANA_TICK 和框体可见性更新显示
```

模块设置幂等标记，重复刷新不重复创建镜像或 OnUpdate。

- [ ] **Step 4: 做局部语法检查**

Run:

```bash
luac -p Interface/AddOns/GW2_UI_PLUS/MainMenu/EnergyTicker.lua
```

Expected: exit code `0`，无输出。

---

### Task 3: 建立独立的玩家状态条页面

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/MainMenu/PlayerResources.lua`

- [ ] **Step 1: 初始化两个独立数值设置**

增加：

```lua
local STATUS_DEFAULTS = {
    energyBarShowValue = true,
    resourceBarShowValue = true,
}

local function InitStatusDB()
    GW2_UI_PLUS_PlayerStatusSV = GW2_UI_PLUS_PlayerStatusSV or {}
    for key, value in pairs(STATUS_DEFAULTS) do
        if GW2_UI_PLUS_PlayerStatusSV[key] == nil then
            GW2_UI_PLUS_PlayerStatusSV[key] = value
        end
    end
    return GW2_UI_PLUS_PlayerStatusSV
end
```

- [ ] **Step 2: 保留综合页面筛选并解除球状血条依赖**

继续从 `player_general` 移出：

```lua
HEALTHGLOBE_ENABLED
POWERBAR_ENABLED
PLAYER_AS_TARGET_FRAME
showDodgebar
PLAYER_TRACKED_DODGEBAR_SPELL
```

对所有保留在综合页面的选项执行：

```lua
RemoveOptionDependency(option, "PLAYER_AS_TARGET_FRAME")
```

综合页面顶部的 Plus“启用”仍只控制普通玩家框体。

- [ ] **Step 3: 克隆原生设置定义，不修改原生页面对象**

增加：

```lua
local function CloneOption(source, name, groupName, columns)
    local clone = {}
    for key, value in pairs(source) do
        if key ~= "__widget" and key ~= "__gwPlusWidget" then
            clone[key] = value
        end
    end
    clone.name = name or source.name
    clone.groupHeaderName = groupName
    clone.gwPlusColumns = columns
    return clone
end
```

按 `optionName` 从三个原生面板查找设置，克隆对象继续使用原生 `get`、`set`、`getDefault` 和 `callback`。原生 `player_classpower` 和 `player_castbar` 页面不被重排。

- [ ] **Step 4: 创建状态条面板标题**

建立独立 `GwSettingsPanelTmpl`：

```lua
local panel = CreateFrame(
    "Frame", nil, playerGeneral:GetParent(), "GwSettingsPanelTmpl")
panel.panelId = "gw2_plus_player_status"
panel.header:SetText("玩家")
panel.breadcrumb:SetText("状态条")
panel.sub:SetText("调整玩家的血球、施法条、能量条和资源条。")
```

字体、颜色和标题宽度沿用 ActionBar 与原生面板样式。

- [ ] **Step 5: 按固定行序创建球状血条与施法条**

球状血条：

```lua
panel:AddGroupHeader("球状血条")
-- 启用、为血球预留中间空隙：gwPlusColumns = 2
-- 缩放：整行，读写 AB.InitDB().globeScale
-- 显示位移条、位移条技能：gwPlusColumns = 2
```

“启用”读写 `AB.IsGlobeStyleEnabled` / `AB.SetGlobeStyleEnabled`；缩放回调为 `AB.ApplyGlobeScale`。

施法条：

```lua
panel:AddGroupHeader("施法条")
-- CASTINGBAR_ENABLED、CASTINGBAR_DATA：gwPlusColumns = 2
-- PLAYER_CASTBAR_SHOW_SPELL_QUEUEWINDOW、showPlayerCastBarTicks：gwPlusColumns = 2
-- 自定义“缩放”：整行
```

显示名称固定为：

```lua
"启用"
"高级施法条"
"显示法术队列窗口"
"跳数"
"缩放"
```

缩放读写 `GW.settings.castingbar_pos_scale`，调用 `AB.ApplyCastbarScale`。

- [ ] **Step 6: 创建能量条固定三行**

```lua
panel:AddGroupHeader("能量条")
-- POWERBAR_ENABLED、自定义能量数值开关：gwPlusColumns = 2
-- PLAYER_ENERGY_MANA_TICK、PLAYER_5SR_TIMER：gwPlusColumns = 2
-- PLAYER_ENERGY_MANA_TICK_HIDE_OFC：整行
```

显示名称固定为：

```lua
"启用"
"在条上显示数值"
"能量/法力回复提示"
"5秒规则：显示剩余时间"
"仅在战斗中显示能量/法力回复提示"
```

`POWERBAR_ENABLED` 回调后派生：

```lua
GW.settings.PLAYER_AS_TARGET_FRAME_SHOW_RESSOURCEBAR =
    GW.settings.POWERBAR_ENABLED == true
if _G.GwPlayerPowerBar then _G.GwPlayerPowerBar:ToggleBar() end
if GW.UpdateClassPowerExtraManabar then
    GW.UpdateClassPowerExtraManabar()
end
addonTable.PlusEnergyTicker.Refresh()
```

状态条页面不加入 `PLAYER_AS_TARGET_FRAME_SHOW_RESSOURCEBAR`，因此“额外资讯条”不再出现。

- [ ] **Step 7: 创建资源条固定四行**

```lua
panel:AddGroupHeader("资源条")
-- CLASS_POWER、自定义资源数值开关：gwPlusColumns = 2
-- CLASSPOWER_ANCHOR_MODE、CLASSPOWER_CUSTOMRESOURCEBAR_SIDE：gwPlusColumns = 2
-- CLASSPOWER_ANCHOR_OFFSET_X、CLASSPOWER_ANCHOR_OFFSET_Y、
-- CLASSPOWER_CUSTOMRESOURCEBAR_GAP：gwPlusColumns = 3
-- CLASSPOWER_ONLY_SHOW_IN_COMBAT：整行
```

显示名称固定为：

```lua
"启用"
"在条上显示数值"
"锚点"
"自定义侧边"
"X 偏移"
"Y 偏移"
"间距"
"仅在战斗中显示"
```

- [ ] **Step 8: 分别应用两个数值开关**

能量数值开关只更新：

```lua
_G.GwPlayerPowerBar.showBarValues
_G.GwPlayerUnitFrame.powerbar.showBarValues
```

资源数值开关只更新：

```lua
_G.GwPlayerClassPower.exbar.showBarValues
_G.GwPlayerClassPower.exbarSecret.showBarValues
_G.GwPlayerClassPower.lmb.showBarValues
_G.GwPlayerClassPower.lmbSecret.showBarValues
```

关闭时立即清空对应 `label` 或 `powerBarString`；开启时调用可用的 `UpdatePowerData` 刷新。

对以下原生刷新入口只安装一次安全钩子，并在原生逻辑结束后重新应用 Plus 值：

```lua
GwPlayerPowerBarMixin.ToggleSettings
GwPlayerUnitFrameMixin.ToggleSettings
GW.UpdateClasspowerSetting
GW.UpdateClassPowerExtraManabar
```

如果 `GW.globalSettings` 支持 `OnProfileChanged`，配置切换后重新同步额外能量条、两个数值开关和回复提示镜像。

- [ ] **Step 9: 初始化多列布局和依赖刷新**

给同一行的每个选项设置相同 `gwPlusColumns`，然后执行：

```lua
addonTable.PlusSettingsLayout.InitializePanel(panel)
```

建立 `optionName -> widget` 映射，按克隆选项的 `dependence` 启用或禁用布尔、滑块、下拉框和文本输入。每个原生回调执行后用 `C_Timer.After(0, RefreshStatusPanel)` 刷新：

```lua
addonTable.PlusSettingsLayout.RefreshPanel(panel)
ApplyPanelDependencies(panel)
addonTable.PlusEnergyTicker.Refresh()
```

函数最终返回 `panel`；重复调用时返回已创建面板，不重复创建控件或钩子。

---

### Task 4: 把框体菜单切换到状态条页面

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/MainMenu/MainMenu.lua`

- [ ] **Step 1: 修改玩家子菜单名称**

将：

```lua
{"资源条", "player_classpower"}
```

改为：

```lua
{"状态条", "player_classpower"}
```

- [ ] **Step 2: 保存 Plus 状态条面板**

`PrepareUnitFrameSettings` 调用：

```lua
settingsTab.gwPlusPlayerStatusPanel =
    addonTable.PreparePlayerResourcePanel(
        embeddedPanels.player_general,
        embeddedPanels.player_classpower,
        embeddedPanels.player_castbar)
```

只有返回有效面板时才覆盖缓存。

- [ ] **Step 3: 在框体标签中替换资源页面**

`FindNativePages` 收集完原生页面后加入：

```lua
if settingsTab.gwPlusPlayerStatusPanel then
    found.player_classpower = settingsTab.gwPlusPlayerStatusPanel
end
```

这样原生设置入口继续使用原 `player_classpower`，框体标签中的“状态条”使用 Plus 多列页面。

---

### Task 5: 静态验证

**Files:**
- Verify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua`
- Verify: `Interface/AddOns/GW2_UI_PLUS/MainMenu/EnergyTicker.lua`
- Verify: `Interface/AddOns/GW2_UI_PLUS/MainMenu/PlayerResources.lua`
- Verify: `Interface/AddOns/GW2_UI_PLUS/MainMenu/MainMenu.lua`
- Verify: `Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc`

- [ ] **Step 1: 检查所有修改文件的 Lua 语法**

Run:

```bash
luac -p \
  Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua \
  Interface/AddOns/GW2_UI_PLUS/MainMenu/EnergyTicker.lua \
  Interface/AddOns/GW2_UI_PLUS/MainMenu/PlayerResources.lua \
  Interface/AddOns/GW2_UI_PLUS/MainMenu/MainMenu.lua
```

Expected: exit code `0`，无输出。

- [ ] **Step 2: 静态核对名称、顺序和列数**

运行 Lua 静态检查脚本，断言源文件同时包含：

```text
状态条
调整玩家的血球、施法条、能量条和资源条。
球状血条
施法条
能量条
资源条
energyBarShowValue
resourceBarShowValue
gwPlusColumns = 3
```

并断言状态条选项构建中不插入：

```text
PLAYER_AS_TARGET_FRAME_SHOW_RESSOURCEBAR
```

该键只允许出现在派生同步函数中。

- [ ] **Step 3: 检查空白错误**

Run:

```bash
git diff --check -- \
  Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc \
  Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua \
  Interface/AddOns/GW2_UI_PLUS/MainMenu/EnergyTicker.lua \
  Interface/AddOns/GW2_UI_PLUS/MainMenu/PlayerResources.lua \
  Interface/AddOns/GW2_UI_PLUS/MainMenu/MainMenu.lua
```

Expected: exit code `0`，无输出。

- [ ] **Step 4: 确认本轮没有改动 GW2_UI 原生目录**

实施前后分别对 `Interface/AddOns/GW2_UI` 文件内容生成 SHA-256 清单并比较：

```bash
find Interface/AddOns/GW2_UI -type f -print0 |
  sort -z |
  xargs -0 shasum -a 256
```

Expected: 两份清单完全一致。

- [ ] **Step 5: 报告验证边界**

明确说明只完成 Lua 语法和静态验证；按用户要求未运行自动化测试或游戏内测试，最终显示由用户 `/reload` 后检查。

由于当前工作树包含大量既有未跟踪与未提交源码，本计划不提交源码文件，避免把用户已有改动混入提交。
