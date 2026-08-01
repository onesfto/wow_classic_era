local _, addonTable = ...
local Skin = addonTable.Skin
if not Skin then return end
local GW = _G.GW2_ADDON
local MailLoggerSkin = {
    frames = {},
}
addonTable.MailLoggerSkin = MailLoggerSkin
local HEADER_TEXTURE = "interface/dialogframe/ui-dialogbox-header"
local WINDOW_ICON = "Interface/AddOns/GW2_UI/textures/character/addon-window-icon.png"
local OUTPUT_WIDTH = 470
local OUTPUT_DROPDOWN_WIDTH = 200
local OUTPUT_CONTROL_GAP = 10
local OUTPUT_SCROLL_PADDING = 12
local SETTINGS_DROPDOWN_WIDTH = 150
local SETTINGS_CONTROL_GAP = 10
local SETTINGS_SCROLL_PADDING = 8
local CALENDAR_DROPDOWN_WIDTH = 90
local BUTTON_WIDTHS = { 45, 45, 45, 45, 55, 55, 55, 50 }
local ScanWindows
local dropDownProxies = {}
local dropDownTextHooked = false
local dropDownButtonHooked = false
local function NormalizePath(path)
    if type(path) ~= "string" then return end
    return string.lower(string.gsub(path, "\\", "/"))
end
local function HasOriginalHeader(frame)
    local texture = frame and frame.texture
    local path = texture and texture.GetTexture and texture:GetTexture()
    if type(path) == "number" then return true end
    return NormalizePath(path) == HEADER_TEXTURE
end
local function Rounded(value)
    return value and math.floor(value + 0.5)
end
local function GetFeatureCounts(frame)
    local counts = {
        button = 0,
        checkButton = 0,
        editBox = 0,
        scrollFrame = 0,
        dropDown = 0,
    }
    if not frame.GetChildren then return counts end
    for _, child in ipairs({ frame:GetChildren() }) do
        local objectType = child.GetObjectType and child:GetObjectType()
        if objectType == "Button" then
            counts.button = counts.button + 1
        elseif objectType == "CheckButton" then
            counts.checkButton = counts.checkButton + 1
        elseif objectType == "EditBox" then
            counts.editBox = counts.editBox + 1
        elseif objectType == "ScrollFrame" then
            counts.scrollFrame = counts.scrollFrame + 1
        elseif objectType == "Frame" and child.Button
            and (child.Left or child.Middle or child.Right) then
            counts.dropDown = counts.dropDown + 1
        end
    end
    return counts
end
local function GetWindowKind(frame)
    if not frame or not frame.GetSize or not HasOriginalHeader(frame) then return end
    local width, height = frame:GetSize()
    width, height = Rounded(width), Rounded(height)
    local counts = GetFeatureCounts(frame)
    if height == 510 and width == 380
        and counts.checkButton > 0 and counts.editBox > 0
        and counts.scrollFrame > 0 and counts.dropDown > 0 then
        return "settings"
    end
    if height == 510 and (width == 360 or width == OUTPUT_WIDTH)
        and counts.button >= 6 and counts.scrollFrame > 0 then
        return "output"
    end
    if height == 320 and width == 320
        and counts.button >= 49 and counts.dropDown >= 2 then
        return "calendar"
    end
end
local function GetChildren(frame)
    if not frame or not frame.GetChildren then return {} end
    return { frame:GetChildren() }
end
local function SkinRegions(frame)
    if not frame or not frame.GetRegions then return end
    for _, region in ipairs({ frame:GetRegions() }) do
        if region.GetObjectType and region:GetObjectType() == "FontString" then
            Skin.SkinFont(region, "Normal")
        end
    end
end
local function IsDropDown(frame)
    return frame and frame.GetObjectType and frame:GetObjectType() == "Frame"
        and frame.Button and (frame.Left or frame.Middle or frame.Right)
