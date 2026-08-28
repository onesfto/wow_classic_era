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
grep -F 'GetModule(betterBags, "CategoryPane")' "$theme_file" >/dev/null
grep -F 'C_Timer.After(0, function()' "$theme_file" >/dev/null
grep -F 'object.IsProtected and object:IsProtected()' "$theme_file" >/dev/null
grep -F 'Tab = function(tab)' "$theme_file" >/dev/null
grep -F 'themes.CreateDefaultTabDecoration(tab)' "$theme_file" >/dev/null
grep -F 'SkinMoneyFrame' "$theme_file" >/dev/null

lua - <<'LUA'
_G.GW2_ADDON = {}
_G.C_AddOns = {
  IsAddOnLoaded = function(name) return name == "BetterBags" end,
}
local eventFrame = {}
function eventFrame:RegisterEvent() end
function eventFrame:SetScript(_, callback) self.callback = callback end
function eventFrame:UnregisterEvent() end
_G.CreateFrame = function() return eventFrame end
_G.geterrorhandler = function() return error end

local addonTable = {}
assert(loadfile("Modules/Skins/Core.lua"))("GW2_UI_PLUS", addonTable)
local calls = 0
addonTable.Skin.Register("BetterBags", function() calls = calls + 1 end)
assert(calls == 1, "已加载的 BetterBags 皮肤必须立即注册，不能等待进入世界")
eventFrame.callback(eventFrame, "PLAYER_ENTERING_WORLD")
assert(calls == 1, "BetterBags 皮肤只能注册一次")
LUA

grep -E '^## OptionalDependencies:.*BetterBags' "$toc_file" >/dev/null

lua - <<'LUA'
local registrations = {}
local registeredThemes = {}

local themes = {
  titles = {},
  tabs = {},
  RegisterTheme = function(_, key, theme)
    registeredThemes[key] = theme
  end,
}

local categoryPane = {
  Create = function(_, parent)
    return _G.__gwBetterBagsCreateCategoryPane(parent)
  end,
}

local themePane = {
  Create = function(_, parent)
    return _G.__gwBetterBagsCreateThemePane(parent)
  end,
}

local currencyPane = {
  Create = function(_, parent)
    return _G.__gwBetterBagsCreateCurrencyPane(parent)
  end,
}

local itemColorPane = {
  Create = function(_, parent)
    return _G.__gwBetterBagsCreateItemColorPane(parent)
  end,
}

local question = {
  _OnCreate = function()
    local frame = _G.__gwBetterBagsCreateQuestion()
    return {
      frame = frame,
      input = NewFrame and NewFrame("EditBox", nil, frame) or nil,
      yes = NewFrame and NewFrame("Button", nil, frame) or nil,
      no = NewFrame and NewFrame("Button", nil, frame) or nil,
    }
  end,
  OnEnable = function(self)
    local cached
    self._pool = {
      Acquire = function()
        if not cached then cached = self:_OnCreate() end
        return cached
      end,
    }
  end,
}

local groupDialog = {
  Initialize = function(self)
    self.frame = _G.__gwBetterBagsCreateGroupDialog()
    self.input = NewFrame("EditBox", nil, self.frame)
    self.yes = NewFrame("Button", nil, self.frame)
    self.no = NewFrame("Button", nil, self.frame)
    self.dropdown = NewFrame("Frame", nil, self.frame)
    self.dropdown.Button = NewFrame("Button", nil, self.dropdown)
    self.dropdown.Left = NewFrame("Texture", nil, nil)
  end,
}

local searchCategoryConfig = {
  Open = function(self)
    self.frame = self.frame or _G.__gwBetterBagsCreateSearchCategory()
  end,
}

local config = {}
local messageHandlers = {}
local events = {
  RegisterMessage = function(_, event, callback)
    messageHandlers[event] = callback
  end,
}
local currentTheme = "GW2UIPlus"
local database = {
  GetTheme = function() return currentTheme end,
}

