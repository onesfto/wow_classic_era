# MailLogger 皮肤——交接文档

为 MailLogger 2.1.4 的设置、交易记录和日历窗口提供 GW2 风格外观。

**皮肤代码只放在 `GW2_UI_PLUS`。**  
`Interface/AddOns/MailLogger` 原插件的 Lua、TOC、语言文件和资源均不修改。

---

## 一、文件与加载顺序

相关文件：

```text
skins/Core.lua                    通用皮肤接口与加载调度
skins/MailLogger.lua              MailLogger 专用皮肤
tests/SkinControls_test.lua       通用控件测试
tests/MailLoggerSkin_test.lua     MailLogger 窗口、布局与重建测试
skins/MailLogger.md               本文档
```

`GW2_UI_PLUS.toc` 中必须保持以下顺序：

```text
core.lua
skins/Core.lua
skins/MailLogger.lua
skins/NovaWorldBuffs.lua
```

`skins/MailLogger.lua` 依赖 `skins/Core.lua` 创建的 `addonTable.Skin`，因此不能提前加载。

---

## 二、打开窗口

在聊天框输入：

| 命令 | 窗口 |
|---|---|
| `/ml gui` | 设置窗口 |
| `/ml all` | 全部记录和日历 |
| `/ml tradelog` | 交易记录 |
| `/ml maillog` | 邮件记录 |
| `/ml sent` | 发件记录 |
| `/ml received` | 收件记录 |

MailLogger 小地图按钮：

- 左键：打开记录窗口。
- 右键：打开设置窗口。
- Shift + 左键：重置窗口位置。

修改皮肤文件或 TOC 后，必须执行 `/reload`。

---

## 三、覆盖范围

皮肤处理三个主窗口及其全部常用控件：

- 窗口背景与边框；
- 内嵌标题区；
- 标题、标签和正文文字；
- 普通按钮和日期按钮；
- 下拉框；
- 复选框；
- 单行与多行输入框；
- ScrollFrame 与滚动条。

标题区使用嵌入窗口内部的 GW2 样式，不调用 `Skin.AddTitleBar`。原因如下：

- MailLogger 的三个主窗口都是匿名 Frame；
- 窗口没有右上角 X，关闭操作位于底部；
- 记录窗口标题会随记录类型变化；
- 日历窗口紧贴记录窗口，外置标题条会破坏两个窗口的整体关系。

原来的暴雪红色标题贴图会隐藏，标题 FontString 移入 36px 高的内嵌标题区。标题区仍可拖动窗口。

---

## 四、交易记录窗口

原窗口宽度为 360px。皮肤将其扩展为 470px，并同步扩大正文滚动区。

底部按钮按以下顺序单行排列：

```text
交易｜邮件｜发件｜收件｜全部｜日历｜设置｜关闭
```

按钮宽度依次为：

```text
45, 45, 45, 45, 55, 55, 55, 50
```

相邻按钮间距为 5px，左右边距为 20px。

新增按钮不复制 MailLogger 的私有业务逻辑：

- “日历”打开时调用 `SlashCmdList.MLC("all")`，从而复用原插件的记录打印和日历刷新；再次点击时隐藏日历。
- “设置”调用 `SlashCmdList.MLC("gui")`，复用原插件的设置窗口开关。

---

## 五、匿名窗口识别

MailLogger 没有把三个主窗口保存为全局变量，子控件也大多没有全局名称。皮肤不能使用 `_G["FrameName"]` 直接取得它们。

`MailLoggerSkin.ScanWindows()` 从 `UIParent:GetChildren()` 中扫描候选窗口，并使用三层条件识别：

1. 窗口尺寸；
2. MailLogger 创建的标题贴图字段；
3. 特征子控件组合。

具体特征：

| 窗口 | 尺寸 | 子控件特征 |
|---|---:|---|
| 设置 | 380×510 | 复选框、输入框、滚动区和下拉框同时存在 |
| 记录 | 360×510；皮肤后为 470×510 | 至少 6 个按钮和一个滚动区 |
| 日历 | 320×320 | 至少 49 个按钮和 2 个下拉框 |

尺寸相同但控件结构不同的其他插件窗口不会被处理。

---

## 六、加载时序

MailLogger 的窗口不是在 Lua 文件加载时创建，而是在自己的 `ADDON_LOADED` 处理函数中创建。

如果 GW2_UI_PLUS 先收到 `ADDON_LOADED`，直接扫描会找不到窗口。因此皮肤执行两步：

1. 给全局事件帧 `MailLoggerFrame` 安装 `OnEvent` 后置钩子；
2. MailLogger 完成 `Initialize()` 后再调用 `ScanWindows()`。

皮肤注册回调本身也会立即扫描一次，用于覆盖 MailLogger 已经完成初始化、GW2_UI_PLUS 后补执行的情况。

整个过程不使用 `C_Timer.After`、轮询或全局 `CreateFrame` 拦截。

---

## 七、窗口重建

MailLogger 删除角色记录或清空数据库后，不复用原窗口，而是：

1. 隐藏旧设置和记录窗口；
2. 再次执行 `Initialize()`；
3. 创建新的匿名窗口。

