# 冷却闪烁 GWUI 样式实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将冷却完成提示图标改为 GWUI 方形图标风格，并提供技能名称的上方、居中、下方位置设置。

**Architecture:** `CooldownPulse.lua` 继续负责运行时视图；新增一个仅负责名称锚点与图标样式的本地函数。图标仍由既有动画驱动缩放和透明度，设置面板只读写新的持久化字段并立即调用刷新函数。

**Tech Stack:** WoW Classic Era Lua 5.1、GWUI 框架 API、POSIX shell 静态回归检查。

---

## 文件结构

- 修改：`Modules/CooldownPulse/CooldownPulse.lua` — 保存名称位置、应用文字锚点、创建 GWUI 边框并内缩图标。
- 修改：`Modules/CooldownPulse/Options.lua` — 在“显示技能名称”下新增名称位置下拉框。
- 新建：`tests/cooldown_pulse_gwui_regression.sh` — 防止样式结构、默认值和设置项回归。

### Task 1: 冷却闪烁回归检查

**Files:**
- Create: `tests/cooldown_pulse_gwui_regression.sh`
- Test: `tests/cooldown_pulse_gwui_regression.sh`

- [ ] **Step 1: 写入失败的静态回归检查**

```sh
#!/bin/sh
set -eu

pulse_file="Modules/CooldownPulse/CooldownPulse.lua"
options_file="Modules/CooldownPulse/Options.lua"

grep -F 'spellNamePosition = "TOP"' "$pulse_file" >/dev/null
grep -F 'local function UpdateSpellNamePosition()' "$pulse_file" >/dev/null
grep -F 'DCP.TextFrame:SetPoint("BOTTOM", DCP, "TOP", 0, 4)' "$pulse_file" >/dev/null
grep -F 'DCP.TextFrame:SetPoint("CENTER", DCP, "CENTER")' "$pulse_file" >/dev/null
grep -F 'DCP.TextFrame:SetPoint("TOP", DCP, "BOTTOM", 0, -4)' "$pulse_file" >/dev/null
grep -F 'DCPT:SetPoint("TOPLEFT", DCP, "TOPLEFT", 3, -3)' "$pulse_file" >/dev/null
grep -F 'DCP:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder)' "$pulse_file" >/dev/null
grep -F 'panel:AddOptionDropdown("技能名称位置"' "$options_file" >/dev/null
grep -F 'optionsList = {"TOP", "CENTER", "BOTTOM"}' "$options_file" >/dev/null
grep -F 'optShowSpellName.optionName = "GW2PlusCooldownPulse_ShowSpellName"' "$options_file" >/dev/null

printf '%s\n' '冷却闪烁 GWUI 样式回归检查通过'
```

- [ ] **Step 2: 运行检查并确认它因缺少新行为而失败**

Run: `sh tests/cooldown_pulse_gwui_regression.sh`

Expected: 非零退出；首个失败项为 `spellNamePosition = "TOP"` 尚未定义。

### Task 2: 实现图标样式和名称位置

**Files:**
- Modify: `Modules/CooldownPulse/CooldownPulse.lua:5-70,96-112,215-240,337-360`
- Modify: `Modules/CooldownPulse/Options.lua:96-111`
- Test: `tests/cooldown_pulse_gwui_regression.sh`

- [ ] **Step 1: 在默认配置与运行时缓存中加入名称位置**

```lua
local fadeInTime, fadeOutTime, maxAlpha, animScale, iconSize, holdTime, showSpellName, spellNamePosition, ignoredSpells, invertIgnored, remainingCooldownWhenNotified

local defaults = {
    enable = true,
    fadeInTime = 0.3,
    fadeOutTime = 0.7,
    maxAlpha = 0.7,
    animScale = 1.5,
    iconSize = 75,
    holdTime = 0,
    petOverlay = {1, 1, 1},
    showSpellName = false,
    spellNamePosition = "TOP",
    x = 0,
    y = 0,
    remainingCooldownWhenNotified = 0,
    ignoredSpells = "",
    invertIgnored = false,
}

-- RefreshLocals 内
spellNamePosition = db.spellNamePosition
```

- [ ] **Step 2: 添加单一的名称锚点函数，并让刷新与测试预览调用它**

