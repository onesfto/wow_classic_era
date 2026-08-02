# 频道按钮条 (ChatBar) —— 交接文档

聊天栏旁的一条快捷按钮，包含频道切换、常用功能和插件快捷入口。

**核心定位：完全独立。** 自带 SavedVariables、自带频道查询与屏蔽判定逻辑，不读写 `!Pig` 的任何数据。两者可以同时装、各跑各的（也就会各画一条按钮条，需要自行关掉其中一条）。

---

## 一、文件

```
ChatBar/
├── ChatBar.lua    按钮条本体：配置、按钮定义、频道逻辑、表情面板、诊断命令
├── Options.lua    GW2_UI 设置面板
└── README.md      本文档
```

在 `GW2_UI_PLUS.toc` 中的加载顺序（**不可调换**）：

```
ChatBar/ChatBar.lua      ← 必须在 Options.lua 之前，后者依赖 addonTable.ChatBar
ChatBar/Options.lua      ← 必须在 core.lua 之前，后者调用 addonTable.BuildChatBarPanel
core.lua
```

SavedVariables 声明：`GW2_UI_PLUS_ChatBarSV`（与 `GW2_UI_PLUS_SV`、`alaGearManSV` 并列，互不干扰）。

---

## 二、按钮规格

共 19 个，顺序即屏幕上的左右顺序：

| # | 显示 | key | 左键 | 右键 |
|---|---|---|---|---|
| 1 | 说 | `SAY` | `/s` | 重载界面 |
| 2 | 喊 | `YELL` | `/y`（顺带取消屏蔽） | 屏蔽 |
| 3 | 会 | `GUILD` | `/g`（顺带取消屏蔽） | 屏蔽 |
| 4 | 队 | `PARTY` | `/p` | 无 |
| 5 | 团 | `RAID` | `/ra` | `/rw` 团队通告 |
| 6 | 战 | `INSTANCE_CHAT` | `/bg` | `/rw` 团队通告 |
| 7 | 综 | `GENERAL` | 打开并切频道 | 屏蔽 |
| 8 | 交 | `TRADE` | 同上 | 同上 |
| 9 | 组 | `LOOK_FOR_GROUP` | 同上 | 同上 |
| 10 | P | `PIG` | 同上 | 同上 |
| 11 | 世 | `BIGFOOTWORLD` | 同上 | 同上 |
| 12 | 表 | `EMOJI` | 展开表情面板 | — |
| 13 | 骰 | `ROLL` | Roll 1-100 | 拾取记录 |
| 14 | 宏 | `MACRO` | 开/关宏命令窗口 | — |
| 15 | 距 | `DBM` | 开/关 DBM 距离检测 | — |
| 16 | 掉 | `ATLASLOOT` | 开 AtlasLoot | — |
| 17 | 金 | `BIAOGE` | 开表格 | — |
| 18 | 集 | `MEETINGHORN` | 开集结号 | — |
| 19 | M | `MRT` | MRT 团队检查 | — |

### 交互模型：左开右关

可屏蔽的频道（喊、会、综、交、组、P、世）统一遵循：

- **左键 = 开**：打开/显示频道并切过去准备发言。若该频道当前被屏蔽（置灰），左键顺带取消屏蔽、恢复亮色并提示「已显示 X 频道」。
- **右键 = 关**：只屏蔽（隐藏）。已屏蔽再右键只提示「已是屏蔽状态」，**不会取消屏蔽**——取消屏蔽一律走左键。

这样按钮的灰/亮直接对应频道的关/开，不用记 toggle 状态。

### 三类按钮 (`kind`)

- **`chat`** — 暴雪内置聊天类型，左键斜杠命令切输入框；可屏蔽的（喊/会）右键操作 message group
- **`channel`** — 编号频道，左键先确保已加入再切过去，右键操作频道显示（订阅）
- **`tool`** — 功能按钮，行为写在 `onClick` 里

### 屏蔽标记：文字置灰

屏蔽的频道**不再显示图标**，改为把按钮文字染灰 `{0.5, 0.5, 0.5}`（`SetBlockedState`）；取消屏蔽时恢复各按钮自己的 `color`。

只有**右键是屏蔽功能**的按钮才会置灰。所以「说」（右键重载）、「队」（无右键）、「团」「战」（右键是通告）永远不置灰。

刷新时机：点击后立即更新；登录后 3/5/10 秒各补刷一次（频道订阅状态要等聊天系统就绪才读得准，单次读取会拿到空值）。

### 动态显隐

`autoHide` 开启时（默认），按 `visible()` 判定：

| 按钮 | 条件 |
|---|---|
| 会 | `IsInGuild()` |
| 队 | `IsInGroup()` |
| 团 | `IsInRaid()` |
| 战 | `IsInRaid(LE_PARTY_CATEGORY_INSTANCE)` |

