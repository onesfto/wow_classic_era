# Skins 模块

Skins 为 GW2_UI 原生窗口和已安装的第三方插件提供统一的 GW2 风格外观。

## 核心文件

- `Core.lua`：皮肤注册、通用 Frame 和控件样式。
- `Options.lua`：皮肤开关设置页。
- `TradeSkill_Utils.lua`、`TradeSkill_Layout.lua`、`TradeSkill_Skin.lua`、`TradeSkill.lua`：专业/制造面板皮肤。
- `Mail.lua`、`QuestLog.lua`：邮件和任务日志。
- `BetterBags.lua`、`BugSack.lua`、`MailLogger.lua`、`Myslot.lua`、`NovaWorldBuffs.lua`、`SimpleRaidTargetIcons.lua`：第三方插件皮肤。

## 加载顺序

专业面板必须按工具、布局、皮肤、入口的顺序加载。所有具体皮肤文件必须先于 `Core.lua` 完成注册；实际顺序以 `GW2_UI_PLUS.toc` 为准。

## 通用皮肤接口

`addonTable.Skin` 提供常用的 `SkinFrame`、`SkinButton`、`SkinFont`、`SkinCheckBox`、`SkinScrollBar`、`SkinDropDown` 和 `SkinEditBox`。具体窗口优先组合这些接口，不要重复创建一套控件样式。

## 修改边界

- 不修改第三方插件原文件、TOC、语言或资源。
- 皮肤初始化要允许目标插件未安装或尚未创建窗口。
- 对匿名窗口使用尺寸和子控件特征识别，不能只依赖固定 Frame 名称。
- 所有皮肤操作应可重复调用，不叠加背景、字体或点击脚本。

## 相关文档

- [皮肤开发规范](../../Docs/modules/skins-SKIN_STANDARD.md)
- [MailLogger 交接说明](../../Docs/modules/skins-MailLogger.md)
