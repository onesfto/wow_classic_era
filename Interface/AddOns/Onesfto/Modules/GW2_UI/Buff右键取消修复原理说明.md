# GW2_UI 增益（Buff）右键无法取消修复原理说明

## 1. 发现问题
在怀旧服（Classic Era）中，使用 GW2_UI 插件时，玩家通过右键点击自己身上的增益（Buff）图标无法将其取消，没有任何反应。而使用暴雪原生 UI 时，右键点击 Buff 是可以正常取消的。

## 2. 根本原因分析
通过分析 GW2_UI 的源代码（`Games/Shared/Aura/aurabar.xml` 和 `aurabar.lua`），发现问题出在“安全动作按钮模板（SecureActionButtonTemplate）”的属性配置上：
1. **安全模板限制**：为了在战斗中也能够取消 Buff，UI 插件必须使用暴雪提供的 `SecureActionButtonTemplate` 模板，并通过赋予 `cancelaura`（取消光环）类型来实现。
2. **错误的属性绑定**：GW2_UI 在 XML 配置中，将触发类型绑定为了默认动作（`<Attribute name="type" value="cancelaura"/>`）。
3. **右键点击未被正确响应**：由于按钮通过 `registerForClicks="RightButtonUp"` 注册了右键点击，当玩家右键点击时，安全模板系统会优先寻找针对右键的属性绑定（即 `type2` 或 `type-RightButton`）。由于代码中缺失了明确的右键动作绑定，导致右键点击指令被系统忽略，无法触发 `cancelaura`（取消光环）动作。

## 3. 修复方案
我们修改了光环框架的 Lua 核心初始化脚本 `Games/Shared/Aura/aurabar.lua`，在每个 Buff 按钮被创建和加载时，明确通过代码为其注册右键点击事件，并动态赋予 `type2="cancelaura"` 的安全属性。

### 动态注册与属性赋予
定位到 `GwAuraTmpl_OnLoad` 函数，增加了以下两行核心代码：
```lua
    -- 强制注册右键点击事件（兼容按键抬起和按下）
    self:RegisterForClicks("RightButtonUp", "RightButtonDown")
    -- 动态为该安全按钮的右键动作赋予“取消光环（cancelaura）”属性
    self:SetAttribute("type2", "cancelaura")
```

## 4. 修复结果
经过上述调整：
- 左键点击由于没有绑定任何安全事件，保持无反应（符合设计预期，防止误触）。
- 玩家右键点击 Buff 图标时，`SecureActionButtonTemplate` 能正确读取到 `type2` 属性，安全触发 `cancelaura` 逻辑。
- 完美恢复了原生 UI 的“右键取消 Buff”功能。
