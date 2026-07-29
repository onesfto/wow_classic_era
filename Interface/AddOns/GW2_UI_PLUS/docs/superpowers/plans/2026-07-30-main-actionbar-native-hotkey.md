# 主动作条原生快捷键切换 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 主动作条快捷键位于 `BOTTOM` 时使用 GW2_UI 原生文字和背景，位于其他位置时使用 PLUS 代理文字并隐藏背景。

**Architecture:** 在 `ActionBar/Layout.lua` 增加主动作条专用入口，避免给主动作条安装“原生文字永远透明”的通用代理钩子。`ActionBar/ActionBar.lua` 只把主动作条快捷键调用切换到该入口；宏名称与其他动作条继续使用通用代理。

**Tech Stack:** World of Warcraft Lua 5.1、GW2_UI 原生 `HotKey`/`hkBg` API、`luac -p`

---

## 文件结构

- 修改 `ActionBar/Layout.lua`
  - 增加原生 `BOTTOM` 与代理位置之间的可逆切换。
  - 非 `BOTTOM` 时阻止 GW2_UI 刷新重新显示背景。
- 修改 `ActionBar/ActionBar.lua`
  - 主动作条快捷键改用专用入口。
- 删除 `tests/ActionBarLayout_test.lua`
  - 按用户要求移除整个模拟测试文件。
- 修改 `ActionBar/README.md`
  - 记录 GW2_UI 原生实现、PLUS 切换规则与人工验收步骤。

### Task 1: 实现可逆的原生与代理切换

**Files:**
- Modify: `ActionBar/Layout.lua`
- Modify: `ActionBar/ActionBar.lua`

- [ ] **Step 1: 让通用代理支持主动作条不锁死原生透明度**

先让代理显隐同步识别原生模式：

```lua
local function SyncProxyShown(source)
    local proxy = source.gwPlusProxy
    if not proxy then return end
    if source.gwPlusUseNative then
        proxy:Hide()
        return
    end
    proxy:SetShown(source.gwPlusTextShown ~= false and source:IsShown())
end
```

再给 `EnsureTextProxy` 增加 `sourceRestorable` 参数，只给普通代理安装透明度锁：

```lua
local function EnsureTextProxy(source, button, sourceRestorable)
    if source.gwPlusProxy then return source.gwPlusProxy end
    if not button.CreateFontString then return end

    local proxy = button:CreateFontString(nil, "OVERLAY")
    if proxy.SetWordWrap then proxy:SetWordWrap(false) end
    if proxy.SetNonSpaceWrap then proxy:SetNonSpaceWrap(false) end
    local path, size, flags = source:GetFont()
    if path then proxy:SetFont(path, size or 12, flags) end
    proxy:SetTextColor(source:GetTextColor())
    proxy:SetText(source:GetText() or "")

    source.gwPlusProxy = proxy
    source:SetAlpha(0)

    if hooksecurefunc then
        hooksecurefunc(source, "SetText", SyncProxyText)
        if source.SetFormattedText then
            hooksecurefunc(source, "SetFormattedText", SyncProxyText)
        end
        hooksecurefunc(source, "Show", SyncProxyShown)
        hooksecurefunc(source, "Hide", SyncProxyShown)
        if not sourceRestorable then
            hooksecurefunc(source, "SetAlpha", function(self)
                if self:GetAlpha() ~= 0 then self:SetAlpha(0) end
            end)
        end
    end

    return proxy
end
```

- [ ] **Step 2: 抽出代理文字应用函数**

把现有 `Layout.ApplyTextPosition` 主体移到内部函数：

```lua
local function ApplyProxyTextPosition(fontString, button, position, x, y,
                                      size, shown, sourceRestorable)
    if not fontString or not button then return end
    local proxy = EnsureTextProxy(fontString, button, sourceRestorable)
    if not proxy then return end

    local key = NormalizeTextPosition(position)
    local alignment = TEXT_POSITIONS[key]
    fontString.gwPlusTextPosition = key
    fontString.gwPlusTextX, fontString.gwPlusTextY = x or 0, y or 0
    if shown ~= nil then fontString.gwPlusTextShown = shown end
    if size then SetFontSize(proxy, size) end

    proxy:ClearAllPoints()
    proxy:SetPoint(alignment.point, button, alignment.point,
        tonumber(x) or 0, tonumber(y) or 0)
    if proxy.SetJustifyH then proxy:SetJustifyH(alignment.justifyH) end
    if proxy.SetJustifyV then proxy:SetJustifyV(alignment.justifyV) end

    SyncProxyText(fontString)
    SyncProxyShown(fontString)
    return proxy
end

function Layout.ApplyTextPosition(fontString, button, position, x, y, size, shown)
    return ApplyProxyTextPosition(fontString, button, position, x, y,
        size, shown, false)
end
```

- [ ] **Step 3: 增加主动作条背景保护**

增加只对当前非 `BOTTOM` 状态生效的背景钩子：

