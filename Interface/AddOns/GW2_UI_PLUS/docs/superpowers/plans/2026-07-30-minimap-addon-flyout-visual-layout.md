# 插件悬浮按钮材质与布局优化实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 让“插件悬浮按钮”开启时统一使用 GW2_UI 材质和尺寸，每排最多 8 个，并将入口固定到小地图右侧正中。

**Architecture:** 继续由 `Minimap/AddonFlyout.lua` 独立负责按钮识别、换肤、收纳和恢复，不新增运行时文件。换肤逻辑复用 GW2_UI 原生小地图按钮的纹理筛选规则；布局逻辑把当前单行序号转换为最多 8 列的行列坐标，并按行数调整容器尺寸。

**Tech Stack:** World of Warcraft Classic Lua API、GW2_UI backdrop API、独立 Lua 测试桩、Lua 5.5/`luac`

---

## 文件职责

- `Minimap/AddonFlyout.lua`：运行时按钮换肤、悬浮入口定位、八列换行布局和恢复。
- `tests/MinimapAddonFlyout_test.lua`：模拟 WoW Frame/Texture API，覆盖材质、尺寸、入口锚点、换行和恢复行为。
- `docs/superpowers/specs/2026-07-30-minimap-addon-flyout-visual-layout-design.md`：已确认的设计依据，不再修改。

### 任务 1：统一按钮材质、尺寸和入口位置

**Files:**
- Modify: `tests/MinimapAddonFlyout_test.lua`
- Modify: `Minimap/AddonFlyout.lua`

- [ ] **步骤 1：补充纹理测试桩**

在 `tests/MinimapAddonFlyout_test.lua` 的 `NewTexture` 中保存纹理、锚点和绘制层，并实现生产代码会调用的方法：

```lua
local function NewTexture(texture)
    return {
        alpha = 1,
        texture = texture,
        points = {},
        drawLayer = nil,
        SetAlpha = function(self, value) self.alpha = value end,
        GetTexture = function(self) return self.texture end,
        GetTextureFileID = function(self)
            return type(self.texture) == "number"
                and self.texture or nil
        end,
        SetTexture = function(self, value) self.texture = value end,
        IsObjectType = function(_, value) return value == "Texture" end,
        GetParent = function(self) return self.parent end,
        ClearAllPoints = function(self) self.points = {} end,
        SetPoint = function(self, ...)
            self.points[#self.points + 1] = {...}
        end,
        SetDrawLayer = function(self, value) self.drawLayer = value end,
    }
end
```

在 `NewFrame` 中增加 `regions`、`GetNumRegions`、`GetRegions` 和 `AddRegion`：

```lua
regions = {},

function frame:GetNumRegions() return #self.regions end
function frame:GetRegions() return unpackValues(self.regions) end
function frame:AddRegion(region)
    region.parent = self
    self.regions[#self.regions + 1] = region
end
```

- [ ] **步骤 2：写入材质、尺寸和入口位置的失败测试**

在创建 `addonButton` 后给它添加一个圆形边框和一个插件图标：

```lua
local roundBorder =
    NewTexture("Interface/Minimap/UI-Minimap-Border")
local addonIcon =
    NewTexture("Interface/AddOns/Test/icon")
addonButton:AddRegion(roundBorder)
addonButton:AddRegion(addonIcon)
```

在第一次 `Flyout.Apply()` 后断言：

```lua
assert(addonButton:GetWidth() == 25
    and addonButton:GetHeight() == 25,
    "收纳按钮应统一为 25 × 25")
assert(roundBorder.texture == nil and roundBorder.alpha == 0,
    "第三方圆形边框应被清除并隐藏")
assert(addonIcon.drawLayer == "ARTWORK"
    and #addonIcon.points == 2,
    "插件图标应使用 GW2_UI 的内缩布局")

local togglePoint, toggleRelativeTo, toggleRelativePoint,
    toggleX, toggleY = firstToggle:GetPoint(1)
assert(togglePoint == "LEFT" and toggleRelativeTo == Minimap
    and toggleRelativePoint == "RIGHT"
    and toggleX == 4 and toggleY == 0,
    "悬浮入口应位于小地图右侧正中")
```

- [ ] **步骤 3：运行测试，确认按预期失败**

Run:

```bash
lua tests/MinimapAddonFlyout_test.lua
```

Expected: FAIL，首先出现“第三方圆形边框应被清除并隐藏”或“悬浮入口应位于小地图右侧正中”，证明当前实现没有完成换肤或新锚点。

