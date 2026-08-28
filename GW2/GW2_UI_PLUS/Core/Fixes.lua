-- GW2_UI_PLUS 本体修复集 (Fixes)
--
-- 这些修复原本是直接改在 GW2_UI 源码里的，现在全部改成从外部挂接，
-- 让 GW2_UI 本体保持与上游逐字节一致、可以随时覆盖升级。
--
-- 加载时机：本文件在 GW2_UI 全部文件执行完之后运行（toc 里声明了 Dependencies: GW2_UI），
-- 此时 _G.GW2_ADDON 与所有全局框体都已就绪。
-- 注意 Era 下 GW2_UI 在自己的 ADDON_LOADED 就跑完了 evPlayerLogin，
-- 所以设置窗口、任务追踪器这些在本文件执行时已经建好了，只能事后修，不能覆盖构建函数。

local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local Fixes = {}
addonTable.Fixes = Fixes

--------------------------------------------------------------------------------
-- 一、补上游 Classic 分支漏掉的 GW.SkinBagSearchBox
--------------------------------------------------------------------------------
-- 上游 Mainline/TBC/Wrath/Mists 的 inventory.lua 都导出了这个函数，唯独 Classic 漏了。
-- 消费者有两个：BetterBags 的 gw2 主题、以及 GW2_UI 自己的 whoList 皮肤（无条件调用，
-- 缺了会直接 Lua 报错）。所以必须在任何皮肤跑起来之前补上。
-- 实现照抄上游 Classic inventory.lua 里那个 local 的 reskinSearchBox（外部拿不到它本体）。

if not GW.SkinBagSearchBox then
    GW.SkinBagSearchBox = function(sb)
        if not sb then return end

        sb:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Normal)
        sb.Instructions:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Normal)
        sb.Instructions:SetTextColor(178 / 255, 178 / 255, 178 / 255)

        sb.Left:SetPoint("LEFT", 0, 0)

        sb.Left:SetTexture(nil)
        sb.Right:SetTexture(nil)
        sb.Middle:SetTexture("Interface/AddOns/GW2_UI/textures/bag/bagsearchbg.png")

        sb.Middle:SetPoint("RIGHT", sb, "RIGHT", 0, 0)

        sb.Middle:SetHeight(24)
        sb.Middle:SetTexCoord(unpack(GW.TexCoords))

        sb.searchIcon:Hide()
    end
end

--------------------------------------------------------------------------------
-- 二、隐藏暴雪原生经验、声望和宠物经验条
--------------------------------------------------------------------------------
-- GW2_UI 只有在自己的 XPBAR_ENABLED 开启时才会调用 LoadXPBar，并由此接管
-- StatusTrackingBarManager。Plus 的经验槽开关关闭时，暴雪原生状态条可能重新出现。
-- 这里独立处理原生框体，不修改 Plus 自己的经验槽设置。

local NATIVE_STATUS_BAR_NAMES = {
    "StatusTrackingBarManager",
    "MainStatusTrackingBarContainer",
    "SecondaryStatusTrackingBarContainer",
    "MainMenuExpBar",
    "ReputationWatchBar",
    "PetExperienceBar",
    "MainMenuMaxLevelBar",
    "MainMenuBarMaxLevelBar",
    "MainMenuXPBarTexture",
    "ReputationXPBarTexture",
}

local function HideNativeStatusBar(frame)
    if not frame or frame.gwPlusNativeStatusBarHidden then return end
    frame.gwPlusNativeStatusBarHidden = true

    if frame.GwKill then
        frame:GwKill()
        return
    end

    if frame.UnregisterAllEvents then
        frame:UnregisterAllEvents()
    end
    if frame.HookScript then
        frame:HookScript("OnShow", function(self)
            self:Hide()
        end)
    end
    frame:Hide()
end

local function ApplyNativeStatusBarFix()
    for _, frameName in ipairs(NATIVE_STATUS_BAR_NAMES) do
        HideNativeStatusBar(_G[frameName])
    end
