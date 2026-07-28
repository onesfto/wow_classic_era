# GW2 UI Plus 主聊天窗口编辑框实现计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将 `ChatFrame1` 按动作条 1 的模式注册到 GW2 UI“移动界面”，只支持拖动位置，并保持现有宽高和边距设置正常工作。

**Architecture:** 在 `ChatWindow/ChatWindow.lua` 内补充独立 mover 设置、默认值注入、原生 `GW.RegisterMovableFrame` 注册和锚点保护。GW mover 保存位置；拖动后同步现有边距存档，设置页修改边距时反向更新 mover。现有聊天窗口宽高、暴雪存档和标签重排逻辑保持不变。

**Tech Stack:** World of Warcraft Classic Era Lua、GW2 UI mover API、Lua 静态回归测试

---

## 文件结构

- 新建 `Interface/AddOns/GW2_UI_PLUS/tests/ChatWindowMover_test.lua`：验证 mover 接入结构以及没有启用缩放。
- 修改 `Interface/AddOns/GW2_UI_PLUS/ChatWindow/ChatWindow.lua`：注册并驱动 `ChatFrame1` mover。
- 修改 `Interface/AddOns/GW2_UI_PLUS/ChatWindow/Options.lua`：边距设置改为主动移动 mover。
- 修改 `Interface/AddOns/GW2_UI_PLUS/ChatWindow/README.md`：更新位置所有权和编辑模式说明。

### 任务一：用失败测试约束原生 mover 接入

**文件：**
- 新建：`Interface/AddOns/GW2_UI_PLUS/tests/ChatWindowMover_test.lua`
- 测试：`Interface/AddOns/GW2_UI_PLUS/tests/ChatWindowMover_test.lua`

- [ ] **步骤 1：编写失败测试**

```lua
local function Read(path)
    local file = assert(io.open(path, "r"))
    local source = file:read("*a")
    file:close()
    return source
end

local chatWindow = Read("ChatWindow/ChatWindow.lua")
local options = Read("ChatWindow/Options.lua")

assert(chatWindow:find('local MOVER_SETTING = "ChatFrame1_pos"', 1, true),
    "主聊天窗口应使用独立的 GW2 UI mover 设置")
assert(chatWindow:find("GW.globalDefault.profile[MOVER_SETTING]", 1, true)
    and chatWindow:find("GW.settings[MOVER_SETTING]", 1, true),
    "注册 mover 前应补齐 GW 默认值和当前设置")
assert(chatWindow:find("GW.RegisterMovableFrame(frame", 1, true),
    "ChatFrame1 应通过 GW.RegisterMovableFrame 注册")
assert(chatWindow:find('{"default"}', 1, true),
    "聊天窗口 mover 应只提供恢复默认选项")
assert(not chatWindow:find('"scaleable"', 1, true)
    and not chatWindow:find('"height"', 1, true),
    "聊天窗口 mover 不应提供缩放或高度选项")
assert(chatWindow:find('frame:SetPoint("BOTTOMLEFT", frame.gwMover', 1, true),
    "ChatFrame1 应锚定到自己的 mover")
assert(chatWindow:find("SyncDBFromMover", 1, true),
    "拖动结束后应同步现有边距存档")
assert(options:find("ChatWindow.ApplyPosition", 1, true),
    "设置页边距变化应主动移动 mover")

print("ChatWindowMover_test: OK")
```

- [ ] **步骤 2：运行测试并确认按预期失败**

运行：

```bash
lua tests/ChatWindowMover_test.lua
```

预期：断言失败，提示“主聊天窗口应使用独立的 GW2 UI mover 设置”。

- [ ] **步骤 3：提交测试**

```bash
git add Interface/AddOns/GW2_UI_PLUS/tests/ChatWindowMover_test.lua
git commit -m "测试：约束主聊天窗口编辑框"
```

### 任务二：按动作条 1 模式注册 ChatFrame1 mover

**文件：**
- 修改：`Interface/AddOns/GW2_UI_PLUS/ChatWindow/ChatWindow.lua`
- 测试：`Interface/AddOns/GW2_UI_PLUS/tests/ChatWindowMover_test.lua`

