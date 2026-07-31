# 聊天窗口 (ChatWindow) —— 交接文档

主聊天窗的位置大小、外观和消息过滤。

**核心定位：管的是 GW2_UI 不管的那部分。** GW2_UI 的聊天模块只做皮肤，
位置、大小、职业颜色、消息过滤它一概不碰——那些归暴雪的 FCF 系统和事件过滤器管。
这个模块补的就是这块空缺，顺带把本体埋在「聊天」面板里的「聊天按钮位置」也拉过来一个入口。

**和 CChatFilter / Leatrix Plus / NDui 可以同时装。** 过滤器各注册各的，暴雪挨个问一遍；
位置和输入栏靠 hook 抢，谁后设谁生效（本模块带钩子，一般是本模块赢）。
真同时开了，建议把对方的同类功能关掉，免得来回打架。

> **注：CChatFilter 已于 2026-07-28 从本机卸载。** 下面凡是
> `CChatFilter/xxx.lua:行号` 的引用都是**搬迁当时**的出处，本机已经查不到了，
> 要核对得自己去找一份 CChatFilter。`MsgTrim.lua` 是那次搬迁留下的完整副本，
> 算法本身不依赖原插件在不在。

---

## 一、文件

```
ChatWindow/
├── ChatWindow.lua    位置与大小；配置表与默认值也在这里
├── MsgTrim.lua       重复符号/叠字/叠句裁减算法（搬迁自 CChatFilter）
├── Filter.lua        黑名单、进出频道、裁减的挂接；BugGrabber 提示屏蔽
├── ClassColor.lua    发言人名字按职业着色
├── EditBox.lua       输入栏移到聊天窗顶端
├── Options.lua       GW2_UI 设置面板
└── README.md         本文档
```

在 `GW2_UI_PLUS.toc` 中的加载顺序（**不可调换**）：

```
ChatWindow/ChatWindow.lua   ← 定义 ChatWindow 表与 InitDB，其余五个都依赖它
ChatWindow/MsgTrim.lua      ← Filter.lua 在文件加载期就读 addonTable.ChatMsgTrim
ChatWindow/Filter.lua
ChatWindow/ClassColor.lua
ChatWindow/EditBox.lua
ChatWindow/Options.lua      ← 必须在 core.lua 之前，后者调用 addonTable.BuildChatWindowPanel
core.lua
```

SavedVariables 声明：`GW2_UI_PLUS_ChatWindowSV`。

---

## 二、位置与大小

位置由 GW2 UI 原生 mover 接管：打开 `/gw2` →「移动界面」，拖动
「主聊天窗口」。实现方式与 `ActionBar/ActionBar.lua` 中动作条 1 相同，
使用 `GW.RegisterMovableFrame` 注册，只提供恢复默认，不提供缩放。

宽度、高度仍由「附加组件 → 聊天窗口」设置。左边距、下边距滑块会反向移动 mover；
编辑模式拖动结束后也会把实际边距同步回 `GW2_UI_PLUS_ChatWindowSV`。

聊天窗最终的位置和大小仍会写进**暴雪的 FCF 系统**：

```lua
frame:SetUserPlaced(true)              -- 不标这个，暴雪重排界面时会把它挪回默认位置
frame:ClearAllPoints()
frame:SetPoint("BOTTOMLEFT", frame.gwMover, "BOTTOMLEFT", 0, 0)
frame:SetSize(w, h)
FCF_SavePositionAndDimensions(frame)   -- 写回暴雪自己的 CVar，它下次还原时用这套值
FCF_DockUpdate()                       -- 标签条与停靠窗口跟着新尺寸重排
```

每次 `PLAYER_ENTERING_WORLD`、`UI_SCALE_CHANGED`、`DISPLAY_SIZE_CHANGED` 各应用一次，
入世那次额外补一个 `C_Timer.After(0.3, Apply)`——上游的聊天皮肤在这之后还有几轮延时重排。

### 两个要点

**1. `hooksecurefunc(ChatFrame1, "SetPoint", Apply)` 守住 mover 锚点**

被别人挪走就重新锚回 `frame.gwMover`。最典型的是 GW2_UI 设置里的「设置聊天」按钮，
它会 `FCF_ResetChatWindows()` 把窗口打回暴雪默认位置
（`GW2_UI/settings/welcome.lua:62`；经典旧世走的分支只 `SetUserPlaced`、不重锚）。
钩子会放过锚点本来就是 mover 的调用，避免无意义地重复应用。

**2. `Apply` 全程持 `applying` 锁**

