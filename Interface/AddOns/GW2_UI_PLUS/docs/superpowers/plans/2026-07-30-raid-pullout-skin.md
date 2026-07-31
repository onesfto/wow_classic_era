# 拖出职业团队窗口皮肤 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将暴雪原生 `RaidPullout` 职业团队窗口改成已确认的 1.5 倍宽 GW2_UI 风格，并保留全部原生行为。

**Architecture:** 在 `social/raidList.lua` 中增加两个幂等皮肤函数：一个处理拉出窗口容器，一个处理原生成员按钮。通过 `RaidPullout_GetFrame` 和 `RaidPullout_Update` 的安全钩子覆盖新建与更新路径，不接管成员数据。

**Tech Stack:** World of Warcraft Lua、Blizzard_RaidUI、GW2_UI 背景与 `gwstatusbar.png` 状态条资源、现有 Lua 源码断言测试。

---

### Task 1: 添加拉出窗口布局回归测试

**Files:**
- Modify: `tests/SocialLayout_test.lua`

- [ ] **Step 1: 写失败测试**

在团队页面断言后增加：

```lua
assert(raidSource:find("local RAID_PULLOUT_WIDTH_SCALE = 1.5", 1, true)
    and raidSource:find("pullout:SetWidth(pullout.gwOriginalWidth * RAID_PULLOUT_WIDTH_SCALE)", 1, true),
    "拖出职业窗口宽度应为原生宽度的 1.5 倍")
assert(raidSource:find("pullout:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder, true)", 1, true),
    "拖出职业窗口应使用 PLUS 小边框")
assert(raidSource:find("healthBar:SetStatusBarTexture(GW_STATUSBAR_TEXTURE)", 1, true)
    and raidSource:find("manaBar:SetStatusBarTexture(GW_STATUSBAR_TEXTURE)", 1, true),
    "成员血条和法力条应使用 GW2_UI 状态条材质")
assert(raidSource:find('nameText:SetPoint("CENTER", healthBar, "CENTER", 0, 0)', 1, true),
    "成员名字应居中覆盖在血条上")
```

- [ ] **Step 2: 验证测试因功能尚未实现而失败**

运行：`lua tests/SocialLayout_test.lua`

预期：以“拖出职业窗口宽度应为原生宽度的 1.5 倍”失败。

### Task 2: 实现容器与成员条皮肤

**Files:**
- Modify: `social/raidList.lua`
- Test: `tests/SocialLayout_test.lua`

- [ ] **Step 1: 增加共享常量和幂等皮肤函数**

实现 `SkinRaidPulloutFrame(pullout)` 和 `SkinRaidPulloutMember(button)`：

```lua
local RAID_PULLOUT_WIDTH_SCALE = 1.5
local GW_STATUSBAR_TEXTURE = "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar.png"

local function SkinRaidPulloutFrame(pullout)
    if not pullout then return end
    if not pullout.gwPlusSkinned then
        pullout.gwPlusSkinned = true
        pullout.gwOriginalWidth = pullout:GetWidth()
        pullout:GwStripTextures()
        pullout:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder, true)
    end
    pullout:SetWidth(pullout.gwOriginalWidth * RAID_PULLOUT_WIDTH_SCALE)
end
```

成员函数剥离原生条纹理，设置 `gwstatusbar.png`，将血条和法力条锚定到成员按钮左右边缘，并将名字锚定到血条中心。只调整展示属性，不覆盖原生值和颜色更新。

- [ ] **Step 2: 钩住原生创建和更新入口**

```lua
hooksecurefunc("RaidPullout_GetFrame", function()
    for i = 1, (_G.NUM_RAID_PULLOUT_FRAMES or 0) do
        SkinRaidPulloutFrame(_G["RaidPullout" .. i])
    end
end)

hooksecurefunc("RaidPullout_Update", function(pullout)
    SkinRaidPulloutFrame(pullout)
    local frameName = pullout:GetName()
    for i = 1, (pullout.numPulloutButtons or 0) do
        SkinRaidPulloutMember(_G[frameName .. "Button" .. i])
    end
end)
```

- [ ] **Step 3: 运行专项测试**

运行：`lua tests/SocialLayout_test.lua`

预期：输出 `SocialLayout_test: OK`。

- [ ] **Step 4: 运行语法与差异检查**

运行：

```bash
luac -p social/raidList.lua
git diff --check -- social/raidList.lua tests/SocialLayout_test.lua
```

预期：退出码为 0，无错误输出。

### Task 3: 完成审计

**Files:**
- Inspect: `social/raidList.lua`
- Inspect: `tests/SocialLayout_test.lua`

- [ ] **Step 1: 对照设计逐项核验**

确认宽度倍率、PLUS 外框、GW2_UI 状态条材质、名字居中、原生更新逻辑未被替换、幂等标记均有源码证据。

- [ ] **Step 2: 重新运行完整专项验证**

运行：

```bash
lua tests/SocialLayout_test.lua &&
luac -p social/raidList.lua social/friendsFrame.lua social/whoList.lua social/guildList.lua &&
git diff --check -- social/raidList.lua tests/SocialLayout_test.lua
```

预期：测试输出 `SocialLayout_test: OK`，命令退出码为 0。
