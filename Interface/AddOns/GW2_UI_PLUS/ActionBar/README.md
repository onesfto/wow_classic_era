# 动作条 (ActionBar) —— 交接文档

三件事：**全局渐隐**、**按钮尺寸**、**法师动作条**。仿 NDui_Plus 的
`Modules/ActionBar/`，但外观、mover、存档全部改走 GW2_UI 的那一套。

**核心定位：本体已经有的不重做。** GW2_UI 自带每条动作条的渐隐下拉
（一直显示 / 战斗中 / 仅鼠标悬停）、姿态条的尺寸与透明度、施法条的 mover 缩放。
这个模块补的是本体没有的：一套统一的鼠标渐隐、动作条 1-8 的按钮尺寸滑块、
血球缩放，以及一条法师专用动作条。

---

## 一、文件

```
ActionBar/
├── ActionBar.lua   模块表、配置默认值、战斗排队；动作条 1-8 尺寸 + 血球/施法条缩放
├── MageBar.lua     法师动作条
├── Fader.lua       全局渐隐
├── Options.lua     GW2_UI 设置面板
└── README.md       本文档
```

在 `GW2_UI_PLUS.toc` 中的加载顺序（**ActionBar.lua 必须最先**）：

```
ActionBar/ActionBar.lua   ← 定义 AB 表与 InitDB，其余三个都依赖它
ActionBar/MageBar.lua
ActionBar/Fader.lua
ActionBar/Options.lua     ← 和其它模块一样，必须在 core.lua 之前
```

MageBar 与 Fader 互相引用（前者建好按钮就登记给后者，后者要读前者的按钮表），
但都是**运行时**引用，所以这两个的先后无所谓。

**三个模块都只定义函数，不自己注册事件。** 统一由 `ActionBar.lua` 末尾那个
`PLAYER_ENTERING_WORLD` 驱动，分三段：`尺寸 → MageBar.Init → Fader.Init`。

**三段之间用 `SafeRun` 隔开**（`xpcall` + `geterrorhandler`，和本体
`RegisterLoadHook` 一个路子）。原来是直接串行的，结果是**任何一段报错都会把后面
两段静默拖死**——尤其致命的是 `Fader.Refresh()` 遇到 `fader == nil` 是静默 return，
于是「渐隐开关点了没反应、也不报错」，根本没法查。现在一段炸了另两段照常跑，
聊天框喊一声，错误本身照常进 BugSack。

为什么必须等到 PEW：本体的动作条是在 **PLAYER_LOGIN** 的 `evPlayerLoginLate`
里建的（`core/GW2_ui.lua:817`），而本插件声明了 `Dependencies: GW2_UI`，
在 ADDON_LOADED 阶段就加载完了——那时候 `MainActionBar.gw_Buttons`、
`GwMultiBarBottomLeft`、`GwStanceBar` 全都还不存在。
（注意这跟本体设置面板的时序不一样：面板是在 `evPlayerLogin` 里建的，比本插件**早**。）

---

## 二、全局渐隐

### 为什么改的是父框体的 alpha

本体自己有一套渐隐：`Games/Classic/Actionbar/actionbars.lua` 的 `fadeCheck`
挂在主条的 OnUpdate 上，每 0.1 秒把 8 条动作条过一遍，看到该亮的 alpha 小于 1
就立刻拉回 1。**它读的是框体自身的 `GetAlpha()`。**

所以我们不能 SetAlpha 各个条——下一个 0.1 秒就被抹掉了。改成建一个渐隐父框体
`GwPlusActionBarFader`，把要一起变淡的条 `SetParent` 到它下面，动的是**父框体**
的 alpha。本体看不见父级 alpha，两边相乘：

| 本体那条的「显示」设成 | 效果 |
|---|---|
| 一直显示 | 完全由全局渐隐说话（**推荐**） |
| 仅鼠标悬停 | 两套渐隐叠加，鼠标不在时是 0 × 全局 alpha |
| 战斗中 | 非战斗时本体已经把它按到 0，全局渐隐看不出效果 |

### 参与的框体

`Fader.lua` 的 `TARGETS` 表，一项一个开关：

