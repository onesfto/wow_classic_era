local _, addonTable = ...
local GW = _G.GW2_ADDON
if not GW then return end
local AB = addonTable.PlusActionBar
if not AB then return end
local castbarProfileHooked = false
local actionBarScaleProfileHooked = false
local RemoveFromList

local ACTIONBAR_MOVER_SETTINGS = {
    {frame = "MainActionBar", setting = "MainActionBar_pos"},
    {frame = "GwMultiBarBottomLeft", setting = "MultiBarBottomLeft"},
    {frame = "GwMultiBarBottomRight", setting = "MultiBarBottomRight"},
    {frame = "GwMultiBarRight", setting = "MultiBarRight"},
    {frame = "GwMultiBarLeft", setting = "MultiBarLeft"},
    {frame = "GwMultiBar5", setting = "MultiBar5"},
    {frame = "GwMultiBar6", setting = "MultiBar6"},
    {frame = "GwMultiBar7", setting = "MultiBar7"},
    {frame = "GwStanceBar", setting = "StanceBar_pos"},
    {frame = "GwTotemBar", setting = "TotemBar_pos"},
    {frame = "GwPlusMageBar", setting = "MageBar_pos"},
}
local EXPERIENCE_BAR_MOVER_SETTINGS = {
    {frame = "GwMultiBarBottomLeft", setting = "MultiBarBottomLeft"},
    {frame = "GwMultiBarBottomRight", setting = "MultiBarBottomRight"},
}
local experienceBarProfileHooked = false
local ApplyExperienceBarMoverPositions

local function IsMainbarLayoutActionBar(frame)
    return frame == _G.GwMultiBarBottomLeft
        or frame == _G.GwMultiBarBottomRight
end

local function IsPlusProfileDefault()
    local defaults = addonTable.PlusProfileDefaults
    return defaults and defaults.IsPlusProfileDefault
        and defaults.IsPlusProfileDefault()
end

local function GetConfiguredMoverDefault(settingName, fallback)
    local defaults = addonTable.PlusProfileDefaults
    local getter = IsPlusProfileDefault()
        and defaults and defaults.GetMoverDefault
        or defaults and defaults.GetNativeMoverDefault
    if getter then
        local value = getter(settingName)
        if value then return GW.CopyTable(value) end
    end
    local profile = GW.globalDefault and GW.globalDefault.profile
    if profile and profile[settingName] then
        return GW.CopyTable(profile[settingName])
    end
    return fallback and GW.CopyTable(fallback) or nil
end

AB.GetMoverDefault = GetConfiguredMoverDefault

local function IsSameMoverPoint(mover, point)
    local currentPoint, _, currentRelativePoint, xOfs, yOfs = mover:GetPoint()
    return currentPoint == point.point
        and currentRelativePoint == point.relativePoint
        and math.abs((xOfs or 0) - (point.xOfs or 0)) < 0.5
        and math.abs((yOfs or 0) - (point.yOfs or 0)) < 0.5
end

local function HookExperienceBarMover(mover)
    if mover.gwPlusExperienceBarHooked then return end
    mover.gwPlusExperienceBarHooked = true
    hooksecurefunc(mover, "SetPoint", function()
        if mover.gwPlusExperienceBarApplying
            or mover.IsMoving or GW.InMoveHudMode then
            return
        end
        ApplyExperienceBarMoverPositions()
    end)
end

