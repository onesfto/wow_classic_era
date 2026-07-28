-- GW2_UI_PLUS 硬编码文本汉化 (Hardcoded)
--
-- GW2_UI 有三处英文没走 L 表，是直接写死在代码/XML 里的，补词条救不了。
-- 以前靠 一键汉化GW2.py 改源码，现在改成运行时覆盖。
--
--   1. 角色高级属性提示框的 Miss-Chance / 各系暴击缩写（advanced_stats.lua 内联拼字符串）
--   2. 天赋面板的 "Talent Preview"（talents.xml 的 FontString text 属性）
--   3. 设置菜单里的「目标」（panel_objectives.lua 用了暴雪常量 OBJECTIVES_TRACKER_LABEL，
--      在这个语境下容易和「当前选中目标」混淆）

local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW then return end

local L = GW.L

--------------------------------------------------------------------------------
-- 一、高级属性提示框
--------------------------------------------------------------------------------
-- 提示框是 local 函数拼出来的，拿不到。改成等它显示出来之后重写文本行。
-- 用首行标题做闸门，保证只碰这一个提示框，不影响游戏里其它所有 tooltip。

local MISS_CHANCE_BOSS = L["Miss-Chance (Level + 3):"]
local MISS_CHANCE = L["Miss-Chance:"]
local CRIT_TEXT = L["Crit"]

-- 这条不走 L 表：GW2_UI 源码里根本没有这个 key，
-- 往 AceLocale 表里塞一个它永远不会读的键没意义，直接写在这儿。
local OBJECTIVES_MENU_NAME = "任务目标"

local function TranslateAdvancedStatsTooltip()
    if not GameTooltip.gwPlusTranslating then
        local title = _G.GameTooltipTextLeft1 and _G.GameTooltipTextLeft1:GetText()
        if title ~= (ADVANCED_LABEL .. " " .. STAT_CATEGORY_ATTRIBUTES) then return end

        local changed = false
        for i = 1, GameTooltip:NumLines() do
            local fs = _G["GameTooltipTextLeft" .. i]
            local text = fs and fs:GetText()
            if text then
                local new = text
                -- 带括号的那条要先换，否则会被短的那条先吃掉前缀
                new = new:gsub("Miss%-Chance %(Level %+ 3%):", MISS_CHANCE_BOSS)
                new = new:gsub("Miss%-Chance:", MISS_CHANCE)
                -- CRIT_ABBR 是暴雪常量，不同客户端语言不一样，只在跟我们要的不一致时才换
                if CRIT_ABBR and CRIT_ABBR ~= "" and CRIT_ABBR ~= CRIT_TEXT then
                    new = new:gsub(CRIT_ABBR:gsub("(%W)", "%%%1"), CRIT_TEXT)
                end
                if new ~= text then
                    fs:SetText(new)
                    changed = true
                end
            end
        end

        -- 文本变了要重新排一次版，否则提示框还是按英文宽度撑着
        if changed then
            GameTooltip.gwPlusTranslating = true
            GameTooltip:Show()
            GameTooltip.gwPlusTranslating = false
        end
    end
end

--------------------------------------------------------------------------------
-- 二、天赋面板的「天赋预览」
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
-- 三、设置菜单里的「目标」
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
-- 四、HUD 编辑界面的硬编码英文
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

    GameTooltip:HookScript("OnShow", TranslateAdvancedStatsTooltip)
    TranslateTalentPreview()
    TranslateObjectivesMenuEntry()
    C_Timer.After(0, TranslateMoveHud)
end)

addonTable.TranslateObjectivesMenuEntry = TranslateObjectivesMenuEntry
addonTable.TranslateMoveHud = TranslateMoveHud