钩子会调回 `Apply`，而 `Apply` 自己就要调 `SetPoint` 和 `FCF_DockUpdate`，不锁必然无限递归。
锁是函数级的，进门就判：

```lua
local function Apply()
    if applying then return end
    ...
    applying = true
    -- 全部工作
    applying = false
end
```

### 为什么默认下边距是 46

GW2_UI 把聊天输入框锚在聊天窗**下方**
（`chatframe.lua:728` / `751`，`editbox:SetPoint("TOPLEFT", ..., "BOTTOMLEFT")`），
下边距留 0 的话输入框会整个落到屏幕外面，打字看不见。
46 是给输入框留的位置。**开了「输入栏移到顶部」之后，下边距就可以调到 0 真正贴底。**

### 作用范围

只管 `ChatFrame1`。停靠在它上面的标签页（综合、战斗记录……）会自动跟随尺寸；
撕出去的独立窗口不动。

---

## 三、外观

### 职业颜色

`ClassColor.lua`。三家插件（Leatrix Plus、NDui、CChatFilter）用的是同一套：

```lua
SetCVar("chatClassColorOverride", on and "0" or "1")  -- "0" = 允许职业色
for _, chatType in ipairs(CHAT_TYPES) do
    SetChatColorNameByClass(chatType, on)
end
for i = 1, 50 do                                       -- 频道号不连续，扫到 50 稳妥
    SetChatColorNameByClass("CHANNEL" .. i, on)
end
```

`CHAT_TYPES` 抄自 Leatrix，去掉了 `VOICE_TEXT`（经典旧世没有语音转文字）。

**和 GW2_UI 的「提及时用职业色」(`CHAT_CLASS_COLOR_MENTIONS`) 不是一回事**——
那个管的是消息正文里提到某人名字时的着色，这里管的是发言人名字本身。两者互不影响。

### 输入栏置顶

`EditBox.lua`。参考 Leatrix Plus（`Leatrix_Plus.lua:10756`），但比它多做两件事，都是 GW2_UI 带来的：

**1. 要对抗 `setButtonPosition`**

GW2_UI 会把输入框重新按回下方，而 `setButtonPosition` 是个 **local 函数、够不着**
（主 README 第六节第 3 条），只能 hook 输入框的 `SetPoint` 事后改回来，同样要防重入锁。

**2. 要把背景容器改锚**

`frame.Container` 的底边原本锚在 `ChatFrameNEditBoxRight` 上（`chatframe.lua:2233`），
输入框一走，背景会跟着塌到顶部去。所以要改成框住聊天窗本体：

```lua
local left = (frame.buttonSide == "right") and -5 or -35   -- 照抄上游的分支
container:SetPoint("TOPLEFT", frame, "TOPLEFT", left, 5)
container:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 5, 0)
```

**输入框只能压在聊天窗内部顶端**（和 Leatrix 一样），不能挂到框体外的上方——
那儿是标签条 `GeneralDockManager` 的地盘（`chatframe.lua:225`，锚在 ChatFrame1 上方 3 像素）。
代价是输入时盖住最上面一两行聊天记录。

密语、宠物对战这类临时窗口是后建出来的，靠 `hooksecurefunc("FCF_OpenTemporaryWindow")` 建一个收拾一个。

**关掉这项需要重载界面**——恢复上游锚点没有干净的反向操作，交给重载最省事。

### 聊天按钮位置

这一项是 **GW2_UI 本体的设置**（`CHAT_BUTTONS_POSITION`，原本在本体「聊天」面板里），
读写的是同一个值，在这儿只是多开一个入口。和 `skins/Options.lua` 代理社交/邮件开关是同一个模式：
用显式的 `getter`/`setter` 直接读写 `GW.settings.XXX`，**不用 `getterSetter`**——
上游在 `settingsUtils.lua:215` 明确标了 `forbidden for addons`。

选「顶部」或「右侧」会把控制按钮收进一条悬浮小条，聊天窗才能真正贴住屏幕左边。

---

## 四、消息过滤

`Filter.lua`。思路照搬 CChatFilter，但只取需要的几件事，
去掉了它那套副本关键词、白名单转发窗口、小地图按钮。

过滤器**一直挂在** `ChatFrame_AddMessageEventFilter` 上，开关全靠 db 标志位，改设置不需要重载。

| 功能 | 挂哪个事件 | 作用范围 |
|---|---|---|
| 关键词黑名单 | `CHAT_MSG_CHANNEL` + `CHAT_MSG_SAY` + `CHAT_MSG_YELL` | 编号频道、说话、大喊 |
| 重复内容裁减 | `CHAT_MSG_CHANNEL` | 只管编号频道 |
| 进出频道信息 | `CHAT_MSG_CHANNEL_JOIN` / `LEAVE` | 全部频道 |