ApplyExperienceBarMoverPositions = function()
    if not IsPlusProfileDefault() then return end
    if GW.InMoveHudMode then return end
    if AB.QueueOutOfCombat
        and AB.QueueOutOfCombat(
            "experienceBarMoverPositions", ApplyExperienceBarMoverPositions) then
        return
    end

    if not experienceBarProfileHooked and GW.globalSettings
        and GW.globalSettings.RegisterCallback then
        experienceBarProfileHooked = true
        GW.globalSettings.RegisterCallback(
            AB, "OnProfileChanged", ApplyExperienceBarMoverPositions)
    end

    for _, info in ipairs(EXPERIENCE_BAR_MOVER_SETTINGS) do
        local frame = _G[info.frame]
        local mover = frame and frame.gwMover
        local default = GetConfiguredMoverDefault(info.setting)
        if default then
            if mover then
                HookExperienceBarMover(mover)
                mover.defaultPoint = GW.CopyTable(default)
            end

            local saved = rawget(GW.settings, info.setting)
            if type(saved) ~= "table" or saved.hasMoved ~= true then
                saved = GW.CopyTable(default)
                saved.hasMoved = false
                GW.settings[info.setting] = saved
                if frame then
                    frame.isMoved = false
                    frame:SetAttribute("isMoved", false)
                end
                if mover and not IsSameMoverPoint(mover, default) then
                    mover.gwPlusExperienceBarApplying = true
                    mover:ClearAllPoints()
                    mover:SetPoint(
                        default.point, UIParent, default.relativePoint,
                        default.xOfs, default.yOfs)
                    mover.gwPlusExperienceBarApplying = false
                end
                if mover then
                    mover.savedPoint = GW.CopyTable(saved)
                    if GW.UpdateMatchingLayout then
                        GW.UpdateMatchingLayout(mover, saved)
                    end
                end
            end
        end
    end
end
AB.ApplyExperienceBarMoverPositions = ApplyExperienceBarMoverPositions

function AB.EnsureMoverSettings(settingName, default)
    if not GW.settings then return false end
    local moverDefault = GetConfiguredMoverDefault(settingName, default)
    if not moverDefault then return false end
    local savedPoint = rawget(GW.settings, settingName)
    if not savedPoint then
        GW.settings[settingName] = GW.CopyTable(moverDefault)
        savedPoint = GW.settings[settingName]
    end
    for key, value in pairs(moverDefault) do
        if savedPoint[key] == nil then
            savedPoint[key] = value
        end
    end
    return true
end

function AB.RegisterMovableFrame(
    frame, displayName, settingName, tags, size, frameOptions, mhf,
    postdrag, ignoreParentSize, fallback)
    local profile = GW.globalDefault and GW.globalDefault.profile
    local temporaryDefault = profile and not rawget(profile, settingName)
        and GetConfiguredMoverDefault(settingName, fallback)
    local result

    -- 原生注册函数只读取 globalDefault；临时提供缺失默认值，调用后立即清理。
    if temporaryDefault then
        profile[settingName] = GW.CopyTable(temporaryDefault)
    end
    local ok, err = pcall(function()
        result = {GW.RegisterMovableFrame(
            frame, displayName, settingName, tags, size, frameOptions,
            mhf, postdrag, ignoreParentSize)}
    end)
    if temporaryDefault then profile[settingName] = nil end
    if not ok then error(err, 0) end
    return unpack(result or {})
end

function AB.ResetMoverPosition(frame)
    local mover = frame and frame.gwMover
    local defaultPoint = mover and GetConfiguredMoverDefault(
        mover.setting, mover.defaultPoint)
    if not mover or not defaultPoint then return end
    local preserveMainbarLayout = IsPlusProfileDefault() == true
        and IsMainbarLayoutActionBar(mover.parent) or false
    local function ApplyReset()
        local saved = GW.settings[mover.setting] or {}
        saved.point = defaultPoint.point
        saved.relativePoint = defaultPoint.relativePoint
        saved.xOfs = defaultPoint.xOfs
        saved.yOfs = defaultPoint.yOfs
        saved.hasMoved = preserveMainbarLayout or false
        mover:ClearAllPoints()
        mover:SetPoint(defaultPoint.point, UIParent, defaultPoint.relativePoint,
            defaultPoint.xOfs, defaultPoint.yOfs)
        mover.savedPoint = GW.CopyTable(saved)
        GW.settings[mover.setting] = saved
        mover.parent.isMoved = preserveMainbarLayout
        mover.parent:SetAttribute("isMoved", preserveMainbarLayout)
        AB.RefreshNativeBarLayout()
    end
    local queueName = "resetActionBarMover" .. (mover.setting or "")
    if not AB.QueueOutOfCombat(queueName, ApplyReset) then
        ApplyReset()
    end
end

