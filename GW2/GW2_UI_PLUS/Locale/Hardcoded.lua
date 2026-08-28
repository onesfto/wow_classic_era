-- GW2_UI_PLUS 原生漏译与硬编码文本汉化 (Hardcoded)
--
-- GW2_UI 有些中文词条缺失，另有英文直接写死在代码/XML 里。
--
--   1. 小队框体的排列方向与框体间距（zhCN 语言包缺少对应词条）
--   2. 角色高级属性提示框的 Miss-Chance / 各系暴击缩写（advanced_stats.lua 内联拼字符串）
--   3. 天赋面板的 "Talent Preview"（talents.xml 的 FontString text 属性）
--   4. 设置菜单里的「目标」（panel_objectives.lua 用了暴雪常量 OBJECTIVES_TRACKER_LABEL，
--      在这个语境下容易和「当前选中目标」混淆）

local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local L = GW.L

--------------------------------------------------------------------------------
-- 一、原生简体中文语言包漏译
--------------------------------------------------------------------------------

local PARTY_SETTINGS_TEXT = {
    RAID_STYLE_PARTY_AND_FRAMES = {
        sourceName = "Show both party frames and party grid",
        name = "团队中也显示小队",
        sourceDesc =
            "If enabled, this will show both the stylised party frames as well as the grid frame. This setting has no effect if '%s' is enabled.",
        desc =
            "启用后，在团队中显示玩家所在小队的小队框体。无需启用团队框架；若启用“使用团队样式的小队框架”，此选项不会生效。",
    },
    PARTY_FRAME_ORIENTATION = {
        sourceName = "Orientation",
        name = "排列方向",
        sourceDesc =
            "Choose whether party frames are arranged vertically or horizontally.",
        desc = "选择小队框体按垂直或水平方向排列。",
    },
    PARTY_FRAME_SPACING = {
        sourceName = "Frame Spacing",
        name = "框体间距",
    },
}

for _, text in pairs(PARTY_SETTINGS_TEXT) do
    L[text.sourceName] = text.name
    if text.sourceDesc then
        L[text.sourceDesc] = text.desc
    end
end

-- 原生设置页在 PLUS 加载前已经把 L 表结果复制进 option，
-- 所以除了补 L 表，还必须刷新现有 option 和已经创建的 widget。
local function TranslatePartySettings()
    local settingsTab = GW.GetSettingsTabFrame and GW.GetSettingsTabFrame()
    local scrollBox = settingsTab and settingsTab.menu
        and settingsTab.menu.ScrollBox
    local dataProvider = scrollBox and scrollBox:GetDataProvider()
    if not dataProvider or not dataProvider.ForEach then return end

    local partyPanel
    dataProvider:ForEach(function(elementData)
        local frame = elementData and elementData.isSubCat
            and elementData.itemData and elementData.itemData.frame
        if frame and frame.panelId == "party_general" then
            partyPanel = frame
            return true
        end
    end)
    if not partyPanel then return end

    for _, option in ipairs(partyPanel.gwOptions or {}) do
        local text = PARTY_SETTINGS_TEXT[option.optionName]
        if text then
            option.name = text.name
            option.desc = text.desc or ""

            local widget = option.__widget
            if widget then
                widget.name = option.name
                widget.displayName = option.name
                widget.desc = option.desc
                if widget.title then widget.title:SetText(option.name) end

                local entry = widget.__gwRegEntry
                if entry then
                    entry.title = option.name
                    entry.titleNorm = option.name:lower()
                    entry.desc = option.desc
                    entry.descNorm = option.desc:lower()
                end
            end
        end
    end
end

--------------------------------------------------------------------------------
-- 二、单位框体设置的漏译
--------------------------------------------------------------------------------

L["Own aura size"] = "自身光环大小"

local UNITFRAME_AURA_TEXT = {
    targetAuraBigSize = "自身光环大小",
    focusAuraBigSize = "自身光环大小",
}

