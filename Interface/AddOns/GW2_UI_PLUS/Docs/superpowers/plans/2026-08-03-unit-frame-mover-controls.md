# 框体页面移动与恢复默认实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**目标：** 为七个框体设置页面增加统一的“解锁/锁定”和“恢复默认”，页面参数与对应框体位置一起恢复。

**架构：** 扩展 `HudMoverOptions.lua` 的现有通用控制，通过声明式页面映射接入七个 mover。恢复逻辑只依赖选项已有的 `getDefault`、`set` 和 `callback` 接口，并为多选下拉逐项恢复；整次操作在战斗中排入脱战队列。

**技术栈：** Lua 5.1、GW2_UI 设置面板 API、GW2_UI mover API、仓库现有 Lua 回归脚本。

---

## 文件结构

- 新建 `tests/hud_mover_options_runtime.lua`：独立模拟设置面板、mover 和战斗队列，验证七页行为。
- 修改 `Modules/Settings/HudMoverOptions.lua`：实现页面级参数恢复、脱战调度和七页映射。
- 保留 `tests/minimap_addon_flyout_regression.sh`：继续验证微型系统菜单和小地图旧行为未回归。

### 任务 1：建立七页控制的失败回归测试

**文件：**

- 新建：`tests/hud_mover_options_runtime.lua`
- 测试：`Modules/Settings/HudMoverOptions.lua`

- [ ] **步骤 1：编写最小运行时模拟**

创建 `NewMover`、`NewFrame` 和 `NewPanel`。面板同时维护 `gwOptions`，并提供 `AddGroupHeader`、`AddOptionButton`；GW 模拟包含 `settings`、`globalDefault.profile`、`RefreshSettingsPanel`、`CheckDependencies`、`UpdateMatchingLayout` 和可记录任务的 `CombatQueue:Queue`。

```lua
local function NewPanel(option)
    local panel = {gwOptions = {option}}
    function panel:AddGroupHeader(name)
        self.gwOptions[#self.gwOptions + 1] = {
            name = name,
            optionType = "header",
        }
    end
    function panel:AddOptionButton(name, description, values)
        local optionButton = {
            name = name,
            desc = description,
            optionType = "button",
        }
        for key, value in pairs(values) do optionButton[key] = value end
        self.gwOptions[#self.gwOptions + 1] = optionButton
        return optionButton
    end
    return panel
end
```

- [ ] **步骤 2：声明七个页面、框体和位置默认值**

测试数据必须覆盖以下精确映射：

```lua
local definitions = {
    {panel = "player_general", frame = "GwPlayerUnitFrame", setting = "player_pos"},
    {panel = "gw2_plus_player_castbar", frame = "GwCastingBarPlayer", setting = "castingbar_pos", resource = true},
    {panel = "gw2_plus_player_energy", frame = "GwPlayerPowerBar", setting = "PowerBar_pos", resource = true},
    {panel = "gw2_plus_player_resource", frame = "GwPlayerClassPower", setting = "ClasspowerBar_pos", resource = true},
    {panel = "target_general", frame = "GwTargetUnitFrame", setting = "target_pos"},
    {panel = "target_of_target", frame = "GwTargetTargetUnitFrame", setting = "targettarget_pos"},
    {panel = "player_pet", frame = "GwPlayerPetFrame", setting = "pet_pos"},
}
```

每页放入一个当前值为 `false`、默认值为 `true` 的普通选项，记录 `set` 和 `callback` 调用。目标页额外放入 `hasCheckbox = true` 的多选项，通过 `optionsList = {"one", "two"}` 验证两个键分别恢复。

- [ ] **步骤 3：断言控制、恢复和脱战行为**

加载模块并调用 `BuildHudMoverOptions`，逐页断言：

```lua
assert(FindOption(panel, "解锁/锁定"), definition.panel .. " 缺少解锁按钮")
local restore = assert(FindOption(panel, "恢复默认"), definition.panel .. " 缺少恢复按钮")
restore.callback()
assert(value == true, definition.panel .. " 未恢复页面参数")
assert(frame.gwMover.point[1] == defaultPoint.point, definition.panel .. " 未恢复位置")
assert(GW2_ADDON.settings[definition.setting].hasMoved == false)
```

将 `InCombatLockdown` 改为返回 `true` 后再次点击恢复，先断言参数与位置没有变化且队列收到任务；再改回 `false` 并执行队列任务，断言参数和位置恢复。最后断言微型系统菜单、小地图仍显示“重置位置”而不是“恢复默认”。

- [ ] **步骤 4：运行测试并确认因功能缺失而失败**

运行：

```bash
lua tests/hud_mover_options_runtime.lua
```

预期：失败，首个新增页面找不到“解锁/锁定”或“恢复默认”；失败原因不是模拟环境报错。

- [ ] **步骤 5：提交失败测试**

```bash
git add tests/hud_mover_options_runtime.lua
git commit -m "测试：覆盖框体页面移动与恢复默认"
```

### 任务 2：实现通用页面恢复与七页映射

**文件：**

- 修改：`Modules/Settings/HudMoverOptions.lua`
- 测试：`tests/hud_mover_options_runtime.lua`

- [ ] **步骤 1：实现单个选项恢复**

在 `CopyTable` 后增加通用恢复函数。控制按钮用 `gwPlusMoverControl` 标记并跳过；多选下拉按键恢复；表类型默认值先复制，避免配置和默认表共享引用。

