-- GW2_UI_PLUS 皮肤内核 (Skin Engine)
-- 职责：
--   1. 提供统一的皮肤注册与调度引擎（对标 AddOnSkins 的 RegisterSkin/CallSkin）。
--   2. 提供一套复用的美化辅助函数，全部封装 GW2_UI 官方 API。
-- 每个具体皮肤文件只需 Skin.Register("插件名", function() ... end)，内部调用 Skin.* 辅助函数。

local _, addonTable = ...

local Skin = {}
addonTable.Skin = Skin
_G.GW2Plus_Skin = Skin -- 方便调试与其它文件访问

-- GW2_UI 主体依赖（core/init.lua 中：GW2_ADDON = GW）
local GW = _G.GW2_ADDON

Skin.registry = {}   -- 插件名 -> { func = function, done = boolean }
Skin.debug = false   -- 置 true 可打印每个皮肤的加载信息

local IsLoaded = (_G.C_AddOns and _G.C_AddOns.IsAddOnLoaded) or _G.IsAddOnLoaded

--------------------------------------------------------------------------------
-- 一、共享美化辅助函数
--------------------------------------------------------------------------------

-- 字体规格：正文用基础字，标题用伤害字
local FONT = {
    Header = { DAMAGE_TEXT_FONT, "Header" },
    Normal = { UNIT_NAME_FONT, "Normal" },
    Small  = { UNIT_NAME_FONT, "Small" },
}

-- 剥离暴雪材质并套用 GW2 标准背景
function Skin.SkinFrame(frame, template)
    if not frame then return end
    if frame.GwStripTextures then
        frame:GwStripTextures()
    elseif frame.StripTextures then
        frame:StripTextures()
    end
    if frame.GwCreateBackdrop then
        frame:GwCreateBackdrop(template or (GW and GW.BackdropTemplates and GW.BackdropTemplates.Default))
    end
end

-- 提示浮窗：背景 + 字体（带幂等守卫，避免标记刷新时反复处理）
function Skin.SkinTooltip(frame)
    if not frame or frame.__gwSkinned then return end
    frame.__gwSkinned = true
    Skin.SkinFrame(frame)
    if frame.fs then Skin.SkinFont(frame.fs, "Normal") end
end

-- 普通按钮
function Skin.SkinButton(button)
    if not button or not button.GwSkinButton then return end
    button:GwSkinButton(false, true)
end

-- 关闭按钮 (X)
function Skin.SkinClose(button)
    if not button or not button.GwSkinButton then return end
    button:GwSkinButton(true, false)
end

-- 字体：kind = "Header" | "Normal" | "Small"
-- style 不传时跟随 GW2 的字体设置（默认无 outline，等同原生面板，更耐看）；
-- 需要描边（如世界地图上的文字）时显式传 "OUTLINE"。
function Skin.SkinFont(fs, kind, style)
    if not fs or not fs.GwSetFontTemplate or not GW then return end
    local def = FONT[kind or "Normal"] or FONT.Normal
    fs:GwSetFontTemplate(def[1], GW.Enum.TextSizeType[def[2]], style)
    fs:SetShadowColor(0, 0, 0, 0)
end

-- 复选框
function Skin.SkinCheckBox(check)
    if not check or not check.GwSkinCheckButton then return end
    check:GwSkinCheckButton(false)
end

-- 滚动条
function Skin.SkinScrollBar(bar)
    if not bar or not bar.GwSkinScrollBar then return end
    bar:GwSkinScrollBar()
end

-- 下拉框：兼容经典 UIDropDownMenuTemplate 与新版下拉框
function Skin.SkinDropDown(dropdown, width)
    if not dropdown or dropdown.__gwSkinnedDropDown then return end
    dropdown.__gwSkinnedDropDown = true

    local name = dropdown.GetName and dropdown:GetName()
    if dropdown.GwSkinDropDownMenu and (dropdown.Button or name) then
        dropdown:GwSkinDropDownMenu()
    elseif dropdown.GwHandleDropDownBox then
        dropdown:GwHandleDropDownBox()
    end

    if width and dropdown.SetWidth then dropdown:SetWidth(width) end
end

-- 输入框：剥离原生材质，套用 GW2 小边框背景与正文字体
function Skin.SkinEditBox(editBox)
    if not editBox or editBox.__gwSkinnedEditBox then return end
    editBox.__gwSkinnedEditBox = true

    if editBox.GwStripTextures then editBox:GwStripTextures() end
    if editBox.GwCreateBackdrop then
        local template = GW and GW.BackdropTemplates
            and GW.BackdropTemplates.DefaultWithSmallBorder
        editBox:GwCreateBackdrop(template)
    end
    Skin.SkinFont(editBox, "Normal")
end

-- 滑动条
function Skin.SkinSlider(slider)
    if not slider or not slider.GwSkinSliderFrame then return end
    slider:GwSkinSliderFrame()
end

