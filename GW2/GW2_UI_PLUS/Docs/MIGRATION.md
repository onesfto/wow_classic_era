# GW2_UI_PLUS 迁移与交接说明

GW2_UI_PLUS 是 GW2_UI 的增强层，不复制整个本体，也不把上游设置永久改写到本项目中。模块通过 GW2_UI 提供的 Frame、设置、mover 和皮肤接口补充功能。

## 模块归属

| 区域 | 当前实现 |
|---|---|
| 通用功能 | `Modules/General/`，任务、拾取、商人和视觉辅助 |
| 工具条 | `Modules/Toolbar/`，快捷栏、队伍管理、标记条和性能条 |
| 小地图 | `Modules/Minimap/`，第三方插件按钮收纳 |
| 聊天 | `Modules/ChatBar/`、`Modules/ChatWindow/`，频道、窗口和消息管理 |
| 动作条 | `Modules/ActionBar/`，布局、渐隐和职业动作条 |
| 框体 | `Modules/UnitFrames/`，玩家资源、光环、能量和队伍布局 |
| 世界地图 | `Modules/WorldMap/`，坐标、探索、兴趣点和地图增强 |
| 设置 | `Modules/Settings/`，GW2_UI 设置页整理、原生面板嵌入和编辑模式入口 |
| 社交 | `Modules/Social/`，好友、公会、忽略、团队和 Who 列表 |
| 皮肤 | `Modules/Skins/`，GW2 风格控件和第三方插件皮肤 |
| 一键换装 | `Libs/alaGearMan/` 配合 `core.lua` 集成 |

## 运行时边界

- GW2_UI 是必需依赖，`GW2_UI_PLUS.toc` 的顺序是加载事实来源。
- 模块之间通过 `addonTable` 共享对象；GW2_UI 对象通过 `_G.GW2_ADDON` 访问。
- 设置模块会捕获并嵌入部分 GW2_UI 原生面板，切换页面时恢复原父级和锚点。
- 受保护框体只能在允许修改的状态下改变位置、属性或脚本；需要延后的操作交给已有的脱战队列。
- 配置键和默认值由各模块维护，新增 SavedVariables 必须同步更新 TOC 和配置说明。

## 上游变更时的处理顺序

1. 先确认 GW2_UI 当前提供的对象、设置键、mover 名称和加载事件。
2. 检查本项目对应模块是否依赖这些名称或返回结构。
3. 只在 Plus 模块中增加兼容分支，不直接复制一份上游实现。
4. 如果上游已经提供等价能力，删除本项目的重复覆盖，并更新模块 README。
5. 记录会影响后续维护的 API、加载顺序或默认值变化。

## 常见交接点

### 设置页面

`core.lua` 负责注册附加组件页面；`Modules/Settings/` 负责框体、聊天、队伍、组件和编辑模式标签。新增页面时需要同时考虑页面入口、Frame 生命周期、父级恢复和设置控件刷新。

### 皮肤

`Modules/Skins/Core.lua` 提供通用控件皮肤。具体窗口皮肤应只处理目标插件自己的 Frame，不修改原插件文件，也不依赖固定的匿名 Frame 名称。

### 动作条与框体

动作条、玩家资源和 mover 共享部分设置值。修改尺寸或位置时优先调用现有模块方法，让显示对象、存档和设置控件保持同步。

## 发布前的静态交接清单

- `GW2_UI_PLUS.toc` 中的路径、依赖和 SavedVariables 与目录一致。
- 新增模块的加载顺序满足其 `addonTable` 依赖。
- 不再引用已移除的 GW2_UI 函数、路径或页面 ID。
- 新增设置项有默认值、getter/setter 和对应页面入口。
- 调试输出不会成为正常运行时的高频日志。
- 影响用户配置或页面结构的变更已更新 [配置说明](CONFIGURATION.md) 或模块 README。

## 相关文档

- [设置系统架构](SETTINGS_ARCHITECTURE.md)
- [设置面板清单](SETTINGS_PANELS.md)
- [API 文档](API.md)
- [模块文档](README.md)
