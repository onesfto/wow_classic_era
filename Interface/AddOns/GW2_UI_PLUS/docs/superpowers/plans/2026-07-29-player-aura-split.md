# 玩家光环拆分实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 把“框体 → 玩家 → 光环”拆成带独立显隐开关的“增益光环”和“减益光环”，且不修改 GW2_UI 本体。

**Architecture:** 新增 `MainMenu/PlayerAuras.lua`，只负责两个 PLUS 保存值、底层 GW2 光环总开关协调、两个受保护光环框的显隐及脱战延迟。`MainMenu/MainMenu.lua` 继续拥有菜单和页面迁移职责，把同一个原生 `player_aura` 页过滤成两个数据源视图，并在离开 PLUS 框体标签时恢复原始页面。

**Tech Stack:** Lua 5.1、World of Warcraft Frame API、GW2_UI SettingsPanel/ScrollBox API、基于 Lua `assert` 的本地测试。

---

## 文件结构

- 新建 `MainMenu/PlayerAuras.lua`
  - 初始化 `playerBuffAurasEnabled` 和 `playerDebuffAurasEnabled`。
  - 暴露 `GetEnabled`、`SetEnabled`、`ApplyVisibility` 和 `CreateToggleOption`。
  - 处理 `PLAYER_ENTERING_WORLD`、`PLAYER_REGEN_ENABLED` 和底层重载要求。
- 修改 `MainMenu/MainMenu.lua`
  - 把一个光环菜单项替换成两个虚拟页面 ID。
  - 缓存原生光环页并建立增益、减益过滤数据源。
  - 切换视图时更新页面文案，离开时恢复完整原生页面。
- 修改 `GW2_UI_PLUS.toc`
  - 在 `MainMenu/MainMenu.lua` 之前加载 `MainMenu/PlayerAuras.lua`。
- 新建 `tests/PlayerAuras_test.lua`
  - 在模拟的 WoW 环境中验证独立保存、独立显隐、战斗延迟和底层重载。
- 修改 `tests/SettingsStructure_test.lua`
  - 静态验证两个菜单、两个过滤分组和原生页面恢复接口。

### 任务一：实现可测试的独立光环显隐控制器

**文件：**
- 新建：`tests/PlayerAuras_test.lua`
- 新建：`MainMenu/PlayerAuras.lua`

- [ ] **步骤 1：先写独立显隐的失败测试**

创建 `tests/PlayerAuras_test.lua`，提供最小 WoW API 模拟并覆盖四种行为：

```lua
local combat = false
local popupName
local eventFrame

local function NewAuraFrame()
    return {
        shown = true,
        SetShown = function(self, shown) self.shown = shown end,
    }
end

GW2_UI_PLUS_SV = nil
GW2_ADDON = {
    settings = {PLAYER_BUFFS_ENABLED = true},
}
GW2UIPlayerBuffs = NewAuraFrame()
GW2UIPlayerDebuffs = NewAuraFrame()

function InCombatLockdown() return combat end
function StaticPopup_Show(name) popupName = name end
C_Timer = {
    After = function(_, callback) callback() end,
}
function CreateFrame()
    eventFrame = {events = {}, scripts = {}}
    function eventFrame:RegisterEvent(event) self.events[event] = true end
    function eventFrame:UnregisterEvent(event) self.events[event] = nil end
    function eventFrame:SetScript(script, handler) self.scripts[script] = handler end
    return eventFrame
end

local addonTable = {}
assert(loadfile("MainMenu/PlayerAuras.lua"))("GW2_UI_PLUS", addonTable)
local Auras = assert(addonTable.PlusPlayerAuras)

local db = Auras.InitDB()
assert(db.playerBuffAurasEnabled == true)
assert(db.playerDebuffAurasEnabled == true)

Auras.SetEnabled("buff", false)
assert(GW2UIPlayerBuffs.shown == false)
assert(GW2UIPlayerDebuffs.shown == true)

combat = true
Auras.SetEnabled("debuff", false)
assert(GW2UIPlayerDebuffs.shown == true)
assert(eventFrame.events.PLAYER_REGEN_ENABLED == true)

combat = false
eventFrame.scripts.OnEvent(eventFrame, "PLAYER_REGEN_ENABLED")
assert(GW2UIPlayerBuffs.shown == false)
assert(GW2UIPlayerDebuffs.shown == false)
assert(eventFrame.events.PLAYER_REGEN_ENABLED == nil)

GW2_UI_PLUS_SV.playerBuffAurasEnabled = false
GW2_ADDON.settings.PLAYER_BUFFS_ENABLED = false
popupName = nil
Auras.SetEnabled("buff", true)
assert(GW2_ADDON.settings.PLAYER_BUFFS_ENABLED == true)
assert(popupName == "GW2_UI_PLUS_RELOAD")

print("PlayerAuras_test: OK")
```

