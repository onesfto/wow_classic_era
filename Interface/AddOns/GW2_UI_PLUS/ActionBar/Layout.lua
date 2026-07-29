-- GW2_UI_PLUS 动作条独立布局与显示控制

local _, addonTable = ...

local GW = _G.GW2_ADDON
local AB = addonTable.PlusActionBar
if not GW or not AB then return end

local Layout = {}
addonTable.PlusActionBarLayout = Layout
AB.Layout = Layout

local MULTIBAR_DEFAULT_COLUMNS = {
    [2] = 6,
    [3] = 6,
    [4] = 1,
    [5] = 1,
    [6] = 1,
    [7] = 1,
    [8] = 1,
}

local function Clamp(value, minimum, maximum)
    value = tonumber(value) or minimum
    return math.max(minimum, math.min(maximum, math.floor(value + 0.5)))
end

local function SetFontSize(fontString, size)
    if AB.SetFontStringSize then
        AB.SetFontStringSize(fontString, size)
        return
    end
    local path, _, flags = fontString:GetFont()
    if path then fontString:SetFont(path, size or 12, flags) end
end

local TEXT_POSITIONS = {
    TOPLEFT = {
        point = "TOPLEFT",
        justifyH = "LEFT", justifyV = "TOP",
    },
    TOP = {
        point = "TOP",
        justifyH = "CENTER", justifyV = "TOP",
    },
    TOPRIGHT = {
        point = "TOPRIGHT",
        justifyH = "RIGHT", justifyV = "TOP",
    },
    CENTER = {
        point = "CENTER",
        justifyH = "CENTER", justifyV = "MIDDLE",
    },
    BOTTOMLEFT = {
        point = "BOTTOMLEFT",
        justifyH = "LEFT", justifyV = "BOTTOM",
    },
    BOTTOM = {
        point = "BOTTOM",
        justifyH = "CENTER", justifyV = "BOTTOM",
    },
    BOTTOMRIGHT = {
        point = "BOTTOMRIGHT",
        justifyH = "RIGHT", justifyV = "BOTTOM",
    },
}

local function NormalizeTextPosition(position)
    return TEXT_POSITIONS[position] and position or "TOPRIGHT"
end

-- GW2 UI 在 FixHotKeyPosition、updateMacroName、setActionButtonStyle 三条路径里
-- 都会重设原生文字层的锚点、宽度和对齐，跟它抢同一个对象抢不过（早先的
-- SetPoint 后处理最终都停在 updateMacroName 的 TOPLEFT 上）。改成不抢：原生文字层
-- 透明留在原地，Plus 自己建一层代理文字，位置和字号完全自己说了算，只从原生那边
-- 同步文本内容和显示状态。
local function SyncProxyText(source)
    local proxy = source.gwPlusProxy
    if not proxy then return end
    proxy:SetText(source:GetText() or "")
end

local function SyncProxyShown(source)
    local proxy = source.gwPlusProxy
    if not proxy then return end
    if source.gwPlusUseNative then
        proxy:Hide()
        return
    end
    -- 原生的显隐表示「这个键位有没有文本」（BUTTON_ASSIGNMENTS_USED_ONLY），
    -- Plus 的开关是独立一层门，两者都要满足才显示
    proxy:SetShown(source.gwPlusTextShown ~= false and source:IsShown())
end

local function EnsureTextProxy(source, button, sourceRestorable)
    if source.gwPlusProxy then return source.gwPlusProxy end
    if not button.CreateFontString then return end

    local proxy = button:CreateFontString(nil, "OVERLAY")
    if proxy.SetWordWrap then proxy:SetWordWrap(false) end
    if proxy.SetNonSpaceWrap then proxy:SetNonSpaceWrap(false) end
    local path, size, flags = source:GetFont()
    if path then proxy:SetFont(path, size or 12, flags) end
    proxy:SetTextColor(source:GetTextColor())
    proxy:SetText(source:GetText() or "")

    source.gwPlusProxy = proxy
    source:SetAlpha(0)

    if hooksecurefunc then
        hooksecurefunc(source, "SetText", SyncProxyText)
        if source.SetFormattedText then
            hooksecurefunc(source, "SetFormattedText", SyncProxyText)
        end
        hooksecurefunc(source, "Show", SyncProxyShown)
        hooksecurefunc(source, "Hide", SyncProxyShown)
        if not sourceRestorable then
            -- 宏名称的显隐本体用的是 alpha，别让它把原生层显出来
            hooksecurefunc(source, "SetAlpha", function(self)
                if self:GetAlpha() ~= 0 then self:SetAlpha(0) end
            end)
        end
    end

    return proxy
