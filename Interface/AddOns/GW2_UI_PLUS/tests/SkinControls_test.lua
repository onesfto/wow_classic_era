local eventFrame

UNIT_NAME_FONT = "UnitFont"
DAMAGE_TEXT_FONT = "DamageFont"

GW2_ADDON = {
    Enum = {
        TextSizeType = {
            Header = "Header",
            Normal = "Normal",
            Small = "Small",
        },
    },
    BackdropTemplates = {
        Default = "Default",
        DefaultWithSmallBorder = "DefaultWithSmallBorder",
    },
}

C_AddOns = {
    IsAddOnLoaded = function() return false end,
}

function CreateFrame()
    eventFrame = {
        RegisterEvent = function() end,
        SetScript = function() end,
        UnregisterEvent = function() end,
    }
    return eventFrame
end

local addonTable = {}
local chunk = assert(loadfile("skins/Core.lua"))
chunk("GW2_UI_PLUS", addonTable)

local Skin = assert(addonTable.Skin)

local dropdown = {
    Button = {},
    width = 155,
    dropDownCalls = 0,
}

function dropdown:GetName() return nil end
function dropdown:SetWidth(width) self.width = width end
function dropdown:GwSkinDropDownMenu()
    self.dropDownCalls = self.dropDownCalls + 1
end

Skin.SkinDropDown(dropdown, 120)
Skin.SkinDropDown(dropdown, 120)

assert(dropdown.dropDownCalls == 1, "下拉框皮肤应只应用一次")
assert(dropdown.width == 120, "下拉框应使用调用方指定宽度")

local editBox = {
    stripCalls = 0,
    backdropCalls = 0,
    fontCalls = 0,
}

function editBox:GwStripTextures()
    self.stripCalls = self.stripCalls + 1
end

function editBox:GwCreateBackdrop(template)
    self.backdropCalls = self.backdropCalls + 1
    self.backdropTemplate = template
end

function editBox:GwSetFontTemplate()
    self.fontCalls = self.fontCalls + 1
end

function editBox:SetShadowColor() end

Skin.SkinEditBox(editBox)
Skin.SkinEditBox(editBox)

assert(editBox.stripCalls == 1, "输入框纹理应只剥离一次")
assert(editBox.backdropCalls == 1, "输入框背景应只创建一次")
assert(editBox.backdropTemplate == "DefaultWithSmallBorder", "输入框应使用 GW2 小边框背景")
assert(editBox.fontCalls == 1, "输入框字体应只应用一次")

print("SkinControls_test: OK")
