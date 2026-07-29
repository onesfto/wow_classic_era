# NWB Buff 窗口统一留白设计

## 目标

让 `NWBbuffListFrame` 的可见内容与 NWB 主界面保持一致，统一采用 `30px` 内容留白。调整仅位于 `GW2_UI_PLUS` 的 NWB skin，不修改 NovaWorldBuffs 插件本体。

## 方案

采用局部重排方案：

- 复用 `skins/NovaWorldBuffs.lua` 已有的 `PAD = 30`。
- 将统计复选框、说明文字、DMF 状态文字和 Buff 行统一锚定到窗口内容区左侧 `30px`。
- 保持右侧动作按钮距窗口上、右各 `30px`。
- 将最低等级滑块放在右侧动作按钮列下方，右侧同样保留 `30px`，避免与按钮重叠。
- 在 NWB 创建动态控件和刷新 Buff 列表后重新应用布局，防止 NWB 自身的坐标刷新覆盖 skin。

不采用修改 NWB 源码的方案，以避免 NWB 更新覆盖改动；也不通过扩大 EditBox 的文本 inset 间接调整，因为 Buff 行和动态控件都是独立子 Frame，不受文本 inset 控制。

## 验收标准

- Buff 窗口左侧可见内容距窗口左边界为 `30px`。
- 顶部控件距窗口内容顶部为 `30px`，不再贴住标题栏。
- 右侧按钮和滑块距右边界为 `30px`，且互不重叠。
- NWB 每秒刷新列表后，Buff 行仍保持统一左边距。
- Lua 语法检查和 NWB skin 布局回归测试通过。