local function TranslateUnitFrameAuraSettings()
    local settingsTab = GW.GetSettingsTabFrame and GW.GetSettingsTabFrame()
    local scrollBox = settingsTab and settingsTab.menu
        and settingsTab.menu.ScrollBox
    local dataProvider = scrollBox and scrollBox:GetDataProvider()
    if not dataProvider or not dataProvider.ForEach then return end

    dataProvider:ForEach(function(elementData)
        local frame = elementData and elementData.isSubCat
            and elementData.itemData and elementData.itemData.frame
        if not frame or (frame.panelId ~= "target_general"
            and frame.panelId ~= "focus_general") then
            return
        end

        for _, option in ipairs(frame.gwOptions or {}) do
            local name = UNITFRAME_AURA_TEXT[option.optionName]
            if name then
                option.name = name
                local widget = option.__widget
                if widget then
                    widget.name = name
                    widget.displayName = name
                    if widget.title then widget.title:SetText(name) end

                    local entry = widget.__gwRegEntry
                    if entry then
                        entry.title = name
                        entry.titleNorm = name:lower()
                    end
                end
            end
        end
    end)
end

--------------------------------------------------------------------------------
-- 三、高级属性提示框
--------------------------------------------------------------------------------
-- 提示框是 local 函数拼出来的，拿不到。用首行标题标记这一次构建，
-- 在每条 AddDoubleLine 完成后立刻重写刚加入的左栏文本。

local MISS_CHANCE_BOSS = "未命中率（等级 +3）："
local MISS_CHANCE = "未命中率："
local CRIT_TEXT = "暴击"

-- 这条不走 L 表：GW2_UI 源码里根本没有这个 key，
-- 往 AceLocale 表里塞一个它永远不会读的键没意义，直接写在这儿。
local OBJECTIVES_MENU_NAME = "任务目标"

local function TranslateAdvancedStatsText(text)
    if not text then return text end

    local translated = text
    -- 带括号的那条要先换，否则会被短的那条先吃掉前缀
    translated = translated:gsub(
        "Miss%-Chance %(Level %+ 3%):", MISS_CHANCE_BOSS)
    translated = translated:gsub("Miss%-Chance:", MISS_CHANCE)
    if CRIT_ABBR and CRIT_ABBR ~= "" and CRIT_ABBR ~= CRIT_TEXT then
        local crit = CRIT_ABBR:gsub("(%W)", "%%%1")
        translated = translated:gsub(crit .. ":", CRIT_TEXT .. "：")
    end
    return translated
end

local function TranslateAdvancedStatsLastLine(self)
    if self ~= GameTooltip or not self.gwPlusAdvancedStats then return end

    local line = _G["GameTooltipTextLeft" .. self:NumLines()]
    local text = line and line:GetText()
    local translated = TranslateAdvancedStatsText(text)
    if line and translated ~= text then
        line:SetText(translated)
    end
end

--------------------------------------------------------------------------------
-- 四、天赋面板的「天赋预览」
--------------------------------------------------------------------------------
-- 文本写在 talents.xml 的 FontString text 属性里，框体建好后直接改就行。
-- Era 下 GW2_UI 在自己的 ADDON_LOADED 就建好了角色窗口，所以这里一定拿得到。

local function TranslateTalentPreview()
    local talentFrame = _G.GwTalentFrame
    local title = talentFrame and talentFrame.bottomBar
        and talentFrame.bottomBar.talentPreview
        and talentFrame.bottomBar.talentPreview.title
    if title then
        title:SetText(L["Talent Preview"])
    end
end

--------------------------------------------------------------------------------
-- 五、设置菜单里的「目标」
--------------------------------------------------------------------------------
-- 菜单项文本来自 AddSettingsPanel 存进去的 itemData.name。
-- itemData 是共享表，改它比改按钮上的 FontString 管用——重新渲染也不会被刷回去。

