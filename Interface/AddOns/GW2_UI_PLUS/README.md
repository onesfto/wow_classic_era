# GW2 UI Plus —— 交接文档与架构指南

GW2_UI 的外挂式扩展包。所有对 GW2_UI 的定制都住在这里，**GW2_UI 本体保持与上游逐字节一致**，升级时直接删目录解压新版即可，不需要合并代码、不需要跑任何脚本。

具体每处改动是从本体哪里搬来的、底层覆盖机制是什么，见 [MIGRATION.md](MIGRATION.md)。
本文档主要说明本扩展包的**目录架构、加载顺序、存档管理以及新增模块规范**。

---

## 〇、最重要的一条规矩

**永远不要改 `Interface/AddOns/GW2_UI/` 里的任何文件。**

想验证有没有破例，随时在终端运行：

```bash
cd "Interface/AddOns"
diff -rq --strip-trailing-cr \
  "Onesfto/Modules/GW2_UI/GW2_UI_1.15.9" "GW2_UI" | grep -v .DS_Store
```

无输出 = 本体干净。（`GW2_UI_1.15.9` 是纯净的上游 10.14.3 副本，升级本体后要同步换成新版纯净副本。）

---

## 一、双子插件结构

为了解决魔兽世界插件加载的生命周期问题，本项目被拆分为两个插件文件夹：

| 文件夹 | 加载时机 | 核心职责 |
|---|---|---|
| `!GW2_UI_PLUS_Early/` | **GW2_UI 之前** | 仅通过 AceLocale 注册补充的汉化词条 |
| `GW2_UI_PLUS/` | **GW2_UI 之后** | 接管界面、加载模块、驱动业务逻辑 |

### 为什么要拆成两个？

经典旧世下 GW2_UI 在**它自己的 `ADDON_LOADED`** 阶段就跑完了界面的初始化函数 `evPlayerLogin`（`core/GW2_ui.lua:955-959`）。那一步就把整个设置窗口连同几百条 `L["..."]` 文本**一次性建好了**。

而主插件 `GW2_UI_PLUS` 声明了 `## Dependencies: GW2_UI`，必然更晚加载。如果那时再往语言表里补词条，界面上的字早就定死成英文了。

**解决方案**：将汉化词条挪进一个 `!` 开头的文件夹（保证按字母表先加载），赶在 GW2_UI 之前用独立的 AceLocale 注册。由于默认语言包（enUS）使用的是 `writedefaultproxy`，明确拒绝覆盖已有值，所以我们提前写进去的中文能够完美保留。

---

## 二、架构规范与目录树

`GW2_UI_PLUS` 采用严格的**职责分离架构**。所有代码必须归属到相应的子目录中。

```text
GW2_UI_PLUS/
├── GW2_UI_PLUS.toc             核心配置文件（管理加载顺序）
├── core.lua                    全局设置面板的汇总与挂载
├── README.md & MIGRATION.md    项目级开发文档
│
├── Assets/                     [静态资源]
│   ├── gwlogo-red.png          插件图标
│   └── icons/                  各种业务模块需要的定制图标
│
├── Core/                       [底层拦截与核心扩展]
│   ├── Fixes.lua               通用 Bug 修复（如 ESC 失灵、按需加载遮罩修复）
│   ├── Spellbook.lua           法术书逻辑拦截（事后重设翻页属性）
│   └── Diagnostics.lua         诊断命令（/gw2plus）
│
├── Modules/                    [独立业务模块]
│   ├── ActionBar/              动作条扩展（全局渐隐、尺寸调节、法师专用条）
│   ├── ChatBar/                频道按钮条（见模块内 README.md）
│   ├── ChatWindow/             聊天窗口增强（过滤、着色、输入框置顶等）
│   ├── CooldownPulse/          技能冷却闪烁
│   ├── MainMenu/               主菜单增强与皮肤
│   ├── Minimap/                小地图第三方按钮收纳盒
│   ├── Toolbar/                顶部工具条（性能监控、队伍管理、快捷动作）
│   ├── skins/                  第三方插件与原生窗口换肤（见 skins/SKIN_STANDARD.md）
│   └── social/                 社交面板重构（好友、公会、团队等独立接管）
│
├── Libs/                       [第三方隔离组件]
│   └── alaGearMan/             内嵌的一键换装插件
│
└── locale/                     [硬编码文本替换]
    └── Hardcoded.lua           (建好界面后事后替换不走 L 表的写死英文)
```

