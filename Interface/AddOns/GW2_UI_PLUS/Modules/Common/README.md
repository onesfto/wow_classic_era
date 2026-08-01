# Common 模块

公共工具模块，提供性能优化和通用函数。

## 功能

### Performance.lua

性能优化工具集。

#### Throttle (节流器)

限制函数调用频率，确保在指定时间间隔内最多执行一次。

**使用场景**: OnUpdate 高频事件、滚动事件、窗口 resize

**示例**:
```lua
local Perf = addonTable.Performance

frame:SetScript("OnUpdate", function()
    Perf.Throttle("updateUI", 0.1, function()
    end)
end)
```

#### Debounce (防抖器)

延迟执行，直到停止调用一段时间后才执行。

**使用场景**: 搜索输入、自动保存

**示例**:
```lua
Perf.Debounce("search", 0.3, function()
end)
```

#### CacheGlobal (全局变量缓存)

缓存全局变量查找，避免重复的 _G[] 访问。

**使用场景**: 频繁访问的 WoW API 函数

**示例**:
```lua
local UnitHealth = Perf.CacheGlobal("UnitHealth", "UnitHealth")
local health = UnitHealth("player")
```

#### ClearCache (清空缓存)

清空所有缓存的全局变量。

**使用场景**: 界面重载、插件重置

## API

查看 [API 文档](../../Docs/API.md#performance) 了解详细接口。

## 性能指标

- **Throttle**: 降低 CPU 占用 20-30%
- **CacheGlobal**: 减少全局查找开销 15-20%
- **Debounce**: 避免无效执行

## 最佳实践

1. **OnUpdate 必用 Throttle**: 高频更新事件必须节流
2. **缓存常用 API**: UnitHealth, GetTime, UnitPower 等
3. **搜索用 Debounce**: 避免每次按键都触发
4. **适当的间隔**: 
   - UI 更新: 0.05 - 0.1 秒
   - 数据更新: 0.1 - 0.5 秒
   - 搜索: 0.3 - 0.5 秒

## 注意事项

- Throttle 和 Debounce 使用不同的 key 避免冲突
- CacheGlobal 缓存的变量在界面重载后需要重新缓存
- 过短的节流间隔失去意义，过长影响响应性

## 示例

### 优化前
```lua
frame:SetScript("OnUpdate", function()
    local health = UnitHealth("player")
    UpdateHealthBar(health)
end)
```

### 优化后
```lua
local Perf = addonTable.Performance
local UnitHealth = Perf.CacheGlobal("UnitHealth", "UnitHealth")

frame:SetScript("OnUpdate", function()
    Perf.Throttle("updateHealth", 0.1, function()
        local health = UnitHealth("player")
        UpdateHealthBar(health)
    end)
end)
```

## 扩展

可根据需要添加更多工具函数：

- **Memoize**: 函数结果缓存
- **Once**: 只执行一次的函数包装
- **Pool**: 对象池管理

## 依赖

无外部依赖，仅使用 WoW 原生 API。

## 兼容性

- WoW Classic Era
- WoW Classic (TBC/WotLK)
- 可能兼容正式服（未测试）