- [ ] **步骤 4：实现 GW2_UI 纹理筛选规则**

在 `Minimap/AddonFlyout.lua` 的忽略名单后增加：

```lua
local removeTextureID = {
    [136430] = true,
    [136467] = true,
    [136468] = true,
    [130924] = true,
    [136477] = true,
}

local removeTextureFile = {
    ["interface/minimap/minimap-trackingborder"] = true,
    ["interface/minimap/ui-minimap-border"] = true,
    ["interface/minimap/ui-minimap-background"] = true,
}

local function IsIgnoredTexture(texture)
    if not texture or texture == "" then return false end
    local lower = tostring(texture):lower()
    if removeTextureFile[lower] then return true end

    return lower:find("interface/characterframe", 1, true)
        or (lower:find("interface/minimap", 1, true)
            and not lower:find(
                "interface/minimap/tracking/", 1, true))
        or lower:find("border", 1, true)
        or lower:find("background", 1, true)
        or lower:find("alphamask", 1, true)
        or lower:find("highlight", 1, true)
end
```

同时兼容纹理路径中的反斜杠：在判断前用 `lower = lower:gsub("\\\\", "/")` 规范化路径。

- [ ] **步骤 5：实现一次性按钮换肤**

将 `SkinButton` 改为：

```lua
local function SkinButton(button)
    button:SetSize(25, 25)
    if button.__gwPlusFlyoutSkinned then return end

    for index = 1, button:GetNumRegions() do
        local region = select(index, button:GetRegions())
        if region and region.IsObjectType
            and region:IsObjectType("Texture") then
            local textureID = region.GetTextureFileID
                and region:GetTextureFileID()
            local texture = region.GetTexture
                and region:GetTexture()

            if textureID and removeTextureID[textureID] then
                region:SetTexture(nil)
                region:SetAlpha(0)
            elseif IsIgnoredTexture(texture) then
                region:SetTexture(nil)
                region:SetAlpha(0)
            else
                region:ClearAllPoints()
                region:SetDrawLayer("ARTWORK")
                region:SetPoint(
                    "TOPLEFT", button, "TOPLEFT", 2, -2)
                region:SetPoint(
                    "BOTTOMRIGHT", button, "BOTTOMRIGHT", -2, 2)
            end
        end
    end

    if button.GwCreateBackdrop and GW.BackdropTemplates then
        button:GwCreateBackdrop(
            GW.BackdropTemplates.DefaultWithSmallBorder)
    end
    button.__gwPlusFlyoutSkinned = true
end
```

不要锁定纹理的 `SetPoint`，以免第三方插件刷新图标时发生脚本错误；后续 `Flyout.Refresh()` 会再次确保按钮尺寸正确。

- [ ] **步骤 6：固定入口到小地图右侧正中**

将 `EnsureToggle` 中“仅在没有锚点时定位”的分支替换为：

```lua
if Minimap then
    toggle:ClearAllPoints()
    toggle:SetPoint("LEFT", Minimap, "RIGHT", 4, 0)
end
```

定位发生在每次 `Flyout.Apply()` 调用的 `EnsureToggle()` 阶段，从而覆盖 GW2_UI Classic 后续写入的顶部锚点。

- [ ] **步骤 7：运行测试，确认材质和位置测试通过**

Run:

```bash
lua tests/MinimapAddonFlyout_test.lua
```

Expected: PASS，并输出 `MinimapAddonFlyout_test: OK`。

- [ ] **步骤 8：提交任务 1**

```bash
git add Minimap/AddonFlyout.lua tests/MinimapAddonFlyout_test.lua
git commit -m "界面：统一插件悬浮按钮材质与位置"
```

### 任务 2：每排最多八个并自动换行

**Files:**
- Modify: `tests/MinimapAddonFlyout_test.lua`
- Modify: `Minimap/AddonFlyout.lua`

- [ ] **步骤 1：让 Frame 测试桩支持容器高度**

在 `NewFrame` 中增加：

```lua
function frame:SetHeight(value) self.height = value end
```

- [ ] **步骤 2：写入第九个按钮换行的失败测试**

在首次启用前一共创建 9 个候选插件按钮，并保留引用：

```lua
local layoutButtons = {addonButton}
for index = 2, 9 do
    local button = NewFrame(
        "LibDBIcon10_Layout" .. index,
        Minimap, 32, "Button")
    button:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 4, -4)
    layoutButtons[index] = button
end
```

第一次 `Flyout.Apply()` 后检查第 1、8、9 个按钮的位置和容器大小：