- [ ] **步骤 1：补充 GW 引用、mover 设置和默认位置**

在 `local _, addonTable = ...` 后加入：

```lua
local GW = _G.GW2_ADDON
local MOVER_SETTING = "ChatFrame1_pos"
```

在默认配置后加入固定默认点；`GW.globalDefault` 使用固定默认值，首次迁移到
`GW.settings` 时使用用户当前边距：

```lua
local MOVER_DEFAULT = {
    point = "BOTTOMLEFT",
    relativePoint = "BOTTOMLEFT",
    xOfs = defaults.offsetX,
    yOfs = defaults.offsetY,
    hasMoved = false,
}

local function EnsureMoverSettings(db)
    if not GW or not GW.settings or not GW.RegisterMovableFrame then return false end

    if GW.globalDefault and GW.globalDefault.profile then
        GW.globalDefault.profile[MOVER_SETTING] = GW.CopyTable(MOVER_DEFAULT)
    end
    if not GW.settings[MOVER_SETTING] then
        local point = GW.CopyTable(MOVER_DEFAULT)
        point.xOfs = db.offsetX
        point.yOfs = db.offsetY
        point.hasMoved = point.xOfs ~= MOVER_DEFAULT.xOfs
            or point.yOfs ~= MOVER_DEFAULT.yOfs
        GW.settings[MOVER_SETTING] = point
    end
    return true
end
```

- [ ] **步骤 2：实现拖动后同步和设置页反向移动**

在应用逻辑前加入：

```lua
local function RoundOffset(value)
    if GW and GW.RoundInt then return GW.RoundInt(value) end
    return math.floor(value + 0.5)
end

local function SyncDBFromMover(frame)
    local mover = frame and frame.gwMover
    local left, bottom = mover and mover:GetLeft(), mover and mover:GetBottom()
    if not left or not bottom then return end

    local db = InitDB()
    db.offsetX = RoundOffset(left)
    db.offsetY = RoundOffset(bottom)
    if FCF_SavePositionAndDimensions then
        FCF_SavePositionAndDimensions(frame)
    end
end

function ChatWindow.ApplyPosition()
    local db = InitDB()
    local frame = _G.ChatFrame1
    local mover = frame and frame.gwMover
    if not mover or not GW or not GW.settings then
        ChatWindow.Apply()
        return
    end

    local point = GW.settings[MOVER_SETTING] or GW.CopyTable(MOVER_DEFAULT)
    point.point = "BOTTOMLEFT"
    point.relativePoint = "BOTTOMLEFT"
    point.xOfs = db.offsetX
    point.yOfs = db.offsetY
    point.hasMoved = point.xOfs ~= MOVER_DEFAULT.xOfs
        or point.yOfs ~= MOVER_DEFAULT.yOfs
    GW.settings[MOVER_SETTING] = point
    mover.savedPoint = GW.CopyTable(point)
    mover:ClearAllPoints()
    mover:SetPoint(point.point, UIParent, point.relativePoint, point.xOfs, point.yOfs)
    frame.isMoved = point.hasMoved
    frame:SetAttribute("isMoved", point.hasMoved)
    if GW.UpdateMatchingLayout then GW.UpdateMatchingLayout(mover, point) end
    ChatWindow.Apply()
end
```

- [ ] **步骤 3：注册 mover 并把聊天窗锚到它**

加入注册函数：

```lua
local function RegisterMover()
    local db = InitDB()
    local frame = _G.ChatFrame1
    if not frame or frame.gwMover or not EnsureMoverSettings(db) then return end

    GW.RegisterMovableFrame(frame, "主聊天窗口", MOVER_SETTING,
        "Blizzard", nil, {"default"}, nil, SyncDBFromMover)
end
```

修改 `Apply()` 的锚点分支：

```lua
frame:ClearAllPoints()
if frame.gwMover then
    frame:SetPoint("BOTTOMLEFT", frame.gwMover, "BOTTOMLEFT", 0, 0)
else
    frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", db.offsetX, db.offsetY)
end
frame:SetSize(db.width, db.height)
```

