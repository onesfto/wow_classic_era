# 综合菜单与通用便利功能 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use `executing-plans` to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 在“组件”页最上方新增“综合”菜单，并实现自动任务、交易限制、批量购买、安全快速拾取，以及所列画面 CVar 控制；自动卖灰和自动修理由综合页直接控制现有 GW2_UI 设置。

**Architecture:** 新增 `Modules/General/` 业务切片。`Core.lua` 只管理默认配置、CVar 和共享安全工具；自动化、商人、拾取、画面行为分别独立；`Options.lua` 仅构建设置面板。`ComponentsTab.lua` 显式把该面板插入原生组件页之前，避免依赖 `PlusAddonSubPanels` 的既有顺序。所有新设置保存到 `GW2_UI_PLUS_SV.general`。

**Tech Stack:** WoW Classic Era Lua 5.1、原生事件/API、现有 GW2_UI 设置面板 API、POSIX shell 静态回归脚本。

---

## 文件结构

```text
Modules/General/
├── Core.lua          # 配置、CVar、防御性共享工具
├── Automation.lua    # 任务接取、任务交付、对话交付
├── Merchant.lua      # 等级交易限制、批量购买
├── FastLoot.lua      # 安全快速自动拾取
├── Visual.lua        # 画面 CVar 应用与登录重申
└── Options.lua       # “综合”设置面板
tests/
└── general_utilities_regression.sh
```

## 实施任务

### 1. 建立隔离与基线

**Files:** 无生产代码修改。

- [ ] 若当前仓库不是 worktree，先获得用户同意后用 `git worktree add` 建立隔离目录；绝不在当前含用户未提交改动的目录中直接实现。
- [ ] 在隔离目录运行：

```sh
for test_file in tests/*_regression.sh; do sh "$test_file"; done
```

- [ ] 记录并处理仅由本任务引入的失败；不修改用户已有的世界地图、动作条或 WTF 改动。

### 2. 先添加会失败的综合功能回归脚本

**Files:** Create `tests/general_utilities_regression.sh`

- [ ] 先写脚本，断言以下文件和关键调用尚不存在时脚本失败：
  - TOC 按 `Core/PanelTitle.lua` 之后、`core.lua` 之前加载六个 `Modules/General/*.lua`；
  - `ComponentsTab.lua` 在原生页面之前插入 `addonTable.PlusGeneralPanel`；
  - 自动化模块注册 `QUEST_DETAIL`、`QUEST_PROGRESS`、`QUEST_COMPLETE`、`GOSSIP_SHOW`；
  - 商人模块注册 `TRADE_SHOW`、`MERCHANT_SHOW` 且调用 `BuyMerchantItem`；
  - 拾取模块注册 `LOOT_READY`、`LOOT_OPENED`、`LOOT_CLOSED`、`UI_ERROR_MESSAGE`；
  - 画面模块包含 `overrideArchive`、`weatherDensity`、`RAIDweatherDensity`、`violenceLevel`、`ffxGlow`、`ffxDeath`、`ffxNether`、`cameraDistanceMaxZoomFactor`。
- [ ] 脚本使用 `set -eu`、`rg -q` 和清晰中文失败信息，不依赖本机 Lua 解释器。
- [ ] 运行 `sh tests/general_utilities_regression.sh`，确认因文件尚未实现而失败。

### 3. 创建配置与 CVar 共享层

**Files:** Create `Modules/General/Core.lua`; modify `GW2_UI_PLUS.toc`; modify `tests/general_utilities_regression.sh`

- [ ] 在测试脚本中追加对默认配置、`GetDB` 和 CVar 缓存恢复行为的静态断言，先确认失败。
- [ ] 在 `Core.lua` 建立私有命名空间：

```lua
local _, addonTable = ...
local General = {}
addonTable.General = General

local defaults = {
    autoAcceptQuests = false,
    autoTurnInQuests = false,
    autoDialogueTurnIn = false,
    blockLowLevelTrade = false,
    batchBuy = true,
    fastLoot = false,
    antiCensorship = false,
    weatherDensity = 1,
    violenceLevel = 3,
    disableGlow = false,
    disableScreenEffects = false,
    maxCameraDistance = false,
}
```

