# 插件悬浮按钮独立入口 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 让插件悬浮按钮独立于微缩地图，并可插入微型系统菜单的首位或末位。

**Architecture:** `AddonFlyout.lua` 维护自己的 `GwPlusAddonFlyoutToggle`，以 `GwAddonToggle` 模板复用图标和容器，但不再读取或控制上游的 `GwAddonToggle`。小地图位置仍锚定 `Minimap`；两个系统菜单位置将独立入口插入 `Gw2MicroBarFrame.cf`，并在上游重排微型菜单后重新应用。

**Tech Stack:** WoW Classic Lua 5.1、GW2_UI 框架模板、POSIX shell 静态回归检查。

---

## 文件结构

- 修改：`Modules/Minimap/AddonFlyout.lua` — 独立入口、微型菜单插入、恢复布局与延迟刷新。
- 修改：`Modules/Minimap/Options.lua` — 两个新位置的设置文案和下拉值。
- 新增：`tests/minimap_addon_flyout_regression.sh` — 关键结构和设置选项的回归检查。

### Task 1: 先建立会失败的回归检查

**Files:**
- Create: `tests/minimap_addon_flyout_regression.sh`
- Test: `tests/minimap_addon_flyout_regression.sh`

- [ ] **Step 1: 写入失败测试**

```sh
#!/bin/sh
set -eu

flyout_file="Modules/Minimap/AddonFlyout.lua"
options_file="Modules/Minimap/Options.lua"

grep -F 'local toggleName = "GwPlusAddonFlyoutToggle"' "$flyout_file" >/dev/null
grep -F 'MICROBAR_LEFT = true' "$flyout_file" >/dev/null
grep -F 'MICROBAR_RIGHT = true' "$flyout_file" >/dev/null
grep -F 'CreateFrame("Button", toggleName, UIParent, "GwAddonToggle")' "$flyout_file" >/dev/null
grep -F 'hooksecurefunc("UpdateMicroButtons", QueueMicrobarRefresh)' "$flyout_file" >/dev/null
grep -F 'Gw2MicroBarFrame' "$flyout_file" >/dev/null
if grep -F '_G.GwAddonToggle' "$flyout_file" >/dev/null; then
    exit 1
fi

grep -F '"MICROBAR_LEFT", "MICROBAR_RIGHT"' "$options_file" >/dev/null
grep -F '"系统菜单左边", "系统菜单右边"' "$options_file" >/dev/null

printf '%s\n' '插件悬浮按钮独立入口回归检查通过'
```

- [ ] **Step 2: 运行测试并确认失败**

Run: `sh tests/minimap_addon_flyout_regression.sh`

Expected: 以非零状态退出，因为尚未定义独立入口名称和系统菜单位置。

### Task 2: 将入口与小地图解耦

**Files:**
- Modify: `Modules/Minimap/AddonFlyout.lua:8-20, 311-367, 386-421`
- Test: `tests/minimap_addon_flyout_regression.sh`

- [ ] **Step 1: 添加位置分类与独立入口名称**

在 `defaultPosition` 后定义：

```lua
local toggleName = "GwPlusAddonFlyoutToggle"
local microbarPositions = {
    MICROBAR_LEFT = true,
    MICROBAR_RIGHT = true,
}
```

`Flyout.GetPosition()` 必须接受 `positionAnchors[position]` 或 `microbarPositions[position]`；其他值仍回退到 `LEFT`，以保持旧的保存变量可用。

- [ ] **Step 2: 让 `EnsureToggle` 只创建和返回本模块入口**

将旧的全局 `GwAddonToggle` 查找替换为：

```lua
local function EnsureToggle()
    local toggle = _G[toggleName]
    if not toggle then
        toggle = CreateFrame("Button", toggleName, UIParent, "GwAddonToggle")
    end
    if not toggle or not toggle.container then return nil end
    -- 保留现有 OnClick、容器背景和拥有标记初始化。
    return toggle
end

function Flyout.GetToggle()
    return _G[toggleName]
end
```

将按钮和三种纹理尺寸统一设为 24×24，仅在系统菜单位置使用；小地图位置保留 38×38。不要读取、隐藏、重设父级或改写 `_G.GwAddonToggle`。

- [ ] **Step 3: 运行测试，确认仍失败**

Run: `sh tests/minimap_addon_flyout_regression.sh`

Expected: 仍失败，因为系统菜单布局和设置选项尚未加入。

### Task 3: 实现系统菜单首尾插入及安全恢复

**Files:**
- Modify: `Modules/Minimap/AddonFlyout.lua:311-421`
- Test: `tests/minimap_addon_flyout_regression.sh`

- [ ] **Step 1: 定义微型菜单布局帮助函数**

增加以下职责明确的本地函数：

