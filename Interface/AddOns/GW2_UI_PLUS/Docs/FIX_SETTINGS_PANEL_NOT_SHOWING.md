# GW2_UI_PLUS 设置面板修复

## 🐛 问题描述

GW2_UI_PLUS 的设置面板在游戏中不显示。

## 🔍 根本原因

**TOC 加载顺序问题**：

```
行 27-74：各模块的 Options.lua 文件
行 75：core.lua
```

各个 Options.lua 文件在加载时（文件顶层）就执行了以下检查：

```lua
local GW = _G.GW2_ADDON
if not GW or not GW.GetSettingsTabFrame then return end
```

此时 GW2_UI 可能还未完全初始化，导致：
1. 检查失败，文件直接 `return`
2. `BuildPanel` 函数未被定义
3. `addonTable.BuildXxxPanel` 为 `nil`
4. `core.lua` 调用时无法创建面板

## ✅ 修复方案

**将顶层检查移到函数内部**，确保只在实际调用时才验证依赖。

### 修改模式

```lua
-- ❌ 修改前：顶层检查，过早执行
local _, addonTable = ...
local GW = _G.GW2_ADDON
if not GW or not GW.GetSettingsTabFrame then return end  -- 插件加载时立即执行
local Module = addonTable.Module
if not Module then return end

local function BuildPanel(parent)
    -- ... 构建代码
end

-- ✅ 修改后：延迟检查，调用时才执行
local _, addonTable = ...

local function BuildPanel(parent)
    local GW = _G.GW2_ADDON
    if not GW or not GW.GetSettingsTabFrame then return end  -- 函数调用时才执行
    local Module = addonTable.Module
    if not Module then return end
    
    -- ... 构建代码
end

addonTable.BuildModulePanel = BuildPanel  -- 立即导出函数
```

## 📝 已修复的文件

- ✅ `Modules/ChatBar/Options.lua`
- ✅ `Modules/ChatWindow/Options.lua`
- ✅ `Modules/CooldownPulse/Options.lua`
- ✅ `Modules/Minimap/Options.lua`
- ✅ `Modules/Skins/Options.lua`
- ✅ `Modules/Toolbar/Options.lua`
- ✅ `Modules/ActionBar/Options.lua`

## 🔄 修复详情

### 1. ChatBar/Options.lua
- 移除第 2-5 行的顶层检查
- 在 `BuildPanel` 函数开头添加延迟检查
- 将局部变量和辅助函数移到函数内部

### 2. ChatWindow/Options.lua
- 移除第 2-5 行的顶层检查
- 在 `BuildPanel` 函数开头添加延迟检查
- 将 `RedrawSlider` 函数移到 `BuildPanel` 内部

### 3. CooldownPulse/Options.lua
- 移除第 2-5 行的顶层检查
- 在 `BuildPanel` 函数开头添加延迟检查

### 4. Minimap/Options.lua
- 移除第 2-4 行的顶层检查
- 在 `BuildMinimapAddonFlyoutPanel` 函数开头添加延迟检查

### 5. Skins/Options.lua
- 移除第 2-3 行的顶层检查
- 在 `BuildPanel` 函数开头添加延迟检查
- `EnsureDB` 函数提升到顶层（不依赖 GW2_ADDON）

### 6. Toolbar/Options.lua
- 移除第 2-4 行的顶层检查
- 在 `BuildToolbarPanel` 函数开头添加延迟检查
- 修改辅助函数（`AddEnable`, `AddScale` 等）中的 `Toolbar` 引用为局部获取

### 7. ActionBar/Options.lua
- **移除重复代码**（第 1-32 行和第 34-52 行重复）
- 移除顶层检查
- 在 `BuildPanel` 函数开头添加延迟检查
- 将所有局部变量和辅助函数移到函数内部

## 🧪 测试方法

修复后，在游戏中测试：

### 1. 检查函数是否已导出

```lua
/dump GW2_UI_PLUS.BuildChatBarPanel
/dump GW2_UI_PLUS.BuildChatWindowPanel
/dump GW2_UI_PLUS.BuildCooldownPulsePanel
/dump GW2_UI_PLUS.BuildMinimapAddonFlyoutPanel
/dump GW2_UI_PLUS.BuildSkinsPanel
/dump GW2_UI_PLUS.BuildToolbarPanel
/dump GW2_UI_PLUS.BuildActionBarTab
```

**预期结果**：所有函数都应该存在（显示为 `function`），而不是 `nil`

### 2. 打开设置面板

```lua
/gw2
```

然后点击 "设置" 标签，应该能看到：
- **附加组件** 面板（包含多个子面板）
  - 一键换装
  - 频道按钮
  - 冷却闪烁
  - 聊天窗口
  - 界面皮肤
  - 插件悬浮按钮
  - 工具条
- **动作条** 独立标签（如果有的话）

### 3. 检查调试信息

查看聊天窗口是否有以下消息：

```
GW2_UI_PLUS: Core.lua is evaluating!
GW2_UI_PLUS: Dependencies satisfied!
GW2_UI_PLUS: PLAYER_ENTERING_WORLD fired!
GW2_UI_PLUS: settingsTab found!
```

如果看到 `settingsTab is nil!`，说明 GW2_UI 本体有问题。

## 📊 影响范围

### 不受影响的部分
- 所有模块的**核心功能**仍正常工作
- 只是设置面板无法显示

### 受影响的部分
- 用户无法在游戏内修改设置
- 需要手动编辑 SavedVariables 文件来修改配置

## 🎯 为什么之前没有发现

1. **开发环境**：可能在开发时 GW2_UI 已经完全加载
2. **加载顺序**：不同环境下插件加载顺序可能不同
3. **缓存问题**：某些情况下 Lua 代码可能被缓存

## 💡 最佳实践

### 推荐模式

```lua
-- 文件顶层：只做最基本的初始化
local _, addonTable = ...

-- 延迟执行的函数
local function BuildPanel(parent)
    -- 在这里检查依赖
    local GW = _G.GW2_ADDON
    if not GW then return end
    
    local Module = addonTable.Module
    if not Module then return end
    
    -- 构建面板...
end

-- 立即导出（确保函数定义存在）
addonTable.BuildModulePanel = BuildPanel
```

### 避免的模式

```lua
-- ❌ 不要在文件顶层检查运行时才存在的全局变量
local GW = _G.GW2_ADDON
if not GW or not GW.SomeRuntimeFunction then return end

-- ❌ 不要在文件顶层依赖其他插件的初始化状态
if not addonTable.SomeModule then return end
```

## 🔗 相关文档

- [GW2_UI_MIGRATION_CHECKLIST.md](GW2_UI_MIGRATION_CHECKLIST.md) - 迁移清单
- [SETTINGS_PANELS.md](SETTINGS_PANELS.md) - 设置面板功能说明

## 📅 修复日期

**2026-08-01**

## ✅ 验证清单

提交前确认：

- [x] 所有 Options.lua 文件已修复
- [x] 移除了顶层的依赖检查
- [x] 在函数内部添加了延迟检查
- [x] BuildPanel 函数已导出到 addonTable
- [x] 移除了重复代码（ActionBar/Options.lua）
- [ ] 在游戏中测试所有面板都能显示
- [ ] 在游戏中测试所有选项功能正常
- [ ] 确认没有 Lua 错误

---

**修复者**: Claude  
**审核者**: 待审核  
**版本**: 1.0
