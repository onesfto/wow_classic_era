local queued
local inCombat = false
local Unpack = table.unpack or unpack

local function Noop() end

local function NewMover()
    local mover = {}
    function mover:EnableMouse(enabled) self.mouseEnabled = enabled end
    function mover:Hide() self.hidden = true end
    function mover:Show() self.hidden = false end
    function mover:SetMovable(movable) self.movable = movable end
    function mover:ClearAllPoints() self.point = nil end
    function mover:SetPoint(...) self.point = {...} end
    return mover
end

local function NewFrame()
    local frame = {gwMover = NewMover()}
    function frame:SetAttribute(_, value) self.isMovedAttribute = value end
    function frame:RegisterEvent() end
    function frame:UnregisterEvent() end
    function frame:SetScript() end
    return frame
end

local function NewPanel(options)
    local panel = {gwOptions = options or {}}
    function panel:AddGroupHeader(name)
        self.gwOptions[#self.gwOptions + 1] = {
            name = name,
            optionType = "header",
        }
    end
    function panel:AddOptionButton(name, description, values)
        local option = {
            name = name,
            desc = description,
            optionType = "button",
        }
        for key, value in pairs(values) do option[key] = value end
        self.gwOptions[#self.gwOptions + 1] = option
        return option
    end
    return panel
end

local function FindOption(panel, name)
    for _, option in ipairs(panel.gwOptions) do
        if option.name == name then return option end
    end
end

local definitions = {
    {panel = "player_general", frame = "GwPlayerUnitFrame", setting = "player_pos"},
    {
        panel = "gw2_plus_player_castbar",
        frame = "GwCastingBarPlayer",
        setting = "castingbar_pos",
        resource = true,
    },
    {
        panel = "gw2_plus_player_energy",
        frame = "GwPlayerPowerBar",
        setting = "PowerBar_pos",
        resource = true,
    },
    {
        panel = "gw2_plus_player_resource",
        frame = "GwPlayerClassPower",
        setting = "ClasspowerBar_pos",
        resource = true,
    },
    {panel = "target_general", frame = "GwTargetUnitFrame", setting = "target_pos"},
    {
        panel = "target_of_target",
        frame = "GwTargetTargetUnitFrame",
        setting = "targettarget_pos",
    },
    {panel = "player_pet", frame = "GwPlayerPetFrame", setting = "pet_pos"},
}

local embeddedPanels = {
    hud_microbar = NewPanel(),
    hud_minimap = NewPanel(),
}
local resourcePanels = {}
local globeValue = false
local textCallbackCalled = false
local textInput = {value = ""}
function textInput:GetNumber() return 0 end
function textInput:SetText(value) self.value = value end
local globePanel = NewPanel({
    {
        name = "血球参数",
        getDefault = function() return true end,
        set = function(value) globeValue = value end,
    },
    {
        name = "位移条技能",
        optionType = "text",
        getDefault = function() return nil end,
        set = function() end,
        callback = function(input)
            input:GetNumber()
            textCallbackCalled = true
        end,
        __gwPlusWidget = {inputFrame = {input = textInput}},
    },
})
globePanel.gwPlusWidgets = {}
resourcePanels.gw2_plus_player_globe = globePanel
local profile = {
    MicromenuPos = {
        point = "TOPLEFT", relativePoint = "TOPLEFT",
        xOfs = 0, yOfs = 1, hasMoved = false,
    },
    MinimapPos = {
        point = "BOTTOMRIGHT", relativePoint = "BOTTOMRIGHT",
        xOfs = -5, yOfs = 21, hasMoved = false,
    },
}
local settings = {
    MicromenuPos = {
        point = "CENTER", relativePoint = "CENTER",
        xOfs = 10, yOfs = 10, hasMoved = true,
    },
    MinimapPos = {
        point = "CENTER", relativePoint = "CENTER",
        xOfs = 10, yOfs = 10, hasMoved = true,
    },
}

for index, definition in ipairs(definitions) do
    definition.value = false
    definition.callbackCount = 0
    local current = definition
    local option = {
        name = "参数",
        optionType = "boolean",
        getDefault = function() return true end,
        set = function(value) current.value = value end,
        callback = function() current.callbackCount = current.callbackCount + 1 end,
    }
    local panel = NewPanel({option})
    definition.panelFrame = panel
    if definition.resource then
        resourcePanels[definition.panel] = panel
    else
        embeddedPanels[definition.panel] = panel
    end
    profile[definition.setting] = {
        point = "TOP", relativePoint = "TOP",
        xOfs = index, yOfs = -index, hasMoved = false,
    }
    settings[definition.setting] = {
        point = "CENTER", relativePoint = "CENTER",
        xOfs = 50, yOfs = 50, hasMoved = true,
    }
    _G[definition.frame] = NewFrame()
end

local multiValues = {one = false, two = false}
local multiCallbacks = 0
local targetPanel = embeddedPanels.target_general
targetPanel.gwOptions[#targetPanel.gwOptions + 1] = {
    name = "多选参数",
    optionType = "dropdown",
    hasCheckbox = true,
    optionsList = {"one", "two"},
    getDefault = function() return true end,
    set = function(value, optionKey) multiValues[optionKey] = value end,
    callback = function() multiCallbacks = multiCallbacks + 1 end,
}

_G.GW2_ADDON = {
    settings = settings,
    globalDefault = {profile = profile},
    RefreshSettingsPanel = Noop,
    CheckDependencies = Noop,
    UpdateMatchingLayout = Noop,
    CombatQueue = {
        Queue = function(_, name, callback, args)
            queued = {name = name, callback = callback, args = args}
        end,
    },
}
_G.Gw2MicroBarFrame = NewFrame()
_G.Minimap = NewFrame()
_G.UIParent = {}
_G.InCombatLockdown = function() return inCombat end
_G.C_Timer = {After = Noop}
_G.CreateFrame = function() return NewFrame() end

local customRefreshCount = 0
local addon = {
    ActionBarOptionsUtils = {
        InitializePanel = function(panel)
            customRefreshCount = customRefreshCount + 1
            panel.customRefreshCount = customRefreshCount
        end,
    },
}
assert(loadfile("Modules/Settings/HudMoverOptions.lua"))("GW2_UI_PLUS", addon)
assert(addon.BuildHudMoverOptions({
    gwPlusEmbeddedPanels = embeddedPanels,
    gwPlusPlayerResourcePanels = resourcePanels,
}))

local globeReset = FindOption(globePanel, "恢复默认")
assert(globeReset, "血球和贴图页面缺少恢复默认按钮")
assert(globePanel.customRefreshCount > 0,
    "血球和贴图页面新增按钮后覆盖了原有多栏布局")
globeReset.callback()
assert(globeValue == true, "血球和贴图页面未恢复页面参数")
assert(textCallbackCalled, "血球和贴图页面文本选项回调参数错误")
assert(textInput.value == "", "血球和贴图页面文本框未刷新")

assert(not FindOption(definitions[1].panelFrame, "位置"),
    "玩家综合页不应显示位置分类标题")
assert(not FindOption(definitions[2].panelFrame, "位置"),
    "玩家施法条页面不应显示位置分类标题")
assert(not FindOption(definitions[3].panelFrame, "位置"),
    "玩家能量条页面不应显示位置分类标题")
assert(not FindOption(definitions[4].panelFrame, "位置"),
    "玩家资源条页面不应显示位置分类标题")

for index = 1, 4 do
    local definition = definitions[index]
    local panel = definition.panelFrame
    local unlock = assert(
        FindOption(panel, "解锁/锁定"),
        definition.panel .. " 缺少解锁按钮")
    local restore = assert(
        FindOption(panel, "恢复默认"),
        definition.panel .. " 缺少恢复按钮")
    unlock.callback()
    assert(_G[definition.frame].gwMover.gwPlusUnlocked == true,
        definition.panel .. " 未解锁对应框体")
    unlock.callback()
    assert(_G[definition.frame].gwMover.gwPlusUnlocked == false,
        definition.panel .. " 未锁定对应框体")

    restore.callback()
    assert(definition.value == true, definition.panel .. " 未恢复页面参数")
    assert(definition.callbackCount == 1, definition.panel .. " 未执行参数回调")
    local point = assert(_G[definition.frame].gwMover.point)
    assert(point[1] == profile[definition.setting].point,
        definition.panel .. " 未恢复框体位置")
    assert(settings[definition.setting].hasMoved == false,
        definition.panel .. " 未保存默认位置")
end

local player = definitions[1]
local playerOptions = player.panelFrame.gwOptions
local restorePlayer = FindOption(player.panelFrame, "恢复默认")
player.value = false
settings[player.setting].hasMoved = true
_G[player.frame].gwMover.point = {"CENTER"}
queued = nil
inCombat = true
restorePlayer.callback()
assert(player.value == false, "战斗中提前恢复了页面参数")
assert(_G[player.frame].gwMover.point[1] == "CENTER", "战斗中提前恢复了位置")
assert(queued and queued.name == "GW2PlusRestore" .. player.setting,
    "战斗中未排入恢复队列")
local otherPageValue = false
player.panelFrame.gwOptions = {{
    getDefault = function() return true end,
    set = function(value) otherPageValue = value end,
}}
inCombat = false
queued.callback(Unpack(queued.args))
assert(player.value == true, "脱战队列未恢复页面参数")
assert(otherPageValue == false, "脱战队列错误恢复了切换后的页面")
assert(_G[player.frame].gwMover.point[1] == profile[player.setting].point,
    "脱战队列未恢复位置")
player.panelFrame.gwOptions = playerOptions

assert(FindOption(embeddedPanels.hud_microbar, "重置位置"),
    "微型系统菜单不再保留重置位置")
assert(not FindOption(embeddedPanels.hud_microbar, "恢复默认"),
    "微型系统菜单错误添加恢复默认")
assert(FindOption(embeddedPanels.hud_minimap, "重置位置"),
    "小地图不再保留重置位置")
assert(not FindOption(embeddedPanels.hud_minimap, "恢复默认"),
    "小地图错误添加恢复默认")

print("框体页面移动与恢复默认检查通过")