function AB.EnforceActionBarMoverScales()
    if not GW.settings then return end
    if not actionBarScaleProfileHooked and GW.globalSettings
        and GW.globalSettings.RegisterCallback then
        actionBarScaleProfileHooked = true
        GW.globalSettings.RegisterCallback(
            AB, "OnProfileChanged", AB.EnforceActionBarMoverScales)
    end

    for _, info in ipairs(ACTIONBAR_MOVER_SETTINGS) do
        local scaleSetting = info.setting .. "_scale"
        GW.settings[scaleSetting] = 1

        local frame = _G[info.frame]
        local mover = frame and frame.gwMover
        if mover then
            mover.optionScaleable = false
            RemoveFromList(GW.scaleableFrames, mover)
            RemoveFromList(GW.scaleableMainHudFrames, mover)
            mover:SetScale(1)
        end
        if frame and frame.SetScale then frame:SetScale(1) end
    end
end
function AB.RefreshNativeBarLayout()
    if InCombatLockdown() then return end
    local layoutManager = (GW.MoveHudScaleableFrame
        and GW.MoveHudScaleableFrame.layoutManager)
        or (_G.GwSmallSettingsContainer and _G.GwSmallSettingsContainer.layoutManager)
    local handler = layoutManager and layoutManager:GetScript("OnEvent")
    if handler then handler(layoutManager) end
end
local MAINBAR_MOVER_SETTING = "MainActionBar_pos"
function AB.RegisterMainBarMover()
    local bar = _G.MainActionBar
    if not bar or not bar.gw_Buttons then return end
    if bar.gwMover then return end
    local default = {
        point = "BOTTOM",
        relativePoint = "BOTTOM",
        xOfs = 0,
        yOfs = 0,
        hasMoved = false,
    }
    if not AB.EnsureMoverSettings(MAINBAR_MOVER_SETTING, default) then return end
    AB.RegisterMovableFrame(
        bar, OPTION_SHOW_ACTION_BAR:format(1), MAINBAR_MOVER_SETTING,
        BINDING_HEADER_ACTIONBAR, nil, {"default"}, nil, nil, nil, default)
    bar:ClearAllPoints()
    bar:SetPoint("TOPLEFT", bar.gwMover)
    hooksecurefunc(bar, "SetPoint", function(_, _, anchor)
        if anchor ~= bar.gwMover then
            bar:ClearAllPoints()
            bar:SetPoint("TOPLEFT", bar.gwMover)
        end
    end)
end
function AB.GetMultiBarSize(index)
    local info = MULTIBARS[index]
    if not info then return end
    local settings = GW.settings and GW.settings[info.setting]
    return settings and settings.size or 36
end
function AB.SetMultiBarSize(index, size)
    local info = MULTIBARS[index]
    if not info or not GW.settings then return end
    local settings = GW.settings[info.setting]
    settings.size = size
    GW.settings[info.setting] = settings
end
local function SyncMultiBarButtonSizes()
    for index, info in pairs(MULTIBARS) do
        local bar = _G[info.frame]
        if bar and bar.gw_Buttons then
            local size = AB.GetMultiBarSize(index)
            for i = 1, 12 do
                local btn = bar.gw_Buttons[i]
                if btn and math.abs(btn:GetWidth() - size) > 0.5 then
                    btn:SetSize(size, size)
                    GW.setActionButtonStyle(info.button .. i)
                end
            end
        end
    end
end
function AB.ApplyMultiBarSizes()
    if AB.QueueOutOfCombat("multibarSize", AB.ApplyMultiBarSizes) then return end
    SyncMultiBarButtonSizes()
    if GW.UpdateMultibarButtons and _G.MainActionBar and _G.MainActionBar.gw_Bar1 then
        GW.UpdateMultibarButtons()
    end
end
local function GetGlobeGap(bar)
    local gap = InitDB().mainBarGlobeGap
    if not gap or gap == 0 then return 0 end
    if GW.settings and GW.settings.PLAYER_AS_TARGET_FRAME then
        return 0
    end
    return gap