end

local function ApplyProxyTextPosition(fontString, button, position, x, y,
                                      size, shown, sourceRestorable)
    if not fontString or not button then return end
    local proxy = EnsureTextProxy(fontString, button, sourceRestorable)
    if not proxy then return end

    local key = NormalizeTextPosition(position)
    local alignment = TEXT_POSITIONS[key]
    fontString.gwPlusTextPosition = key
    fontString.gwPlusTextX, fontString.gwPlusTextY = x or 0, y or 0
    if shown ~= nil then fontString.gwPlusTextShown = shown end
    if size then SetFontSize(proxy, size) end

    -- 单锚点、不限宽：X=0/Y=0 就是所选锚点的准确位置，文字从那里向按钮内侧展开
    proxy:ClearAllPoints()
    proxy:SetPoint(alignment.point, button, alignment.point,
        tonumber(x) or 0, tonumber(y) or 0)
    if proxy.SetJustifyH then proxy:SetJustifyH(alignment.justifyH) end
    if proxy.SetJustifyV then proxy:SetJustifyV(alignment.justifyV) end

    SyncProxyText(fontString)
    SyncProxyShown(fontString)
    return proxy
end

function Layout.ApplyTextPosition(fontString, button, position, x, y, size, shown)
    return ApplyProxyTextPosition(fontString, button, position, x, y,
        size, shown, false)
end

local function ProtectMainHotkeyBackground(fontString, button)
    local background = button.hkBg and button.hkBg.texture
    if not background then return end
    if not background.gwPlusVisibilityHooked and hooksecurefunc then
        background.gwPlusVisibilityHooked = true
        hooksecurefunc(background, "Show", function(self)
            if fontString.gwPlusTextPosition ~= "BOTTOM" then self:Hide() end
        end)
    end
    return background
end

function Layout.ApplyMainHotkey(fontString, button, position, x, y, size, shown)
    if not fontString or not button then return end
    local key = NormalizeTextPosition(position)
    fontString.gwPlusTextPosition = key
    fontString.gwPlusUseNative = key == "BOTTOM"
    local background = ProtectMainHotkeyBackground(fontString, button)

    if key == "BOTTOM" then
        if fontString.gwPlusProxy then fontString.gwPlusProxy:Hide() end
        fontString:SetAlpha(1)
        if GW.updateHotkey then GW.updateHotkey(button) end
        if GW.FixHotKeyPosition then
            GW.FixHotKeyPosition(button, false, false, true)
        end
        if shown == false then
            fontString:Hide()
            if background then background:Hide() end
        end
        return
    end

    ApplyProxyTextPosition(fontString, button, key, x, y, size, shown, true)
    fontString:SetAlpha(0)
    if background then background:Hide() end
end

Layout.ApplyHotkeyPosition = Layout.ApplyTextPosition

local function FormatHotkeyPoints(fontString)
    if not fontString.GetNumPoints or not fontString.GetPoint then return "无法读取" end
    local points = {}
    for index = 1, fontString:GetNumPoints() do
        local point, _, relativePoint, x, y = fontString:GetPoint(index)
        points[#points + 1] = string.format("%s>%s(%.1f,%.1f)",
            tostring(point), tostring(relativePoint), tonumber(x) or 0, tonumber(y) or 0)
    end
    return #points > 0 and table.concat(points, ",") or "无"
end

