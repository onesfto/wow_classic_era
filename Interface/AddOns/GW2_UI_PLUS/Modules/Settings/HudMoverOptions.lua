local _, addonTable = ...

local MINIMAP_DEFAULT = {
    point = "TOPRIGHT",
    relativePoint = "TOPRIGHT",
    xOfs = -5,
    yOfs = -3,
    hasMoved = false,
}

local activeMover
local RefreshPanel

local function CopyTable(source)
    if _G.GW2_ADDON and _G.GW2_ADDON.CopyTable then
        return _G.GW2_ADDON.CopyTable(source)
    end
    local copy = {}
    for key, value in pairs(source) do
        copy[key] = type(value) == "table" and CopyTable(value) or value
    end
    return copy
end

local function RestoreOptionDefault(option)
    if not option or option.gwPlusMoverControl
        or not option.getDefault or not option.set then
        return
    end
    if option.hasCheckbox and type(option.optionsList) == "table" then
        for _, optionKey in ipairs(option.optionsList) do
            option.set(option.getDefault(optionKey), optionKey)
        end
        if option.callback then option.callback() end
        return
    end
    local value = option.getDefault()
    if type(value) == "table" then value = CopyTable(value) end
    option.set(value)
    if not option.callback then return end
    if option.optionType == "text" then
        local widget = option.__widget or option.__gwPlusWidget
        local input = widget and widget.inputFrame and widget.inputFrame.input
        if input then input:SetText(value or "") end
        if input then option.callback(input) end
        return
    end
    option.callback(value, option.optionName)
end

local function SetInline(option)
    if option then option.forceNewLine = false end
    return option
end

local function SetRow(columnCount, ...)
    for index = 1, select("#", ...) do
        local option = select(index, ...)
        if option then option.gwPlusColumns = columnCount end
    end
end

local function GetMover(frameName)
    local frame = _G[frameName]
    return frame, frame and frame.gwMover
end

local function SetMoverLocked(mover, locked)
    if not mover then return end
    mover.gwPlusUnlocked = not locked
    mover:EnableMouse(not locked)
    if locked then mover:Hide() else mover:Show() end
end

local function ToggleHudMover(frameName)
    local GW = _G.GW2_ADDON
    if InCombatLockdown and InCombatLockdown() then
        if GW and GW.Notice then GW.Notice("战斗中无法移动组件。") end
        return
    end
    local _, mover = GetMover(frameName)
    if not mover then
        if GW and GW.Notice then GW.Notice("该组件尚未加载。") end
        return
    end
    if mover.gwPlusUnlocked then
        SetMoverLocked(mover, true)
        activeMover = nil
        if GW and GW.Notice then GW.Notice("组件已锁定。") end
        return
    end
    SetMoverLocked(activeMover, true)
    activeMover = mover
    SetMoverLocked(mover, false)
    if GW and GW.Notice then GW.Notice("组件已解锁，可直接拖动。") end
end

local function ResetHudMover(frameName, settingName, defaultPoint)
    local GW = _G.GW2_ADDON
    local frame, mover = GetMover(frameName)
    local profile = GW and GW.globalDefault and GW.globalDefault.profile
    local point = defaultPoint or (profile and profile[settingName])
    if not GW or not GW.settings or not point then
        return
    end
    local function Apply()
        local saved = CopyTable(point)
        GW.settings[settingName] = saved
        if not frame or not mover then return end
        mover.defaultPoint = CopyTable(point)
        mover.savedPoint = CopyTable(point)
        mover:ClearAllPoints()
        mover:SetPoint(
            point.point, UIParent, point.relativePoint,
            point.xOfs, point.yOfs)
        frame.isMoved = false
        frame:SetAttribute("isMoved", false)
        if mover.postdrag then mover.postdrag(frame) end
        if GW.UpdateMatchingLayout then
            GW.UpdateMatchingLayout(mover, saved)
        end
    end
    if InCombatLockdown and InCombatLockdown() then
        if GW.CombatQueue then
            GW.CombatQueue:Queue("GW2PlusReset" .. settingName, Apply, {})
        end
    else
        Apply()
    end
end

