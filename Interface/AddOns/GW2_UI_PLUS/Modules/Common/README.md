# Common 模块

Common 只提供跨模块复用的轻量工具，目前由 `Performance.lua` 实现。

## `addonTable.Performance`

```lua
local Perf = addonTable.Performance
```

- `Throttle(key, interval, func)`：间隔内只执行一次，返回本次是否执行。
- `Debounce(key, delay, func)`：取消同键旧回调，延迟执行最新回调。
- `CacheGlobal(key, globalName)`：缓存 `_G[globalName]`。
- `ClearCache()`：清空全局函数缓存。

## 使用原则

- `OnUpdate` 或高频事件只处理轻量逻辑，并使用合适的节流间隔。
- 节流和防抖的 `key` 必须在模块内唯一，避免不同业务互相取消或共用状态。
- 只缓存不会在运行期间替换的全局函数；界面重载后缓存会随插件重新建立。
- 不在 Common 中加入单一模块专用的配置、Frame 或业务逻辑。

## 依赖

无外部依赖，只使用 WoW 原生 API。接口详情见 [API 文档](../../Docs/API.md)。
