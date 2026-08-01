# Local Music Player Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 为经典旧世客户端创建一个默认加载魔兽原声、可导入本地歌曲的游戏内播放器。

**Architecture:** 使用独立 Lua 核心维护曲库与播放状态，UI 只消费公开方法和状态变化回调。曲库由内置清单与游戏外导入脚本生成的本地清单组成，歌曲结束由已知时长和 `C_Timer` 驱动。

**Tech Stack:** WoW Classic Era Lua API、WoW Frame XML API、zsh、ffprobe、Lua 5.1 兼容语法。

---

### Task 1: 核心行为测试

**Files:**
- Create: `Interface/AddOns/LocalMusicPlayer/tests/test_player.lua`

- [ ] **Step 1: 编写失败测试**

测试脚本伪造 `PlaySoundFile`、`StopSound`、`C_Timer`、`GetTime` 和聊天输出，随后通过：

```lua
assert(loadfile(root .. "/Core.lua"))("LocalMusicPlayer", addon)
assert(loadfile(root .. "/BuiltinTracks.lua"))("LocalMusicPlayer", addon)
```

验证默认曲库非空、播放状态和句柄、暂停行为、前后切歌回绕、列表循环、单曲循环、随机播放不重复，以及播放失败回到停止状态。

- [ ] **Step 2: 验证测试因缺少实现而失败**

Run: `lua Interface/AddOns/LocalMusicPlayer/tests/test_player.lua`

Expected: FAIL，原因是 `Core.lua` 尚不存在。

### Task 2: 插件清单和播放器核心

**Files:**
- Create: `Interface/AddOns/LocalMusicPlayer/LocalMusicPlayer.toc`
- Create: `Interface/AddOns/LocalMusicPlayer/Core.lua`
- Create: `Interface/AddOns/LocalMusicPlayer/BuiltinTracks.lua`
- Create: `Interface/AddOns/LocalMusicPlayer/LocalTracks.lua`

- [ ] **Step 1: 创建插件清单**

`.toc` 使用接口版本 `11509`，声明 `LocalMusicPlayerDB`，按核心、内置曲库、本地曲库、UI 的顺序加载。

- [ ] **Step 2: 实现最小核心**

公开接口固定为：

```lua
LMP:AddTrack(track)
LMP:Play(index)
LMP:Pause()
LMP:Stop()
LMP:Next()
LMP:Previous()
LMP:CycleMode()
LMP:GetElapsed()
LMP:SetStateChanged(callback)
```

播放模式固定为 `sequence`、`repeat-one`、`shuffle`。所有停止路径取消计时器并清理声音句柄；随机模式避免连续重复。

- [ ] **Step 3: 添加默认曲库**

登记 Leatrix Plus 已验证可播放的经典旧世音乐路径和时长，来源标记为 `builtin`。

- [ ] **Step 4: 运行核心测试**

Run: `lua Interface/AddOns/LocalMusicPlayer/tests/test_player.lua`

Expected: PASS，并输出全部测试数量。

### Task 3: Listen1 风格游戏内界面

**Files:**
- Create: `Interface/AddOns/LocalMusicPlayer/UI.lua`

- [ ] **Step 1: 创建固定尺寸主窗口**

窗口包含标题栏、左侧来源筛选、中部可滚动歌曲列表、当前歌曲区域和底部控制栏。窗口可拖动、可关闭，并加入 `UISpecialFrames`。

- [ ] **Step 2: 创建播放控件**

上一首、播放/暂停、下一首使用固定尺寸图标按钮；模式按钮显示“列表循环 / 单曲循环 / 随机播放”；所有按钮提供工具提示。

- [ ] **Step 3: 绑定播放器状态**

歌曲点击调用 `Play(index)`，状态回调刷新选中行、当前歌曲、按钮状态和播放模式。`OnUpdate` 每 0.2 秒刷新时间与进度，不让动态文本改变布局。

- [ ] **Step 4: 添加入口**

注册 `/lmp` 和 `/musicplayer`，并创建小地图按钮。左键切换播放器，右键停止播放。

- [ ] **Step 5: 静态校验**

Run: `luac -p Interface/AddOns/LocalMusicPlayer/*.lua`

Expected: exit 0。

### Task 4: 本地音乐导入

**Files:**
- Create: `Interface/AddOns/LocalMusicPlayer/ImportMusic.command`
- Create: `Interface/AddOns/LocalMusicPlayer/Music/.gitkeep`
- Create: `Interface/AddOns/LocalMusicPlayer/README.md`

- [ ] **Step 1: 编写导入脚本**

脚本确定自身插件目录，检查 `ffprobe`，扫描 `Music` 下的 `.mp3` 和 `.ogg`，读取时长并原子替换 `LocalTracks.lua`。生成条目调用：

```lua
LMP:AddTrack({
    title = "文件名",
    artist = "本地音乐",
    path = "Interface/AddOns/LocalMusicPlayer/Music/文件名.mp3",
    duration = 180,
    source = "local",
})
```

- [ ] **Step 2: 编写简短中文说明**

说明安装位置、打开命令、本地歌曲导入流程、三种播放模式，以及暂停会从头重播的限制。

- [ ] **Step 3: 验证导入脚本**

在临时插件副本中生成一段测试音频，运行 `ImportMusic.command`，然后用 `luac -p` 校验生成清单，并检查标题、路径、时长和来源。

### Task 5: 完整验收

**Files:**
- Verify: `Interface/AddOns/LocalMusicPlayer/**`

- [ ] **Step 1: 运行完整自动化测试**

Run: `lua Interface/AddOns/LocalMusicPlayer/tests/test_player.lua`

Expected: 所有核心测试通过。

- [ ] **Step 2: 校验所有 Lua 文件**

Run: `find Interface/AddOns/LocalMusicPlayer -name '*.lua' -print0 | xargs -0 -n1 luac -p`

Expected: exit 0。

- [ ] **Step 3: 核对交付范围**

确认 Git 状态中只出现 `Interface/AddOns/LocalMusicPlayer` 和两份 Superpowers 文档的新文件，不触碰用户已有修改。
