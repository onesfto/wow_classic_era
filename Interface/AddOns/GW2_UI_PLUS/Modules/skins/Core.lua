local _, addonTable = ...
local Skin = {}
addonTable.Skin = Skin
_G.GW2Plus_Skin = Skin
local GW = _G.GW2_ADDON
Skin.registry = {}
Skin.debug = false
local IsLoaded = (_G.C_AddOns and _G.C_AddOns.IsAddOnLoaded) or _G.IsAddOnLoaded
local FONT = {
    Header = { DAMAGE_TEXT_FONT, "Header" },
    Normal = { UNIT_NAME_FONT, "Normal" },
    Small  = { UNIT_NAME_FONT, "Small" },
}
function Skin.SkinFrame(frame, template)
    if not frame then return end
    if frame.GwStripTextures then
        frame:GwStripTextures()
    elseif frame.StripTextures then
        frame:StripTextures()
    end
    if frame.GwCreateBackdrop then
        frame:GwCreateBackdrop(template or (GW and GW.BackdropTemplates and GW.BackdropTemplates.Default))
    end
end
function Skin.SkinTooltip(frame)
    if not frame or frame.__gwSkinned then return end
    frame.__gwSkinned = true
    Skin.SkinFrame(frame)
    if frame.fs then Skin.SkinFont(frame.fs, "Normal") end
end
function Skin.SkinButton(button)
    if not button or not button.GwSkinButton then return end
    button:GwSkinButton(false, true)
end
function Skin.SkinClose(button)
    if not button or not button.GwSkinButton then return end
    button:GwSkinButton(true, false)
end
function Skin.SkinFont(fs, kind, style)
    if not fs or not fs.GwSetFontTemplate or not GW then return end
    local def = FONT[kind or "Normal"] or FONT.Normal
    fs:GwSetFontTemplate(def[1], GW.Enum.TextSizeType[def[2]], style)
    fs:SetShadowColor(0, 0, 0, 0)
end
function Skin.SkinCheckBox(check)
    if not check or not check.GwSkinCheckButton then return end
    check:GwSkinCheckButton(false)
end
function Skin.SkinScrollBar(bar)
    if not bar or not bar.GwSkinScrollBar then return end
    bar:GwSkinScrollBar()
end
function Skin.SkinDropDown(dropdown, width)
    if not dropdown or dropdown.__gwSkinnedDropDown then return end
    dropdown.__gwSkinnedDropDown = true
    local name = dropdown.GetName and dropdown:GetName()
    if dropdown.GwHandleDropDownBox then
        dropdown:GwHandleDropDownBox(nil, nil, nil, width)
        if dropdown.Button and dropdown.Button.GwStripTextures then
            dropdown.Button:GwStripTextures()
        end
    elseif dropdown.GwSkinDropDownMenu and (dropdown.Button or name) then
        dropdown:GwSkinDropDownMenu()
    end
    if width and dropdown.SetWidth then dropdown:SetWidth(width) end
end
function Skin.SkinEditBox(editBox)
    if not editBox or editBox.__gwSkinnedEditBox then return end
    editBox.__gwSkinnedEditBox = true
    if editBox.GwStripTextures then editBox:GwStripTextures() end
    if editBox.GwCreateBackdrop then
        local template = GW and GW.BackdropTemplates
            and GW.BackdropTemplates.DefaultWithSmallBorder
        editBox:GwCreateBackdrop(template)
    end
    Skin.SkinFont(editBox, "Normal")
end
function Skin.SkinSlider(slider)
    if not slider or not slider.GwSkinSliderFrame then return end
    slider:GwSkinSliderFrame()
