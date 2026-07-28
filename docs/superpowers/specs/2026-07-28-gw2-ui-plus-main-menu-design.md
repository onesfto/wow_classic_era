# GW2_UI_PLUS 主菜单框体设计

## 目标

在 GW2_UI 设置窗口中新增一个与现有 Action Bar 顶级框体一致的“主菜单”标签，集中提供“玩家、目标、宠物、小队”四个设置入口。

## 界面

- 顶级标签名称为“主菜单”。
- “主菜单”标签使用：
  `Interface/AddOns/GW2_UI/textures/uistuff/tabicon_profiles.png`。
- 现有 Action Bar 标签改用：
  `Interface/AddOns/GW2_UI/textures/character/tabicon-glyph.png`。
- GW2_UI 原“设置/配置”标签改用：
  `Interface/AddOns/GW2_UI/textures/Auction/tabicon_sell.png`。
- 左侧菜单依次为：
  1. 玩家
  2. 目标
  3. 宠物
  4. 小队
- 左侧按钮的尺寸、间距、悬停纹理和选中高亮与 Action Bar 顶级框体保持一致。
- 打开标签时默认选择“玩家”。

## 页面来源

不复制 GW2_UI 的设置项，也不另建第二套配置存取逻辑。四个菜单直接复用设置窗口初始化时已经创建的原生页面：

- 玩家：`player_general`
- 目标：`target_general`
- 宠物：`player_pet`
- 小队：`party_general`

所有 getter、setter、依赖关系、回调和重载提示继续由 GW2_UI 原生实现负责。

## 集成方式

- 新增 `MainMenu/MainMenu.lua`，只负责主菜单标签、左侧菜单与原生页面迁移。
- 新增 `MainMenu/SettingsIcon.lua`，只负责在 GW2_UI_PLUS 侧把原“设置/配置”标签按钮的图标替换为 `tabicon_sell.png`。
- Action Bar 标签图标在 `ActionBar/Options.lua` 中替换为 `tabicon-glyph.png`。
- 模块暴露构建函数，由 `core.lua` 在 Action Bar 顶级标签之后注册。
- 通过设置菜单现有数据源定位上述四个 `panelId`，取得并复用页面框体。
- 进入“主菜单”时，把当前页面临时迁移到新标签并按内容区重新锚定；切换左侧菜单时先恢复上一页，再迁移下一页。
- 离开“主菜单”标签时，将已迁移页面恢复到原父级、原锚点和原显示状态，保证原设置入口仍可正常打开。
- 本次保留原设置菜单中的“玩家”和“单位框体”入口，方便对照检查；不修改或隐藏原入口。
- 若目标页面未找到，则不创建不完整的主菜单标签，并输出一次明确的调试提示，避免出现空白页。

## 状态与兼容性

- 不新增 SavedVariables。
- 不改变任何单位框体配置值或默认值。
- 不修改 GW2_UI 本体目录中的任何文件；图标替换通过 GW2_UI_PLUS 的运行时逻辑完成。
- 页面仍由 GW2_UI 的设置控件注册表管理，原设置搜索、依赖开关和回调行为保持不变。
- Classic Era 没有焦点框体入口；本次范围固定为用户指定的四项。

## 验收标准

1. GW2_UI 设置窗口右侧标签栏出现“主菜单”，使用 `tabicon_profiles.png`。
2. 点击后左侧显示“玩家、目标、宠物、小队”四项，默认选中“玩家”。
3. 四个菜单均能显示对应的原生设置控件，修改设置与原入口效果一致。
4. 切换菜单时只有当前页面可见，选中高亮正确。
5. 离开“主菜单”后，原“玩家”和“单位框体”入口仍然存在且可用，页面父级与布局均已恢复。
6. Action Bar 标签使用 `tabicon-glyph.png`。
7. 原“设置/配置”标签使用 `tabicon_sell.png`，替换逻辑只存在于 `MainMenu/SettingsIcon.lua`。
8. GW2_UI 原生文件没有改动，其他设置标签不受影响。
