local _, addonTable = ...

-- 隐藏原生 GW2_UI 设置面板的功能模块
-- 从 MainMenu.lua 中提取的 PrepareUnitFrameSettings 及其依赖的辅助函数

-- 原生动作条面板 ID（从 ActionBar/Options.lua 迁移）
local NATIVE_ACTIONBAR_PANEL_IDS = {
    actionbar_general = true,
    actionbar_main = true,
    actionbar_extra = true,
    actionbar_stance = true,
}

local NATIVE_RAID_PANEL_IDS = {
    raid_general = true,
    raid40 = true,
    raid25 = true,
    raid10 = true,
    raid_pet = true,
    raid_maintank = true,
    raid_party = true,
    party_pet = true,
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

local function IsFaderOption(option, faderLabel)
    return option.fader == faderLabel
        or (option.groupHeaderName and (
            option.groupHeaderName == faderLabel
            or option.groupHeaderName == "隐藏器"))
end

-- 隐藏嵌入在面板中的渐隐选项组
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

-- 隐藏面板中的特定选项（根据选项名称）
local function HideSpecificOptions(panel, optionNames)
    if not panel or not panel.gwOptions then return end
    local hidden = {}
    local kept = {}
    for _, option in ipairs(panel.gwOptions) do
        local shouldHide = false
        for _, name in ipairs(optionNames) do
            if option.name == name or option.optionName == name then
                shouldHide = true
                break
            end
        end
        if shouldHide then
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

-- 隐藏原生动作条设置（从 ActionBar/Options.lua 迁移）
local function HideNativeActionBarSettings(settingsTab)
    local scrollBox = settingsTab and settingsTab.menu and settingsTab.menu.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not provider then return end
    local nativeParent
    provider:ForEach(function(data)
        if data.isSubCat and data.itemData and data.itemData.frame
            and NATIVE_ACTIONBAR_PANEL_IDS[data.itemData.frame.panelId] then
            nativeParent = data.parent
        end
    end)
    if not nativeParent then return end
    local filtered = CreateDataProvider()
    provider:ForEach(function(data)
        if data.itemData ~= nativeParent and data.parent ~= nativeParent then
            filtered:Insert(data)
        elseif data.isSubCat and data.itemData and data.itemData.frame
            and GW2_ADDON.SettingsWidgetRegistry and GW2_ADDON.SettingsWidgetRegistry.byPanel then
            GW2_ADDON.SettingsWidgetRegistry.byPanel[data.itemData.frame] = nil
        end
    end)
    scrollBox:SetDataProvider(filtered, ScrollBoxConstants.RetainScrollPosition)
end

-- 隐藏"附加组件"父条目及其子条目（ComponentsTab 已替代该入口）
local function HideAddonSubPanelsFromNativeMenu(settingsTab)
    local scrollBox = settingsTab and settingsTab.menu and settingsTab.menu.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not provider then return end
    local addonParent
    provider:ForEach(function(data)
        if not data.isSubCat and data.itemData and data.itemData.isAddon then
            addonParent = data.itemData
        end
    end)
    if not addonParent then return end
    local filtered = CreateDataProvider()
    provider:ForEach(function(data)
        if data.itemData ~= addonParent and data.parent ~= addonParent then
            filtered:Insert(data)
        end
    end)
    scrollBox:SetDataProvider(filtered, ScrollBoxConstants.RetainScrollPosition)
end

-- 隐藏"单位框体光环"父条目及其子条目（PartyTab 已替代该入口）
-- 同时将光环面板存入 gwPlusEmbeddedPanels 供 FindNativePages 捕获
local function HideAurasPanelsFromNativeMenu(settingsTab)
    local scrollBox = settingsTab and settingsTab.menu and settingsTab.menu.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not provider then return end

    local AURA_PANEL_IDS = {
        auras_general = true,
        auras_indicators = true,
        auras_missing = true,
    }

    local aurasParent
    provider:ForEach(function(data)
        if data.isSubCat and data.itemData and data.itemData.frame
            and AURA_PANEL_IDS[data.itemData.frame.panelId] then
            aurasParent = data.parent
            -- 顺手存入 gwPlusEmbeddedPanels，供 FindNativePages 捕获
            if not settingsTab.gwPlusEmbeddedPanels then
                settingsTab.gwPlusEmbeddedPanels = {}
            end
            settingsTab.gwPlusEmbeddedPanels[data.itemData.frame.panelId] =
                data.itemData.frame
        end
    end)
    if not aurasParent then return end

    local filtered = CreateDataProvider()
    provider:ForEach(function(data)
        if data.itemData ~= aurasParent and data.parent ~= aurasParent then
            filtered:Insert(data)
        end
    end)
    scrollBox:SetDataProvider(filtered, ScrollBoxConstants.RetainScrollPosition)
end

-- 隐藏原生“玩家”父条目及其全部子条目，并保留 Plus 设置页所需的面板引用
local function HideNativePlayerSettings(settingsTab, embeddedPanels)
    local scrollBox = settingsTab and settingsTab.menu and settingsTab.menu.ScrollBox
    local provider = scrollBox and scrollBox:GetDataProvider()
    if not provider then return end
    local playerParent
    provider:ForEach(function(data)
        local frame = data.isSubCat and data.itemData and data.itemData.frame
        if frame and frame.panelId == "player_general" then
            playerParent = data.parent
        end
    end)
    if not playerParent then return provider end

    local filtered = CreateDataProvider()
    provider:ForEach(function(data)
        local frame = data.isSubCat and data.itemData and data.itemData.frame
        if data.itemData ~= playerParent and data.parent ~= playerParent then
            filtered:Insert(data)
        elseif frame and frame.panelId then
            embeddedPanels[frame.panelId] = frame
            if frame.panelId == "player_totem"
                and GW2_ADDON.SettingsWidgetRegistry
                and GW2_ADDON.SettingsWidgetRegistry.byPanel then
                GW2_ADDON.SettingsWidgetRegistry.byPanel[frame] = nil
            end
        end
    end)
    return filtered
end

-- 隐藏原生“团队框架”父条目及其全部子条目，并保留队伍页所需的面板引用
local function HideNativeRaidSettings(settingsTab, embeddedPanels, provider)
    if not provider then
        local scrollBox = settingsTab and settingsTab.menu
            and settingsTab.menu.ScrollBox
        provider = scrollBox and scrollBox:GetDataProvider()
    end
    if not provider then return end

    local raidParent
    provider:ForEach(function(data)
        local frame = data.isSubCat and data.itemData and data.itemData.frame
        if frame and NATIVE_RAID_PANEL_IDS[frame.panelId] then
            raidParent = data.parent
        end
    end)
    if not raidParent then return provider end

    local filtered = CreateDataProvider()
    provider:ForEach(function(data)
        local frame = data.isSubCat and data.itemData and data.itemData.frame
        if data.itemData ~= raidParent and data.parent ~= raidParent then
            filtered:Insert(data)
        elseif frame and frame.panelId then
            embeddedPanels[frame.panelId] = frame
        end
    end)
    return filtered
end

-- 准备单位框架设置：隐藏已迁移的面板和重复选项
local function PrepareUnitFrameSettings(settingsTab)
    -- 首先隐藏原生动作条设置
    HideNativeActionBarSettings(settingsTab)
    -- 隐藏"附加组件"（ComponentsTab 已替代）
    HideAddonSubPanelsFromNativeMenu(settingsTab)

    local scrollBox = settingsTab and settingsTab.menu
        and settingsTab.menu.ScrollBox
    local embeddedPanels = {}
    local provider = HideNativePlayerSettings(settingsTab, embeddedPanels)
    provider = HideNativeRaidSettings(settingsTab, embeddedPanels, provider)
    if not provider then return end
    local filtered = CreateDataProvider()
    provider:ForEach(function(data)
        local frame = data.isSubCat and data.itemData
            and data.itemData.frame
        if frame and (frame.panelId == "player_general"
            or frame.panelId == "player_classpower"
            or frame.panelId == "player_castbar"
            or frame.panelId == "player_aura"
            or frame.panelId == "player_totem"
            or frame.panelId == "target_general"
            or frame.panelId == "target_of_target"
            or frame.panelId == "player_pet"
            or frame.panelId == "party_general"
            or frame.panelId == "hud_microbar"
            or frame.panelId == "hud_minimap"
            or frame.panelId == "hud_worldmap") then
            embeddedPanels[frame.panelId] = frame
            -- 对于 player_totem，清理注册表
            if frame.panelId == "player_totem" then
                if GW2_ADDON.SettingsWidgetRegistry
                    and GW2_ADDON.SettingsWidgetRegistry.byPanel then
                    GW2_ADDON.SettingsWidgetRegistry.byPanel[frame] = nil
                end
            end
        else
            -- hud_general 保留但需要隐藏特定选项
            if frame and frame.panelId == "hud_general" then
                embeddedPanels[frame.panelId] = frame
            end
            filtered:Insert(data)
        end
    end)
    scrollBox:SetDataProvider(filtered)
    local faderLabel = "显隐"
    HideEmbeddedFader(embeddedPanels.player_general, faderLabel)

    -- 隐藏界面设置-综合面板中的特定选项
    if embeddedPanels.hud_general then
        HideSpecificOptions(embeddedPanels.hud_general, {
            "XPBAR_ENABLED",       -- 经验槽
            "HUD_BACKGROUND",      -- 动作条贴图
            "HUD_SPELL_SWAP",      -- 血球贴图
            "QUEST_XP_PERCENT",    -- 任务经验值百分比
            "FADE_GROUP_MANAGE_FRAME", -- 队伍管理栏渐隐（移至工具条）
            "ROLE_BAR",            -- 角色职责列（移至工具条）
        })
    end

    -- 调用 Settings.lua 导出的 PreparePlayerAuraPanel
    if addonTable.PreparePlayerAuraPanel then
        addonTable.PreparePlayerAuraPanel(embeddedPanels.player_aura)
    end

    -- 调用 UnitFrames/PlayerResources.lua 导出的 PreparePlayerResourcePanel
    if addonTable.PreparePlayerResourcePanel then
        local panel = addonTable.PreparePlayerResourcePanel(
            embeddedPanels.player_general,
            embeddedPanels.player_classpower,
            embeddedPanels.player_castbar)
        if panel then
            settingsTab.gwPlusPlayerStatusPanel = panel
        end
    end
    settingsTab.gwPlusEmbeddedPanels = embeddedPanels
end

addonTable.PrepareUnitFrameSettings = PrepareUnitFrameSettings