end
local applyingMainBar = false
local function MainBarButton_OnSetPoint(self)
    if applyingMainBar or not self.gwPlusX then return end
    local point, parent, relPoint, x, y = self:GetPoint()
    if point == "TOPLEFT" and parent == _G.MainActionBar and relPoint == "TOPLEFT"
        and math.abs((x or 0) - self.gwPlusX) < 0.5 and math.abs((y or 0) - self.gwPlusY) < 0.5 then
        return
    end
    applyingMainBar = true
    self:ClearAllPoints()
    self:SetPoint("TOPLEFT", _G.MainActionBar, "TOPLEFT", self.gwPlusX, self.gwPlusY)
    applyingMainBar = false
end
function AB.SyncMainBarMoverVisual(bar, leftInset, topInset, width, height)
    local mover = bar and bar.gwMover
    local backdrop = mover and mover.backdrop
    if not backdrop then return end
    backdrop:ClearAllPoints()
    backdrop:SetPoint("TOPLEFT", mover, "TOPLEFT", leftInset, -topInset)
    backdrop:SetSize(width, height)
    if mover.text then
        mover.text:ClearAllPoints()
        mover.text:SetPoint("CENTER", backdrop, "CENTER")
    end
end
local function ApplyMainButtonText(btn, db, layout)
    if not layout then return end
    if btn.HotKey then
        layout.ApplyMainHotkey(btn.HotKey, btn,
            db.mainBarHotkeyPosition,
            db.mainBarHotkeyX or 0, db.mainBarHotkeyY or 0,
            db.mainBarHotkeySize,
            db.mainBarShowHotkey ~= false)
    end
    if btn.Name then
        btn.showMacroName = false
        layout.ApplyTextPosition(btn.Name, btn,
            db.mainBarMacroPosition,
            db.mainBarMacroX or 0, db.mainBarMacroY or 0,
            db.mainBarMacroSize,
            db.mainBarShowMacro == true)
    end
end
function AB.ApplyMainBarText()
    local bar = _G.MainActionBar
    local layout = addonTable.PlusActionBarLayout
    if not bar or not bar.gw_Buttons or not layout then return end
    local db = InitDB()
    for i = 1, math.min(db.mainBarCount or 12, 12) do
        local btn = bar.gw_Buttons[i]
        if btn then ApplyMainButtonText(btn, db, layout) end
    end
end
function AB.ApplyMainBarLayout()
    local bar = _G.MainActionBar
    if not bar or not bar.gw_Buttons or not GW.settings then return end
    if AB.QueueOutOfCombat("mainBarLayout", AB.ApplyMainBarLayout) then return end
    local db = InitDB()
    local size = db.mainBarSize
    local margin = GW.settings.MAINBAR_MARGIIN or 5
    local gap = GetGlobeGap(bar)
    local yOfs = 0
    local count = math.max(1, math.min(12, math.floor((db.mainBarCount or 12) + 0.5)))
    local columns = math.max(1, math.min(count,
        math.floor((db.mainBarColumns or count) + 0.5)))
    local rows = math.ceil(count / columns)
    local usedColumns = math.min(columns, count)
    local useGap = columns == 12 and count > 6 and gap > 0
    local contentWidth = usedColumns * size
        + math.max(usedColumns - 1, 0) * margin
        + (useGap and gap or 0)
    local contentHeight = rows * size + math.max(rows - 1, 0) * margin
    local layout = addonTable.PlusActionBarLayout
    db.mainBarCount, db.mainBarColumns = count, columns
    applyingMainBar = true
    for i = 1, 12 do
        local btn = bar.gw_Buttons[i]
        if btn then
            btn:SetShown(i <= count)
            if i <= count and math.abs(btn:GetWidth() - size) > 0.5 then
                btn:SetSize(size, size)
                GW.setActionButtonStyle("ActionButton" .. i)
                if GW.FixHotKeyPosition then
                    GW.FixHotKeyPosition(btn, false, false, true)
                end
            end
            if i <= count then
                local row = math.floor((i - 1) / columns)
                local column = (i - 1) % columns
                local x = margin + column * (size + margin)
                if useGap and column >= 6 then x = x + gap end
                local y = yOfs - row * (size + margin)
                btn.gwPlusX, btn.gwPlusY = x, y
                btn:ClearAllPoints()
                btn:SetPoint("TOPLEFT", bar, "TOPLEFT", x, y)
            end
            ApplyMainButtonText(btn, db, layout)
            if not btn.gwPlusPointHooked then
                btn.gwPlusPointHooked = true
                hooksecurefunc(btn, "SetPoint", MainBarButton_OnSetPoint)
            end
        end
    end
    applyingMainBar = false
    local barWidth = contentWidth + (margin * 2)
    local topInset = math.max(-yOfs, 0)
    bar:SetSize(barWidth, contentHeight)
    bar.gw_Width = barWidth
    AB.SyncMainBarMoverVisual(bar, margin, topInset, contentWidth, contentHeight)
