local _, addonTable = ...
-- 注意：不在顶层检查 GW2_ADDON，因为此时它可能还未初始化

local function EnsureDB()
    GW2_UI_PLUS_SV = GW2_UI_PLUS_SV or {}
    if GW2_UI_PLUS_SV.TRADESKILL_SKIN_ENABLED == nil then
        GW2_UI_PLUS_SV.TRADESKILL_SKIN_ENABLED = true
    end
    return GW2_UI_PLUS_SV
end

local function BuildPanel(parent)
    -- 延迟检查，确保在调用时才验证依赖
    local GW = _G.GW2_ADDON
    if not GW or not GW.GetSettingsTabFrame then return end

    local db = EnsureDB()
    local panel = CreateFrame("Frame", nil, parent, "GwSettingsPanelTmpl")
    panel.panelId = "gw2_ui_plus_skins"
    if panel.header then
        panel.header:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 20)
        if GW.Colors and GW.Colors.TextColors then
            panel.header:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
        end
        panel.header:SetText("附加组件")
    end
    if panel.breadcrumb then
        panel.breadcrumb:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
        if GW.Colors and GW.Colors.TextColors then
            panel.breadcrumb:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
        end
        panel.breadcrumb:SetText("界面皮肤")
    end
    addonTable.SetPanelTitle(panel, "附加组件", "界面皮肤")
    if panel.sub then
        panel.sub:SetFont(UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
        panel.sub:SetTextColor(181 / 255, 160 / 255, 128 / 255)
        panel.sub:SetText("GW2_UI 本体没有覆盖到的界面美化")
    end
    panel:AddGroupHeader("游戏界面")
    panel:AddOption("专业与制造面板", "把专业、制造、附魔窗口改造成 GW2 风格的双栏宽面板。切换后需要重载界面。", {
        getter = function() return db.TRADESKILL_SKIN_ENABLED ~= false end,
        setter = function(value) db.TRADESKILL_SKIN_ENABLED = value end,
        getDefault = function() return true end,
        callback = function() GW.ShowRlPopup = true end,
    })
    panel:AddOption("邮件界面", "把邮箱、写信、读信界面替换成 GW2 风格。切换后需要重载界面。", {
        getter = function() return GW.settings and GW.settings.MAIL_SKIN_ENABLED end,
        setter = function(value)
            if GW.settings then GW.settings.MAIL_SKIN_ENABLED = value end
        end,
        getDefault = function() return true end,
        callback = function() GW.ShowRlPopup = true end,
    })
    panel:AddOption("社交窗口", "把好友、公会、屏蔽、谁在线、团队界面替换成 GW2 风格。切换后需要重载界面。", {
        getter = function() return GW.settings and GW.settings.USE_SOCIAL_WINDOW end,
        setter = function(value)
            if GW.settings then GW.settings.USE_SOCIAL_WINDOW = value end
        end,
        getDefault = function() return true end,
        callback = function() GW.ShowRlPopup = true end,
    })
    return panel
end
addonTable.BuildSkinsPanel = BuildPanel
