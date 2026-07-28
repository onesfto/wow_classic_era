# GW2 UI Plus 动作条文字位置与尺寸范围 Implementation Plan

> 本文档随 GW2 UI Plus 插件保存。

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 统一动作条设置命名、尺寸和间距范围，并为主动作条及动作条 2–8 提供不会被 GW2 UI 刷新覆盖的快捷键与宏名称定位。

**Architecture:** 在 `ActionBar/Layout.lua` 中把现有快捷键定位整理为可同时服务 HotKey 和 Name 的共享文字定位器，设置页只负责读写每条动作条的独立字段。主动作条继续由 `ActionBar.lua` 排列，宠物条继续由 `Layout.lua` 排列；所有受保护框体操作复用现有脱战队列。

**Tech Stack:** World of Warcraft Lua 5.1、GW2 UI 设置面板 mixin、现有 Lua 断言测试、`luac -p`

---

## 文件结构

- 修改 `Interface/AddOns/GW2_UI_PLUS/ActionBar/ActionBar.lua`
  - 统一尺寸常量和核心默认值。
  - 在主动作条应用快捷键与宏名称文字布局。
  - 更新 HUD 编辑面板的范围和“行按钮数”标签。
- 修改 `Interface/AddOns/GW2_UI_PLUS/ActionBar/Layout.lua`
  - 提供共享文字位置函数。
  - 注入动作条 2–8 宏名称位置和宠物条尺寸默认值。
  - 应用多动作条宏名称位置与宠物按钮尺寸。
- 修改 `Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua`
  - 更新所有标签、范围、默认值和恢复默认逻辑。
  - 添加主动作条快捷键、主动作条宏位置、多动作条宏位置和宠物尺寸控件。
- 修改 `Interface/AddOns/GW2_UI_PLUS/tests/ActionBarLayout_test.lua`
  - 验证共享文字定位、默认字段、多动作条宏位置和宠物尺寸。
- 修改 `Interface/AddOns/GW2_UI_PLUS/tests/ActionBarFollowup_test.lua`
  - 验证核心默认值、HUD 编辑范围和标签。
- 修改 `Interface/AddOns/GW2_UI_PLUS/tests/SettingsStructure_test.lua`
  - 验证顶级设置页的控件结构、范围和默认值。
- 修改 `Interface/AddOns/GW2_UI_PLUS/docs/handoffs/2026-07-28-gw2-ui-plus-hotkey-position.md`
  - 更新最终位置模型、默认值和诊断方法。

### Task 1: 锁定命名、范围和默认值

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/tests/ActionBarFollowup_test.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/tests/SettingsStructure_test.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/ActionBar.lua`

- [ ] **Step 1: 写入失败测试**

在 `ActionBarFollowup_test.lua` 增加源码断言：

```lua
assert(actionBar:find("AB.SIZE_MIN = 12", 1, true)
    and actionBar:find("AB.SIZE_MAX = 64", 1, true),
    "所有动作条尺寸范围必须统一为 12–64")
assert(actionBar:find('{"spacing", "间距", 0, 20, 1}', 1, true)
    and actionBar:find('{"columns", "行按钮数", 1, 12, 1}', 1, true),
    "HUD 编辑面板必须使用新间距范围和行按钮数标签")
assert(actionBar:find("mainBarSize = MAINBAR_DEFAULT_SIZE", 1, true)
    and actionBar:find("mageBarSize = 36", 1, true),
    "主动作条默认 48，法师动作条默认 36")
```

在 `SettingsStructure_test.lua` 将旧标签断言改为：

```lua
assert(options:find('"行按钮数"', 1, true)
    and not options:find('AddOptionSlider("列数"', 1, true),
    "设置界面只能显示行按钮数")
assert(options:find("min = 0, max = 20", 1, true),
    "间距滑块最大值必须为 20")
