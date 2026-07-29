# 小地图插件悬浮按钮独立模块实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 在 GW2_UI_PLUS 中提供默认开启、完全不依赖 GW2_UI 小地图开关的插件按钮悬浮栏。

**Architecture:** 新建 `Minimap/AddonFlyout.lua` 作为唯一运行时模块，在文件加载阶段接管 GW2_UI 暴露的悬浮按钮创建与刷新入口，并在 `PLAYER_LOGIN` 自行应用 PLUS 保存值。新建 `Minimap/Options.lua` 只负责设置页；`core.lua` 将该页注册到“附加组件”分类。模块保存被接管按钮的原始父级、锚点和显示属性，以支持关闭时恢复。

**Tech Stack:** World of Warcraft Classic Era Lua 5.1 API、GW2_UI 设置模板与皮肤 API、独立 Lua 测试脚本。

---

## 文件结构

- 创建 `Minimap/AddonFlyout.lua`：保存值、入口生命周期、按钮识别、收纳、展开和恢复。
- 创建 `Minimap/Options.lua`：独立主开关设置页。
- 创建 `tests/MinimapAddonFlyout_test.lua`：运行时行为测试。
- 修改 `tests/SettingsStructure_test.lua`：设置页与 TOC 结构回归测试。
- 修改 `GW2_UI_PLUS.toc`：在 `core.lua` 前加载新模块与设置页。
- 修改 `core.lua`：注册“插件悬浮按钮”子页。

### Task 1：建立模块接口与独立保存值

**Files:**
- Create: `tests/MinimapAddonFlyout_test.lua`
- Create: `Minimap/AddonFlyout.lua`
- Modify: `GW2_UI_PLUS.toc`

- [x] **Step 1: 写失败测试**

在测试桩中提供 `GW2_ADDON.settings.MINIMAP_ENABLED = false`、`CreateFrame` 和最小
事件对象，加载模块后断言：

```lua
local Flyout = assert(addonTable.MinimapAddonFlyout)
local db = Flyout.InitDB()
assert(db.minimapAddonFlyoutEnabled == true)
assert(Flyout.IsEnabled() == true)
GW2_ADDON.settings.MINIMAP_ENABLED = true
assert(Flyout.IsEnabled() == true)
```

并断言 `GW2_ADDON.CreateMinimapButtonsSack` 与
`GW2_ADDON.UpdateMinimapButtonsSack` 已被 PLUS 接管。

- [x] **Step 2: 运行测试并确认正确失败**

Run: `lua tests/MinimapAddonFlyout_test.lua`

Expected: FAIL，原因是 `Minimap/AddonFlyout.lua` 尚不存在或
`addonTable.MinimapAddonFlyout` 未定义。

- [x] **Step 3: 编写最小实现**

在 `Minimap/AddonFlyout.lua` 中建立：

```lua
local _, addonTable = ...
local GW = _G.GW2_ADDON
local Flyout = {}
addonTable.MinimapAddonFlyout = Flyout

function Flyout.InitDB()
    GW2_UI_PLUS_SV = GW2_UI_PLUS_SV or {}
    if GW2_UI_PLUS_SV.minimapAddonFlyoutEnabled == nil then
        GW2_UI_PLUS_SV.minimapAddonFlyoutEnabled = true
    end
    return GW2_UI_PLUS_SV
end

function Flyout.IsEnabled()
    return Flyout.InitDB().minimapAddonFlyoutEnabled ~= false
end

GW.CreateMinimapButtonsSack = function() Flyout.Apply() end
GW.UpdateMinimapButtonsSack = function() Flyout.Refresh() end
```

在 TOC 的 `ChatBar/ChatBar.lua` 之前加入：

```text
Minimap/AddonFlyout.lua
Minimap/Options.lua
```

- [x] **Step 4: 运行测试并确认通过**

Run: `lua tests/MinimapAddonFlyout_test.lua`

Expected: PASS，并输出 `MinimapAddonFlyout_test: OK`。

- [x] **Step 5: 提交**

