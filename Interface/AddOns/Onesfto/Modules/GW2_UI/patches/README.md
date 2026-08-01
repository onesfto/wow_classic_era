# GW2_UI 改动补丁集（施工图 / 存档）

这里是 **2026-07-27 之前手工改到 `GW2_UI` 本体里的全部改动**，从纯净基线逐文件导出。

用途是给「把改动外迁到 `GW2_UI_PLUS`」这件事当施工图，迁完之后作为历史存档保留。

## 怎么生成的

基线是同版本（10.14.3）的纯净副本 `../GW2_UI_1.15.9/`：

```bash
cd "Interface/AddOns"
diff -rq --strip-trailing-cr "Onesfto/Modules/GW2_UI/GW2_UI_1.15.9" "GW2_UI"
```

每个 `.patch` 文件名是原路径把 `/` 换成 `_`，内容是 `diff -u 纯净版 改动版`。
`NEW_` 前缀的不是补丁，是上游根本不存在的**新增文件**全文。

## 内容概览

37 个补丁 + 1 个新增文件。改动量最大的几块：

| 补丁 | 行数 | 是什么 |
|---|---|---|
| `NEW_..._tradeskill.lua` | 986（全文） | 自建的专业/制造面板 GW2 皮肤，上游没有这个文件 |
| `Games_Shared_Immersive_Skins_mail.lua` | 624 | 让上游邮件皮肤能在 Era 跑 |
| `locales_zhCN.lua` | 583 | 补 350+ 条遗漏汉化 |
| `Games_Shared_Social_*.lua`（6 个） | 1465 | 让上游 Retail-only 的社交窗口皮肤在 Era 可用 |
| `Games_Classic_Immersive_Skins_questLog.lua` | 311 | 任务日志改双栏宽面板、列表 6 行→22 行 |
| `Games_Classic_Character_spellbook.lua` | 177 | 带等级法术点击失效 + 翻页跳回第一页 |
| `settings_panels_panel_*.lua`（9 个） | 385 | 中文字体下标题被截断，`header:SetWidth(... + 10)` |

其余是 ESC 键失灵修复（gossip / popupFrame / ImmersiveQuestingFrame）、光环改右键取消（aurabar）、
Questie 等级前缀去重（objectives）、LoD 框体遮罩卡住（utils）、
`GW.SkinBagSearchBox` 补上游 Classic 分支的缺口（inventory）、以及硬编码文本汉化（advanced_stats / talents.xml / panel_objectives）。

## 已丢弃的内容

排查问题时留下的 8 个临时脚本，从未被任何 xml/toc 引用，游戏里根本不会执行，已直接删除，不在补丁集里：

`test.lua`、`test_title.lua`、`test_find_title.lua`、`test_track_button.lua`、`fix_title.lua`、
`Games/Classic/Immersive/Skins/` 下的 `dump_regions.lua`、`dump_type.lua`、`test_close_btn.lua`

需要翻看的话在 git 历史里（提交 `d1cb5bc0` 及之前）。

## 完整备份

改动版 GW2_UI 的整目录 zip 在仓库之外：`~/wow-addon-backups/GW2_UI-10.14.3-modified-20260727.zip`
