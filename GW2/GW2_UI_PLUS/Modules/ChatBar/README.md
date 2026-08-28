# ChatBar 模块

ChatBar 在聊天窗口上方提供频道切换、频道显隐和插件快捷入口。

## 文件与加载顺序

```text
ChatBar.lua       ChatBar 表、默认值、按钮构建和命令
Options.lua       GW2_UI 设置面板
README.md         本文档
```

`ChatBar.lua` 必须先于 `Options.lua`，两者都必须先于 `core.lua`。`Options.lua` 导出 `addonTable.BuildChatBarPanel`。

## 设置入口

位置：`/gw2` → **聊天** → **频道按钮**。

设置包括：

- 主开关；
- 上下附着位置、X/Y 偏移和缩放；
- 鼠标离开渐隐和动态显隐；
- 频道按钮与插件入口；
- 屏蔽操作使用的聊天窗口。

命令：

```text
/gwcb          输出当前按钮条状态
/gwcb reset    恢复位置、缩放和显示状态
```

## 按钮模型

按钮定义位于 `ChatBar.lua` 的 `BUTTONS` 表，定义顺序就是显示顺序。按钮分为三类：

- `chat`：暴雪内置聊天类型。
- `channel`：编号频道或自定义频道。
- `tool`：调用其他插件或本模块功能的快捷入口。

常用字段：

| 字段 | 作用 |
|---|---|
| `key` | 存档和按钮状态使用的唯一键 |
| `text` | 按钮短文本 |
| `kind` | `chat`、`channel` 或 `tool` |
| `addon` | 可选的插件依赖；未加载时不创建按钮 |
| `visible` | 可选的动态显隐函数 |
| `onClick` | `tool` 按钮的左键处理 |
| `onRight` | 右键处理 |

可屏蔽频道遵循左键启用、右键屏蔽的规则。按钮被屏蔽时只把文字置灰，不改变按钮布局。

## 配置数据

存档变量为 `GW2_UI_PLUS_ChatBarSV`。当前默认值由 `ChatBar.defaults` 提供，主要字段如下：

```lua
{
    enable = true,
    hidden = {},
    anchor = 1,
    offsetX = -26,
    offsetY = 10,
    scale = 1.0,
    fadeOnLeave = false,
    autoHide = true,
    banWindow = nil,
}
```

`InitDB()` 只补缺失键，不覆盖已有存档。新增配置时只修改 `defaults`，并在 `Options.lua` 中提供对应控件。

## 依赖与刷新

- 插件快捷入口通过 `addon` 字段判断依赖，例如 DBM、AtlasLoot、BiaoGe、MeetingHorn 和 MRT。
- 动态显隐监听公会和队伍状态，并使用防抖刷新。
- 频道状态在登录和频道订阅状态变化后刷新。
- 插件启用状态变化需要重新加载界面，才能重新计算可用按钮。

## 修改注意事项

1. 新按钮必须使用唯一 `key`，否则会复用错误的隐藏状态。
2. 改变按钮顺序会影响用户的视觉布局，但不会改变已有存档键。
3. 插件依赖入口必须在依赖未加载时安全跳过。
4. 设置控件的默认值应引用 `ChatBar.defaults`，不要在 `Options.lua` 重复硬编码。