local function PrintTextState(notice, label, storedPosition, button, regionKey)
    local fontString = button and button[regionKey or "HotKey"]
    if not fontString then
        notice(string.format("  %s：存档=%s，文字对象不存在",
            label, tostring(storedPosition)))
        return
    end

    local proxy = fontString.gwPlusProxy
    if not proxy then
        notice(string.format("  %s：存档=%s 应用=%s，代理文字层未创建",
            label, tostring(storedPosition),
            tostring(fontString.gwPlusTextPosition)))
        return
    end

    local justifyH = proxy.GetJustifyH and proxy:GetJustifyH() or "无法读取"
    local justifyV = proxy.GetJustifyV and proxy:GetJustifyV() or "无法读取"
    local _, size = proxy:GetFont()
    notice(string.format(
        "  %s：存档=%s 应用=%s 对齐=%s/%s 字号=%.0f 文本=%q 显示=%s 锚点=%s",
        label, tostring(storedPosition),
        tostring(fontString.gwPlusTextPosition),
        tostring(justifyH), tostring(justifyV), tonumber(size) or -1,
        tostring(proxy:GetText() or ""), tostring(proxy:IsShown()),
        FormatHotkeyPoints(proxy)))
end

function Layout.PrintHotkeyDiagnostics()
    local notice = GW.Notice or function(message)
        DEFAULT_CHAT_FRAME:AddMessage(message)
    end
    local db = AB.InitDB()

    notice("动作条文字位置诊断：")
    local mainFrame = _G.MainActionBar
    local mainButton = mainFrame and mainFrame.gw_Buttons and mainFrame.gw_Buttons[1]
    PrintTextState(notice, "主动作条快捷键", db.mainBarHotkeyPosition, mainButton)
    PrintTextState(notice, "主动作条宏名称", db.mainBarMacroPosition, mainButton, "Name")
    for index = 2, 8 do
        local info = AB.MULTIBARS[index]
        local frame = info and _G[info.frame]
        local button = frame and frame.gw_Buttons and frame.gw_Buttons[1]
        PrintTextState(notice, "动作条 " .. index .. " 快捷键",
            db["bar" .. index .. "HotkeyPosition"], button)
        PrintTextState(notice, "动作条 " .. index .. " 宏名称",
            db["bar" .. index .. "MacroPosition"], button, "Name")
    end

    local stance = _G.GwStanceBar
    PrintTextState(notice, "姿态条快捷键", db.stanceBarHotkeyPosition,
        stance and stance.buttons and stance.buttons[1])
    local pet = _G.GwPlayerPetFrame
    PrintTextState(notice, "宠物动作条快捷键", db.petBarHotkeyPosition,
        pet and pet.buttons and pet.buttons[1])
end

function Layout.ClampGrid(buttonCount, columns, maximum)
    buttonCount = Clamp(buttonCount, 1, maximum or 12)
    columns = Clamp(columns, 1, buttonCount)
    return columns, math.ceil(buttonCount / columns), buttonCount
end

function Layout.CalculateGrid(buttonCount, columns, size, spacing, invert)
    columns, _, buttonCount = Layout.ClampGrid(buttonCount, columns, buttonCount)
    size = tonumber(size) or 1
    spacing = tonumber(spacing) or 0

    local points = {}
    for slot = 1, buttonCount do
        local row = math.floor((slot - 1) / columns)
        local column = (slot - 1) % columns
        points[slot] = {
            buttonIndex = invert and (buttonCount - slot + 1) or slot,
            x = column * (size + spacing),
            y = row * (size + spacing),
        }
    end

    local usedColumns = math.min(columns, buttonCount)
    local rows = math.ceil(buttonCount / columns)
    local width = usedColumns * size + math.max(usedColumns - 1, 0) * spacing
    local height = rows * size + math.max(rows - 1, 0) * spacing
    return points, width, height
end

local originalInitDB = AB.InitDB

local function EnsureValue(db, key, value)
    if db[key] == nil then db[key] = value end
end