皮肤会给设置窗口的直接按钮安装一次 `OnClick` 后置钩子。原按钮逻辑执行完毕后重新扫描，只处理新建窗口。

以下私有标记用于保证幂等：

```text
__gwMailLoggerSkinned
__gwMailLoggerObjectSkinned
__gwMailLoggerRescanHooked
```

重复打开、重复扫描或窗口重建不会叠加背景、标题、按钮或脚本。

---

## 八、通用控件标准

本次在 `skins/Core.lua` 补充了两个公共接口。

### `Skin.SkinDropDown(dropdown, width)`

- 经典 `UIDropDownMenuTemplate` 使用 `GwSkinDropDownMenu`；
- 新版下拉框回退到 `GwHandleDropDownBox`；
- 可保留调用方指定宽度；
- 同一对象只处理一次。

### `Skin.SkinEditBox(editBox)`

- 使用 `GwStripTextures` 移除暴雪输入框材质；
- 使用 `DefaultWithSmallBorder` 创建 GW2 小边框背景；
- 使用 GW2 正文字体；
- 保留原输入限制、焦点和事件脚本；
- 同一对象只处理一次。

MailLogger 其余控件复用：

```text
Skin.SkinFrame
Skin.SkinFont
Skin.SkinButton
Skin.SkinCheckBox
Skin.SkinScrollBar
```

---

## 九、正式客户端兼容点

### 标题贴图可能返回数字 FileDataID

测试环境中的：

```lua
frame.texture:GetTexture()
```

返回字符串：

```text
Interface/DialogFrame/UI-DialogBox-Header
```

正式客户端可能返回数字 FileDataID。第一版识别器只接受字符串，结果是三个窗口全部未命中：

- 仍显示暴雪原生边框；
- 底部仍只有 6 个按钮；
- 没有 Lua 报错，因为扫描器只是认为“没有目标窗口”。

现在 `HasOriginalHeader` 同时接受：

- 匹配的字符串路径；
- 数字 FileDataID。

窗口仍须通过尺寸和特征子控件校验，因此不会仅凭任意数字贴图处理其他窗口。

对应回归测试会把记录窗口标题贴图设为数字：

```lua
output.texture.texture = 130944
```

如果删除数字兼容分支，测试会在“应识别交易记录窗口”处失败。

---

## 十、验证

自动测试：

```bash
cd "/Applications/World of Warcraft/_classic_era_/Interface/AddOns/GW2_UI_PLUS"

lua tests/SkinControls_test.lua
lua tests/MailLoggerSkin_test.lua
luac -p skins/Core.lua skins/MailLogger.lua
```

完整插件测试：

```bash
for test_file in tests/*_test.lua; do
    lua "$test_file" || exit 1
done
```

手动验收：

1. 执行 `/reload`。
2. 执行 `/ml gui`，检查设置窗口全部控件。
3. 执行 `/ml all`，检查记录窗口、日历和 8 个底部按钮。
4. 点击“日历”和“设置”，确认窗口能打开和关闭。
5. 在设置窗口删除角色记录或清空记录，确认重建后的窗口仍有皮肤。
6. 检查 BugSack 中没有 `GW2_UI_PLUS Skin [MailLogger]` 错误。

当前自动测试、Lua 语法和 TOC 顺序已经通过。数字 FileDataID 修复后的最终视觉效果仍须在正式客户端执行 `/reload` 后确认。

---

## 十一、确认原插件未修改

实现前后对 `Interface/AddOns/MailLogger` 的 15 个文件计算 SHA-256，结果一致。

关键文件：

```text
Calendar.lua  b34a0e386e8ba7a93bef9fac65aa1a810f2d7d8fe6eed6ebbc6fe6f05dc702d2
Config.lua    aeb84aeed1f709cb1b27c72ff0750138dd33aaea3cf6a325085574b850e4f3cc
GUI.lua       b8f9dbb1c61ef3346c10c8ef1a2b34da2ba8c3745f0f6d203200442a53370972
```

升级 MailLogger 后应重新计算哈希，并重点检查窗口尺寸、控件层级和初始化时序是否改变。

---

## 十二、排错

### 完全没有皮肤

依次检查：

```text
1. 是否执行过 /reload
2. GW2_UI_PLUS.toc 是否包含 skins/MailLogger.lua
3. skins/MailLogger.lua 是否位于 skins/Core.lua 之后
4. /dump GW2Plus_Skin.registry.MailLogger.done
5. BugSack 是否出现 GW2_UI_PLUS Skin [MailLogger]
```

`done` 为 `true` 只表示注册回调执行过，不代表窗口一定识别成功。没有报错但仍是原生外观时，优先检查 `GetWindowKind()` 的尺寸和特征条件。

### 只有部分控件未美化

检查控件的 `GetObjectType()`、父级关系，以及是否属于下拉框内部按钮。下拉框由父 Frame 整体处理，不应再次把箭头按钮当普通按钮美化。

### 清空记录后皮肤消失

检查新窗口是否仍为 380×510 和 360×510，并确认设置按钮带有 `__gwMailLoggerRescanHooked`。

### 新增按钮存在但无反应

检查：

```lua
SlashCmdList and SlashCmdList.MLC
```

“日历”和“设置”入口依赖 MailLogger 自己注册的 `MLC` 斜杠命令。