end
function RemoveFromList(list, value)
    if type(list) ~= "table" then return end
    for index = #list, 1, -1 do
        if list[index] == value then
            table.remove(list, index)
        end
    end
end
function AB.EnforceCastbarScale()
    local castbar = _G.GwCastingBarPlayer
    if not castbar then return end
    if not castbarProfileHooked and GW.globalSettings
        and GW.globalSettings.RegisterCallback then
        castbarProfileHooked = true
        GW.globalSettings.RegisterCallback(
            AB, "OnProfileChanged", AB.EnforceCastbarScale)
    end
    if GW.settings then GW.settings.castingbar_pos_scale = 1 end

    local mover = castbar.gwMover
    if mover then
        mover.optionScaleable = false
        RemoveFromList(GW.scaleableFrames, mover)
        mover:SetScale(1)
    end
    castbar:SetScale(1)
end
function AB.ApplyCastbarSize()
    AB.EnforceCastbarScale()
    local castbar = _G.GwCastingBarPlayer
    if not castbar then return end
    local db = AB.InitDB()
    local width = db.castbarWidth or AB.defaults.castbarWidth
    local height = db.castbarHeight or AB.defaults.castbarHeight
    castbar:SetSize(width, height)
    castbar.progress:SetSize(width, height)
    if castbar.gwMover then
        if castbar.showDetails then
            castbar.gwMover:SetSize(width + castbar.icon:GetWidth(), math.max(height, castbar.icon:GetHeight()))
            castbar:SetPoint("CENTER", castbar.gwMover, castbar.icon:GetWidth() / 2, -(castbar.icon:GetHeight() / 4))
        else
            castbar.gwMover:SetSize(width, height)
            castbar:SetPoint("CENTER", castbar.gwMover)
        end
    end
end
function AB.ApplyGlobeScale()
    local hg = _G.GW2_PlayerFrame
    if not hg then return end
    local db = InitDB()
    local globeScale = tonumber(db.globeScale) or 1
    local hudScale = tonumber(GW.settings and GW.settings.HUD_SCALE) or 1
    hg.gwScaleMulti = GLOBE_BASE_SCALE * globeScale
    hg:SetScale(hudScale * hg.gwScaleMulti)
    if hg.gwMover then
        hg.gwMover:SetScale(hudScale * hg.gwScaleMulti)
    end
    local dodgeBar = _G.GwDodgeBar
    if dodgeBar and not dodgeBar.asTargetFrame then
        dodgeBar.gwScaleMulti = GLOBE_BASE_SCALE * globeScale
        dodgeBar:SetScale(hudScale * dodgeBar.gwScaleMulti)
    end
    local hudBackground = _G.Gw2_HudBackgroud
        and _G.Gw2_HudBackgroud.actionBarHud
    if hudBackground then
        hudBackground.gwScaleMulti = globeScale
        hudBackground:SetScale(hudScale * globeScale)
    end
    if db.mainBarGlobeGap then
        AB.ApplyMainBarLayout()
    end
end
local MOVER_OPTION_HEIGHT = 45
local function GetMoverBarIndex(mover)
    if not mover then return end
    if mover.parent == _G.MainActionBar then return 1 end
    for index, info in pairs(MULTIBARS) do
        if mover.parent == _G[info.frame] then return index end
    end
