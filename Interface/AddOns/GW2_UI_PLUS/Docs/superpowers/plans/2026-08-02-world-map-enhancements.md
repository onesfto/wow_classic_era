# 世界地图增强实施计划

> **For agentic workers:** REQUIRED SUB-SKILL: Use `subagent-driven-development` (recommended) or `executing-plans` to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**目标：** 将 Leatrix_Maps 的 Classic Era 地图内容和战场地图增强迁移到 `GW2_UI_PLUS`，并在“组件 → 世界地图”中统一配置。

**架构：** 新增 `Modules/WorldMap`，静态数据、世界地图运行逻辑、战场地图逻辑、坐标显示和设置页分别独立。所有设置保存到 `GW2_UI_PLUS_SV.worldMap`；运行 Hook 只安装一次，开关变化时只刷新受影响的图层或 Pin。

**技术栈：** WoW Classic Era Lua 5.1、MapCanvas 数据提供器、`C_Map` / `C_MapExplorationInfo`、GW2 UI `GwSettingsPanelMixin`、shell 与 Lua stub 回归测试。

---

## 文件结构

- 新增 `Modules/WorldMap/Data.lua`：Leatrix 的探索图块、POI、区域等级和钓鱼等级数据。
- 新增 `Modules/WorldMap/Settings.lua`：默认设置、读写 `GW2_UI_PLUS_SV.worldMap`、数值钳制。
- 新增 `Modules/WorldMap/Core.lua`：探索覆盖层、POI、区域/图标/透明度/缩放/居中行为。
- 新增 `Modules/WorldMap/Battlefield.lua`：战场地图增强。
- 新增 `Modules/WorldMap/Coordinates.lua`：两行坐标显示，屏蔽依赖插件的旧坐标框。
- 新增 `Modules/WorldMap/Options.lua`：向 `hud_worldmap` 面板追加 Plus 选项。
- 修改 `GW2_UI_PLUS.toc`：在 Settings 模块前加载上述模块。
- 新增 `tests/worldmap_regression.sh`：静态回归和 Settings Lua stub 检查。

### Task 1：建立设置存储与测试基线

**文件：**

- Create: `Modules/WorldMap/Settings.lua`
- Create: `tests/worldmap_regression.sh`

- [ ] **Step 1: 写失败的设置 Lua stub**

```lua
local addon = {}
assert(loadfile("Modules/WorldMap/Settings.lua"))("GW2_UI_PLUS", addon)
local db = addon.WorldMap.GetDB()
assert(db.showExploration == true)
assert(db.showPoiDungeons == true)
assert(db.battlefieldEnabled == false)
addon.WorldMap.Set("stationaryOpacity", 3)
assert(addon.WorldMap.Get("stationaryOpacity") == 1)
addon.WorldMap.Set("movingOpacity", -1)
assert(addon.WorldMap.Get("movingOpacity") == 0.1)
```

- [ ] **Step 2: 验证 RED**

Run: `sh tests/worldmap_regression.sh`  
Expected: FAIL，提示 `Settings.lua` 不存在。

- [ ] **Step 3: 最小实现**

实现 `addonTable.WorldMap` 的 `GetDB()`、`Get(key)`、`Set(key, value)`、`Normalize(key, value)`。默认值包含：`showExploration`、五类 POI、`showZoneLevels`、`showFishingLevels`、`autoChangeZones`、`centerOnPlayer`、`rememberZoom`、`increaseZoom(Max)`、移动/静止透明度、`classIcons`、图标尺寸、`hideTownCityIcons`、`showCoordinates` 和全部战场地图项。透明度钳制为 `0.1..1`，缩放倍数钳制为 `1..6`。

- [ ] **Step 4: 验证 GREEN**

Run: `sh tests/worldmap_regression.sh`  
Expected: PASS，输出 `世界地图设置存储检查通过`。

- [ ] **Step 5: 提交**