- [ ] 实现 `General.GetDB()`：创建 `_G.GW2_UI_PLUS_SV` 和 `.general`，只补充缺失的默认值，返回同一张表。
- [ ] 实现 `General.GetCVar(name)` / `General.SetCVar(name, value)`；优先 `C_CVar`，兼容旧 `GetCVar` / `SetCVar`；`pcall` 和空值保护，失败时返回 `nil` / `false`，不弹原生错误框。
- [ ] 实现 `General.IsCVarSupported(name)`：仅当读值或默认值可取得时为真；设置面板据此隐藏不受当前客户端支持的选项。
- [ ] 实现 `General.ApplySetting(key, value)`，写 DB 并分派到各模块公开的 `Apply` 方法；设置面板不直接操作游戏事件。
- [ ] 在 TOC 中于 `Core/PanelTitle.lua` 后加入 `Modules/General/Core.lua`，其余五个文件按 Core、Automation、Merchant、FastLoot、Visual、Options 顺序加载，确保 `core.lua` 调用构建函数前已定义。
- [ ] 运行新增脚本，确认本任务覆盖的 Core 断言通过。

### 4. 让“综合”成为组件菜单第一项并构建设置页

**Files:** Create `Modules/General/Options.lua`; modify `Modules/Settings/ComponentsTab.lua`; modify `core.lua`; modify `tests/general_utilities_regression.sh`

- [ ] 先在回归脚本中要求 `BuildGeneralPanel`、`PlusGeneralPanel`、以及综合菜单插入点，确认失败。
- [ ] 在 `Options.lua` 实现 `addonTable.BuildGeneralPanel(parent)`，使用 `GwSettingsPanelTmpl`、`addonTable.SetPanelTitle` 和既有 `panel:AddOption` / `panel:AddOptionDropdown` API。
- [ ] 面板按四个小节添加控件：
  - **自动化：** 自动接任务、自动交任务、对话自动交货、屏蔽未满级角色交易；
  - **商人：** 自动出售灰色物品、自动修理装备、批量购买；
  - **拾取：** 加快拾取速度；
  - **画面：** 反河蟹、天气、血液、禁用屏幕泛光、禁用屏幕特效、最大镜头距离。
- [ ] 自动出售灰色物品 getter/setter 直连 `_G.GW2_ADDON.settings.BAG_VENDOR_GRAYS` 和 `GW.SetupVendorJunk(value)`；自动修理直连 `_G.GW2_ADDON.settings.AUTO_REPAIR`，下拉值为 `NONE`、`PLAYER`、`GUILD`。不可用时隐藏这两项，绝不复制 GW2_UI 的销售或修理逻辑。
- [ ] `core.lua` 在已有附加组件面板创建前调用 `BuildGeneralPanel(p)` 并保存至 `addonTable.PlusGeneralPanel`；该面板不放入 `PlusAddonSubPanels`，避免在“附加组件”原生页重复出现。
- [ ] `ComponentsTab.lua` 的 `AddMenuEntry` 初始化后、原生微型系统菜单前执行：

```lua
AddMenuEntry("综合", addonTable.PlusGeneralPanel)
```

- [ ] 回归脚本确认该语句的位置早于 `if pages then`，并运行脚本。

### 5. 实现安全的自动任务与对话交付

**Files:** Create `Modules/General/Automation.lua`; modify `tests/general_utilities_regression.sh`

