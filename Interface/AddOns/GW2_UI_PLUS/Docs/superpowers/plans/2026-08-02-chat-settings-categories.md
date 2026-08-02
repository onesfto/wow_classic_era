# 聊天设置分类实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将“Plus > 聊天”现有三个页面重组为聊天增强、窗口布局、频道按钮、消息管理四个菜单，同时保留全部设置行为并移除重复入口。

**Architecture:** 新增 `ChatCategories.lua`，从已初始化的 GW2_UI 原生聊天面板和 GW2_UI_PLUS 聊天窗口面板中取得现有选项描述，按职责迁移到三个新面板；频道按钮继续使用原面板并在构建阶段调整分组。迁移前注销旧来源面板的控件注册项，迁移后使用 GW2_UI 的 `RefreshSettingsPanel` 创建新控件，确保跨页面依赖只命中新入口。

**Tech Stack:** Lua 5.1、World of Warcraft Classic Era UI API、GW2_UI 设置面板 API、POSIX shell 静态回归测试。

---

### Task 1: 扩充聊天菜单回归测试

**Files:**
- Modify: `tests/chat_settings_regression.sh`

- [ ] **Step 1: 写入四页菜单和分类边界的失败检查**

在现有测试中新增 `chat_categories_file`，检查：

```sh
chat_categories_file="Modules/Settings/ChatCategories.lua"

grep -F 'Modules/Settings/ChatCategories.lua' "$toc_file" >/dev/null
grep -F 'addonTable.BuildChatCategoryPanels' "$chat_categories_file" >/dev/null
grep -F 'AddMenuEntry("聊天增强", chatPanels.enhancement)' "$chat_tab_file" >/dev/null
grep -F 'AddMenuEntry("窗口布局", chatPanels.layout)' "$chat_tab_file" >/dev/null
grep -F 'AddMenuEntry("频道按钮", chatPanels.chatBar)' "$chat_tab_file" >/dev/null
grep -F 'AddMenuEntry("消息管理", chatPanels.messages)' "$chat_tab_file" >/dev/null
grep -F 'SetPanelTitle(chatPanels.enhancement, "聊天增强")' "$chat_tab_file" >/dev/null
grep -F 'SetPanelTitle(chatPanels.layout, "窗口布局")' "$chat_tab_file" >/dev/null
grep -F 'SetPanelTitle(chatPanels.messages, "消息管理")' "$chat_tab_file" >/dev/null

if grep -F 'AddMenuEntry("综合", pages.chat_general)' "$chat_tab_file" >/dev/null; then
    echo "聊天菜单不应继续显示综合" >&2
    exit 1
fi
if grep -F 'AddMenuEntry("聊天窗口", chatPanels.chatWindow)' "$chat_tab_file" >/dev/null; then
    echo "聊天菜单不应继续显示聊天窗口" >&2
    exit 1
fi

grep -F 'CHAT_BUTTONS_POSITION = "layout"' "$chat_categories_file" >/dev/null
grep -F 'GW2PlusChatWindow_ClassColor = "enhancement"' "$chat_categories_file" >/dev/null
grep -F 'GW2PlusChatWindow_HideJoinLeave = "messages"' "$chat_categories_file" >/dev/null
grep -F 'GW2PlusChatWindow_Blacklist = "messages"' "$chat_categories_file" >/dev/null
grep -F 'option.name = "高亮关键词"' "$chat_categories_file" >/dev/null
grep -F 'option.name = "黑名单关键词"' "$chat_categories_file" >/dev/null
```

同时删除旧的三个菜单断言。

- [ ] **Step 2: 运行测试并确认失败**

Run: `sh tests/chat_settings_regression.sh`

Expected: FAIL，因为 `Modules/Settings/ChatCategories.lua` 尚不存在，菜单仍为“综合、频道按钮、聊天窗口”。

- [ ] **Step 3: 提交失败测试**

```bash
git add tests/chat_settings_regression.sh
git commit -m "test: 添加聊天设置分类回归检查"
```

### Task 2: 为聊天窗口选项补充稳定标识

**Files:**
- Modify: `Modules/ChatWindow/Options.lua`
- Test: `tests/chat_settings_regression.sh`

