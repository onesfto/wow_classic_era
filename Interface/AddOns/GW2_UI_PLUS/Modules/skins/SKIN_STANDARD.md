# GW2_UI_PLUS 皮肤开发规范 (Skin Standard)

这份文档定义了在 `GW2_UI_PLUS` 中为第三方插件编写美化代码（Skin）的统一视觉标准与核心底层规范。开发新的皮肤文件时，请严格遵守本标准。

---

## 核心设计哲学 (Core Philosophy)

1. **绝对事件驱动 (Event-Driven)**：严禁使用 `C_Timer.After` 等延时器猜测加载时间。必须通过注册 `ADDON_LOADED` 监听器，或在插件确信加载完毕后执行。
2. **底层劫持 (hooksecurefunc)**：第三方插件在游戏运行时动态生成的 UI 元素（如下拉菜单、动态增减的按钮、标记），严禁使用循环轮询抓取。必须使用 `hooksecurefunc` 劫持第三方插件的内部生成函数。
3. **消除暴雪痕迹**：剥离所有的暴雪原生红框、弧形边角、默认阴影字体，替换为纯色扁平化区块和像素边框。

---

## 一、 视觉与组件标准 (Visual & Component Standards)

所有的皮肤代码都必须复用 `GW2_UI` 的官方 API，禁止自行画框贴图。
*(注意：在外部环境中调用 GW2 API，必须通过全局变量 `_G.GW2_ADDON` 获取依赖。)*

### 1. 面板背景 (Backdrops & Frames)
剥离原生材质后，给主面板或弹出窗口套用标准 GW2 羊皮纸背景或扁平边框。
```lua
-- 先剥离暴雪材质
if frame.GwStripTextures then frame:GwStripTextures() else frame:StripTextures() end

-- 赋予 GW2 标准背景
local template = _G.GW2_ADDON and _G.GW2_ADDON.BackdropTemplates and _G.GW2_ADDON.BackdropTemplates.Default
if frame.GwCreateBackdrop then
    frame:GwCreateBackdrop(template)
end
```

### 2. 按钮 (Buttons)
所有的普通按钮必须重置为 GW2 的扁平化深色按钮。
```lua
-- 普通按钮 (参数：isCloseButton=false, setTextColor=true)
if button.GwSkinButton then
    button:GwSkinButton(false, true)
end

-- 关闭按钮 (X 按钮) (参数：isCloseButton=true, setTextColor=false)
if closeButton.GwSkinButton then
    closeButton:GwSkinButton(true, false)
end
```

### 3. 字体 (Fonts)
禁止保留第三方插件调用的原生暴雪字体（特别是带厚重黑色阴影的字体），必须全局洗为 GW2 指定字体。
`GW2_UI` 提供了 `GwSetFontTemplate(font, sizeType, style)`。
- **标题 (Title/Headers)**：使用伤害字体 `DAMAGE_TEXT_FONT`，字号为 `_G.GW2_ADDON.Enum.TextSizeType.Header`。
- **正文内容 (Body)**：使用基础字体 `UNIT_NAME_FONT`，字号为 `_G.GW2_ADDON.Enum.TextSizeType.Normal` 或 `Small`。
- **文字样式**：去除阴影，一律使用 `"OUTLINE"` (轻微轮廓线) 提升质感。

```lua
-- 示例：修改 FontString 为标题格式
if fontString.GwSetFontTemplate then
    fontString:GwSetFontTemplate(DAMAGE_TEXT_FONT, _G.GW2_ADDON.Enum.TextSizeType.Header, "OUTLINE")
end
```

### 4. 复选框与下拉菜单 (Checkboxes & Dropdowns)
第三方插件的原生复选框和下拉菜单往往极其突兀，必须进行替换。
```lua
-- 复选框 (参数: isRadio=false)
if checkbox.GwSkinCheckButton then
    checkbox:GwSkinCheckButton(false)
end

-- 下拉菜单 (Dropdown)
if dropdown.GwHandleDropDownBox then
    dropdown:GwHandleDropDownBox(_G.GW2_ADDON.BackdropTemplates.DopwDown)
end
```

---

## 二、 布局与留白规范 (Layout & Spacing Guidelines)

**“不要让元素挤在一起”** 是现代 UI 的核心原则。许多老派单体插件（如 NovaWorldBuffs）为了省空间，会将按钮无缝贴合。这在扁平化设计中是大忌。

1. **控件间距 (Padding/Margin)**：按钮与按钮之间、文本与边框之间，必须保持至少 **5px 到 8px** 的间距（呼吸感）。
2. **强制重排 (Re-anchoring)**：遇到原生布局拥挤的情况，皮肤开发者**有责任**重写这些元素的坐标。
```lua
-- 错误做法：仅改变颜色，不管拥挤的坐标
button:GwSkinButton(false, true)

-- 正确做法：重置坐标并赋予合理间距
button:GwSkinButton(false, true)
button:ClearAllPoints()
-- 与上一个按钮拉开 5px 垂直间距
button:SetPoint("TOP", previousButton, "BOTTOM", 0, -5) 
```

---

## 三、 标准代码骨架模板 (Boilerplate Template)

新编写任何一款插件的 Skin 时，请复制并遵守以下模板架构：

```lua
local _, addonTable = ...

local function SkinMyAddon()
    -- 1. 获取目标插件实例（如通过 Ace3）
    local TargetAddon = LibStub("AceAddon-3.0"):GetAddon("TargetAddonName", true)
    if not TargetAddon then return end

    -- 2. 静态元素美化 (UI 创建时就存在的元素)
    -- ... 调用 GwCreateBackdrop / GwSkinButton ...

    -- 3. 动态元素美化 (劫持内部函数)
    if TargetAddon.CreateSomeDynamicButton then
        hooksecurefunc(TargetAddon, "CreateSomeDynamicButton", function(self)
            -- 当目标生成元素时，立刻美化
            -- _G["DynamicButton"].GwSkinButton(...)
        end)
    end
end

-- 4. 注册加载引擎
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self, event, addon)
    if event == "ADDON_LOADED" and addon == "TargetAddonName" then
        SkinMyAddon()
        self:UnregisterEvent("ADDON_LOADED")
    elseif event == "PLAYER_ENTERING_WORLD" then
        if _G.IsAddOnLoaded("TargetAddonName") then
            SkinMyAddon()
        end
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    end
end)
```