```sh
git add Modules/WorldMap/Settings.lua tests/worldmap_regression.sh
git commit -m 'feat: 新增世界地图设置存储'
```

### Task 2：迁移静态数据

**文件：**

- Create: `Modules/WorldMap/Data.lua`
- Source: `../Leatrix_Maps/Leatrix_Maps_Reveal.lua`
- Source: `../Leatrix_Maps/Leatrix_Maps_Icons.lua`
- Source: `../Leatrix_Maps/Leatrix_Maps.lua:1237-1338`
- Test: `tests/worldmap_regression.sh`

- [ ] **Step 1: 写失败的数据存在性检查**

```sh
grep -F 'WorldMapData.reveal' Modules/WorldMap/Data.lua >/dev/null
grep -F 'WorldMapData.icons' Modules/WorldMap/Data.lua >/dev/null
grep -F 'WorldMapData.levels' Modules/WorldMap/Data.lua >/dev/null
```

- [ ] **Step 2: 验证 RED**

Run: `sh tests/worldmap_regression.sh`  
Expected: FAIL，数据文件不存在。

- [ ] **Step 3: 迁移数据**

创建 `Data.lua`，只迁移地图 artID、探索图块、POI 坐标与类别、标题、描述、atlas、等级和钓鱼数据：

```lua
local _, addonTable = ...
addonTable.WorldMapData = addonTable.WorldMapData or {}
local WorldMapData = addonTable.WorldMapData
WorldMapData.reveal = {}
WorldMapData.icons = {}
WorldMapData.levels = {}
```

从三个来源完整复制表内容；删除一切 `Leatrix_Maps`、`LeaMapsLC`、设置、界面和 Hook 代码。

- [ ] **Step 4: 验证 GREEN**

Run: `sh tests/worldmap_regression.sh`  
Expected: PASS。

- [ ] **Step 5: 提交**

```sh
git add Modules/WorldMap/Data.lua tests/worldmap_regression.sh
git commit -m 'feat: 迁移世界地图探索与兴趣点数据'
```

### Task 3：未探索区域、色调和 POI

**文件：**

- Create: `Modules/WorldMap/Core.lua`
- Modify: `tests/worldmap_regression.sh`

- [ ] **Step 1: 写失败的 POI 筛选 stub**

```lua
local allow = addon.WorldMap.ShouldShowPoi
assert(allow({"Dungeon"}, {showPoiDungeons = true}, "Alliance"))
assert(allow({"FlightA"}, {showPoiFriendlyTravel = true}, "Alliance"))
assert(not allow({"FlightH"}, {showPoiFriendlyTravel = true, showPoiOpposingTravel = false}, "Alliance"))
assert(allow({"Arrow"}, {showPoiZoneCrossings = true}, "Alliance"))
```

同时加入静态检查：`MapExplorationPin_RefreshOverlays`、`C_MapExplorationInfo.GetExploredMapTextures`、`WorldMapData.reveal` 与 `WorldMap.ApplyExploration`。

- [ ] **Step 2: 验证 RED**

Run: `sh tests/worldmap_regression.sh`  
Expected: FAIL，`ShouldShowPoi` 和探索函数尚未定义。

- [ ] **Step 3: 实现探索和 POI**

移植 Leatrix 的探索图块计算至 `MapExplorationPin_RefreshOverlays`，但用 `WorldMap.Get("showExploration")` 与 `WorldMap.Get("explorationTint")` 控制显示和 `SetVertexColor`。Hook 每个 `MapExplorationPinTemplate` 的 `RefreshOverlays`。

实现纯函数 `WorldMap.ShouldShowPoi(pinInfo, db, faction)`，覆盖 `Dungeon`、`Raid`、`Dunraid`、`FlightA/H/N`、`TravelA/H/N`、`Spirit` 和 `Arrow`。以独立 `GwPlusWorldMapPoiPinTemplate` 数据提供器添加 Pin；左键按出口箭头切图、右键返回父地图。副本标题显示难度颜色等级，区域鼠标提示显示最低钓鱼等级；在 1414、1415、947 且设置启用时隐藏城镇/城市 Pin。