- [ ] **步骤 2：运行测试并确认按预期失败**

运行：

```bash
lua tests/PlayerAuras_test.lua
```

预期：失败，错误指出 `MainMenu/PlayerAuras.lua` 不存在或无法加载。

- [ ] **步骤 3：编写最小控制器**

创建 `MainMenu/PlayerAuras.lua`。核心结构固定如下：

```lua
local _, addonTable = ...

local Auras = {}
addonTable.PlusPlayerAuras = Auras

local SETTING_KEYS = {
    buff = "playerBuffAurasEnabled",
    debuff = "playerDebuffAurasEnabled",
}
local FRAME_NAMES = {
    buff = "GW2UIPlayerBuffs",
    debuff = "GW2UIPlayerDebuffs",
}

local eventFrame = CreateFrame("Frame")

function Auras.InitDB()
    GW2_UI_PLUS_SV = GW2_UI_PLUS_SV or {}
    local inherited = GW2_ADDON
        and GW2_ADDON.settings
        and GW2_ADDON.settings.PLAYER_BUFFS_ENABLED ~= false
    for _, key in pairs(SETTING_KEYS) do
        if GW2_UI_PLUS_SV[key] == nil then
            GW2_UI_PLUS_SV[key] = inherited
        end
    end
    return GW2_UI_PLUS_SV
end

function Auras.GetEnabled(kind)
    return Auras.InitDB()[assert(SETTING_KEYS[kind])] == true
end

function Auras.ApplyVisibility()
    if InCombatLockdown and InCombatLockdown() then
        eventFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
        return false
    end
    eventFrame:UnregisterEvent("PLAYER_REGEN_ENABLED")
    for kind, frameName in pairs(FRAME_NAMES) do
        local frame = _G[frameName]
        if frame then frame:SetShown(Auras.GetEnabled(kind)) end
    end
    return true
end

function Auras.SetEnabled(kind, enabled)
    local key = assert(SETTING_KEYS[kind])
    Auras.InitDB()[key] = enabled == true

    local settings = GW2_ADDON and GW2_ADDON.settings
    if enabled and settings and not settings.PLAYER_BUFFS_ENABLED then
        settings.PLAYER_BUFFS_ENABLED = true
        if StaticPopup_Show then StaticPopup_Show("GW2_UI_PLUS_RELOAD") end
        return false
    end
    return Auras.ApplyVisibility()
end

eventFrame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
        self:UnregisterEvent(event)
        if C_Timer and C_Timer.After then
            C_Timer.After(0, Auras.ApplyVisibility)
        else
            Auras.ApplyVisibility()
        end
    elseif event == "PLAYER_REGEN_ENABLED" then
        Auras.ApplyVisibility()
    end
end)
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
```

同一文件补充 `CreateToggleOption(panel, kind)`：

