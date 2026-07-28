# GW2_UI_PLUS 框体子菜单与目标设置合并实施计划

> 本文档随 GW2 UI Plus 插件保存。

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**目标：** 在“框体”标签的玩家菜单下加入“综合、资源条、光环”子菜单，并把“目标的目标”的非隐藏器设置追加到目标面板。

**架构：** 继续只在 `GW2_UI_PLUS/MainMenu/MainMenu.lua` 中复用原生设置页面。玩家菜单通过静态按钮层级控制三个原生页面；目标页通过合并原生 `gwOptions` 并重建目标滚动数据源来显示“目标的目标”设置，所有原生 getter、setter、依赖和回调保持不变。

**技术栈：** Lua 5.1、World of Warcraft Frame API、GW2_UI 设置面板和 ScrollBox 数据源。

---

### 任务一：扩充原生页面发现范围

**文件：**
- 修改：`Interface/AddOns/GW2_UI_PLUS/MainMenu/MainMenu.lua`

- [ ] **步骤 1：扩充页面定义**

把扁平的 `PAGE_DEFINITIONS` 改为包含菜单层级的定义，并确保查找以下页面：

```lua
local REQUIRED_PAGE_IDS = {
    "player_general",
    "player_classpower",
    "player_aura",
    "target_general",
    "target_of_target",
    "player_pet",
    "party_general",
}
```

玩家菜单的数据固定为：

```lua
local PLAYER_PAGE_DEFINITIONS = {
    {"综合", "player_general"},
    {"资源条", "player_classpower"},
    {"光环", "player_aura"},
}
```

- [ ] **步骤 2：验证页面查找条件**

运行：

```bash
luac -p Interface/AddOns/GW2_UI_PLUS/MainMenu/MainMenu.lua
```

预期：命令无输出并以状态码 0 结束。

### 任务二：合并“目标的目标”设置

**文件：**
- 修改：`Interface/AddOns/GW2_UI_PLUS/MainMenu/MainMenu.lua`

- [ ] **步骤 1：添加数据源构建辅助函数**

新增只处理已经初始化的原生选项对象的行打包函数，保持原生换行规则和主开关分隔行：

```lua
local function ResolveForceNewLine(option)
    if option.forceNewLine ~= nil then return option.forceNewLine end
    if option.optionType == "dropdown" and option.noNewLine ~= nil then
        return not option.noNewLine
    end
    return option.optionType == "slider"
        or option.optionType == "dropdown"
        or option.optionType == "list"
        or option.optionType == "text"
        or option.optionType == "button"
        or option.optionType == "colorPicker"
        or option.optionType == "header"
        or option.optionType == "subHeader"
end
```

辅助函数根据合并后的 `gwOptions` 创建 `CreateDataProvider()`，每行写入 `index`、`kind`、`cols` 和 `panel`。

- [ ] **步骤 2：追加非隐藏器设置**

新增 `MergeTargetOfTargetSettings(targetPanel, targetOfTargetPanel, faderLabel)`：

```lua
if targetPanel.__gwPlusTargetOfTargetMerged then return end

for _, option in ipairs(targetOfTargetPanel.gwOptions or {}) do
    if not IsFaderOption(option, faderLabel) then
        targetPanel.gwOptions[#targetPanel.gwOptions + 1] = option
    end
end

targetPanel.__gwPlusTargetOfTargetMerged = true
```

随后用合并后的选项重建 `targetPanel.scroll.ScrollBox` 数据源。设置项对象本身不复制，确保原生依赖和回调继续生效。

- [ ] **步骤 3：保持隐藏器过滤**

把现有 `HidePlayerFaderSettings` 更名为 `PrepareUnitFrameSettings`，在同一次扫描中取得 `target_general`、`target_of_target` 和 `player_pet`：

```lua
HideEmbeddedFader(targetPanel, faderLabel)
HideEmbeddedFader(petPanel, faderLabel)
MergeTargetOfTargetSettings(targetPanel, targetOfTargetPanel, faderLabel)
```

玩家独立的 `player_fader` 菜单仍从原设置数据源中移除；目标、宠物和合并内容中的隐藏器均不出现。

- [ ] **步骤 4：更新初始化调用**

在 `core.lua` 中把：

```lua
addonTable.HidePlayerFaderSettings(settingsTab)
```

替换为：

```lua
addonTable.PrepareUnitFrameSettings(settingsTab)
```

### 任务三：实现玩家子菜单

**文件：**
- 修改：`Interface/AddOns/GW2_UI_PLUS/MainMenu/MainMenu.lua`

- [ ] **步骤 1：建立菜单项列表**

`BuildMainMenuTab` 中创建以下显示顺序：

```lua
玩家
  综合
  资源条
  光环
目标
宠物
小队
```

玩家父按钮显示箭头，三个子按钮的文字向右缩进 10 像素。目标、宠物和小队不显示箭头。

- [ ] **步骤 2：实现展开和选中状态**

增加 `playerExpanded` 状态。点击玩家父按钮时展开玩家子菜单并选择“综合”；点击任意玩家子菜单时保持展开；点击目标、宠物或小队时收起玩家子菜单。

重新布局可见按钮：

```lua
local function LayoutButtons()
    local visibleIndex = 0
    for _, entry in ipairs(menuEntries) do
        local visible = not entry.isPlayerChild or playerExpanded
        entry.button:SetShown(visible)
        if visible then
            entry.button:ClearAllPoints()
            entry.button:SetPoint(
                "TOPLEFT", tab.menu, "TOPLEFT",
                0, -8 - (visibleIndex * 36))
            visibleIndex = visibleIndex + 1
        end
    end
end
```

只有当前页面对应按钮显示 `activeTexture`；父级“玩家”在任一玩家子页面选中时也保持展开，但选中高亮只显示在具体子菜单。

- [ ] **步骤 3：保持页面迁移恢复逻辑**

`SelectPage` 改为接收 `panelId`，继续调用 `CaptureFrame`、`RestoreFrame` 和 `RestoreCurrent`。默认页面固定为 `player_general`，离开框体标签时仍恢复当前原生页面的父级、锚点和显示状态。

### 任务四：静态验证

**文件：**
- 验证：`Interface/AddOns/GW2_UI_PLUS/MainMenu/MainMenu.lua`
- 验证：`Interface/AddOns/GW2_UI_PLUS/core.lua`

- [ ] **步骤 1：检查 Lua 语法**

运行：

```bash
luac -p Interface/AddOns/GW2_UI_PLUS/MainMenu/MainMenu.lua \
    Interface/AddOns/GW2_UI_PLUS/core.lua
```

预期：命令无输出并以状态码 0 结束。

- [ ] **步骤 2：检查空白错误**

运行：

```bash
git diff --check -- \
    Interface/AddOns/GW2_UI_PLUS/MainMenu/MainMenu.lua \
    Interface/AddOns/GW2_UI_PLUS/core.lua
```

预期：命令无输出并以状态码 0 结束。

- [ ] **步骤 3：确认未修改原生文件**

运行：

```bash
git diff --name-only -- Interface/AddOns/GW2_UI_PLUS
```

预期：本次功能改动只落在 `GW2_UI_PLUS` 路径；不对已有的 `GW2_UI` 工作树状态作清洁性声明。

按用户要求不增加或运行自动化测试，游戏内效果由用户 `/reload` 后检查。
