# 框体标题布局 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 仅在 Plus「框体」标签页中，让大标题完整显示，并将非空小标题固定在其右侧 36 像素处。

**Architecture:** 在 `Settings.lua` 的现有 `SetPanelText` 集中处理标题宽度和小标题锚点。该函数已经服务玩家、目标、目标的目标、宠物和框体颜色页面，因此无需修改各页面定义、GW2_UI 模板或其他 Plus 设置模块。

**Tech Stack:** WoW Classic Lua 5.1、GW2_UI `GwSettingsPanelTmpl`、POSIX shell 回归脚本。

---

### Task 1: 为框体标题布局添加失败断言

**Files:**
- Modify: `tests/frame_settings_regression.sh`

- [ ] **Step 1: 写入布局断言**

在 `SetPanelText` 相关断言之后加入：

```sh
grep -F 'local PANEL_BREADCRUMB_GAP = 36' "$settings_file" >/dev/null
grep -F 'panel.header:GetUnboundedStringWidth()' "$settings_file" >/dev/null
grep -F 'panel.breadcrumb:ClearAllPoints()' "$settings_file" >/dev/null
grep -F 'panel.breadcrumb:SetPoint(' "$settings_file" >/dev/null
grep -F 'PANEL_BREADCRUMB_GAP, 0)' "$settings_file" >/dev/null
```

- [ ] **Step 2: 确认断言失败**

运行：`sh tests/frame_settings_regression.sh`

预期：以非零状态退出；当前实现仍使用 `header:GetStringWidth() + 36`，且未重新锚定小标题。

### Task 2: 统一框体标题和小标题布局

**Files:**
- Modify: `Modules/Settings/Settings.lua:228-239`

- [ ] **Step 1: 定义小标题固定间距**

在 `SetPanelText` 前加入：

```lua
local PANEL_BREADCRUMB_GAP = 36
```

- [ ] **Step 2: 以完整文本宽度设置大标题，并重锚定非空小标题**

将 `SetPanelText` 替换为：

```lua
local function SetPanelText(panel, header, breadcrumb, sub)
    if not panel then return end
    if panel.header then
        panel.header:SetText(header)
        local width = panel.header.GetUnboundedStringWidth
            and panel.header:GetUnboundedStringWidth()
            or panel.header:GetStringWidth()
        panel.header:SetWidth(width)
    end
    if panel.breadcrumb then
        panel.breadcrumb:SetText(breadcrumb or "")
        panel.breadcrumb:ClearAllPoints()
        if breadcrumb and breadcrumb ~= "" and panel.header then
            panel.breadcrumb:SetPoint(
                "LEFT", panel.header, "RIGHT", PANEL_BREADCRUMB_GAP, 0)
        end
    end
    if panel.sub then
        panel.sub:SetText(sub)
    end
end
```

### Task 3: 验证并提交

**Files:**
- Test: `Modules/Settings/Settings.lua`
- Test: `tests/frame_settings_regression.sh`

- [ ] **Step 1: 运行语法与回归检查**

运行：

```sh
luac -p Modules/Settings/Settings.lua
sh tests/frame_settings_regression.sh
sh tests/party_settings_regression.sh
git diff --check -- Modules/Settings/Settings.lua tests/frame_settings_regression.sh
```

预期：所有命令以零状态退出，两个脚本分别输出「框体设置回归检查通过」和「队伍设置回归检查通过」。

- [ ] **Step 2: 提交实现**

```sh
git add Modules/Settings/Settings.lua tests/frame_settings_regression.sh
git commit -m "feat: 统一框体标题布局"
```