### 为什么这样分层？
1. **Core**：负责解决底层环境的脏活累活。加载非常靠前。这里的代码往往涉及到底层钩子 (Hooks) 或者生命周期极早的修改。
2. **Modules**：真正的业务逻辑。它们必须高度内聚，尽量避免跨模块污染。如果要增加新功能，首选在这里建文件夹。
3. **Libs**：与本项目业务无关、直接由第三方开源引用的组件。
4. **Assets**：避免项目根目录被散落的图片污染，集中管理所有的材质和图标，在代码中统一引用 `Interface/AddOns/GW2_UI_PLUS/Assets/...`。

---

## 三、TOC 加载顺序（不可随意调换）

在 `GW2_UI_PLUS.toc` 中，文件的加载顺序经过精心编排，任何随意调整都可能导致“找不着表”或者“被本体早期的初始化刷掉”。

```text
locale/Hardcoded.lua              ← 其它模块可能需要读 L，尽早加载
Core/Fixes.lua                    ← 底层补丁：SkinBagSearchBox 兜底必须早于任何皮肤模块
Core/Spellbook.lua
Core/Diagnostics.lua
Libs/alaGearMan/alaGearMan.xml    ← 第三方依赖

Modules/Toolbar/Core.lua          ← 存档、mover 与公共控件（工具条依赖）
Modules/Toolbar/GroupManage.lua
Modules/Toolbar/QuickBar.lua
Modules/Toolbar/MarkerBar.lua
Modules/Toolbar/PerformanceBar.lua
Modules/Toolbar/Options.lua       ← 工具条设置面板

Modules/ChatBar/ChatBar.lua       ← 主逻辑必须在 Options.lua 之前
Modules/ChatBar/Options.lua       

Modules/ChatWindow/ChatWindow.lua │ 定义表与 InitDB，必须最先加载
Modules/ChatWindow/MsgTrim.lua    │ Filter 加载时就要读它导出的裁减函数
Modules/ChatWindow/Filter.lua     │
Modules/ChatWindow/ClassColor.lua │
Modules/ChatWindow/EditBox.lua    │
Modules/ChatWindow/Options.lua    │ 本体逻辑必须在 Options 之前

Modules/ActionBar/ActionBar.lua   │ 定义表与 InitDB，提供公共接口
Modules/ActionBar/MageBar.lua     │
Modules/ActionBar/Fader.lua       │
Modules/ActionBar/Options.lua     │

Modules/social/*.lua ×6           │ 分散的标签页逻辑
Modules/social/Social.lua         │ 必须在所有子标签页后加载以进行汇总挂载

Modules/skins/TradeSkill.lua      │ 所有需要往“设置面板”加选项的模块...
Modules/skins/Mail.lua            │ 
Modules/skins/QuestLog.lua        │ ...都必须在 core.lua 之前加载。
Modules/skins/Options.lua         ┘

core.lua                          ← 【中枢】汇总收集所有面板，绑定到 GW2_UI 的设置树上

Modules/skins/Core.lua            ← 皮肤引擎核心
Modules/skins/NovaWorldBuffs.lua  ← 第三方皮肤必须在皮肤引擎之后加载
```

