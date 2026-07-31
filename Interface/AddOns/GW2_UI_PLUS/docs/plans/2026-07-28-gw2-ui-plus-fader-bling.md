# GW2 UI Plus Fader Bling Optimization Implementation Plan

> 本文档随 GW2 UI Plus 插件保存。

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 在动作条全局渐隐到 alpha 0.5 或更低时关闭参与按钮的冷却 Bling，并在全亮、取消参与或关闭功能时恢复。

**Architecture:** 保留现有统一 `fadeParent` 和状态机。在 `Fader.lua` 内增加按目标遍历按钮及同步 Bling 的小函数，由 `FadeTo` 和目标交还路径调用；不修改 GW2 UI 本体。

**Tech Stack:** World of Warcraft Lua API、Lua 5.1 兼容代码、本地 Lua mock 回归测试。

---

### Task 1: 建立 Bling 状态回归测试

**Files:**
- Create: `Interface/AddOns/GW2_UI_PLUS/tests/FaderBling_test.lua`
- Test: `Interface/AddOns/GW2_UI_PLUS/tests/FaderBling_test.lua`

- [ ] **Step 1: 编写失败测试**

用 WoW Frame mock 加载 `ActionBar/Fader.lua`，创建带 `cooldown:SetDrawBling` 记录器的主动作条按钮，依次断言：

```lua
assert(button.cooldown.drawBling == false, "alpha 0.5 淡出时应关闭 Bling")
combat = true
addonTable.PlusFader.EvaluateState()
assert(button.cooldown.drawBling == true, "恢复全亮时应开启 Bling")
db.fadeAlpha = 0.6
combat = false
addonTable.PlusFader.EvaluateState()
assert(button.cooldown.drawBling == true, "alpha 大于 0.5 时应保留 Bling")
db.fadeEnable = false
addonTable.PlusFader.Refresh()
assert(button.cooldown.drawBling == true, "关闭全局渐隐时应恢复 Bling")
```

- [ ] **Step 2: 运行测试并确认失败**

Run: `lua tests/FaderBling_test.lua`

Expected: FAIL，第一条断言得到 `nil` 或 `true`，证明当前实现没有同步 Bling。

### Task 2: 实现参与动作条的 Bling 同步

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/Modules/ActionBar/Fader.lua`
- Test: `Interface/AddOns/GW2_UI_PLUS/tests/FaderBling_test.lua`

- [ ] **Step 1: 增加按钮遍历与状态同步**

在 `Fader.lua` 中加入目标按钮遍历函数，支持 `gw_Buttons`、姿态条 `buttons`、宠物按钮和 `PlusMageBar.buttons`，并只处理当前由 `fader` 接管的目标：

```lua
local function SetButtonBling(button, enabled)
    if button and button.cooldown and button.cooldown.SetDrawBling then
        button.cooldown:SetDrawBling(enabled)
    end
end

local function SetTargetBlings(target, enabled)
    local frame = _G[target.frame]
    if frame and frame.gw_Buttons then
        for i = 1, 12 do
            SetButtonBling(frame.gw_Buttons[i], enabled)
        end
    elseif target.key == "fadeStanceBar" and frame and frame.buttons then
        for _, button in ipairs(frame.buttons) do
            SetButtonBling(button, enabled)
        end
    elseif target.key == "fadePetBar" then
        for i = 1, (NUM_PET_ACTION_SLOTS or 10) do
            SetButtonBling(_G["PetActionButton" .. i], enabled)
        end
    elseif target.key == "fadeMageBar" and addonTable.PlusMageBar then
        for _, button in ipairs(addonTable.PlusMageBar.buttons or {}) do
            SetButtonBling(button, enabled)
        end
    end
end

UpdateBlingState = function(alpha)
    local enabled = alpha > 0.5
    for _, target in ipairs(TARGETS) do
        local frame = _G[target.frame]
        if db[target.key] and frame and frame:GetParent() == fader then
            SetTargetBlings(target, enabled)
        end
    end
end
```

- [ ] **Step 2: 接入渐隐和目标交还**

在 `FadeTo` 开始时调用 `UpdateBlingState(targetAlpha)`；在目标不再由渐隐父框体接管时先调用 `SetTargetBlings(target, true)`，确保配置切换不会残留关闭状态。

- [ ] **Step 3: 运行回归测试**

Run: `lua tests/FaderBling_test.lua`

Expected: `FaderBling_test: OK`

- [ ] **Step 4: 检查 Lua 语法**

Run: `luac -p ActionBar/Fader.lua tests/FaderBling_test.lua`

Expected: exit code 0，无输出。

### Task 3: 文档与最终核验

**Files:**
- Modify: `Interface/AddOns/GW2_UI_PLUS/Modules/ActionBar/README.md`

- [ ] **Step 1: 记录与 NDui/ElvUI 一致的 Bling 阈值**

在全局渐隐章节说明 alpha ≤ 0.5 时关闭参与按钮的冷却完成闪光，全亮或退出接管时恢复。

- [ ] **Step 2: 执行完整验证**

Run:

```bash
lua tests/FaderBling_test.lua
luac -p ActionBar/Fader.lua tests/FaderBling_test.lua
```

Expected: 测试输出 `FaderBling_test: OK`，语法检查 exit code 0。

- [ ] **Step 3: 游戏内验证**

执行 `/reload`，设置全局渐隐 alpha 为 0.5 并全选动作条，等待淡出稳定后复测“脱光→穿上”；鼠标移入后确认冷却完成闪光恢复。