| 设置项 | 框体 | 谁的 |
|---|---|---|
| 动作条 1 | `MainActionBar` | 暴雪的，本体直接复用 |
| 动作条 2-8 | `GwMultiBarBottomLeft` / `GwMultiBarBottomRight` / `GwMultiBarRight` / `GwMultiBarLeft` / `GwMultiBar5` / `GwMultiBar6` / `GwMultiBar7` | 本体自建 |
| 姿态动作条 | `GwStanceBar` | 本体自建 |
| 宠物动作条 | `GwPlusPetBarHolder` | **我们自建的中间容器**，见下 |
| 法师动作条 | `GwPlusMageBar` | 本模块 |

游戏里的编号和本体内部的名字差 1：游戏的动作条 2 是本体的
`MultiBarBottomLeft`（`gw_Bar1`）。`ActionBar.lua` 的 `MULTIBARS` 表就是这个映射，
本体设置面板里 `FADE_MULTIACTIONBAR_1` 对应的也是游戏的动作条 2。

### 宠物动作条为什么要中间容器

本体把宠物动作按钮直接挂在宠物**单位框体**上
（`Games/Shared/Units/petbar.lua` 的 `SetActionButtonPositionAndStyle` 里
`button:SetParent(self)`），照原样把 `GwPlayerPetFrame` 挂到渐隐父框体上，
宠物血条会跟着一起变淡。

所以中间加一层 `GwPlusPetBarHolder`：按钮挂容器，容器挂渐隐父框体。
按钮的锚点锚在宠物框体和彼此身上，换父级不影响摆位。

两个要点：

- **容器的层级要显式设死**（`SetFrameStrata` + `SetFrameLevel(petFrame+4)`）。
  显式设过就不再随父级变，挪到渐隐父框体下面也不会被血条纹理盖住。
- **本体每次重排宠物按钮都会把它们抢回去**，所以 hook 了
  `SetActionButtonPositionAndStyle`，它跑完我们再拿回来。

容器是**用到才建**的——没开这项就完全不去动暴雪的宠物按钮。

### 亮暗判定靠轮询，不靠 OnEnter / OnLeave

**这里踩过一次坑，别改回去。** 第一版是照 NDui_Plus 写的：按钮的
`OnEnter` 淡入、`OnLeave` 淡出，再加几个事件。结果是**开关看起来完全没作用**。

两个原因叠在一起：

1. `IsMouseOver()` 只比较鼠标坐标在不在框体矩形里，**不管有没有被遮挡**。
   在设置窗口里点开关时，那个全屏窗口下面正压着动作条的矩形范围，
   于是判定「鼠标在动作条上」→ 保持全亮。
2. 鼠标压根没进得去被盖住的按钮，所以 `OnLeave` **永远不会触发**。

结果状态就永久卡在「亮」上了。现在的写法是一个状态机：

```lua
ShouldShow() = 正在拖技能 or 保持全亮条件成立 or 鼠标在任一参与的条上
```

每 0.1 秒轮询一次（`UPDATE_INTERVAL`，和本体 `fadeCheck` 同一节奏），
**只在判定翻转时**才播动画（`wantShown` 记住上一次的结论），所以轮询很便宜。

按钮的 `OnEnter` / `OnLeave` 钩子还留着，但只是让反应更跟手，
**轮询才是权威**。条件事件（`CONDITION_EVENTS`）同理——轮询本来就能发现战斗、
目标、施法、血量的变化，注册事件只为少等那 0.1 秒。

### 保持全亮的条件

战斗中 / 有目标 / 施法或引导中 / 生命值不满，四个独立开关。
另外 `ACTIONBAR_SHOWGRID`（从背包往动作条上拖东西）期间**固定**全亮，
好看清空格子——靠 `gridShown` 标志位记住，`ACTIONBAR_HIDEGRID` 清掉。

### 渐隐父框体和 UIParent 完全重合

`fader:SetAllPoints(UIParent)`。主动作条是暴雪的框体，万一它的锚点是相对父级的，
换父级之后位置就会跳到左上角——铺满全屏就没这个问题。

