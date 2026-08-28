local _, addonTable = ...
-- 注意：不在顶层检查 GW2_ADDON，函数内延迟获取依赖

local AB = addonTable.PlusActionBar
if not AB then return end

local GLOBE_BASE_SCALE = 1.1
local CASTBAR_NATIVE_WIDTH = 176
local CASTBAR_START_EVENTS = {
    UNIT_SPELLCAST_START = true,
    UNIT_SPELLCAST_CHANNEL_START = true,
    UNIT_SPELLCAST_CHANNEL_UPDATE = true,
    UNIT_SPELLCAST_EMPOWER_START = true,
    UNIT_SPELLCAST_EMPOWER_UPDATE = true,
    UNIT_SPELLCAST_DELAYED = true,
}
local castbarEventHookInstalled = false
local castbarFinishHookInstalled = false

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
local function GetCastbarSize()
    local db = AB.InitDB()
    return db.castbarWidth or AB.defaults.castbarWidth,
        db.castbarHeight or AB.defaults.castbarHeight
end

local function SyncCastbarVisualSize(castbar, event)
    if not castbar or castbar ~= _G.GwCastingBarPlayer then return end
    local width, height = GetCastbarSize()
    local progress = castbar.progress
    if progress then
        progress:SetSize(width, height)
        if progress.internalBar then
            progress.internalBar:SetSize(width, height)
        end
        if progress.GetFillAmount and progress.ForceFillAmount then
            local fillAmount = progress:GetFillAmount()
            if type(fillAmount) == "number" then
                progress:ForceFillAmount(fillAmount)
            end
        end
    end
    if castbar.highlight then
        castbar.highlight:SetSize(width, height)
    end
    if castbar.latency then
        if CASTBAR_START_EVENTS[event] then
            local nativeWidth = castbar.latency:GetWidth()
            if nativeWidth and nativeWidth > 0 then
                castbar.latency:SetWidth(nativeWidth / CASTBAR_NATIVE_WIDTH * width)
            end
        end
        castbar.latency:SetHeight(height)
    end
end

local function InstallCastbarVisualHooks()
    local castbar = _G.GwCastingBarPlayer
    if castbar and not castbarEventHookInstalled then
        castbarEventHookInstalled = true
        castbar:HookScript("OnEvent", function(frame, event)
            SyncCastbarVisualSize(frame, event)
        end)
    end
    if castbar and not castbarFinishHookInstalled
        and castbar.AddFinishAnimation then
        castbarFinishHookInstalled = true
        hooksecurefunc(castbar, "AddFinishAnimation", function(frame)
            SyncCastbarVisualSize(frame)
        end)
    end
end

function AB.ApplyCastbarSize()
    AB.EnforceCastbarScale()
    InstallCastbarVisualHooks()
    local castbar = _G.GwCastingBarPlayer
    if not castbar then return end
    local width, height = GetCastbarSize()
    castbar:SetSize(width, height)
    SyncCastbarVisualSize(castbar)
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
local MOVER_CONTENT_WIDTH = 220
local MOVER_TITLE_WIDTH = 200
local MOVER_SLIDER_WIDTH = 170
local MOVER_TITLE_HEIGHT = 15
local MOVER_ROW_GAP = 5
local MOVER_ANCHOR_CONTROL_HEIGHT = 25
local MOVER_ANCHOR_COLUMN_GAP = 6
local MOVER_ANCHOR_LABEL_WIDTH = 30
local MOVER_ANCHOR_DROPDOWN_WIDTH = (MOVER_CONTENT_WIDTH
    - (MOVER_ANCHOR_LABEL_WIDTH * 2) - MOVER_ANCHOR_COLUMN_GAP) / 2
local MOVER_ANCHOR_SECOND_COLUMN_X = MOVER_ANCHOR_LABEL_WIDTH
    + MOVER_ANCHOR_DROPDOWN_WIDTH + MOVER_ANCHOR_COLUMN_GAP
