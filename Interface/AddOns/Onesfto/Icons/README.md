# Onesfto Icons

这里存放的是由于 60 级客户端原版缺失、或者提取困难，通过手动从 Wowhead 下载并转换为 `.tga` 格式的高清原版游戏图标。

所有图片文件均已处理为标准的 64x64 分辨率，可以直接在你的插件或者 WeakAuras (WA) 中调用。

## 当前已有的图标列表

| 物品/首领 | 对应原版文件名称 | 插件 / WA 本地调用路径 |
| :--- | :--- | :--- |
| **克苏恩之眼** | `spell_shadow_detectinvisibility.tga` | `Interface\AddOns\Onesfto\Icons\spell_shadow_detectinvisibility.tga` |
| **哈卡之心** | `inv_misc_gem_bloodstone_02.tga` | `Interface\AddOns\Onesfto\Icons\inv_misc_gem_bloodstone_02.tga` |
| **萨弗拉斯，炎魔拉格纳罗斯之手** | `inv_hammer_unique_sulfuras.tga` | `Interface\AddOns\Onesfto\Icons\inv_hammer_unique_sulfuras.tga` |
| **奈法利安的头颅** | `inv_misc_head_dragon_black.tga` | `Interface\AddOns\Onesfto\Icons\inv_misc_head_dragon_black.tga` |
| **克尔苏加德的护符匣** | `inv_misc_urn_01.tga` | `Interface\AddOns\Onesfto\Icons\inv_misc_urn_01.tga` |
| **奥术潜能 (或同款图标)** | `spell_arcane_arcanepotency.tga` | `Interface\AddOns\Onesfto\Icons\spell_arcane_arcanepotency.tga` |

## 💡 使用说明

1. **格式与尺寸**：所有图标都已重采样为 64x64 的标准长宽比（2的N次方），完全符合魔兽世界旧版引擎要求。
2. **代码调用**：在编写 Lua 代码时，如果将路径作为字符串传递，请务必使用双反斜杠进行转义。例如：`"Interface\\AddOns\\Onesfto\\Icons\\inv_misc_urn_01.tga"`。
3. **识别生效**：由于这些是你本地新增的材质文件（并非覆盖已有文件），魔兽客户端的引擎必须要**彻底退出游戏并重新进入**才能将它们读取进内存。不要只用 `/reload`（rl）重载界面，那不管用。