代价是 `fader:IsMouseOver()` 恒为真，所以鼠标位置是靠 `IsMouseOverAnyBar()`
挨个问参与的条要的。

### 淡入淡出用动画组，不用 UIFrameFadeIn/Out

暴雪那两个函数收尾时会 `Show()` 框体，各客户端行为还有出入。本体的渐隐用的也是
动画组（`createFaderAnim`）。注意动画结束后 alpha 会退回播放前的值，
必须在 `OnFinished` 里自己定住——本体也是这么写的。

### 低透明度关闭冷却完成闪光

和 NDui_Plus、ElvUI 一样，全局渐隐目标 alpha 小于或等于 0.5 时，会关闭参与
动作按钮的冷却完成闪光（Bling），减少大量半透明按钮同时渲染星芒层的成本。
淡入全亮、取消某条参与或关闭全局渐隐时会恢复；冷却转圈和倒计时不受影响。

### 整套换装只刷新一次装备动作边框

GW2_UI 本体每收到一次 `PLAYER_EQUIPMENT_CHANGED` 都会扫描 8×12 个动作按钮。
整套换装会按装备栏连续触发多次，所以 `Equipment.lua` 在运行时找到 GW2_UI 的
匿名动作条事件框体，只接管它的装备事件，并在最后一次事件静默 0.1 秒后统一扫描
一次。距离、战斗、升级等原事件不受影响。

如果全局渐隐已经处于淡出状态，换装开始时只保留前三个已选目标在渐隐父框体中；
其余目标暂时回到原父级，换装事件批次结束后每隔 0.1 秒接回一个。这样动作按钮
集中刷新期间不会让所有已选动作条同时参与半透明混合。战斗中不会改受保护框体父级。

识别依赖该框体注册的独特事件组合；如果以后 GW2_UI 改了内部结构导致找不到，
Plus 会保留本体原处理并在聊天框提示，避免错误接管其他框体。

---

## 三、按钮尺寸

### 动作条 2-8：本体有字段，只是没暴露

`GW.settings[barName].size`，默认 38，存在**本体的存档**里（和本体的
「宽度」「反转」是同一张表，切换配置文件时一起走）。

本体的 `UpdateMultibarButtons` 用 `settings.size` 算间距和 mover 尺寸，
但**没有 SetSize 按钮自己**——所以光改 size 只会把间距撑开、按钮还是老大小。
`SyncMultiBarButtonSizes()` 补的就是这一步，改完尺寸还要重跑一遍
`GW.setActionButtonStyle`，因为按钮里一堆纹理（pushed / checked / border /
autocast）的尺寸是按**当前宽度**算出来的。

> 本体的 `UpdateMultibarButtons` 无条件访问 `MainActionBar.gw_BarN`，
> 关掉本体动作条（`ACTIONBARS_ENABLED = false`）时那些框体不存在、调了会报错，
> 所以调用前先探一下 `gw_Bar1`。

### 动作条 1：48 是写死的 local，只能自己排

`MAIN_MENU_BAR_BUTTON_SIZE = 48` 是 `actionbars.lua` 的文件级 local，外部够不着。
`ApplyMainBarLayout()` 复刻了本体 `UpdateMainBarHot` 的排布（起点 x = margin，
步长 size + margin），把 48 换成设定值。

**位置由我们说了算之后要防两件事：**

1. **本体还会用 48 重排。** `GW.UpdateMainBarHot` 是导出的，包了一层：
   原版先跑（负责空槽 alpha、宏名、热键、边框），我们再排一遍位置和尺寸。
2. **有的 callback 直接引用了函数值。** 本体面板里
   `callback = GW.UpdateMainBarHot`（`panel_actionbar.lua:88` 的「主条距离指示」下拉）
   是在 `evPlayerLogin` 里取的**原版引用**，比我们的包装早，包不住。
   所以按钮上还挂了 `SetPoint` 钩子：位置不对就拉回来（`applyingMainBar` 锁防递归）。
   本体给 multibar 按钮用的是同一个套路（`actionbars.lua:906`）。

### 中间那段空隙：108 是算出来的