- [ ] **Step 4: 验证 GREEN**

Run: `sh tests/worldmap_regression.sh`  
Expected: PASS，POI 断言和探索静态检查都通过。

- [ ] **Step 5: 提交**

```sh
git add Modules/WorldMap/Core.lua tests/worldmap_regression.sh
git commit -m 'feat: 添加世界地图探索和兴趣点'
```

### Task 4：地图行为、职业图标和双行坐标

**文件：**

- Modify: `Modules/WorldMap/Core.lua`
- Create: `Modules/WorldMap/Coordinates.lua`
- Modify: `tests/worldmap_regression.sh`

- [ ] **Step 1: 写失败的行为检查**

```sh
grep -F 'ZONE_CHANGED_NEW_AREA' Modules/WorldMap/Core.lua >/dev/null
grep -F 'PlayerMovementFrameFader.AddDeferredFrame' Modules/WorldMap/Core.lua >/dev/null
grep -F 'CreateZoomLevels' Modules/WorldMap/Core.lua >/dev/null
grep -F 'useClassColor' Modules/WorldMap/Core.lua >/dev/null
grep -F 'coords.cursor' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'coords.player' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'C_Timer.NewTicker(0.2' Modules/WorldMap/Coordinates.lua >/dev/null
```

- [ ] **Step 2: 验证 RED**

Run: `sh tests/worldmap_regression.sh`  
Expected: FAIL，行为和坐标模块缺失。

- [ ] **Step 3: 实现地图行为**

实现并导出 `ApplyAutoChangeZones()`、`ApplyCenterOnPlayer()`、`ApplyOpacity()`、`ApplyZoom()`、`ApplyGroupIcons()`。自动换区只在此前地图等于玩家地图时切换；居中以 2 秒节流、Shift 暂停；透明度使用 `PlayerMovementFrameFader.AddDeferredFrame`；缩放 Hook `CreateZoomLevels`；同一地图重开时恢复 canvas scale 与滚动位置；队伍/团队 Pin 使用职业色和独立尺寸，玩家箭头使用独立尺寸。

实现 `Coordinates.lua`：带半透明背景的两行框，`coords.cursor` 用鼠标归一化位置，`coords.player` 用玩家地图位置。地图显示时 0.2 秒 ticker 刷新，隐藏时取消；隐藏 GW2 UI 的原单行框并让其更新回调不再重新显示。

- [ ] **Step 4: 验证 GREEN**

Run: `sh tests/worldmap_regression.sh`  
Expected: PASS。

- [ ] **Step 5: 提交**

```sh
git add Modules/WorldMap/Core.lua Modules/WorldMap/Coordinates.lua tests/worldmap_regression.sh
git commit -m 'feat: 添加世界地图行为和双行坐标'
```

### Task 5：战场地图增强

**文件：**

- Create: `Modules/WorldMap/Battlefield.lua`
- Modify: `tests/worldmap_regression.sh`

- [ ] **Step 1: 写失败的战场地图检查**

```sh
grep -F 'BattlefieldMapOptions.showPlayers = true' Modules/WorldMap/Battlefield.lua >/dev/null
grep -F 'BattlefieldMapFrame:SetMovable(true)' Modules/WorldMap/Battlefield.lua >/dev/null
grep -F 'CreateZoomLevels' Modules/WorldMap/Battlefield.lua >/dev/null
grep -F 'BattleCenterOnPlayer' Modules/WorldMap/Battlefield.lua >/dev/null
```

- [ ] **Step 2: 验证 RED**

Run: `sh tests/worldmap_regression.sh`  
Expected: FAIL，战场模块不存在。

- [ ] **Step 3: 实现战场控制器**