```lua
function Auras.CreateToggleOption(panel, kind)
    local key = assert(SETTING_KEYS[kind])
    local option = panel:AddOption(
        "启用",
        kind == "buff" and "显示玩家增益光环。"
            or "显示玩家减益光环。",
        {
            getter = function() return Auras.GetEnabled(kind) end,
            setter = function(value) Auras.SetEnabled(kind, value) end,
            getDefault = function() return true end,
            isMasterToggle = true,
        })
    option.optionName = key
    return option
end
```

实现时保留 `GW.updateSettingsFrameSettingsValue` 同步底层开关的兼容调用；只有底层开关从关闭改为开启时弹出已有重载确认框。

- [ ] **步骤 4：运行测试并确认通过**

运行：

```bash
lua tests/PlayerAuras_test.lua
luac -p MainMenu/PlayerAuras.lua
```

预期：打印 `PlayerAuras_test: OK`，语法检查无输出且退出码为 0。

- [ ] **步骤 5：提交控制器**

```bash
git add MainMenu/PlayerAuras.lua tests/PlayerAuras_test.lua
git commit -m "功能：增加玩家光环独立显隐控制"
```

### 任务二：把原生光环页拆成两个过滤视图

**文件：**
- 修改：`tests/SettingsStructure_test.lua`
- 修改：`MainMenu/MainMenu.lua:8-24`
- 修改：`MainMenu/MainMenu.lua:130-188`
- 修改：`MainMenu/MainMenu.lua:210-350`

- [ ] **步骤 1：先写菜单和视图结构的失败测试**

在 `tests/SettingsStructure_test.lua` 读取 `MainMenu/MainMenu.lua` 和 `MainMenu/PlayerAuras.lua`，增加：

```lua
local mainMenu = Read("MainMenu/MainMenu.lua")
local playerAuras = Read("MainMenu/PlayerAuras.lua")

for _, required in ipairs({
    '{"增益光环", "player_buff_aura"}',
    '{"减益光环", "player_debuff_aura"}',
    'group = "PlayerBuffs"',
    'group = "PlayerDebuffs"',
    "PreparePlayerAuraPanel",
    "ShowPlayerAuraPanelView",
    "RestorePlayerAuraPanel",
}) do
    assert(mainMenu:find(required, 1, true),
        "玩家光环拆分缺少结构：" .. required)
end

assert(not mainMenu:find('{"光环", "player_aura"}', 1, true),
    "玩家菜单不能继续显示合并的光环入口")
assert(playerAuras:find("playerBuffAurasEnabled", 1, true)
    and playerAuras:find("playerDebuffAurasEnabled", 1, true),
    "两个光环页面必须使用独立保存键")
```

- [ ] **步骤 2：运行测试并确认按预期失败**

运行：

```bash
lua tests/SettingsStructure_test.lua
```

预期：失败，提示缺少“增益光环”菜单或 `PreparePlayerAuraPanel`。

- [ ] **步骤 3：替换玩家菜单定义**

在 `MainMenu/MainMenu.lua` 中保留物理必需页面 `player_aura`，只替换菜单定义：

```lua
local PLAYER_PAGE_DEFINITIONS = {
    {"综合", "player_general"},
    {"资源条", "player_classpower"},
    {"增益光环", "player_buff_aura"},
    {"减益光环", "player_debuff_aura"},
}

local AURA_VIEW_DEFINITIONS = {
    player_buff_aura = {
        kind = "buff",
        group = "PlayerBuffs",
        breadcrumb = "增益光环",
        sub = "调整玩家增益光环。",
    },
    player_debuff_aura = {
        kind = "debuff",
        group = "PlayerDebuffs",
        breadcrumb = "减益光环",
        sub = "调整玩家减益光环。",
    },
}
```

过滤时不要硬编码本地化后的 `Buffs`/`Debuffs` 文本。通过设置路径前缀 `PlayerBuffs.` 和 `PlayerDebuffs.` 判断所属视图，再从首个匹配设置项的 `groupHeaderName` 取得实际本地化分组名；分组标题只作为匹配项前的装饰行加入。

