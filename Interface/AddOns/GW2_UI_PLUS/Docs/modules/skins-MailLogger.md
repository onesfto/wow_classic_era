# MailLogger 皮肤交接说明

MailLogger 皮肤代码全部位于 `GW2_UI_PLUS`，不修改 `MailLogger` 原插件文件。目标是把设置、记录和日历窗口统一为 GW2 风格，并兼容 MailLogger 的匿名窗口和重建逻辑。

## 文件与加载顺序

```text
Modules/Skins/Core.lua
Modules/Skins/MailLogger.lua
```

`MailLogger.lua` 必须在 `Core.lua` 之后加载，并通过 `addonTable.Skin` 复用通用控件样式。

## MailLogger 入口

原插件命令仍由 MailLogger 自己处理：

| 命令 | 用途 |
|---|---|
| `/ml gui` | 设置窗口 |
| `/ml all` | 全部记录和日历 |
| `/ml tradelog` | 交易记录 |
| `/ml maillog` | 邮件记录 |
| `/ml sent` | 发件记录 |
| `/ml received` | 收件记录 |

皮肤只负责窗口外观、布局和新增入口，不复制 MailLogger 的记录业务逻辑。

## 覆盖范围

- 三个主窗口的背景、边框和内嵌标题区；
- 标题、标签、正文和普通按钮；
- 下拉框、复选框、输入框、滚动区和滚动条；
- 记录窗口底部的记录类型、日历、设置和关闭入口。

标题区嵌在窗口内部，因为 MailLogger 使用匿名 Frame、底部关闭按钮和紧邻的日历窗口。不要改用通用外置标题条。

## 匿名窗口识别

MailLogger 的主窗口没有稳定的全局名称。`MailLoggerSkin.ScanWindows()` 从 `UIParent:GetChildren()` 中筛选候选窗口，并结合以下条件识别：

1. 窗口尺寸；
2. MailLogger 标题区域特征；
3. 子控件数量和类型组合。

只满足单个尺寸或单个贴图特征时不得处理窗口，避免误伤其他插件。

## 加载与重建

MailLogger 在自己的初始化阶段创建窗口。皮肤需要覆盖两种顺序：

- MailLogger 先初始化：回调执行时直接扫描；
- GW2_UI_PLUS 先加载：挂接 MailLogger 的初始化事件，完成后再扫描。

删除记录或清空数据库后，MailLogger 可能重建匿名窗口。皮肤会重新扫描，并通过以下标记保证幂等：

```text
__gwMailLoggerSkinned
__gwMailLoggerObjectSkinned
__gwMailLoggerRescanHooked
```

重复打开、重新扫描和窗口重建不能叠加背景、标题或点击脚本。

## 通用控件

`Modules/Skins/Core.lua` 提供：

```text
Skin.SkinFrame
Skin.SkinFont
Skin.SkinButton
Skin.SkinCheckBox
Skin.SkinScrollBar
Skin.SkinDropDown
Skin.SkinEditBox
```

下拉框和输入框可能使用不同的暴雪模板，皮肤函数必须保留原有宽度、输入限制、焦点和事件脚本。

## 修改边界

- 不修改 `Interface/AddOns/MailLogger` 下的文件、TOC、语言或资源。
- 不依赖固定的匿名 Frame 名称。
- 不把记录、日历或设置逻辑复制到 Plus。
- 不在扫描阶段拦截全局 `CreateFrame` 或使用无限轮询。
- MailLogger 升级后优先检查窗口尺寸、标题特征、子控件结构和初始化时序。