```

- [ ] **Step 2: 运行测试并确认失败**

Run:

```bash
cd Interface/AddOns/GW2_UI_PLUS
lua tests/ActionBarFollowup_test.lua
lua tests/SettingsStructure_test.lua
```

Expected: FAIL，分别指出尺寸仍为 `24–60`、HUD 仍显示“列数”或间距最大值仍为 `10`。

- [ ] **Step 3: 写入最小实现**

在 `ActionBar.lua` 更新：

```lua
AB.SIZE_MIN = 12
AB.SIZE_MAX = 64
```

保持 `MAINBAR_DEFAULT_SIZE = 48`，并把：

```lua
mageBarSize = 36,
```

HUD 编辑定义改为：

```lua
local definitions = {
    {"size", "尺寸", AB.SIZE_MIN, AB.SIZE_MAX, 1},
    {"spacing", "间距", 0, 20, 1},
    {"count", "按钮数", 1, 12, 1},
    {"columns", "行按钮数", 1, 12, 1},
}
```

- [ ] **Step 4: 运行测试并确认通过**

Run:

```bash
lua tests/ActionBarFollowup_test.lua
```

Expected: `ActionBarFollowup_test: OK`

- [ ] **Step 5: 提交**

```bash
git add Interface/AddOns/GW2_UI_PLUS/ActionBar/ActionBar.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/ActionBarFollowup_test.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/SettingsStructure_test.lua
git commit -m "动作条：统一尺寸范围与行按钮数命名"
```

### Task 2: 建立共享文字定位器

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/tests/ActionBarLayout_test.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/Layout.lua`

- [ ] **Step 1: 写入失败测试**

扩展测试字体对象，使其支持 `GetWidth`、`GetNumPoints`、`GetPoint`、`GetJustifyH` 和 `GetJustifyV`，然后验证共享 API：

```lua
local text = NewText()
local button = NewButton()
button.width = 40
Layout.ApplyTextPosition(text, button, "TOPLEFT", 0, 0)
assert(text.gwPlusTextPosition == "TOPLEFT"
    and text.justifyH == "LEFT" and text.justifyV == "TOP",
    "共享文字定位器必须正确应用左上锚点")

Layout.ApplyTextPosition(text, button, "BOTTOM", 3, -2)
assert(text.gwPlusTextPosition == "BOTTOM"
    and text.justifyH == "CENTER" and text.justifyV == "BOTTOM"
    and text.points[1][4] == 3 and text.points[1][5] == -2,
    "共享文字定位器必须从下方锚点应用原始偏移")
```

再模拟外部调用 `SetPoint` 和 `SetJustifyH`，验证共享保护钩子会恢复当前配置。

- [ ] **Step 2: 运行测试并确认失败**

Run:

```bash
lua tests/ActionBarLayout_test.lua
```

Expected: FAIL，提示 `ApplyTextPosition` 不存在。

- [ ] **Step 3: 写入最小实现**

在 `Layout.lua` 将 HotKey 专用字段改成通用字段，并公开共享入口：

```lua
function Layout.ApplyTextPosition(fontString, button, position, x, y)
    if not fontString or not button then return end
    fontString.gwPlusTextButton = button
    fontString.gwPlusTextPosition = NormalizeTextPosition(position)
    fontString.gwPlusTextX = x or 0
    fontString.gwPlusTextY = y or 0
    ProtectTextPosition(fontString)
    RestoreTextPosition(fontString)
end

Layout.ApplyHotkeyPosition = Layout.ApplyTextPosition
```

`RestoreTextPosition` 必须：

```lua
fontString:ClearAllPoints()
fontString:SetPoint(alignment.first, button, alignment.first, x, y)
fontString:SetPoint(alignment.second, button, alignment.second, x, y)
fontString:SetJustifyH(alignment.justifyH)
fontString:SetJustifyV(alignment.justifyV)
```

保护钩子继续监听 `SetPoint` 和 `SetJustifyH`，但读取通用字段，使宏名称和快捷键都能恢复。

同时把 `Layout.PrintHotkeyDiagnostics` 中读取的
`gwPlusHotkeyPosition` 改为 `gwPlusTextPosition`，保证
`/gw2plus hotkey` 继续报告共享定位器实际应用的值。

- [ ] **Step 4: 运行测试并确认通过**

Run:

```bash
lua tests/ActionBarLayout_test.lua
luac -p ActionBar/Layout.lua
```

Expected: `ActionBarLayout_test: OK`，语法检查无输出且退出码为 0。

- [ ] **Step 5: 提交**

```bash
git add Interface/AddOns/GW2_UI_PLUS/ActionBar/Layout.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/ActionBarLayout_test.lua
git commit -m "动作条：共享快捷键与宏名称定位器"
```

### Task 3: 动作条 2–8 快捷键与宏名称位置

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/tests/ActionBarLayout_test.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/Layout.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua`

- [ ] **Step 1: 写入失败测试**

在 `ActionBarLayout_test.lua` 验证缺失字段升级：

```lua
assert(db.bar2HotkeyPosition == "TOPLEFT"
    and db.bar8HotkeyPosition == "TOPLEFT",
    "动作条 2–8 缺少快捷键位置时必须默认左上")
