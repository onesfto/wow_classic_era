local _, addonTable = ...

local General = addonTable.General
if not General then return end

local function GetGW()
    return _G.GW2_ADDON
end

local function AddGeneralToggle(panel, key, name, description, values)
    values = values or {}
    values.getter = function() return General.GetDB()[key] end
    values.setter = function(value) General.SetSetting(key, value) end
    values.getDefault = function() return General.GetDefault(key) end
    local option = panel:AddOption(name, description, values)
    if option then option.optionName = "GW2PlusGeneral_" .. key end
end

local function AddGeneralDropdown(panel, key, name, description, options, labels, cvar)
    panel:AddOptionDropdown(name, description, {
        optionsList = options,
        optionNames = labels,
        getter = function() return General.GetDB()[key] end,
        setter = function(value) General.SetSetting(key, value) end,
        getDefault = function() return General.GetDefault(key) end,
        hidden = cvar and not General.IsCVarSupported(cvar),
    })
end

local function BuildGeneralPanel(parent)
    local GW = GetGW()
    if not GW or not parent or not CreateFrame then return end
    local panel = CreateFrame("Frame", nil, parent, "GwSettingsPanelTmpl")
    panel.panelId = "gw2_ui_plus_general_utilities"
    if panel.header then
        panel.header:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 20)
        if GW.Colors and GW.Colors.TextColors then
            panel.header:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
        end
    end
    if panel.breadcrumb then
        panel.breadcrumb:SetFont(DAMAGE_TEXT_FONT or "Fonts\\FRIZQT__.TTF", 12)
        if GW.Colors and GW.Colors.TextColors then
            panel.breadcrumb:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
        end
    end
    addonTable.SetPanelTitle(panel, "综合", "通用便利功能")
    if panel.sub then
        panel.sub:SetFont(UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12)
        panel.sub:SetTextColor(181 / 255, 160 / 255, 128 / 255)
        panel.sub:SetText("任务、商人、拾取和画面设置")
    end

    panel:AddGroupHeader("自动化")
    AddGeneralToggle(panel, "autoAcceptQuests", "自动接任务",
        "与任务 NPC 对话时自动接受任务；按住 Shift 可临时跳过。")
    AddGeneralToggle(panel, "autoTurnInQuests", "自动交任务",
        "只自动交付无奖励选择、无费用的已完成任务；按住 Shift 可临时跳过。")
    AddGeneralToggle(panel, "autoDialogueTurnIn", "自动对话",
        "仅在对话中只有一个可交付任务时自动选择；奖励结算仍遵循自动交任务的安全限制。")
    AddGeneralToggle(panel, "autoDismount", "自动下马",
        "需要互动或施法时自动下马。", {
            hidden = not General.IsCVarSupported("autoDismount"),
        })
    AddGeneralToggle(panel, "blockLowLevelTrade", "屏蔽未满级角色交易",
        "角色未达到当前客户端等级上限时，打开交易窗口会立即关闭。")

    panel:AddGroupHeader("商人")
    local canUseGWSettings = GW.settings ~= nil
    panel:AddOption("自动出售灰色物品", "使用 GW2_UI 现有的自动出售功能。", {
        getter = function() return canUseGWSettings and GW.settings.BAG_VENDOR_GRAYS end,
        setter = function(value)
            if not canUseGWSettings then return end
            GW.settings.BAG_VENDOR_GRAYS = value
            if type(GW.SetupVendorJunk) == "function" then GW.SetupVendorJunk(value) end
        end,
        getDefault = function() return false end,
        hidden = not canUseGWSettings,
    })
    panel:AddOption("自动修理装备", "访问商人时使用个人资金自动修理装备。", {
        getter = function()
            return canUseGWSettings and GW.settings.AUTO_REPAIR == "PLAYER"
        end,
        setter = function(value)
            if canUseGWSettings then
                GW.settings.AUTO_REPAIR = value and "PLAYER" or "NONE"
            end
        end,
        getDefault = function() return false end,
        hidden = not canUseGWSettings,
    })
    AddGeneralToggle(panel, "batchBuy", "批量购买",
        "在商人物品上按 Shift 左键，输入购买次数；会按背包、金币和替代货币限制数量。")

    panel:AddGroupHeader("拾取")
    AddGeneralToggle(panel, "fastLoot", "加快拾取速度",
        "加快自动拾取；分配物品、锁定物品、背包不足和唯一物品上限时保留原生拾取框。")

    panel:AddGroupHeader("界面")
    AddGeneralToggle(panel, "showGuildNames", "公会名显示",
        "在玩家姓名下方显示公会名称。", {
            hidden = not General.IsCVarSupported("UnitNamePlayerGuild"),
        })
    AddGeneralToggle(panel, "showPlayerTitles", "头衔显示",
        "显示玩家的 PvP 头衔。", {
            hidden = not General.IsCVarSupported("UnitNamePlayerPVPTitle"),
        })
    AddGeneralToggle(panel, "hideLuaErrors", "屏蔽 Lua 错误",
        "关闭客户端 Lua 报错弹窗；建议同时使用 BugSack 查看错误记录。", {
            hidden = not General.IsCVarSupported("scriptErrors"),
        })
    AddGeneralToggle(panel, "newTabTargeting", "新版 TAB 选怪",
        "战斗中不会选到战斗外目标、自己或镜头看不到的目标。", {
            hidden = not General.IsCVarSupported("TargetNearestUseNew"),
        })
    AddGeneralToggle(panel, "detailedTooltips", "技能详细提示",
        "显示技能的详细提示信息。", {
            hidden = not General.IsCVarSupported("UberTooltips"),
        })

    panel:AddGroupHeader("画面")
    AddGeneralToggle(panel, "antiCensorship", "反河蟹",
        "恢复被客户端替换的模型。修改后需完全退出战网和 WoW，再重新进入才会生效。", {
            hidden = not General.IsCVarSupported("overrideArchive"),
        })
    AddGeneralDropdown(panel, "weatherDensity", "天气效果", "副本内外同时生效。",
        {0, 1, 2, 3}, {"小雨", "中雨", "大雨", "暴雨"}, "weatherDensity")
    AddGeneralDropdown(panel, "violenceLevel", "血液效果", nil,
        {0, 1, 2, 3, 4, 5}, {"无", "略微", "少量", "普通", "暴力", "很暴力"},
        "violenceLevel")
    AddGeneralToggle(panel, "fullScreenGlow",
        _G.FULL_SCREEN_GLOW or "全屏幕泛光效果",
        _G.OPTION_TOOLTIP_FULL_SCREEN_GLOW or "启用全屏幕泛光效果。", {
        hidden = not General.IsCVarSupported("ffxGlow"),
    })
    AddGeneralToggle(panel, "deathEffect", _G.DEATH_EFFECT or "死亡效果",
        _G.OPTION_TOOLTIP_DEATH_EFFECT or "启用死亡效果。", {
        hidden = not General.IsCVarSupported("ffxDeath"),
    })
    AddGeneralToggle(panel, "maxCameraDistance", "最大镜头距离",
        "将经典怀旧服镜头距离设置为 2.6，并在登录后重新应用。", {
            hidden = not General.IsCVarSupported("cameraDistanceMaxZoomFactor"),
        })
    return panel
end

addonTable.BuildGeneralPanel = BuildGeneralPanel