local MOVER_ARROW_SIZE = 30
local MOVER_ARROW_STEP = 25
local MOVER_ARROW_START_X = 57
local MOVER_CONTROL_HEIGHT = MOVER_TITLE_HEIGHT
    + (MOVER_ROW_GAP * 3)
    + MOVER_ANCHOR_CONTROL_HEIGHT + MOVER_ARROW_SIZE
local MOVER_PANEL_EXTRA_HEIGHT = MOVER_CONTROL_HEIGHT - 40
local CASTBAR_MOVER_SETTING = "castingbar_pos"
local ENERGY_BAR_MOVER_SETTING = "PowerBar_pos"
local CASTBAR_WIDTH_MIN = 100
local CASTBAR_WIDTH_MAX = 600
local CASTBAR_HEIGHT_MIN = 10
local CASTBAR_HEIGHT_MAX = 100
local ENERGY_BAR_WIDTH_MIN = 100
local ENERGY_BAR_WIDTH_MAX = 600
local ENERGY_BAR_HEIGHT_MIN = 1
local ENERGY_BAR_HEIGHT_MAX = 100
local MOVER_ANCHOR_OPTIONS = {
    {value = "TOPLEFT", label = "左上"},
    {value = "TOP", label = "上"},
    {value = "TOPRIGHT", label = "右上"},
    {value = "LEFT", label = "左"},
    {value = "CENTER", label = "中"},
    {value = "RIGHT", label = "右"},
    {value = "BOTTOMLEFT", label = "左下"},
    {value = "BOTTOM", label = "下"},
    {value = "BOTTOMRIGHT", label = "右下"},
}
local moverAnchorControls
local function GetMoverBarIndex(mover)
    if not mover then return end
    if mover.parent == _G.MainActionBar then return 1 end
    if not AB.MULTIBARS then return end
    for index, info in pairs(AB.MULTIBARS) do
        if mover.parent == _G[info.frame] then return index end
    end
end
local function IsCastbarMover(mover)
    return mover and mover.setting == CASTBAR_MOVER_SETTING
end
local function IsEnergyBarMover(mover)
    return mover and mover.setting == ENERGY_BAR_MOVER_SETTING
end
local function GetCastbarOptionValue(key)
    local db = AB.InitDB()
    return db[key] or AB.defaults[key]
end
local function ApplyCastbarOption(key, value)
    AB.InitDB()[key] = value
    AB.ApplyCastbarSize()
end
local function GetEnergyBarOptionValue(key)
    if addonTable.GetPlayerEnergyBarSize then
        local width, height = addonTable.GetPlayerEnergyBarSize()
        return key == "energyBarWidth" and width or height
    end
    local status = _G.GW2_UI_PLUS_PlayerStatusSV or {}
    return key == "energyBarWidth"
        and (tonumber(status.energyBarWidth) or 300)
        or (tonumber(status.energyBarHeight) or 15)
end
local function ApplyEnergyBarOption(key, value)
    local width = GetEnergyBarOptionValue("energyBarWidth")
    local height = GetEnergyBarOptionValue("energyBarHeight")
    if key == "energyBarWidth" then width = value else height = value end
    if addonTable.SetPlayerEnergyBarSize then
        addonTable.SetPlayerEnergyBarSize(width, height)
        return
    end
    local bar = _G.GwPlayerPowerBar
    if bar then
        bar:SetSize(width, height)
        bar:SetScale(1)
    end