end
local function CreateMoverSlider(parent, label, order)
    local row = CreateFrame("Button", nil, parent)
    row:SetSize(170, 40)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -((order - 1) * MOVER_OPTION_HEIGHT))
    row.title = row:CreateFontString(nil, "OVERLAY")
    row.title:SetFont(UNIT_NAME_FONT, 12, "")
    row.title:SetSize(150, 12)
    row.title:SetJustifyH("LEFT")
    row.title:SetPoint("LEFT", row, "LEFT", 8, 5)
    row.title:SetText(label)
    row.title:SetTextColor(1, 1, 1)
    row.slider = CreateFrame("Slider", nil, row)
    row.slider:SetOrientation("HORIZONTAL")
    row.slider:SetSize(120, 16)
    row.slider:SetPoint("LEFT", row, "LEFT", 10, -15)
    row.slider:SetHitRectInsets(0, 0, -10, -10)
    local background = row.slider:CreateTexture(nil, "BACKGROUND")
    background:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/sliderbg.png")
    background:SetAllPoints()
    local thumb = row.slider:CreateTexture(nil, "OVERLAY")
    thumb:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/sliderhandle.png")
    thumb:SetSize(12, 12)
    row.slider:SetThumbTexture(thumb)
    row.input = CreateFrame("EditBox", nil, row)
    row.input:SetAutoFocus(false)
    row.input:SetSize(25, 16)
    row.input:SetPoint("LEFT", row.slider, "RIGHT", 10, 0)
    row.input:SetFont(UNIT_NAME_FONT, 8, "")
    row.input:SetJustifyH("CENTER")
    row.input:SetTextColor(1, 1, 1)
    local inputBackground = row.input:CreateTexture(nil, "BACKGROUND")
    inputBackground:SetTexture(
        "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar-bg.png")
    inputBackground:SetPoint("TOPLEFT", row.input, "TOPLEFT", -5, 3)
    inputBackground:SetPoint("BOTTOMRIGHT", row.input, "BOTTOMRIGHT", 5, -3)
    inputBackground:SetTexCoord(0, 0.2, 0, 1)
    return row
end
local function ApplyMoverOption(barIndex, key, value)
    local db = InitDB()
    if barIndex == 1 then
        if key == "size" then
            db.mainBarSize = value
        elseif key == "spacing" then
            GW.settings.MAINBAR_MARGIIN = value
        elseif key == "count" then
            db.mainBarCount = value
            db.mainBarColumns = math.min(db.mainBarColumns, value)
        elseif key == "columns" then
            db.mainBarColumns = math.min(value, db.mainBarCount)
        end
        AB.ApplyMainBarLayout()
        return
    end
    local prefix = "bar" .. barIndex
    if key == "size" then
        AB.SetMultiBarSize(barIndex, value)
    elseif key == "spacing" then
        db[prefix .. "Spacing"] = value
    elseif key == "count" then
        db[prefix .. "Count"] = value
        db[prefix .. "Columns"] = math.min(db[prefix .. "Columns"], value)
    elseif key == "columns" then
        db[prefix .. "Columns"] = math.min(value, db[prefix .. "Count"])
    end
    if addonTable.PlusActionBarLayout then
        addonTable.PlusActionBarLayout.ApplyMultiBars()
    end
end
local function GetMoverOptionValue(barIndex, key)
    local db = InitDB()
    if barIndex == 1 then
        if key == "size" then return db.mainBarSize end
        if key == "spacing" then return GW.settings.MAINBAR_MARGIIN or 5 end
        if key == "count" then return db.mainBarCount end
        return math.min(db.mainBarColumns, db.mainBarCount)
    end
    local prefix = "bar" .. barIndex
    if key == "size" then return AB.GetMultiBarSize(barIndex) end
    if key == "spacing" then return db[prefix .. "Spacing"] end
    if key == "count" then return db[prefix .. "Count"] end
    return math.min(db[prefix .. "Columns"], db[prefix .. "Count"])
