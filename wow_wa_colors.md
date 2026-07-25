# WeakAuras (WA) 颜色代码参考表

在魔兽世界及 WeakAuras 中，转义颜色代码通常使用 `|cFF` 加上 6 位 16 进制颜色代码（RRGGBB），并以 `|r` 结束。例如：`|cFFFF0000文字|r`。
若在 Lua 脚本中直接赋值颜色参数，则多使用 RGB 值（范围 0-1）。

## 一、 基础状态颜色 (参考 ElvUI / 暴雪 UI 品质)

| 颜色展示 | 颜色类型 | WA Hex 代码 | 标准 Hex | RGB (Lua 脚本) | 常见应用场景 |
| :---: | :--- | :--- | :--- | :--- | :--- |
| <span style="color:#FF2020;">████</span> | **红色 (Red)** | `|cFFFF2020` | `#FF2020` | `1, 0.12, 0.12` | 敌对目标 / 错误警告 / 无法使用 |
| <span style="color:#20FF20;">████</span> | **绿色 (Green)** | `|cFF20FF20` | `#20FF20` | `0.12, 1, 0.12` | 友善目标 / 操作成功 / 优秀品质 |
| <span style="color:#FFFF00;">████</span> | **黄色 (Yellow)** | `|cFFFFFF00` | `#FFFF00` | `1, 1, 0` | 中立目标 / 系统提示 / 任务进度 |
| <span style="color:#0070DD;">████</span> | **蓝色 (Blue)** | `|cFF0070DD` | `#0070DD` | `0, 0.44, 0.87` | 魔法属性 / 精良品质 |
| <span style="color:#A335EE;">████</span> | **紫色 (Epic)** | `|cFFA335EE` | `#A335EE` | `0.64, 0.21, 0.93` | 史诗品质 |
| <span style="color:#FF8000;">████</span> | **橙色 (Orange)** | `|cFFFF8000` | `#FF8000` | `1, 0.5, 0` | 传说品质 / 极其重要的警告 |
| <span style="color:#9D9D9D;">████</span> | **灰色 (Grey)** | `|cFF9D9D9D` | `#9D9D9D` | `0.62, 0.62, 0.62` | 离线 / 冷却中 / 劣质物品 |

## 二、 职业专属颜色 (RAID_CLASS_COLORS)

*注：以下为 60 级怀旧服原生标准色。萨满祭司与圣骑士作为阵营互斥职业，在此版本中共用粉色。*

| 颜色展示 | 职业 | WA Hex 代码 | 标准 Hex | RGB (Lua 脚本) |
| :---: | :--- | :--- | :--- | :--- |
| <span style="color:#C69B6D;">████</span> | **战士 (Warrior)** | `|cFFC69B6D` | `#C69B6D` | `0.78, 0.61, 0.43` |
| <span style="color:#F48CBA;">████</span> | **圣骑士 (Paladin)** | `|cFFF48CBA` | `#F48CBA` | `0.96, 0.55, 0.73` |
| <span style="color:#F48CBA;">████</span> | **萨满祭司 (Shaman)** | `|cFFF48CBA` | `#F48CBA` | `0.96, 0.55, 0.73` |
| <span style="color:#ABD473;">████</span> | **猎人 (Hunter)** | `|cFFABD473` | `#ABD473` | `0.67, 0.83, 0.45` |
| <span style="color:#FFF468;">████</span> | **潜行者 (Rogue)** | `|cFFFFF468` | `#FFF468` | `1, 0.96, 0.41` |
| <span style="color:#FFFFFF;">████</span> | **牧师 (Priest)** | `|cFFFFFFFF` | `#FFFFFF` | `1, 1, 1` |
| <span style="color:#3FC7EB;">████</span> | **法师 (Mage)** | `|cFF3FC7EB` | `#3FC7EB` | `0.25, 0.78, 0.92` |
| <span style="color:#8788EE;">████</span> | **术士 (Warlock)** | `|cFF8788EE` | `#8788EE` | `0.53, 0.53, 0.93` |
| <span style="color:#FF7C0A;">████</span> | **德鲁伊 (Druid)** | `|cFFFF7C0A` | `#FF7C0A` | `1, 0.49, 0.04` |

## 三、 法术学派颜色 (Spell School Colors)

*注：魔兽世界中法术学派没有绝对固定的官方标准色，但以下是插件（如 Details!、WA 等）与玩家约定俗成的通用颜色。*

| 颜色展示 | 学派 | WA Hex 代码 | 标准 Hex | RGB (Lua 脚本) |
| :---: | :--- | :--- | :--- | :--- |
| <span style="color:#FF5000;">████</span> | **火焰 (Fire)** | `|cFFFF5000` | `#FF5000` | `1, 0.31, 0` |
| <span style="color:#00FFFF;">████</span> | **冰霜 (Frost)** | `|cFF00FFFF` | `#00FFFF` | `0, 1, 1` |
| <span style="color:#FF80FF;">████</span> | **奥术 (Arcane)** | `|cFFFF80FF` | `#FF80FF` | `1, 0.5, 1` |
| <span style="color:#4DFF4D;">████</span> | **自然 (Nature)** | `|cFF4DFF4D` | `#4DFF4D` | `0.3, 1, 0.3` |
| <span style="color:#8000FF;">████</span> | **暗影 (Shadow)** | `|cFF8000FF` | `#8000FF` | `0.5, 0, 1` |
| <span style="color:#FFE680;">████</span> | **神圣 (Holy)** | `|cFFFFE680` | `#FFE680` | `1, 0.9, 0.5` |
| <span style="color:#FFFFCC;">████</span> | **物理 (Physical)**| `|cFFFFFFCC` | `#FFFFCC` | `1, 1, 0.8` |

## 四、 WA 代码调用示例

如果你在 WA 的自定义代码中需要输出带颜色的文字：

```lua
-- 1. 字符串拼接方式 (Hex 文本)
local text = "|cFFFF7C0A德鲁伊|r 测试"

-- 2. Lua API 设置字体颜色方式 (RGB)
GameTooltip:SetText("警告", 1, 0.12, 0.12, 1) -- 输出红色文字

-- 3. 动态获取当前玩家的职业颜色
local _, classFilename = UnitClass("player")
local color = RAID_CLASS_COLORS[classFilename]
if color then
    -- 提取系统内置的 R G B 值
    GameTooltip:SetText("玩家", color.r, color.g, color.b)
end
```
