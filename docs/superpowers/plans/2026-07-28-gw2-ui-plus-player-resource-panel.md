# GW2_UI_PLUS 玩家资源条页面重组实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**目标：** 把玩家资源条页面重组为“球状血条、施法条、能量条、职业资源条”，并让普通玩家框体与球状血条独立控制。

**架构：** 新增 `MainMenu/PlayerResources.lua`，专门筛选和重排已经初始化的原生选项对象，并用 GW2_UI 的 ScrollBox 行格式重建综合与资源条数据源。`ActionBar/ActionBar.lua` 提供普通玩家框体和球状血条状态 API，复用已有血球空隙、缩放配置，不复制布局实现。

**技术栈：** Lua 5.1、World of Warcraft Frame API、GW2_UI 设置面板、ScrollBox 数据源、GW2_UI_PLUS SavedVariables。

---

### 任务一：提供独立玩家框体和血球状态 API

**文件：**
- 修改：`Interface/AddOns/GW2_UI_PLUS/ActionBar/ActionBar.lua`

- [ ] **步骤 1：增加默认配置**

在 `defaults` 中加入：

```lua
normalPlayerFrameEnabled = true,
```

- [ ] **步骤 2：增加状态访问函数**

新增：

```lua
function AB.IsNormalPlayerFrameEnabled()
    return InitDB().normalPlayerFrameEnabled ~= false
end

function AB.SetNormalPlayerFrameEnabled(value)
    InitDB().normalPlayerFrameEnabled = value == true
end

function AB.IsGlobeStyleEnabled()
    return GW.settings and not GW.settings.PLAYER_AS_TARGET_FRAME
end

function AB.SetGlobeStyleEnabled(value)
    if not GW.settings then return end
    GW.settings.PLAYER_AS_TARGET_FRAME = not value
    AB.SyncPlayerHudEnabled()
    if GW.updateSettingsFrameSettingsValue then
        GW.updateSettingsFrameSettingsValue(
            "PLAYER_AS_TARGET_FRAME", not value, false)
        GW.updateSettingsFrameSettingsValue(
            "HEALTHGLOBE_ENABLED",
            GW.settings.HEALTHGLOBE_ENABLED, false)
    end
end
```

- [ ] **步骤 3：派生原生玩家 HUD 主开关**

新增：

```lua
function AB.SyncPlayerHudEnabled()
    if not GW.settings then return end
    GW.settings.HEALTHGLOBE_ENABLED =
        AB.IsNormalPlayerFrameEnabled()
        or AB.IsGlobeStyleEnabled()
end
```

在文件加载阶段执行一次，使原生 `PLAYER_LOGIN` 根据两个独立开关的组合加载正确框体。

- [ ] **步骤 4：应用普通玩家框体可见性**

把 `EnsureNormalPlayerFrame` 扩充为：

```lua
function AB.ApplyNormalPlayerFrameVisibility()
    local enabled = AB.IsNormalPlayerFrameEnabled()
    local frame = _G.GwPlayerUnitFrame
    if enabled and not frame and GW.LoadPlayerFrame then
        frame = GW.LoadPlayerFrame()
    end
    if not frame then return end

    if enabled then
        RegisterUnitWatch(frame)
    else
        UnregisterUnitWatch(frame)
        frame:Hide()
    end
end
```

`EnsureNormalPlayerFrame` 只在球状血条样式下补建普通玩家框体，随后调用可见性函数。初始化阶段先同步原生主开关，再应用普通玩家框体可见性。

### 任务二：新增玩家资源页面重组模块

**文件：**
- 新建：`Interface/AddOns/GW2_UI_PLUS/MainMenu/PlayerResources.lua`
- 修改：`Interface/AddOns/GW2_UI_PLUS/GW2_UI_PLUS.toc`

- [ ] **步骤 1：注册模块加载顺序**

在 TOC 中让 `MainMenu/PlayerResources.lua` 位于 `MainMenu/MainMenu.lua` 之前，确保设置窗口初始化时重组函数已经存在。

- [ ] **步骤 2：实现选项行打包**

在新文件中实现与原生设置面板一致的：

```lua
local function ResolveForceNewLine(option)
    if option.forceNewLine ~= nil then return option.forceNewLine end
    if option.optionType == "dropdown" and option.noNewLine ~= nil then
        return not option.noNewLine
    end
    return option.optionType ~= "boolean"
end
```

实现 `BuildOptionsDataProvider(panel)`，保留主开关后的 `masterToggleSeparator`，每条数据包含 `index`、`kind`、`cols` 和目标 `panel`。

- [ ] **步骤 3：筛选原生选项**

按 `option.optionName` 从综合页面取出：

```lua
HEALTHGLOBE_ENABLED
POWERBAR_ENABLED
PLAYER_AS_TARGET_FRAME
showDodgebar
PLAYER_TRACKED_DODGEBAR_SPELL
```

其中 `HEALTHGLOBE_ENABLED` 和 `PLAYER_AS_TARGET_FRAME` 不再直接显示；其余三项移动到资源条页面。