end

--------------------------------------------------------------------------------
-- 三、ESC 键失灵
--------------------------------------------------------------------------------
-- 这几个窗口为了自己处理按键会把 SetPropagateKeyboardInput 关掉，关窗时没恢复，
-- 结果 ESC 从此被吞、打不开游戏菜单。统一在显示/隐藏时把传递打开。
-- 战斗中不能改这个属性，加锁保护。

local function RestoreKeyboardPropagation(frame)
    if frame and frame.SetPropagateKeyboardInput and not InCombatLockdown() then
        frame:SetPropagateKeyboardInput(true)
    end
end

local function ApplyEscFixes()
    -- 对话窗
    if GossipFrame and not GossipFrame.gwPlusEscHooked then
        GossipFrame.gwPlusEscHooked = true
        GossipFrame:HookScript("OnShow", RestoreKeyboardPropagation)
        GossipFrame:HookScript("OnHide", RestoreKeyboardPropagation)
        RestoreKeyboardPropagation(GossipFrame)
    end

    -- GW2 自己的弹窗（4 个）
    for i = 1, 4 do
        local popup = _G["GwPopupFrame" .. i]
        if popup and not popup.gwPlusEscHooked then
            popup.gwPlusEscHooked = true
            popup:HookScript("OnHide", function(self)
                RestoreKeyboardPropagation(self)
                -- 输入框留着焦点的话，下一次按键还是会被它吃掉
                if self.input then
                    self.input:ClearFocus()
                end
            end)
        end
    end

    -- 沉浸式任务窗
    if GwImmersiveQuestFrame and not GwImmersiveQuestFrame.gwPlusEscHooked then
        GwImmersiveQuestFrame.gwPlusEscHooked = true
        GwImmersiveQuestFrame:HookScript("OnHide", RestoreKeyboardPropagation)
    end
end

--------------------------------------------------------------------------------
-- 四、光环改成只有右键才能取消
--------------------------------------------------------------------------------
-- 上游把 cancelaura 挂在 type（任意键）上，左键误点就把 buff 取消了。
-- GwAuraTmpl_OnLoad 是全局函数（由 aurabar.xml 的 OnLoad 调用），可以直接 hook；
-- 本文件加载之前已经建好的光环按钮，靠 ApplyAuraRightClickFix 补跑一遍。

local function MakeAuraRightClickOnly(self)
    if not self or not self.SetAttribute or InCombatLockdown() then return end
    self:RegisterForClicks("RightButtonUp", "RightButtonDown")
    self:SetAttribute("type", nil) -- 抵消 aurabar.xml 模板里写死的 type="cancelaura"
    self:SetAttribute("type2", "cancelaura")
end

local function ApplyAuraRightClickFix()
    if not _G.GwAuraTmpl_OnLoad then return end

    if not Fixes.auraHooked then
        Fixes.auraHooked = true
        hooksecurefunc("GwAuraTmpl_OnLoad", MakeAuraRightClickOnly)
    end

    -- 补跑本文件加载之前就已经建好的光环按钮（两个 SecureAuraHeader 的子框体）
    for _, headerName in ipairs({"GW2UIPlayerBuffs", "GW2UIPlayerDebuffs"}) do
        local header = _G[headerName]
        if header then
            for _, child in ipairs({header:GetChildren()}) do
                if child.GetAttribute and child:GetAttribute("type") == "cancelaura" then
                    MakeAuraRightClickOnly(child)
                end
            end
        end
    end
end

--------------------------------------------------------------------------------
-- 五、任务追踪器里 Questie 的等级前缀重复
--------------------------------------------------------------------------------
-- GW2_UI 自己会给任务标题加 "[60] " 这样的等级前缀，Questie 也会往 quest.title 里塞
-- "[60R] " 之类的前缀，两个叠在一起变成 "[60] [60R] 任务名"。
-- 做法：等 UpdateBlock 跑完之后，剥掉 GW2 前缀后面那个多余的方括号前缀。
-- 这样连上游显示经验值的那条分支（它用的是未剥离的 quest.title）也一并修好了。