end
local function CreateMoverSlider(parent, label, order)
    local row = CreateFrame("Button", nil, parent)
    row:SetSize(MOVER_CONTENT_WIDTH, 40)
    row:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, -((order - 1) * MOVER_OPTION_HEIGHT))
    row.title = row:CreateFontString(nil, "OVERLAY")
    row.title:SetFont(UNIT_NAME_FONT, 12, "")
    row.title:SetSize(MOVER_TITLE_WIDTH, 12)
    row.title:SetJustifyH("LEFT")
    row.title:SetPoint("LEFT", row, "LEFT", 8, 5)
    row.title:SetText(label)
    row.title:SetTextColor(1, 1, 1)
    row.slider = CreateFrame("Slider", nil, row)
    row.slider:SetOrientation("HORIZONTAL")
    row.slider:SetSize(MOVER_SLIDER_WIDTH, 16)
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
local function GetMoverAnchorValue(mover, key)
    if not mover then return "CENTER" end
    local point, _, relativePoint, x, y = mover:GetPoint()
    local saved = _G.GW2_ADDON and _G.GW2_ADDON.settings
        and _G.GW2_ADDON.settings[mover.setting]
    local defaultPoint = mover.defaultPoint or {}
    if key == "frame" then
        return point or saved and saved.point or defaultPoint.point or "CENTER"
    end
    return relativePoint or saved and saved.relativePoint
        or defaultPoint.relativePoint or "CENTER"
end
local function GetMoverAnchorLabel(value)
    for _, option in ipairs(MOVER_ANCHOR_OPTIONS) do
        if option.value == value then return option.label end
    end
    return tostring(value or "CENTER")
end
local function RefreshMoverAnchorControls()
    local controls = moverAnchorControls
    local settingsFrame = controls and controls.settingsFrame
    local mover = settingsFrame and settingsFrame.childMover
    if not mover then return end
    controls.screen:SetText(
        GetMoverAnchorLabel(GetMoverAnchorValue(mover, "screen")))
    controls.frame:SetText(
        GetMoverAnchorLabel(GetMoverAnchorValue(mover, "frame")))
end
local function ApplyMoverAnchor(key, value)
    local GW = _G.GW2_ADDON
    local controls = moverAnchorControls
    local settingsFrame = controls and controls.settingsFrame
    local mover = settingsFrame and settingsFrame.childMover
    if not GW or not mover or not value then return end
    if InCombatLockdown and InCombatLockdown() then return end

    local point, _, relativePoint, x, y = mover:GetPoint()
    local saved = GW.settings and GW.settings[mover.setting] or {}
    local defaultPoint = mover.defaultPoint or {}
    point = point or saved.point or defaultPoint.point or "CENTER"
    relativePoint = relativePoint or saved.relativePoint
        or defaultPoint.relativePoint or "CENTER"
    x = tonumber(x) or tonumber(saved.xOfs) or 0
    y = tonumber(y) or tonumber(saved.yOfs) or 0
    if key == "screen" then
        relativePoint = value
    else
        point = value
    end

    mover:ClearAllPoints()
    mover:SetPoint(point, UIParent, relativePoint, x, y)
    local onDragStop = mover:GetScript("OnDragStop")
    if onDragStop then onDragStop(mover) end
    RefreshMoverAnchorControls()
    if AB.RefreshMoverOptionPanel then AB.RefreshMoverOptionPanel() end
end
local function SetupMoverAnchorDropdown(parent, labelText, key, x)
    local label = parent:CreateFontString(nil, "OVERLAY")
    label:SetFont(UNIT_NAME_FONT, 12, "")
    label:SetSize(MOVER_ANCHOR_LABEL_WIDTH, MOVER_ANCHOR_CONTROL_HEIGHT)
    label:SetJustifyH("LEFT")
    label:SetJustifyV("MIDDLE")
    if label.SetNonSpaceWrap then label:SetNonSpaceWrap(false) end
    if label.SetWordWrap then label:SetWordWrap(false) end
    label:SetText(labelText)
    label:SetTextColor(1, 1, 1)
    label:SetPoint("TOPLEFT", parent, "TOPLEFT", x,
        -(MOVER_TITLE_HEIGHT + MOVER_ROW_GAP))

    local dropdown = CreateFrame(
        "DropdownButton", nil, parent, "WowStyle1DropdownTemplate")
    dropdown:SetSize(
        MOVER_ANCHOR_DROPDOWN_WIDTH, MOVER_ANCHOR_CONTROL_HEIGHT)
    dropdown:SetPoint("LEFT", label, "RIGHT", 0, 0)
    if dropdown.GwHandleDropDownBox then
        dropdown:GwHandleDropDownBox(
            nil, nil, nil, nil, MOVER_ANCHOR_DROPDOWN_WIDTH)
        dropdown:SetSize(
            MOVER_ANCHOR_DROPDOWN_WIDTH, MOVER_ANCHOR_CONTROL_HEIGHT)
    end
    dropdown:SetupMenu(function(_, rootDescription)
        for _, option in ipairs(MOVER_ANCHOR_OPTIONS) do
            local anchor = option
            local function IsSelected(value)
                local mover = moverAnchorControls
                    and moverAnchorControls.settingsFrame.childMover
                return mover and GetMoverAnchorValue(mover, key) == value
            end
            local function SetSelected(value)
                ApplyMoverAnchor(key, value)
            end
            local radio = rootDescription:CreateRadio(
                anchor.label, IsSelected, SetSelected, anchor.value)
            local GW = _G.GW2_ADDON
            if GW and GW.BlizzardDropdownRadioButtonInitializer then
                radio:AddInitializer(function(button, description, menu)
                    GW.BlizzardDropdownRadioButtonInitializer(
                        button, description, menu, IsSelected, anchor.value)
                end)
            end
        end
    end)
    return dropdown