local target = {
  GetModule = function(_, name, silent)
    local modules = {
      Themes = themes,
      SearchBox = {},
      ContextMenu = {},
      Context = {},
      Events = events,
      Database = database,
      Fonts = {},
      Constants = {},
      CategoryPane = categoryPane,
      ThemePane = themePane,
      CurrencyPane = currencyPane,
      ItemColorPane = itemColorPane,
      Config = config,
      Question = question,
      GroupDialog = groupDialog,
      SearchCategoryConfig = searchCategoryConfig,
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

local deferred = {}
_G.C_Timer = {
  After = function(delay, callback)
    assert(delay == 0)
    table.insert(deferred, callback)
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
  "ToggleSearch", "PositionBagSlots", "OffsetSidebar", "ItemButton", "Tab", "Reset",
}) do
  assert(type(theme[callback]) == "function", callback .. " callback is missing")
end
assert(theme.OffsetSidebar() == -35, "GW2 左侧工具栏必须为 BetterBags 侧栏预留空间")
assert(theme.DisableMasque == true, "GW2 物品格不得再被 Masque 覆盖")

local created = {}
function NewFrame(objectType, name, parent, template)
  local frame = {
    objectType = objectType,
    name = name,
    parent = parent,
    template = template,
    children = {},
    regions = {},
    hooks = {},
    scripts = {},
  }
  if parent then table.insert(parent.children, frame) end
  table.insert(created, frame)
  function frame:GetObjectType() return self.objectType end
  function frame:GetName() return self.name end
  function frame:GetParent() return self.parent end
  function frame:SetAllPoints() self.allPoints = true end
  function frame:ClearAllPoints() end
  function frame:SetSize() end
  function frame:SetWidth() end
  function frame:SetHeight() end
  function frame:SetFrameStrata(strata) self.strata = strata end
  function frame:GetFrameStrata() return self.strata or (self.parent and self.parent:GetFrameStrata()) or "DIALOG" end
  function frame:SetFrameLevel(level) self.level = level end
  function frame:GetFrameLevel() return self.level or 1 end
  function frame:SetBackdrop() self.backdropSet = true end
  function frame:SetPoint(...)
    self.points = self.points or {}
    table.insert(self.points, { ... })
  end
  function frame:SetText() end
  function frame:SetTextColor(...) self.textColor = { ... } end
  function frame:SetShadowColor() end
  function frame:SetTexture(texture) self.texture = texture end
  function frame:SetColorTexture(r, g, b, a) self.colorTexture = { r, g, b, a } end
  function frame:SetVertexColor() end
  function frame:SetDrawLayer(layer, sublevel) self.drawLayer = { layer, sublevel } end
  function frame:SetTexCoord(...) self.texCoords = { ... } end
  function frame:SetBlendMode(mode) self.blendMode = mode end
  function frame:SetJustifyH(value) self.justifyH = value end
  function frame:SetAlpha(alpha) self.alpha = alpha end
  function frame:SetScript(event, callback) self.scripts[event] = callback end
  function frame:HookScript(event, callback) self.hooks[event] = callback end
  function frame:RunScript(event)
    if self.scripts[event] then self.scripts[event](self) end
    if self.hooks[event] then self.hooks[event](self) end
  end
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
    return (table.unpack or unpack)(self.children)
  end
  function frame:GwCreateBackdrop() self.gwBackdropCreated = true end
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
addonTable.Skin.SkinFrame = function(frame) frame.frameSkinned = true end

local panel = NewFrame("Frame", "BetterBagsFormTest", nil)
panel:SetFrameLevel(500)
local checkbox = NewFrame("CheckButton", nil, panel)
local dropdown = NewFrame("Frame", nil, panel)
dropdown.GwHandleDropDownBox = true
dropdown.Button = NewFrame("Button", nil, dropdown)
dropdown.Left = NewFrame("Texture", nil, nil)
dropdown.Middle = NewFrame("Texture", nil, nil)
dropdown.Right = NewFrame("Texture", nil, nil)
local editBox = NewFrame("EditBox", nil, panel)
local slider = NewFrame("Slider", nil, panel)
local scrollBar = NewFrame("EventFrame", nil, panel)
scrollBar.GwSkinScrollBar = true
scrollBar.SetHideIfUnscrollable = function() end
scrollBar.SetInterpolateScroll = function() end
local genericContainer = NewFrame("Frame", nil, panel)
genericContainer.GwSkinScrollBar = true
genericContainer.GwHandleDropDownBox = true
local nestedCheckbox = NewFrame("CheckButton", nil, genericContainer)
local label = NewFrame("FontString", nil, nil)
table.insert(panel.regions, label)
local colorPicker = NewFrame("Frame", nil, panel)

config.configFrame = {
  frame = panel,
  ScrollBar = scrollBar,
  layout = {
    checkboxes = { [{ checkbox = checkbox }] = {} },
    dropdowns = { [{ classicDropdown = dropdown }] = {} },
    sliders = { [{ slider = slider, input = editBox }] = {} },
    buttonGroups = {},
    textAreas = {},
    inputBoxes = {},
    colorPickers = { [{ colorPicker = colorPicker }] = {} },
    panes = {},
    sections = {},
  },
}

theme.Simple(panel)
assert(checkbox.checkboxSkinned)
assert(dropdown.dropdownSkinned)
assert(editBox.editBoxSkinned)
assert(slider.sliderSkinned)
assert(scrollBar.scrollBarSkinned)
assert(nestedCheckbox.checkboxSkinned, "普通容器不得被误判并阻断子控件换肤")
assert(label.fontSkinned)
assert(colorPicker.gwBackdropCreated, "颜色选择器缺少 GW 边框")

local close
for _, frame in ipairs(created) do
  if frame.template == "UIPanelCloseButtonNoScripts" then close = frame end
end
assert(close and close:GetFrameLevel() > panel:GetFrameLevel())

local delayedCheckbox = NewFrame("CheckButton", nil, panel)
local frameCountBeforeShow = #created
panel.hooks.OnShow(panel)
while #deferred > 0 do
  table.remove(deferred, 1)()
end
assert(delayedCheckbox.checkboxSkinned)
panel.hooks.OnShow(panel)
while #deferred > 0 do table.remove(deferred, 1)() end
assert(#created == frameCountBeforeShow, "重复显示设置窗口不应继续创建皮肤 Frame")

themes.CreateDefaultTabDecoration = function(tab)
  local decoration = NewFrame("Button", tab:GetName() .. "Default", tab, "BetterBagsSecureBagTabTemplate")
  decoration.Left = NewFrame("Texture", nil, nil)
  decoration.Middle = NewFrame("Texture", nil, nil)
  decoration.Right = NewFrame("Texture", nil, nil)
  decoration.LeftActive = NewFrame("Texture", nil, nil)
  decoration.MiddleActive = NewFrame("Texture", nil, nil)
  decoration.RightActive = NewFrame("Texture", nil, nil)
  decoration.Text = NewFrame("FontString", nil, nil)
  decoration.IconTexture = NewFrame("Texture", nil, nil)
  decoration.IconBorder = NewFrame("Texture", nil, nil)
  decoration.Count = NewFrame("FontString", nil, nil)
  decoration.ItemSlotBackground = NewFrame("Texture", nil, nil)
  decoration:SetNormalTexture("")
  decoration:SetHighlightTexture("")
  decoration:SetPushedTexture("")
  return decoration
end
themes.CreateBlankItemButtonDecoration = function(parent, themeKey, buttonName)
  local decoration = NewFrame("Button", buttonName .. themeKey, parent, "ContainerFrameItemButtonTemplate")
  decoration.IconTexture = NewFrame("Texture", nil, nil)
  decoration.IconBorder = NewFrame("Texture", nil, nil)
  decoration.Count = NewFrame("FontString", nil, nil)
  decoration.ItemSlotBackground = NewFrame("Texture", nil, nil)
  decoration:SetNormalTexture("")
  decoration:SetHighlightTexture("")
  decoration:SetPushedTexture("")
  return decoration
end
local tab = NewFrame("Button", "BetterBagsTabTest", nil)
local existingTabDecoration = themes.CreateDefaultTabDecoration(tab)
themes.tabs[tab:GetName()] = existingTabDecoration
local tabDecoration = theme.Tab(tab)
assert(tabDecoration.template == "BetterBagsSecureBagTabTemplate")
assert(tabDecoration == existingTabDecoration, "切换主题时必须复用 BetterBags 已有 Tab 装饰，禁止双层文字")
assert(tabDecoration.Left.colorTexture[4] == 0)
assert(tabDecoration.Middle.colorTexture[4] == 0)
assert(tabDecoration.Right.colorTexture[4] == 0)
assert(tabDecoration.LeftActive.colorTexture[4] == 0)
assert(tabDecoration.Text.textColor[1] == 1 and tabDecoration.Text.textColor[2] == 0.82)
tabDecoration.LeftActive:Hide()
assert(tabDecoration.Text.textColor[1] > 0.8 and tabDecoration.Text.textColor[2] > 0.8
  and tabDecoration.Text.textColor[3] > 0.8, "未选中 Tab 应使用暖白文字")
assert(tabDecoration.deselectedTextY == 0 and tabDecoration.selectedTextY == 0)

local itemParent = NewFrame("Frame", "BetterBagsItemParent", nil)
local item = {
  frame = itemParent,
  button = NewFrame("Button", "BetterBagsItemTest", itemParent),
}
local itemDecoration = theme.ItemButton(item)
assert(itemDecoration.gwBackdrop and itemDecoration.gwBackdrop.texture:find("bagitembackdrop", 1, true))
assert(itemDecoration.IconTexture.texCoords[1] == 0.07 and itemDecoration.IconTexture.texCoords[2] == 0.93)
assert(itemDecoration.IconTexture.alpha == 0.9)
assert(itemDecoration.IconBorder.texture:find("bagitemborder", 1, true))
assert(itemDecoration:GetHighlightTexture().texture:find("bagitemborder", 1, true))
itemDecoration.IconBorder:SetTexture("Interface/Common/WhiteIconFrame")
messageHandlers["item/Updated"]({}, item, itemDecoration)
assert(itemDecoration.IconBorder.texture:find("bagitemborder", 1, true), "物品刷新后必须恢复 GW 品质边框")

_G.GW2_ADDON.CreateFrameHeaderWithBody = function(decoration)
  decoration.gwHeader = NewFrame("Frame", "BetterBagsBagTestHeader", decoration)
  decoration.gwHeader.windowIcon = NewFrame("Texture", nil, nil)
  decoration.tex = NewFrame("Texture", nil, nil)
end
local bag = NewFrame("Frame", "BetterBagsBagTest", nil)
bag:SetFrameLevel(500)
bag.Owner = {
  kind = 1,
  tabs = { frame = NewFrame("Frame", "BetterBagsBagTestTabContainer", bag) },
}
theme.Portrait(bag)
local bagDecoration = bag.children[#bag.children]
assert(bagDecoration.solidBackground, "背包缺少深色实底")
assert(bagDecoration.solidBackground.colorTexture)
assert(bagDecoration.tex.shown ~= false)
assert(bagDecoration:GetFrameStrata() == bag:GetFrameStrata())
assert(bagDecoration.gwHeader.windowIcon.points[1][1] == "CENTER")
assert(bagDecoration.gwHeader.windowIcon.points[1][2] == bagDecoration)
assert(bagDecoration.gwHeader.windowIcon.points[1][3] == "TOPLEFT")
assert(bagDecoration.gwHeader.windowIcon.points[1][4] == -16)
assert(bagDecoration.title.points[#bagDecoration.title.points][1] == "BOTTOMLEFT")
assert(bagDecoration.title.points[#bagDecoration.title.points][2] == bagDecoration.gwHeader)
assert(bagDecoration.title.points[#bagDecoration.title.points][4] == 35)
assert(bagDecoration.panelButtons[1].points[1][4] == -35, "左侧工具按钮必须位于内容区外")
assert(bagDecoration.leftPanel.points[1][1] == "TOPRIGHT")
assert(bagDecoration.leftPanel.points[1][2] == bag)
assert(bagDecoration.leftPanel.points[1][3] == "TOPLEFT")
assert(bag.Owner.tabs.frame.__gwBetterBagsBackground, "底部 Tab 容器缺少连续背景")
assert(bag.Owner.tabs.frame.__gwBetterBagsBackground.texture.texture:find("bag%-sep"),
  "Tab 容器必须使用连续的 GW 分隔栏背景")
theme.Opacity(bag, 50)
assert(bagDecoration.solidBackground.alpha == 0.5)
assert(bagDecoration.tex.alpha == 0.5)
theme.Opacity(bag, 0)
assert(bagDecoration.solidBackground.alpha == 0)
assert(bagDecoration.footer.alpha == 0)
theme.Opacity(bag, 100)
assert(bagDecoration.solidBackground.alpha == 1)
assert(bagDecoration.leftPanel.alpha == 1)

local lateTabBag = NewFrame("Frame", "BetterBagsLateTabBag", nil)
lateTabBag.Owner = { kind = 1 }
theme.Portrait(lateTabBag)
theme.Opacity(lateTabBag, 50)
lateTabBag.Owner.tabs = { frame = NewFrame("Frame", "BetterBagsLateTabContainer", lateTabBag) }
local lateTab = NewFrame("Button", "BetterBagsLateTab", lateTabBag.Owner.tabs.frame)
theme.Tab(lateTab)
assert(lateTabBag.Owner.tabs.frame.__gwBetterBagsBackground.solid.alpha == 0.5,
  "延迟创建的 Tab 背景必须继承当前透明度")

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
assert(#deferred > 0)
while #deferred > 0 do
  table.remove(deferred, 1)()
end
assert(dynamicCheckbox.checkboxSkinned)
assert(not protectedButton.buttonSkinned)
assert(not itemButton.buttonSkinned)

_G.__gwBetterBagsCreateThemePane = function(parent)
  return NewFrame("Frame", nil, parent)
end
local themeParent = NewFrame("Frame", "BetterBagsThemeParent", nil)
local themeFrame = themePane:Create(themeParent)
assert(type(themeFrame.hooks.OnShow) == "function", "主题子页缺少动态换肤钩子")
themeFrame.hooks.OnShow(themeFrame)
local themeButton = NewFrame("Button", nil, themeFrame)
local themeListButton = NewFrame("Button", nil, themeFrame)
themeListButton.Init = true
themeListButton.ThemeName = NewFrame("FontString", nil, nil)
table.insert(themeListButton.regions, themeListButton.ThemeName)
local lateThemeButton
themeListButton:SetScript("OnClick", function()
  lateThemeButton = NewFrame("Button", nil, themeFrame)
end)
while #deferred > 0 do
  table.remove(deferred, 1)()
end
assert(themeButton.buttonSkinned)
assert(not themeListButton.buttonSkinned, "设置列表导航不应套用普通按钮外框")
assert(themeListButton.ThemeName.fontSkinned, "设置列表导航字体应继续换肤")
themeListButton:RunScript("OnClick")
while #deferred > 0 do table.remove(deferred, 1)() end
assert(lateThemeButton.buttonSkinned, "列表点击后惰性创建的详情控件未换肤")

for _, entry in ipairs({
  { module = currencyPane, key = "__gwBetterBagsCreateCurrencyPane", name = "Currency" },
  { module = itemColorPane, key = "__gwBetterBagsCreateItemColorPane", name = "ItemColor" },
}) do
  _G[entry.key] = function(parent) return NewFrame("Frame", nil, parent) end
  local parent = NewFrame("Frame", "BetterBags" .. entry.name .. "Parent", nil)
  local pane = entry.module:Create(parent)
  assert(type(pane.hooks.OnShow) == "function", entry.name .. " 子页缺少动态换肤钩子")
  pane.hooks.OnShow(pane)
  local button = NewFrame("Button", nil, pane)
  while #deferred > 0 do table.remove(deferred, 1)() end
  assert(button.buttonSkinned, entry.name .. " 子页按钮未换肤")
end

currentTheme = "Default"
local inactiveParent = NewFrame("Frame", "BetterBagsInactiveThemeParent", nil)
local inactivePane = themePane:Create(inactiveParent)
assert(inactivePane.hooks.OnShow == nil, "其他主题不应安装 GW2 设置控件换肤钩子")

_G.__gwBetterBagsCreateQuestion = function()
  return NewFrame("Frame", "BetterBagsQuestion", nil)
end
question:OnEnable()
local inactiveQuestion = question._pool:Acquire()
assert(not inactiveQuestion.frame.frameSkinned, "其他主题不应处理 Question 弹窗")
currentTheme = "GW2UIPlus"
local questionFrame = question._pool:Acquire()
assert(questionFrame == inactiveQuestion, "Question 测试必须复用同一个池对象")
assert(questionFrame.frame.frameSkinned, "Question 弹窗主体未使用 GW 背景")
assert(questionFrame.input.editBoxSkinned, "Question 输入框未换肤")
assert(questionFrame.yes.buttonSkinned)
assert(questionFrame.no.buttonSkinned)

_G.__gwBetterBagsCreateGroupDialog = function()
  return NewFrame("Frame", "BetterBagsGroupDialog", nil)
end
groupDialog:Initialize()
assert(groupDialog.input.editBoxSkinned)
assert(groupDialog.yes.buttonSkinned)
assert(groupDialog.no.buttonSkinned)
assert(groupDialog.dropdown.dropdownSkinned)

_G.__gwBetterBagsCreateSearchCategory = function()
  local frame = NewFrame("Frame", "BetterBagsSearchCategory", nil)
  NewFrame("CheckButton", nil, frame)
  return frame
end
searchCategoryConfig:Open()
local searchCheckbox = searchCategoryConfig.frame.children[1]
assert(searchCheckbox.checkboxSkinned, "搜索分类弹窗控件未换肤")

print("BetterBags GW2 UI Plus 主题注册检查通过")
LUA