- [ ] **步骤 4：增加光环面板准备、显示和恢复函数**

在 `PrepareUnitFrameSettings` 前增加以下辅助函数和三个页面函数：

```lua
local function CopyMap(source)
    if not source then return nil end
    local copy = {}
    for key, value in pairs(source) do copy[key] = value end
    return copy
end

local function SetOptionDependencies(option, dependencies)
    option.dependence = CopyMap(dependencies)
    if option.__widget then
        option.__widget.dependence = CopyMap(dependencies)
    end
end

local function BuildAuraView(panel, kind, toggle, definition)
    local wanted = {}
    local viewOptions = {toggle}
    local groupName

    for _, option in ipairs(panel.__gwPlusAuraOriginalOptions) do
        local optionName = option.optionName
        if optionName
            and optionName:sub(1, #definition.group + 1)
                == definition.group .. "." then
            wanted[option] = true
            viewOptions[#viewOptions + 1] = option
            groupName = groupName or option.groupHeaderName
        end
    end

    local filtered = CreateDataProvider()
    local rowIndex = 1
    filtered:Insert({
        index = rowIndex,
        cols = {toggle},
        panel = panel,
    })

    panel.__gwPlusAuraOriginalProvider:ForEach(function(data)
        if data.kind then
            local header = data.cols and data.cols[1]
            if header and header.name == groupName then
                rowIndex = rowIndex + 1
                filtered:Insert({
                    index = rowIndex,
                    kind = data.kind,
                    cols = data.cols,
                    panel = panel,
                })
                viewOptions[#viewOptions + 1] = header
            end
            return
        end

        local cols = {}
        for _, option in ipairs(data.cols or {}) do
            if wanted[option] then cols[#cols + 1] = option end
        end
        if #cols > 0 then
            rowIndex = rowIndex + 1
            filtered:Insert({
                index = rowIndex,
                cols = cols,
                panel = panel,
            })
        end
    end)

    return {
        provider = filtered,
        options = viewOptions,
        nativeOptions = wanted,
    }
end

local function PreparePlayerAuraPanel(panel)
    if not panel or panel.__gwPlusAuraPrepared then return end
    local Auras = addonTable.PlusPlayerAuras
    local provider = panel.scroll and panel.scroll.ScrollBox
        and panel.scroll.ScrollBox:GetDataProvider()
    if not Auras or not provider then return end

    panel.__gwPlusAuraOriginalProvider = provider
    panel.__gwPlusAuraOriginalOptions = {}
    for _, option in ipairs(panel.gwOptions or {}) do
        panel.__gwPlusAuraOriginalOptions[
            #panel.__gwPlusAuraOriginalOptions + 1] = option
    end
    panel.__gwPlusAuraOriginalBreadcrumb = panel.breadcrumb:GetText()
    panel.__gwPlusAuraOriginalSub = panel.sub:GetText()
    panel.__gwPlusAuraOriginalDependencies = {}
    for _, option in ipairs(panel.__gwPlusAuraOriginalOptions) do
        panel.__gwPlusAuraOriginalDependencies[option] =
            CopyMap(option.dependence)
    end

    local toggles = {
        buff = Auras.CreateToggleOption(panel, "buff"),
        debuff = Auras.CreateToggleOption(panel, "debuff"),
    }
    panel.__gwPlusAuraViews = {
        buff = BuildAuraView(
            panel, "buff", toggles.buff,
            AURA_VIEW_DEFINITIONS.player_buff_aura),
        debuff = BuildAuraView(
            panel, "debuff", toggles.debuff,
            AURA_VIEW_DEFINITIONS.player_debuff_aura),
    }
    panel.__gwPlusAuraToggles = toggles
    panel.__gwPlusAuraPrepared = true
end

local function ShowPlayerAuraPanelView(panel, definition)
    PreparePlayerAuraPanel(panel)
    if not panel.__gwPlusAuraViews then return end
    local view = panel.__gwPlusAuraViews[definition.kind]
    local dependencyKey = definition.kind == "buff"
        and "playerBuffAurasEnabled"
        or "playerDebuffAurasEnabled"
    for option in pairs(view.nativeOptions) do
        local dependencies = CopyMap(
            panel.__gwPlusAuraOriginalDependencies[option])
        if dependencies
            and dependencies.PLAYER_BUFFS_ENABLED ~= nil then
            local expected = dependencies.PLAYER_BUFFS_ENABLED
            dependencies.PLAYER_BUFFS_ENABLED = nil
            dependencies[dependencyKey] = expected
        end
        SetOptionDependencies(option, dependencies)
    end
    panel.gwOptions = view.options
    panel.scroll.ScrollBox:SetDataProvider(
        view.provider,
        ScrollBoxConstants.RetainScrollPosition)
    panel.breadcrumb:SetText(definition.breadcrumb)
    panel.sub:SetText(definition.sub)
    if GW2_ADDON.CheckDependencies then
        GW2_ADDON.CheckDependencies()
    end
end

local function RestorePlayerAuraPanel(panel)
    if not panel or not panel.__gwPlusAuraPrepared then return end
    for option, dependencies in pairs(
        panel.__gwPlusAuraOriginalDependencies) do
        SetOptionDependencies(option, dependencies)
    end
    panel.scroll.ScrollBox:SetDataProvider(
        panel.__gwPlusAuraOriginalProvider,
        ScrollBoxConstants.RetainScrollPosition)
    panel.gwOptions = panel.__gwPlusAuraOriginalOptions
    panel.breadcrumb:SetText(panel.__gwPlusAuraOriginalBreadcrumb)
    panel.sub:SetText(panel.__gwPlusAuraOriginalSub)
end
```