local function GetActionBarTogglesCompat()
    if not GetActionBarToggles then return {} end
    return {GetActionBarToggles()}
end

local function EnsureLayoutDefaults(db)
    local toggles = GetActionBarTogglesCompat()
    local stanceShown = not GW.settings or not GW.settings.StanceBar
        or GW.settings.StanceBar.enabled ~= false
    EnsureValue(db, "mainBarShown", true)
    EnsureValue(db, "stanceBarShown", stanceShown)
    EnsureValue(db, "petBarShown", true)
    EnsureValue(db, "stanceBarCount", 10)
    EnsureValue(db, "stanceBarColumns", 1)
    EnsureValue(db, "stanceBarShowHotkey", true)
    EnsureValue(db, "stanceBarHotkeyPosition", "TOPRIGHT")
    EnsureValue(db, "stanceBarHotkeyX", 0)
    EnsureValue(db, "stanceBarHotkeyY", 0)
    EnsureValue(db, "stanceBarHotkeySize", 12)
    EnsureValue(db, "petBarCount", NUM_PET_ACTION_SLOTS or 10)
    EnsureValue(db, "petBarColumns", 5)
    EnsureValue(db, "petBarSize", 36)
    EnsureValue(db, "petBarSpacing", 3)
    EnsureValue(db, "petBarShowHotkey", true)
    EnsureValue(db, "petBarHotkeyPosition", "TOPRIGHT")
    EnsureValue(db, "petBarHotkeyX", 0)
    EnsureValue(db, "petBarHotkeyY", 0)
    EnsureValue(db, "petBarHotkeySize", 12)

    for index = 2, 8 do
        local prefix = "bar" .. index
        local info = AB.MULTIBARS[index]
        local native = info and GW.settings and GW.settings[info.setting]
        local shownByDefault = index <= 5
            and (not GetActionBarToggles or toggles[index - 1] == true)
        EnsureValue(db, prefix .. "Shown", shownByDefault)
        EnsureValue(db, prefix .. "Count", 12)
        EnsureValue(db, prefix .. "Columns",
            native and native.ButtonsPerRow or MULTIBAR_DEFAULT_COLUMNS[index])
        EnsureValue(db, prefix .. "Spacing",
            GW.settings and GW.settings.MULTIBAR_MARGIIN or 2)
        EnsureValue(db, prefix .. "ShowHotkey",
            not GW.settings or GW.settings.BUTTON_ASSIGNMENTS ~= false)
        EnsureValue(db, prefix .. "HotkeyPosition", "TOPLEFT")
        EnsureValue(db, prefix .. "HotkeyX", 0)
        EnsureValue(db, prefix .. "HotkeyY", 0)
        EnsureValue(db, prefix .. "HotkeySize", 12)
        EnsureValue(db, prefix .. "ShowMacro",
            GW.settings and GW.settings.SHOWACTIONBAR_MACRO_NAME_ENABLED == true or false)
        EnsureValue(db, prefix .. "MacroPosition", "BOTTOM")
        EnsureValue(db, prefix .. "MacroX", 0)
        EnsureValue(db, prefix .. "MacroY", 0)
        EnsureValue(db, prefix .. "MacroSize", 12)
    end

    return db
end

function AB.InitDB()
    return EnsureLayoutDefaults(originalInitDB())
end

function AB.IsBarShown(barKey)
    local db = AB.InitDB()
    if barKey == "bar1" then return db.mainBarShown ~= false end
    if barKey == "stance" then return db.stanceBarShown ~= false end
    if barKey == "pet" then return db.petBarShown ~= false end
    if barKey == "mage" then return db.mageBarEnable ~= false end
    local index = tonumber(type(barKey) == "string" and barKey:match("^bar(%d+)$"))
    return index and db["bar" .. index .. "Shown"] ~= false or false
end

