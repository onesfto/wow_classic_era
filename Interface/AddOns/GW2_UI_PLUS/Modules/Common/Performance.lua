local _, addonTable = ...
local Performance = {}
addonTable.Performance = Performance
local throttles = {}
function Performance.Throttle(key, interval, func)
    local now = GetTime()
    local last = throttles[key] or 0
    if now - last >= interval then
        throttles[key] = now
        func()
        return true
    end
    return false
end
local debounces = {}
function Performance.Debounce(key, delay, func)
    if debounces[key] then
        debounces[key]:Cancel()
    end
    debounces[key] = C_Timer.NewTimer(delay, function()
        debounces[key] = nil
        func()
    end)
end
local cache = {}
function Performance.CacheGlobal(key, globalName)
    if not cache[key] then
        cache[key] = _G[globalName]
    end
    return cache[key]
end
function Performance.ClearCache()
    cache = {}
end