local function StripDuplicateQuestPrefix(block)
    local fs = block and block.Header
    if not fs or not fs.GetText then return end

    local text = fs:GetText()
    if not text then return end

    -- 第一个方括号是 GW2 自己加的（可能含 |T材质|t，里面不会有 ]）
    local gwPrefix, rest = text:match("^(%[[^%]]*%]%s*)(.*)$")
    if not gwPrefix then return end

    -- 紧跟其后又是一个 [数字...] 的话，那是 Questie 加的，去掉
    local stripped = rest:gsub("^%[%d+[^%]]*%]%s*", "", 1)
    if stripped ~= rest then
        fs:SetText(gwPrefix .. stripped)
    end
end

local function ApplyQuestiePrefixFix()
    if Fixes.questiePrefixHooked then return end
    if not _G.GwQuestLogBlockMixin or not _G.GwQuestLogBlockMixin.UpdateBlock then return end

    Fixes.questiePrefixHooked = true
    -- block 是通过 Mixin(newBlock, blockMixInTemplate) 拿到方法的（值拷贝），
    -- 所以必须赶在第一个 block 创建之前 hook 到 mixin 表上。
    hooksecurefunc(_G.GwQuestLogBlockMixin, "UpdateBlock", StripDuplicateQuestPrefix)
end

--------------------------------------------------------------------------------
-- 六、按需加载窗口 /reload 后整个看不见
--------------------------------------------------------------------------------
-- CreateFrameHeaderWithBody 建的窗口，开场遮罩是靠 OnShow 动画推开的。
-- 如果窗口开着的时候 /reload，OnShow 不会触发，遮罩停在收拢状态，窗口内容全被挡住。
-- 包装 GW.CreateFrameHeaderWithBody，建完之后如果窗口本来就是可见的，直接把遮罩推到位。
-- 这里的 0.05 秒延时不是在猜插件加载时机，而是等这一帧的布局算完
-- （刚建好时 frame.tex:GetWidth() 还是 0，算出来的锚点是错的）。

local origCreateFrameHeaderWithBody = GW.CreateFrameHeaderWithBody
if origCreateFrameHeaderWithBody then
    GW.CreateFrameHeaderWithBody = function(frame, ...)
        origCreateFrameHeaderWithBody(frame, ...)

        if frame and frame.backgroundMask and frame:IsVisible() then
            local bgMask = frame.backgroundMask
            C_Timer.After(0.05, function()
                if frame.tex and frame:GetAlpha() >= 1 then
                    bgMask:SetPoint("BOTTOMRIGHT", frame.tex, "BOTTOMLEFT", frame.tex:GetWidth() + 200, 0)
                end
            end)
        end
    end
end

--------------------------------------------------------------------------------
-- 七、设置面板标题被截断
--------------------------------------------------------------------------------
-- 原生 GW2_UI 仍用 header:GetStringWidth() 定宽，中文字体下可能偏窄；
-- 仅为未由 Plus 标题工具管理的原生面板补 10 像素余量。
-- Plus 自建面板由 Core/PanelTitle.lua 负责完整标题宽度与面包屑间距。
-- 上游 30 处散落在 9 个 panel_*.lua 里，外部一段遍历就能覆盖，
-- 顺带把 panel_player.lua 里 classpower 误用 fader 宽度那个上游 bug 也修了。
-- 反复执行无副作用（GetStringWidth 只跟文本有关，与当前宽度无关）。