- [ ] 先写静态测试，要求事件表和 `IsModifiedClick("CHATLINK")` 以外的专用 Shift 抑制检查（使用 `IsShiftKeyDown()`），以及 `GetQuestReward` 前的完成/费用/奖励选择保护；确认失败。
- [ ] 创建一个仅在启用时注册事件的局部 frame。`General.Automation.Apply(enabled)` 根据任一自动化开关注册或注销四个任务事件。
- [ ] `QUEST_DETAIL`：仅在 `autoAcceptQuests` 为真且未按 Shift 时调用 `AcceptQuest()`。
- [ ] `QUEST_PROGRESS`：仅在 `autoTurnInQuests`、未按 Shift、`IsQuestCompletable()` 为真时调用 `CompleteQuest()`。
- [ ] `QUEST_COMPLETE`：仅在 `autoTurnInQuests`、未按 Shift、任务已完成、`GetNumQuestChoices() == 0`、`GetQuestMoneyToGet() == 0` 时调用 `GetQuestReward(1)`。任意奖励选择或付费任务均保留原生界面。
- [ ] `GOSSIP_SHOW`：仅在 `autoDialogueTurnIn`、未按 Shift 且可安全唯一确定一个“可交付、无选择、无费用”的选项时选择；零个或多个候选项一律不点击。实现中优先使用当前 Classic Era 可用的 `C_GossipInfo`，旧 API 不可用时静默跳过。
- [ ] 任何受保护 API 调用前检查函数存在，事件回调不做循环、不使用 `OnUpdate`。
- [ ] 运行回归脚本。

### 6. 实现低等级交易拦截与 BuyEmAll 式批量购买

**Files:** Create `Modules/General/Merchant.lua`; modify `tests/general_utilities_regression.sh`

- [ ] 先让测试要求等级比较必须使用 `UnitLevel("player") < GetMaxPlayerLevel()`、拦截 `TRADE_SHOW`，以及商人库存/背包/货币限制调用；确认失败。
- [ ] `General.Merchant.Apply()` 根据 `blockLowLevelTrade` / `batchBuy` 注册或注销 `TRADE_SHOW`、`MERCHANT_SHOW`。`TRADE_SHOW` 中若角色未满级，调用 `CloseTrade()`，并以 `DEFAULT_CHAT_FRAME:AddMessage` 输出一次中文说明；满级或无法取得等级则不干预。
- [ ] `MERCHANT_SHOW` 启用时 hook 安全的 `MerchantItemButton_OnModifiedClick` 或使用 `hooksecurefunc` 监听 Shift 点击，绝不覆盖其他插件函数；仅 Shift 点击可购买商品打开批量购买小窗。
- [ ] 小窗显示商品名称、每次购买含量、可购买次数；输入是“购买次数”，而非模糊的总件数。确认数量必须同时受 `GetMerchantItemInfo` 的可用库存、背包容纳量（包括可堆叠余量）、金币和替代货币限制。
- [ ] 确认操作只执行一次 `BuyMerchantItem(merchantIndex, purchaseCount)`，数量范围为 1 到计算上限；无上限、缺物品链接或存在替代货币但无法读取成本时不购买，并保留原生购买流程。
- [ ] 所有 frame 使用插件前缀全局名或匿名 frame；不修改暴雪按钮属性，不在战斗中创建/改动受保护点击行为。
- [ ] 回归脚本检查使用 `hooksecurefunc`、`GetMerchantItemInfo`、`GetMerchantItemMaxStack`、`GetContainerNumFreeSlots`（或 `C_Container` 兼容分支）、`GetMoney`、`BuyMerchantItem`。

### 7. 实现保留高价值物品的快速拾取

**Files:** Create `Modules/General/FastLoot.lua`; modify `tests/general_utilities_regression.sh`