在 `PLAYER_ENTERING_WORLD` 事件处理中，按以下顺序调用：

```lua
InitDB()
RegisterMover()
HookFrame()
Apply()
```

- [ ] **步骤 4：调整锚点保护以允许 mover**

将 `SetPoint` 钩子改为只要聊天窗没有锚到自己的 mover 就重新应用：

```lua
hooksecurefunc(frame, "SetPoint", function(_, _, anchor)
    if applying or anchor == frame.gwMover then return end
    Apply()
end)
```

- [ ] **步骤 5：运行定向测试并确认通过**

运行：

```bash
lua tests/ChatWindowMover_test.lua
```

预期：输出 `ChatWindowMover_test: OK`。

- [ ] **步骤 6：提交核心实现**

```bash
git add Interface/AddOns/GW2_UI_PLUS/ChatWindow/ChatWindow.lua
git commit -m "功能：将主聊天窗口加入 GWUI 编辑界面"
```

### 任务三：让现有边距设置驱动 mover

**文件：**
- 修改：`Interface/AddOns/GW2_UI_PLUS/ChatWindow/Options.lua`
- 测试：`Interface/AddOns/GW2_UI_PLUS/tests/ChatWindowMover_test.lua`

- [ ] **步骤 1：修改两个边距滑块回调**

将“左边距”和“下边距”的回调从 `ChatWindow.Apply()` 改为：

```lua
callback = function() ChatWindow.ApplyPosition() end,
```

“恢复默认”的回调在写入四个默认值后依次调用：

```lua
ChatWindow.ApplyPosition()
```

宽度和高度滑块继续调用 `ChatWindow.Apply()`。

- [ ] **步骤 2：运行定向测试并确认通过**

运行：

```bash
lua tests/ChatWindowMover_test.lua
```

预期：输出 `ChatWindowMover_test: OK`。

- [ ] **步骤 3：提交设置页接线**

```bash
git add Interface/AddOns/GW2_UI_PLUS/ChatWindow/Options.lua
git commit -m "功能：同步聊天窗口边距与编辑框"
```

### 任务四：更新说明并完成全量验证

**文件：**
- 修改：`Interface/AddOns/GW2_UI_PLUS/ChatWindow/README.md`
- 测试：`Interface/AddOns/GW2_UI_PLUS/tests/*.lua`

- [ ] **步骤 1：更新聊天窗口交接说明**

将“位置与大小”章节更新为：

```markdown
位置由 GW2 UI 原生 mover 接管：打开 `/gw2` →“移动界面”，拖动“主聊天窗口”。
实现方式与 `ActionBar/ActionBar.lua` 中动作条 1 相同，使用
`GW.RegisterMovableFrame` 注册，只提供恢复默认，不提供缩放。

宽度、高度仍由“附加组件 → 聊天窗口”设置。左边距、下边距滑块会反向移动 mover；
编辑模式拖动结束后也会把实际边距同步回 `GW2_UI_PLUS_ChatWindowSV`。
```

- [ ] **步骤 2：运行所有 Lua 测试**

运行：

```bash
for test_file in tests/*_test.lua; do lua "$test_file" || exit 1; done
```

预期：每个测试均输出 `OK`，命令退出码为 0。

- [ ] **步骤 3：执行语法和差异检查**

运行：

```bash
luac -p ChatWindow/ChatWindow.lua ChatWindow/Options.lua tests/ChatWindowMover_test.lua
git diff --check
git diff -- Interface/AddOns/GW2_UI_PLUS/ChatWindow Interface/AddOns/GW2_UI_PLUS/tests/ChatWindowMover_test.lua
```

预期：`luac` 与 `git diff --check` 无输出且退出码为 0；差异只包含本功能相关改动。

- [ ] **步骤 4：提交文档**

```bash
git add Interface/AddOns/GW2_UI_PLUS/ChatWindow/README.md
git commit -m "文档：说明聊天窗口编辑框"
```