end
function Skin.AddTitleBar(frame, dragFrameName, icon, titleFS)
    if not frame or frame.gwHeader or not GW then return end
    local frameName = frame.GetName and frame:GetName()
    local headerName = frameName and (frameName .. "Header") or nil
    local header = CreateFrame("Frame", headerName, frame, "GwFrameHeader")
    if header.windowIcon then
        header.windowIcon:SetTexture(icon or "Interface/AddOns/GW2_UI/textures/character/worldmap-window-icon.png")
    end
    header:ClearAllPoints()
    header:SetPoint("BOTTOMLEFT", frame, "TOPLEFT", 1, -5)
    header:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", -1, -5)
    local function LayoutHeaderBG()
        if header.BGLEFT then
            header.BGLEFT:SetWidth(math.max(0, math.min(512, frame:GetWidth() - 20)))
        end
    end
    LayoutHeaderBG()
    frame:HookScript("OnSizeChanged", LayoutHeaderBG)
    frame.gwHeader = header
    local dragFrame = dragFrameName and _G[dragFrameName]
    titleFS = titleFS or frame.fs or (dragFrame and dragFrame.fs)
    if titleFS then
        titleFS:ClearAllPoints()
        titleFS:SetParent(header)
        titleFS:SetPoint("BOTTOMLEFT", header, "BOTTOMLEFT", 64, 10)
        titleFS:GwSetFontTemplate(DAMAGE_TEXT_FONT, GW.Enum.TextSizeType.BigHeader, nil, 2)
        titleFS:SetShadowColor(0, 0, 0, 0)
        titleFS:SetShadowOffset(0, 0)
        titleFS:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
        titleFS.isSkinnedTitle = true
        local isSettingText = false
        hooksecurefunc(titleFS, "SetText", function(self, text)
            if isSettingText or not text then return end
            isSettingText = true
            local cleanText = string.gsub(text, "|c%x%x%x%x%x%x%x%x", "")
            cleanText = string.gsub(cleanText, "|r", "")
            self:SetText(cleanText)
            self:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
            self:SetShadowColor(0, 0, 0, 0)
            isSettingText = false
        end)
        titleFS:SetText(titleFS:GetText() or "")
    end
    if frame.backdrop then
        header:SetFrameLevel(frame.backdrop:GetFrameLevel() + 5)
    else
        header:SetFrameLevel(frame:GetFrameLevel() + 5)
    end
    frame:SetMovable(true)
    header:EnableMouse(true)
    header:RegisterForDrag("LeftButton")
    header:SetScript("OnDragStart", function() frame:StartMoving() end)
    header:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)
    local closeBtn = (frameName and _G[frameName .. "Close"]) or frame.CloseButton
    if closeBtn then
        closeBtn:ClearAllPoints()
        closeBtn:SetParent(header)
        closeBtn:SetSize(25, 25)
        closeBtn:SetPoint("BOTTOMRIGHT", header, "BOTTOMRIGHT", -8, 8)
        closeBtn:SetFrameLevel(header:GetFrameLevel() + 5)
        closeBtn:EnableMouse(true)
    end
    if dragFrame then
        dragFrame:EnableMouse(false)
        dragFrame:SetScript("OnEnter", nil)
        dragFrame:SetScript("OnLeave", nil)
        if dragFrame.tooltip then dragFrame.tooltip:Hide() end
        dragFrame:Hide()
    end
end
local function RunSkin(addonName)
    local entry = Skin.registry[addonName]
    if not entry or entry.done then return end
    if not GW then return end
    entry.done = true
    local ok, err = pcall(entry.func)
    if not ok then
        geterrorhandler()(("GW2_UI_PLUS Skin [%s]: %s"):format(addonName, tostring(err)))
    elseif Skin.debug then
        print(("|cffFFaa00[GW2 UI Plus]|r %s 皮肤已加载"):format(addonName))
    end
end
function Skin.Register(addonName, func)
    if type(addonName) ~= "string" or type(func) ~= "function" then return end
    Skin.registry[addonName] = { func = func, done = false }
    GW = GW or _G.GW2_ADDON
    if GW and type(IsLoaded) == "function" and IsLoaded(addonName) then
        RunSkin(addonName)
    end
end
local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" then
        if Skin.registry[arg1] then RunSkin(arg1) end
    else
        GW = GW or _G.GW2_ADDON
        for name in pairs(Skin.registry) do
            if IsLoaded(name) then RunSkin(name) end
        end
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    end
end)
