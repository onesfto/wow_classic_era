# 世界地图坐标横向底栏 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将世界地图坐标显示改为固定底部的横向双端布局，并仅保留启用开关。

**Architecture:** `Modules/WorldMap/Coordinates.lua` 继续承担坐标数据更新与显示生命周期，只改变容器的横向锚定和两段文字的锚点。`Modules/WorldMap/Options.lua` 仅修改坐标开关的可见文本。现有 shell 回归测试用静态断言守住固定底部锚点、横向双端布局和开关文本。

**Tech Stack:** WoW Classic Era Lua 5.1、原生 Frame API、POSIX shell、Lua CLI。

---

### Task 1: 添加坐标栏布局回归断言

**Files:**
- Modify: `tests/worldmap_regression.sh`
- Test: `tests/worldmap_regression.sh`

- [ ] **Step 1: 写入失败的布局断言**

在已有坐标组件断言之后加入：

```sh
grep -F 'frame:SetPoint("BOTTOM", WorldMapFrame.ScrollContainer, "BOTTOM", 0, 8)' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'frame.cursor:SetPoint("LEFT", frame, "LEFT", 6, 0)' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'frame.player:SetPoint("RIGHT", frame, "RIGHT", -6, 0)' Modules/WorldMap/Coordinates.lua >/dev/null
grep -F 'AddToggle(panel, "启用坐标", "showCoordinates", nil)' Modules/WorldMap/Options.lua >/dev/null
```

- [ ] **Step 2: 运行测试并确认失败**

运行：`sh tests/worldmap_regression.sh`

预期：失败，原因是当前实现仍包含固定宽度的居中双行坐标框，且设置文本仍为「显示双行坐标」。

### Task 2: 实现固定底部横向坐标栏

**Files:**
- Modify: `Modules/WorldMap/Coordinates.lua`
- Modify: `Modules/WorldMap/Options.lua`
- Test: `tests/worldmap_regression.sh`

- [ ] **Step 1: 替换坐标框尺寸和文字锚点**

在 `Initialize` 中以左右锚点替换 `frame:SetSize(170, 38)`，使容器横跨滚动容器的底部；高度设为 `20`。保留：

```lua
frame:SetPoint("BOTTOM", WorldMapFrame.ScrollContainer, "BOTTOM", 0, 8)
```

将两段文字改为同一行的两端锚定：

```lua
frame.cursor:SetPoint("LEFT", frame, "LEFT", 6, 0)
frame.player:SetPoint("RIGHT", frame, "RIGHT", -6, 0)
```

移除原本 `TOP` 到 `cursor` 的第二行锚点。

- [ ] **Step 2: 更新开关文本**

在 `Modules/WorldMap/Options.lua` 中将：

```lua
AddToggle(panel, "显示双行坐标", "showCoordinates", nil)
```

替换为：

```lua
AddToggle(panel, "启用坐标", "showCoordinates", nil)
```

- [ ] **Step 3: 运行回归测试并确认通过**

运行：`sh tests/worldmap_regression.sh`

预期：输出「世界地图设置存储检查通过」和「世界地图探索与兴趣点检查通过」，命令以状态码 0 结束。

- [ ] **Step 4: 检查最终变更范围**

运行：`git diff --check && git diff -- Modules/WorldMap/Coordinates.lua Modules/WorldMap/Options.lua tests/worldmap_regression.sh`

预期：无空白错误；差异仅包含固定底部横向布局、开关文本与相应回归断言。
