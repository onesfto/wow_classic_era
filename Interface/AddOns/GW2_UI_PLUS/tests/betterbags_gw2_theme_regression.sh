#!/bin/sh
set -eu

theme_file="Modules/Skins/BetterBags.lua"
toc_file="GW2_UI_PLUS.toc"

test -f "$theme_file"
grep -F 'Modules/Skins/BetterBags.lua' "$toc_file" >/dev/null
grep -F 'Skin.Register("BetterBags"' "$theme_file" >/dev/null
grep -F 'themes:RegisterTheme("GW2UIPlus"' "$theme_file" >/dev/null
grep -F 'Interface/AddOns/GW2_UI/textures/bag/bagfooter' "$theme_file" >/dev/null
grep -F 'Interface/AddOns/GW2_UI/textures/bag/bagleftpanel' "$theme_file" >/dev/null
grep -F 'close:SetFrameLevel(math.max(1001' "$theme_file" >/dev/null
grep -F 'Skin.SkinCheckBox' "$theme_file" >/dev/null
grep -F 'Skin.SkinDropDown' "$theme_file" >/dev/null
grep -F 'Skin.SkinEditBox' "$theme_file" >/dev/null
grep -F 'Skin.SkinSlider' "$theme_file" >/dev/null
grep -F 'Skin.SkinScrollBar' "$theme_file" >/dev/null
grep -F 'decoration.tex:SetDrawLayer("ARTWORK", 0)' "$theme_file" >/dev/null
grep -F 'GetModule(betterBags, "CategoryPane")' "$theme_file" >/dev/null
grep -F 'C_Timer.After(0, function()' "$theme_file" >/dev/null
grep -F 'object.IsProtected and object:IsProtected()' "$theme_file" >/dev/null
grep -F 'decoration.body' "$theme_file" >/dev/null
grep -F 'OffsetSidebar = function() return 0 end' "$theme_file" >/dev/null
grep -F 'Tab = function(tab)' "$theme_file" >/dev/null
grep -F 'themes.CreateDefaultTabDecoration(tab)' "$theme_file" >/dev/null
grep -F 'SkinMoneyFrame' "$theme_file" >/dev/null

lua - <<'LUA'
local registrations = {}
local registeredThemes = {}

local themes = {
  titles = {},
  RegisterTheme = function(_, key, theme)
    registeredThemes[key] = theme
  end,
}

local categoryPane = {
  Create = function(_, parent)
    return _G.__gwBetterBagsCreateCategoryPane(parent)
  end,
}

local target = {
  GetModule = function(_, name, silent)
    local modules = {
      Themes = themes,
      SearchBox = {},
      ContextMenu = {},
      Context = {},
      Events = {},
      Database = {},
      Fonts = {},
      Constants = {},
      CategoryPane = categoryPane,
    }
    return modules[name]
  end,
}

_G.LibStub = function(name)
  assert(name == "AceAddon-3.0")
  return {
    GetAddon = function(_, addonName, silent)
      assert(addonName == "BetterBags")
      return target
    end,
  }
end

_G.hooksecurefunc = function(target, method, callback)
  local original = target[method]
  target[method] = function(...)
    local results = { original(...) }
    callback(...)
    return (table.unpack or unpack)(results)
  end
end

local deferred
_G.C_Timer = {
  After = function(delay, callback)
    assert(delay == 0)
    deferred = callback
  end,
}

local addonTable = {
  Skin = {
    Register = function(name, callback)
      registrations[name] = callback
    end,
  },
}

assert(loadfile("Modules/Skins/BetterBags.lua"))("GW2_UI_PLUS", addonTable)
assert(type(registrations.BetterBags) == "function")

registrations.BetterBags()
assert(registeredThemes.GW2UIPlus == nil)

_G.GW2_ADDON = {
  BackdropTemplates = { Default = {} },
  Enum = { TextSizeType = { Header = 1, Normal = 2, Small = 3 } },
  CreateFrameHeaderWithBody = function() end,
  SkinBagSearchBox = function() end,
}
registrations.BetterBags()