-- GW2 风格独立标题栏：复用原生 GwFrameHeader（深色渐变条 + 羽毛图标 + 标题），
-- 作为一条独立标题条置于窗口顶部之上，接管标题文字、关闭按钮与拖动。
-- 参数：frame 需有 :GetName()；dragFrameName 为插件原生拖拽 frame 全局名（可为 nil）；
--       icon 可选，覆盖左侧图标贴图。
function Skin.AddTitleBar(frame, dragFrameName, icon)
    if not frame or frame.gwHeader or not frame:GetName() or not GW then return end

    local header = CreateFrame("Frame", frame:GetName() .. "Header", frame, "GwFrameHeader")
    if header.windowIcon then
        header.windowIcon:SetTexture(icon or "Interface/AddOns/GW2_UI/textures/character/worldmap-window-icon.png")
    end
    -- 作为独立标题条置于窗口顶部之上，并向下坐 5px 贴住窗口，消除条与正文之间的空隙
    -- （仅压住正文顶部的空白行，不遮挡实际内容）
    -- 左右各内缩 1px，与被背景边框内缩的内容区严丝合缝对齐
    header:ClearAllPoints()
    header:SetPoint("BOTTOMLEFT", frame, "TOPLEFT", 1, -5)
    header:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", -1, -5)

    -- 让深色渐变条随窗口宽度延展（复刻原生 UpdateFrameHeaderBodyLayout）
    local function LayoutHeaderBG()
        if header.BGLEFT then
            header.BGLEFT:SetWidth(math.max(0, math.min(512, frame:GetWidth() - 20)))
        end
    end
    LayoutHeaderBG()
    frame:HookScript("OnSizeChanged", LayoutHeaderBG)

    frame.gwHeader = header

    local dragFrame = dragFrameName and _G[dragFrameName]
    local titleFS = frame.fs or (dragFrame and dragFrame.fs)

    if titleFS then
        titleFS:ClearAllPoints()
        titleFS:SetParent(header)
        -- 标题坐落在渐变条上（对齐原生 BOTTOMLEFT +64,+10 / BigHeader）
        titleFS:SetPoint("BOTTOMLEFT", header, "BOTTOMLEFT", 64, 10)
        titleFS:GwSetFontTemplate(DAMAGE_TEXT_FONT, GW.Enum.TextSizeType.BigHeader, nil, 2)
        titleFS:SetShadowColor(0, 0, 0, 0)
        titleFS:SetShadowOffset(0, 0)
        titleFS:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
        titleFS.isSkinnedTitle = true

        -- 剥离第三方硬编码颜色标签，统一为 GW2 偏黄标题色
        local isSettingText = false
        hooksecurefunc(titleFS, "SetText", function(self, text)
            if isSettingText or not text then return end
            isSettingText = true
            local cleanText = string.gsub(text, "|c%x%x%x%x%x%x%x%x", "")
            cleanText = string.gsub(cleanText, "|r", "")
            self:SetText(cleanText)
            self:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
            self:SetShadowColor(0, 0, 0, 0)
            isSettingText = false
        end)
        titleFS:SetText(titleFS:GetText() or "")
    end

    -- 确保标题栏渲染在黑框及边框之上
    if frame.backdrop then
        header:SetFrameLevel(frame.backdrop:GetFrameLevel() + 5)
    else
        header:SetFrameLevel(frame:GetFrameLevel() + 5)
    end

    -- 标题栏本身作为拖动手柄（点击标题栏即可拖动窗口）
    frame:SetMovable(true)
    header:EnableMouse(true)
    header:RegisterForDrag("LeftButton")
    header:SetScript("OnDragStart", function() frame:StartMoving() end)
    header:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)

    -- 关闭按钮置于标题栏之上，保证可点击
    local closeBtn = _G[frame:GetName() .. "Close"] or frame.CloseButton
    if closeBtn then
        closeBtn:ClearAllPoints()
        closeBtn:SetParent(header)
        closeBtn:SetSize(25, 25)
        -- 落在渐变条右端，与标题同一行高
        closeBtn:SetPoint("BOTTOMRIGHT", header, "BOTTOMRIGHT", -8, 8)
        closeBtn:SetFrameLevel(header:GetFrameLevel() + 5)
        closeBtn:EnableMouse(true)
    end

    -- 关闭插件原生的「按住拖动」拖动条：去掉提示、不再遮挡标题栏与关闭按钮
    if dragFrame then
        dragFrame:EnableMouse(false)
        dragFrame:SetScript("OnEnter", nil)
        dragFrame:SetScript("OnLeave", nil)
        if dragFrame.tooltip then dragFrame.tooltip:Hide() end
        dragFrame:Hide()
    end
end

--------------------------------------------------------------------------------
-- 二、注册与调度引擎
--------------------------------------------------------------------------------

function Skin.Register(addonName, func)
    if type(addonName) ~= "string" or type(func) ~= "function" then return end
    Skin.registry[addonName] = { func = func, done = false }
end

local function RunSkin(addonName)
    local entry = Skin.registry[addonName]
    if not entry or entry.done then return end
    if not GW then return end -- GW2_UI 尚未就绪，交由后续事件重试
    entry.done = true
    local ok, err = pcall(entry.func)
    if not ok then
        geterrorhandler()(("GW2_UI_PLUS Skin [%s]: %s"):format(addonName, tostring(err)))
    elseif Skin.debug then
        print(("|cffFFaa00[GW2 UI Plus]|r %s 皮肤已加载"):format(addonName))
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" then
        -- 目标插件在本内核之后加载：命中即美化（含 LoD 后续加载）
        if Skin.registry[arg1] then RunSkin(arg1) end
    else
        -- 目标插件在本内核之前已加载：进入世界时补跑一次
        GW = GW or _G.GW2_ADDON
        for name in pairs(Skin.registry) do
            if IsLoaded(name) then RunSkin(name) end
        end
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    end
end)