```lua
local function UpdateSpellNamePosition()
    DCP.TextFrame:ClearAllPoints()
    if spellNamePosition == "CENTER" then
        DCP.TextFrame:SetPoint("CENTER", DCP, "CENTER")
    elseif spellNamePosition == "BOTTOM" then
        DCP.TextFrame:SetPoint("TOP", DCP, "BOTTOM", 0, -4)
    else
        DCP.TextFrame:SetPoint("BOTTOM", DCP, "TOP", 0, 4)
    end
end

-- RefreshLocals 末尾
UpdateSpellNamePosition()
```

保持 `SetWidth(185)`、居中对齐、字体和阴影不变；设置切换与 `TestAndUnlock()` 中的 `RefreshLocals()` 会立即重设锚点。

- [ ] **Step 3: 以安全降级方式创建 GWUI 外框并内缩图标**

```lua
local DCP = CreateFrame("Frame", "GW2Plus_CooldownPulseFrame", UIParent)
if GW and GW.BackdropTemplates and DCP.GwCreateBackdrop then
    DCP:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder)
end

local DCPT = DCP:CreateTexture(nil, "BACKGROUND")
DCPT:SetPoint("TOPLEFT", DCP, "TOPLEFT", 3, -3)
DCPT:SetPoint("BOTTOMRIGHT", DCP, "BOTTOMRIGHT", -3, 3)
DCPT:SetTexCoord(0.08, 0.92, 0.08, 0.92)
```

删除 `DCPT:SetAllPoints(DCP)`。外框只能使用现有 GWUI API；`GW` 或模板不存在时仍显示内缩、裁切后的图标，不报错。

- [ ] **Step 4: 在现有外观参数区添加下拉设置**

```lua
local optShowSpellName = panel:AddOption("显示技能名称", "在闪烁的图标旁显示技能名称", {
    getter = function() return db.showSpellName end,
    setter = function(value) db.showSpellName = value; CooldownPulse.RefreshLocals() end,
    getDefault = function() return CooldownPulse.defaults.showSpellName end,
    dependence = dep,
})
if optShowSpellName then optShowSpellName.optionName = "GW2PlusCooldownPulse_ShowSpellName" end

panel:AddOptionDropdown("技能名称位置", "设置技能名称相对闪烁图标的位置。", {
    optionsList = {"TOP", "CENTER", "BOTTOM"},
    optionNames = {"上方", "居中", "下方"},
    getter = function() return db.spellNamePosition end,
    setter = function(value)
        db.spellNamePosition = value
        CooldownPulse.RefreshLocals()
    end,
    getDefault = function() return CooldownPulse.defaults.spellNamePosition end,
    dependence = {
        ["GW2PlusCooldownPulse_Enable"] = true,
        ["GW2PlusCooldownPulse_ShowSpellName"] = true,
    },
})
```

将下拉框放在“显示技能名称”开关之后，使名称位置只在总开关和“显示技能名称”均启用时可编辑。

- [ ] **Step 5: 运行回归检查并确认通过**

Run: `sh tests/cooldown_pulse_gwui_regression.sh`

Expected: 输出 `冷却闪烁 GWUI 样式回归检查通过`，退出码为 0。

- [ ] **Step 6: 提交实现**

```sh
git add Modules/CooldownPulse/CooldownPulse.lua Modules/CooldownPulse/Options.lua tests/cooldown_pulse_gwui_regression.sh
git commit -m "feat: 统一冷却闪烁 GWUI 样式"
```

### Task 3: 游戏内验证

**Files:**
- Modify: 无
- Test: `tests/cooldown_pulse_gwui_regression.sh`

- [ ] **Step 1: 重载界面并检查测试提示**

在游戏中执行 `/reload`，打开“附加组件 → 冷却闪烁”，点击“解锁 / 测试”。确认图标有 GWUI 深色细边框，图标内容未触及外框，且仍可拖动。

- [ ] **Step 2: 检查三个名称位置**

依次开启“显示技能名称”，选择“上方”“居中”“下方”，每次点击“解锁 / 测试”。确认名称分别显示在图标上沿外侧、图标中央和图标下沿外侧；关闭名称开关后不显示文字。

- [ ] **Step 3: 检查冷却完成动画**

锁定测试提示后，确认测试图标仍按原有设置淡入、缩放和淡出。实际释放一个冷却超过两秒的技能，确认完成时出现同样的 GWUI 图标提示。

- [ ] **Step 4: 最终静态验证**

Run: `sh tests/cooldown_pulse_gwui_regression.sh && git diff --check`

Expected: 回归检查通过，`git diff --check` 无输出且退出码为 0。