local theme = registeredThemes.GW2UIPlus
assert(theme ~= nil)
assert(theme.Name == "GW2 UI Plus")
assert(theme.Description == "由 GW2_UI_PLUS 提供的完整 GW2 风格主题。")
assert(theme.Available == true)
for _, callback in ipairs({
  "Portrait", "Simple", "Flat", "Opacity", "SectionFont", "SetTitle",
  "ToggleSearch", "PositionBagSlots", "OffsetSidebar", "Tab", "Reset",
}) do
  assert(type(theme[callback]) == "function", callback .. " callback is missing")
end

local created = {}
local function NewFrame(objectType, name, parent, template)
  local frame = {
    objectType = objectType,
    name = name,
    parent = parent,
    template = template,
    children = {},
    regions = {},
    hooks = {},
  }
  if parent then table.insert(parent.children, frame) end
  table.insert(created, frame)
  function frame:GetObjectType() return self.objectType end
  function frame:GetName() return self.name end
  function frame:SetAllPoints() end
  function frame:ClearAllPoints() end
  function frame:SetSize() end
  function frame:SetWidth() end
  function frame:SetHeight() end
  function frame:SetFrameStrata(strata) self.strata = strata end
  function frame:GetFrameStrata() return self.strata or (self.parent and self.parent:GetFrameStrata()) or "DIALOG" end
  function frame:SetFrameLevel(level) self.level = level end
  function frame:GetFrameLevel() return self.level or 1 end
  function frame:SetBackdrop() end
  function frame:SetPoint() end
  function frame:SetText() end
  function frame:SetTextColor() end
  function frame:SetShadowColor() end
  function frame:SetTexture() end
  function frame:SetVertexColor() end
  function frame:SetDrawLayer() end
  function frame:SetTexCoord() end
  function frame:SetAlpha(alpha) self.alpha = alpha end
  function frame:SetScript() end
  function frame:HookScript(event, callback) self.hooks[event] = callback end
  function frame:Show() self.shown = true end
  function frame:Hide() self.shown = false end
  function frame:IsShown() return self.shown ~= false end
  function frame:IsProtected() return self.protected == true end
  function frame:CreateFontString()
    local font = NewFrame("FontString", nil, nil)
    table.insert(self.regions, font)
    return font
  end
  function frame:CreateTexture()
    local texture = NewFrame("Texture", nil, nil)
    table.insert(self.regions, texture)
    return texture
  end
  function frame:SetNormalTexture()
    self.normalTexture = self.normalTexture or NewFrame("Texture", nil, nil)
  end
  function frame:SetHighlightTexture()
    self.highlightTexture = self.highlightTexture or NewFrame("Texture", nil, nil)
  end
  function frame:SetPushedTexture()
    self.pushedTexture = self.pushedTexture or NewFrame("Texture", nil, nil)
  end
  function frame:GetNormalTexture() return self.normalTexture end
  function frame:GetHighlightTexture() return self.highlightTexture end
  function frame:GetPushedTexture() return self.pushedTexture end
  function frame:GetRegions() return self.regions[1], self.regions[2], self.regions[3] end
  function frame:GetChildren()
    return self.children[1], self.children[2], self.children[3], self.children[4],
      self.children[5], self.children[6], self.children[7], self.children[8]
  end
  return frame
end

_G.CreateFrame = function(objectType, name, parent, template)
  return NewFrame(objectType, name, parent, template)
end
addonTable.Skin.SkinCheckBox = function(control) control.checkboxSkinned = true end
addonTable.Skin.SkinDropDown = function(control) control.dropdownSkinned = true end
addonTable.Skin.SkinEditBox = function(control) control.editBoxSkinned = true end
addonTable.Skin.SkinSlider = function(control) control.sliderSkinned = true end
addonTable.Skin.SkinScrollBar = function(control) control.scrollBarSkinned = true end
addonTable.Skin.SkinButton = function(control) control.buttonSkinned = true end
addonTable.Skin.SkinFont = function(font) font.fontSkinned = true end