assert(db.bar2MacroPosition == "BOTTOM"
    and db.bar8MacroPosition == "BOTTOM",
    "动作条 2–8 缺少宏名称位置时必须默认下")
```

应用动作条 2 后验证宏名称：

```lua
db.bar2MacroPosition = "TOP"
db.bar2MacroX, db.bar2MacroY = 2, -1
Layout.ApplyMultiBar(2)
assert(frame.gw_Buttons[1].Name.gwPlusTextPosition == "TOP"
    and frame.gw_Buttons[1].Name.justifyH == "CENTER",
    "多动作条宏名称必须使用独立位置")
```

- [ ] **Step 2: 运行测试并确认失败**

Run:

```bash
lua tests/ActionBarLayout_test.lua
```

Expected: FAIL，指出快捷键默认仍为 `TOPRIGHT` 或宏名称位置字段不存在。

- [ ] **Step 3: 写入布局与默认值**

在 `EnsureLayoutDefaults` 的动作条 2–8 循环中使用：

```lua
EnsureValue(db, prefix .. "HotkeyPosition", "TOPLEFT")
EnsureValue(db, prefix .. "MacroPosition", "BOTTOM")
```

在 `ApplyText` 中用共享定位器处理宏名称：

```lua
Layout.ApplyTextPosition(button.Name, button,
    db[prefix .. "MacroPosition"],
    db[prefix .. "MacroX"] or 0, db[prefix .. "MacroY"] or 0)
SetFontSize(button.Name, db[prefix .. "MacroSize"])
```

- [ ] **Step 4: 写入设置控件**

在多动作条“宏名称”分组中，显示开关之后增加：

```lua
local macroPosition = panel:AddOptionDropdown("位置", nil, {
    optionsList = HOTKEY_POSITION_VALUES,
    optionNames = HOTKEY_POSITION_NAMES,
    getter = function() return db[Prefix() .. "MacroPosition"] end,
    setter = function(value) db[Prefix() .. "MacroPosition"] = value end,
    getDefault = function() return "BOTTOM" end,
    callback = ApplyCurrent,
    groupHeaderName = "宏名称",
})
macroPosition.gwPlusColumns = 2
```

把宏名称字体大小放在同一行，X/Y 偏移放下一行。恢复默认必须写入：

```lua
db[prefix .. "HotkeyPosition"] = "TOPLEFT"
db[prefix .. "MacroPosition"] = "BOTTOM"
AB.SetMultiBarSize(selectedBar, 36)
```

- [ ] **Step 5: 运行测试并确认通过**

Run:

```bash
lua tests/ActionBarLayout_test.lua
lua tests/SettingsStructure_test.lua
luac -p ActionBar/Layout.lua ActionBar/Options.lua
```

Expected: 两个测试均输出 `OK`，语法检查退出码为 0。

- [ ] **Step 6: 提交**

```bash
git add Interface/AddOns/GW2_UI_PLUS/ActionBar/Layout.lua \
  Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/ActionBarLayout_test.lua
git commit -m "动作条：增加多动作条宏名称位置"
```

### Task 4: 主动作条快捷键与宏名称位置

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/tests/ActionBarFollowup_test.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/ActionBar.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua`

- [ ] **Step 1: 写入失败测试**

在 `ActionBarFollowup_test.lua` 增加默认字段和应用入口断言：

```lua
for _, token in ipairs({
    "mainBarShowHotkey", "mainBarHotkeyPosition",
    "mainBarHotkeyX", "mainBarHotkeyY", "mainBarHotkeySize",
    "mainBarMacroPosition", "ApplyTextPosition",
}) do
    assert(actionBar:find(token, 1, true), "主动作条缺少字段或应用逻辑：" .. token)
end
assert(actionBar:find('mainBarHotkeyPosition = "BOTTOM"', 1, true)
    and actionBar:find('mainBarMacroPosition = "TOP"', 1, true),
    "主动作条快捷键必须默认下，宏名称必须默认上")
```

- [ ] **Step 2: 运行测试并确认失败**

Run:

```bash
lua tests/ActionBarFollowup_test.lua
```

Expected: FAIL，指出主动作条快捷键或宏名称位置字段缺失。

- [ ] **Step 3: 写入默认值与实际应用**

在 `ActionBar.lua` 的 defaults 中增加：