end
local function SetupMoverAnchorOptions()
    if moverAnchorControls then return end
    local GW = _G.GW2_ADDON
    local container = GW and GW.MoveHudScaleableFrame
    local settingsFrame = container and container.moverSettingsFrame
    local options = settingsFrame and settingsFrame.options
    local movers = options and options.movers
    if not movers then return end

    movers:SetHeight(MOVER_CONTROL_HEIGHT)
    if movers.title then
        movers.title:ClearAllPoints()
        movers.title:SetPoint("TOPLEFT", movers, "TOPLEFT", 0, 0)
        movers.title:SetFont(UNIT_NAME_FONT, 12, "")
        movers.title:SetSize(MOVER_TITLE_WIDTH, MOVER_TITLE_HEIGHT)
        movers.title:Show()
    end
    local arrowPositions = {
        {"left", MOVER_ARROW_START_X},
        {"right", MOVER_ARROW_START_X + MOVER_ARROW_STEP},
        {"up", MOVER_ARROW_START_X + (MOVER_ARROW_STEP * 2)},
        {"down", MOVER_ARROW_START_X + (MOVER_ARROW_STEP * 3)},
    }
    local arrowTop = -(
        MOVER_TITLE_HEIGHT + MOVER_ROW_GAP
        + MOVER_ANCHOR_CONTROL_HEIGHT + MOVER_ROW_GAP)
    for _, info in ipairs(arrowPositions) do
        local key, x = info[1], info[2]
        local button = movers[key]
        if button then
            button:SetSize(MOVER_ARROW_SIZE, MOVER_ARROW_SIZE)
            button:ClearAllPoints()
            button:SetPoint("TOPLEFT", movers, "TOPLEFT", x, arrowTop)
            for _, texture in ipairs({
                button:GetNormalTexture(),
                button:GetPushedTexture(),
                button:GetDisabledTexture(),
                button:GetHighlightTexture(),
            }) do
                if texture then
                    texture:ClearAllPoints()
                    texture:SetSize(MOVER_ARROW_SIZE, MOVER_ARROW_SIZE)
                    texture:SetPoint("CENTER", button, "CENTER")
                end
            end
        end
    end
    if options.default then
        options.default:ClearAllPoints()
        options.default:SetPoint("TOPLEFT", movers, "BOTTOMLEFT", 0, 0)
    end

    local screen = SetupMoverAnchorDropdown(movers, "屏幕", "screen", 0)
    local frame = SetupMoverAnchorDropdown(
        movers, "框体", "frame", MOVER_ANCHOR_SECOND_COLUMN_X)
    moverAnchorControls = {
        settingsFrame = settingsFrame,
        screen = screen,
        frame = frame,
    }

    local function ScheduleRefresh()
        C_Timer.After(0, RefreshMoverAnchorControls)
    end
    for _, key in ipairs({"left", "right", "up", "down"}) do
        local button = movers[key]
        if button then button:HookScript("OnClick", ScheduleRefresh) end
    end
    if options.default then options.default:HookScript("OnClick", ScheduleRefresh) end
    options:HookScript("OnShow", RefreshMoverAnchorControls)
    RefreshMoverAnchorControls()
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
    if not options.gwPlusNativeMoverOptionHooks then
        options.gwPlusNativeMoverOptionHooks = true
        local function HideNativeOption(self)
            local mover = settingsFrame.childMover
            if IsCastbarMover(mover) or IsEnergyBarMover(mover) then
                self:Hide()
            end
        end
        if options.scaleSlider then
            options.scaleSlider:HookScript("OnShow", HideNativeOption)
        end
        if options.heightSlider then
            options.heightSlider:HookScript("OnShow", HideNativeOption)
        end
    end
    local custom = CreateFrame("Frame", nil, options)
    custom:SetSize(MOVER_CONTENT_WIDTH, MOVER_OPTION_HEIGHT * 4)
    custom:SetPoint("TOPLEFT", options, "TOPLEFT", 0, -5)
    custom:Hide()
    options.gwPlusActionBarOptions = custom
    local castbarCustom = CreateFrame("Frame", nil, options)
    castbarCustom:SetSize(MOVER_CONTENT_WIDTH, MOVER_OPTION_HEIGHT * 2)
    castbarCustom:SetPoint("TOPLEFT", options, "TOPLEFT", 0, -5)
    castbarCustom:Hide()
    options.gwPlusCastbarOptions = castbarCustom
    local energyCustom = CreateFrame("Frame", nil, options)
    energyCustom:SetSize(MOVER_CONTENT_WIDTH, MOVER_OPTION_HEIGHT * 2)
    energyCustom:SetPoint("TOPLEFT", options, "TOPLEFT", 0, -5)
    energyCustom:Hide()
    options.gwPlusEnergyOptions = energyCustom
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

    castbarCustom.rows = {}
    local castbarDefinitions = {
        {"castbarWidth", "宽度", CASTBAR_WIDTH_MIN, CASTBAR_WIDTH_MAX},
        {"castbarHeight", "高度", CASTBAR_HEIGHT_MIN, CASTBAR_HEIGHT_MAX},
    }
    for order, definition in ipairs(castbarDefinitions) do
        local key, label, minimum, maximum = unpack(definition)
        local row = CreateMoverSlider(castbarCustom, label, order)
        row.key = key
        row.slider:SetMinMaxValues(minimum, maximum)
        row.slider:SetValueStep(1)
        if row.slider.SetObeyStepOnDrag then
            row.slider:SetObeyStepOnDrag(true)
        end
        row.slider:SetScript("OnValueChanged", function(_, value)
            value = math.floor(value + 0.5)
            row.input:SetText(value)
            if castbarCustom.refreshing or not castbarCustom.selected then
                return
            end
            ApplyCastbarOption(key, value)
        end)
        row.input:SetScript("OnEnterPressed", function(self)
            local value = math.max(minimum, math.min(maximum, self:GetNumber()))
            value = math.floor(value + 0.5)
            self:ClearFocus()
            row.slider:SetValue(value)
            self:SetText(value)
        end)
        row.input:SetScript("OnEscapePressed", function(self)
            self:ClearFocus()
            self:SetText(GetCastbarOptionValue(key))
        end)
        castbarCustom.rows[order] = row
    end
    function castbarCustom:Refresh()
        self.selected = true
        self.refreshing = true
        for _, row in ipairs(self.rows) do
            local value = GetCastbarOptionValue(row.key)
            row.slider:SetValue(value)
            row.input:SetText(value)
        end
        self.refreshing = false
    end

    energyCustom.rows = {}
    local energyDefinitions = {
        {"energyBarWidth", "宽度", ENERGY_BAR_WIDTH_MIN, ENERGY_BAR_WIDTH_MAX},
        {"energyBarHeight", "高度", ENERGY_BAR_HEIGHT_MIN, ENERGY_BAR_HEIGHT_MAX},
    }
    for order, definition in ipairs(energyDefinitions) do
        local key, label, minimum, maximum = unpack(definition)
        local row = CreateMoverSlider(energyCustom, label, order)
        row.key = key
        row.slider:SetMinMaxValues(minimum, maximum)
        row.slider:SetValueStep(1)
        if row.slider.SetObeyStepOnDrag then
            row.slider:SetObeyStepOnDrag(true)
        end
        row.slider:SetScript("OnValueChanged", function(_, value)
            value = math.floor(value + 0.5)
            row.input:SetText(value)
            if energyCustom.refreshing or not energyCustom.selected then
                return
            end
            ApplyEnergyBarOption(key, value)
        end)
        row.input:SetScript("OnEnterPressed", function(self)
            local value = math.max(minimum, math.min(maximum, self:GetNumber()))
            value = math.floor(value + 0.5)
            self:ClearFocus()
            row.slider:SetValue(value)
            self:SetText(value)
        end)
        row.input:SetScript("OnEscapePressed", function(self)
            self:ClearFocus()
            self:SetText(GetEnergyBarOptionValue(key))
        end)
        energyCustom.rows[order] = row
    end
    function energyCustom:Refresh()
        self.selected = true
        self.refreshing = true
        for _, row in ipairs(self.rows) do
            local value = GetEnergyBarOptionValue(row.key)
            row.slider:SetValue(value)
            row.input:SetText(value)
        end
        self.refreshing = false
    end