local function RestorePanelDefaults(
    panel, frameName, settingName, defaultPoint, onComplete)
    local GW = _G.GW2_ADDON
    local options = {}
    for _, option in ipairs(panel.gwOptions or {}) do
        options[#options + 1] = option
    end
    local function Apply()
        for _, option in ipairs(options) do
            RestoreOptionDefault(option)
        end
        ResetHudMover(frameName, settingName, defaultPoint)
        RefreshPanel(panel)
        if GW and GW.CheckDependencies then GW.CheckDependencies() end
        if onComplete then onComplete() end
    end
    if InCombatLockdown and InCombatLockdown() then
        if GW and GW.CombatQueue then
            GW.CombatQueue:Queue(
                "GW2PlusRestore" .. settingName, Apply, {})
        elseif GW and GW.Notice then
            GW.Notice("战斗中无法恢复组件设置。")
        end
        return
    end
    Apply()
end

function addonTable.RestorePlayerCastbarDefaults(onComplete)
    local panel = addonTable.gwPlusPlayerCastbarPanel
    if not panel then
        local GW = _G.GW2_ADDON
        local tab = GW and GW.GetSettingsTabFrame
            and GW.GetSettingsTabFrame()
        local resources = tab and tab.gwPlusPlayerResourcePanels
        panel = resources and resources.gw2_plus_player_castbar
    end
    if not panel then return false end
    RestorePanelDefaults(
        panel, "GwCastingBarPlayer", "castingbar_pos", nil, onComplete)
    return true
end

RefreshPanel = function(panel)
    local Utils = addonTable.ActionBarOptionsUtils
    if panel and panel.gwPlusWidgets
        and Utils and Utils.InitializePanel then
        Utils.InitializePanel(panel)
        return
    end
    local GW = _G.GW2_ADDON
    if GW and GW.RefreshSettingsPanel then GW.RefreshSettingsPanel(panel) end
end

local function ApplyMinimapDefault()
    local GW = _G.GW2_ADDON
    local profile = GW and GW.globalDefault and GW.globalDefault.profile
    local saved = GW and GW.settings and GW.settings.MinimapPos
    if not profile then return end
    profile.MinimapPos = CopyTable(MINIMAP_DEFAULT)
    if type(saved) == "table" and saved.hasMoved == false then
        ResetHudMover("Minimap", "MinimapPos", MINIMAP_DEFAULT)
    end
end

local function AddMoverControls(
    panel, frameName, settingName, defaultPoint, restorePanel,
    showGroupHeader)
    if not panel or panel.gwPlusMoverControls then return end
    panel.gwPlusMoverControls = true
    if showGroupHeader ~= false then
        panel:AddGroupHeader("位置")
    end
    local mover = SetInline(panel:AddOptionButton(
        "解锁/锁定", "解锁后可拖动组件；再次点击即可锁定。", {
            callback = function() ToggleHudMover(frameName) end,
        }))
    if mover then mover.gwPlusMoverControl = true end
    local resetLabel = restorePanel and "恢复默认" or "重置位置"
    local reset = SetInline(panel:AddOptionButton(
        resetLabel,
        restorePanel and "恢复当前页面的全部参数和位置。"
            or "移回默认位置。", {
            callback = function()
                if restorePanel then
                    RestorePanelDefaults(
                        panel, frameName, settingName, defaultPoint)
                else
                    ResetHudMover(frameName, settingName, defaultPoint)
                end
            end,
            isNegativeButton = true,
        }))
    if reset then reset.gwPlusMoverControl = true end
    SetRow(2, mover, reset)
    RefreshPanel(panel)
end

local function AddPanelRestoreControl(panel)
    if not panel or panel.gwPlusPanelRestoreControl then return end
    panel.gwPlusPanelRestoreControl = true
    panel:AddOptionButton(
        "恢复默认", "恢复当前页面的全部参数。", {
            callback = function()
                RestorePanelDefaults(panel)
            end,
            isNegativeButton = true,
        })
    RefreshPanel(panel)
end

function addonTable.BuildHudMoverOptions(settingsTab)
    local GW = _G.GW2_ADDON
    local tab = settingsTab or (GW and GW.GetSettingsTabFrame
        and GW.GetSettingsTabFrame())
    local pages = tab and tab.gwPlusEmbeddedPanels
    if not pages then return false end
    local resources = tab.gwPlusPlayerResourcePanels or {}
    addonTable.gwPlusPlayerCastbarPanel = resources.gw2_plus_player_castbar
    ApplyMinimapDefault()
    local microPanel = pages and pages.hud_microbar
    local minimapPanel = pages and pages.hud_minimap
    AddMoverControls(
        microPanel, "Gw2MicroBarFrame", "MicromenuPos")
    AddMoverControls(
        minimapPanel, "Minimap", "MinimapPos", MINIMAP_DEFAULT)
    AddMoverControls(
        pages.player_general,
        "GwPlayerUnitFrame", "player_pos", nil, true, false)
    AddMoverControls(
        resources.gw2_plus_player_castbar,
        "GwCastingBarPlayer", "castingbar_pos", nil, true, false)
    AddMoverControls(
        resources.gw2_plus_player_energy,
        "GwPlayerPowerBar", "PowerBar_pos", nil, true)
    AddMoverControls(
        resources.gw2_plus_player_resource,
        "GwPlayerClassPower", "ClasspowerBar_pos", nil, true)
    AddMoverControls(
        pages.target_general,
        "GwTargetUnitFrame", "target_pos", nil, true)
    AddMoverControls(
        pages.target_of_target,
        "GwTargetTargetUnitFrame", "targettarget_pos", nil, true)
    AddMoverControls(
        pages.player_pet,
        "GwPlayerPetFrame", "pet_pos", nil, true)
    AddPanelRestoreControl(resources.gw2_plus_player_globe)
    return true
end

local attempts = 0
local function WaitForPanels()
    if addonTable.BuildHudMoverOptions() then return end
    attempts = attempts + 1
    if attempts < 30 then C_Timer.After(0.5, WaitForPanels) end
end

local events = CreateFrame("Frame")
events:RegisterEvent("PLAYER_LOGIN")
events:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    C_Timer.After(0, WaitForPanels)
end)