- [ ] **Step 1: 给所有需要迁移的 GW2_UI_PLUS 选项设置唯一 `optionName`**

保留现有 getter、setter、默认值和回调，只把返回的选项保存到局部变量并设置以下标识：

```lua
GW2PlusChatWindow_Enable
GW2PlusChatWindow_Width
GW2PlusChatWindow_Height
GW2PlusChatWindow_OffsetX
GW2PlusChatWindow_OffsetY
GW2PlusChatWindow_ResetPosition
GW2PlusChatWindow_ClassColor
GW2PlusChatWindow_EditBoxTop
GW2PlusChatWindow_ButtonsPosition
GW2PlusChatWindow_HideJoinLeave
GW2PlusChatWindow_TrimRepeat
GW2PlusChatWindow_BlacklistEnable
GW2PlusChatWindow_Blacklist
GW2PlusChatWindow_HideBugGrabberSpam
```

例如：

```lua
local optClassColor = panel:AddOption("玩家名用职业颜色", desc, values)
if optClassColor then
    optClassColor.optionName = "GW2PlusChatWindow_ClassColor"
end
```

`GW2PlusChatWindow_ButtonsPosition`只用于识别并丢弃旧重复入口；实际四页菜单使用 GW2_UI 原生的 `CHAT_BUTTONS_POSITION` 选项。

- [ ] **Step 2: 在回归测试中检查关键稳定标识**

```sh
grep -F 'GW2PlusChatWindow_ClassColor' "Modules/ChatWindow/Options.lua" >/dev/null
grep -F 'GW2PlusChatWindow_ButtonsPosition' "Modules/ChatWindow/Options.lua" >/dev/null
grep -F 'GW2PlusChatWindow_HideJoinLeave' "Modules/ChatWindow/Options.lua" >/dev/null
grep -F 'GW2PlusChatWindow_Blacklist' "Modules/ChatWindow/Options.lua" >/dev/null
```

- [ ] **Step 3: 运行回归测试并确认仍因分类模块缺失而失败**

Run: `sh tests/chat_settings_regression.sh`

Expected: FAIL at `Modules/Settings/ChatCategories.lua` check;新增的稳定标识检查通过。

- [ ] **Step 4: 提交稳定标识**

```bash
git add Modules/ChatWindow/Options.lua tests/chat_settings_regression.sh
git commit -m "refactor: 标记聊天窗口设置选项"
```

### Task 3: 构建聊天增强、窗口布局和消息管理页面

**Files:**
- Create: `Modules/Settings/ChatCategories.lua`
- Modify: `GW2_UI_PLUS.toc`
- Modify: `Modules/Settings/ChatTab.lua`
- Test: `tests/chat_settings_regression.sh`

- [ ] **Step 1: 在 TOC 中按依赖顺序加载分类模块**

在 `Modules/Settings/ChatTab.lua` 前加入：

```text
Modules/Settings/ChatCategories.lua
Modules/Settings/ChatTab.lua
```

- [ ] **Step 2: 定义来源选项到目标页面的唯一归属**

`ChatCategories.lua` 使用以下映射；未列出的 `GW2PlusChatWindow_ButtonsPosition`为被删除的重复入口：