本体主条排到第 6 个按钮之后加 108，给血球留位。这个数是
**88（血球宽）× 1.1（血球缩放）+ 11** ——
血球的 1.1 来自 `healthglobe.lua` 的 `GW.RegisterScaleFrame(hg, 1.1)`。

`GetGlobeGap()` 把它反过来算：

```lua
(hg:GetWidth() * hg:GetEffectiveScale()) / bar:GetEffectiveScale() + 11
```

`GetEffectiveScale()` 两边都含 UIParent 的缩放，相除刚好抵消。默认状态下这个式子
算出来就是 108，和本体一模一样。

**于是血球位置永远不用动：**

- 主条按钮变大变小 → 总宽变 → 主条锚点是居中的，自动重新居中 → 空隙中心还在屏幕中央
- 血球缩放 → 空隙宽度跟着变 → 刚好包住新的血球

开了「玩家框体代替目标框体」（`PLAYER_AS_TARGET_FRAME`）时中间没有血球，
空隙返回 0，12 个按钮连续排——和本体的行为一致。

> **这里依赖一个前提：`MainActionBar` 的锚点是居中的**（宽度一变自动重新居中）。
> 本体自己也依赖这一点——它在开关经验条 / 玩家框体代替目标框体时会改主条宽度，
> 要是不居中，本体的布局早就歪了。升级本体后如果发现主条不居中了，先查这里。

### 主动作条的 mover 是我们加的

**本体没给主动作条注册 mover**——它的位置一直是暴雪的 UserPlaced
（`updateMainBar` 里只有 `SetMovable/SetUserPlaced/SetMovable`），
所以 HUD 编辑界面里翻不到它。既然按钮尺寸能调了，位置也得能调，
`RegisterMainBarMover()` 补上这一条。

三个决定：

- **默认位置就取它当前待的地方**（`bar:GetBottom()` + `BOTTOM` 锚 + `xOfs = 0`），
  注册完不跳位。mover 的 scale 会被 `CreateMoverFrame` 设成和主条一样，
  坐标系一致，不用换算。
- **只给 `"default"`，不给 `"scaleable"`。** 主条已经在 `SCALE_HUD_FRAMES` 里
  （本体的 `RegisterScaleFrame(fmActionbar)`），再挂一个独立缩放会和 HUD 缩放
  滑块来回覆盖。整条缩放归 HUD 缩放，按钮大小归我们的尺寸滑块，各管一段。
- **锚到 mover 之后加 `SetPoint` 钩子**拉回来，和本体对 multibar 的做法一样。

**移动主条之后血球对齐就失效了**——血球固定在屏幕底部中央，主条挪走了，
中间那个洞就成了纯粹的空洞。所以有「主条中间为血球留出空隙」这个开关（默认开），
拖走主条的人自己关掉，12 个按钮就连续排。

顺带一提：主条**不移动**时宽度变化能自动重新居中，靠的是 mover 那个 `BOTTOM` 锚
（宽度变→以 BOTTOM 为中心两侧均分）。这和注册 mover 之前依赖暴雪锚点的效果一致，
所以血球对齐照旧。

### 血球缩放：改 gwScaleMulti，别自己 SetScale

本体的 HUD 缩放（`UpdateHudScale`）会把所有注册过的框体
`SetScale(hudScale * f.gwScaleMulti)`。自己 SetScale 会被下一次 HUD 缩放抹掉，
所以血球改的是**倍数** `gwScaleMulti = 1.1 × 我们的系数`，中央 HUD 背景改成
`gwScaleMulti = 我们的系数`，再分别刷新这两个框体。不能调用 `UpdateHudScale`
去刷新全部框体；只有“为血球预留中间空隙”开启时，才用原有按钮大小重新计算主动作条
位置。全局 HUD 缩放以后再次运行时，仍会保留血球和中央背景的两个独立倍数。

血球在经典旧世**没有 mover**（`BAR_LAYOUT_ENABLED` 默认 true，走的是
`hg:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 17)` 那一支），位置固定在屏幕底部中央，
所以只需要管缩放。

### 施法条缩放：本体已有的值，多开一个入口

