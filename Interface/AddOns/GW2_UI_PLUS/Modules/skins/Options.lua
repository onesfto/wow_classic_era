-- GW2_UI_PLUS 界面皮肤 —— 设置面板
-- 挂在 GW2_UI 设置窗口的「附加组件 → 界面皮肤」下。
--
-- 这些开关原先是加在 GW2_UI 自己的「皮肤」面板里的（panel_skins.lua + defaults2.lua）。
-- GW2_UI 的皮肤开关体系是一张硬编码表，没有给外部插件留注册接口，
-- 所以改放到 PLUS 自己的面板，存档也用 GW2_UI_PLUS_SV。

local _, addonTable = ...

local GW = _G.GW2_ADDON
if not GW or not GW.GetSettingsTabFrame then return end

local function EnsureDB()
    GW2_UI_PLUS_SV = GW2_UI_PLUS_SV or {}
    if GW2_UI_PLUS_SV.TRADESKILL_SKIN_ENABLED == nil then
        GW2_UI_PLUS_SV.TRADESKILL_SKIN_ENABLED = true
    end
    return GW2_UI_PLUS_SV
end

local function BuildPanel(parent)
    local db = EnsureDB()

    local panel = CreateFrame("Frame", nil, parent, "GwSettingsPanelTmpl")
    panel.panelId = "gw2_ui_plus_skins"

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
        panel.breadcrumb:SetText("界面皮肤")
    end
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
        -- 皮肤只在窗口第一次打开时套一次，关掉之后没法原地还原，只能重载
        callback = function() GW.ShowRlPopup = true end,
    })

    -- 同样是上游用 hidden 挡掉经典旧世的开关（panel_skins.lua 里 hidden = GW.Classic or ...）。
    -- 存档用 GW2_UI 自己的 GW.settings.MAIL_SKIN_ENABLED，与本体共享同一个值。
    panel:AddOption("邮件界面", "把邮箱、写信、读信界面替换成 GW2 风格。切换后需要重载界面。", {
        getter = function() return GW.settings and GW.settings.MAIL_SKIN_ENABLED end,
        setter = function(value)
            if GW.settings then GW.settings.MAIL_SKIN_ENABLED = value end
        end,
        getDefault = function() return true end,
        callback = function() GW.ShowRlPopup = true end,
    })

    -- 这个开关本来在 GW2_UI 的「界面功能」面板里，但上游用 hidden 把经典旧世挡掉了
    -- （panel_interface_features.lua）。外部插件没法把已建好的控件取消隐藏，所以在这儿重开一个。
    -- 存档仍然是 GW2_UI 自己的 GW.settings.USE_SOCIAL_WINDOW，两边读写的是同一个值。
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