```lua
local OPTION_TARGETS = {
    CHATFRAME_ENABLED = "enhancement",
    CHAT_USE_GW2_STYLE = "enhancement",
    CHAT_FIND_URL = "enhancement",
    CHAT_HYPERLINK_TOOLTIP = "enhancement",
    CHAT_SHORT_CHANNEL_NAMES = "enhancement",
    CHAT_SHOW_LFG_ICONS = "enhancement",
    CHAT_CLASS_COLOR_MENTIONS = "enhancement",
    CHAT_KEYWORDS_EMOJI = "enhancement",
    CHAT_SOCIAL_LINK = "enhancement",
    copyChatLines = "enhancement",
    GW2PlusChatWindow_ClassColor = "enhancement",

    GW2PlusChatWindow_Enable = "layout",
    GW2PlusChatWindow_Width = "layout",
    GW2PlusChatWindow_Height = "layout",
    GW2PlusChatWindow_OffsetX = "layout",
    GW2PlusChatWindow_OffsetY = "layout",
    GW2PlusChatWindow_ResetPosition = "layout",
    CHATFRAME_FADE = "layout",
    CHATFRAME_EDITBOX_HIDE = "layout",
    GW2PlusChatWindow_EditBoxTop = "layout",
    CHAT_BUTTONS_POSITION = "layout",
    CHAT_NUM_SCROLL_MESSAGES = "layout",
    CHAT_SCROLL_DOWN_INTERVAL = "layout",

    chatHistory = "messages",
    historySize = "messages",
    CHAT_MAX_COPY_CHAT_LINES = "messages",
    CHAT_ADD_TIMESTAMP_TO_ALL = "messages",
    timeStampFormat = "messages",
    CHAT_KEYWORDS = "messages",
    CHAT_KEYWORDS_ALERT_COLOR = "messages",
    CHAT_KEYWORDS_ALERT_NEW = "messages",
    interruptAnnounce = "messages",
    CHAT_SPAM_INTERVAL_TIMER = "messages",
    CHAT_INCOMBAT_TEXT_REPEAT = "messages",
    GW2PlusChatWindow_HideJoinLeave = "messages",
    GW2PlusChatWindow_TrimRepeat = "messages",
    GW2PlusChatWindow_BlacklistEnable = "messages",
    GW2PlusChatWindow_Blacklist = "messages",
    GW2PlusChatWindow_HideBugGrabberSpam = "messages",
}
```

- [ ] **Step 3: 注销旧来源面板控件并创建新面板**

实现局部辅助函数：

```lua
local function UnregisterPanelWidgets(panel)
    local registry = GW.SettingsWidgetRegistry
    local bucket = registry and registry.byPanel and registry.byPanel[panel]
    if not bucket then return end
    for index = #bucket.entries, 1, -1 do
        local entry = bucket.entries[index]
        RemoveArrayValue(registry.list, entry)
        if entry.optionName and registry.byOptionName then
            local entries = registry.byOptionName[entry.optionName]
            RemoveArrayValue(entries, entry)
            if entries and #entries == 0 then
                registry.byOptionName[entry.optionName] = nil
            end
        end
        if entry.widget then
            entry.widget:Hide()
            entry.widget.__gwRegEntry = nil
        end
    end
    registry.byPanel[panel] = nil
end
```

随后清除来源选项的 `__widget` / `__gwPlusWidget`，创建标题为“聊天”的三个新面板，并将原选项描述按设计顺序迁移到新面板。每个分组用 `AddGroupHeader` 创建，迁移选项同步设置 `groupHeaderName`。原生历史记录的“清空历史”按钮没有 `optionName`，通过紧跟 `historySize` 的 `button` 类型识别并迁移。

- [ ] **Step 4: 初始化新面板并导出构建函数**

三个面板构造完成后调用：

```lua
GW.RefreshSettingsPanel(panels.enhancement)
GW.RefreshSettingsPanel(panels.layout)
GW.RefreshSettingsPanel(panels.messages)
```

导出并缓存：

```lua
addonTable.BuildChatCategoryPanels = BuildChatCategoryPanels
```

如果来源面板、必需选项、注册表或 `RefreshSettingsPanel` 缺失，返回 `nil`，由调用方放弃创建聊天标签，避免展示残缺页面。

- [ ] **Step 5: 将聊天标签切换为四页菜单**

`ChatTab.lua` 调用分类构建函数，并按以下顺序注册：

```lua
SetPanelTitle(chatPanels.enhancement, "聊天增强")
SetPanelTitle(chatPanels.layout, "窗口布局")
SetPanelTitle(chatPanels.chatBar, "频道按钮")
SetPanelTitle(chatPanels.messages, "消息管理")

AddMenuEntry("聊天增强", chatPanels.enhancement)
AddMenuEntry("窗口布局", chatPanels.layout)
AddMenuEntry("频道按钮", chatPanels.chatBar)
AddMenuEntry("消息管理", chatPanels.messages)
```

默认打开 `chatPanels.enhancement`，不再引用 `pages.chat_general`或 `chatPanels.chatWindow`作为可见页面。

- [ ] **Step 6: 运行聊天回归测试**

Run: `sh tests/chat_settings_regression.sh`

Expected: `聊天设置菜单回归检查通过`。

