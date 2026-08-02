# `!GW2_UI_PLUS_Early` 组件归属说明

`!GW2_UI_PLUS_Early` 是 `GW2_UI_PLUS` 的配套先行加载组件，和主插件属于同一套插件，不是第三方插件。

## 目录位置

```text
Interface/AddOns/
├── GW2_UI_PLUS/
└── !GW2_UI_PLUS_Early/
```

## 为什么单独存在

`GW2_UI` 会在较早的加载阶段创建设置界面。`GW2_UI_PLUS` 依赖 `GW2_UI`，通常已经晚于 `GW2_UI` 加载，部分语言词条此时再补充只能影响后续创建的控件。

`!GW2_UI_PLUS_Early` 利用目录名前的 `!` 优先加载，在 `GW2_UI` 初始化前注册需要提前准备的 `zhCN` 词条。

## 职责边界

- `!GW2_UI_PLUS_Early/zhCN.lua`：只注册必须早于 `GW2_UI` 创建的语言词条。
- `GW2_UI_PLUS/Locale/Hardcoded.lua`：补充硬编码文本，并刷新已经创建的设置控件。
- `GW2_UI_PLUS` 其他模块：负责功能逻辑、设置菜单拆分和运行时行为。

## 维护规则

新增或修正 GW2_UI 设置词条时：

1. 如果词条会在 GW2_UI 初始化时被复制到控件，应同时更新 `!GW2_UI_PLUS_Early/zhCN.lua`。
2. 如果词条已经被 GW2_UI 创建，或文本是硬编码的，应在 `Locale/Hardcoded.lua` 中增加运行时刷新逻辑。
3. 不要把 `!GW2_UI_PLUS_Early` 改成依赖 `GW2_UI` 的普通后加载插件；它必须保持独立并先于 `GW2_UI` 加载。

因此，修改 `!GW2_UI_PLUS_Early` 就等同于修改本项目的配套代码，发布和测试时应与 `GW2_UI_PLUS` 一起处理。