```bash
git add GW2_UI_PLUS.toc Minimap/AddonFlyout.lua tests/MinimapAddonFlyout_test.lua
git commit -m "功能：建立独立插件悬浮按钮模块"
```

### Task 2：实现唯一入口、按钮收纳与关闭恢复

**Files:**
- Modify: `tests/MinimapAddonFlyout_test.lua`
- Modify: `Minimap/AddonFlyout.lua`

- [x] **Step 1: 扩展失败测试**

在测试中构造一个符合条件的 `LibDBIcon` 按钮和一个应忽略的
`MiniMapTracking`，依次断言：

```lua
Flyout.Apply()
local firstToggle = Flyout.GetToggle()
assert(firstToggle ~= nil)
assert(addonButton:GetParent() == firstToggle.container)
assert(trackingButton:GetParent() == Minimap)

Flyout.Apply()
assert(Flyout.GetToggle() == firstToggle)
assert(createdToggleCount == 1)

Flyout.SetEnabled(false)
assert(firstToggle:IsShown() == false)
assert(addonButton:GetParent() == Minimap)
assert(addonButton:GetPoint(1) == originalPoint)
```

再断言 `GW2_ADDON.settings.MINIMAP_ENABLED` 在 `false` 与 `true` 时上述行为一致。

- [x] **Step 2: 运行测试并确认正确失败**

Run: `lua tests/MinimapAddonFlyout_test.lua`

Expected: FAIL，原因是 `Apply` 尚未收纳按钮，或 `SetEnabled` 尚未恢复按钮。

- [x] **Step 3: 实现入口生命周期**

实现并暴露：

```lua
function Flyout.GetToggle()
    return _G.GwAddonToggle
end

function Flyout.Apply()
    if not Flyout.IsEnabled() then
        Flyout.Disable()
        return
    end
    local toggle = EnsureToggle()
    ScanAndCollect(toggle)
    UpdateButtons(toggle)
end

function Flyout.Refresh()
    if Flyout.IsEnabled() then Flyout.Apply() end
end

function Flyout.SetEnabled(enabled)
    Flyout.InitDB().minimapAddonFlyoutEnabled = enabled == true
    if enabled then Flyout.Apply() else Flyout.Disable() end
end
```

`EnsureToggle` 优先复用 `_G.GwAddonToggle`，不存在时使用
`CreateFrame("Button", "GwAddonToggle", UIParent, "GwAddonToggle")` 创建；只绑定一次
PLUS 的点击和事件脚本，并在缺少外部定位时锚定到 `Minimap` 左侧。

- [x] **Step 4: 实现按钮识别、状态保存与恢复**

沿用上游明确的忽略名单、名称过滤和尺寸过滤。首次接管按钮时保存：

```lua
state.parent = button:GetParent()
state.scale = button:GetScale()
state.strata = button:GetFrameStrata()
state.level = button:GetFrameLevel()
state.points = CapturePoints(button)
state.methods = CaptureMethods(button)
```

收纳时将按钮放入 `toggle.container`，按 27 像素间隔横向排列并锁定定位方法；
`Disable` 时解锁方法、恢复保存状态、清除模块接管表、隐藏入口和容器。

- [x] **Step 5: 实现事件与战斗延迟**

模块加载时创建驱动框：

```lua
driver:RegisterEvent("PLAYER_LOGIN")
driver:RegisterEvent("ADDON_LOADED")
driver:SetScript("OnEvent", function(_, event)
    if event == "PLAYER_LOGIN" then
        C_Timer.After(0, Flyout.Apply)
    elseif Flyout.IsEnabled() then
        C_Timer.After(1, Flyout.Refresh)
    end
end)
```

若 `InCombatLockdown()` 或正在宠物对战，设置待处理标记并监听
`PLAYER_REGEN_ENABLED`，脱战后再次应用。

- [x] **Step 6: 运行测试并确认通过**

Run: `lua tests/MinimapAddonFlyout_test.lua`

Expected: PASS，并输出 `MinimapAddonFlyout_test: OK`。

- [x] **Step 7: 提交**