local panel = NewFrame("Frame", "BetterBagsFormTest", nil)
panel:SetFrameLevel(500)
local checkbox = NewFrame("CheckButton", nil, panel)
local dropdown = NewFrame("Frame", nil, panel)
dropdown.GwHandleDropDownBox = true
local editBox = NewFrame("EditBox", nil, panel)
local slider = NewFrame("Slider", nil, panel)
local scrollBar = NewFrame("EventFrame", nil, panel)
scrollBar.GwSkinScrollBar = true
local label = NewFrame("FontString", nil, nil)
table.insert(panel.regions, label)

theme.Simple(panel)
assert(checkbox.checkboxSkinned)
assert(dropdown.dropdownSkinned)
assert(editBox.editBoxSkinned)
assert(slider.sliderSkinned)
assert(scrollBar.scrollBarSkinned)
assert(label.fontSkinned)

local close
for _, frame in ipairs(created) do
  if frame.template == "UIPanelCloseButtonNoScripts" then close = frame end
end
assert(close and close:GetFrameLevel() > panel:GetFrameLevel())

local delayedCheckbox = NewFrame("CheckButton", nil, panel)
panel.hooks.OnShow(panel)
assert(delayedCheckbox.checkboxSkinned)

themes.CreateDefaultTabDecoration = function(tab)
  local decoration = NewFrame("Button", tab:GetName() .. "Default", tab, "BetterBagsSecureBagTabTemplate")
  decoration.Left = NewFrame("Texture", nil, nil)
  decoration.Middle = NewFrame("Texture", nil, nil)
  decoration.Right = NewFrame("Texture", nil, nil)
  decoration.LeftActive = NewFrame("Texture", nil, nil)
  decoration.MiddleActive = NewFrame("Texture", nil, nil)
  decoration.RightActive = NewFrame("Texture", nil, nil)
  decoration.Text = NewFrame("FontString", nil, nil)
  return decoration
end
local tab = NewFrame("Button", "BetterBagsTabTest", nil)
local tabDecoration = theme.Tab(tab)
assert(tabDecoration.template == "BetterBagsSecureBagTabTemplate")

_G.GW2_ADDON.CreateFrameHeaderWithBody = function(decoration)
  decoration.gwHeader = NewFrame("Frame", "BetterBagsBagTestHeader", decoration)
  decoration.tex = NewFrame("Texture", nil, nil)
end
local bag = NewFrame("Frame", "BetterBagsBagTest", nil)
bag:SetFrameLevel(500)
bag.Owner = { kind = 1 }
theme.Portrait(bag)
local bagDecoration = bag.children[#bag.children]
assert(bagDecoration.body)
assert(bagDecoration:GetFrameStrata() == bag:GetFrameStrata())
theme.Opacity(bag, 50)
assert(bagDecoration.body.alpha == 0.5)

_G.__gwBetterBagsCreateCategoryPane = function(parent)
  return NewFrame("Frame", nil, parent)
end
local categoryParent = NewFrame("Frame", "BetterBagsCategoryParent", nil)
local categoryFrame = categoryPane:Create(categoryParent)
assert(type(categoryFrame.hooks.OnShow) == "function")
categoryFrame.hooks.OnShow(categoryFrame)
local dynamicCheckbox = NewFrame("CheckButton", nil, categoryFrame)
local protectedButton = NewFrame("Button", nil, categoryFrame)
protectedButton.protected = true
local itemRow = NewFrame("Frame", nil, categoryFrame)
itemRow.item = {}
local itemButton = NewFrame("Button", nil, itemRow)
assert(type(deferred) == "function")
deferred()
assert(dynamicCheckbox.checkboxSkinned)
assert(not protectedButton.buttonSkinned)
assert(not itemButton.buttonSkinned)

print("BetterBags GW2 UI Plus 主题注册检查通过")
LUA