- [ ] 先让测试要求保存原 `autoLootRate`、恢复时写回保存值、以及锁定/分配阈值/背包容量保护，确认失败。
- [ ] `General.FastLoot.Apply(enabled)` 在首次启用时缓存 `General.GetCVar("autoLootRate")`，设为 `"0"`；关闭时恢复缓存值（无缓存才不写入），并恢复 `LootFrame` 父级与层级。
- [ ] 注册 `LOOT_READY`、`LOOT_OPENED`、`LOOT_CLOSED`、`UI_ERROR_MESSAGE`。仅当玩家本来触发自动拾取（`autoLoot` 或 `autoLootDefault` 与 `AUTOLOOTTOGGLE` 组合）时处理；手动拾取保持原生框。
- [ ] 倒序检查每个槽位：锁定物品、达到队伍分配阈值的物品、队长分配 UI 可见的物品、空间不足或唯一物品达到上限时不调用 `LootSlot`，并显示原生拾取框。货币及明确安全的物品可立即拾取。
- [ ] 使用 `C_Container.GetContainerNumFreeSlots`，并为 Classic 旧 API 提供受保护兼容分支；堆叠空间检查逐包计算，而不是用总物品数推算。
- [ ] `UI_ERROR_MESSAGE` 的背包满/唯一上限错误使隐藏的原生拾取框重新显示；`LOOT_CLOSED` 清理每次拾取状态。
- [ ] 不覆盖 `LootFrame` 脚本或全局 `LootSlot`，不新增按帧逻辑。
- [ ] 运行回归脚本。

### 8. 实现画面 CVar 控制与登录重申

**Files:** Create `Modules/General/Visual.lua`; modify `tests/general_utilities_regression.sh`

- [ ] 先写失败检查：天气必须同时设置普通和团队副本 CVar；屏幕特效必须同时设置 `ffxDeath`/`ffxNether`；镜头为 `2.6`，并在 `PLAYER_ENTERING_WORLD` 重申。
- [ ] `General.Visual.Apply()` 对每项已启用的配置写入：
  - 反河蟹：`overrideArchive = "0"`，关闭还原为 `"1"`；
  - 天气：`weatherDensity`、`RAIDweatherDensity` 均为字符串 `0`–`3`（小雨、中雨、大雨、暴雨）；
  - 血液：`violenceLevel` 为字符串 `0`–`5`（无、略微、少量、普通、暴力、很暴力）；
  - 泛光：`ffxGlow` 为 `"0"` / `"1"`；
  - 屏幕特效：`ffxDeath` 与 `ffxNether` 均为 `"0"` / `"1"`；
  - 最大镜头：`cameraDistanceMaxZoomFactor = "2.6"`，关闭还原为客户端默认值（从 `GetCVarDefault` 取得）。
- [ ] 对会覆盖用户原 CVar 的布尔开关，在首次启用时缓存原值，关闭时恢复缓存值；没有缓存时才使用明确的客户端默认值。天气/血液是用户指定的枚举值，不使用缓存恢复。
- [ ] 当 `antiCensorship` 为真，设置页文字明确写“需完全退出战网和 WoW 后生效”；不承诺热更新。
- [ ] 创建匿名 frame 仅监听 `PLAYER_ENTERING_WORLD`，进入世界时只重申启用的最大镜头距离；不在登录时强行重置其他 CVar。
- [ ] 不支持的 CVar 在 Options 中隐藏，并在 `SetCVar` 失败时静默退出。
- [ ] 运行回归脚本与全量脚本。

### 9. 完整验证与人工客户端验证

**Files:** `tests/general_utilities_regression.sh`，必要时仅修正本任务文件。

- [ ] 运行：

```sh
sh tests/general_utilities_regression.sh
for test_file in tests/*_regression.sh; do sh "$test_file"; done
git diff --check
git status --short
```

- [ ] 在 Classic Era 客户端手动检查：
  1. “组件”首项是“综合”，且综合页不会在原“附加组件”页面重复；
  2. Shift 按住时三种自动任务行为均不触发；奖励选择、付费和多条对话均保持原生界面；
  3. 未满级打开交易会被关闭，满级不受影响；Shift 商人物品可按容量/货币/库存上限购买；
  4. 背包满、高品质分配、锁定、唯一上限时快速拾取显示原生框；普通物品仍迅速拾取；
  5. 画面下拉和开关改变对应 CVar，镜头跨登录保持 2.6；反河蟹提示完整退出；
  6. `/console taintLog 1` 后测试商人、任务、拾取，并检查不会产生本插件相关污染。
- [ ] 仅在全部脚本通过后，按项目 Git 规范提交本任务独立提交；绝不包含工作区中原有改动。
