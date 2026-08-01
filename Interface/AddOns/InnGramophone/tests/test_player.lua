local scriptPath = debug.getinfo(1, "S").source:sub(2)
local root = scriptPath:match("^(.*)/tests/test_player%.lua$")

local now = 100
local plays = {}
local stopped = {}
local timers = {}
local shouldFail = false
local nextHandle = 1000

function GetTime()
    return now
end

function PlaySoundFile(path, channel, noDuplicates, runFinishCallback)
    table.insert(plays, {
        path = path,
        channel = channel,
        noDuplicates = noDuplicates,
        runFinishCallback = runFinishCallback,
    })
    if shouldFail then
        shouldFail = false
        return false, nil
    end
    nextHandle = nextHandle + 1
    return true, nextHandle
end

function StopSound(handle)
    table.insert(stopped, handle)
end

DEFAULT_CHAT_FRAME = {
    AddMessage = function() end,
}

C_Timer = {}

function C_Timer.NewTimer(delay, callback)
    local timer = {
        delay = delay,
        callback = callback,
        cancelled = false,
    }
    function timer:Cancel()
        self.cancelled = true
    end
    function timer:Fire()
        if not self.cancelled then
            self.callback()
        end
    end
    table.insert(timers, timer)
    return timer
end

local testCount = 0

local function assertEqual(actual, expected, message)
    if actual ~= expected then
        error(("%s：期望 %s，实际 %s"):format(message, tostring(expected), tostring(actual)), 2)
    end
end

local function assertTrue(value, message)
    if not value then
        error(message, 2)
    end
end

local function resetFakes()
    now = 100
    plays = {}
    stopped = {}
    timers = {}
    shouldFail = false
end

local function newPlayer()
    resetFakes()
    local addon = {}
    assert(loadfile(root .. "/Core.lua"))("InnGramophone", addon)
    assert(loadfile(root .. "/BuiltinTracks.lua"))("InnGramophone", addon)
    return addon
end

local function test(name, callback)
    callback()
    testCount = testCount + 1
    print(("通过：%s"):format(name))
end

test("默认加载魔兽原声曲库", function()
    local player = newPlayer()
    assertTrue(#player.tracks >= 12, "默认曲库至少应包含 12 首歌曲")
    assertEqual(player.tracks[1].source, "builtin", "默认歌曲来源")
    assertTrue(player.tracks[1].duration > 0, "默认歌曲必须包含时长")
end)

test("播放歌曲并建立结束计时器", function()
    local player = newPlayer()
    player:Play(2)
    assertEqual(player.currentIndex, 2, "当前歌曲索引")
    assertEqual(player.status, "playing", "播放状态")
    assertEqual(plays[1].path, player.tracks[2].path, "播放路径")
    assertEqual(plays[1].channel, "Master", "播放通道")
    assertEqual(timers[1].delay, player.tracks[2].duration, "结束计时")
end)

test("暂停会停止声音，再次播放会从头开始", function()
    local player = newPlayer()
    player:Play(1)
    local firstHandle = player.soundHandle
    now = 115
    assertEqual(math.floor(player:GetElapsed()), 15, "已播放时间")
    player:Pause()
    assertEqual(player.status, "paused", "暂停状态")
    assertEqual(stopped[1], firstHandle, "暂停停止当前声音")
    assertTrue(timers[1].cancelled, "暂停取消结束计时器")
    assertEqual(player:GetElapsed(), 0, "暂停后进度归零")
    player:Play()
    assertEqual(player.status, "playing", "恢复播放状态")
    assertEqual(#plays, 2, "恢复时重新播放当前歌曲")
end)

test("上一首和下一首会循环回绕", function()
    local player = newPlayer()
    player:Play(1)
    player:Previous()
    assertEqual(player.currentIndex, #player.tracks, "第一首的上一首")
    player:Next()
    assertEqual(player.currentIndex, 1, "最后一首的下一首")
end)

test("列表循环在歌曲结束后播放下一首", function()
    local player = newPlayer()
    player.mode = "sequence"
    player:Play(1)
    timers[#timers]:Fire()
    assertEqual(player.currentIndex, 2, "列表循环下一首")
    assertEqual(player.status, "playing", "列表循环继续播放")
end)

test("单曲循环在歌曲结束后重播当前歌曲", function()
    local player = newPlayer()
    player.mode = "repeat-one"
    player:Play(3)
    timers[#timers]:Fire()
    assertEqual(player.currentIndex, 3, "单曲循环索引")
    assertEqual(#plays, 2, "单曲循环重新播放")
end)

test("随机播放避免连续重复", function()
    local player = newPlayer()
    player.mode = "shuffle"
    player.random = function()
        return 4
    end
    player:Play(4)
    timers[#timers]:Fire()
    assertEqual(player.currentIndex, 5, "随机结果与当前相同时选择下一首")
end)

test("播放失败时回到停止状态", function()
    local player = newPlayer()
    shouldFail = true
    local result = player:Play(1)
    assertEqual(result, false, "播放失败返回值")
    assertEqual(player.status, "stopped", "播放失败状态")
    assertEqual(player.soundHandle, nil, "播放失败无声音句柄")
    assertEqual(#timers, 0, "播放失败不建立计时器")
end)

test("播放模式按固定顺序切换", function()
    local player = newPlayer()
    assertEqual(player:CycleMode(), "repeat-one", "第一次切换")
    assertEqual(player:CycleMode(), "shuffle", "第二次切换")
    assertEqual(player:CycleMode(), "sequence", "第三次切换")
end)

print(("全部通过：%d 项"):format(testCount))
