# GW2_UI_PLUS 设置系统架构文档

**最后更新**: 2026-08-01  
**版本**: v404r.260331

---

## 目录

1. [概览](#概览)
2. [主菜单标签页结构](#主菜单标签页结构)
3. [核心模块](#核心模块)
4. [技术实现](#技术实现)
5. [扩展指南](#扩展指南)

---

## 概览

GW2_UI_PLUS 的设置系统基于 GW2_UI 原生设置框架构建，通过自定义标签页和面板嵌入机制，实现了对原生设置的扩展和重组。

### 设计目标

1. **模块化组织** - 按功能分组（框体/动作条/队伍/组件/编辑界面）
2. **无缝集成** - 复用 GW2_UI 原生面板，避免重复开发
3. **统一入口** - 将分散的原生设置集中到逻辑清晰的标签页
4. **直接操作** - 编辑界面按钮直接触发功能，无中间页面

### 架构特点

- **面板嵌入** (`CaptureFrame`/`RestoreFrame`) - 原生面板可在多个标签间共享
- **菜单隐藏** (`HideNativeSettings`) - 过滤原生设置菜单中的重复/已迁移项
- **动态排序** (`ArrangeSettingsTabs`) - 自定义标签顺序和图标状态
- **延迟初始化** (`AddSettingsPanel`) - 确保子面板 ScrollBox 正确渲染

---

## 主菜单标签页结构

GW2_UI_PLUS 在 GW2_UI 设置窗口左侧标签栏注入了 6 个自定义标签页：

| 序号 | 标签名称 | PanelName | 图标 | 功能 |
|------|---------|-----------|------|------|
| 1 | **框体** | `GwSettingsUnitFrames` | `tabicon_profile.png` | 玩家/目标/宠物/小队单位框架设置 |
| 2 | **动作条** | `GwSettingsActionBar` | `tabicon_action.png` | 动作条布局和按钮配置 |
| 3 | **队伍** | `GwSettingsParty` | `tabicon_raid.png` | 小队/团队框架设置 |
| 4 | **聊天** | `GwSettingsChat` | `tabicon_chat.png` | 聊天增强、布局、频道和消息管理 |
| 5 | **组件** | `GwSettingsComponents` | `tabicon_addon.png` | 微型菜单/地图/附加组件 |
| 6 | **编辑界面** | `GwSettingsEditMode` | `tabicon_pointer.png` | 直接触发 HUD 元素拖动模式 |

**原生标签保留**：设置 / 综述 / 配置

### 标签页详细说明

#### 1. 框体 (GwSettingsUnitFrames)

**文件**: `Modules/Settings/Settings.lua` → `BuildMainMenuTab()`

**侧菜单结构**:
```
玩家 (可展开)
├─ 综合 (player_general)
├─ 血球和贴图 (gw2_plus_player_globe)
├─ 施法条 (gw2_plus_player_castbar)
├─ 能量条 (gw2_plus_player_energy)
├─ 资源条 (gw2_plus_player_resource)
├─ 经验槽 (gw2_plus_player_xp)
├─ 渐隐 (player_fader)
├─ 增益光环 (player_buff_aura)
└─ 减益光环 (player_debuff_aura)
目标 (target_general)
目标的目标 (target_of_target)
宠物 (player_pet)
小队 (party_general)
```

**技术要点**:
- 使用 `PreparePlayerAuraPanel` 拆分 `player_aura` 为增益/减益两个视图
- 玩家状态相关设置使用 5 个独立面板，每个选项独占一行
- 通过 `CaptureFrame`/`RestoreFrame` 嵌入原生面板
- 隐藏原生面板中的"渐隐"选项组（已由 GW2_UI 统一管理）

#### 2. 动作条 (GwSettingsActionBar)

**文件**: `Modules/ActionBar/Options.lua` → `BuildActionBarTab()`

**功能**: 提供主动作条、额外动作条、姿态栏的完整配置界面

**技术要点**:
- 通过 `HideNativeActionBarSettings` 隐藏原生动作条设置
- 使用 `settingsTab:AddTab()` 直接注册为顶层标签

#### 3. 队伍 (GwSettingsParty)

**文件**: `Modules/Settings/PartyTab.lua` → `BuildPartyTab()`

**侧菜单结构**:
```
队伍 (party_general)
团队 (raid_general)
```

**技术要点**:
- `raid_general` 通过 `REQUIRED_PAGE_IDS` 提前加载
- 使用 `AddMenuEntry` 创建侧菜单按钮
- `ShowPage()` 处理面板切换和高亮状态

#### 4. 聊天 (GwSettingsChat)

**文件**: `Modules/Settings/ChatTab.lua`、`Modules/Settings/ChatCategories.lua`

**侧菜单结构**:
```
聊天增强 (gw2_ui_plus_chat_enhancement)
窗口布局 (gw2_ui_plus_chat_layout)
频道按钮 (gw2_ui_plus_chatbar)
消息管理 (gw2_ui_plus_chat_messages)
```

**技术要点**:
- 将 GW2_UI 原生聊天选项和 GW2_UI_PLUS 聊天窗口选项按职责迁移到三个新页面
- 注销旧来源面板的控件注册项，保证每个设置只有一个可见入口
- 跨页面继续使用原 `optionName`、回调和依赖关系
- 频道按钮保留独立面板，并按基本设置、位置、聊天频道、快捷功能和插件入口分组

#### 5. 组件 (GwSettingsComponents)

**文件**: `Modules/Settings/ComponentsTab.lua` → `BuildComponentsTab()`

**侧菜单结构**:
```
微型菜单 (hud_microbar)
微缩地图 (hud_minimap)
世界地图 (hud_worldmap)
一键换装 (gw2_ui_plus_gearman)
冷却闪烁 (cooldownPulseFrame)
界面皮肤 (skinsFrame)
插件悬浮按钮 (minimapFlyoutFrame)
工具条 (toolbarFrame)
```

**技术要点**:
- 原生HUD面板从 `addonTable.PlusNativePages` 读取
- 自定义子面板从 `addonTable.PlusAddonSubPanels` 读取
- **关键修复**: 必须调用 `settingsTab:AddSettingsPanel(...)` 触发 `InitOptionPanel`，否则子面板 ScrollBox 为空
- 通过 `HideAddonSubPanelsFromNativeMenu` 隐藏原生"附加组件"菜单项

#### 6. 编辑界面 (GwSettingsEditMode)

**文件**: `Modules/Settings/EditModeTab.lua` → `BuildEditModeTab()`

**行为**: 点击图标按钮直接触发 `GW.moveHudObjects(GW.MoveHudScaleableFrame)`

**技术要点**:
- 创建占位 tab frame，但**不插入** `settingsWindow.tabs`
- 覆盖 `tabButton:SetScript("OnClick", ...)` 改为直接执行操作
- 自动隐藏综述页面中的重复"编辑界面"按钮 (`movehudbtn:Hide()`)

---

## 核心模块

### 1. Settings.lua

**职责**: 构建"框体"标签页，提供核心工具函数

**导出API**:
```lua
-- 面板嵌入工具
addonTable.CaptureFrame(frame)  -- 捕获frame的父级和锚点状态
addonTable.RestoreFrame(frame, state)  -- 恢复frame到原始状态

-- 主菜单构建
addonTable.BuildMainMenuTab(settingsTab, settingsWindow)

-- 光环面板准备（供HideNativeSettings使用）
addonTable.PreparePlayerAuraPanel(panel)

-- 标签排序和图标状态修正
addonTable.ArrangeSettingsTabs(settingsWindow)
```

**关键常量**:
```lua
REQUIRED_PAGE_IDS = {
    "player_general", "player_classpower", "player_aura",
    "target_general", "target_of_target", "player_pet",
    "party_general", "raid_general",  -- 队伍/团队
    "hud_microbar", "hud_minimap", "hud_worldmap"  -- 组件
}
```

### 2. HideNativeSettings.lua

**职责**: 从原生设置菜单中过滤掉已迁移/集成的面板

**核心函数**:
```lua
-- 隐藏原生动作条设置（动作条/主动作条/额外动作条/姿态栏）
HideNativeActionBarSettings(settingsTab)

-- 隐藏"附加组件"父条目及其子面板
HideAddonSubPanelsFromNativeMenu(settingsTab)

-- 准备单位框架设置（入口函数，调用上述两个函数）
addonTable.PrepareUnitFrameSettings(settingsTab)
```

**过滤机制**:
- 遍历 `settingsTab.menu.ScrollBox` 的 DataProvider
- 标记需要隐藏的 `itemData`（通过 panelId 或 isAddon 属性）
- 创建新的 `filtered` DataProvider，排除标记项
- 调用 `scrollBox:SetDataProvider(filtered)`

### 3. PartyTab.lua / ComponentsTab.lua

**共同模式**:
```lua
-- 1. 创建侧菜单按钮
local function AddMenuEntry(label, frame)
    local button = CreateFrame("Button", nil, tab.menu, "GwSettingsSettingsTabMenuButtonTemplate")
    -- 设置位置、文本、点击事件
end

-- 2. 面板切换逻辑
local function ShowPage(targetFrame)
    RestoreCurrent()  -- 恢复上一个面板
    currentState = CaptureFrame(targetFrame)  -- 捕获新面板状态
    targetFrame:SetParent(tab)  -- 重新父级
    targetFrame:SetAllPoints(tab)  -- 填充整个内容区域
    -- 更新侧菜单按钮高亮状态
end

-- 3. OnShow 和 callbackOnClose
tab:SetScript("OnShow", function() ShowPage(defaultFrame) end)
tab.callbackOnClose = RestoreCurrent
```

### 4. core.lua

**职责**: 插件入口，初始化所有模块

**初始化顺序** (PLAYER_ENTERING_WORLD):
```lua
1. 构建自定义子面板 (gearManFrame, chatBarFrame, ...)
2. 存储到 addonTable.PlusAddonSubPanels
3. 调用 settingsTab:AddSettingsPanel(..., subPanels, true)  -- 触发InitOptionPanel
4. BuildActionBarTab()
5. PrepareUnitFrameSettings()  -- 隐藏原生设置项
6. BuildMainMenuTab()
7. BuildPartyTab()
8. BuildComponentsTab()
9. BuildEditModeTab()
10. ApplyProfileTabIcon()
11. ArrangeSettingsTabs()  -- 修正标签顺序和图标状态
```

---

## 技术实现

### 面板嵌入机制 (CaptureFrame / RestoreFrame)

**问题**: GW2_UI 原生面板 (GwSettingsPanelTmpl) 是全局单例，同一时间只能显示在一个父容器中。

**解决方案**: 捕获原始状态 → 临时移动到新父级 → 使用完毕后恢复

```lua
-- 捕获frame的原始状态
local function CaptureFrame(frame)
    return {
        parent = frame:GetParent(),
        shown = frame:IsShown(),
        points = { frame:GetPoint(1..N) }
    }
end

-- 恢复frame到原始状态
local function RestoreFrame(frame, state)
    frame:Hide()
    frame:SetParent(state.parent)
    frame:ClearAllPoints()
    for _, point in ipairs(state.points) do
        frame:SetPoint(unpack(point))
    end
    frame:SetShown(state.shown)
end
```

**使用场景**:
- `player_aura` 在"框体"标签页显示增益/减益视图
- `party_general` 同时出现在"框体-小队"和"队伍-队伍"
- `hud_microbar/minimap/worldmap` 从原生"界面"迁移到"组件"

### 子面板初始化陷阱

**问题**: `ComponentsTab` 中自定义子面板 (gearManFrame 等) 打开后内容为空。

**根本原因**: GW2_UI 的 `InitOptionPanel` 函数负责：
1. 读取 `panel.gwOptions` 数组
2. 调用 `BuildOptionsDataProvider` 创建 ScrollBox 数据源
3. 渲染选项控件 (checkbox, slider, dropdown...)

该函数**只在** `settingsTab:AddSettingsPanel()` 内部被调用。跳过此调用 → 面板无 DataProvider → 显示为空。

**解决方案**:
```lua
-- core.lua (第266-270行)
addonTable.PlusAddonSubPanels = subPanels
-- 必须调用AddSettingsPanel触发InitOptionPanel
settingsTab:AddSettingsPanel(p, "附加组件", "额外附加组件", subPanels, true)

-- HideNativeSettings.lua (第165-183行)
-- 但同时隐藏原生菜单中的"附加组件"条目
HideAddonSubPanelsFromNativeMenu(settingsTab)
```

### 标签图标状态修正

**问题**: `settingsWindow:AddTab()` 创建的按钮，图标默认使用 TexCoord `(0, 0.5, 0, 0.625)` (选中态)。如果标签在 `SwitchTab("GwSettingsOverview")` 之后创建，永远保持"选中"外观。

**解决方案**: `ArrangeSettingsTabs` 末尾统一刷新所有按钮的 TexCoord：

```lua
local shownNames = {}
for _, tab in ipairs(settingsWindow.tabs) do
    if tab:IsShown() then shownNames[tab.name] = true end
end
for _, button in ipairs(settingsWindow.tabButtons) do
    if shownNames[button.panelName] then
        button.icon:SetTexCoord(0, 0.5, 0, 0.625)  -- 选中态
    else
        button.icon:SetTexCoord(0.505, 1, 0, 0.625)  -- 未选中态
    end
end
```

### 编辑界面直接触发

**需求**: 点击"编辑界面"图标按钮直接进入拖动模式，无需中间页面。

**实现**:
```lua
-- EditModeTab.lua
settingsWindow:AddTab(ICON_PATH, tab)  -- 创建标签按钮
local tabButton = settingsWindow.tabButtons[#settingsWindow.tabButtons]
tabButton:SetScript("OnClick", function()  -- 覆盖默认OnClick
    if InCombatLockdown() then return end
    settingsWindow:Hide()
    GW.moveHudObjects(GW.MoveHudScaleableFrame)
end)
-- 不插入 settingsWindow.tabs，避免被SwitchTab显示
```

---

## 扩展指南

### 添加新的顶层标签页

1. 在 `Modules/Settings/` 创建新文件 `YourTab.lua`
2. 实现构建函数：
```lua
local function BuildYourTab(settingsTab, settingsWindow)
    if settingsWindow.gwPlusYourTab then return end
    
    local tab = CreateFrame("Frame", nil, settingsWindow, "GwSettingsSettingsTabTemplate")
    tab.name = "GwSettingsYourName"
    tab.headerBreadcrumbText = "您的标签名"
    
    -- 隐藏默认侧菜单（如果不需要）
    tab.menu.search:Hide()
    tab.menu.ScrollBox:Hide()
    tab.menu.ScrollBar:Hide()
    
    -- 添加内容...
    
    settingsWindow:AddTab("Interface/AddOns/.../icon.png", tab)
    table.insert(settingsWindow.tabs, tab)
    settingsWindow.gwPlusYourTab = tab
    tab:Hide()
end
addonTable.BuildYourTab = BuildYourTab
```

3. 在 `GW2_UI_PLUS.toc` 中添加文件路径
4. 在 `core.lua` 初始化流程中调用：
```lua
if addonTable.BuildYourTab then
    addonTable.BuildYourTab(settingsTab, _G.GwSettingsWindow)
end
```
5. 在 `Settings.lua` 的 `TAB_ORDER` 中添加位置：
```lua
local TAB_ORDER = {
    "GwSettingsUnitFrames",
    "GwSettingsActionBar",
    "GwSettingsParty",
    "GwSettingsYourName",  -- 插入到想要的位置
    ...
}
```

### 嵌入原生面板

如需在自定义标签页中嵌入 GW2_UI 原生面板：

1. 在 `REQUIRED_PAGE_IDS` 中添加 `panelId`
2. 从 `addonTable.PlusNativePages` 读取面板引用
3. 使用 `CaptureFrame` / `RestoreFrame` 模式：
```lua
local pages = addonTable.PlusNativePages
local targetPanel = pages.your_panel_id

local currentState = CaptureFrame(targetPanel)
targetPanel:SetParent(yourTab)
targetPanel:ClearAllPoints()
targetPanel:SetPoint("TOPLEFT", yourTab, "TOPLEFT", 0, 0)
targetPanel:SetPoint("BOTTOMRIGHT", yourTab, "BOTTOMRIGHT", 0, 0)
targetPanel:Show()

-- 在关闭时恢复
yourTab.callbackOnClose = function()
    RestoreFrame(targetPanel, currentState)
end
```

### 隐藏原生设置项

如果你的标签页替代了原生设置中的某些面板：

1. 在 `HideNativeSettings.lua` 中添加过滤逻辑
2. 示例（隐藏特定 panelId）：
```lua
local function HideYourNativePanels(settingsTab)
    local scrollBox = settingsTab.menu.ScrollBox
    local provider = scrollBox:GetDataProvider()
    
    local filtered = CreateDataProvider()
    provider:ForEach(function(data)
        local frame = data.isSubCat and data.itemData and data.itemData.frame
        if frame and frame.panelId == "your_panel_to_hide" then
            return  -- 跳过此项
        end
        filtered:Insert(data)
    end)
    
    scrollBox:SetDataProvider(filtered, ScrollBoxConstants.RetainScrollPosition)
end
```
3. 在 `PrepareUnitFrameSettings` 中调用

---

## 常见问题

### Q: 为什么组件标签页的自定义子面板是空的？

**A**: 必须调用 `settingsTab:AddSettingsPanel(..., subPanels, true)` 触发 GW2_UI 的 `InitOptionPanel` 函数，该函数负责创建 ScrollBox 的 DataProvider 并渲染选项控件。

### Q: 如何让标签按钮点击后直接执行操作而非显示页面？

**A**: 参考 `EditModeTab.lua`：调用 `AddTab` 创建按钮后，覆盖 `tabButton:SetScript("OnClick", ...)` 并且**不插入** `settingsWindow.tabs`。

### Q: 为什么我的标签图标一直显示为"选中"状态？

**A**: 在 `ArrangeSettingsTabs` 末尾添加了统一的 TexCoord 刷新逻辑。确保你的标签在 `settingsWindow.tabs` 中正确注册，或手动设置 `button.icon:SetTexCoord(0.505, 1, 0, 0.625)` 为未选中态。

### Q: 如何在侧菜单中显示子面板的自定义图标？

**A**: `ComponentsTab.lua` 未使用图标，但你可以参考 `addonTable.PlusAddonSubPanels` 中的 `.icon` 字段，在 `AddMenuEntry` 中添加图标纹理显示逻辑。

---

## 相关文档

- **[SETTINGS_PANELS.md](SETTINGS_PANELS.md)** - 设置标签和页面职责清单
- **[API.md](API.md)** - 公共模块API接口
- **[DEVELOPMENT.md](DEVELOPMENT.md)** - 开发规范和流程
- **[Modules/Settings/README.md](../Modules/Settings/README.md)** - Settings 模块详细说明

---

**文档维护者**: GW2_UI_PLUS 开发团队  
**反馈渠道**: [GitHub Issues](https://github.com/yourusername/GW2_UI_PLUS/issues)