隐藏后其余按钮会左移补位，不留空档。监听 `GROUP_ROSTER_UPDATE` / `PLAYER_GUILD_UPDATE`，带 0.4 秒防抖。

### 插件按钮的存在性

`addon` 字段声明依赖。目标插件没装时，**按钮不创建，设置面板里也不列出该项**。判定在 `Build()` 时做一次，装/卸插件后需重载界面。

| 按钮 | 依赖 | 调用 |
|---|---|---|
| 距 | `DBM-Core` | `DBM.RangeCheck:Show(10, nil, true)` / `:Hide(true)` |
| 掉 | `AtlasLootClassic` | `SlashCmdList["ATLASLOOT"]("")` |
| 金 | `BiaoGe` | `SlashCmdList["BIAOGE"]("")` |
| 集 | `MeetingHorn` | `LibStub("AceAddon-3.0"):GetAddon("MeetingHorn"):Toggle()` |
| M | `MRT` | `ExRT.A.RaidCheck:ReadyCheckWindow(nil, nil, true)` |

---

## 三、配置

```lua
GW2_UI_PLUS_ChatBarSV = {
    enable      = true,   -- 主开关，改动需重载界面
    hidden      = {},     -- [按钮 key] = true 表示隐藏
    anchor      = 1,      -- 1 = 聊天栏上方，2 = 下方
    offsetX     = -26,    -- 默认位置；设置面板「重置」也回到此值
    offsetY     = 10,
    scale       = 1.0,
    fadeOnLeave = false,  -- 鼠标离开聊天栏与按钮条时淡出到 6% 透明度
    autoHide    = true,   -- 动态显隐
    banWindow   = nil,    -- 屏蔽操作作用于哪个聊天窗口，nil = 第一个
}
```

`InitDB()` 只补缺失的键，不覆盖已有值，因此加新配置项直接往 `defaults` 里写即可，老存档会自动补齐。

`defaults` 表通过 `ChatBar.defaults` 暴露给设置面板：X/Y/缩放的滑块默认值和「重置位置与缩放」按钮都引用它，是唯一数据源——**改默认值只改 `defaults` 一处**。（注意：改默认值只影响新存档和点「重置」，老存档里已存的值不会被动。）

---

## 四、设置面板

位置：GW2_UI 设置窗口 → **聊天 → 频道按钮**。

由 `Options.lua` 的 `BuildPanel()` 构建，导出为 `addonTable.BuildChatBarPanel`，在 `core.lua` 里被塞进 `subPanels`。

选项构成：主开关 → 基本设置（渐隐、动态显隐）→ 位置与外观（附着位置、X/Y 偏移、缩放、重置）→ 聊天频道（屏蔽控制窗口和频道按钮）→ 快捷功能 → 插件入口。

### 两个必须注意的坑

**1. 重载提示要放 `callback`，不能放 `setter`**

GW2_UI 的 `WrapReloadTracking` 只包装 `callback`，在 `setter` 里设 `GW.ShowRlPopup` 不会被检测到。

```lua
setter   = function(value) db.enable = value end,
callback = function() GW.ShowRlPopup = true end,   -- 必须在这里
```

**2. 重置按钮要手动重绘滑块**

改了配置值，widget 的显示不会自己跟着变。三个滑块因此都设了 `optionName`，重置时通过 `GW.FindSettingsWidgetByOption()` 找到 widget 手动 `SetValue`。加新滑块且需要被重置影响的，照此办理。

### 依赖关系

除主开关外所有选项都带 `dependence = {["GW2PlusChatBar_Enable"] = true}`，主开关关掉时全部置灰。

---

## 五、表情

**用的是 GW2_UI 自带的 27 个表情**（`GW2_UI/textures/emoji/*.png`），表情码是 `:smile:` 这种格式。

点击只往输入框插入文本码，**渲染完全交给 GW2_UI 的聊天模块**——本模块不做任何消息过滤。所以：

> **前提：GW2_UI 设置里的「聊天表情」(`CHAT_KEYWORDS_EMOJI`，它又依赖「GW2 聊天框」`CHATFRAME_ENABLED`) 必须开着**，否则发出去就是 `:smile:` 字面量。渲染发生在消息显示时（GW2_UI 的 `ChatFrame_AddMessageEventFilter` → `GetSmileyReplacementText`）。

这是有意的设计：自己再挂一层 `ChatFrame_AddMessageEventFilter` 会和 GW2_UI 的渲染重复。

面板每行 10 个，尺寸按 `#EmojiData` 自动算行数。鼠标移开 1.5 秒自动收起。

---

## 六、皮肤

不提供样式选项，直接套 GW2 风格：

- 背景 `GwCreateBackdrop(GW.BackdropTemplates.Default)`
- 字体 `GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Normal, "OUTLINE")`，去阴影
- 悬停 12% 白色叠加

### 两处不能删的兜底