裁减只管编号频道是有意的：刷屏都在那儿，队伍/密语裁了反而碍事。

### 两个坑

**1. 同一条消息会对每个开着的聊天标签各调一次过滤器**（`lineID` 相同）

必须缓存上一条的判定，否则各标签结果可能不一致，裁减也会重复算：

```lua
if line and line == lastLine then
    if lastBlocked then return true end
    if lastTrimmed == 0 then return false end
    return false, lastMessage, ...
end
```

**2. 进入/离开频道是独立事件**，不是 `CHAT_MSG_CHANNEL` 的子类型

必须单独注册 `CHAT_MSG_CHANNEL_JOIN` / `LEAVE`。
CChatFilter 是在 `CHAT_MSG_CHANNEL` 的过滤器里比对 `event == CHAT_MSG_CHANNEL_JOIN`
（`CChatFilter/filter.lua:375`），那个分支实际上**永远不成立**，它这个功能是失效的。

### 关键词匹配

用 `string.find(haystack, word, 1, true)` 做 **plain 匹配，不当正则**——
用户填的是词，里面出现 `[` 或 `-` 不该报错也不该改变语义。
配置改动时 `RebuildBlacklist()` 重建小写词表，匹配时不用反复 `lower`/`split`。
中英文逗号都认，顺手去掉词两边空格。

### 裁减算法

`MsgTrim.lua`，整文件搬迁自 `CChatFilter/msgtrim.lua`，**算法逐字保留**，
只把原来的全局函数 `bff_msg_split` / `bfwf_trim_message` 收成局部，
出口改挂 `addonTable.ChatMsgTrim`——避免和 CChatFilter 本体抢全局名。

干三件事：

1. **叠字** — 连续重复的数字/字母/汉字留两个，重复符号全去掉，符号后的空格去掉
2. **叠句** — 找出前后重复的最大文字块删掉，反复跑到不再变化为止
3. **保护** — 物品链接和颜色码整体识别，不会被拆坏

出口签名：`TrimMessage(msg) -> (裁掉的字数, 处理后的消息)`。裁不动就原样返回，字数为 0。

### 「界面错误太多」提示

**这条不是暴雪发的，是 BugGrabber 自己 `print` 的**（`!BugGrabber/BugGrabber.lua:325`）：

```lua
if msgsAllowed < 1 then           -- 每秒错误数超阈值
    if not paused then
        if GetTime() > lastWarningTime + 10 then
            print(L.BUGGRABBER_STOPPED)   -- 每 10 秒一条
        end
        paused = true              -- ← BugGrabber 就此停止记录错误
    end
    return
end
```

`print` 直接调 `DEFAULT_CHAT_FRAME:AddMessage`，**不经过 `ChatFrame_AddMessageEventFilter`**，
所以只能包一层 `AddMessage` 才拦得住。要拦截不是旁观，
所以是**包装不是 `hooksecurefunc`**（CChatFilter 的 `shortChannels` 也是这么干的）。
在 `PLAYER_LOGIN` 时才包，让 GW2_UI 的聊天皮肤先包完，我们在最外层。

匹配靠 `SPAM_MARKERS` 里的特征子串（zhCN / zhTW / enUS 三种）。BugGrabber 的 `L` 表是 local，够不着。

> **这条消息是仪表盘警告灯，不是噪音。** 它响起来说明有插件每秒报错几十次，
> 而且 BugGrabber 此时已经不记录了。屏蔽只是关掉提示，该查的还得查——
> 看 BugSack 的图标计数就知道有没有新错误在堆积。

---

## 五、配置

```lua
GW2_UI_PLUS_ChatWindowSV = {
    -- 位置与大小
    enable   = true,    -- 接管开关，改动需重载界面
    width    = 400,
    height   = 200,
    offsetX  = 37,      -- 聊天窗左边距屏幕左边
    offsetY  = 46,      -- 聊天窗底边距屏幕底边

    -- 外观
    classColor = true,  -- 发言人名字按职业着色
    editBoxTop = false, -- 输入栏移到顶部，改动需重载界面

    -- 消息过滤
    hideJoinLeave      = true,
    trimRepeat         = true,
    blacklistEnable    = false,
    blacklist          = "",     -- 逗号分隔
    hideBugGrabberSpam = true,
}
```

`InitDB()` 只补缺失的键、不覆盖已有值，所以：

