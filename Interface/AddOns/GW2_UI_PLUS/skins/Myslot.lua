-- Myslot 导入/导出主窗口轻量皮肤。

local _, addonTable = ...
local Skin = addonTable.Skin
if not Skin then return end
local GW = _G.GW2_ADDON

local STATUS_BAR_TEXTURE =
    "Interface/AddOns/GW2_UI/textures/uistuff/gwstatusbar.png"
local EXPAND_ARROW_TEXTURE = "Interface\\ChatFrame\\ChatFrameExpandArrow"
local dropDownProxies = {}
local dropDownTextHooked

local function Rounded(value)
    return value and math.floor(value + 0.5)
end

local function GetSize(frame)
    if not frame or not frame.GetSize then return end
    local ok, width, height = pcall(frame.GetSize, frame)
    if ok then return width, height end
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

local function GetDropDownText(dropDown)
    if dropDown and dropDown.Text and dropDown.Text.GetText then
        return dropDown.Text:GetText()
    end
    if _G.UIDropDownMenu_GetText then
        return _G.UIDropDownMenu_GetText(dropDown)
    end
end

local function RegisterDropDownProxy(legacyDropDown, dropDown)
    dropDownProxies[legacyDropDown] = dropDown
    if dropDownTextHooked
        or not _G.hooksecurefunc
        or type(_G.UIDropDownMenu_SetText) ~= "function" then
        return
    end

    dropDownTextHooked = true
    _G.hooksecurefunc("UIDropDownMenu_SetText", function(source, text)
        local proxy = dropDownProxies[source]
        if proxy then proxy:SetText(text or "") end
    end)
end

local function CreateDropDownProxy(frame, legacyDropDown)
    if legacyDropDown.__gwMyslotDropDownProxy then return end

    local legacyWidth = legacyDropDown.GetWidth
        and legacyDropDown:GetWidth() or 240
    local width = math.max(1, legacyWidth - 40)
    local dropDown = CreateFrame(
        "DropdownButton", nil, frame, "WowStyle1DropdownTemplate"
    )
    dropDown:SetSize(width, 25)
    dropDown:SetPoint("LEFT", legacyDropDown, "LEFT", 16, 0)
    dropDown:EnableMouse(true)
    if dropDown.Enable then dropDown:Enable() end
    if dropDown.RegisterForClicks then
        dropDown:RegisterForClicks("LeftButtonUp")
    end
    if GW and GW.NoOp then dropDown.OnButtonStateChanged = GW.NoOp end
    if dropDown.GwHandleDropDownBox then
        dropDown:GwHandleDropDownBox(nil, nil, nil, width)
    end
    dropDown:SetText(GetDropDownText(legacyDropDown) or "")
    dropDown:SetScript("OnClick", function(self)
        if _G.ToggleDropDownMenu then
            _G.ToggleDropDownMenu(1, nil, legacyDropDown, self, 0, 0)
        end
    end)
    dropDown:HookScript("OnShow", function(self)
        self:SetText(GetDropDownText(legacyDropDown) or "")
    end)
    RegisterDropDownProxy(legacyDropDown, dropDown)

    legacyDropDown:SetAlpha(0)
    legacyDropDown:EnableMouse(false)
    if legacyDropDown.Button then
        legacyDropDown.Button:EnableMouse(false)
    end
    legacyDropDown.__gwMyslotDropDownProxy = dropDown
end

local function PromoteExpandArrow(button)
    if not button or not button.GetRegions then return end
    for _, region in ipairs({ button:GetRegions() }) do
        if region.GetTexture and region:GetTexture() == EXPAND_ARROW_TEXTURE then
            if region.SetDrawLayer then region:SetDrawLayer("OVERLAY", 7) end
            if region.Show then region:Show() end
        end
    end
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
            PromoteExpandArrow(child)
        elseif IsDropDown(child) then
            CreateDropDownProxy(frame, child)
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
    if not frame or not frame.GetFrameStrata then
        return false
    end
    local width, height = GetSize(frame)
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
    local width, height = GetSize(frame)
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