local function TranslateObjectivesMenuEntry()
    local settingsTab = GW.GetSettingsTabFrame and GW.GetSettingsTabFrame()
    local scrollBox = settingsTab and settingsTab.menu and settingsTab.menu.ScrollBox
    if not scrollBox or not scrollBox.GetDataProvider then return end

    local dataProvider = scrollBox:GetDataProvider()
    if not dataProvider or not dataProvider.ForEach then return end

    local renamed = false
    dataProvider:ForEach(function(elementData)
        local itemData = elementData and elementData.itemData
        local panelId = itemData and itemData.frame and itemData.frame.panelId
        if panelId == "objectives_general" then
            itemData.name = OBJECTIVES_MENU_NAME
            renamed = true
        end
    end)

    if renamed and scrollBox.ForEachFrame then
        scrollBox:ForEachFrame(function(button)
            if button.text and button.itemData then
                button.text:SetText(button.itemData.name)
            end
        end)
    end
end

--------------------------------------------------------------------------------
-- 六、HUD 编辑界面的硬编码英文
--------------------------------------------------------------------------------

local HUD_TEXT = {
    ["Layouts"] = "布局",
    ["Hide placeholders"] = "隐藏占位符",
    ["Show placeholders"] = "显示占位符",
    ["Show grid"] = "显示网格",
    ["Hide grid"] = "隐藏网格",
    ["Lock HUD"] = "锁定界面",
}

local function TranslateButtonText(button)
    if not button or not button.GetText or not button.SetText then return end
    local translated = HUD_TEXT[button:GetText()]
    if translated then button:SetText(translated) end
end

local function TranslateMoveHud()
    local frame = GW.MoveHudScaleableFrame
    if not frame then return end

    if frame.layoutToggle and frame.layoutToggle.label then
        frame.layoutToggle.label:SetText(HUD_TEXT.Layouts)
    end
    if frame.headerString then
        local text = frame.headerString:GetText()
        if text then frame.headerString:SetText(text:gsub("Layouts", HUD_TEXT.Layouts)) end
    end
    if frame.layoutView and frame.layoutView.savedLayoutDropDown
        and frame.layoutView.savedLayoutDropDown.title then
        frame.layoutView.savedLayoutDropDown.title:SetText(HUD_TEXT.Layouts)
    end

    local settings = frame.moverSettingsFrame
    local buttons = settings and settings.defaultButtons
    if buttons then
        TranslateButtonText(buttons.lockHud)
        TranslateButtonText(buttons.hidePlaceholder)
        TranslateButtonText(buttons.showGrid)
    end

    if frame.gwPlusTranslationHooked then return end
    frame.gwPlusTranslationHooked = true
    frame:HookScript("OnShow", TranslateMoveHud)
    for _, button in ipairs({
        frame.layoutToggle,
        buttons and buttons.hidePlaceholder,
        buttons and buttons.showGrid,
    }) do
        if button then button:HookScript("OnClick", TranslateMoveHud) end
    end
end

--------------------------------------------------------------------------------
-- 调度
--------------------------------------------------------------------------------

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")

    hooksecurefunc(GameTooltip, "ClearLines", function(tooltip)
        if tooltip == GameTooltip then
            tooltip.gwPlusAdvancedStats = false
        end
    end)
    hooksecurefunc(GameTooltip, "SetText", function(tooltip, text)
        if tooltip == GameTooltip then
            tooltip.gwPlusAdvancedStats =
                text == (ADVANCED_LABEL .. " " .. STAT_CATEGORY_ATTRIBUTES)
        end
    end)
    hooksecurefunc(
        GameTooltip, "AddDoubleLine", TranslateAdvancedStatsLastLine)
    TranslatePartySettings()
    TranslateUnitFrameAuraSettings()
    TranslateTalentPreview()
    TranslateObjectivesMenuEntry()
    C_Timer.After(0, TranslateMoveHud)
end)

addonTable.TranslatePartySettings = TranslatePartySettings
addonTable.TranslateObjectivesMenuEntry = TranslateObjectivesMenuEntry
addonTable.TranslateMoveHud = TranslateMoveHud