- 加新配置项直接往 `defaults` 里写，老存档自动补齐
- **改默认值对已经存过档的角色不生效**——那个键已经有值了，不是 `nil`。
  要让新默认值生效，在面板里手动改一次，或删掉存档里的对应段落

---

## 六、设置面板

位置：GW2_UI 设置窗口 → **附加组件 → 聊天窗口**（与「频道按钮」平级）。

由 `Options.lua` 的 `BuildPanel()` 构建，导出为 `addonTable.BuildChatWindowPanel`，
在 `core.lua` 里被塞进 `subPanels`。

```
位置与大小   固定位置与大小（主开关）→ 宽/高/左边距/下边距 → 恢复默认
外观         玩家名用职业颜色 → 输入栏移到顶部 → 聊天按钮位置
消息过滤     不显示进入/离开频道 → 重复符号词句裁减
             → 启用关键词黑名单 → 关键词 → 不显示「界面错误太多」提示
```

### 三个坑

**1. 重载提示要放 `callback`，不能放 `setter`**

GW2_UI 的 `WrapReloadTracking` 只包装 `callback`。

**2. 重置按钮要手动重绘滑块**

四个滑块都设了 `optionName`，「恢复默认」通过 `GW.FindSettingsWidgetByOption()`
找到 widget 手动 `SetValue`。加新滑块且要被重置影响的，照此办理。

**3. 下拉框会吃掉它下一行右半列复选框的点击** ← 这个模块踩到的

面板是两列布局：`boolean` 两两配对，`dropdown` / `slider` / `text` 独占整行
（`settingsWindowSettingsTab.lua:32` 的 `optionTypes`）。
下拉按钮靠右摆、宽 260（x 约 288–548），而 `GwHandleDropDownBox` 给它
`SetFrameLevel(+2)`（`core/API/toolkit.lua:686`），正好压住下一行右列复选框的方块
（x 约 292–308）。

现象很好认：**勾点不动，但标题文字还能点**（文字不在按钮底下）。

所以**下拉框要放在一组的最后**，让它下面只剩分组标题这种不可点击的行。
「聊天按钮位置」就是为此排在「外观」组末尾的。

### `isMasterToggle` 只是样式

它只管标题高亮、背景、强调条、分隔线（`settingsWindowSettingsTab.lua:175`），
**不影响依赖逻辑**。置灰全靠 `dependence`，所以一个面板里放多个主开关是安全的。

---

## 七、已知限制

1. **只管 `ChatFrame1`。** 撕出去的独立聊天窗不受位置、大小控制。

2. **「输入栏移到顶部」开关需要重载界面。** 开启可以即时生效，但关闭要恢复上游锚点，
   没有干净的反向操作，统一走重载。

3. **输入时盖住最上面一两行聊天记录。** 输入栏置顶的固有代价，Leatrix 也一样，
   因为框体外的上方被标签条占了。

4. **裁减只作用于编号频道。** 队伍、公会、密语里的复读不管。

5. **黑名单是子串匹配**，不支持通配符和正则。填「代练」会连「代练价格」一起拦掉，这是预期行为。

6. **改默认值对已有存档不生效**（见第五节）。

7. **屏蔽 BugGrabber 提示不解决错误本身**（见第四节末尾）。

---

## 八、复验清单

改完这个模块，进游戏至少走一遍：

| 项 | 怎么看 |
|---|---|
| 位置大小 | 登录后主聊天窗是设定的尺寸和位置；`/reload` 后仍在原位 |
| 滑块 | 拖动即时生效；「恢复默认」后滑块显示跟着回弹（不只是值变了） |
| 抢位置 | 点本体「聊天」面板的「设置聊天」按钮，窗口被打回后能自动拉回来 |
| 职业颜色 | 频道里发言人名字有职业色；开关即时生效 |
| 输入栏置顶 | 输入框在窗口顶端；**背景没塌**；密语窗口的输入栏也在顶端 |
| 按钮位置 | 三档都能选；**复选框的勾能点**（不只是文字能点） |
| 黑名单 | 命中的消息整条不显示；关键词含 `[` 或 `-` 不报错 |
| 进出频道 | 「XXX 加入了频道」不再出现 |
| 裁减 | 复读消息被压掉；**物品链接完好可点** |
| 过滤器一致性 | 切到另一个聊天标签，同一条消息的过滤结果一致 |

全程盯 BugSack 有没有报错。

**这个模块的验收状态：** 位置大小、设置面板、下拉框布局已实测通过。
输入栏置顶、职业颜色、三项过滤器截至本文档写成时**尚未逐项实测**，
上面清单里对应的行需要走一遍。