```lua
local function RestoreOptionDefault(option)
    if not option or option.gwPlusMoverControl
        or not option.getDefault or not option.set then
        return
    end
    if option.hasCheckbox and type(option.optionsList) == "table" then
        for _, optionKey in ipairs(option.optionsList) do
            option.set(option.getDefault(optionKey), optionKey)
        end
        if option.callback then option.callback() end
        return
    end
    local value = option.getDefault()
    if type(value) == "table" then value = CopyTable(value) end
    option.set(value)
    if option.callback then option.callback(value, option.optionName) end
end
```

- [ ] **步骤 2：实现页面级恢复和脱战调度**

增加 `RestorePanelDefaults`。应用时遍历当前 `panel.gwOptions`，恢复参数后调用现有 `ResetHudMover`，最后刷新设置面板和依赖；战斗中使用 `GW.CombatQueue:Queue("GW2PlusRestore" .. settingName, Apply, {})`，没有队列时只提示而不执行。

```lua
local function RestorePanelDefaults(panel, frameName, settingName, defaultPoint)
    local GW = _G.GW2_ADDON
    local function Apply()
        for _, option in ipairs(panel.gwOptions or {}) do
            RestoreOptionDefault(option)
        end
        ResetHudMover(frameName, settingName, defaultPoint)
        if GW and GW.RefreshSettingsPanel then GW.RefreshSettingsPanel(panel) end
        if GW and GW.CheckDependencies then GW.CheckDependencies() end
    end
    if InCombatLockdown and InCombatLockdown() then
        if GW and GW.CombatQueue then
            GW.CombatQueue:Queue("GW2PlusRestore" .. settingName, Apply, {})
        elseif GW and GW.Notice then
            GW.Notice("战斗中无法恢复组件设置。")
        end
        return
    end
    Apply()
end
```

- [ ] **步骤 3：扩展控制创建函数**

让 `AddMoverControls` 接受 `restorePanel`。新增页面传 `true` 时按钮名称为“恢复默认”，回调调用 `RestorePanelDefaults`；旧页面仍显示“重置位置”并只调用 `ResetHudMover`。两个按钮均设置 `forceNewLine = false` 和两列布局，且标记为 mover 控制。

```lua
local resetLabel = restorePanel and "恢复默认" or "重置位置"
local reset = SetInline(panel:AddOptionButton(resetLabel,
    restorePanel and "恢复当前页面的全部参数和位置。" or "移回默认位置。", {
        callback = function()
            if restorePanel then
                RestorePanelDefaults(panel, frameName, settingName, defaultPoint)
            else
                ResetHudMover(frameName, settingName, defaultPoint)
            end
        end,
        isNegativeButton = true,
    }))
mover.gwPlusMoverControl = true
reset.gwPlusMoverControl = true
```

- [ ] **步骤 4：注册七页映射**

在 `BuildHudMoverOptions` 中同时读取原生页面和玩家资源页面，并在现有微型系统菜单、小地图注册之后加入：

```lua
local resources = tab.gwPlusPlayerResourcePanels or {}
AddMoverControls(pages.player_general, "GwPlayerUnitFrame", "player_pos", nil, true)
AddMoverControls(resources.gw2_plus_player_castbar, "GwCastingBarPlayer", "castingbar_pos", nil, true)
AddMoverControls(resources.gw2_plus_player_energy, "GwPlayerPowerBar", "PowerBar_pos", nil, true)
AddMoverControls(resources.gw2_plus_player_resource, "GwPlayerClassPower", "ClasspowerBar_pos", nil, true)
AddMoverControls(pages.target_general, "GwTargetUnitFrame", "target_pos", nil, true)
AddMoverControls(pages.target_of_target, "GwTargetTargetUnitFrame", "targettarget_pos", nil, true)
AddMoverControls(pages.player_pet, "GwPlayerPetFrame", "pet_pos", nil, true)
```

- [ ] **步骤 5：运行新增测试并确认通过**

运行：

```bash
lua tests/hud_mover_options_runtime.lua
```

预期输出：`框体页面移动与恢复默认检查通过`。

- [ ] **步骤 6：提交实现**

```bash
git add Modules/Settings/HudMoverOptions.lua
git commit -m "功能：增加框体页面移动与恢复默认"
```

### 任务 3：完整回归与差异复核

**文件：**

- 验证：`Modules/Settings/HudMoverOptions.lua`
- 验证：`tests/hud_mover_options_runtime.lua`
- 验证：`tests/minimap_addon_flyout_regression.sh`
- 验证：`tests/player_resource_panels_regression.sh`
- 验证：`tests/frame_settings_regression.sh`

- [ ] **步骤 1：运行相关回归测试**

```bash
lua tests/hud_mover_options_runtime.lua
sh tests/minimap_addon_flyout_regression.sh
sh tests/player_resource_panels_regression.sh
sh tests/frame_settings_regression.sh
```

预期：四项检查全部通过且无 Lua 错误。

- [ ] **步骤 2：运行静态检查**

```bash
luac -p Modules/Settings/HudMoverOptions.lua tests/hud_mover_options_runtime.lua
git diff --check
```

预期：命令全部以状态 0 结束，无语法错误或空白错误。

- [ ] **步骤 3：复核改动范围**

```bash
git status --short
git diff -- Modules/Settings/HudMoverOptions.lua tests/hud_mover_options_runtime.lua
```

确认实现没有覆盖 `Modules/UnitFrames/PlayerResources.lua` 和现有用户改动，且没有修改 GW2_UI 本体。