end
local function SkinObject(object)
    if not object or object.__gwMailLoggerObjectSkinned then return end
    object.__gwMailLoggerObjectSkinned = true
    local objectType = object.GetObjectType and object:GetObjectType()
    if objectType == "CheckButton" then
        Skin.SkinCheckBox(object)
    elseif objectType == "Button" then
        Skin.SkinButton(object)
    elseif objectType == "EditBox" then
        if object.__gwMailLoggerScrollContent then
            if object.GwStripTextures then object:GwStripTextures() end
            Skin.SkinFont(object, "Normal")
        else
            Skin.SkinEditBox(object)
        end
    elseif objectType == "ScrollFrame" then
        if object.GwSkinScrollFrame then object:GwSkinScrollFrame() end
        if object.__gwMailLoggerFixedScroll and object.GwCreateBackdrop then
            local template = GW and GW.BackdropTemplates and GW.BackdropTemplates.Default
            object:GwCreateBackdrop(template, true, 2, 2)
        end
        Skin.SkinScrollBar(object.ScrollBar)
        if object.ScrollBar then
            object.ScrollBar.__gwMailLoggerObjectSkinned = true
        end
    elseif IsDropDown(object) then
        local width = object.GetWidth and object:GetWidth()
        Skin.SkinDropDown(object, width)
        SkinRegions(object)
        return
    end
    SkinRegions(object)
    for _, child in ipairs(GetChildren(object)) do
        SkinObject(child)
    end
end
local function FindTitle(frame)
    if not frame or not frame.GetRegions then return end
    for _, region in ipairs({ frame:GetRegions() }) do
        if region.GetObjectType and region:GetObjectType() == "FontString" then
            return region
        end
    end
end
local function IsBottomButton(button)
    if not button or not button.GetPoint then return end
    local point, _, _, x, y = button:GetPoint()
    return point == "BOTTOMLEFT" and type(x) == "number" and type(y) == "number"
        and math.abs(y - 10) < 0.5, x
