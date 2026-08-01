-- QuestieTimerFix.lua
-- 归属：Onesfto 插件
--
-- 最终修复策略 V5（三管齐下，无视加载顺序）：
-- 因为 Onesfto.toc 中 OptionalDeps 包含了 W 开头的插件（WhisperPop 等），
-- 导致 Onesfto 的实际加载顺序可能被推迟到 Questie (Q) 之后，也可能在它之前。
-- 加载顺序不确定导致之前的单一策略失效。
--
-- 本脚本将同时采用以下三种策略：
-- 1. 全局代理 C_Timer.NewTicker（应对 Onesfto 先加载的情况）
-- 2. 立即替换 ThreadLib.Thread（应对 Onesfto 后加载的情况）
-- 3. 监听 ADDON_LOADED（应对两者中间状态的情况）

if not C_Timer or not C_Timer.NewTicker then return end

local _RealNewTicker = C_Timer.NewTicker

-- ── 全局 Timer 熔断器 (保护 C_Timer.After 不超限) ────────────────────────
local _activeAfters = 0
local _afterQueue = {}
local _afterBatcher = nil

local function ProcessAfterQueue()
    _afterBatcher = nil
    local toProcess = _afterQueue
    _afterQueue = {}
    
    for i = 1, #toProcess do
        toProcess[i]()
    end
end

local _RealAfter = C_Timer.After
C_Timer.After = function(delay, callback)
    -- WoW 原生大概在 1000+ 就会崩溃，这里设定 250 为安全水位
    if _activeAfters > 250 then
        table.insert(_afterQueue, callback)
        if not _afterBatcher then
            _afterBatcher = _RealAfter(delay, ProcessAfterQueue)
        end
        return
    end

    _activeAfters = _activeAfters + 1
    _RealAfter(delay, function()
        _activeAfters = _activeAfters - 1
        if callback then callback() end
    end)
end

-- ── 批量队列引擎 ─────────────────────────────────────────────────────────────
local _queue         = {}    -- 待处理的 ticker 回调队列
local _batcher       = nil   -- 唯一真实 ticker
local BATCH_PER_TICK = 8     -- 每帧最多处理数

local function _runBatch()
    local requeue = {}
    local n = 0

    while #_queue > 0 and n < BATCH_PER_TICK do
        local item = table.remove(_queue, 1)

        if not item.cancelled then
            item.callback()
            
            if item.iterations then
                item.iterations = item.iterations - 1
                if item.iterations <= 0 then
                    item.cancelled = true
                end
            end
            
            if not item.cancelled then
                table.insert(requeue, item)
            end
        end
        n = n + 1
    end

    for i = #requeue, 1, -1 do
        table.insert(_queue, 1, requeue[i])
    end

    if #_queue == 0 and _batcher then
        _batcher:Cancel()
        _batcher = nil
    end
end

local function _createFakeTicker(callback, iterations)
    local item = {
        callback = callback,
        iterations = iterations,
        cancelled = false
    }
    
    local fakeTicker = {}
    function fakeTicker:Cancel()
        item.cancelled = true
    end

    table.insert(_queue, item)

    if not _batcher then
        _batcher = _RealNewTicker(0, _runBatch)
    end

    return fakeTicker
end

-- 策略 1：全局替换（Onesfto 先加载时生效）
C_Timer.NewTicker = function(delay, callback, iterations)
    if delay == 0 then
        return _createFakeTicker(callback, iterations)
    end
    return _RealNewTicker(delay, callback, iterations)
end

-- ── 替换 ThreadLib.Thread 的执行体 ─────────────────────────────────────────
local _hookedThreadLib = false
local function HookThreadLib()
    if _hookedThreadLib then return end
    if not QuestieLoader then return end

    local ThreadLib = QuestieLoader:ImportModule("ThreadLib")
    if not ThreadLib or not ThreadLib.Thread then return end

    local _OriginalThread = ThreadLib.Thread
    ThreadLib.Thread = function(threadFunction, delay, errorMessage, callbackFunction)
        if delay == 0 then
            -- 绕开原始的 C_Timer.NewTicker，直接使用我们的批量引擎
            local thread = coroutine.create(threadFunction)
            
            local fakeTicker = _createFakeTicker(function()
                local status = coroutine.status(thread)
                if status == "suspended" then
                    local ok, err = coroutine.resume(thread)
                    if not ok then
                        if Questie and Questie.Error then
                            Questie:Error(errorMessage or "Error in thread", err)
                        end
                        -- 利用外部环境的 fakeTicker 来标记取消
                    end
                elseif status == "dead" then
                    if callbackFunction then callbackFunction() end
                end
            end)
            
            -- 为了在协程结束后自动取消 fakeTicker，包装一下
            -- 原来的 ThreadLib 是在 timer 的回调里取消的，我们上面 _createFakeTicker 里并没有处理协程逻辑。
            -- 重新定义 item.callback 让其支持协程判断。
            -- 上面的 fakeTicker.Cancel() 就是取消它。
            
            return fakeTicker, thread
        end
        
        return _OriginalThread(threadFunction, delay, errorMessage, callbackFunction)
    end
    
    -- 修正刚才写的闭包，刚才 _createFakeTicker 里无法拿到 fakeTicker 本身调用 Cancel，
    -- 我们在闭包里可以拿到 fakeTicker 的引用，所以：
    -- 但因为上面是先创建 fakeTicker，所以我们需要修改一下结构。
    
    -- 完整的协程包装：
    ThreadLib.Thread = function(threadFunction, delay, errorMessage, callbackFunction)
        if delay == 0 then
            local thread = coroutine.create(threadFunction)
            local item = { cancelled = false }
            local fakeTicker = {}
            function fakeTicker:Cancel()
                item.cancelled = true
            end
            
            item.callback = function()
                if item.cancelled then return end
                local status = coroutine.status(thread)
                if status == "suspended" then
                    local ok, err = coroutine.resume(thread)
                    if not ok then
                        if Questie and Questie.Error then
                            Questie:Error(errorMessage or "Error in thread", err)
                        end
                        item.cancelled = true
                    end
                elseif status == "dead" then
                    item.cancelled = true
                    if callbackFunction then callbackFunction() end
                end
            end
            
            table.insert(_queue, item)
            if not _batcher then
                _batcher = _RealNewTicker(0, _runBatch)
            end
            
            return fakeTicker, thread
        end
        return _OriginalThread(threadFunction, delay, errorMessage, callbackFunction)
    end
    
    _hookedThreadLib = true
end

-- 策略 2：立即替换（Onesfto 后加载时生效）
HookThreadLib()

-- 策略 3：监听事件（应对可能的延迟加载情况）
local _fixFrame = CreateFrame("Frame")
_fixFrame:RegisterEvent("ADDON_LOADED")
_fixFrame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "Questie" then
        HookThreadLib()
    end
end)