从原职业资源页面取出以下能量条选项：

```lua
PLAYER_ENERGY_MANA_TICK
PLAYER_5SR_TIMER
PLAYER_ENERGY_MANA_TICK_HIDE_OFC
```

剩余原生选项归入“职业资源条”。`player_castbar` 的全部 `gwOptions` 归入“施法条”。

- [ ] **步骤 4：创建普通玩家框体开关**

在综合面板新增：

```lua
playerGeneral:AddOption("启用", "只控制普通玩家框体，不影响球状血条。", {
    getter = AB.IsNormalPlayerFrameEnabled,
    setter = AB.SetNormalPlayerFrameEnabled,
    getDefault = function() return true end,
    callback = function()
        AB.SyncPlayerHudEnabled()
        AB.ApplyNormalPlayerFrameVisibility()
    end,
    isMasterToggle = true,
})
```

把它放在综合页面第一项，后面接保留下来的原生综合选项。

- [ ] **步骤 5：创建球状血条选项**

资源页面创建以下 Plus 选项：

```lua
resourcePanel:AddOption("使用球状血条样式", nil, {
    getter = AB.IsGlobeStyleEnabled,
    setter = AB.SetGlobeStyleEnabled,
    getDefault = function() return true end,
    callback = function() GW.ShowRlPopup = true end,
})

resourcePanel:AddOption("为血球预留中间空隙", nil, {
    getter = function() return AB.InitDB().mainBarGlobeGap end,
    setter = function(value) AB.InitDB().mainBarGlobeGap = value end,
    getDefault = function() return AB.defaults.mainBarGlobeGap end,
    callback = AB.ApplyMainBarLayout,
})

resourcePanel:AddOptionSlider("血球缩放", nil, {
    min = 0.5, max = 2, step = 0.05, decimalNumbers = 2,
    getter = function() return AB.InitDB().globeScale end,
    setter = function(value) AB.InitDB().globeScale = value end,
    getDefault = function() return AB.defaults.globeScale end,
    callback = AB.ApplyGlobeScale,
})
```

把原 `showDodgebar` 选项显示名称改为“显示位移条”，与 `PLAYER_TRACKED_DODGEBAR_SPELL` 一起放入球状血条组。

- [ ] **步骤 6：按最终顺序重建资源页**

使用 `resourcePanel:AddGroupHeader` 创建四个标题，并把 `gwOptions` 重排为：

```lua
球状血条标题
球状血条设置
施法条标题
player_castbar 原生设置
能量条标题
POWERBAR_ENABLED
三个能量/法力刻度设置
职业资源条标题
其余 player_classpower 原生设置
```

所有移动选项保留原对象、配置存取、依赖和回调。

- [ ] **步骤 7：设置幂等标记并重建数据源**

重组成功后设置：

```lua
resourcePanel.__gwPlusPlayerResourcesPrepared = true
```

分别给综合和资源面板设置新的数据源，避免重复初始化时再次插入标题和选项。

### 任务三：接入框体初始化

**文件：**
- 修改：`Interface/AddOns/GW2_UI_PLUS/MainMenu/MainMenu.lua`

- [ ] **步骤 1：收集玩家页面**

`PrepareUnitFrameSettings` 扫描原设置菜单时同时收集：

```lua
player_general
player_classpower
player_castbar
```

- [ ] **步骤 2：调用重组函数**

完成原隐藏器处理后调用：

```lua
addonTable.PreparePlayerResourcePanel(
    embeddedPanels.player_general,
    embeddedPanels.player_classpower,
    embeddedPanels.player_castbar)
```

如果任一页面不存在，函数直接返回，不创建半成品页面。

### 任务四：静态验证

**文件：**
- 验证：`Interface/AddOns/GW2_UI_PLUS/ActionBar/ActionBar.lua`
- 验证：`Interface/AddOns/GW2_UI_PLUS/MainMenu/PlayerResources.lua`
- 验证：`Interface/AddOns/GW2_UI_PLUS/MainMenu/MainMenu.lua`
- 验证：`Interface/AddOns/GW2_UI_PLUS/core.lua`

- [ ] **步骤 1：检查 Lua 语法**

运行：

```bash
luac -p \
  Interface/AddOns/GW2_UI_PLUS/ActionBar/ActionBar.lua \
  Interface/AddOns/GW2_UI_PLUS/MainMenu/PlayerResources.lua \
  Interface/AddOns/GW2_UI_PLUS/MainMenu/MainMenu.lua \
  Interface/AddOns/GW2_UI_PLUS/core.lua
```

预期：无语法错误，状态码为 0。

- [ ] **步骤 2：检查空白错误和关键顺序**

运行 `git diff --check`，并确认新文件包含以下顺序：

```text
球状血条
施法条
能量条
职业资源条
```

- [ ] **步骤 3：确认修改范围**

确认本功能只修改 `GW2_UI_PLUS` 和设计/计划文档，不修改 `GW2_UI` 原生文件。

按用户要求不增加或运行自动化测试，游戏内效果由用户 `/reload` 后检查。