```lua
-- 1. FontString 必须继承模板，否则没有字体对象，SetText 什么都不显示
button.Text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")

-- 2. GwCreateBackdrop 只画边框不填背景，没这层按钮是全透明的
button.bg:SetColorTexture(0, 0, 0, 0.55)
```

层级用 `MEDIUM`，`LOW` 会被 GW2_UI 的聊天框背景压住。

---

## 七、诊断命令

```
/gwcb          打印完整状态
/gwcb test     强制移到屏幕正中、放大 2 倍、层级拉满
/gwcb reset    恢复正常位置
```

`/gwcb` 输出：enable、按钮总数与实际显示数、可见性、透明度、缩放、层级、尺寸、屏幕坐标、ChatFrame1 状态。

排查按钮条不可见时的判读：

| 现象 | 结论 |
|---|---|
| 「按钮条未创建」 | `Build()` 没跑，查加载顺序或 `enable` |
| 有坐标但看不见 | 位置或遮挡问题 |
| 「取不到屏幕坐标」 | 锚点没生效，查 `ChatFrame1` |
| `/gwcb test` 后能看见 | 位置/层级问题 |
| `/gwcb test` 后仍看不见 | 没画出来，查字体和背景兜底 |

---

## 八、怎么加一个新按钮

往 `ChatBar.lua` 的 `BUTTONS` 表插一条，位置即显示顺序：

```lua
{key = "XXX", text = "字", kind = "tool", color = {1, 0.82, 0},
    addon = "目标插件文件夹名",        -- 可选，没装就不创建
    tip = "鼠标提示",
    onClick = function(_, button)
        if button == "LeftButton" then ... else ... end
    end},
```

然后在 `Options.lua` 补两处：`GROUPS` 里对应分组的 `keys`、`BUTTON_LABEL` 里的显示名。**漏了 `BUTTON_LABEL` 会拿 key 当标签显示。**

字段速查：

| 字段 | 说明 |
|---|---|
| `key` | 唯一标识，也是 `hidden` 表的键；`chat`/`channel` 类型下默认用它取 `_G[key]` 作频道名 |
| `kind` | `chat` / `channel` / `tool` |
| `cmd` | 左键斜杠命令（不含 `/`） |
| `rightCmd` | 右键斜杠命令；**设了它右键就不再是屏蔽**（如团/战的 `/rw`） |
| `noRight` | 右键无屏蔽行为；若同时设了 `onRight` 则右键执行 `onRight` |
| `onRight` | 右键自定义回调（优先级最高，`chat` 类生效，如「说」的重载界面） |
| `rightTip` | tooltip 里对右键动作的说明文字，配合 `onRight` |
| `msgGroup` | 屏蔽时要操作的 message group 数组，缺省用 `{key}` |
| `channelName` | 直接指定频道名，用于 `_G[key]` 取不到的自定义频道（P、世） |
| `visible` | 动态显隐判定函数 |
| `addon` | 依赖的插件文件夹名 |
| `onClick` | `tool` 类型的点击处理 |

---

## 九、已知限制

1. **「战」的右键 `/rw` 需要团长或助理权限。** Classic Era 没有战场专属的通知频道——`INSTANCE_CHAT_LEADER` / `BATTLEGROUND_LEADER` 只是接收消息时的标记类型，不能作为发送目标。随机战场里通常没权限，会提示「你不是团队领袖」。这是明知的选择，不是遗漏。

2. **「P」「世」依赖服务器是否存在这些频道。** 没加入时左键会先 `JoinTemporaryChannel`，1 秒后回报成功或失败；不存在的服务器上会提示加入失败。

3. **插件存在性只在 `Build()` 时判定一次**，中途启用插件要重载界面。

4. **锚点写死在 `ChatFrame1`**，不跟随其他聊天窗口。

---

## 十、测试

游戏外的 stub 测试在会话的 scratchpad 目录：

- `stub.lua` — 极简 WoW API 模拟层
- `run.lua` — 169 项断言

```bash
lua run.lua
```

覆盖：文件加载、`Build()` 全流程、19 个按钮逐个左右键点击、鼠标进出、所有刷新路径、置灰屏蔽标记、隐藏后重排、动态显隐、未装插件不建按钮、设置面板构建与读写、`core.lua` 面板注册、诊断命令。

**注意 stub 的两个陷阱**（改 stub 时容易踩）：

- WoW 是 Lua 5.1，`unpack` 是全局函数；本地 Lua 5.4 下需 `unpack = table.unpack` 补回
- `FrameMT.__index` 对缺失字段返回空函数，但 `__` 开头的内部数据字段必须返回 `nil`，否则 `self.__w or 100` 会拿到函数

**stub 测不了渲染。** 贴图位置、字体是否真的显示、点击手感、真实频道号，这些只能进游戏看。改完务必 `/reload` 实测。