**关键原则：**
- 基础定义文件（含有 `InitDB` 和全局表的）必须优先加载。
- 业务子逻辑依赖主逻辑。
- `core.lua` 是构建设置面板的关键中枢，所有需要在面板中出现设置项的模块，必须早于 `core.lua` 加载。

---

## 四、存档变量与所有权

在本项目中，数据存储分为两类：属于我们自己的，以及为了体验一致“寄生”在本体里的。

| 变量 | 所有者 | 存放的内容 |
|---|---|---|
| `GW2_UI_PLUS_SV` | **本插件** | `TRADESKILL_SKIN_ENABLED`、`alaGearMan_Enable`，以及 `Toolbar` 下工具条的功能开关。 |
| `GW2_UI_PLUS_ChatBarSV` | ChatBar 模块 | 频道按钮配置（见 `ChatBar/README.md`） |
| `GW2_UI_PLUS_ChatWindowSV` | ChatWindow 模块| 位置大小、职业颜色、输入栏置顶、过滤器等 |
| `GW2_UI_PLUS_ActionBarSV` | ActionBar 模块 | 渐隐选项、按钮尺寸、法师条配置等 |
| `alaGearManSV` | 第三方 | 原生独立的一键换装数据 |
| `GW.settings.*` | **GW2_UI 本体** | 我们在面板中暴露出本体隐藏的配置（如 `USE_SOCIAL_WINDOW`、`MAIL_SKIN_ENABLED`）。同样，我们读取了本体的某些尺寸设定（如 `MultiBarBottomLeft.size`）来影响我们的逻辑。 |

**设计巧思**：
社交窗口和邮件的开关、位置记忆，使用的是 **GW2_UI 本体存档**。因为它们本质就是本体的功能，只因经典旧世被作者隐藏了。我们只提供面板入口读写同一个值，保证了无论配置文件怎么切换，行为和本体完全一致。

反之，像专业面板皮肤（`TradeSkill`）是我们自建的功能，无法写入本体硬编码的 `defaults2.lua` 中，因此使用 `GW2_UI_PLUS_SV` 独立存取。

---

## 五、如何新增功能模块？（开发规范）

如果你要开发一个新的功能或扩展，请遵循以下标准流程：

1. **新建目录**：在 `Modules/` 下创建一个以你的功能命名的文件夹（如 `Modules/MyFeature/`）。
2. **逻辑入口**：建立 `MyFeature.lua`，建议使用局部的 addonTable 作为模块通信载体：
   ```lua
   local _, addonTable = ...
   local MyFeature = {}
   addonTable.MyFeature = MyFeature
   ```
3. **注册加载**：在 `GW2_UI_PLUS.toc` 中登记。记得排在 `core.lua` **之前**（如果你有设置面板的话）。
4. **设置面板 (Options.lua)**：
   - 走官方 API：`GW.GetSettingsTabFrame():AddSettingsPanel(...)`。
   - 在 `MyFeature/Options.lua` 中编写一个 `BuildMyFeaturePanel(parent)` 的函数。
   - 在主目录的 `core.lua` 中的 `subPanels` 列表里将其注入。
5. **处理坑点**：
   - **重载回调**：面板设置需要 reload 才能生效的，把标识放在 `callback`，不要放在 `setter`（`GW2_UI` 只包装 callback）。
   - **下拉框遮挡**：在两列排版的面板中，下拉框 `dropdown` 会独占整行并且 `FrameLevel` 较高，会盖住它**下一行右侧**的复选框，导致无法点击。**解决方案：永远把下拉框放在分组的最末尾。**

---

## 六、更多深入原理

如果你要直接“修改或覆盖”本体的函数，请务必先仔细阅读 [MIGRATION.md](MIGRATION.md)。那里面详细记载了：
- 如何判断函数的加载生命周期（是早于我们还是晚于我们）。
- 为什么覆盖本体函数时可能导致“函数双跑”。
- 怎么用“事后截留位置/缩放”去解决那些拿不到权限的局部变量问题。