`GwCastingBarPlayer` 的 mover 注册时带了 `"scaleable"`
（`castingbar.lua:531`），也就是说 HUD 移动模式里点它的 mover 本来就能调缩放，
值存在 `GW.settings.castingbar_pos_scale`。我们读写的是**同一个值**，
做的事也和本体的滑块（`moveableFrameHandler.lua:497`）逐行一致：

```lua
cb:SetScale(value, true)   -- 第二个参数走 ParentOnScaleChanged 的 override 分支，mover 跟着缩
cb.isMoved = true          -- 标了之后 HUD 缩放不再覆盖单独调过的框体
```

---

## 四、法师动作条

搬自 NDui_Plus `Modules/ActionBar/MageBar.lua`，五组法术（传送 / 传送门 /
造食物 / 造水 / 魔法宝石）各一个主按钮，鼠标悬停展开同组其余等级或目的地。

### 法术表原样保留

`mageSpellData` 里连 TBC / WLK 的 ID 一起留着，经典旧世学不到的会被
`IsSpellKnown` 过滤掉，季节服（SoD）走同一份表。

**每组里最后一个已学到的当主按钮，其余进弹出条。** 对食物、水、宝石来说这就是
最高等级；对传送和传送门，表里排的是城市顺序，所以主按钮是最后一个已知的目的地。

### 弹出条走暴雪的安全代码片段

`GwPlusMageBarHandler` 是个 `SecureHandlerBaseTemplate`，用 `WrapScript` 给主按钮
的 OnEnter / OnLeave / OnClick 包上片段，片段里 `Show()` / `Hide()` 弹出条。
这样**战斗中也能弹、能点**。

鼠标从主按钮挪到弹出条上时，主按钮的 OnLeave 会把条藏掉，所以弹出按钮的 OnEnter
片段里再 `Show()` 一次并交给 `RegisterAutoHide(.25)`。

### 片段里必须判空，否则按钮会「点了没反应」

**这里踩过一次坑。** 原来照 NDui_Plus 写成一行：

```lua
PopupHandler:WrapScript(button, "OnClick", [[ BAR_MAP[self]:Hide() ]])
```

`BAR_MAP[self]` 一旦是 nil，这句在安全环境里报错，而 `WrapScript` 挂的是**前置**
片段——前置一炸，**后面原本的 `OnClick` 会被一起中断**。那个原本的 OnClick 就是
`SecureActionButton_OnClick`，也就是施法本身。于是症状是：

- 按钮显示正常、图标正常、鼠标悬停能弹出子按钮
- **点下去完全没反应**，还未必留下一眼能认出的报错

所以每个片段都先取到局部变量再判空：

```lua
local bar = BAR_MAP[self]
if bar then bar:Hide() end
```

同一个道理适用于任何 `WrapScript` 的前置片段——**别让它有报错的机会**。

### 法术名同步取，异步只作兜底

`"spell"` 属性要的是「法术名(等级 X)」。这些都是已经学会的法术，数据一定在客户端
缓存里，`GetSpellInfo` / `GetSpellSubtext` 直接同步就能拿到
（本体 Classic 分支的 `spellbook.lua:548` 也是这么读 rank 的）。

原来只走 `Spell:CreateFromSpellID` + `ContinueOnSpellLoad` 的异步回调——回调万一
不来，`"spell"` 属性就是空的，症状同样是「按钮看着正常、点了没反应」。
现在同步取，取不到才退回异步等一次。

`type` 和 `spell` 两个属性**一起设**（`Button_ApplySpellAttribute`），
免得战斗中只设上一半。

### 建按钮的顺序：功能先，外观后

`CreateButton` 里先设法术属性和脚本，最后才调 `GW.setActionButtonStyle`。
样式函数碰的是本体一堆 parentKey，万一在某个客户端版本上炸了，
按钮至少还能点——反过来写就全废了。

### 经典旧世要施放指定等级，属性必须写法术名 + 等级

```lua
button:SetAttribute("spell", "传送门：奥格瑞玛(等级 2)")
```

光给 spellID 会施放最高等级。名字是 `Spell:CreateFromSpellID` 异步取的，
回调里要再确认一次 `button.spellID` 没被改成别的法术。