```lua
mainBarShowHotkey = true,
mainBarHotkeyPosition = "BOTTOM",
mainBarHotkeyX = 0,
mainBarHotkeyY = 0,
mainBarHotkeySize = 12,
mainBarMacroPosition = "TOP",
```

在 `AB.ApplyMainBarLayout` 的按钮循环中调用共享定位器：

```lua
local layout = addonTable.PlusActionBarLayout
if btn.HotKey and layout then
    btn.HotKey:SetShown(db.mainBarShowHotkey ~= false)
    layout.ApplyTextPosition(btn.HotKey, btn,
        db.mainBarHotkeyPosition,
        db.mainBarHotkeyX, db.mainBarHotkeyY)
    AB.SetFontStringSize(btn.HotKey, db.mainBarHotkeySize)
end
if btn.Name and layout then
    layout.ApplyTextPosition(btn.Name, btn,
        db.mainBarMacroPosition,
        db.mainBarMacroX, db.mainBarMacroY)
end
```

保留原有宏名称显示开关与字体大小逻辑。

- [ ] **Step 4: 写入主动作条设置与恢复默认**

在“主动作条”页增加完整“快捷键”分组；“宏名称”分组增加位置下拉框。两组排列均为：

```lua
-- 显示开关
-- 位置(gwPlusColumns = 2) + 字体大小(gwPlusColumns = 2)
-- X 偏移(gwPlusColumns = 2) + Y 偏移(gwPlusColumns = 2)
```

恢复默认中写入：

```lua
db.mainBarShowHotkey = true
db.mainBarHotkeyPosition = "BOTTOM"
db.mainBarHotkeyX, db.mainBarHotkeyY = 0, 0
db.mainBarHotkeySize = 12
db.mainBarMacroPosition = "TOP"
```

- [ ] **Step 5: 运行测试并确认通过**

Run:

```bash
lua tests/ActionBarFollowup_test.lua
lua tests/SettingsStructure_test.lua
luac -p ActionBar/ActionBar.lua ActionBar/Options.lua
```

Expected: 测试均输出 `OK`，语法检查退出码为 0。

- [ ] **Step 6: 提交**

```bash
git add Interface/AddOns/GW2_UI_PLUS/ActionBar/ActionBar.lua \
  Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/ActionBarFollowup_test.lua
git commit -m "动作条：增加主动作条快捷键与宏名称位置"
```

### Task 5: 宠物动作条尺寸和其余范围

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/tests/ActionBarLayout_test.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/tests/SettingsStructure_test.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/Layout.lua`
- Modify: `Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua`

- [ ] **Step 1: 写入失败测试**

在 `ActionBarLayout_test.lua` 增加宠物按钮模拟并验证：

```lua
assert(db.petBarSize == 36, "宠物动作条默认尺寸必须为 36")
db.petBarSize = 50
db.petBarSpacing = 4
Layout.ApplyPetBar()
assert(petFrame.buttons[1].width == 50
    and petFrame.buttons[2].point[4] == 54,
    "宠物动作条必须使用尺寸与间距计算布局")
```

在 `SettingsStructure_test.lua` 验证：

```lua
assert(options:find("db.petBarSize", 1, true),
    "宠物动作条设置必须包含尺寸")
assert(options:find("min = 12, max = 64", 1, true)
    or options:find("min = AB.SIZE_MIN, max = AB.SIZE_MAX", 1, true),
    "动作条尺寸控件必须使用 12–64")
```

- [ ] **Step 2: 运行测试并确认失败**

Run:

```bash
lua tests/ActionBarLayout_test.lua
lua tests/SettingsStructure_test.lua
```

Expected: FAIL，指出 `petBarSize` 缺失或宠物按钮仍固定使用 `32`。

- [ ] **Step 3: 写入宠物条尺寸实现**

在布局默认值中增加：

```lua
EnsureValue(db, "petBarSize", 36)
```

在 `Layout.ApplyPetBar` 中替换固定尺寸：

```lua
local size = Clamp(db.petBarSize, AB.SIZE_MIN, AB.SIZE_MAX)
local points = Layout.CalculateGrid(count, columns, size, spacing)
button:SetSize(size, size)
if GW.setActionButtonStyle and button.GetName and button:GetName() then
    GW.setActionButtonStyle(button:GetName(), false, false, true)