- [ ] **Step 7: 提交分类页面实现**

```bash
git add GW2_UI_PLUS.toc Modules/Settings/ChatCategories.lua Modules/Settings/ChatTab.lua tests/chat_settings_regression.sh
git commit -m "feat: 拆分聊天设置分类"
```

### Task 4: 重排频道按钮页面内部分类

**Files:**
- Modify: `Modules/ChatBar/Options.lua`
- Test: `tests/chat_settings_regression.sh`

- [ ] **Step 1: 重命名按钮分组**

将常量改为：

```lua
local GROUPS = {
    {header = "聊天频道", keys = {
        "SAY", "YELL", "GUILD", "PARTY", "RAID", "INSTANCE_CHAT",
        "GENERAL", "TRADE", "LOOK_FOR_GROUP", "PIG", "BIGFOOTWORLD",
    }},
    {header = "快捷功能", keys = {"EMOJI", "ROLL", "MACRO"}},
    {header = "插件入口", keys = {"DBM", "ATLASLOOT", "BIAOGE", "MEETINGHORN", "MRT"}},
}
```

- [ ] **Step 2: 调整页面顺序**

频道按钮页面按以下顺序构建：

```text
启用
基本设置：鼠标离开渐隐、动态显隐
位置与外观：附着位置、X/Y 偏移、缩放、重置
聊天频道：频道屏蔽控制窗口、各聊天频道按钮
快捷功能：表情、Roll、宏命令
插件入口：已加载插件的快捷按钮
```

主开关依赖、动态插件检测和所有回调保持不变。

- [ ] **Step 3: 扩充并运行频道分组检查**

在 `tests/chat_settings_regression.sh` 加入：

```sh
grep -F '{header = "聊天频道"' "Modules/ChatBar/Options.lua" >/dev/null
grep -F '{header = "快捷功能"' "Modules/ChatBar/Options.lua" >/dev/null
grep -F '{header = "插件入口"' "Modules/ChatBar/Options.lua" >/dev/null
grep -F 'panel:AddGroupHeader("基本设置")' "Modules/ChatBar/Options.lua" >/dev/null
grep -F 'panel:AddGroupHeader("位置与外观")' "Modules/ChatBar/Options.lua" >/dev/null
```

Run: `sh tests/chat_settings_regression.sh`

Expected: `聊天设置菜单回归检查通过`。

- [ ] **Step 4: 提交频道按钮重排**

```bash
git add Modules/ChatBar/Options.lua tests/chat_settings_regression.sh
git commit -m "refactor: 重排频道按钮设置分组"
```

### Task 5: 全量验证

**Files:**
- Verify: `Modules/Settings/ChatCategories.lua`
- Verify: `Modules/Settings/ChatTab.lua`
- Verify: `Modules/ChatBar/Options.lua`
- Verify: `Modules/ChatWindow/Options.lua`
- Verify: `tests/*.sh`

- [ ] **Step 1: 检查 Lua 文件语法**

Run:

```bash
for file in Modules/Settings/ChatCategories.lua Modules/Settings/ChatTab.lua Modules/ChatBar/Options.lua Modules/ChatWindow/Options.lua; do
    luac -p "$file"
done
```

Expected: exit 0，无输出。若系统没有 `luac`，记录该限制并继续静态测试。

- [ ] **Step 2: 运行全部 shell 回归测试**

Run:

```bash
for test_file in tests/*.sh; do
    sh "$test_file"
done
```

Expected: 所有测试退出码为 0。

- [ ] **Step 3: 检查差异质量和菜单唯一性**

Run:

```bash
git diff --check
rg -n 'AddMenuEntry\("(综合|聊天窗口)"' Modules/Settings/ChatTab.lua
rg -n 'AddMenuEntry\("(聊天增强|窗口布局|频道按钮|消息管理)"' Modules/Settings/ChatTab.lua
```

Expected: `git diff --check`无输出；旧菜单搜索无结果；新菜单恰好四条且顺序正确。

- [ ] **Step 4: 复核提交范围**

Run: `git status --short`

Expected: 插件源码和测试没有本任务遗留的未提交修改；WTF、缓存和其他用户文件保持原样，不纳入提交。