function AB.IsBarActive(barKey)
    if not AB.IsBarShown(barKey) then return false end

    local frame
    if barKey == "bar1" then
        frame = _G.MainActionBar
    elseif barKey == "stance" then
        frame = _G.GwStanceBar
    elseif barKey == "pet" then
        frame = _G.GwPlusPetBarHolder or _G.GwPlayerPetFrame
    elseif barKey == "mage" then
        frame = _G.GwPlusMageBar
    else
        local index = tonumber(type(barKey) == "string"
            and barKey:match("^bar(%d+)$"))
        local info = index and AB.MULTIBARS[index]
        frame = info and _G[info.frame]
    end

    return frame ~= nil and (not frame.IsShown or frame:IsShown())
end

local function ApplyText(button, prefix, db)
    if button.HotKey then
        Layout.ApplyTextPosition(button.HotKey, button,
            db[prefix .. "HotkeyPosition"],
            db[prefix .. "HotkeyX"] or 0, db[prefix .. "HotkeyY"] or 0,
            db[prefix .. "HotkeySize"],
            db[prefix .. "ShowHotkey"] ~= false)
    end
    if button.Name then
        -- 关掉本体的宏名称分支：它会对原生文字层做 SetPoint + SetWidth(按钮宽度)
        -- + SetFont，这几步是「开宏名称按钮变大」的来源。文本本身由暴雪的
        -- ActionButton 更新流程写入，我们只从那里同步到代理层。
        button.showMacroName = false
        Layout.ApplyTextPosition(button.Name, button,
            db[prefix .. "MacroPosition"],
            db[prefix .. "MacroX"] or 0, db[prefix .. "MacroY"] or 0,
            db[prefix .. "MacroSize"],
            db[prefix .. "ShowMacro"] == true)
    end
end

local applyingMultibars = false

function Layout.ApplyMultiBarText(index)
    local info = AB.MULTIBARS[index]
    local frame = info and _G[info.frame]
    if not frame or not frame.gw_Buttons then return end
    local db = AB.InitDB()
    local prefix = "bar" .. index
    local count = Clamp(db[prefix .. "Count"], 1, 12)
    for buttonIndex = 1, count do
        local button = frame.gw_Buttons[buttonIndex]
        if button then ApplyText(button, prefix, db) end
    end
end

function Layout.ApplyMultiBar(index)
    if AB.QueueOutOfCombat("actionBarMultiLayout" .. tostring(index),
        function() Layout.ApplyMultiBar(index) end) then return end
    local info = AB.MULTIBARS[index]
    local frame = info and _G[info.frame]
    if not frame or not frame.gw_Buttons then return end

    local db = AB.InitDB()
    local prefix = "bar" .. index
    local shown = db[prefix .. "Shown"] ~= false
    local count = Clamp(db[prefix .. "Count"], 1, 12)
    local columns = Clamp(db[prefix .. "Columns"], 1, count)
    local spacing = tonumber(db[prefix .. "Spacing"]) or 2
    local size = AB.GetMultiBarSize(index) or 36
    local native = GW.settings and GW.settings[info.setting]
    local invert = native and native.invert == true
    local points, width, height = Layout.CalculateGrid(count, columns, size, spacing, invert)

    db[prefix .. "Count"] = count
    db[prefix .. "Columns"] = columns
    if native then native.ButtonsPerRow = columns end

    applyingMultibars = true
    for buttonIndex = 1, 12 do
        local button = frame.gw_Buttons[buttonIndex]
        if button then
            button:SetShown(shown and buttonIndex <= count)
            if buttonIndex <= count then
                local slot
                for _, point in ipairs(points) do
                    if point.buttonIndex == buttonIndex then slot = point break end
                end
                if slot then
                    button:SetSize(size, size)
                    button.gwX, button.gwY = slot.x, slot.y
                    button:ClearAllPoints()
                    button:SetPoint("TOPLEFT", frame, "TOPLEFT", slot.x, -slot.y)
                end
                ApplyText(button, prefix, db)
            end
        end
    end
    frame:SetSize(width, height)
    if frame.gwMover then frame.gwMover:SetSize(width, height) end
    frame.gw_IsEnabled = shown
    frame:SetShown(shown)
    applyingMultibars = false
