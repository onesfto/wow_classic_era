local _, addonTable = ...
local Skin = addonTable.Skin
if not Skin then return end
local GW = _G.GW2_ADDON
local TEXT_COLOR = {
    Header = { 1, 0.945, 0.8196 },
    Body = { 0.9, 0.9, 0.9 },
    Button = { 0.95, 0.95, 0.95 },
    Disabled = { 0.5, 0.5, 0.5 },
}
local function SetTextColor(fontString, color)
    if fontString and fontString.SetTextColor then
        fontString:SetTextColor(color[1], color[2], color[3], 1)
    end
end
local function StripColorCodes(text)
    if type(text) ~= "string" then return text end
    text = string.gsub(text, "|c%x%x%x%x%x%x%x%x", "")
    return string.gsub(text, "|r", "")
end
local function ApplyDefaultFont(object)
    if not object or not object.GetFont or not object.SetFont then return end
    local _, size, flags = object:GetFont()
    if not size then return end
    object:SetFont(UNIT_NAME_FONT, size, flags)
    SetTextColor(object, TEXT_COLOR.Body)
    if object.SetFontObject and not object.__gwSRTIFontHooked then
        object.__gwSRTIFontHooked = true
        hooksecurefunc(object, "SetFontObject", function(self)
            local _, newSize, newFlags = self:GetFont()
            if newSize then self:SetFont(UNIT_NAME_FONT, newSize, newFlags) end
        end)
    end
end
local function ApplyFonts(frame)
    if not frame then return end
    ApplyDefaultFont(frame)
    if frame.GetRegions then
        for _, region in ipairs({ frame:GetRegions() }) do
            ApplyDefaultFont(region)
        end
    end
    if frame.GetChildren then
        for _, child in ipairs({ frame:GetChildren() }) do
            ApplyFonts(child)
        end
    end
end
local function StyleBindingButton(button)
    local fontString = button and button.GetFontString
        and button:GetFontString()
    if not fontString then return end
    local text = fontString:GetText()
    local cleanText = StripColorCodes(text)
    if cleanText ~= text then fontString:SetText(cleanText) end
    SetTextColor(fontString, TEXT_COLOR.Button)
end
local function ApplyTextColors(menu)
    if not menu then return end
    SetTextColor(menu.title, TEXT_COLOR.Header)
    SetTextColor(menu.optionheader, TEXT_COLOR.Header)
    SetTextColor(menu.bindingtext, TEXT_COLOR.Header)
    SetTextColor(menu.thirdpartytext, TEXT_COLOR.Header)
    local saved = _G.SRTISaved or {}
    local singleEnabled = saved.ctrl or saved.alt or saved.shift
    local singleColor = singleEnabled and TEXT_COLOR.Header
        or TEXT_COLOR.Disabled
    SetTextColor(menu.singletext, singleColor)
    SetTextColor(menu.modifiertext, singleColor)
    SetTextColor(_G.SRTIcb4Text,
        singleEnabled and TEXT_COLOR.Body or TEXT_COLOR.Disabled)
    local doubleColor = saved.double and TEXT_COLOR.Header
        or TEXT_COLOR.Disabled
    SetTextColor(menu.doubletext, doubleColor)
    for _, fontString in ipairs({
        _G.SRTIslider1Text,
        _G.SRTIslider1Low,
        _G.SRTIslider1High,
        _G.SRTIcb6Text,
    }) do
        SetTextColor(fontString,
            saved.double and TEXT_COLOR.Body or TEXT_COLOR.Disabled)
    end
    if menu.test then
        SetTextColor(menu.test.help, TEXT_COLOR.Disabled)
    end
    StyleBindingButton(menu.bindingkey1)
    StyleBindingButton(menu.bindingkey2)
end
local function SkinPanel(frame, small)
    local template = small and GW and GW.BackdropTemplates
        and GW.BackdropTemplates.DefaultWithSmallBorder
    Skin.SkinFrame(frame, template)
end
local function SkinThirdPartyCheckBoxes(frame)
    if not frame or not frame.GetChildren then return end
    for _, child in ipairs({ frame:GetChildren() }) do
        if child.GetObjectType and child:GetObjectType() == "CheckButton" then
            Skin.SkinCheckBox(child)
        end
    end
end
local function ApplySettingsSkin()
    local srti = _G.SRTI
    local menu = srti and srti.menu
    if not menu or menu.__gwSRTISkinned then return end
    menu.__gwSRTISkinned = true
    SkinPanel(menu)
    SkinPanel(menu.options)
    SkinPanel(menu.test)
    SkinPanel(menu.thirdparty)
    local options = menu.options
    if options then
        SkinPanel(options.singleframe, true)
        SkinPanel(options.doubleframe, true)
        SkinPanel(options.bindingframe, true)
        SkinPanel(options.hoverframe, true)
    end
    for _, checkBox in ipairs({
        menu.shift,
        menu.ctrl,
        menu.alt,
        menu.singlehover,
        menu.doublecb,
        menu.doublehover,
        menu.bindinghover,
    }) do
        Skin.SkinCheckBox(checkBox)
    end
    SkinThirdPartyCheckBoxes(menu.thirdparty)
    for _, slider in ipairs({
        menu.doublespeed,
        menu.hovertime,
        menu.radialscale,
    }) do
        Skin.SkinSlider(slider)
    end
    Skin.SkinButton(menu.bindingkey1)
    Skin.SkinButton(menu.bindingkey2)
    Skin.SkinClose(menu.unbindingkey1)
    Skin.SkinClose(menu.unbindingkey2)
    Skin.SkinClose(menu.closebutton)
    ApplyFonts(menu)
    ApplyTextColors(menu)
    for _, method in ipairs({ "UpdateCB", "UpdateDouble", "UpdateBindings" }) do
        if type(menu[method]) == "function" then
            hooksecurefunc(menu, method, function()
                ApplyTextColors(menu)
            end)
        end
    end
end
addonTable.SimpleRaidTargetIconsSkin = {
    Apply = ApplySettingsSkin,
}
Skin.Register("SimpleRaidTargetIcons", function()
    local srti = _G.SRTI
    if not srti or type(srti.Options) ~= "function" then return end
    if not srti.__gwPlusSkinHooked then
        srti.__gwPlusSkinHooked = true
        hooksecurefunc(srti, "Options", ApplySettingsSkin)
    end
    ApplySettingsSkin()
end)