end
```

父框体的现有单位框体尺寸不得修改，只重新计算和设置宠物动作按钮的位置。

- [ ] **Step 4: 更新所有设置范围和默认值**

在 `Options.lua`：

- 主动作条、多动作条、姿态条、宠物条所有间距滑块使用 `min = 0, max = 20`。
- 主动作条、多动作条、姿态条、宠物条、法师条尺寸使用 `AB.SIZE_MIN/AB.SIZE_MAX`。
- 多动作条、姿态条、宠物条、法师条尺寸 `getDefault` 返回 `36`。
- 宠物条新增与间距同一行的“尺寸”滑块。
- 姿态条恢复默认写入 `GW.settings.StanceBar.buttonSize = 36`。
- 宠物条恢复默认写入 `db.petBarSize = 36`。
- 法师条恢复默认通过 `defaults.mageBarSize = 36`。
- 所有 `AddOptionSlider("列数"` 改为 `AddOptionSlider("行按钮数"`。

- [ ] **Step 5: 运行测试并确认通过**

Run:

```bash
lua tests/ActionBarLayout_test.lua
lua tests/SettingsStructure_test.lua
lua tests/ActionBarFollowup_test.lua
luac -p ActionBar/ActionBar.lua ActionBar/Layout.lua ActionBar/Options.lua
```

Expected: 三个测试均输出 `OK`，语法检查退出码为 0。

- [ ] **Step 6: 提交**

```bash
git add Interface/AddOns/GW2_UI_PLUS/ActionBar/Layout.lua \
  Interface/AddOns/GW2_UI_PLUS/ActionBar/Options.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/ActionBarLayout_test.lua \
  Interface/AddOns/GW2_UI_PLUS/tests/SettingsStructure_test.lua
git commit -m "动作条：增加宠物尺寸并统一设置范围"
```

### Task 6: 全量验证与交接文档

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/docs/handoffs/2026-07-28-gw2-ui-plus-hotkey-position.md`

- [ ] **Step 1: 更新交接文档**

记录：

- 共享 `Layout.ApplyTextPosition` API。
- 主动作条快捷键默认 `BOTTOM`、宏名称默认 `TOP`。
- 动作条 2–8 快捷键默认 `TOPLEFT`、宏名称默认 `BOTTOM`。
- 姿态条和宠物条快捷键继续默认 `TOPRIGHT`。
- `/gw2plus hotkey` 的诊断字段含义。
- 宠物按钮尺寸字段 `petBarSize`。

- [ ] **Step 2: 运行全部动作条测试**

Run:

```bash
cd Interface/AddOns/GW2_UI_PLUS
for file in tests/ActionBarFollowup_test.lua \
  tests/ActionBarLayout_test.lua \
  tests/EquipmentDebounce_test.lua \
  tests/FaderBling_test.lua \
  tests/MageBar_test.lua \
  tests/SettingsStructure_test.lua; do
  lua "$file"
done
```

Expected: 六个测试均输出各自的 `OK`，无 Lua 错误。

- [ ] **Step 3: 运行语法和差异检查**

Run:

```bash
luac -p ActionBar/ActionBar.lua ActionBar/Layout.lua \
  ActionBar/Options.lua ActionBar/MageBar.lua ActionBar/Fader.lua
git diff --check -- Interface/AddOns/GW2_UI_PLUS/ActionBar \
  Interface/AddOns/GW2_UI_PLUS/tests \
  Interface/AddOns/GW2_UI_PLUS/docs/handoffs/2026-07-28-gw2-ui-plus-hotkey-position.md
```

Expected: 两个命令都无输出且退出码为 0。

- [ ] **Step 4: 实机验证**

进入游戏后逐项验证：

1. 点击各页面“恢复默认”，主动作条尺寸显示 `48`，其他动作条尺寸显示 `36`。
2. 所有相关页面显示“行按钮数”，间距可以设置到 `20`。
3. 主动作条快捷键 `0,0` 位于“下”，宏名称 `0,0` 位于“上”。
4. 动作条 2–8 快捷键 `0,0` 位于“左上”，宏名称 `0,0` 位于“下”。
5. 宠物动作条从 `12` 调到 `64` 时，按钮尺寸和排列同步变化，宠物头像及血量不变化。
6. 修改按键绑定或触发 GW2 UI 动作条刷新后，快捷键与宏名称位置保持不变。
7. 战斗中修改尺寸和位置不产生受保护操作报错，脱战后只应用最终值。

- [ ] **Step 5: 提交**

```bash
git add Interface/AddOns/GW2_UI_PLUS/docs/handoffs/2026-07-28-gw2-ui-plus-hotkey-position.md
git commit -m "文档：更新动作条文字位置交接说明"
```