end
local function SetupMoverOptionPanel()
    local container = GW.MoveHudScaleableFrame
    local settingsFrame = container and container.moverSettingsFrame
    local options = settingsFrame and settingsFrame.options
    if not options or options.gwPlusActionBarOptions then return end
    local custom = CreateFrame("Frame", nil, options)
    custom:SetSize(170, MOVER_OPTION_HEIGHT * 4)
    custom:SetPoint("TOPLEFT", options, "TOPLEFT", 0, -5)
    custom:Hide()
    options.gwPlusActionBarOptions = custom
    local definitions = {
        {"size", "尺寸", AB.SIZE_MIN, AB.SIZE_MAX, 1},
        {"spacing", "间距", 0, 20, 1},
        {"count", "按钮数", 1, 12, 1},
        {"columns", "行按钮数", 1, 12, 1},
    }
    custom.rows = {}
    for order, definition in ipairs(definitions) do
        local key, label, minimum, maximum, step = unpack(definition)
        local row = CreateMoverSlider(custom, label, order)
        row.key = key
        row.slider:SetMinMaxValues(minimum, maximum)
        row.slider:SetValueStep(step)
        if row.slider.SetObeyStepOnDrag then row.slider:SetObeyStepOnDrag(true) end
        row.slider:SetScript("OnValueChanged", function(self, value)
            value = math.floor(value + 0.5)
            row.input:SetText(value)
            if custom.refreshing or not custom.barIndex then return end
            ApplyMoverOption(custom.barIndex, key, value)
            if key == "count" then
                local columnsRow = custom.rows[4]
                columnsRow.slider:SetMinMaxValues(1, value)
                columnsRow.slider:SetValue(
                    GetMoverOptionValue(custom.barIndex, "columns"))
            end
        end)
        row.input:SetScript("OnEnterPressed", function(self)
            local value = math.max(minimum, math.min(maximum, self:GetNumber()))
            value = math.floor((value - minimum) / step + 0.5) * step + minimum
            self:ClearFocus()
            row.slider:SetValue(value)
            self:SetText(value)
        end)
        row.input:SetScript("OnEscapePressed", function(self)
            self:ClearFocus()
            self:SetText(GetMoverOptionValue(custom.barIndex, key))
        end)
        custom.rows[order] = row
    end
    function custom:Refresh(barIndex)
        self.barIndex = barIndex
        self.refreshing = true
        self.rows[4].slider:SetMinMaxValues(
            1, GetMoverOptionValue(barIndex, "count"))
        for _, row in ipairs(self.rows) do
            local value = GetMoverOptionValue(barIndex, row.key)
            row.slider:SetValue(value)
            row.input:SetText(value)
        end
        self.refreshing = false
    end
end
function AB.RefreshMoverOptionPanel()
    SetupMoverOptionPanel()
    local container = GW.MoveHudScaleableFrame
    local settingsFrame = container and container.moverSettingsFrame
    local options = settingsFrame and settingsFrame.options
    local custom = options and options.gwPlusActionBarOptions
    if not custom then return end
    local mover = settingsFrame.childMover
    local barIndex = GetMoverBarIndex(mover)
    options.scaleSlider:SetShown(not barIndex and mover and mover.optionScaleable)
    options.heightSlider:SetShown(not barIndex and mover and mover.optionHeight)
    options.movers:ClearAllPoints()
    if barIndex then
        mover.optionScaleable = false
        options.default:SetText(RESET_TO_DEFAULT)
        custom:Show()
        custom:Refresh(barIndex)
        options:SetHeight(275)
        options.movers:SetPoint("TOPLEFT", custom, "BOTTOMLEFT", 0, -5)
        container:SetHeight(385)
        if container.seperator then container.seperator:SetHeight(385) end
    else
        options.default:SetText(RESET_TO_DEFAULT)
        custom:Hide()
        options:SetHeight(175)
        options.movers:SetPoint("TOPLEFT", options.heightSlider, "BOTTOMLEFT", 0, -20)
        container:SetHeight(285)
        if container.seperator then container.seperator:SetHeight(285) end
    end
end
function AB.InitMoverOptions()
    SetupMoverOptionPanel()
    for _, mover in ipairs(GW.MOVABLE_FRAMES or {}) do
        if not mover.gwPlusActionBarOptionHooked then
            mover.gwPlusActionBarOptionHooked = true
            mover:HookScript("OnClick", AB.RefreshMoverOptionPanel)
            if GetMoverBarIndex(mover) then mover.optionScaleable = false end
        end
    end
    AB.EnforceActionBarMoverScales()
    if addonTable.TranslateMoveHud then addonTable.TranslateMoveHud() end
end