end
local function SetNativeMoverResetHandler(options, mover)
    if not options or not options.default then return end
    local GW = _G.GW2_ADDON
    local actionBarMover = GetMoverBarIndex(mover)
        or (mover and (mover.setting == "StanceBar_pos"
            or mover.setting == "TotemBar_pos"
            or mover.setting == "MageBar_pos"))
    if actionBarMover then
        options.default:SetScript("OnClick", function()
            if AB.ResetMoverPosition then
                AB.ResetMoverPosition(mover.parent)
            end
            AB.RefreshMoverOptionPanel()
        end)
        return
    end
    if IsEnergyBarMover(mover) then
        options.default:SetScript("OnClick", function()
            local restore = addonTable.RestorePlayerEnergyBarDefaults
            if restore and restore(AB.RefreshMoverOptionPanel) then return end
            if GW.ResetMoverFrameToDefaultValues then
                GW.ResetMoverFrameToDefaultValues(options.default)
            end
        end)
    elseif IsCastbarMover(mover) then
        options.default:SetScript("OnClick", function()
            local restore = addonTable.RestorePlayerCastbarDefaults
            if restore and restore(AB.RefreshMoverOptionPanel) then return end
            if GW.ResetMoverFrameToDefaultValues then
                GW.ResetMoverFrameToDefaultValues(options.default)
            end
        end)
    elseif GW.ResetMoverFrameToDefaultValues then
        options.default:SetScript("OnClick", GW.ResetMoverFrameToDefaultValues)
    end