```lua
local function GetMicrobar()
    local frame = _G.Gw2MicroBarFrame
    return frame and frame.cf, frame
end

local function GetMicrobarEndpoints(microbar, toggle)
    local first, last
    for _, child in ipairs({microbar:GetChildren()}) do
        if child ~= toggle and child:IsShown()
            and child.IsObjectType and child:IsObjectType("Button") then
            if not first or child:GetLeft() < first:GetLeft() then first = child end
            if not last or child:GetRight() > last:GetRight() then last = child end
        end
    end
    return first, last
end
```

仅在端点和 `GetLeft` / `GetRight` 均有效时改变锚点。首次进入系统菜单模式时记录 `Gw2MicroBarFrame` 的原宽度；退出该模式时恢复该宽度并调用 `UpdateMicroButtons()`，由上游恢复原有按钮链。

- [ ] **Step 2: 实现两种插入位置与容器锚点**

新增 `ApplyMicrobarPosition(toggle, position)`：

```lua
if position == "MICROBAR_LEFT" then
    toggle:SetPoint("BOTTOMLEFT", microbar, "BOTTOMLEFT", 0, 0)
    first:ClearAllPoints()
    first:SetPoint("BOTTOMLEFT", toggle, "BOTTOMRIGHT", 4, 0)
else
    toggle:SetPoint("BOTTOMLEFT", last, "BOTTOMRIGHT", 4, 0)
end
```

将包含微型菜单的外框宽度增加 28 像素，使新增的 24 像素按钮和 4 像素间距位于菜单背景内。入口容器在这两种模式下锚定在按钮下方：左侧模式为 `TOPLEFT` 对 `BOTTOMLEFT`，右侧模式为 `TOPRIGHT` 对 `BOTTOMRIGHT`；小地图模式沿用模板的左侧展开方向。

在 `EnsureToggle` 后按 `Flyout.GetPosition()` 分支调用 `ApplyMicrobarPosition` 或原 `positionAnchors` 逻辑。微型菜单还未创建时返回 `false`，由刷新事件稍后重试；不将此情况视为禁用。

- [ ] **Step 3: 在上游重排后重新插入**

定义并只注册一次：

```lua
local pendingMicrobarRefresh = false
local function QueueMicrobarRefresh()
    if not microbarPositions[Flyout.GetPosition()] then return end
    if InCombatLockdown() then
        QueueRefresh()
        return
    end
    if pendingMicrobarRefresh then return end
    pendingMicrobarRefresh = true
    C_Timer.After(0, function()
        pendingMicrobarRefresh = false
        Flyout.Refresh()
    end)
end
```

在 `Gw2MicroBarFrame` 可用后执行 `hooksecurefunc("UpdateMicroButtons", QueueMicrobarRefresh)`。不要在钩子中直接调用 `UpdateMicroButtons()`，避免递归重排。

- [ ] **Step 4: 运行测试并确认设置断言仍失败**

Run: `sh tests/minimap_addon_flyout_regression.sh`

Expected: 入口与微型菜单相关断言通过，但脚本仍以非零状态退出，因为两个下拉选项尚未加入。

### Task 4: 暴露新位置并执行完整回归

**Files:**
- Modify: `Modules/Minimap/Options.lua:58-72`
- Test: `tests/minimap_addon_flyout_regression.sh`, `tests/frame_settings_regression.sh`, `tests/party_settings_regression.sh`

- [ ] **Step 1: 扩展位置下拉框**

将 `optionsList` 和 `optionNames` 的尾部同步扩展为：

```lua
optionsList = {
    "TOPLEFT", "TOP", "TOPRIGHT", "LEFT", "RIGHT",
    "BOTTOMLEFT", "BOTTOM", "BOTTOMRIGHT",
    "MICROBAR_LEFT", "MICROBAR_RIGHT",
},
optionNames = {
    "左上", "上", "右上", "左中", "右中",
    "左下", "下", "右下",
    "系统菜单左边", "系统菜单右边",
},
```

同步把位置说明改为“插件悬浮入口的位置；可置于小地图周围或插入系统菜单。”

- [ ] **Step 2: 运行全部静态回归检查**

Run:

```sh
sh tests/minimap_addon_flyout_regression.sh
sh tests/frame_settings_regression.sh
sh tests/party_settings_regression.sh
git diff --check
```

Expected: 三个脚本分别输出“插件悬浮按钮独立入口回归检查通过”“框体设置回归检查通过”“队伍设置回归检查通过”，且 `git diff --check` 无输出、状态 0。

- [ ] **Step 3: 检查需求逐项满足**

确认：独立按钮不读取 `_G.GwAddonToggle`；旧 8 个位置仍在 `positionAnchors`；新位置可接受且在下拉框可选；切换/禁用调用上游重排来恢复菜单；战斗中只排队刷新。

- [ ] **Step 4: 提交实现**

```sh
git add Modules/Minimap/AddonFlyout.lua Modules/Minimap/Options.lua \
  tests/minimap_addon_flyout_regression.sh
git commit -m "feat: 插件悬浮按钮支持系统菜单位置"
```
