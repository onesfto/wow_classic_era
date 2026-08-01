local _, addonTable = ...
-- 注意：不在顶层检查 GW2_ADDON，因为此时它可能还未初始化

local function BuildPanel(parent)
    -- 延迟检查，确保在调用时才验证依赖
    local GW = _G.GW2_ADDON
    if not GW or not GW.GetSettingsTabFrame then return end
    local CooldownPulse = addonTable.CooldownPulse
    if not CooldownPulse then return end

    CooldownPulse.InitDB()
    local panel = CreateFrame("Frame", nil, parent, "GwSettingsPanelTmpl")
    panel.panelId = "gw2_ui_plus_cooldownpulse"
    if panel.header then
        panel.header:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 20)
        if GW.Colors and GW.Colors.TextColors then
            panel.header:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
        end
        panel.header:SetText("附加组件")
        panel.header:SetWidth(panel.header:GetStringWidth() + 10)
    end
    if panel.breadcrumb then
        panel.breadcrumb:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
        if GW.Colors and GW.Colors.TextColors then
            panel.breadcrumb:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
        end
        panel.breadcrumb:SetText("冷却闪烁")
    end
    if panel.sub then
        panel.sub:SetFont(UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
        panel.sub:SetTextColor(181 / 255, 160 / 255, 128 / 255)
        panel.sub:SetText("技能冷却完成时在屏幕中央闪烁提示")
    end
    local db = GW2_UI_PLUS_CooldownPulseSV
    local optEnable = panel:AddOption("启用冷却闪烁", "开启技能冷却完成提示。切换后需要重载界面。", {
        getter = function() return db.enable end,
        setter = function(value) db.enable = value end,
        getDefault = function() return true end,
        callback = function() GW.ShowRlPopup = true end,
        isMasterToggle = true,
    })
    if optEnable then optEnable.optionName = "GW2PlusCooldownPulse_Enable" end
    local dep = {["GW2PlusCooldownPulse_Enable"] = true}
    panel:AddGroupHeader("布局与测试")
    panel:AddOptionButton("解锁 / 测试", "在屏幕上显示测试图标，可拖动以调整位置。", {
        callback = function()
            CooldownPulse.TestAndUnlock()
        end,
        dependence = dep,
    })
    panel:AddGroupHeader("外观参数")
    local optIconSize = panel:AddOptionSlider("图标基础大小", "设置闪烁图标的基础大小", {
        min = 30, max = 150, step = 5, decimalNumbers = 0,
        getter = function() return db.iconSize end,
        setter = function(value) db.iconSize = value; CooldownPulse.RefreshLocals() end,
        getDefault = function() return CooldownPulse.defaults.iconSize end,
        dependence = dep,
    })
    if optIconSize then optIconSize.optionName = "GW2PlusCooldownPulse_IconSize" end
    local optAnimScale = panel:AddOptionSlider("动画放大倍数", "图标闪烁时的最大放大比例", {
        min = 0, max = 3, step = 0.1, decimalNumbers = 1,
        getter = function() return db.animScale end,
        setter = function(value) db.animScale = value; CooldownPulse.RefreshLocals() end,
        getDefault = function() return CooldownPulse.defaults.animScale end,
        dependence = dep,
    })
    if optAnimScale then optAnimScale.optionName = "GW2PlusCooldownPulse_AnimScale" end
    local optMaxAlpha = panel:AddOptionSlider("最高透明度", "闪烁达到最亮时的透明度 (1 为完全不透明)", {
        min = 0.1, max = 1, step = 0.1, decimalNumbers = 1,
        getter = function() return db.maxAlpha end,
        setter = function(value) db.maxAlpha = value; CooldownPulse.RefreshLocals() end,
        getDefault = function() return CooldownPulse.defaults.maxAlpha end,
        dependence = dep,
    })
    if optMaxAlpha then optMaxAlpha.optionName = "GW2PlusCooldownPulse_MaxAlpha" end
    panel:AddGroupHeader("时间与逻辑")
    local optFadeIn = panel:AddOptionSlider("淡入时间 (秒)", "图标出现时的渐显时间", {
        min = 0, max = 2, step = 0.1, decimalNumbers = 1,
        getter = function() return db.fadeInTime end,
        setter = function(value) db.fadeInTime = value; CooldownPulse.RefreshLocals() end,
        getDefault = function() return CooldownPulse.defaults.fadeInTime end,
        dependence = dep,
    })
    if optFadeIn then optFadeIn.optionName = "GW2PlusCooldownPulse_FadeInTime" end
    local optHoldTime = panel:AddOptionSlider("停留时间 (秒)", "达到最高透明度后保持的时间", {
        min = 0, max = 2, step = 0.1, decimalNumbers = 1,
        getter = function() return db.holdTime end,
        setter = function(value) db.holdTime = value; CooldownPulse.RefreshLocals() end,
        getDefault = function() return CooldownPulse.defaults.holdTime end,
        dependence = dep,
    })
    if optHoldTime then optHoldTime.optionName = "GW2PlusCooldownPulse_HoldTime" end
    local optFadeOut = panel:AddOptionSlider("淡出时间 (秒)", "图标消失时的渐隐时间", {
        min = 0, max = 2, step = 0.1, decimalNumbers = 1,
        getter = function() return db.fadeOutTime end,
        setter = function(value) db.fadeOutTime = value; CooldownPulse.RefreshLocals() end,
        getDefault = function() return CooldownPulse.defaults.fadeOutTime end,
        dependence = dep,
    })
    if optFadeOut then optFadeOut.optionName = "GW2PlusCooldownPulse_FadeOutTime" end
    panel:AddOption("显示技能名称", "在闪烁的图标上方显示技能名称", {
        getter = function() return db.showSpellName end,
        setter = function(value) db.showSpellName = value; CooldownPulse.RefreshLocals() end,
        getDefault = function() return CooldownPulse.defaults.showSpellName end,
        dependence = dep,
    })
    return panel
end
addonTable.BuildCooldownPulsePanel = BuildPanel
