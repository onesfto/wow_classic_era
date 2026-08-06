local _, addonTable = ...
-- 设置面板主逻辑：构建框体标签页和排列设置标签
-- 隐藏原生设置的逻辑已移至 HideNativeSettings.lua

local MAIN_MENU_ICON =
    "Interface/AddOns/GW2_UI_PLUS/Assets/icons/tabs/tabicon_profile.png"
local REQUIRED_PAGE_IDS = {
    "player_general",
    "player_classpower",
    "player_aura",
    "player_fader",
    "target_general",
    "target_of_target",
    "player_pet",
    "party_general",
    "raid_general",
    "raid10",
    "raid25",
    "raid40",
    "raid_maintank",
    "raid_pet",
    "raid_party",
    "party_pet",
    "hud_microbar",
    "hud_minimap",
    "hud_worldmap",
    "gw2_plus_player_globe",
    "gw2_plus_player_castbar",
    "gw2_plus_player_energy",
    "gw2_plus_player_resource",
    "gw2_plus_player_xp",
}
local PLAYER_PAGE_DEFINITIONS = {
    {"综合", "player_general"},
    {"血球和贴图", "gw2_plus_player_globe"},
    {"施法条", "gw2_plus_player_castbar"},
    {"能量条", "gw2_plus_player_energy"},
    {"资源条", "gw2_plus_player_resource"},
    {"经验槽", "gw2_plus_player_xp"},
    {"渐隐", "player_fader"},
    {"增益光环", "player_buff_aura"},
    {"减益光环", "player_debuff_aura"},
}
local PLAYER_PAGE_IDS = {}
for _, definition in ipairs(PLAYER_PAGE_DEFINITIONS) do
    PLAYER_PAGE_IDS[definition[2]] = true
end
local TARGET_PAGE_DEFINITIONS = {
    {"综合", "target_general"},
    {"渐隐", "target_fader"},
    {"增益光环", "target_buff_aura"},
    {"减益光环", "target_debuff_aura"},
}
local AURA_VIEW_DEFINITIONS = {
    player_buff_aura = {
        kind = "buff",
        group = "PlayerBuffs",
        header = "玩家",
        breadcrumb = "增益光环",
        sub = "编辑玩家设置。",
    },
    player_debuff_aura = {
        kind = "debuff",
        group = "PlayerDebuffs",
        header = "玩家",
        breadcrumb = "减益光环",
        sub = "编辑玩家设置。",
    },
}
local TARGET_VIEW_DEFINITIONS = {
    target_general = {
        kind = "general",
        breadcrumb = "综合",
        sub = "编辑目标设置。",
    },
    target_fader = {
        kind = "fader",
        breadcrumb = "渐隐",
        sub = "编辑目标设置。",
    },
    target_buff_aura = {
        kind = "buff",
        breadcrumb = "增益光环",
        sub = "编辑目标设置。",
    },
    target_debuff_aura = {
        kind = "debuff",
        breadcrumb = "减益光环",
        sub = "编辑目标设置。",
    },
}
local TARGET_OF_TARGET_PAGE_DEFINITIONS = {
    {"综合", "target_of_target_general"},
    {"渐隐", "target_of_target_fader"},
}
local TARGET_OF_TARGET_VIEW_DEFINITIONS = {
    target_of_target_general = {
        kind = "general",
        breadcrumb = "综合",
        sub = "编辑目标的目标设置。",
    },
    target_of_target_fader = {
        kind = "fader",
        breadcrumb = "渐隐",
        sub = "编辑目标的目标设置。",
    },
}
local PET_PAGE_DEFINITIONS = {
    {"综合", "pet_general"},
    {"欢乐度", "pet_happiness"},
    {"喂食", "pet_feed"},
    {"渐隐", "pet_fader"},
    {"光环", "pet_aura"},
}
local PET_VIEW_DEFINITIONS = {
    pet_general = {
        kind = "general",
        breadcrumb = "综合",
        sub = "编辑宠物设置。",
    },
    pet_happiness = {
        kind = "happiness",
        breadcrumb = "欢乐度",
        sub = "编辑宠物欢乐度图标设置。",
    },
    pet_feed = {
        kind = "feed",
        breadcrumb = "喂食",
        sub = "编辑宠物喂食图标设置。",
    },
    pet_fader = {
        kind = "fader",
        breadcrumb = "渐隐",
        sub = "编辑宠物设置。",
    },
    pet_aura = {
        kind = "aura",
        breadcrumb = "光环",
        sub = "编辑宠物光环设置。",
    },
}
local FRAME_PANEL_TEXT = {
    player_general = {header = "玩家", breadcrumb = "综合", sub = "编辑玩家设置。"},
    player_fader = {header = "玩家", breadcrumb = "渐隐", sub = "编辑玩家设置。"},
    target_general = {header = "目标", breadcrumb = "综合", sub = "编辑目标设置。"},
    target_fader = {header = "目标", breadcrumb = "渐隐", sub = "编辑目标设置。"},
}
local TARGET_AURA_CONFIG = {
    buff = {
        filterKey = "target_Buff_Filter",
        enabledOptionName = "GW2PlusTargetBuffAurasEnabled",
        defaultFilter = "all",
        positionOptionName = "GW2PlusTargetBuffAuraPosition",
        smallSizeOptionName = "GW2PlusTargetBuffAuraSmallSize",
        bigSizeOptionName = "GW2PlusTargetBuffAuraBigSize",
    },
    debuff = {
        filterKey = "target_Debuff_Filter",
        enabledOptionName = "GW2PlusTargetDebuffAurasEnabled",
        defaultFilter = "player",
        positionOptionName = "GW2PlusTargetDebuffAuraPosition",
        smallSizeOptionName = "GW2PlusTargetDebuffAuraSmallSize",
        bigSizeOptionName = "GW2PlusTargetDebuffAuraBigSize",
    },
}
local TAB_ORDER = {
    "GwSettingsUnitFrames",
    "GwSettingsActionBar",
    "GwSettingsParty",
    "GwSettingsChat",
    "GwSettingsComponents",
    "GwSettingsSettings",
    "GwSettingsOverview",
    "GwSettingsProfilePanel",
    "GwSettingsEditMode",
}
local function RemoveArrayValue(list, value)
    if not list then return end
    for index = #list, 1, -1 do
        if list[index] == value then
            table.remove(list, index)
        end
    end
end
local function RemoveWidgetFromRegistry(widget)
    local registry = GW2_ADDON.SettingsWidgetRegistry
    local entry = widget and widget.__gwRegEntry
    if not registry or not entry then return end
    RemoveArrayValue(registry.list, entry)
    local bucket = registry.byPanel and registry.byPanel[entry.panel]
    if bucket then
        RemoveArrayValue(bucket.entries, entry)
    end
    if entry.optionName and registry.byOptionName then
        local entries = registry.byOptionName[entry.optionName]
        RemoveArrayValue(entries, entry)
        if entries and #entries == 0 then
            registry.byOptionName[entry.optionName] = nil
        end
    end
    widget.__gwRegEntry = nil
end
local function RegistryText(value)
    value = tostring(value or "")
    return value:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):lower()