local function FixPanelHeaderWidths(frame, depth)
    if not frame or not frame.GetChildren or depth > 4 then return end

    for _, child in ipairs({frame:GetChildren()}) do
        local header = child.header
        -- GetStringWidth 只有 FontString 有，用它把非面板的 .header 挡掉
        if child.__gwPlusTitleManaged and addonTable.SetPanelTitle then
            addonTable.SetPanelTitle(
                child, header and header:GetText(),
                child.breadcrumb and child.breadcrumb:GetText())
        elseif header and header.GetStringWidth and header.SetWidth then
            local text = header:GetText()
            if text and text ~= "" then
                header:SetWidth(header:GetStringWidth() + 10)
            end
        end
        FixPanelHeaderWidths(child, depth + 1)
    end
end

local function ApplyPanelHeaderFix()
    local settingsTab = GW.GetSettingsTabFrame and GW.GetSettingsTabFrame()
    if not settingsTab then return end

    FixPanelHeaderWidths(settingsTab, 0)

    -- 设置窗口每次打开都重算一遍：汉化模块可能在之后才改了标题文本
    if _G.GwSettingsWindow and not _G.GwSettingsWindow.gwPlusHeaderHooked then
        _G.GwSettingsWindow.gwPlusHeaderHooked = true
        _G.GwSettingsWindow:HookScript("OnShow", function()
            FixPanelHeaderWidths(settingsTab, 0)
        end)
    end
end

--------------------------------------------------------------------------------
-- 八、微型系统菜单提示缺失或在鼠标离开后残留
--------------------------------------------------------------------------------
-- Classic Era 的微型菜单按钮并非都在 OnLeave 时立即隐藏 GameTooltip。
-- 只隐藏仍由当前按钮持有的提示，避免快速移到相邻按钮时误关新提示。

local function RefreshCustomMicroButtonTooltip(self)
    if type(_G.MicroButtonTooltipText) ~= "function" then return end

    if self == _G.GwPlayerSpellsMicroButton then
        self.tooltipText = _G.MicroButtonTooltipText(
            SPELLBOOK_ABILITIES_BUTTON, "TOGGLESPELLBOOK")
    elseif self == _G.GwTalentMicroButton then
        self.tooltipText = _G.MicroButtonTooltipText(
            TALENTS, "TOGGLETALENTS")
    end
end

local function ShowNativeMicroButtonTooltip(self)
    RefreshCustomMicroButtonTooltip(self)
    if type(_G.MicroButton_OnEnter) == "function" then
        _G.MicroButton_OnEnter(self)
    end
end

local function HideOwnedMicroButtonTooltip(self)
    if GameTooltip and GameTooltip:IsOwned(self) then
        GameTooltip:Hide()
    end
end

local function HookNativeMicroButtonTooltip(button)
    if button and not button.gwPlusTooltipEnterHooked then
        button.gwPlusTooltipEnterHooked = true
        button:HookScript("OnEnter", ShowNativeMicroButtonTooltip)
    end
end

local function ApplyMicroButtonTooltipFix()
    local microbar = _G.Gw2MicroBarFrame and _G.Gw2MicroBarFrame.cf
    if not microbar then return end

    HookNativeMicroButtonTooltip(_G.GwPlayerSpellsMicroButton)
    HookNativeMicroButtonTooltip(_G.GwTalentMicroButton)

    for _, button in ipairs({microbar:GetChildren()}) do
        if button.IsObjectType and button:IsObjectType("Button")
            and not button.gwPlusTooltipLeaveHooked then
            button.gwPlusTooltipLeaveHooked = true
            button:HookScript("OnLeave", HideOwnedMicroButtonTooltip)
        end
    end
end

--------------------------------------------------------------------------------
-- 调度
--------------------------------------------------------------------------------
-- Questie 前缀那条必须最早挂（要赶在第一个任务 block 创建之前），所以放在文件加载期直接跑。
ApplyQuestiePrefixFix()
ApplyNativeStatusBarFix()

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    ApplyNativeStatusBarFix()
    ApplyEscFixes()
    ApplyAuraRightClickFix()
    ApplyPanelHeaderFix()
    ApplyMicroButtonTooltipFix()
end)