上述实现的过滤依据只能是 `PlayerBuffs.` 和 `PlayerDebuffs.` 设置路径。行数据继续使用原生 `option` 对象和原生 `panel`，不得复制 getter、setter 或 callback。

在 `PrepareUnitFrameSettings` 的页面扫描条件中加入 `player_aura`，扫描结束后调用：

```lua
PreparePlayerAuraPanel(embeddedPanels.player_aura)
```

- [ ] **步骤 5：让两个虚拟页面复用同一个物理页面**

在 `BuildMainMenuTab` 内：

```lua
local function ResolvePage(panelId)
    local auraView = AURA_VIEW_DEFINITIONS[panelId]
    return auraView and pages.player_aura or pages[panelId], auraView
end
```

调整 `RestoreCurrent`，恢复框体前先恢复完整光环页：

```lua
if currentAuraPanel then
    RestorePlayerAuraPanel(currentAuraPanel)
    currentAuraPanel = nil
end
```

调整 `SelectPage(panelId)`：

```lua
local frame, auraView = ResolvePage(panelId)
if auraView then
    ShowPlayerAuraPanelView(frame, auraView)
    currentAuraPanel = frame
end
```

`playerExpanded` 的判断包含 `player_buff_aura` 和 `player_debuff_aura`，不再包含作为物理 ID 的 `player_aura`。菜单高亮仍比较虚拟 `panelId`，确保两个入口不会同时高亮。

- [ ] **步骤 6：运行结构测试和语法检查**

运行：

```bash
lua tests/SettingsStructure_test.lua
luac -p MainMenu/MainMenu.lua MainMenu/PlayerAuras.lua
```

预期：打印 `SettingsStructure_test: OK`，语法检查无输出且退出码为 0。

- [ ] **步骤 7：提交页面拆分**

```bash
git add MainMenu/MainMenu.lua tests/SettingsStructure_test.lua
git commit -m "功能：拆分玩家增益与减益光环设置"
```

### 任务三：接入加载顺序并完成回归测试

