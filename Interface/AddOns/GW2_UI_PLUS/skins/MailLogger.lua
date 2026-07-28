-- MailLogger 皮肤 for GW2 UI Plus
-- MailLogger 的主窗口与大部分控件均为匿名对象，因此通过窗口特征识别并递归美化。

local _, addonTable = ...
local Skin = addonTable.Skin
if not Skin then return end

local MailLoggerSkin = {
    frames = {},
}
addonTable.MailLoggerSkin = MailLoggerSkin

local HEADER_TEXTURE = "interface/dialogframe/ui-dialogbox-header"
local OUTPUT_WIDTH = 470
local BUTTON_WIDTHS = { 45, 45, 45, 45, 55, 55, 55, 50 }

local ScanWindows

local function NormalizePath(path)
    if type(path) ~= "string" then return end
    return string.lower(string.gsub(path, "\\", "/"))
end

local function HasOriginalHeader(frame)
    local texture = frame and frame.texture
    local path = texture and texture.GetTexture and texture:GetTexture()
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
        Skin.SkinEditBox(object)
    elseif objectType == "ScrollFrame" then
        if object.GwSkinScrollFrame then object:GwSkinScrollFrame() end
        Skin.SkinScrollBar(object.ScrollBar)
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

local function AddInlineHeader(frame)
    if frame.inlineHeader then return end

    local title = FindTitle(frame)
    if frame.texture and frame.texture.Hide then frame.texture:Hide() end

    local header = CreateFrame("Frame", nil, frame, "GwFrameHeader")
    header:ClearAllPoints()
    header:SetPoint("TOPLEFT", frame, "TOPLEFT", 1, -1)
    header:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -1, -1)
    header:SetHeight(36)

    if header.BGLEFT then
        header.BGLEFT:SetWidth(math.max(0, math.min(512, frame:GetWidth() - 20)))
        header.BGLEFT:SetHeight(36)
    end
    if header.BGRIGHT then header.BGRIGHT:SetHeight(36) end
    if header.windowIcon then header.windowIcon:Hide() end

    header:EnableMouse(true)
    header:RegisterForDrag("LeftButton")
    header:SetScript("OnDragStart", function()
        if not InCombatLockdown or not InCombatLockdown() then frame:StartMoving() end
    end)
    header:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)

    if title then
        title:SetParent(header)
        title:ClearAllPoints()
        title:SetPoint("LEFT", header, "LEFT", 16, 0)
        Skin.SkinFont(title, "Header")
    end

    frame.inlineHeader = header
    frame.inlineTitle = title
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

local function LayoutOutputScrollFrame(frame)
    for _, child in ipairs(GetChildren(frame)) do
        if child.GetObjectType and child:GetObjectType() == "ScrollFrame" then
            child:ClearAllPoints()
            child:SetPoint("TOPLEFT", frame, "TOPLEFT", 25, -70)
            child:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -45, 50)
            for _, scrollChild in ipairs(GetChildren(child)) do
                if scrollChild.GetObjectType and scrollChild:GetObjectType() == "EditBox" then
                    scrollChild:SetWidth(385)
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

    if kind == "output" then LayoutOutput(frame) end
    Skin.SkinFrame(frame)
    AddInlineHeader(frame)

    for _, child in ipairs(GetChildren(frame)) do
        if child ~= frame.inlineHeader then SkinObject(child) end
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
