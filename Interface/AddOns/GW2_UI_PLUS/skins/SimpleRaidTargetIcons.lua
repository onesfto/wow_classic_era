-- SimpleRaidTargetIcons 设置窗口轻量皮肤。

local _, addonTable = ...
local Skin = addonTable.Skin
if not Skin then return end

local GW = _G.GW2_ADDON

local function ApplyDefaultFont(object)
    if not object or not object.GetFont or not object.SetFont then return end
    local _, size, flags = object:GetFont()
    if not size then return end
    object:SetFont(UNIT_NAME_FONT, size, flags)

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
