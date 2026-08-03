local _, addonTable = ...
-- 注意：不在顶层检查 GW2_ADDON，函数内延迟获取依赖

local AB = addonTable.PlusActionBar
if not AB then return end

local GLOBE_BASE_SCALE = 1.1

function AB.GetMultiBarSize(index)
    local GW = _G.GW2_ADDON
    if not GW then return end
    local info = AB.MULTIBARS and AB.MULTIBARS[index]
    if not info then return end
    local settings = GW.settings and GW.settings[info.setting]
    return settings and settings.size or 36
end

function AB.SetMultiBarSize(index, size)
    local GW = _G.GW2_ADDON
    if not GW or not GW.settings then return end
    local info = AB.MULTIBARS and AB.MULTIBARS[index]
    if not info then return end
    local settings = GW.settings[info.setting]
    settings.size = size
    GW.settings[info.setting] = settings
end

local function SyncMultiBarButtonSizes()
    local GW = _G.GW2_ADDON
    if not GW or not AB.MULTIBARS then return end
    for index, info in pairs(AB.MULTIBARS) do
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
    local GW = _G.GW2_ADDON
    if not GW then return end
    if AB.QueueOutOfCombat("multibarSize", AB.ApplyMultiBarSizes) then return end
    SyncMultiBarButtonSizes()
    if GW.UpdateMultibarButtons and _G.MainActionBar and _G.MainActionBar.gw_Bar1 then
        GW.UpdateMultibarButtons()
    end
end
local function GetGlobeGap(bar)
    local GW = _G.GW2_ADDON
    local gap = AB.InitDB().mainBarGlobeGap
    if not gap or gap == 0 then return 0 end
    if GW and GW.settings and GW.settings.PLAYER_AS_TARGET_FRAME then
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
    local db = AB.InitDB()
    for i = 1, math.min(db.mainBarCount or 12, 12) do
        local btn = bar.gw_Buttons[i]
        if btn then ApplyMainButtonText(btn, db, layout) end
    end
end
function AB.ApplyMainBarLayout()
    local GW = _G.GW2_ADDON
    local bar = _G.MainActionBar
    if not bar or not bar.gw_Buttons or not GW or not GW.settings then return end
    if AB.QueueOutOfCombat("mainBarLayout", AB.ApplyMainBarLayout) then return end
    local db = AB.InitDB()
    local size = db.mainBarSize
    local margin = GW.settings.MAINBAR_MARGIIN or 5
    local gap = GetGlobeGap(bar)
    local yOfs = GW.settings.XPBAR_ENABLED and 0 or -14
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
    local GW = _G.GW2_ADDON
    local hg = _G.GW2_PlayerFrame
    if not hg or not GW then return end
    local db = AB.InitDB()
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
    if not AB.MULTIBARS then return end
    for index, info in pairs(AB.MULTIBARS) do
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
    local GW = _G.GW2_ADDON
    if not GW then return end
    local db = AB.InitDB()
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
    local GW = _G.GW2_ADDON
    local db = AB.InitDB()
    if barIndex == 1 then
        if key == "size" then return db.mainBarSize end
        if key == "spacing" then
            return GW and GW.settings and GW.settings.MAINBAR_MARGIIN or 5
        end
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
    local GW = _G.GW2_ADDON
    if not GW then return end
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
    local GW = _G.GW2_ADDON
    if not GW then return end
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
        options.default:SetText("恢复默认")
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
    local GW = _G.GW2_ADDON
    if not GW then return end
    SetupMoverOptionPanel()
    for _, mover in ipairs(GW.MOVABLE_FRAMES or {}) do
        if not mover.gwPlusActionBarOptionHooked then
            mover.gwPlusActionBarOptionHooked = true
            mover:HookScript("OnClick", AB.RefreshMoverOptionPanel)
            if GetMoverBarIndex(mover) then mover.optionScaleable = false end
        end
    end
    if addonTable.TranslateMoveHud then addonTable.TranslateMoveHud() end
end
function AB.IsNormalPlayerFrameEnabled()
    return AB.InitDB().normalPlayerFrameEnabled ~= false
end
function AB.SetNormalPlayerFrameEnabled(value)
    AB.InitDB().normalPlayerFrameEnabled = value == true
end
function AB.InstallTotemBarSingletonGuard()
    local GW = _G.GW2_ADDON
    if not GW or not GW.CreateTotemBar
        or GW.CreateTotemBar_GW2Plus then
        return
    end
    local createTotemBar = GW.CreateTotemBar
    GW.CreateTotemBar = function(...)
        if _G.GwTotemBar then return _G.GwTotemBar end
        createTotemBar(...)
        return _G.GwTotemBar
    end
    GW.CreateTotemBar_GW2Plus = true
end
function AB.IsGlobeStyleEnabled()
    local GW = _G.GW2_ADDON
    if not GW then return false end
    return GW.settings and not GW.settings.PLAYER_AS_TARGET_FRAME
end
function AB.SyncPlayerHudEnabled()
    local GW = _G.GW2_ADDON
    if not GW or not GW.settings then return end
    GW.settings.HEALTHGLOBE_ENABLED =
        AB.IsNormalPlayerFrameEnabled()
        or AB.IsGlobeStyleEnabled()
end
function AB.SetGlobeStyleEnabled(value)
    local GW = _G.GW2_ADDON
    if not GW or not GW.settings then return end
    GW.settings.PLAYER_AS_TARGET_FRAME = not value
    AB.SyncPlayerHudEnabled()
    if GW.updateSettingsFrameSettingsValue then
        GW.updateSettingsFrameSettingsValue(
            "PLAYER_AS_TARGET_FRAME", not value, false)
        GW.updateSettingsFrameSettingsValue(
            "HEALTHGLOBE_ENABLED",
            GW.settings.HEALTHGLOBE_ENABLED, false)
    end
end
function AB.ApplyNormalPlayerFrameVisibility()
    local GW = _G.GW2_ADDON
    if not GW then return end
    if AB.QueueOutOfCombat(
        "normalPlayerFrame", AB.ApplyNormalPlayerFrameVisibility) then
        return
    end
    local enabled = AB.IsNormalPlayerFrameEnabled()
    local frame = _G.GwPlayerUnitFrame
    if enabled and not frame and GW.LoadPlayerFrame then
        frame = GW.LoadPlayerFrame()
        if (GW.Classic or GW.TBC or GW.Wrath)
            and GW.settings.PLAYER_ENERGY_MANA_TICK
            and GW.Load5SR then
            GW.Load5SR(frame)
        end
    end
    if not frame then return end
    if enabled then
        RegisterUnitWatch(frame)
    else
        UnregisterUnitWatch(frame)
        frame:Hide()
    end
end
function AB.EnsureNormalPlayerFrame()
    local GW = _G.GW2_ADDON
    if not GW then return end
    if AB.IsNormalPlayerFrameEnabled()
        and AB.IsGlobeStyleEnabled()
        and not _G.GwPlayerUnitFrame
        and GW.LoadPlayerFrame then
        local frame = GW.LoadPlayerFrame()
        if (GW.Classic or GW.TBC or GW.Wrath)
            and GW.settings.PLAYER_ENERGY_MANA_TICK
            and GW.Load5SR then
            GW.Load5SR(frame)
        end
    end
    AB.ApplyNormalPlayerFrameVisibility()
end
AB.SyncPlayerHudEnabled()