end
function AB.RefreshMoverOptionPanel()
    local GW = _G.GW2_ADDON
    if not GW then return end
    SetupMoverOptionPanel()
    SetupMoverAnchorOptions()
    local container = GW.MoveHudScaleableFrame
    local settingsFrame = container and container.moverSettingsFrame
    local options = settingsFrame and settingsFrame.options
    local custom = options and options.gwPlusActionBarOptions
    local castbarCustom = options and options.gwPlusCastbarOptions
    local energyCustom = options and options.gwPlusEnergyOptions
    if not custom or not castbarCustom or not energyCustom then return end
    RefreshMoverAnchorControls()
    local mover = settingsFrame.childMover
    local barIndex = GetMoverBarIndex(mover)
    local castbar = IsCastbarMover(mover)
    local energyBar = IsEnergyBarMover(mover)
    options.scaleSlider:SetShown(
        not barIndex and not castbar and not energyBar
            and mover and mover.optionScaleable)
    options.heightSlider:SetShown(
        not barIndex and not castbar and not energyBar
            and mover and mover.optionHeight)
    options.movers:ClearAllPoints()
    if barIndex then
        mover.optionScaleable = false
        SetNativeMoverResetHandler(options, mover)
        options.default:SetText(RESET_TO_DEFAULT)
        custom:Show()
        castbarCustom:Hide()
        energyCustom:Hide()
        custom:Refresh(barIndex)
        options:SetHeight(275 + MOVER_PANEL_EXTRA_HEIGHT)
        options.movers:SetPoint("TOPLEFT", custom, "BOTTOMLEFT", 0, -5)
        container:SetHeight(385 + MOVER_PANEL_EXTRA_HEIGHT)
        if container.seperator then
            container.seperator:SetHeight(385 + MOVER_PANEL_EXTRA_HEIGHT)
        end
    elseif castbar then
        mover.optionScaleable = false
        SetNativeMoverResetHandler(options, mover)
        options.default:SetText(RESET_TO_DEFAULT)
        custom:Hide()
        castbarCustom:Show()
        energyCustom:Hide()
        castbarCustom:Refresh()
        options:SetHeight(185 + MOVER_PANEL_EXTRA_HEIGHT)
        options.movers:SetPoint("TOPLEFT", castbarCustom, "BOTTOMLEFT", 0, -5)
        options.scaleSlider:Hide()
        options.heightSlider:Hide()
        container:SetHeight(295 + MOVER_PANEL_EXTRA_HEIGHT)
        if container.seperator then
            container.seperator:SetHeight(295 + MOVER_PANEL_EXTRA_HEIGHT)
        end
    elseif energyBar then
        mover.optionScaleable = false
        if addonTable.ApplyPlayerEnergyBarScale then
            addonTable.ApplyPlayerEnergyBarScale()
        end
        SetNativeMoverResetHandler(options, mover)
        options.default:SetText(RESET_TO_DEFAULT)
        custom:Hide()
        castbarCustom:Hide()
        energyCustom:Show()
        energyCustom:Refresh()
        options:SetHeight(185 + MOVER_PANEL_EXTRA_HEIGHT)
        options.movers:SetPoint("TOPLEFT", energyCustom, "BOTTOMLEFT", 0, -5)
        options.scaleSlider:Hide()
        options.heightSlider:Hide()
        container:SetHeight(295 + MOVER_PANEL_EXTRA_HEIGHT)
        if container.seperator then
            container.seperator:SetHeight(295 + MOVER_PANEL_EXTRA_HEIGHT)
        end
    else
        SetNativeMoverResetHandler(options, mover)
        options.default:SetText(RESET_TO_DEFAULT)
        custom:Hide()
        castbarCustom:Hide()
        energyCustom:Hide()
        options:SetHeight(175 + MOVER_PANEL_EXTRA_HEIGHT)
        options.movers:SetPoint("TOPLEFT", options.heightSlider, "BOTTOMLEFT", 0, -20)
        container:SetHeight(285 + MOVER_PANEL_EXTRA_HEIGHT)
        if container.seperator then
            container.seperator:SetHeight(285 + MOVER_PANEL_EXTRA_HEIGHT)
        end
    end
end
function AB.InitMoverOptions()
    local GW = _G.GW2_ADDON
    if not GW then return end
    SetupMoverOptionPanel()
    SetupMoverAnchorOptions()
    for _, mover in ipairs(GW.MOVABLE_FRAMES or {}) do
        if not mover.gwPlusActionBarOptionHooked then
            mover.gwPlusActionBarOptionHooked = true
            mover:HookScript("OnClick", AB.RefreshMoverOptionPanel)
            if GetMoverBarIndex(mover) or IsEnergyBarMover(mover) then
                mover.optionScaleable = false
            end
        end
    end
    if AB.EnforceActionBarMoverScales then
        AB.EnforceActionBarMoverScales()
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