```lua
local function ProtectMainHotkeyBackground(fontString, button)
    local background = button.hkBg and button.hkBg.texture
    if not background then return end
    if not background.gwPlusVisibilityHooked and hooksecurefunc then
        background.gwPlusVisibilityHooked = true
        hooksecurefunc(background, "Show", function(self)
            if fontString.gwPlusTextPosition ~= "BOTTOM" then self:Hide() end
        end)
    end
    return background
end
```

- [ ] **Step 4: 增加主动作条专用入口**

```lua
function Layout.ApplyMainHotkey(fontString, button, position, x, y, size, shown)
    if not fontString or not button then return end
    local key = NormalizeTextPosition(position)
    fontString.gwPlusTextPosition = key
    fontString.gwPlusUseNative = key == "BOTTOM"
    local background = ProtectMainHotkeyBackground(fontString, button)

    if key == "BOTTOM" then
        if fontString.gwPlusProxy then fontString.gwPlusProxy:Hide() end
        fontString:SetAlpha(1)
        if GW.updateHotkey then GW.updateHotkey(button) end
        if GW.FixHotKeyPosition then
            GW.FixHotKeyPosition(button, false, false, true)
        end
        if shown == false then
            fontString:Hide()
            if background then background:Hide() end
        end
        return
    end

    ApplyProxyTextPosition(fontString, button, key, x, y, size, shown, true)
    fontString:SetAlpha(0)
    if background then background:Hide() end
end
```

- [ ] **Step 5: 切换主动作条调用**

在 `ApplyMainButtonText` 中只替换快捷键入口：

```lua
layout.ApplyMainHotkey(btn.HotKey, btn,
    db.mainBarHotkeyPosition,
    db.mainBarHotkeyX or 0, db.mainBarHotkeyY or 0,
    db.mainBarHotkeySize,
    db.mainBarShowHotkey ~= false)
```

宏名称继续调用 `layout.ApplyTextPosition`。

### Task 2: 删除模拟测试并更新文档

**Files:**
- Delete: `tests/ActionBarLayout_test.lua`
- Modify: `ActionBar/README.md`

- [ ] **Step 1: 删除整个模拟测试文件**

删除：

```text
tests/ActionBarLayout_test.lua
```

- [ ] **Step 2: 在动作条 README 记录原生切换规则**

新增“主动作条快捷键”章节，明确：

```markdown
## 主动作条快捷键

GW2_UI 原生使用 `button.HotKey` 显示快捷键，并将 `button.hkBg` 围绕该文字定位。
PLUS 不得在“下（BOTTOM）”位置用代理替换原生文字。

- `BOTTOM`：使用原生 `HotKey` 和 `hkBg`。
- 其他位置：使用 PLUS 代理文字，隐藏 `hkBg.texture`。
- 切回 `BOTTOM`：隐藏代理、恢复原生 alpha，再调用 GW2_UI 的
  `updateHotkey` 与 `FixHotKeyPosition`。
- 非 `BOTTOM`：背景的 `Show` 后处理会立即重新隐藏背景，防止绑定刷新覆盖。

游戏内验收：依次选择“下”和其他任意位置；“下”应同时显示白色快捷键与黑色背景，
其他位置只显示快捷键文字。往返切换不需要 `/reload`。
```

### Task 3: 验证与提交

**Files:**
- Verify: `ActionBar/Layout.lua`
- Verify: `ActionBar/ActionBar.lua`
- Verify: `ActionBar/README.md`
- Verify deletion: `tests/ActionBarLayout_test.lua`

- [ ] **Step 1: 运行剩余动作条检查**

Run:

```bash
lua tests/ActionBarFollowup_test.lua
luac -p ActionBar/Layout.lua
luac -p ActionBar/ActionBar.lua
test ! -e tests/ActionBarLayout_test.lua
```

Expected: 跟进测试输出 `ActionBarFollowup_test: OK`，其余命令无输出且退出码为 `0`。

- [ ] **Step 2: 检查关键源码结构**

Run:

```bash
rg -n "ApplyMainHotkey|sourceRestorable|gwPlusUseNative|gwPlusVisibilityHooked" \
  ActionBar/Layout.lua ActionBar/ActionBar.lua
rg -n 'SetDrawLayer\\("OVERLAY", 7\\)' ActionBar/Layout.lua
```

Expected: 第一条找到主动作条专用实现；第二条无输出且退出码为 `1`。

- [ ] **Step 3: 检查范围**

Run:

```bash
git diff --check
git diff -- ActionBar/Layout.lua ActionBar/ActionBar.lua \
  ActionBar/README.md tests/ActionBarLayout_test.lua
```

Expected: 只包含主动作条切换、README 更新和测试文件删除；`ActionBar/ActionBar.lua` 中既有的施法条改动保持原样。

- [ ] **Step 4: 提交**

```bash
git add -- ActionBar/Layout.lua ActionBar/ActionBar.lua \
  ActionBar/README.md tests/ActionBarLayout_test.lua \
  docs/superpowers/plans/2026-07-30-main-actionbar-native-hotkey.md
git commit -m "修复：按位置切换主动作条原生快捷键"
```