end
local function CollectOutputButtons(frame)
    local buttons = {}
    for _, child in ipairs(GetChildren(frame)) do
        if child.GetObjectType and child:GetObjectType() == "Button" then
            local isBottom, x = IsBottomButton(child)
            if isBottom then
                buttons[#buttons + 1] = { button = child, x = x }
            end
        end
    end
    table.sort(buttons, function(a, b) return a.x < b.x end)
    local result = {}
    for _, entry in ipairs(buttons) do
        result[#result + 1] = entry.button
    end
    return result
end
local function CreateOutputButton(frame, text)
    local button = CreateFrame("Button", nil, frame, "GameMenuButtonTemplate")
    button:SetHeight(23)
    button:SetText(text)
    return button
end
local function FindOutputFilterControls(frame)
    local legacyDropDown
    for _, child in ipairs(GetChildren(frame)) do
        if IsDropDown(child) then
            legacyDropDown = child
            break
        end
    end
    if not legacyDropDown then return end
    local filterButton
    for _, child in ipairs(GetChildren(frame)) do
        if child.GetObjectType and child:GetObjectType() == "Button" and child.GetPoint then
            local _, relativeTo = child:GetPoint()
            if relativeTo == legacyDropDown then
                filterButton = child
                break
            end
        end
    end
    local label
    if frame.GetRegions then
        for _, region in ipairs({ frame:GetRegions() }) do
            if region.GetObjectType and region:GetObjectType() == "FontString"
                and region.GetPoint then
                local _, relativeTo = region:GetPoint()
                if relativeTo == legacyDropDown then
                    label = region
                    break
                end
            end
        end
    end
    return legacyDropDown, filterButton, label
end
local function GetLegacyDropDownText(dropdown)
    local text = dropdown and dropdown.Text
    if text and text.GetText then return text:GetText() end
    if _G.UIDropDownMenu_GetText then return _G.UIDropDownMenu_GetText(dropdown) end
end
local function SyncLegacyDropDownSelection(legacyDropDown, text)
    if not legacyDropDown or text == nil then return end
    legacyDropDown.selectedName = text
    legacyDropDown.selectedID = nil
    legacyDropDown.selectedValue = nil
end
local function RegisterDropDownProxy(legacyDropDown, dropDown)
    dropDownProxies[legacyDropDown] = dropDown
    if not _G.hooksecurefunc then return end
    if not dropDownTextHooked
        and type(_G.UIDropDownMenu_SetText) == "function" then
        dropDownTextHooked = true
        _G.hooksecurefunc("UIDropDownMenu_SetText", function(source, text)
            local proxy = dropDownProxies[source]
            if proxy then
                SyncLegacyDropDownSelection(source, text or "")
                proxy:SetText(text or "")
            end
        end)
    end
    if not dropDownButtonHooked
        and type(_G.UIDropDownMenu_AddButton) == "function" then
        dropDownButtonHooked = true
        _G.hooksecurefunc("UIDropDownMenu_AddButton", function(info)
            local source = _G.UIDROPDOWNMENU_OPEN_MENU
                or _G.UIDROPDOWNMENU_INIT_MENU
            if source and dropDownProxies[source] and info then
                info.checked = nil
            end
        end)
    end
end
local function CreateDropDownProxy(frame, legacyDropDown, width)
    local dropDown = CreateFrame(
        "DropdownButton", nil, frame, "WowStyle1DropdownTemplate"
    )
    dropDown:SetSize(width, 25)
    dropDown:EnableMouse(true)
    if dropDown.Enable then dropDown:Enable() end
    if dropDown.RegisterForClicks then
        dropDown:RegisterForClicks("LeftButtonUp")
    end
    if GW and GW.NoOp then dropDown.OnButtonStateChanged = GW.NoOp end
    if dropDown.GwHandleDropDownBox then
        dropDown:GwHandleDropDownBox(nil, nil, nil, width)
    end
    local selectedText = GetLegacyDropDownText(legacyDropDown) or ""
    SyncLegacyDropDownSelection(legacyDropDown, selectedText)
    dropDown:SetText(selectedText)
    dropDown:SetScript("OnClick", function(self)
        if _G.ToggleDropDownMenu then
            SyncLegacyDropDownSelection(
                legacyDropDown, GetLegacyDropDownText(legacyDropDown) or ""
            )
            _G.ToggleDropDownMenu(1, nil, legacyDropDown, self, 0, 0)
        end
    end)
    dropDown:HookScript("OnShow", function(self)
        local text = GetLegacyDropDownText(legacyDropDown) or ""
        SyncLegacyDropDownSelection(legacyDropDown, text)
        self:SetText(text)
    end)
    RegisterDropDownProxy(legacyDropDown, dropDown)
    legacyDropDown:SetAlpha(0)
    legacyDropDown:EnableMouse(false)
    if legacyDropDown.Button then legacyDropDown.Button:EnableMouse(false) end
    legacyDropDown.__gwMailLoggerObjectSkinned = true
    dropDown.__gwMailLoggerObjectSkinned = true
    return dropDown
end
local function CreateNativeOutputDropDown(frame)
    if frame.gwCharacterDropDown then return end
    local legacyDropDown, filterButton, label = FindOutputFilterControls(frame)
    if not legacyDropDown or not filterButton then return end
    local dropDown = CreateDropDownProxy(
        frame, legacyDropDown, OUTPUT_DROPDOWN_WIDTH
    )
    dropDown:SetPoint("LEFT", legacyDropDown, "LEFT", 0, 3)
    filterButton:ClearAllPoints()
    filterButton:SetPoint(
        "LEFT", dropDown, "RIGHT", OUTPUT_CONTROL_GAP, 0
    )
    if label then
        label:ClearAllPoints()
        label:SetPoint(
            "RIGHT", dropDown, "LEFT", -OUTPUT_CONTROL_GAP, 0
        )
        if label.GwSetFontTemplate and GW then
            label:GwSetFontTemplate(
                DAMAGE_TEXT_FONT, GW.Enum.TextSizeType.Small
            )
        end
        if label.SetTextColor then label:SetTextColor(1, 1, 1) end
    end
    frame.gwCharacterDropDown = dropDown
    frame.gwLegacyCharacterDropDown = legacyDropDown
end
local function LayoutSettings(frame)
    local legacyDropDown
    local scrollFrame
    for _, child in ipairs(GetChildren(frame)) do
        if not legacyDropDown and IsDropDown(child) then
            legacyDropDown = child
        elseif not scrollFrame and child.GetObjectType
            and child:GetObjectType() == "ScrollFrame" then
            scrollFrame = child
        end
    end
    if legacyDropDown and not frame.gwSettingsCharacterDropDown then
        local removeButton
        for _, child in ipairs(GetChildren(frame)) do
            if child.GetObjectType and child:GetObjectType() == "Button"
                and child.GetPoint then
                local _, relativeTo = child:GetPoint()
                if relativeTo == legacyDropDown then
                    removeButton = child
                    break
                end
            end
        end
        local dropDown = CreateDropDownProxy(
            frame, legacyDropDown, SETTINGS_DROPDOWN_WIDTH
        )
        dropDown:SetPoint("LEFT", legacyDropDown, "LEFT", 0, 2)
        if removeButton then
            removeButton:ClearAllPoints()
            removeButton:SetPoint(
                "LEFT", dropDown, "RIGHT", SETTINGS_CONTROL_GAP, 0
            )
        end
        frame.gwSettingsCharacterDropDown = dropDown
        frame.gwLegacySettingsCharacterDropDown = legacyDropDown
    end
    if not scrollFrame then return end
    scrollFrame.__gwMailLoggerFixedScroll = true
    if scrollFrame.ScrollBar then
        scrollFrame.ScrollBar:ClearAllPoints()
        scrollFrame.ScrollBar:SetPoint(
            "TOPLEFT", scrollFrame, "TOPRIGHT", 8, -2
        )
        scrollFrame.ScrollBar:SetPoint(
            "BOTTOMLEFT", scrollFrame, "BOTTOMRIGHT", 8, 2
        )
    end
    for _, child in ipairs(GetChildren(scrollFrame)) do
        if child.GetObjectType and child:GetObjectType() == "EditBox" then
            child.__gwMailLoggerScrollContent = true
            child:ClearAllPoints()
            child:SetPoint("TOPLEFT", scrollFrame, "TOPLEFT", 0, 0)
            child:SetWidth(scrollFrame:GetWidth())
            if child.SetTextInsets then
                child:SetTextInsets(
                    SETTINGS_SCROLL_PADDING, SETTINGS_SCROLL_PADDING,
                    SETTINGS_SCROLL_PADDING, SETTINGS_SCROLL_PADDING
                )
            end
        end
    end
end
local function LayoutCalendar(frame)
    local calendarDropDowns = {}
    for _, child in ipairs(GetChildren(frame)) do
        if IsDropDown(child) and child.GetPoint then
            local point, _, relativePoint, x = child:GetPoint()
            if point == "TOPLEFT" and type(x) == "number" then
                calendarDropDowns[#calendarDropDowns + 1] = {
                    legacy = child,
                    relativePoint = relativePoint,
                    x = x,
                }
            end
        end
    end
    table.sort(calendarDropDowns, function(a, b) return a.x < b.x end)
    for index, entry in ipairs(calendarDropDowns) do
        local dropDown = CreateDropDownProxy(
            frame, entry.legacy, CALENDAR_DROPDOWN_WIDTH
        )
        dropDown:SetPoint(
            "TOPLEFT", frame, entry.relativePoint or "TOPLEFT", entry.x, -20
        )
        if frame.GetRegions then
            for _, region in ipairs({ frame:GetRegions() }) do
                if region.GetObjectType and region:GetObjectType() == "FontString"
                    and region.GetPoint then
                    local _, relativeTo = region:GetPoint()
                    if relativeTo == entry.legacy then
                        if region.GetText and region.SetText then
                            region:SetText(
                                string.gsub(region:GetText() or "", "^%s+", "")
                            )
                        end
                        region:ClearAllPoints()
                        region:SetPoint("RIGHT", dropDown, "LEFT", -10, 0)
                        break
                    end
                end
            end
        end
        if index == 1 then
            frame.gwCalendarYearDropDown = dropDown
        elseif index == 2 then
            frame.gwCalendarMonthDropDown = dropDown
        end
    end
    local locale = _G.GetLocale and _G.GetLocale()
    local weekdays
    if locale == "zhCN" then
        weekdays = {
            Sun = "周日", Mon = "周一", Tue = "周二", Wed = "周三",
            Thu = "周四", Fri = "周五", Sat = "周六",
        }
    elseif locale == "zhTW" then
        weekdays = {
            Sun = "週日", Mon = "週一", Tue = "週二", Wed = "週三",
            Thu = "週四", Fri = "週五", Sat = "週六",
        }
    end
    if not weekdays then return end
    for _, child in ipairs(GetChildren(frame)) do
        if child.GetObjectType and child:GetObjectType() == "Button"
            and child.GetText and child.SetText then
            local localized = weekdays[child:GetText()]
            if localized then child:SetText(localized) end
        end
    end
end
local function LayoutOutputScrollFrame(frame)
    for _, child in ipairs(GetChildren(frame)) do
        if child.GetObjectType and child:GetObjectType() == "ScrollFrame" then
            child:ClearAllPoints()
            child:SetPoint("TOPLEFT", frame, "TOPLEFT", 25, -70)
            child:SetSize(frame:GetWidth() - 70, frame:GetHeight() - 120)
            child.__gwMailLoggerFixedScroll = true
            if child.ScrollBar then
                child.ScrollBar:ClearAllPoints()
                child.ScrollBar:SetPoint("TOPLEFT", child, "TOPRIGHT", 12, -2)
                child.ScrollBar:SetPoint("BOTTOMLEFT", child, "BOTTOMRIGHT", 12, 2)
            end
            for _, scrollChild in ipairs(GetChildren(child)) do
                if scrollChild.GetObjectType and scrollChild:GetObjectType() == "EditBox" then
                    scrollChild.__gwMailLoggerScrollContent = true
                    scrollChild:ClearAllPoints()
                    scrollChild:SetPoint("TOPLEFT", child, "TOPLEFT", 0, 0)
                    scrollChild:SetWidth(child:GetWidth())
                    if scrollChild.SetTextInsets then
                        scrollChild:SetTextInsets(
                            OUTPUT_SCROLL_PADDING, OUTPUT_SCROLL_PADDING,
                            OUTPUT_SCROLL_PADDING, OUTPUT_SCROLL_PADDING
                        )
                    end
                end
            end
            return
        end
    end
end
local function LayoutOutput(frame)
    if frame.gwBottomButtons then return end
    local original = CollectOutputButtons(frame)
    if #original < 6 then return end
    frame:SetWidth(OUTPUT_WIDTH)
    CreateNativeOutputDropDown(frame)
    local closeButton = table.remove(original)
    local calendarButton = CreateOutputButton(frame, _G.CALENDAR or "日历")
    local settingsButton = CreateOutputButton(frame, _G.SETTINGS or "设置")
    original[#original + 1] = calendarButton
    original[#original + 1] = settingsButton
    original[#original + 1] = closeButton
    for index, button in ipairs(original) do
        button:ClearAllPoints()
        button:SetWidth(BUTTON_WIDTHS[index])
        if index == 1 then
            button:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 20, 10)
        else
            button:SetPoint("LEFT", original[index - 1], "RIGHT", 5, 0)
        end
    end
    calendarButton:SetScript("OnClick", function()
        local calendar = MailLoggerSkin.frames.calendar
        if calendar and calendar.IsShown and calendar:IsShown() then
            calendar:Hide()
        elseif _G.SlashCmdList and _G.SlashCmdList.MLC then
            _G.SlashCmdList.MLC("all")
        end
    end)
    settingsButton:SetScript("OnClick", function()
        if _G.SlashCmdList and _G.SlashCmdList.MLC then
            _G.SlashCmdList.MLC("gui")
        end
    end)
    LayoutOutputScrollFrame(frame)
    frame.gwBottomButtons = original
    frame.gwCalendarButton = calendarButton
    frame.gwSettingsButton = settingsButton
end
local function HookSettingsButtons(frame)
    for _, child in ipairs(GetChildren(frame)) do
        if child.GetObjectType and child:GetObjectType() == "Button"
            and child.HookScript and not child.__gwMailLoggerRescanHooked then
            child.__gwMailLoggerRescanHooked = true
            child:HookScript("OnClick", function() ScanWindows() end)
        end
    end
end
local function SkinWindow(frame, kind)
    if frame.__gwMailLoggerSkinned then return end
    frame.__gwMailLoggerSkinned = true
    frame.__gwMailLoggerKind = kind
    if kind == "output" then
        LayoutOutput(frame)
    elseif kind == "settings" then
        LayoutSettings(frame)
    elseif kind == "calendar" then
        LayoutCalendar(frame)
    end
    Skin.SkinFrame(frame)
    Skin.AddTitleBar(frame, nil, WINDOW_ICON, FindTitle(frame))
    for _, child in ipairs(GetChildren(frame)) do
        if child ~= frame.gwHeader then SkinObject(child) end
    end
    SkinRegions(frame)
    if kind == "settings" then HookSettingsButtons(frame) end
end
ScanWindows = function()
    if not UIParent or not UIParent.GetChildren then return end
    for _, frame in ipairs({ UIParent:GetChildren() }) do
        local kind = GetWindowKind(frame)
        if kind then
            SkinWindow(frame, kind)
            MailLoggerSkin.frames[kind] = frame
        end
    end
end
MailLoggerSkin.ScanWindows = ScanWindows
Skin.Register("MailLogger", function()
    local eventFrame = _G.MailLoggerFrame
    if eventFrame and eventFrame.HookScript and not eventFrame.__gwMailLoggerHooked then
        eventFrame.__gwMailLoggerHooked = true
        eventFrame:HookScript("OnEvent", function(_, event, addonName)
            if event == "ADDON_LOADED" and addonName == "MailLogger" then
                ScanWindows()
            end
        end)
    end
    ScanWindows()
end)