end

-- SetActionBarToggles 被本体 hook 了：LoadActionBars 里
-- hooksecurefunc("SetActionBarToggles", function() C_Timer.After(1, trackBarChanges) end)，
-- 而 trackBarChanges 会走到 UpdateMultibarButtons，我们又 hook 了它去调
-- ApplyMultiBars——无条件调用就成了回环，每次都把 2–8 条整体重排一遍。
-- 所以只在开关状态真的和游戏当前值不一致时才调。
local function SyncActionBarToggles(db)
    if not SetActionBarToggles then return end

    local current = GetActionBarTogglesCompat()
    local toggles, changed = {}, false
    for index = 2, 8 do
        local wanted = db["bar" .. index .. "Shown"] ~= false
        toggles[index - 1] = wanted
        if (current[index - 1] == true) ~= wanted then changed = true end
    end
    if changed then SetActionBarToggles(unpack(toggles)) end
end

function Layout.ApplyMultiBars()
    if AB.QueueOutOfCombat("actionBarMultiLayout", Layout.ApplyMultiBars) then return end
    SyncActionBarToggles(AB.InitDB())
    for index = 2, 8 do Layout.ApplyMultiBar(index) end
end

local function ApplySimpleHotkey(button, show, position, x, y, size)
    if not button or not button.HotKey then return end
    Layout.ApplyTextPosition(button.HotKey, button, position, x, y, size, show)
end

function Layout.ApplyStanceBar()
    if AB.QueueOutOfCombat("actionBarStanceLayout", Layout.ApplyStanceBar) then return end
    local frame = _G.GwStanceBar
    if not frame or not frame.buttons then return end
    local db = AB.InitDB()
    local available = GetNumShapeshiftForms and GetNumShapeshiftForms() or #frame.buttons
    local count = math.min(Clamp(db.stanceBarCount, 1, 10), available)
    local size = GW.settings and GW.settings.StanceBar and GW.settings.StanceBar.buttonSize or 36
    local spacing = GW.settings and GW.settings.StanceBar and GW.settings.StanceBar.spacing or 2
    local points, width, height = Layout.CalculateGrid(math.max(count, 1),
        db.stanceBarColumns, size, spacing)
    local holder = count == 1 and frame or (frame.container or frame)
    local direction = GW.settings and GW.settings.StanceBar
        and GW.settings.StanceBar.growDirection or "UP"

    for index, button in ipairs(frame.buttons) do
        local visible = db.stanceBarShown ~= false and index <= count
        button:SetShown(visible)
        if visible then
            local point = points[index]
            button:SetParent(holder)
            button:SetSize(size, size)
            button:ClearAllPoints()
            if direction == "UP" then
                button:SetPoint("BOTTOMLEFT", holder, "BOTTOMLEFT", point.x, point.y)
            elseif direction == "LEFT" then
                button:SetPoint("TOPRIGHT", holder, "TOPRIGHT", -point.x, -point.y)
            else
                button:SetPoint("TOPLEFT", holder, "TOPLEFT", point.x, -point.y)
            end
            ApplySimpleHotkey(button, db.stanceBarShowHotkey ~= false,
                db.stanceBarHotkeyPosition,
                db.stanceBarHotkeyX, db.stanceBarHotkeyY,
                db.stanceBarHotkeySize)
        end
    end
    holder:SetSize(width, height)
    if holder == frame.container then
        frame.container:SetShown(frame.containerState == "open"
            or not GW.settings or not GW.settings.StanceBar
            or GW.settings.StanceBar.containerState == "open")
    end
    frame:SetShown(db.stanceBarShown ~= false and count > 0)
end

