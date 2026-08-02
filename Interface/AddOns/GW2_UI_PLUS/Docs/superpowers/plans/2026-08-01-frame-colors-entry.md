# 框体颜色入口迁移 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将原生「单位框体 → 综合」迁移为 Plus「框体」标签页中的顶层「框体颜色」入口。

**Architecture:** `HideNativeSettings.lua` 从原生菜单数据中捕获 `unitframes_general` 及同属的经典服单位框体页面，并移除其原生父菜单。`Settings.lua` 从已捕获页面中展示 `unitframes_general`，并通过现有 `CaptureFrame` / `RestoreFrame` 生命周期保持原生设置控件和回调不变。

**Tech Stack:** WoW Classic Lua 5.1、GW2_UI 设置面板 API、POSIX shell 回归脚本。

---

### Task 1: 为框体颜色迁移添加回归断言

**Files:**
- Modify: `tests/frame_settings_regression.sh`

- [ ] **Step 1: 写入失败断言**

在玩家/团队隐藏断言之后加入：

```sh
grep -F 'unitframes_general = true,' "$hide_native_file" >/dev/null
grep -F 'local function HideNativeUnitFrameSettings(settingsTab, embeddedPanels, provider)' "$hide_native_file" >/dev/null
grep -F 'HideNativeUnitFrameSettings(settingsTab, embeddedPanels, provider)' "$hide_native_file" >/dev/null
grep -F 'unitframes_general = {header = "框体", breadcrumb = "框体颜色", sub = "编辑全局单位框体颜色。"}' "$settings_file" >/dev/null
grep -F 'CreateMenuButton("框体颜色", "unitframes_general", false)' "$settings_file" >/dev/null
```

- [ ] **Step 2: 确认断言失败**

运行：`sh tests/frame_settings_regression.sh`

预期：以非零状态退出；因为尚未定义 `HideNativeUnitFrameSettings` 和「框体颜色」入口。

### Task 2: 捕获并隐藏原生单位框体菜单

**Files:**
- Modify: `Modules/Settings/HideNativeSettings.lua:14-23`
- Modify: `Modules/Settings/HideNativeSettings.lua:267-308`

- [ ] **Step 1: 声明经典服单位框体面板 ID**

在 `NATIVE_RAID_PANEL_IDS` 后加入：

```lua
local NATIVE_UNITFRAME_PANEL_IDS = {
    unitframes_general = true,
    player_pet = true,
    target_general = true,
    target_of_target = true,
    party_general = true,
}
```

- [ ] **Step 2: 添加菜单过滤函数**

在 `HideNativePlayerSettings` 后加入：

```lua
local function HideNativeUnitFrameSettings(
    settingsTab, embeddedPanels, provider)
    if not provider then
        local scrollBox = settingsTab and settingsTab.menu
            and settingsTab.menu.ScrollBox
        provider = scrollBox and scrollBox:GetDataProvider()
    end
    if not provider then return end

    local unitFrameParent
    provider:ForEach(function(data)
        local frame = data.isSubCat and data.itemData and data.itemData.frame
        if frame and NATIVE_UNITFRAME_PANEL_IDS[frame.panelId] then
            unitFrameParent = data.parent
        end
    end)
    if not unitFrameParent then return provider end

    local filtered = CreateDataProvider()
    provider:ForEach(function(data)
        local frame = data.isSubCat and data.itemData and data.itemData.frame
        if data.itemData ~= unitFrameParent
            and data.parent ~= unitFrameParent then
            filtered:Insert(data)
        elseif frame and frame.panelId then
            embeddedPanels[frame.panelId] = frame
        end
    end)
    return filtered
end
```

- [ ] **Step 3: 在框体设置准备流程中串联过滤器**

将：

```lua
local provider = HideNativePlayerSettings(settingsTab, embeddedPanels)
provider = HideNativeRaidSettings(settingsTab, embeddedPanels, provider)
```

改为：

```lua
local provider = HideNativePlayerSettings(settingsTab, embeddedPanels)
provider = HideNativeUnitFrameSettings(
    settingsTab, embeddedPanels, provider)
provider = HideNativeRaidSettings(settingsTab, embeddedPanels, provider)
```

### Task 3: 在 Plus 框体主菜单展示框体颜色

**Files:**
- Modify: `Modules/Settings/Settings.lua:7-26`
- Modify: `Modules/Settings/Settings.lua:111-117`
- Modify: `Modules/Settings/Settings.lua:1626-1641`

- [ ] **Step 1: 将页面加入必需页面列表和显示文案映射**

在 `REQUIRED_PAGE_IDS` 的 `player_general` 前加入：

```lua
"unitframes_general",
```

在 `FRAME_PANEL_TEXT` 中加入：

```lua
unitframes_general = {
    header = "框体",
    breadcrumb = "框体颜色",
    sub = "编辑全局单位框体颜色。",
},
```

- [ ] **Step 2: 增加顶层菜单入口**

在创建「宠物」及其子项之后加入：

```lua
CreateMenuButton("框体颜色", "unitframes_general", false)
```

该按钮不传 `parentKey`，因此现有 `LayoutButtons` 会把它作为始终可见的顶层菜单项，并且 `SelectPage` 会复用已有面板捕获与恢复逻辑。

### Task 4: 验证迁移

**Files:**
- Test: `tests/frame_settings_regression.sh`
- Test: `tests/party_settings_regression.sh`
- Test: `Modules/Settings/HideNativeSettings.lua`
- Test: `Modules/Settings/Settings.lua`

- [ ] **Step 1: 运行语法和回归检查**

运行：

```sh
luac -p Modules/Settings/HideNativeSettings.lua
luac -p Modules/Settings/Settings.lua
sh tests/frame_settings_regression.sh
sh tests/party_settings_regression.sh
git diff --check -- Modules/Settings/HideNativeSettings.lua Modules/Settings/Settings.lua tests/frame_settings_regression.sh
```

预期：全部命令以零状态退出，两个回归脚本分别输出「框体设置回归检查通过」和「队伍设置回归检查通过」。

- [ ] **Step 2: 进行模拟菜单验证**

以 `unitframes_general`、`target_general`、`party_general` 子条目与无关条目构造 `CreateDataProvider` 模拟数据，调用 `PrepareUnitFrameSettings` 后确认：单位框体父条目和三个子条目均被移除，无关条目仍保留，且 `gwPlusEmbeddedPanels.unitframes_general` 指向原始面板。

- [ ] **Step 3: 提交实现**

```sh
git add Modules/Settings/HideNativeSettings.lua Modules/Settings/Settings.lua tests/frame_settings_regression.sh
git commit -m "feat: 迁移框体颜色设置入口"
```