**文件：**
- 修改：`GW2_UI_PLUS.toc:36-39`
- 修改：`tests/SettingsStructure_test.lua`

- [ ] **步骤 1：先写加载顺序的失败测试**

在 `tests/SettingsStructure_test.lua` 增加：

```lua
local toc = Read("GW2_UI_PLUS.toc")
local playerAuraPos = assert(
    toc:find("MainMenu/PlayerAuras.lua", 1, true),
    "TOC 必须加载玩家光环控制器")
local mainMenuPos = assert(
    toc:find("MainMenu/MainMenu.lua", 1, true),
    "TOC 必须加载框体菜单")
assert(playerAuraPos < mainMenuPos,
    "玩家光环控制器必须在框体菜单之前加载")
```

- [ ] **步骤 2：运行测试并确认按预期失败**

运行：

```bash
lua tests/SettingsStructure_test.lua
```

预期：失败并提示 TOC 缺少玩家光环控制器。

- [ ] **步骤 3：加入 TOC**

把主菜单模块顺序调整为：

```toc
MainMenu/EnergyTicker.lua
MainMenu/PlayerResources.lua
MainMenu/PlayerAuras.lua
MainMenu/MainMenu.lua
MainMenu/SettingsIcon.lua
```

- [ ] **步骤 4：运行全部本地测试**

运行：

```bash
for test_file in tests/*_test.lua; do
    lua "$test_file" || exit 1
done
```

预期：每个测试打印 `..._test: OK`，命令退出码为 0。

- [ ] **步骤 5：检查 Lua 语法和空白**

运行：

```bash
luac -p MainMenu/PlayerAuras.lua MainMenu/MainMenu.lua core.lua
git diff --check -- \
    MainMenu/PlayerAuras.lua \
    MainMenu/MainMenu.lua \
    GW2_UI_PLUS.toc \
    tests/PlayerAuras_test.lua \
    tests/SettingsStructure_test.lua
```

预期：两条命令均无输出且退出码为 0。

- [ ] **步骤 6：确认改动范围不包含 GW2_UI 本体**

运行：

```bash
git -C ../../.. diff --name-only 19c24b09..HEAD -- \
    Interface/AddOns/GW2_UI \
    Interface/AddOns/GW2_UI_PLUS
```

预期：设计提交 `19c24b09` 之后的功能提交全部位于 `Interface/AddOns/GW2_UI_PLUS/`；输出中没有 `Interface/AddOns/GW2_UI/` 路径。工作树中既有的其他插件改动不属于本功能，不据此清理或覆盖。

- [ ] **步骤 7：提交加载接入**

```bash
git add GW2_UI_PLUS.toc tests/SettingsStructure_test.lua
git commit -m "构建：加载玩家光环拆分模块"
```

### 任务四：游戏内验收

**文件：**
- 验证：`MainMenu/PlayerAuras.lua`
- 验证：`MainMenu/MainMenu.lua`

- [ ] **步骤 1：非战斗状态验收**

在游戏中执行 `/reload`，依次检查：

1. “框体 → 玩家”显示“增益光环”和“减益光环”，不显示旧“光环”。
2. 两页只包含各自开关和对应原生设置。
3. 关闭增益后只有 `GW2UIPlayerBuffs` 隐藏。
4. 关闭减益后只有 `GW2UIPlayerDebuffs` 隐藏。
5. 两者关闭后暴雪原生光环没有恢复。
6. 重新开启后原排序、尺寸和位置不变。

- [ ] **步骤 2：战斗状态验收**

进入战斗后切换任一开关，确认：

1. 聊天框和 BugSack 没有受保护操作错误。
2. 战斗中保存值已经改变。
3. 脱战后对应光环框自动应用新状态。

- [ ] **步骤 3：重载与原生入口验收**

执行 `/reload`，确认独立显示状态保持；打开 GW2_UI 原生玩家光环页面，确认原生总开关、增益组和减益组仍完整显示。