function Layout.ApplyPetBar()
    if AB.QueueOutOfCombat("actionBarPetLayout", Layout.ApplyPetBar) then return end
    local petFrame = _G.GwPlayerPetFrame
    if not petFrame or not petFrame.buttons then return end
    local db = AB.InitDB()
    local maximum = NUM_PET_ACTION_SLOTS or 10
    local count = Clamp(db.petBarCount, 1, maximum)
    local columns = Clamp(db.petBarColumns, 1, count)
    local spacing = tonumber(db.petBarSpacing) or 3
    local size = Clamp(db.petBarSize, AB.SIZE_MIN, AB.SIZE_MAX)
    local points = Layout.CalculateGrid(count, columns, size, spacing)
    db.petBarSize = size

    for index, button in ipairs(petFrame.buttons) do
        local visible = db.petBarShown ~= false and index <= count
        button:SetShown(visible)
        if visible then
            local point = points[index]
            if not button.GetWidth or math.abs(button:GetWidth() - size) > 0.5 then
                button:SetSize(size, size)
                if GW.setActionButtonStyle and button.GetName and button:GetName() then
                    GW.setActionButtonStyle(button:GetName(), false, false, true)
                end
            end
            button:ClearAllPoints()
            button:SetPoint("BOTTOMLEFT", petFrame, "BOTTOMLEFT", 3 + point.x, 30 + point.y)
            button.relativeFrame = petFrame
            button.point = "BOTTOMLEFT"
            button.relativePoint = "BOTTOMLEFT"
            button.gwX = 3 + point.x
            button.gwY = 30 + point.y
            ApplySimpleHotkey(button, db.petBarShowHotkey ~= false,
                db.petBarHotkeyPosition,
                db.petBarHotkeyX, db.petBarHotkeyY,
                db.petBarHotkeySize)
        end
    end
end

function Layout.ApplyVisibility()
    if AB.QueueOutOfCombat("actionBarVisibility", Layout.ApplyVisibility) then return end
    local db = AB.InitDB()
    if _G.MainActionBar then _G.MainActionBar:SetShown(db.mainBarShown ~= false) end

    if GW.settings and GW.settings.StanceBar then
        GW.settings.StanceBar.enabled = db.stanceBarShown ~= false
    end
    Layout.ApplyMultiBars()
    Layout.ApplyStanceBar()
    Layout.ApplyPetBar()
    if addonTable.PlusMageBar then addonTable.PlusMageBar.Toggle() end
    if addonTable.PlusFader then addonTable.PlusFader.Refresh() end
end

function Layout.NormalizeNativeFaders()
    if not GW.settings then return end
    for index = 1, 8 do
        GW.settings["FADE_MULTIACTIONBAR_" .. index] = "ALWAYS"
    end
    if GW.settings.StanceBar then
        GW.settings.StanceBar.alpha = 1
        GW.settings.StanceBar.mouseOver = false
    end
end

function Layout.RefreshAll()
    Layout.NormalizeNativeFaders()
    AB.ApplyMainBarLayout()
    Layout.ApplyVisibility()
end

function Layout.Init()
    AB.InitDB()
    Layout.RefreshAll()

    if GW.UpdateMultibarButtons and not Layout.multibarHooked then
        Layout.multibarHooked = true
        hooksecurefunc(GW, "UpdateMultibarButtons", function()
            if not applyingMultibars then Layout.ApplyMultiBars() end
        end)
    end
    if _G.GwStanceBar and _G.GwStanceBar.AdjustMaxStanceButtons then
        hooksecurefunc(_G.GwStanceBar, "AdjustMaxStanceButtons", Layout.ApplyStanceBar)
    end
    if _G.GwPlayerPetFrame and _G.GwPlayerPetFrame.SetActionButtonPositionAndStyle then
        hooksecurefunc(_G.GwPlayerPetFrame, "SetActionButtonPositionAndStyle", Layout.ApplyPetBar)
    end

    if not Layout.bindingWatcher then
        Layout.bindingWatcher = CreateFrame("Frame")
        Layout.bindingWatcher:RegisterEvent("UPDATE_BINDINGS")
        Layout.bindingWatcher:SetScript("OnEvent", function()
            AB.ApplyMainBarLayout()
            Layout.ApplyMultiBars()
            Layout.ApplyStanceBar()
            Layout.ApplyPetBar()
        end)
    end
end