### 战斗中一律推后

新建按钮、`SetAttribute`、`WrapScript` 全是受保护操作。`MageBar.Update()`
开头就 `AB.QueueOutOfCombat`，战斗中记账、`PLAYER_REGEN_ENABLED` 时补跑。
同名任务只留最后一个，免得出战斗时把同一件事跑十遍。

### 外观借本体的样式函数

`GW.setActionButtonStyle(name, false, false, true)`，第四个参数 `isPet = true`
是为了跳过「空槽透明度」那一段——法师条上的格子永远是满的。

两个坑：

- 按钮必须是 **CheckButton**（`ActionButtonTemplate` 本身就是），
  因为本体的样式函数会 `btn:SetCheckedTexture(...)`。
- 它还**无条件**访问 `btn.CheckedTexture` 这个 parentKey，模板不一定给了，
  所以 `CreateButton` 里先兜一手：没有就自己 SetCheckedTexture 再取回来。

### 位置存在本体的存档里

`GW.RegisterMovableFrame` 直接读写 `GW.settings[settingsName]` 和
`GW.globalDefault.profile[settingsName]`，外部框体得自己把这两处默认值补上
（`EnsureMoverSettings()`）。**位置因此存在 GW2_UI 的存档里，不在我们的 SV 里**——
和社交窗口、邮件位置是一样的情况，这是本体 API 的硬性要求。

配套处理了配置文件切换：本体切 profile 之后 `GW.settings` 换成另一张表，
mover 里存的还是旧引用，拖动会写进已经不生效的表。`HookProfileChange()`
注册了 AceDB 的 `OnProfileChanged`，把默认值补进新表、把 mover 的引用换过去。

关掉法师条时顺手 `GW.ToggleMover(bar.gwMover, false)`，编辑界面里就不会多一个空 mover。

---

## 五、存档

| 变量 | 存什么 |
|---|---|
| `GW2_UI_PLUS_ActionBarSV` | 渐隐全部选项、主动作条尺寸、血球缩放、法师动作条全部选项 |
| `GW.settings[barName].size` | **本体的**：动作条 2-8 的按钮尺寸 |
| `GW.settings.castingbar_pos_scale` | **本体的**：施法条缩放 |
| `GW.settings.MageBar_pos` | **本体的**：法师动作条位置 |
| `GW.settings.MainActionBar_pos` | **本体的**：主动作条位置（mover 是我们加的，位置照本体的规矩存） |

后三行用本体存档是有意的：前两个本体本来就有字段，第三个是
`RegisterMovableFrame` 要求的。这三项会跟着 GW2_UI 的配置文件走，
而我们 SV 里那些是全局的。

---

## 六、设置面板

GW2_UI 设置窗口 → **附加组件 → 动作条**，四组：

```
全局渐隐      总开关 / 淡出后透明度 / 淡出延迟
              这些时候保持全亮：战斗中 / 有目标 / 施法中 / 生命值不满
              作用于哪些条：动作条 1-8 / 姿态 / 宠物 / 法师
按钮尺寸      动作条 1-8，各 24-60，独立滑块 / 主条中间为血球留出空隙 / 恢复默认
血球与施法条  血球缩放 / 施法条缩放，0.5-2.0 + 恢复默认
法师动作条    总开关 / 竖向 / 五组开关 / 按钮尺寸    ← 非法师职业整组隐藏
```

面板全是复选框、滑块和按钮，**没有下拉框**，所以不用担心主 README 第五节
那个「下拉框吃掉下一行右列复选框点击」的坑。

改了值滑块不会自己重绘，「恢复默认」按钮里用 `RedrawSlider()` 手动拉回显示值——
和 ChatWindow 那边同一套路。

---

## 七、出问题先跑诊断

```
/gw2plus fader      渐隐
/gw2plus magebar    法师动作条
```

### `/gw2plus magebar`

逐个按钮打印 `type` / `spell` 属性的**实际值**，外加同步取名的结果作对照。
点击没反应就先看这个：

