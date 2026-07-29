-- Myslot 导入/导出主窗口轻量皮肤。

local _, addonTable = ...
local Skin = addonTable.Skin
if not Skin then return end

local STATUS_BAR_TEXTURE =
    "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar.png"

local function Rounded(value)
    return value and math.floor(value + 0.5)
end

local function GetChildren(frame)
    if not frame or not frame.GetChildren then return {} end
    return { frame:GetChildren() }
end

local function ApplyDefaultFont(object)
    if not object or not object.GetFont or not object.SetFont then return end
    local _, size, flags = object:GetFont()
    if not size then return end
    object:SetFont(UNIT_NAME_FONT, size, flags)
end

local function ApplyFonts(frame)
    if not frame then return end
    ApplyDefaultFont(frame)
    if frame.GetRegions then
        for _, region in ipairs({ frame:GetRegions() }) do
            ApplyDefaultFont(region)
        end
    end
    for _, child in ipairs(GetChildren(frame)) do
        ApplyFonts(child)
    end
end

local function FindDirectChild(frame, objectType)
    for _, child in ipairs(GetChildren(frame)) do
        if child.GetObjectType and child:GetObjectType() == objectType then
            return child
        end
    end
end

local function IsDropDown(frame)
    return frame and frame.GetObjectType
        and frame:GetObjectType() == "Frame"
        and frame.Button and (frame.Left or frame.Middle or frame.Right)
end

local function SkinTextArea(frame)
    local scrollFrame = FindDirectChild(frame, "ScrollFrame")
    if not scrollFrame then return false end
    local editBox = FindDirectChild(scrollFrame, "EditBox")
    local _, editSize, editFlags
    if editBox and editBox.GetFont then
        _, editSize, editFlags = editBox:GetFont()
    end

    Skin.SkinFrame(frame)
    if scrollFrame.GwSkinScrollFrame then
        scrollFrame:GwSkinScrollFrame()
    end
    Skin.SkinScrollBar(scrollFrame.ScrollBar)
    Skin.SkinEditBox(editBox)
    if editBox and editSize and editBox.SetFont then
        editBox:SetFont(UNIT_NAME_FONT, editSize, editFlags)
    end
    return true
end

local function SkinMainFrame(frame)
    if not frame or frame.__gwMyslotSkinned then return end
    frame.__gwMyslotSkinned = true

    Skin.SkinFrame(frame)
    for _, child in ipairs(GetChildren(frame)) do
        local objectType = child.GetObjectType and child:GetObjectType()
        if objectType == "Button" then
            Skin.SkinButton(child)
        elseif IsDropDown(child) then
            Skin.SkinDropDown(child,
                child.GetWidth and child:GetWidth())
        elseif objectType == "Frame" then
            SkinTextArea(child)
        end
    end
    ApplyFonts(frame)
end

local function FindStatusBar(frame)
    return FindDirectChild(frame, "StatusBar")
end

local function IsProgressFrame(frame)
    if not frame or not frame.GetSize or not frame.GetFrameStrata then
        return false
    end
    local width, height = frame:GetSize()
    return Rounded(width) == 360
        and Rounded(height) == 70
        and frame:GetFrameStrata() == "FULLSCREEN_DIALOG"
        and FindStatusBar(frame) ~= nil
end

local function SkinProgressFrames()
    for _, frame in ipairs(GetChildren(_G.UIParent)) do
        if IsProgressFrame(frame) and not frame.__gwMyslotProgressSkinned then
            frame.__gwMyslotProgressSkinned = true
            Skin.SkinFrame(frame)
            local statusBar = FindStatusBar(frame)
            statusBar:SetStatusBarTexture(STATUS_BAR_TEXTURE)
            ApplyFonts(frame)
        end
    end
end

local function CountDirectButtons(frame)
    local count = 0
    for _, child in ipairs(GetChildren(frame)) do
        if child.GetObjectType and child:GetObjectType() == "Button" then
            count = count + 1
        end
    end
    return count
end

local function IsMainFrame(frame)
    if not frame or not frame.GetSize then return false end
    local width, height = frame:GetSize()
    return Rounded(width) == 650
        and Rounded(height) == 600
        and CountDirectButtons(frame) >= 4
end

local function FindMainFrame()
    local lib = _G.LibStub and _G.LibStub.GetLibrary
        and _G.LibStub:GetLibrary("Myslot-5.0", true)
    if lib and lib.MainFrame then return lib.MainFrame end

    for _, frame in ipairs(GetChildren(_G.UIParent)) do
        if IsMainFrame(frame) then return frame end
    end
end

Skin.Register("Myslot", function()
    local frame = FindMainFrame()
    if not frame then return end

    if not frame.__gwMyslotShowHooked then
        frame.__gwMyslotShowHooked = true
        frame:HookScript("OnShow", function(self)
            SkinMainFrame(self)
            SkinProgressFrames()
        end)
    end

    SkinProgressFrames()
    if frame.IsShown and frame:IsShown() then
        SkinMainFrame(frame)
    end
end)
