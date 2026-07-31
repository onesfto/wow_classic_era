# 社交与公会布局修复实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 修正经典旧世“谁在线”和公会页面的布局，并为公会信息弹窗应用 GW2_UI_PLUS 皮肤。

**Architecture:** 保留暴雪现有社交窗口和更新流程，只在经典旧世分支统一锚点、列定义与可见行数。公会页复用暴雪现有行模板补足缺失行；公会信息弹窗复用 GW2_UI 的标准背景、按钮和滚动条 API。

**Tech Stack:** World of Warcraft Classic Era Lua、GW2_UI widget API、独立 Lua 回归测试。

---

### Task 1: 谁在线列表边界与对齐

**Files:**
- Modify: `social/whoList.lua`
- Test: `tests/SocialLayout_test.lua`

- [x] **Step 1: 写入失败断言**

```lua
assert(source:find("WHOS_TO_DISPLAY = 29", 1, true))
assert(source:find('WhoListScrollFrameScrollBar:SetPoint("TOPLEFT"', 1, true))
assert(source:find('header:GetName() .. "Text"', 1, true))
```

- [x] **Step 2: 运行测试确认 RED**

Run: `lua tests/SocialLayout_test.lua`

Expected: FAIL，提示谁在线列表仍使用 30 行或缺少滚动条/列头锚点。

- [x] **Step 3: 实施最小布局修复**

将经典旧世可见行数调整为 29；列头优先取得命名 FontString，使“地区”标题与对应数据使用同一内缩；取消滚动区域冲突的固定高度，并把滚动条锚定到列表右边界，使其中心线与关闭按钮一致。

- [x] **Step 4: 运行测试确认 GREEN**

Run: `lua tests/SocialLayout_test.lua`

Expected: PASS。

### Task 2: 公会成员列表扩展与列对齐

**Files:**
- Modify: `social/guildList.lua`
- Test: `tests/SocialLayout_test.lua`

- [x] **Step 1: 写入失败断言**

```lua
assert(source:find("local CLASSIC_GUILD_MEMBERS_TO_DISPLAY = 22", 1, true))
assert(source:find('CreateFrame("Button", "GuildFrameButton" .. i', 1, true))
assert(source:find("LayoutClassicGuildFrameButton(button)", 1, true))
```

- [x] **Step 2: 运行测试确认 RED**

Run: `lua tests/SocialLayout_test.lua`

Expected: FAIL，提示公会列表未扩展或行数据尚未按列定义布局。

- [x] **Step 3: 实施最小布局修复**

仅在经典旧世创建第 14–22 行，补齐成员视图和状态视图；将列头、等级、职业图标、名字、地区数据统一由同一组列常量定位；把公会说明和统计信息移到扩展列表下方。

- [x] **Step 4: 运行测试确认 GREEN**

Run: `lua tests/SocialLayout_test.lua`

Expected: PASS。

### Task 3: 公会信息弹窗皮肤

**Files:**
- Modify: `social/guildList.lua`
- Test: `tests/SocialLayout_test.lua`

- [x] **Step 1: 写入失败断言**

```lua
assert(source:find("local function SkinClassicGuildInfoFrame()", 1, true))
assert(source:find("GuildInfoFrame:GwCreateBackdrop", 1, true))
assert(source:find("GuildInfoCloseButton:GwSkinButton(true", 1, true))
```

- [x] **Step 2: 运行测试确认 RED**

Run: `lua tests/SocialLayout_test.lua`

Expected: FAIL，提示公会信息弹窗没有 PLUS 皮肤入口。

- [x] **Step 3: 实施最小皮肤修复**

剥离弹窗和正文框原版材质，应用标准背景；皮肤化关闭按钮、滚动条、记录/接受/关闭按钮，并用幂等标记防止重复处理。

- [x] **Step 4: 完整验证**

Run:

```bash
lua tests/SocialLayout_test.lua
for file in tests/*_test.lua; do lua "$file"; done
luac -p social/whoList.lua social/guildList.lua
git diff --check -- Interface/AddOns/GW2_UI_PLUS/social Interface/AddOns/GW2_UI_PLUS/tests
```

Expected: 所有命令退出码为 0。