```lua
local _, _, _, firstX, firstY =
    layoutButtons[1]:GetPoint(1)
local _, _, _, eighthX, eighthY =
    layoutButtons[8]:GetPoint(1)
local _, _, _, ninthX, ninthY =
    layoutButtons[9]:GetPoint(1)

assert(firstY == eighthY,
    "前 8 个按钮应位于同一排")
assert(ninthX == firstX and ninthY ~= firstY,
    "第 9 个按钮应从第二排第一列开始")
assert(firstToggle.container:GetWidth() == 226,
    "八列容器宽度应为 226")
assert(firstToggle.container:GetHeight() == 64,
    "两排容器高度应为 64")
```

尺寸公式为：8 列 `8 × 27 + 10 = 226`；2 行 `2 × 27 + 10 = 64`。

- [ ] **步骤 3：运行测试，确认按预期失败**

Run:

```bash
lua tests/MinimapAddonFlyout_test.lua
```

Expected: FAIL，出现“第 9 个按钮应从第二排第一列开始”或容器高度断言失败，证明当前代码仍是单行。

- [ ] **步骤 4：实现八列换行和容器尺寸**

在 `UpdateButtons` 中先创建可见按钮数组：

```lua
local shownButtons = {}
for _, button in ipairs(managedButtons) do
    if button:IsShown() then
        shownButtons[#shownButtons + 1] = button
    end
end

local shownCount = #shownButtons
local rowCount = shownCount > 0
    and math.ceil(shownCount / 8) or 0
local maxColumns = math.min(shownCount, 8)
```

再按行列定位：

```lua
for index, button in ipairs(shownButtons) do
    local state = buttonStates[button]
    local zeroIndex = index - 1
    local column = zeroIndex % 8
    local row = math.floor(zeroIndex / 8)
    local yOffset =
        ((rowCount - 1) * 27 / 2) - (row * 27)

    RestoreMethods(button, state)
    button:SetParent(toggle.container)
    button:ClearAllPoints()
    button:SetPoint(
        "RIGHT", toggle.container, "RIGHT",
        -5 - (column * 27), yOffset)
    button:SetScale(1)
    button:SetFrameStrata("MEDIUM")
    button:SetFrameLevel(toggle.container:GetFrameLevel() + 1)
    LockMethods(button)
end
```

最后设置容器尺寸：

```lua
toggle.container:SetWidth(
    shownCount > 0 and (maxColumns * 27 + 10) or 10)
toggle.container:SetHeight(
    shownCount > 0 and (rowCount * 27 + 10) or 10)
```

- [ ] **步骤 5：运行测试，确认换行测试通过**

Run:

```bash
lua tests/MinimapAddonFlyout_test.lua
```

Expected: PASS，并输出 `MinimapAddonFlyout_test: OK`。

- [ ] **步骤 6：提交任务 2**

```bash
git add Minimap/AddonFlyout.lua tests/MinimapAddonFlyout_test.lua
git commit -m "布局：插件悬浮按钮每排最多八个"
```

### 任务 3：完整验证

**Files:**
- Verify: `Minimap/AddonFlyout.lua`
- Verify: `tests/MinimapAddonFlyout_test.lua`

- [ ] **步骤 1：运行相关功能测试**

```bash
lua tests/MinimapAddonFlyout_test.lua
lua tests/MinimapAddonFlyoutOptions_test.lua
```

Expected: 两项均 PASS，分别输出对应的 `OK`。

- [ ] **步骤 2：运行全部独立 Lua 测试**

```bash
for test_file in tests/*_test.lua; do
    lua "$test_file" || exit 1
done
```

Expected: 命令退出码为 0，所有测试均输出 `OK`，无 Lua 错误。

- [ ] **步骤 3：运行语法和差异检查**

```bash
luac -p Minimap/AddonFlyout.lua tests/MinimapAddonFlyout_test.lua
git diff --check HEAD
git status --short -- Minimap/AddonFlyout.lua tests/MinimapAddonFlyout_test.lua
```

Expected: `luac` 和 `git diff --check` 退出码为 0；状态只包含本计划涉及且尚未提交的文件，或在已提交后为空。

- [ ] **步骤 4：核对需求**

逐项确认：

- 圆形外框、背景和高亮纹理会被清除。
- 图标使用 GW2_UI 小边框并统一为 `25 × 25`。
- 每排最多 8 个，第 9 个换到下一排。
- 入口位于小地图右侧正中。
- 点击和展开方向未改变。
- 关闭后恢复按钮原父级、锚点、尺寸、缩放和层级。