实现 `addonTable.WorldMap.Battlefield.Initialize()` 与 `Apply()`。在 `battlefieldEnabled` 为真时显示队友、持久化锚点、允许开关控制的拖动和右下角尺寸调整、应用宽度/透明度/最大缩放；以 2 秒节流自动居中（Shift 暂停）；独立设置玩家箭头和队伍/团队 Pin 尺寸。每次访问 `BattlefieldMapFrame` 前执行 nil 检查。

- [ ] **Step 4: 验证 GREEN**

Run: `sh tests/worldmap_regression.sh`  
Expected: PASS。

- [ ] **Step 5: 提交**

```sh
git add Modules/WorldMap/Battlefield.lua tests/worldmap_regression.sh
git commit -m 'feat: 添加战场地图增强'
```

### Task 6：设置页接入、TOC 与完成验证

**文件：**

- Create: `Modules/WorldMap/Options.lua`
- Modify: `GW2_UI_PLUS.toc`
- Modify: `tests/worldmap_regression.sh`

- [ ] **Step 1: 写失败的设置接入检查**

```sh
grep -F 'pages.hud_worldmap' Modules/WorldMap/Options.lua >/dev/null
grep -F 'panel:AddGroupHeader("地图内容")' Modules/WorldMap/Options.lua >/dev/null
grep -F 'panel:AddGroupHeader("地图行为")' Modules/WorldMap/Options.lua >/dev/null
grep -F 'panel:AddGroupHeader("图标与坐标")' Modules/WorldMap/Options.lua >/dev/null
grep -F 'panel:AddGroupHeader("战场地图")' Modules/WorldMap/Options.lua >/dev/null
grep -F 'Modules/WorldMap/Options.lua' GW2_UI_PLUS.toc >/dev/null
```

- [ ] **Step 2: 验证 RED**

Run: `sh tests/worldmap_regression.sh`  
Expected: FAIL，设置模块与 TOC 条目不存在。

- [ ] **Step 3: 实现设置注入**

等待 `GW.GetSettingsTabFrame()` 和 `gwPlusEmbeddedPanels.hud_worldmap` 可用后，向该原生面板追加四组标题。每项以 `getter = function() return WorldMap.Get(key) end`、`setter = function(value) WorldMap.Set(key, value); WorldMap.Apply() end`、`getDefault = function() return WorldMap.defaults[key] end` 注册。主开关使用 `isMasterToggle`，从属控件用 `dependence`。TOC 加载顺序为 Settings、Data、Core、Battlefield、Coordinates、Options，且都在 Plus 设置模块之前。

- [ ] **Step 4: 验证 GREEN**

Run: `sh tests/worldmap_regression.sh && for test_file in tests/*.sh; do sh "$test_file"; done`  
Expected: 所有脚本退出码为 0。

- [ ] **Step 5: 游戏内验证**

执行：

```text
/console taintLog 1
/reload
```

切换探索、色调、五类 POI、等级与钓鱼显示；移动并跨区；组队与团队；打开战场地图并拖动、缩放、调透明度；启用 Questie 后重复。确认 BugSack 无错误，战斗中地图 Pin 和关闭按钮可用。

- [ ] **Step 6: 提交**

```sh
git add Modules/WorldMap GW2_UI_PLUS.toc tests/worldmap_regression.sh
git commit -m 'feat: 完成世界地图增强设置接入'
```

## 自查

- 范围覆盖：探索和色调（Task 3）、POI/等级/钓鱼/城镇图标（Task 3）、自动换区/透明度/职业图标（Task 4）、双行坐标（Task 4）、战场图（Task 5）、设置入口（Task 6）。
- 跨模块 API 顺序正确：设置 API（Task 1）、静态数据（Task 2）、运行逻辑（Task 3-5）、设置 UI（Task 6）。
- 每个实现任务均要求先验证失败，再实现并验证通过。