- `spell=nil` 或和右边「应为」不一致 → 属性没设上，看第四节那两条
- `type` 不是 `spell` → 同上
- 属性都对但还是点不动 → 大概是安全片段报错中断了 OnClick，查 BugSack

### `/gw2plus fader`

输出三部分：

- **开关、当前 alpha、轮询是否挂着、当前判定** —— 判定是 `true` 却觉得没变淡，
  就看下一行「该亮吗」里是哪个条件把它顶住了
- **该亮吗：保持全亮条件 / 鼠标在条上** —— 后者为 `true` 且鼠标明显不在动作条上时，
  说明有框体压着动作条的矩形（`IsMouseOver` 不管遮挡，见第二节）
- **每条的「已接管」** —— `否` 表示 `SetParent` 没成功，这条不会跟着渐隐

要是打印出「渐隐父框体不存在 —— Fader.Init 没跑完」，去 BugSack 找报错：
三段初始化用 `SafeRun`（`xpcall` + `geterrorhandler`）互相隔开了，
一段炸了另两段照常跑，聊天框也会喊一声，但错误本身还是在 BugSack 里。

## 八、验收清单

| 项 | 怎么看 |
|---|---|
| 渐隐 | 开总开关后动作条变淡（**关掉设置窗口、鼠标移开动作条**才看得到，见第二节那个坑）；鼠标移到任一按钮上，勾选的条一起亮；离开后按延迟变淡 |
| 渐隐诊断 | `/gw2plus fader` 有输出，各条「已接管=是」 |
| 渐隐条件 | 进战斗全亮、脱战变淡；选中目标全亮（勾了「有目标时」）；从背包拖技能时全亮 |
| 渐隐范围 | 只勾动作条 1 时，其余条不受影响 |
| 宠物条渐隐 | 宠物动作按钮变淡，**宠物血条不变淡** |
| 与本体共存 | 本体「动作条」面板里把某条设成「仅鼠标悬停」，两套渐隐叠加，无闪烁、无来回打架 |
| 尺寸 | 8 条各自的滑块即时生效，按钮和图标一起变大，边框不错位 |
| 血球对齐 | 改主条尺寸，血球**不动**，中间空隙仍然刚好包住血球；改血球缩放，空隙跟着变 |
| 施法条 | 滑块改完立刻缩放，HUD 移动模式里那个 mover 的缩放值同步 |
| 法师条 | 法师登录后出现；悬停主按钮弹出低等级；点击能放；只学到一个等级时不显示展开箭头 |
| 法师条点击 | 主按钮和弹出条的按钮**点下去真的施放**（这是踩过的坑，见第四节）；`/gw2plus magebar` 里 `spell` 和「应为」一致 |
| 法师条编辑 | `/gw2` → 移动界面，能看到「法师动作条」的 mover 并拖动；`/reload` 后位置还在 |
| 主条编辑 | `/gw2` → 移动界面，能看到「动作条 1」的 mover 并拖动；`/reload` 后位置还在；拖走后关掉「为血球留出空隙」，12 个按钮连续排 |
| 法师条战斗 | 战斗中学新法术不报错；战斗中弹出条能弹能点 |
| 战斗中改设置 | 战斗中拖尺寸滑块不报错（推后到脱战生效） |
| `/reload` | 所有设置还在；主条布局、法师条位置不跳 |

全程盯 BugSack 有没有 taint 或 "action blocked"。

---

## 九、已知限制

- **主动作条尺寸和 HUD 其它部件的对齐**：空隙跟着血球算，但经验条、玩家施法条
  这些不会跟着主条尺寸变。把主条按钮调得很大很小之后，可能要自己去 HUD 移动模式
  里微调它们。
- **动作条 2-8 的 mover 尺寸**：本体 `UpdateMultibarButtons` 算 mover 高度时
  只在满行的时候累加（单行布局算出来是 0），这是本体自己的老问题，没有跟着修——
  只影响编辑模式里那个灰框的大小，不影响按钮。
- **姿态条尺寸**：本体「动作条 → 姿态动作条」面板里已经有 20-60 的滑块，
  没有在这里重复一个。
- **宠物动作条尺寸**：本体写死 32 / 28（`petbar.lua:16`），这次没动。