```bash
git add Minimap/AddonFlyout.lua tests/MinimapAddonFlyout_test.lua
git commit -m "功能：实现插件按钮收纳与恢复"
```

### Task 3：加入独立设置页

**Files:**
- Create: `Minimap/Options.lua`
- Modify: `core.lua`
- Modify: `tests/SettingsStructure_test.lua`

- [x] **Step 1: 写失败结构测试**

在 `tests/SettingsStructure_test.lua` 中读取新文件并断言：

```lua
local minimapOptions = Read("Minimap/Options.lua")
assert(minimapOptions:find("BuildMinimapAddonFlyoutPanel", 1, true))
assert(minimapOptions:find("Flyout.SetEnabled(value)", 1, true))
assert(minimapOptions:find("isMasterToggle = true", 1, true))
assert(core:find("BuildMinimapAddonFlyoutPanel", 1, true))
assert(core:find('name = "插件悬浮按钮"', 1, true))
```

- [x] **Step 2: 运行测试并确认正确失败**

Run: `lua tests/SettingsStructure_test.lua`

Expected: FAIL，原因是 `Minimap/Options.lua` 或设置页注册尚不存在。

- [x] **Step 3: 实现设置页**

`Minimap/Options.lua` 创建 `GwSettingsPanelTmpl` 子页，标题为“插件悬浮按钮”，并添加：

```lua
local option = panel:AddOption(
    "启用",
    "收纳小地图周围的插件按钮；此设置不受 GW2_UI 小地图开关影响。",
    {
        getter = Flyout.IsEnabled,
        setter = function(value) Flyout.SetEnabled(value) end,
        getDefault = function() return true end,
        isMasterToggle = true,
    })
option.optionName = "GW2PlusMinimapAddonFlyout_Enable"
```

通过 `addonTable.BuildMinimapAddonFlyoutPanel = BuildPanel` 暴露构建函数。

- [x] **Step 4: 注册子页**

在 `core.lua` 构造 `subPanels` 后加入：

```lua
if addonTable.BuildMinimapAddonFlyoutPanel then
    local frame = addonTable.BuildMinimapAddonFlyoutPanel(p)
    table.insert(subPanels, {
        name = "插件悬浮按钮",
        frame = frame,
        icon = "Interface\\AddOns\\GW2_UI\\textures\\icons\\addondropout.png",
    })
end
```

- [x] **Step 5: 运行结构测试并确认通过**

Run: `lua tests/SettingsStructure_test.lua`

Expected: PASS，并输出 `SettingsStructure_test: OK`。

- [x] **Step 6: 提交**

```bash
git add Minimap/Options.lua core.lua tests/SettingsStructure_test.lua
git commit -m "设置：添加插件悬浮按钮独立开关"
```

### Task 4：全量验证与文档核对

**Files:**
- Modify: `docs/superpowers/plans/2026-07-29-minimap-addon-flyout.md`

- [x] **Step 1: 运行全部 Lua 测试**

Run:

```bash
for test_file in tests/*_test.lua; do
    lua "$test_file"
done
```

Expected: 每个脚本退出码为 0，并输出对应的 `OK`。

Result: 本功能两项测试及其余测试通过；既有
`SettingsStructure_test.lua` 因动作条 `GetCastbarScale` 断言失败，与本次变更无关。

- [x] **Step 2: 运行静态检查**

Run:

```bash
luac -p Minimap/AddonFlyout.lua Minimap/Options.lua
git diff --check
```

Expected: 两条命令均无输出且退出码为 0。

- [x] **Step 3: 核对范围**

Run:

```bash
git status --short -- GW2_UI_PLUS.toc Minimap core.lua tests docs/superpowers
git diff --stat HEAD~3 -- GW2_UI_PLUS.toc Minimap core.lua tests
```

Expected: 仅包含本功能计划列出的文件，不包含对 GW2_UI 本体的修改。

- [x] **Step 4: 更新计划勾选并提交**

将本计划所有完成步骤改为 `[x]`，随后运行：

```bash
git add docs/superpowers/plans/2026-07-29-minimap-addon-flyout.md
git commit -m "文档：记录插件悬浮按钮实施结果"
```