end
local function RegisterWidgetInRegistry(panel, widget)
    local registry = GW2_ADDON.SettingsWidgetRegistry
    if not registry or not widget or widget.__gwRegEntry then return end

    registry.list = registry.list or {}
    registry.byPanel = registry.byPanel or setmetatable({}, {__mode = "k"})
    registry.byOptionName = registry.byOptionName or {}
    local bucket = registry.byPanel[panel]
    if not bucket then
        registry.panelCounter = (registry.panelCounter or 0) + 1
        bucket = {
            entries = {},
            panelIndex = registry.panelCounter,
            header = panel.header and panel.header.GetText
                and panel.header:GetText() or "",
            panel = panel,
        }
        registry.byPanel[panel] = bucket
    end

    local displayName = widget.displayName or ""
    local optionName = widget.optionName
    local entry = {
        widget = widget,
        panel = panel,
        panelIndex = bucket.panelIndex,
        panelHeader = bucket.header,
        panelBreadcrumb = panel.breadcrumb and panel.breadcrumb.GetText
            and panel.breadcrumb:GetText() or "",
        title = displayName,
        titleNorm = RegistryText(displayName),
        path = widget.settingsPath,
        pathNorm = RegistryText(widget.settingsPath),
        groupHeaderNorm = RegistryText(widget.groupHeaderName),
        isNew = GW2_ADDON.NewSign and displayName:find(
            GW2_ADDON.NewSign, 1, true) ~= nil,
        type = widget.optionType,
        optionName = optionName,
        desc = widget.desc,
        descNorm = RegistryText(widget.desc),
    }
    widget.__gwRegEntry = entry
    registry.list[#registry.list + 1] = entry
    bucket.entries[#bucket.entries + 1] = entry
    entry.widgetIndex = #bucket.entries
    if optionName then
        local entries = registry.byOptionName[optionName]
        if not entries then
            entries = {}
            registry.byOptionName[optionName] = entries
        end
        entries[#entries + 1] = entry
    end
end
local function IsFaderOption(option, faderLabel)
    return option and (
        (option.optionType == "header" and option.name == faderLabel)
        or option.groupHeaderName == faderLabel)
end
local function HideEmbeddedFader(panel, faderLabel)
    if not panel or not panel.gwOptions then return end
    local hidden = {}
    local kept = {}
    for _, option in ipairs(panel.gwOptions) do
        if IsFaderOption(option, faderLabel) then
            hidden[option] = true
            if option.__widget then
                option.__widget:Hide()
                RemoveWidgetFromRegistry(option.__widget)
            end
        else
            kept[#kept + 1] = option
        end
    end
    panel.gwOptions = kept
    local scrollBox = panel.scroll and panel.scroll.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not provider then return end
    local filtered = CreateDataProvider()
    local rowIndex = 0
    provider:ForEach(function(data)
        local cols = {}
        for _, option in ipairs(data.cols or {}) do
            if not hidden[option] then
                cols[#cols + 1] = option
            end
        end
        if data.kind or #cols > 0 then
            rowIndex = rowIndex + 1
            filtered:Insert({
                index = rowIndex,
                kind = data.kind,
                cols = data.kind and data.cols or cols,
                panel = data.panel,
            })
        end
    end)
    scrollBox:SetDataProvider(
        filtered, ScrollBoxConstants.RetainScrollPosition)
end
local function CopyMap(source)
    if not source then return nil end
    local copy = {}
    for key, value in pairs(source) do
        copy[key] = value
    end
    return copy
end
local function SetPanelText(panel, header, breadcrumb, sub)
    if not panel then return end
    addonTable.SetPanelTitle(panel, header, breadcrumb)
    if panel.sub then
        panel.sub:SetText(sub)
    end
end
local function SetOptionDependencies(option, dependencies)
    option.dependence = CopyMap(dependencies)
    if option.__widget then
        option.__widget.dependence = CopyMap(dependencies)
    end
end
local function HasOptionPrefix(optionName, prefix)
    return optionName
        and optionName:sub(1, #prefix) == prefix
end
local function IsTargetAuraHeader(option)
    return option and option.optionType == "header"
        and (option.name == "光环" or option.name == "Auras")
end
local function IsTargetFaderHeader(option)
    return option and option.optionType == "header"
        and (option.name == "隐藏器" or option.name == "显隐"
            or option.name == "Fader")
end
local function IsTargetFaderOption(option)
    return HasOptionPrefix(option and option.optionName, "targetFrameFader")
end
local function PrepareTargetFaderOptions(options)
    for _, option in ipairs(options or {}) do
        local isFaderHeader = IsTargetFaderHeader(option)
        local isFaderOption = IsTargetFaderOption(option)
        if isFaderHeader or isFaderOption then
            option.groupHeaderName = "显隐"
            local dependencies = CopyMap(option.dependence) or {}
            dependencies.GW2PlusTargetFaderEnabled = true
            SetOptionDependencies(option, dependencies)
            if option.__widget then
                option.__widget.groupHeaderName = "显隐"
            end
        end

        if isFaderHeader then
            option.name = "显隐"
            if option.__widget then
                option.__widget.displayName = option.name
                option.__widget.title:SetText(option.name)
            end
        elseif option.optionName == "targetFrameFader" then
            option.name = "显隐"
            option.desc = "选择触发显隐的条件；满足任一条件时显示完整框体。"

            local values, labels = {}, {}
            for index, value in ipairs(option.optionsList or {}) do
                if value == "casting" or value == "combat"
                    or value == "hover" or value == "unittarget" then
                    values[#values + 1] = value
                    labels[#labels + 1] = value == "unittarget"
                        and "目标" or option.optionsNames[index]
                end
            end
            option.optionsList = values
            option.optionsNames = labels
            if option.__widget then
                option.__widget.displayName = option.name
                option.__widget.desc = option.desc
                option.__widget.title:SetText(option.name)
                option.__widget.optionsList = values
                option.__widget.optionsNames = labels
            end

            local settings = GW2_ADDON.settings
                and GW2_ADDON.settings.targetFrameFader
            if settings then
                settings.dynamicflight = false
                settings.vehicle = false
                settings.playertarget = false
            end
        end
    end
end
local function InitTargetFaderDB()
    GW2_UI_PLUS_TargetFaderSV = GW2_UI_PLUS_TargetFaderSV or {}
    if GW2_UI_PLUS_TargetFaderSV.enabled == nil then
        GW2_UI_PLUS_TargetFaderSV.enabled = true
    end
    return GW2_UI_PLUS_TargetFaderSV
end
local function InstallTargetFaderGuard()
    local mixin = _G.GwTargetUnitFrameMixin
    if not mixin or mixin.__gwPlusFaderGuardInstalled then return end
    mixin.__gwPlusFaderGuardInstalled = true
    hooksecurefunc(mixin, "ToggleSettings", function(frame)
        if not InitTargetFaderDB().enabled
            and GW2_ADDON.FrameFadeDisable then
            GW2_ADDON.FrameFadeDisable(frame)
        end
    end)
end
local function ApplyTargetFaderEnabled()
    local frame = _G.GwTargetUnitFrame
    if not frame then return end
    if InitTargetFaderDB().enabled then
        frame:ToggleSettings()
    elseif GW2_ADDON.FrameFadeDisable then
        GW2_ADDON.FrameFadeDisable(frame)
    end
end
local function CreateTargetFaderEnabledOption(panel)
    local option = panel:AddOption(
        "启用", "启用目标框体渐隐。", {
            getter = function() return InitTargetFaderDB().enabled end,
            setter = function(value)
                InitTargetFaderDB().enabled = value == true
                ApplyTargetFaderEnabled()
            end,
            getDefault = function() return true end,
            isMasterToggle = true,
        })
    if option then
        option.optionName = "GW2PlusTargetFaderEnabled"
    end
    return option
end
local function IsTargetOptionInView(option, kind)
    local optionName = option and option.optionName
    local isBuff = HasOptionPrefix(optionName, "target_Buff_Filter")
    local isDebuff = HasOptionPrefix(optionName, "target_Debuff_Filter")
    local isBuffEnabled = optionName
        == TARGET_AURA_CONFIG.buff.enabledOptionName
    local isDebuffEnabled = optionName
        == TARGET_AURA_CONFIG.debuff.enabledOptionName
    local isBuffAuraOption = optionName
        == TARGET_AURA_CONFIG.buff.positionOptionName
        or optionName == TARGET_AURA_CONFIG.buff.smallSizeOptionName
        or optionName == TARGET_AURA_CONFIG.buff.bigSizeOptionName
    local isDebuffAuraOption = optionName
        == TARGET_AURA_CONFIG.debuff.positionOptionName
        or optionName == TARGET_AURA_CONFIG.debuff.smallSizeOptionName
        or optionName == TARGET_AURA_CONFIG.debuff.bigSizeOptionName
    local isLegacyAuraOption = optionName == "target_AURAS_ON_TOP"
        or optionName == "targetAuraSmallSize"
        or optionName == "targetAuraBigSize"
    local isAuraHeader = IsTargetAuraHeader(option)
    local isFader = IsTargetFaderOption(option)
        or IsTargetFaderHeader(option)
    if kind == "general" then
        return not isBuff and not isDebuff
            and not isBuffAuraOption and not isDebuffAuraOption
            and not isLegacyAuraOption and not isAuraHeader and not isFader
    elseif kind == "fader" then
        return IsTargetFaderOption(option)
    elseif kind == "buff" then
        return not isLegacyAuraOption
            and (isBuff or isBuffEnabled or isBuffAuraOption)
            or IsTargetAuraHeader(option)
    elseif kind == "debuff" then
        return not isLegacyAuraOption
            and (isDebuff or isDebuffEnabled or isDebuffAuraOption)
            or IsTargetAuraHeader(option)
    end
    return false
end
local function InitTargetAuraFilters()
    GW2_UI_PLUS_SV = GW2_UI_PLUS_SV or {}
    GW2_UI_PLUS_SV.targetAuraFilters =
        GW2_UI_PLUS_SV.targetAuraFilters or {}
    return GW2_UI_PLUS_SV.targetAuraFilters
end
local function InitTargetAuraSettings(kind)
    GW2_UI_PLUS_SV = GW2_UI_PLUS_SV or {}
    GW2_UI_PLUS_SV.targetAuraSettings =
        GW2_UI_PLUS_SV.targetAuraSettings or {}
    local settings = GW2_UI_PLUS_SV.targetAuraSettings
    settings[kind] = settings[kind] or {}

    local auraSettings = settings[kind]
    local nativeSettings = GW2_ADDON.settings or {}
    if auraSettings.position == nil then
        auraSettings.position = nativeSettings.target_AURAS_ON_TOP
            and "TOP" or "DOWN"
    end
    if auraSettings.smallSize == nil then
        auraSettings.smallSize = nativeSettings.targetAuraSmallSize or 20
    end
    if auraSettings.bigSize == nil then
        auraSettings.bigSize = nativeSettings.targetAuraBigSize or 26
    end
    return auraSettings
end
local function GetTargetAuraEnabled(kind)
    local config = TARGET_AURA_CONFIG[kind]
    local settings = GW2_ADDON.settings
    return not settings or settings[config.filterKey] ~= "none"
end
local function LayoutTargetAuraGroup(frame, buttons, kind, offset)
    if #buttons == 0 then return 0 end

    local auraSettings = InitTargetAuraSettings(kind)
    local position = auraSettings.position
    local direction = position == "TOP" and 1 or -1
    local anchorFrame = position == "TOP"
        and (frame.nameString or frame)
        or (frame.castingbarBackground or frame)
    local anchorPoint
    local baseY
    if position == "TOP" then
        anchorPoint = frame.frameInvert and "TOPRIGHT" or "TOPLEFT"
        baseY = 17
    else
        anchorPoint = frame.frameInvert and "BOTTOMRIGHT" or "BOTTOMLEFT"
        baseY = -15
    end

    local growthX = frame.frameInvert and -1 or 1
    local baseX = frame.frameInvert and -2 or 2
    local maxWidth = frame.auras.maxWidth or frame:GetWidth()
    local marginX = 3
    local marginY = 20
    local usedWidth = 0
    local usedHeight = 0
    local lineHeight = 0

    for _, button in ipairs(buttons) do
        local size = button.typeAura == "bigBuff"
            and auraSettings.bigSize or auraSettings.smallSize
        if button.isHarmfulAura and button.typeAura == "smallbuff"
            and GW2_ADDON.GetDebuffScaleBasedOnPrio then
            size = size * GW2_ADDON.GetDebuffScaleBasedOnPrio()
        end

        if usedWidth > 0
            and usedWidth + size + marginX > maxWidth then
            usedWidth = 0
            usedHeight = usedHeight + lineHeight + marginY
            lineHeight = 0
        end

        local centerX = usedWidth + size / 2
        local centerY = usedHeight + size / 2
        button:ClearAllPoints()
        button:SetPoint(
            "CENTER", anchorFrame, anchorPoint,
            baseX + centerX * growthX,
            baseY + direction * (offset + centerY))
        button:SetSize(size, size)
        button.neededSize = size

        usedWidth = usedWidth + size + marginX
        lineHeight = math.max(lineHeight, size)
    end

    return usedHeight + lineHeight
end
local function ApplyTargetAuraLayout(frame)
    if not frame or frame.unit ~= "target" or not frame.auras then return end

    local buttons = {buff = {}, debuff = {}}
    local visibleButtons = frame.auras.visibleButtons or 0
    for index = 1, visibleButtons do
        local button = frame.auras[index]
        if button and button:IsShown() then
            local kind = button.isHarmfulAura and "debuff" or "buff"
            buttons[kind][#buttons[kind] + 1] = button
        end
    end

    local buffPosition = InitTargetAuraSettings("buff").position
    local debuffPosition = InitTargetAuraSettings("debuff").position
    local buffHeight = LayoutTargetAuraGroup(
        frame, buttons.buff, "buff", 0)
    local debuffOffset = 0
    if buffHeight > 0 and #buttons.debuff > 0
        and buffPosition == debuffPosition then
        debuffOffset = buffHeight + 20
    end
    LayoutTargetAuraGroup(frame, buttons.debuff, "debuff", debuffOffset)
end
local function InstallTargetAuraLayoutHook()
    if GW2_ADDON.__gwPlusTargetAuraLayoutHooked then return end
    local nativeUpdate = GW2_ADDON.UpdateBuffLayout
    if not nativeUpdate then return end

    GW2_ADDON.UpdateBuffLayout = function(frame, event, unit, ...)
        nativeUpdate(frame, event, unit, ...)
        ApplyTargetAuraLayout(frame)
    end
    GW2_ADDON.__gwPlusTargetAuraLayoutHooked = true
end
local function ApplyTargetAuraSettings()
    InstallTargetAuraLayoutHook()
    if GwTargetUnitFrame then
        GwTargetUnitFrame:ToggleSettings()
        ApplyTargetAuraLayout(GwTargetUnitFrame)
    end
end
local function SetTargetAuraEnabled(kind, enabled)
    local config = TARGET_AURA_CONFIG[kind]
    local settings = GW2_ADDON.settings
    if not settings then return end

    local savedFilters = InitTargetAuraFilters()
    if enabled then
        local filter = savedFilters[kind]
        if not filter or filter == "none" then
            filter = config.defaultFilter
        end
        settings[config.filterKey] = filter
    else
        local filter = settings[config.filterKey]
        if filter and filter ~= "none" then
            savedFilters[kind] = filter
        end
        settings[config.filterKey] = "none"
    end

    ApplyTargetAuraSettings()
end
local function GetTargetAuraPosition(kind)
    return InitTargetAuraSettings(kind).position
end
local function SetTargetAuraPosition(kind, value)
    InitTargetAuraSettings(kind).position = value == "TOP" and "TOP" or "DOWN"
    ApplyTargetAuraSettings()
end
local function GetTargetAuraSize(kind, sizeType)
    return InitTargetAuraSettings(kind)[sizeType]
end
local function SetTargetAuraSize(kind, sizeType, value)
    InitTargetAuraSettings(kind)[sizeType] = value
    ApplyTargetAuraSettings()
end
local function CreateTargetAuraOptions(panel)
    local options = {}
    for _, kind in ipairs({"buff", "debuff"}) do
        local config = TARGET_AURA_CONFIG[kind]
        local auraKind = kind
        local option = panel:AddOption("启用", "启用目标框体的" .. (kind == "buff"
            and "增益光环" or "减益光环") .. "。", {
            getter = function() return GetTargetAuraEnabled(auraKind) end,
            setter = function(value)
                SetTargetAuraEnabled(auraKind, value == true)
            end,
            getDefault = function() return true end,
            isMasterToggle = true,
            dependence = {TARGET_ENABLED = true},
            groupHeaderName = "光环",
        })
        option.optionName = config.enabledOptionName
        options[kind] = {enabled = option}

        local position = panel:AddOptionDropdown("位置", nil, {
            optionsList = {"TOP", "DOWN"},
            optionNames = {"上", "下"},
            getter = function() return GetTargetAuraPosition(auraKind) end,
            setter = function(value)
                SetTargetAuraPosition(auraKind, value)
            end,
            getDefault = function() return "DOWN" end,
            dependence = {
                TARGET_ENABLED = true,
                [config.enabledOptionName] = true,
            },
            groupHeaderName = "光环",
        })
        position.optionName = config.positionOptionName
        options[kind].position = position

        local smallSize = panel:AddOptionSlider("光环大小", nil, {
            min = 10,
            max = 40,
            decimalNumbers = 0,
            step = 1,
            getter = function()
                return GetTargetAuraSize(auraKind, "smallSize")
            end,
            setter = function(value)
                SetTargetAuraSize(auraKind, "smallSize", value)
            end,
            getDefault = function() return 20 end,
            dependence = {
                TARGET_ENABLED = true,
                [config.enabledOptionName] = true,
            },
            groupHeaderName = "光环",
        })
        smallSize.optionName = config.smallSizeOptionName
        options[kind].smallSize = smallSize

        local bigSize = panel:AddOptionSlider("自身光环大小", nil, {
            min = 10,
            max = 40,
            decimalNumbers = 0,
            step = 1,
            getter = function()
                return GetTargetAuraSize(auraKind, "bigSize")
            end,
            setter = function(value)
                SetTargetAuraSize(auraKind, "bigSize", value)
            end,
            getDefault = function() return 26 end,
            dependence = {
                TARGET_ENABLED = true,
                [config.enabledOptionName] = true,
            },
            groupHeaderName = "光环",
        })
        bigSize.optionName = config.bigSizeOptionName
        options[kind].bigSize = bigSize
    end
    return options
end
local function AddTargetAuraDependencies(panel)
    for _, option in ipairs(panel.__gwPlusTargetOriginalOptions) do
        local optionName = option.optionName
        local kind
        if HasOptionPrefix(optionName, "target_Buff_Filter") then
            kind = "buff"
        elseif HasOptionPrefix(optionName, "target_Debuff_Filter") then
            kind = "debuff"
        end
        if kind then
            local dependencies = CopyMap(option.dependence) or {}
            dependencies[TARGET_AURA_CONFIG[kind].enabledOptionName] = true
            SetOptionDependencies(option, dependencies)
        end
    end
end
local function BuildTargetView(panel, definition)
    local wanted = {}
    for _, option in ipairs(panel.__gwPlusTargetOriginalOptions) do
        if IsTargetOptionInView(option, definition.kind) then
            wanted[option] = true
        end
    end
    local auraOptions = panel.__gwPlusTargetAuraOptions
    local faderEnabledOption = panel.__gwPlusTargetFaderEnabledOption
    local isFaderView = definition.kind == "fader"
    local isAuraView = definition.kind == "buff"
        or definition.kind == "debuff"
    local viewOptions = {}
    if isFaderView and faderEnabledOption then
        viewOptions[#viewOptions + 1] = faderEnabledOption
    end
    if isAuraView then
        local optionsForKind = auraOptions[definition.kind]
        viewOptions[#viewOptions + 1] = optionsForKind.enabled
        viewOptions[#viewOptions + 1] = optionsForKind.position
        viewOptions[#viewOptions + 1] = optionsForKind.smallSize
        viewOptions[#viewOptions + 1] = optionsForKind.bigSize
    end
    for _, option in ipairs(panel.__gwPlusTargetOriginalOptions) do
        if wanted[option] then
            viewOptions[#viewOptions + 1] = option
        end
    end
    local generalMasterOption
    if definition.kind == "general" then
        for _, option in ipairs(viewOptions) do
            if option.isMasterToggle then
                generalMasterOption = option
                break
            end
        end
    end
    if generalMasterOption then
        wanted[generalMasterOption] = nil
    end
    local filtered = CreateDataProvider()
    local rowIndex = 0
    if generalMasterOption then
        rowIndex = 1
        filtered:Insert({
            index = rowIndex,
            cols = {generalMasterOption},
            panel = panel,
        })
        rowIndex = rowIndex + 1
        filtered:Insert({
            index = rowIndex,
            kind = "masterToggleSeparator",
            panel = panel,
        })
    elseif isFaderView and faderEnabledOption then
        filtered:Insert({
            index = 1,
            cols = {faderEnabledOption},
            panel = panel,
        })
        filtered:Insert({
            index = 2,
            kind = "masterToggleSeparator",
            panel = panel,
        })
        rowIndex = 2
    elseif isAuraView then
        local optionsForKind = auraOptions[definition.kind]
        rowIndex = 1
        filtered:Insert({
            index = rowIndex,
            cols = {optionsForKind.enabled},
            panel = panel,
        })
        rowIndex = rowIndex + 1
        filtered:Insert({
            index = rowIndex,
            kind = "masterToggleSeparator",
            panel = panel,
        })
        rowIndex = rowIndex + 1
        filtered:Insert({
            index = rowIndex,
            cols = {optionsForKind.position},
            panel = panel,
        })
        rowIndex = rowIndex + 1
        filtered:Insert({
            index = rowIndex,
            cols = {optionsForKind.smallSize},
            panel = panel,
        })
        rowIndex = rowIndex + 1
        filtered:Insert({
            index = rowIndex,
            cols = {optionsForKind.bigSize},
            panel = panel,
        })
    end
    panel.__gwPlusTargetOriginalProvider:ForEach(function(data)
        if data.kind then return end
        local cols = {}
        for _, option in ipairs(data.cols or {}) do
            if wanted[option] then
                cols[#cols + 1] = option
            end
        end
        if #cols > 0 then
            rowIndex = rowIndex + 1
            filtered:Insert({
                index = rowIndex,
                cols = cols,
                panel = panel,
            })
        end
    end)
    return {
        provider = filtered,
        options = viewOptions,
    }
end
local function SetTargetPanelHeader(panel)
    if not panel or not panel.header then return end
    panel.header:SetText("目标")
    local width = panel.__gwPlusTargetHeaderWidth
    if not width or width <= 0 then
        width = panel.header:GetStringWidth()
    end
    panel.header:SetWidth(width)
end
local function PrepareTargetPanel(panel, headerWidth)
    if not panel or panel.__gwPlusTargetPrepared then return end
    local scrollBox = panel.scroll and panel.scroll.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not provider then return end
    InstallTargetAuraLayoutHook()
    panel.__gwPlusTargetAuraOptions = CreateTargetAuraOptions(panel)
    panel.__gwPlusTargetOriginalProvider = provider
    panel.__gwPlusTargetOriginalOptions = {}
    for _, option in ipairs(panel.gwOptions or {}) do
        local isCustomOption = false
        for _, auraOptions in pairs(panel.__gwPlusTargetAuraOptions) do
            if option == auraOptions.enabled
                or option == auraOptions.position
                or option == auraOptions.smallSize
                or option == auraOptions.bigSize then
                isCustomOption = true
                break
            end
        end
        if not isCustomOption then
            panel.__gwPlusTargetOriginalOptions[
                #panel.__gwPlusTargetOriginalOptions + 1] = option
        end
    end
    panel.__gwPlusTargetFaderEnabledOption =
        CreateTargetFaderEnabledOption(panel)
    InstallTargetFaderGuard()
    PrepareTargetFaderOptions(panel.__gwPlusTargetOriginalOptions)
    AddTargetAuraDependencies(panel)
    panel.__gwPlusTargetOriginalHeader = panel.header:GetText()
    panel.__gwPlusTargetOriginalHeaderWidth = panel.header:GetWidth()
    panel.__gwPlusTargetHeaderWidth = headerWidth
        or panel.header:GetStringWidth()
    SetTargetPanelHeader(panel)
    panel.__gwPlusTargetOriginalBreadcrumb = panel.breadcrumb:GetText()
    panel.__gwPlusTargetOriginalSub = panel.sub:GetText()
    panel.__gwPlusTargetViews = {}
    for pageId, definition in pairs(TARGET_VIEW_DEFINITIONS) do
        panel.__gwPlusTargetViews[pageId] = BuildTargetView(panel, definition)
    end
    panel.__gwPlusTargetPrepared = true
    ApplyTargetFaderEnabled()
end
local function ShowTargetPanelView(panel, panelId, definition)
    PrepareTargetPanel(panel)
    if not panel or not panel.__gwPlusTargetViews then return end
    local view = panel.__gwPlusTargetViews[panelId]
    if not view then return end
    panel.gwOptions = view.options
    panel.scroll.ScrollBox:SetDataProvider(
        view.provider, ScrollBoxConstants.RetainScrollPosition)
    SetTargetPanelHeader(panel)
    SetPanelText(panel, "目标", definition.breadcrumb, definition.sub)
    if GW2_ADDON.CheckDependencies then
        GW2_ADDON.CheckDependencies()
    end
end
local function RestoreTargetPanel(panel)
    if not panel or not panel.__gwPlusTargetPrepared then return end
    panel.gwOptions = panel.__gwPlusTargetOriginalOptions
    panel.scroll.ScrollBox:SetDataProvider(
        panel.__gwPlusTargetOriginalProvider,
        ScrollBoxConstants.RetainScrollPosition)
    if panel.__gwPlusTargetOriginalHeader then
        panel.header:SetText(panel.__gwPlusTargetOriginalHeader)
        panel.header:SetWidth(
            panel.__gwPlusTargetOriginalHeaderWidth
                or panel.header:GetStringWidth())
    end
    panel.breadcrumb:SetText(panel.__gwPlusTargetOriginalBreadcrumb)
    panel.sub:SetText(panel.__gwPlusTargetOriginalSub)
    if GW2_ADDON.CheckDependencies then
        GW2_ADDON.CheckDependencies()
    end
end
local TARGET_OF_TARGET_FADER_CONFIG = {
    stateKey = "__gwPlusTargetTargetFaderState",
    faderPrefix = "targettargetFrameFader",
    enabledOptionName = "GW2PlusTargetTargetFaderEnabled",
    enabledDescription = "启用目标的目标框体渐隐。",
    header = "目标的目标",
    getFrame = function() return _G.GwTargetTargetUnitFrame end,
    getMixin = function() return _G.GwTargetTargetUnitFrameMixin end,
    toggleFrame = function(frame) frame:ToggleSettings() end,
    generalEnabledOptionName = "target_TARGET_ENABLED",
    optionRenames = {
        target_TARGET_ENABLED = "启用",
    },
    getEnabled = function()
        GW2_UI_PLUS_TargetTargetFaderSV =
            GW2_UI_PLUS_TargetTargetFaderSV or {}
        if GW2_UI_PLUS_TargetTargetFaderSV.enabled == nil then
            GW2_UI_PLUS_TargetTargetFaderSV.enabled = true
        end
        return GW2_UI_PLUS_TargetTargetFaderSV.enabled
    end,
    setEnabled = function(value)
        GW2_UI_PLUS_TargetTargetFaderSV =
            GW2_UI_PLUS_TargetTargetFaderSV or {}
        GW2_UI_PLUS_TargetTargetFaderSV.enabled = value == true
    end,
    includePlayerTarget = false,
}
local PET_FADER_CONFIG = {
    stateKey = "__gwPlusPetFaderState",
    faderPrefix = "petFrameFader",
    enabledOptionName = "GW2PlusPetFaderEnabled",
    enabledDescription = "启用宠物框体渐隐。",
    header = "宠物",
    getFrame = function() return _G.GwPlayerPetFrame end,
    getMixin = function() return _G.GwPlayerPetFrameMixin end,
    toggleMethod = "ToggleFaderOptions",
    toggleFrame = function(frame) frame:ToggleFaderOptions() end,
    getEnabled = function()
        GW2_UI_PLUS_PetFaderSV = GW2_UI_PLUS_PetFaderSV or {}
        if GW2_UI_PLUS_PetFaderSV.enabled == nil then
            GW2_UI_PLUS_PetFaderSV.enabled = true
        end
        return GW2_UI_PLUS_PetFaderSV.enabled
    end,
    setEnabled = function(value)
        GW2_UI_PLUS_PetFaderSV = GW2_UI_PLUS_PetFaderSV or {}
        GW2_UI_PLUS_PetFaderSV.enabled = value == true
    end,
    includePlayerTarget = true,
    preserveDynamicFlightVehicle = false,
    removeDependencies = {PETBAR_ENABLED = true},
}
local function CreateMasterToggleReplacement(panel, originalOption)
    if not panel or not originalOption
        or not originalOption.get or not originalOption.set then
        return
    end
    local option = panel:AddOption(
        "启用", originalOption.desc, {
            getter = originalOption.get,
            setter = originalOption.set,
            getDefault = originalOption.getDefault,
            callback = originalOption.callback,
            dependence = CopyMap(originalOption.dependence),
            isMasterToggle = true,
        })
    if option then
        option.optionName = "GW2PlusTargetTargetEnabled"
    end
    return option
end
local function PrepareSplitFaderPanel(panel, config)
    if not panel or panel[config.stateKey] then return end
    local scrollBox = panel.scroll and panel.scroll.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not provider then return end

    local originalOptions = {}
    for _, option in ipairs(panel.gwOptions or {}) do
        originalOptions[#originalOptions + 1] = option
    end
    local state = {
        originalOptions = originalOptions,
        originalProvider = provider,
        originalHeader = panel.header:GetText(),
        originalHeaderWidth = panel.header:GetWidth(),
        originalBreadcrumb = panel.breadcrumb:GetText(),
        originalSub = panel.sub:GetText(),
    }
    panel[config.stateKey] = state

    local originalGeneralEnabledOption
    local generalEnabledOption
    if config.generalEnabledOptionName then
        for _, option in ipairs(originalOptions) do
            if option.optionName == config.generalEnabledOptionName then
                local replacement = CreateMasterToggleReplacement(
                    panel, option)
                if replacement then
                    originalGeneralEnabledOption = option
                    generalEnabledOption = replacement
                end
                break
            end
        end
    end

    local enabledOption
    if not config.preserveOriginal then
        enabledOption = panel:AddOption(
            "启用", config.enabledDescription, {
                getter = config.getEnabled,
                setter = function(value)
                    config.setEnabled(value)
                    local frame = config.getFrame()
                    if frame then
                        if config.getEnabled() then
                            config.toggleFrame(frame)
                        elseif GW2_ADDON.FrameFadeDisable then
                            GW2_ADDON.FrameFadeDisable(frame)
                        end
                    end
                end,
                getDefault = function() return true end,
                isMasterToggle = true,
                dependence = config.dependence,
            })
        if enabledOption then
            enabledOption.optionName = config.enabledOptionName
            local Utils = addonTable.ActionBarOptionsUtils
            if Utils and Utils.CreateOptionWidget then
                local widget = Utils.CreateOptionWidget(panel, enabledOption)
                RegisterWidgetInRegistry(panel, widget)
            end
        end
    end
    state.enabledOption = enabledOption

    local function IsFaderOption(option)
        return HasOptionPrefix(
            option and option.optionName, config.faderPrefix)
            or option and (option.groupHeaderName == "Fader"
                or option.groupHeaderName == "隐藏器")
            or option and option.optionType == "header"
                and (option.name == "Fader" or option.name == "隐藏器"
                    or option.name == "显隐")
    end

    if not config.preserveOriginal then
        for _, option in ipairs(originalOptions) do
            local renamedOption = config.optionRenames
                and config.optionRenames[option.optionName]
            if renamedOption then
                option.name = renamedOption
                if option.__widget then
                    option.__widget.displayName = renamedOption
                    option.__widget.title:SetText(renamedOption)
                end
            end
            if IsFaderOption(option) then
                option.groupHeaderName = "显隐"
                if option.__widget then
                    option.__widget.groupHeaderName = "显隐"
                end
                local dependencies = CopyMap(option.dependence) or {}
                for dependencyName in pairs(config.removeDependencies or {}) do
                    dependencies[dependencyName] = nil
                end
                dependencies[config.enabledOptionName] = true
                SetOptionDependencies(option, dependencies)
                if option.optionType == "header" then
                    option.name = "显隐"
                    if option.__widget then
                        option.__widget.displayName = option.name
                        option.__widget.title:SetText(option.name)
                    end
                elseif option.optionName == config.faderPrefix then
                    option.name = "显隐"
                    option.desc =
                        "选择触发显隐的条件；满足任一条件时显示完整框体。"
                    local values, labels = {}, {}
                    for index, value in ipairs(option.optionsList or {}) do
                        local keep = (config.preserveDynamicFlightVehicle
                                or value ~= "dynamicflight")
                            and (config.preserveDynamicFlightVehicle
                                or value ~= "vehicle")
                            and (config.includePlayerTarget
                                or value ~= "playertarget")
                        if keep then
                            values[#values + 1] = value
                            labels[#labels + 1] = value == "unittarget"
                                and "目标" or option.optionsNames[index]
                        end
                    end
                    option.optionsList = values
                    option.optionsNames = labels
                    if option.__widget then
                        option.__widget.displayName = option.name
                        option.__widget.desc = option.desc
                        option.__widget.title:SetText(option.name)
                        option.__widget.optionsList = values
                        option.__widget.optionsNames = labels
                    end
                end
            end
        end
    end

    local function BuildView(kind)
        local showFader = kind == "fader"
        local originalGeneralMasterOption
        if not showFader and not generalEnabledOption then
            for _, option in ipairs(originalOptions) do
                if not IsFaderOption(option)
                    and option.optionType ~= "header"
                    and option.isMasterToggle then
                    originalGeneralMasterOption = option
                    break
                end
            end
        end
        local generalMasterOption = generalEnabledOption
            or originalGeneralMasterOption
        local showGeneralMaster = not showFader and generalMasterOption
        local wanted = {}
        local options = {}
        if showFader and enabledOption then
            options[#options + 1] = enabledOption
        elseif showGeneralMaster then
            options[#options + 1] = generalMasterOption
        end
        for _, option in ipairs(originalOptions) do
            local isFader = IsFaderOption(option)
            local keepHeader = config.keepGeneralHeaders
                and option.__gwPlusKeepGeneralHeader == true
            if isFader == showFader
                and (option.optionType ~= "header"
                    or (keepHeader and not showFader))
                and option ~= originalGeneralEnabledOption
                and option ~= originalGeneralMasterOption then
                wanted[option] = true
                options[#options + 1] = option
            end
        end

        local filtered = CreateDataProvider()
        local rowIndex = 0
        if showGeneralMaster then
            rowIndex = 1
            filtered:Insert({
                index = rowIndex,
                cols = {generalMasterOption},
                panel = panel,
            })
            rowIndex = rowIndex + 1
            filtered:Insert({
                index = rowIndex,
                kind = "masterToggleSeparator",
                panel = panel,
            })
        elseif showFader and enabledOption then
            rowIndex = 1
            filtered:Insert({index = rowIndex, cols = {enabledOption}, panel = panel})
            rowIndex = rowIndex + 1
            filtered:Insert({
                index = rowIndex,
                kind = "masterToggleSeparator",
                panel = panel,
            })
        end
        provider:ForEach(function(data)
            if data.kind then return end
            local cols = {}
            for _, option in ipairs(data.cols or {}) do
                if wanted[option] then cols[#cols + 1] = option end
            end
            if #cols > 0 then
                rowIndex = rowIndex + 1
                filtered:Insert({index = rowIndex, cols = cols, panel = panel})
            end
        end)
        return {options = options, provider = filtered}
    end

    state.views = {general = BuildView("general"), fader = BuildView("fader")}
    local mixin = config.getMixin()
    if not config.preserveOriginal and mixin
        and not mixin.__gwPlusFaderGuardInstalled then
        mixin.__gwPlusFaderGuardInstalled = true
        hooksecurefunc(mixin, config.toggleMethod or "ToggleSettings", function(frame)
            if not config.getEnabled() and GW2_ADDON.FrameFadeDisable then
                GW2_ADDON.FrameFadeDisable(frame)
            end
        end)
    end
end
local function ShowSplitFaderPanel(panel, config, definition)
    PrepareSplitFaderPanel(panel, config)
    local state = panel and panel[config.stateKey]
    local view = state and state.views[definition.kind]
    if not view then return end
    panel.gwOptions = view.options
    panel.scroll.ScrollBox:SetDataProvider(
        view.provider, ScrollBoxConstants.RetainScrollPosition)
    SetPanelText(panel, config.header, definition.breadcrumb, definition.sub)
    if GW2_ADDON.CheckDependencies then GW2_ADDON.CheckDependencies() end
end
local function RestoreSplitFaderPanel(panel, config)
    local state = panel and panel[config.stateKey]
    if not state then return end
    panel.gwOptions = state.originalOptions
    panel.scroll.ScrollBox:SetDataProvider(
        state.originalProvider, ScrollBoxConstants.RetainScrollPosition)
    panel.header:SetText(state.originalHeader)
    panel.header:SetWidth(state.originalHeaderWidth
        or panel.header:GetStringWidth())
    panel.breadcrumb:SetText(state.originalBreadcrumb)
    panel.sub:SetText(state.originalSub)
    if GW2_ADDON.CheckDependencies then GW2_ADDON.CheckDependencies() end
end
local function PrepareTargetOfTargetPanel(panel)
    PrepareSplitFaderPanel(panel, TARGET_OF_TARGET_FADER_CONFIG)
end
local function ShowTargetOfTargetPanelView(panel, definition)
    ShowSplitFaderPanel(panel, TARGET_OF_TARGET_FADER_CONFIG, definition)
end
local function RestoreTargetOfTargetPanel(panel)
    RestoreSplitFaderPanel(panel, TARGET_OF_TARGET_FADER_CONFIG)
end

local function IsPetAuraOption(option)
    local optionName = option and option.optionName
    return option and (
        (option.optionType == "header"
            and (option.name == "光环" or option.name == "Auras"))
        or option.groupHeaderName == "光环"
        or option.groupHeaderName == "Auras"
        or optionName == "PET_AURAS_UNDER"
        or optionName == "PET_Buff_Filter"
        or optionName == "PET_Buff_Filter_advanced"
        or optionName == "PET_Debuff_Filter"
        or optionName == "PET_Debuff_Filter_advanced")
end

local function IsPetAuxiliaryOption(option, kind)
    local optionName = option and option.optionName
    local groupName = option and option.groupHeaderName
    if kind == "happiness" then
        return optionName == "GW2PlusPetHappinessEnabled"
            or optionName == "GW2PlusPetHappinessSize"
            or groupName == "欢乐度"
            or option and option.optionType == "header"
                and option.name == "欢乐度"
    elseif kind == "feed" then
        return optionName == "GW2PlusPetFeedEnabled"
            or groupName == "喂食"
            or option and option.optionType == "header"
                and option.name == "喂食"
    end
    return false
end

local function IsPetFaderOption(option)
    return HasOptionPrefix(option and option.optionName, "petFrameFader")
        or option and (option.groupHeaderName == "显隐"
            or option.groupHeaderName == "Fader"
            or option.groupHeaderName == "隐藏器")
        or option and option.optionType == "header"
            and (option.name == "显隐" or option.name == "Fader"
                or option.name == "隐藏器")
end

local PET_GENERAL_HIDDEN_OPTIONS = {
    PET_HEALTH_VALUE_RAW = true,
    PET_HEALTH_VALUE_PERCENT = true,
    PET_UNIT_HEALTH_SHORT_VALUES = true,
    PET_SHOW_ABSORB_BAR = true,
}

local function IsPetOptionInView(option, kind)
    if kind == "aura" then return IsPetAuraOption(option) end
    if kind == "fader" then
        return IsPetFaderOption(option) and option.optionType ~= "header"
    end
    if kind == "happiness" or kind == "feed" then
        return IsPetAuxiliaryOption(option, kind)
    end
    if PET_GENERAL_HIDDEN_OPTIONS[option and option.optionName] then
        return false
    end
    return not IsPetAuraOption(option)
        and not IsPetFaderOption(option)
        and not IsPetAuxiliaryOption(option, "happiness")
        and not IsPetAuxiliaryOption(option, "feed")
end

local function FindPetOptionForWidget(options, widget)
    if not widget then return end
    for _, option in ipairs(options or {}) do
        if option.__gwPlusWidget == widget or option.__widget == widget then
            return option
        end
    end
end

local function FilterPetProviderRow(data, wanted, options, panel, index)
    if data.kind then return end

    -- ActionBarOptionsUtils keeps its two-column layout in widgets/options,
    -- while native settings rows use cols. Preserve whichever shape is active
    -- so the existing ScrollBox initializer can render the filtered view.
    if data.cols then
        local cols = {}
        for _, option in ipairs(data.cols) do
            if wanted[option] then cols[#cols + 1] = option end
        end
        if #cols == 0 then return end
        return {
            index = index,
            option = cols[1],
            cols = cols,
            panel = panel,
        }
    end

    if data.widgets then
        local widgets, widgetOptions = {}, {}
        for _, widget in ipairs(data.widgets) do
            local option = FindPetOptionForWidget(options, widget)
            if option and wanted[option] then
                widgets[#widgets + 1] = widget
                widgetOptions[#widgetOptions + 1] = option
            end
        end
        if #widgets == 0 then return end
        if #widgets == 1 then
            return {
                index = index,
                option = widgetOptions[1],
                widget = widgets[1],
                topPadding = data.topPadding,
                panel = panel,
            }
        end
        return {
            index = index,
            option = widgetOptions[1],
            widgets = widgets,
            columnCount = #widgets,
            topPadding = data.topPadding,
            panel = panel,
        }
    end

    local option = data.option
    if option and wanted[option] then
        return {
            index = index,
            option = option,
            widget = data.widget,
            topPadding = data.topPadding,
            panel = panel,
        }
    end
end

local function BuildPetView(panel, state, kind)
    local wanted = {}
    local options = {}
    for _, option in ipairs(state.originalOptions or {}) do
        if IsPetOptionInView(option, kind) then
            wanted[option] = true
            options[#options + 1] = option
        end
    end

    local filtered = CreateDataProvider()
    local rowIndex = 0
    local previousOption
    state.originalProvider:ForEach(function(data)
        local row = FilterPetProviderRow(
            data, wanted, state.originalOptions, panel, rowIndex + 1)
        if row then
            if previousOption and previousOption.isMasterToggle
                and not (row.option and row.option.isMasterToggle) then
                rowIndex = rowIndex + 1
                filtered:Insert({
                    index = rowIndex,
                    kind = "masterToggleSeparator",
                    panel = panel,
                })
            end
            rowIndex = rowIndex + 1
            row.index = rowIndex
            filtered:Insert(row)
            previousOption = row.option
        end
    end)
    return {options = options, provider = filtered}
end

local function BuildPetFaderView(panel, state)
    local baseView = BuildPetView(panel, state, "fader")
    local options = {}
    local filtered = CreateDataProvider()
    local rowIndex = 0

    if state.enabledOption then
        options[#options + 1] = state.enabledOption
        rowIndex = rowIndex + 1
        local enabledWidget = state.enabledOption.__gwPlusWidget
        if enabledWidget then
            filtered:Insert({
                index = rowIndex,
                option = state.enabledOption,
                widget = enabledWidget,
                panel = panel,
            })
        else
            filtered:Insert({
                index = rowIndex,
                cols = {state.enabledOption},
                panel = panel,
            })
        end
        rowIndex = rowIndex + 1
        filtered:Insert({
            index = rowIndex,
            kind = "masterToggleSeparator",
            panel = panel,
        })
    end

    for _, option in ipairs(baseView.options) do
        options[#options + 1] = option
    end
    baseView.provider:ForEach(function(data)
        rowIndex = rowIndex + 1
        local row = {}
        for key, value in pairs(data) do
            row[key] = value
        end
        row.index = rowIndex
        filtered:Insert(row)
    end)

    return {options = options, provider = filtered}
end

local function PreparePetPanel(panel)
    local state = panel and panel.__gwPlusPetFaderState
    if not state then
        local petFrame = addonTable.PlusPetFrame
        if petFrame and petFrame.EnsureAuxiliaryFrames then
            petFrame.EnsureAuxiliaryFrames()
        end
        if petFrame and petFrame.AddOptions then
            petFrame.AddOptions(panel)
            if petFrame.AddAuxiliaryOptions then
                petFrame.AddAuxiliaryOptions(panel)
            end
            local Utils = addonTable.ActionBarOptionsUtils
            if Utils and Utils.InitializePanel then
                Utils.InitializePanel(panel)
            end
        end
        PrepareSplitFaderPanel(panel, PET_FADER_CONFIG)
        state = panel and panel.__gwPlusPetFaderState
    end
    if not state or state.petViewsPrepared then return end
    state.views.general = BuildPetView(panel, state, "general")
    state.views.happiness = BuildPetView(panel, state, "happiness")
    state.views.feed = BuildPetView(panel, state, "feed")
    state.views.fader = BuildPetFaderView(panel, state)
    state.views.aura = BuildPetView(panel, state, "aura")
    state.petViewsPrepared = true
end
local function ShowPetPanelView(panel, definition)
    PreparePetPanel(panel)
    local state = panel and panel.__gwPlusPetFaderState
    local view = state and state.views[definition.kind]
    if not view then return end
    panel.gwOptions = view.options
    panel.scroll.ScrollBox:SetDataProvider(
        view.provider, ScrollBoxConstants.RetainScrollPosition)
    SetPanelText(panel, "宠物", definition.breadcrumb, definition.sub)
    if GW2_ADDON.CheckDependencies then GW2_ADDON.CheckDependencies() end
end
local function RestorePetPanel(panel)
    RestoreSplitFaderPanel(panel, PET_FADER_CONFIG)
end
local function InitPlayerFaderDB()
    GW2_UI_PLUS_PlayerFaderSV = GW2_UI_PLUS_PlayerFaderSV or {}
    if GW2_UI_PLUS_PlayerFaderSV.enabled == nil then
        GW2_UI_PLUS_PlayerFaderSV.enabled = true
    end
    return GW2_UI_PLUS_PlayerFaderSV
end
local function InstallPlayerFaderGuard()
    local mixin = _G.GwPlayerUnitFrameMixin
    if not mixin or mixin.__gwPlusFaderGuardInstalled then return end
    mixin.__gwPlusFaderGuardInstalled = true
    hooksecurefunc(mixin, "ToggleSettings", function(frame)
        if not InitPlayerFaderDB().enabled
            and GW2_ADDON.FrameFadeDisable then
            GW2_ADDON.FrameFadeDisable(frame)
        end
    end)
end
local function RestorePlayerFaderEnergyBar()
    local energyBar = _G.GwPlayerPowerBar
    if not energyBar then return end
    energyBar:SetAlpha(1)
    if energyBar.decay then
        energyBar.decay:SetAlpha(1)
    end
end
local function ApplyPlayerFaderEnabled()
    local frame = _G.GwPlayerUnitFrame
    if not frame then return end
    if InitPlayerFaderDB().enabled then
        frame:ToggleSettings()
    else
        if GW2_ADDON.FrameFadeDisable then
            GW2_ADDON.FrameFadeDisable(frame)
        end
        RestorePlayerFaderEnergyBar()
    end
end
local function PrependPlayerFaderEnabledRow(panel, enabledOption)
    local scrollBox = panel.scroll and panel.scroll.ScrollBox
    local originalProvider = scrollBox and scrollBox:GetDataProvider()
    if not scrollBox or not originalProvider then return end

    local provider = CreateDataProvider()
    provider:Insert({index = 1, cols = {enabledOption}, panel = panel})
    provider:Insert({
        index = 2,
        kind = "masterToggleSeparator",
        panel = panel,
    })
    local index = 2
    originalProvider:ForEach(function(row)
        index = index + 1
        provider:Insert({
            index = index,
            kind = row.kind,
            cols = row.cols,
            panel = row.panel or panel,
        })
    end)
    scrollBox:SetDataProvider(
        provider, ScrollBoxConstants.RetainScrollPosition)
end
local function PreparePlayerFaderPanel(panel)
    if not panel or panel.__gwPlusFaderPrepared then return end

    InstallPlayerFaderGuard()
    local originalOptions = {}
    for _, option in ipairs(panel.gwOptions or {}) do
        originalOptions[#originalOptions + 1] = option
    end
    local enabledOption = panel:AddOption(
        "启用", "启用玩家框体渐隐。", {
            getter = function() return InitPlayerFaderDB().enabled end,
            setter = function(value)
                InitPlayerFaderDB().enabled = value == true
                ApplyPlayerFaderEnabled()
            end,
            getDefault = function() return true end,
            isMasterToggle = true,
        })
    if enabledOption then
        enabledOption.optionName = "GW2PlusPlayerFaderEnabled"
    end

    for _, option in ipairs(originalOptions) do
        option.groupHeaderName = "显隐"
        if option.__widget then
            option.__widget.groupHeaderName = "显隐"
        end

        -- 渐隐逻辑实际作用于 GwPlayerUnitFrame，不要求玩家框体切换成目标框体样式。
        local dependencies = CopyMap(option.dependence) or {}
        dependencies.PLAYER_AS_TARGET_FRAME = nil
        dependencies.GW2PlusPlayerFaderEnabled = true
        SetOptionDependencies(option, dependencies)

        if option.optionName == "playerFrameFader" then
            option.name = "显隐"
            option.desc = "选择触发显隐的条件；满足任一条件时显示完整框体。"
            if option.__widget then
                option.__widget.displayName = option.name
                option.__widget.desc = option.desc
                option.__widget.title:SetText(option.name)
            end

            if GW2_ADDON.Classic then
                local values, labels = {}, {}
                for index, value in ipairs(option.optionsList or {}) do
                    if value ~= "dynamicflight" and value ~= "vehicle" then
                        values[#values + 1] = value
                        labels[#labels + 1] = option.optionsNames[index]
                    end
                end
                option.optionsList = values
                option.optionsNames = labels

                if option.__widget then
                    option.__widget.optionsList = values
                    option.__widget.optionsNames = labels
                end

                local settings = GW2_ADDON.settings
                    and GW2_ADDON.settings.playerFrameFader
                if settings then
                    settings.dynamicflight = false
                    settings.vehicle = false
                end
            end
        end
    end

    panel.gwOptions = {enabledOption}
    for _, option in ipairs(originalOptions) do
        panel.gwOptions[#panel.gwOptions + 1] = option
    end
    PrependPlayerFaderEnabledRow(panel, enabledOption)
    panel.__gwPlusFaderPrepared = true
    ApplyPlayerFaderEnabled()
    if GW2_ADDON and GW2_ADDON.CheckDependencies then
        GW2_ADDON.CheckDependencies()
    end
end
local function BuildAuraView(panel, toggle, definition)
    local wanted = {}
    local prefix = definition.group .. "."
    for _, option in ipairs(panel.__gwPlusAuraOriginalOptions) do
        local optionName = option.optionName
        if optionName
            and optionName:sub(1, #prefix) == prefix then
            wanted[option] = true
        end
    end
    local viewOptions = {toggle}
    for _, option in ipairs(panel.__gwPlusAuraOriginalOptions) do
        if wanted[option] then
            viewOptions[#viewOptions + 1] = option
        end
    end
    local filtered = CreateDataProvider()
    local rowIndex = 1
    filtered:Insert({
        index = rowIndex,
        cols = {toggle},
        panel = panel,
    })
    rowIndex = rowIndex + 1
    filtered:Insert({
        index = rowIndex,
        kind = "masterToggleSeparator",
        panel = panel,
    })
    panel.__gwPlusAuraOriginalProvider:ForEach(function(data)
        if data.kind then return end
        local cols = {}
        for _, option in ipairs(data.cols or {}) do
            if wanted[option] then
                cols[#cols + 1] = option
            end
        end
        if #cols > 0 then
            rowIndex = rowIndex + 1
            filtered:Insert({
                index = rowIndex,
                cols = cols,
                panel = panel,
            })
        end
    end)
    return {
        provider = filtered,
        options = viewOptions,
        nativeOptions = wanted,
    }
end
local function PreparePlayerAuraPanel(panel)
    if not panel or panel.__gwPlusAuraPrepared then return end
    local auras = addonTable.PlusPlayerAuras
    local scrollBox = panel.scroll and panel.scroll.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not auras or not provider then return end
    panel.__gwPlusAuraOriginalProvider = provider
    panel.__gwPlusAuraOriginalOptions = {}
    panel.__gwPlusAuraOriginalDependencies = {}
    for _, option in ipairs(panel.gwOptions or {}) do
        panel.__gwPlusAuraOriginalOptions[
            #panel.__gwPlusAuraOriginalOptions + 1] = option
        panel.__gwPlusAuraOriginalDependencies[option] =
            CopyMap(option.dependence) or false
    end
    panel.__gwPlusAuraOriginalBreadcrumb =
        panel.breadcrumb:GetText()
    panel.__gwPlusAuraOriginalSub = panel.sub:GetText()
    local toggles = {
        buff = auras.CreateToggleOption(panel, "buff"),
        debuff = auras.CreateToggleOption(panel, "debuff"),
    }
    panel.__gwPlusAuraViews = {
        buff = BuildAuraView(
            panel, toggles.buff,
            AURA_VIEW_DEFINITIONS.player_buff_aura),
        debuff = BuildAuraView(
            panel, toggles.debuff,
            AURA_VIEW_DEFINITIONS.player_debuff_aura),
    }
    panel.__gwPlusAuraPrepared = true
end
-- PreparePlayerAuraPanel 导出，供 HideNativeSettings.lua 使用
addonTable.PreparePlayerAuraPanel = PreparePlayerAuraPanel
local function ShowPlayerAuraPanelView(panel, definition)
    PreparePlayerAuraPanel(panel)
    if not panel or not panel.__gwPlusAuraViews then return end
    local view = panel.__gwPlusAuraViews[definition.kind]
    local dependencyKey = definition.kind == "buff"
        and "playerBuffAurasEnabled"
        or "playerDebuffAurasEnabled"
    for option in pairs(view.nativeOptions) do
        local original =
            panel.__gwPlusAuraOriginalDependencies[option]
        local dependencies = original == false
            and nil or CopyMap(original)
        if dependencies
            and dependencies.PLAYER_BUFFS_ENABLED ~= nil then
            local expected = dependencies.PLAYER_BUFFS_ENABLED
            dependencies.PLAYER_BUFFS_ENABLED = nil
            dependencies[dependencyKey] = expected
        end
        SetOptionDependencies(option, dependencies)
    end
    panel.gwOptions = view.options
    panel.__gwPlusActiveAuraView = view
    panel.scroll.ScrollBox:SetDataProvider(
        view.provider, ScrollBoxConstants.RetainScrollPosition)
    SetPanelText(
        panel, definition.header, definition.breadcrumb, definition.sub)
    if GW2_ADDON.CheckDependencies then
        GW2_ADDON.CheckDependencies()
    end
end
local function RestorePlayerAuraPanel(panel)
    if not panel or not panel.__gwPlusAuraPrepared then return end
    for option, original in pairs(
        panel.__gwPlusAuraOriginalDependencies) do
        SetOptionDependencies(
            option, original == false and nil or original)
    end
    panel.gwOptions = panel.__gwPlusAuraOriginalOptions
    panel.__gwPlusActiveAuraView = nil
    panel.scroll.ScrollBox:SetDataProvider(
        panel.__gwPlusAuraOriginalProvider,
        ScrollBoxConstants.RetainScrollPosition)
    panel.breadcrumb:SetText(
        panel.__gwPlusAuraOriginalBreadcrumb)
    panel.sub:SetText(panel.__gwPlusAuraOriginalSub)
    if GW2_ADDON.CheckDependencies then
        GW2_ADDON.CheckDependencies()
    end
end
-- PrepareUnitFrameSettings 已移至 HideNativeSettings.lua
local function FindNativePages(settingsTab)
    local found = {}
    if settingsTab.gwPlusEmbeddedPanels then
        for k, v in pairs(settingsTab.gwPlusEmbeddedPanels) do
            found[k] = v
        end
    end
    local scrollBox = settingsTab and settingsTab.menu
        and settingsTab.menu.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not provider then return end
    provider:ForEach(function(data)
        local frame = data.isSubCat and data.itemData
            and data.itemData.frame
        if frame and frame.panelId then
            found[frame.panelId] = frame
        end
    end)
    for panelId, panel in pairs(
        settingsTab.gwPlusPlayerResourcePanels or {}) do
        found[panelId] = panel
    end
    for _, panelId in ipairs(REQUIRED_PAGE_IDS) do
        if not found[panelId] then
            if DEFAULT_CHAT_FRAME then
                DEFAULT_CHAT_FRAME:AddMessage(
                    "GW2_UI_PLUS: 缺少必需的面板ID: " .. panelId)
            end
            return
        end
    end
    return found
end
local function CaptureFrame(frame)
    local state = {
        parent = frame:GetParent(),
        shown = frame:IsShown(),
        points = {},
    }
    for index = 1, frame:GetNumPoints() do
        state.points[index] = {frame:GetPoint(index)}
    end
    return state
end
local function RestoreFrame(frame, state)
    frame:Hide()
    frame:SetParent(state.parent)
    frame:ClearAllPoints()
    for _, point in ipairs(state.points) do
        frame:SetPoint(unpack(point))
    end
    frame:SetShown(state.shown)
end
local function BuildMainMenuTab(settingsTab, settingsWindow)
    if not settingsWindow or settingsWindow.gwPlusMainMenuTab then return end
    local pages = FindNativePages(settingsTab)
    if not pages then
        if DEFAULT_CHAT_FRAME then
            DEFAULT_CHAT_FRAME:AddMessage(
                "GW2_UI_PLUS: 框体未找到完整的原生设置页面。")
        end
        return
    end
    -- 缓存到 addonTable，供 PartyTab / ComponentsTab 使用
    addonTable.PlusNativePages = pages
    PreparePlayerFaderPanel(pages.player_fader)
    PrepareTargetPanel(
        pages.target_general,
        pages.player_fader and pages.player_fader.header
            and pages.player_fader.header:GetWidth())
    PrepareTargetOfTargetPanel(pages.target_of_target)
    PreparePetPanel(pages.player_pet)
    if pages.player_fader and pages.player_fader.breadcrumb then
        pages.player_fader.breadcrumb:SetText("渐隐")
    end
    if pages.player_fader and pages.player_fader.sub then
        pages.player_fader.sub:SetText("调整玩家框体渐隐设置。")
    end
    local tab = CreateFrame(
        "Frame", nil, settingsWindow, "GwSettingsSettingsTabTemplate")
    tab.name = "GwSettingsUnitFrames"
    tab.headerBreadcrumbText = "框体"
    tab.menu.search:Hide()
    tab.menu.ScrollBox:Hide()
    tab.menu.ScrollBar:Hide()
    local menuEntries = {}
    local currentFrame
    local currentState
    local currentAuraPanel
    local currentTargetPanel
    local currentTargetOfTargetPanel
    local currentPetPanel
    local selectedPanelId = "player_general"
    local playerExpanded = true
    local targetExpanded = false
    local targetOfTargetExpanded = false
    local petExpanded = false
    local function RestoreCurrent()
        if currentAuraPanel then
            RestorePlayerAuraPanel(currentAuraPanel)
            currentAuraPanel = nil
        end
        if currentTargetPanel then
            RestoreTargetPanel(currentTargetPanel)
            currentTargetPanel = nil
        end
        if currentTargetOfTargetPanel then
            RestoreTargetOfTargetPanel(currentTargetOfTargetPanel)
            currentTargetOfTargetPanel = nil
        end
        if currentPetPanel then
            RestorePetPanel(currentPetPanel)
            currentPetPanel = nil
        end
        if currentFrame and currentState then
            RestoreFrame(currentFrame, currentState)
        end
        currentFrame = nil
        currentState = nil
    end
    local function LayoutButtons()
        local visibleIndex = 0
        for _, entry in ipairs(menuEntries) do
            local visible = entry.isParent or not entry.parentKey
                or (entry.parentKey == "player" and playerExpanded)
                or (entry.parentKey == "target" and targetExpanded)
                or (entry.parentKey == "targettarget"
                    and targetOfTargetExpanded)
                or (entry.parentKey == "pet" and petExpanded)
            entry.button:SetShown(visible)
            if visible then
                entry.button:ClearAllPoints()
                entry.button:SetPoint(
                    "TOPLEFT", tab.menu, "TOPLEFT",
                    0, -8 - (visibleIndex * 36))
                visibleIndex = visibleIndex + 1
            end
        end
        for _, entry in ipairs(menuEntries) do
            if entry.isParent then
                local expanded
                if entry.sectionKey == "player" then
                    expanded = playerExpanded
                elseif entry.sectionKey == "target" then
                    expanded = targetExpanded
                elseif entry.sectionKey == "targettarget" then
                    expanded = targetOfTargetExpanded
                else
                    expanded = petExpanded
                end
                entry.button.arrow:SetRotation(expanded and -1.5707 or 0)
            end
        end
    end
    local function ResolvePage(panelId)
        local auraView = AURA_VIEW_DEFINITIONS[panelId]
        local targetView = TARGET_VIEW_DEFINITIONS[panelId]
        local targetOfTargetView =
            TARGET_OF_TARGET_VIEW_DEFINITIONS[panelId]
        local petView = PET_VIEW_DEFINITIONS[panelId]
        return auraView and pages.player_aura
            or targetView and pages.target_general
            or targetOfTargetView and pages.target_of_target
            or petView and pages.player_pet
            or pages[panelId], auraView, targetView, targetOfTargetView,
            petView
    end
    local function SelectPage(panelId)
        RestoreCurrent()
        selectedPanelId = panelId
        playerExpanded = PLAYER_PAGE_IDS[panelId] == true
        targetExpanded = panelId == "target_general"
            or panelId == "target_fader"
            or panelId == "target_buff_aura"
            or panelId == "target_debuff_aura"
        targetOfTargetExpanded = panelId == "target_of_target_general"
            or panelId == "target_of_target_fader"
        petExpanded = panelId == "pet_general"
            or panelId == "pet_happiness"
            or panelId == "pet_feed"
            or panelId == "pet_fader"
            or panelId == "pet_aura"
        local frame, auraView, targetView, targetOfTargetView, petView =
            ResolvePage(panelId)
        currentFrame = frame
        currentState = CaptureFrame(frame)
        frame:Hide()
        frame:SetParent(tab)
        frame:ClearAllPoints()
        frame:SetPoint("TOPLEFT", tab, "TOPLEFT", 0, 0)
        frame:SetPoint("BOTTOMRIGHT", tab, "BOTTOMRIGHT", 0, 0)
        if auraView then
            ShowPlayerAuraPanelView(frame, auraView)
            currentAuraPanel = frame
        end
        if targetView then
            ShowTargetPanelView(frame, panelId, targetView)
            currentTargetPanel = frame
        end
        if targetOfTargetView then
            ShowTargetOfTargetPanelView(frame, targetOfTargetView)
            currentTargetOfTargetPanel = frame
        end
        if petView then
            ShowPetPanelView(frame, petView)
            currentPetPanel = frame
        end
        local panelText = FRAME_PANEL_TEXT[panelId]
        if panelText and not auraView and not targetView
            and not targetOfTargetView and not petView then
            SetPanelText(
                frame,
                panelText.header,
                panelText.breadcrumb,
                panelText.sub)
        end
        frame:Show()
        for _, entry in ipairs(menuEntries) do
            entry.button.activeTexture:SetShown(
                entry.panelId == panelId and not entry.isParent)
        end
        LayoutButtons()
    end
    local function CreateMenuButton(
        text, panelId, isParent, parentKey)
        local button = CreateFrame(
            "Button", nil, tab.menu,
            "GwSettingsSettingsTabMenuButtonTemplate")
        button:SetSize(221, 36)
        button.text:SetPoint(
            "LEFT", button, "LEFT",
            20 + (not isParent and parentKey and 10 or 0), 0)
        button.text:SetText(text)
        button.hover:SetTexture(
            "Interface/AddOns/GW2_UI/textures/character/menu-hover.png")
        if isParent then
            button.arrow:ClearAllPoints()
            button.arrow:SetPoint("LEFT", 5, 0)
            button.arrow:SetTexture(
                "Interface/AddOns/GW2_UI/textures/uistuff/arrow_right.png")
            button.arrow:SetSize(16, 16)
            button.arrow:Show()
        else
            button.arrow:Hide()
        end
        button:SetScript("OnClick", function()
            SelectPage(panelId)
        end)
        menuEntries[#menuEntries + 1] = {
            button = button,
            panelId = panelId,
            isParent = isParent,
            parentKey = isParent and nil or parentKey,
            sectionKey = parentKey,
        }
    end
    CreateMenuButton("玩家", "player_general", true, "player")
    for _, definition in ipairs(PLAYER_PAGE_DEFINITIONS) do
        CreateMenuButton(definition[1], definition[2], false, "player")
    end
    CreateMenuButton("目标", "target_general", true, "target")
    for _, definition in ipairs(TARGET_PAGE_DEFINITIONS) do
        CreateMenuButton(definition[1], definition[2], false, "target")
    end
    CreateMenuButton(
        "目标的目标", "target_of_target_general", true, "targettarget")
    for _, definition in ipairs(TARGET_OF_TARGET_PAGE_DEFINITIONS) do
        CreateMenuButton(
            definition[1], definition[2], false, "targettarget")
    end
    CreateMenuButton("宠物", "pet_general", true, "pet")
    for _, definition in ipairs(PET_PAGE_DEFINITIONS) do
        CreateMenuButton(definition[1], definition[2], false, "pet")
    end
    tab:SetScript("OnShow", function()
        SelectPage(selectedPanelId)
    end)
    tab.callbackOnClose = RestoreCurrent
    addonTable.OpenPetFeedSettings = function()
        if settingsWindow.SwitchTab then
            settingsWindow:SwitchTab(tab.name)
        end
        SelectPage("pet_feed")
        if tab.Show then tab:Show() end
    end
    settingsWindow:AddTab(MAIN_MENU_ICON, tab)
    local tabButton = settingsWindow.tabButtons[#settingsWindow.tabButtons]
    if tabButton and tabButton.icon then
        tabButton.icon:SetTexCoord(0.505, 1, 0, 0.625)
    end
    table.insert(settingsWindow.tabs, tab)
    settingsWindow.gwPlusMainMenuTab = tab
    tab:Hide()
    if addonTable.BuildHudMoverOptions then
        addonTable.BuildHudMoverOptions(settingsTab)
    end
end
addonTable.BuildMainMenuTab = BuildMainMenuTab
addonTable.CaptureFrame = CaptureFrame
addonTable.RestoreFrame = RestoreFrame
local function ArrangeSettingsTabs(settingsWindow)
    if not settingsWindow or not settingsWindow.tabButtons then return end
    local byName = {}
    for _, button in ipairs(settingsWindow.tabButtons) do
        byName[button.panelName] = button
    end
    local ordered = {}
    local included = {}
    for _, panelName in ipairs(TAB_ORDER) do
        local button = byName[panelName]
        if button then
            ordered[#ordered + 1] = button
            included[button] = true
        end
    end
    for _, button in ipairs(settingsWindow.tabButtons) do
        if not included[button] then
            ordered[#ordered + 1] = button
        end
    end
    settingsWindow.tabButtons = ordered
    for index, button in ipairs(ordered) do
        button:ClearAllPoints()
        button:SetPoint(
            "TOPRIGHT", settingsWindow.tabBar, "TOPRIGHT",
            1, -32 + (-40 * (index - 1)))
    end
    -- 统一刷新所有标签按钮的选中态 TexCoord，避免后加的标签停在默认亮态
    local shownNames = {}
    for _, tab in ipairs(settingsWindow.tabs) do
        if tab:IsShown() then
            shownNames[tab.name] = true
        end
    end
    for _, button in ipairs(ordered) do
        if shownNames[button.panelName] then
            button.icon:SetTexCoord(0, 0.5, 0, 0.625)
        else
            button.icon:SetTexCoord(0.505, 1, 0, 0.625)
        end
    end
end
addonTable.ArrangeSettingsTabs = ArrangeSettingsTabs
