local _, addonTable = ...

local Skin = addonTable.Skin
if not Skin then return end

local BAG_ICON = "Interface/AddOns/GW2_UI/textures/bag/bagicon"
local BAG_BACKGROUND = "Interface/AddOns/GW2_UI/textures/bag/bagbg"
local BAG_FOOTER = "Interface/AddOns/GW2_UI/textures/bag/bagfooter"
local BAG_LEFT_PANEL = "Interface/AddOns/GW2_UI/textures/bag/bagleftpanel"
local BAG_SEPARATOR = "Interface/AddOns/GW2_UI/textures/bag/bag-sep"
local BAG_ITEM_BACKDROP = "Interface/AddOns/GW2_UI/textures/bag/bagitembackdrop"
local BAG_ITEM_BORDER = "Interface/AddOns/GW2_UI/textures/bag/bagitemborder"
local BAG_ITEM_PUSHED = "Interface/AddOns/GW2_UI/textures/uistuff/ui-quickslot-depress"
local BAG_BUTTON = "Interface/AddOns/GW2_UI/Textures/icons/bagmicrobutton-up"
local SORT_BUTTON = "Interface/AddOns/GW2_UI/Textures/icons/microicons/collectionsmicrobutton-up"
local SETTINGS_BUTTON = "Interface/AddOns/GW2_UI/Textures/icons/microicons/questlogmicrobutton-up"
local MENU_BUTTON = "Interface/AddOns/GW2_UI/Textures/icons/microicons/mainmenumicrobutton-up"
local THEME_KEY = "GW2UIPlus"
local IsActiveTheme = function() return true end

local function GetModule(addon, name)
    if not addon or type(addon.GetModule) ~= "function" then return end
    return addon:GetModule(name, true)
end

local function SetFrameLevel(frame, parent)
    if not frame or not parent or not frame.SetFrameLevel then return end
    local level = parent.GetFrameLevel and parent:GetFrameLevel() or 1
    frame:SetFrameLevel(math.max(0, level - 1))
end

local function SetTitleFont(font, GW)
    if not font or not GW or not GW.Enum or not GW.Enum.TextSizeType then return end
    if font.GwSetFontTemplate then
        font:GwSetFontTemplate(DAMAGE_TEXT_FONT, GW.Enum.TextSizeType.Header, "OUTLINE")
        font:SetShadowColor(0, 0, 0, 0)
    end
    if GW.Colors and GW.Colors.TextColors and GW.Colors.TextColors.LightHeader then
        font:SetTextColor(GW.Colors.TextColors.LightHeader:GetRGB())
    end
end

local function NewContext(context, name)
    if context and type(context.New) == "function" then
        return context:New(name)
    end
end

local function SkinMoneyFrame(owner)
    local money = owner and owner.moneyFrame
    if not money or type(Skin.SkinFont) ~= "function" then return end
    for _, button in ipairs({ money.goldButton, money.silverButton, money.copperButton }) do
        local font = button and button.GetFontString and button:GetFontString()
        if font then Skin.SkinFont(font, "Normal", "OUTLINE") end
    end
end

local function AddPanelButton(panel, texture, tooltip, callback)
    local button = CreateFrame("Button", nil, panel)
    button:SetSize(32, 32)
    button:SetNormalTexture(texture)
    button:SetHighlightTexture(texture)
    button:SetPushedTexture(texture)
    for _, region in ipairs({ button:GetNormalTexture(), button:GetHighlightTexture(), button:GetPushedTexture() }) do
        if region then region:SetTexCoord(0, 1, 0, 1) end
    end
    local previous = panel.panelButtons[#panel.panelButtons]
    if previous then
        button:SetPoint("TOP", previous, "BOTTOM", 0, -5)
    else
        button:SetPoint("TOPLEFT", panel, "TOPLEFT", -35, -40)
    end
    button:SetScript("OnClick", callback)
    button:SetScript("OnEnter", function()
        if not GameTooltip then return end
        GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
        GameTooltip:SetText(tooltip)
        GameTooltip:Show()
    end)
    button:SetScript("OnLeave", function()
        if GameTooltip then GameTooltip:Hide() end
    end)
    table.insert(panel.panelButtons, button)
    return button
end

local function CreateCloseButton(parent, anchor, onClick)
    local close = CreateFrame("Button", nil, parent, "UIPanelCloseButtonNoScripts")
    close:SetPoint("TOPRIGHT", anchor or parent, "TOPRIGHT", -5, -5)
    if close.GwSkinButton then close:GwSkinButton(true, false) end
    close:SetScript("OnClick", onClick)
    local levelOwner = anchor or parent
    local level = levelOwner and levelOwner.GetFrameLevel and levelOwner:GetFrameLevel() or 0
    close:SetFrameLevel(math.max(1001, level + 10))
    close.__gwBetterBagsSkinSkip = true
    return close
end

local function IsClassicDropDown(object)
    if not object or not object.GetObjectType or object:GetObjectType() ~= "Frame" then return false end
    return object.Button and (object.Left or object.Middle or object.Right)
end

local function IsScrollBar(object)
    return object and object.GwSkinScrollBar
        and type(object.SetHideIfUnscrollable) == "function"
        and type(object.SetInterpolateScroll) == "function"
end

local function IsSettingsListButton(object)
    return object and object.Init
        and (object.Category or object.ThemeName or object.CurrencyName)
end

local function SkinObjectTree(object, scanRoot)
    if not object or object.__gwBetterBagsSkinSkip
        or (object.IsProtected and object:IsProtected())
        or object.item or object.rowButton or object.ItemButton then return end

    local objectType = object.GetObjectType and object:GetObjectType()
    local isDropDown = IsClassicDropDown(object)
    local isScrollBar = IsScrollBar(object)
    local isListButton = IsSettingsListButton(object)
    scanRoot = scanRoot or object
    if isListButton and object.HookScript and not object.__gwBetterBagsListHooked then
        object.__gwBetterBagsListHooked = true
        object:HookScript("OnClick", function()
            if not IsActiveTheme() then return end
            if C_Timer and type(C_Timer.After) == "function" then
                C_Timer.After(0, function()
                    if IsActiveTheme() then SkinObjectTree(scanRoot, scanRoot) end
                end)
            else
                SkinObjectTree(scanRoot, scanRoot)
            end
        end)
    end
    if not object.__gwBetterBagsSkinned then
        if objectType == "FontString" then
            if type(Skin.SkinFont) == "function" then Skin.SkinFont(object, "Normal") end
        elseif objectType == "CheckButton" then
            if type(Skin.SkinCheckBox) == "function" then Skin.SkinCheckBox(object) end
        elseif objectType == "EditBox" then
            if type(Skin.SkinEditBox) == "function" then Skin.SkinEditBox(object) end
        elseif objectType == "Slider" then
            if type(Skin.SkinSlider) == "function" then Skin.SkinSlider(object) end
        elseif isDropDown then
            if type(Skin.SkinDropDown) == "function" then
                local width = object.GetWidth and object:GetWidth()
                Skin.SkinDropDown(object, width)
            end
        elseif isScrollBar then
            if type(Skin.SkinScrollBar) == "function" then Skin.SkinScrollBar(object) end
        elseif objectType == "Button" and not object.__gwBetterBagsNavigation
            and not isListButton then
            if type(Skin.SkinButton) == "function" then Skin.SkinButton(object) end
        end
        object.__gwBetterBagsSkinned = true
    end

    if objectType == "FontString" or isDropDown or isScrollBar then return end
    if object.GetRegions then
        for _, region in ipairs({ object:GetRegions() }) do SkinObjectTree(region, scanRoot) end
    end
    if object.GetChildren then
        for _, child in ipairs({ object:GetChildren() }) do SkinObjectTree(child, scanRoot) end
    end
end

local function SkinWindowContents(frame)
    SkinObjectTree(frame, frame)
    if frame and not frame.__gwBetterBagsSkinOnShow and frame.HookScript then
        frame.__gwBetterBagsSkinOnShow = true
        frame:HookScript("OnShow", function(shownFrame)
            if not IsActiveTheme() then return end
            if C_Timer and type(C_Timer.After) == "function" then
                C_Timer.After(0, function()
                    if IsActiveTheme() then SkinObjectTree(shownFrame, shownFrame) end
                end)
            else
                SkinObjectTree(shownFrame, shownFrame)
            end
        end)
    end
end

local function HookDynamicPane(pane)
    if not pane or pane.__gwBetterBagsDynamicHooked then return end
    pane.__gwBetterBagsDynamicHooked = true
    SkinWindowContents(pane)
end

local function HookPaneModule(paneModule)
    if not paneModule or paneModule.__gwBetterBagsPaneHooked
        or type(paneModule.Create) ~= "function" or type(_G.hooksecurefunc) ~= "function" then
        return
    end
    paneModule.__gwBetterBagsPaneHooked = true
    _G.hooksecurefunc(paneModule, "Create", function(_, parent)
        if not IsActiveTheme() then return end
        if not parent or not parent.GetChildren then return end
        local children = { parent:GetChildren() }
        local pane = children[#children]
        HookDynamicPane(pane)
    end)
end

local function SkinColorPicker(colorPicker, GW)
    if not colorPicker or colorPicker.__gwBetterBagsColorSkinned then return end
    colorPicker.__gwBetterBagsColorSkinned = true
    if colorPicker.GwCreateBackdrop then
        local templates = GW and GW.BackdropTemplates
        colorPicker:GwCreateBackdrop(templates and templates.DefaultWithSmallBorder)
    end
end

local function SkinForm(formFrame, GW)
    if not formFrame or not formFrame.frame then return end
    local layout = formFrame.layout
    if layout then
        for _, section in ipairs(layout.sections or {}) do
            if section.button then section.button.__gwBetterBagsNavigation = true end
        end
        for container in pairs(layout.colorPickers or {}) do
            SkinColorPicker(container.colorPicker, GW)
        end
        for _, pane in ipairs(layout.panes or {}) do HookDynamicPane(pane) end
    end
    if formFrame.ScrollBar and type(Skin.SkinScrollBar) == "function" then
        Skin.SkinScrollBar(formFrame.ScrollBar)
        formFrame.ScrollBar.__gwBetterBagsSkinned = true
    end
    SkinWindowContents(formFrame.frame)
end

local function IsThemeActive(database)
    if not database or type(database.GetTheme) ~= "function" then return false end
    return database:GetTheme() == THEME_KEY
end

local function SkinDialogFields(dialog)
    if not dialog then return end
    if dialog.input and type(Skin.SkinEditBox) == "function" then
        Skin.SkinEditBox(dialog.input)
        dialog.input.__gwBetterBagsSkinned = true
    end
    if dialog.dropdown and type(Skin.SkinDropDown) == "function" then
        Skin.SkinDropDown(dialog.dropdown)
        dialog.dropdown.__gwBetterBagsSkinned = true
    end
    for _, button in ipairs({ dialog.yes, dialog.no, dialog.ok }) do
        if button and type(Skin.SkinButton) == "function" then
            Skin.SkinButton(button)
            button.__gwBetterBagsSkinned = true
        end
    end
    SkinWindowContents(dialog.frame)
end

local function SkinQuestion(dialog)
    if not dialog then return end
    if dialog.frame and not dialog.frame.__gwBetterBagsFrameSkinned
        and type(Skin.SkinFrame) == "function" then
        dialog.frame.__gwBetterBagsFrameSkinned = true
        Skin.SkinFrame(dialog.frame)
    end
    SkinDialogFields(dialog)
end

local function HookQuestionPool(question)
    local pool = question and question._pool
    if not pool or pool.__gwBetterBagsHooked or type(pool.Acquire) ~= "function" then return end
    pool.__gwBetterBagsHooked = true
    local originalAcquire = pool.Acquire
    pool.Acquire = function(self, ...)
        local dialog = originalAcquire(self, ...)
        if IsActiveTheme() then SkinQuestion(dialog) end
        return dialog
    end
end

local function IsBagSlotWindow(frame)
    local name = frame and frame.GetName and frame:GetName()
    return name and string.find(name, "BagSlots", 1, true) ~= nil
end

local function SkinItemDecoration(decoration)
    if not decoration then return end
    local icon = decoration.IconTexture or decoration.icon or decoration.Icon
    if icon then
        icon:SetTexCoord(0.07, 0.93, 0.07, 0.93)
        icon:SetAllPoints(decoration)
        icon:SetAlpha(0.9)
    end
    if decoration.IconBorder then
        decoration.IconBorder:SetAllPoints(decoration)
        decoration.IconBorder:SetTexture(BAG_ITEM_BORDER)
        decoration.IconBorder:SetTexCoord(0, 1, 0, 1)
        decoration.IconBorder:SetBlendMode("BLEND")
        decoration.IconBorder:SetAlpha(0.9)
    end
    if decoration.ItemSlotBackground then decoration.ItemSlotBackground:Hide() end

    local normal = decoration.GetNormalTexture and decoration:GetNormalTexture()
    if normal then normal:SetTexture(nil) end
    local highlight = decoration.GetHighlightTexture and decoration:GetHighlightTexture()
    if highlight then
        highlight:SetAllPoints(decoration)
        highlight:SetTexture(BAG_ITEM_BORDER)
        highlight:SetTexCoord(0, 1, 0, 1)
        highlight:SetBlendMode("ADD")
        highlight:SetAlpha(0.33)
    end
    local pushed = decoration.GetPushedTexture and decoration:GetPushedTexture()
    if pushed then
        pushed:SetAllPoints(decoration)
        pushed:SetTexture(BAG_ITEM_PUSHED)
    end
    if not decoration.gwBackdrop and decoration.CreateTexture then
        decoration.gwBackdrop = decoration:CreateTexture(nil, "BACKGROUND", nil, -1)
        decoration.gwBackdrop:SetTexture(BAG_ITEM_BACKDROP)
        decoration.gwBackdrop:SetAllPoints(decoration)
    end
    if decoration.Count then
        decoration.Count:ClearAllPoints()
        decoration.Count:SetPoint("TOPRIGHT", decoration, "TOPRIGHT", 0, -3)
        decoration.Count:SetJustifyH("RIGHT")
        if type(Skin.SkinFont) == "function" then Skin.SkinFont(decoration.Count, "Small", "THINOUTLINE") end
    end
    decoration.__gwBetterBagsItemSkinned = true
end

local function RegisterTheme()
    local GW = _G.GW2_ADDON
    if not GW or type(GW.CreateFrameHeaderWithBody) ~= "function"
        or not (GW.BackdropTemplates and GW.BackdropTemplates.Default) then
        return
    end
    if not _G.LibStub then return end

    local aceAddon = _G.LibStub("AceAddon-3.0", true)
    local betterBags = aceAddon and aceAddon:GetAddon("BetterBags", true)
    if not betterBags then return end

    local themes = GetModule(betterBags, "Themes")
    local searchBox = GetModule(betterBags, "SearchBox")
    local context = GetModule(betterBags, "Context")
    local contextMenu = GetModule(betterBags, "ContextMenu")
    local events = GetModule(betterBags, "Events")
    local database = GetModule(betterBags, "Database")
    local fonts = GetModule(betterBags, "Fonts")
    local constants = GetModule(betterBags, "Constants")
    local categoryPane = GetModule(betterBags, "CategoryPane")
    local themePane = GetModule(betterBags, "ThemePane")
    local currencyPane = GetModule(betterBags, "CurrencyPane")
    local itemColorPane = GetModule(betterBags, "ItemColorPane")
    local config = GetModule(betterBags, "Config")
    local question = GetModule(betterBags, "Question")
    local groupDialog = GetModule(betterBags, "GroupDialog")
    local searchCategoryConfig = GetModule(betterBags, "SearchCategoryConfig")
    if not themes or type(themes.RegisterTheme) ~= "function" or not searchBox then return end
    IsActiveTheme = function() return IsThemeActive(database) end
    HookPaneModule(categoryPane)
    HookPaneModule(themePane)
    HookPaneModule(currencyPane)
    HookPaneModule(itemColorPane)

    if question and not question.__gwBetterBagsQuestionHooked then
        question.__gwBetterBagsQuestionHooked = true
        HookQuestionPool(question)
        if type(question.OnEnable) == "function" and type(_G.hooksecurefunc) == "function" then
            _G.hooksecurefunc(question, "OnEnable", function(enabledQuestion)
                HookQuestionPool(enabledQuestion)
            end)
        end
    end
    if groupDialog and type(groupDialog.Initialize) == "function"
        and type(_G.hooksecurefunc) == "function" and not groupDialog.__gwBetterBagsHooked then
        groupDialog.__gwBetterBagsHooked = true
        _G.hooksecurefunc(groupDialog, "Initialize", function(dialog)
            if IsThemeActive(database) then SkinDialogFields(dialog) end
        end)
    end
    if searchCategoryConfig and type(searchCategoryConfig.Open) == "function"
        and type(_G.hooksecurefunc) == "function" and not searchCategoryConfig.__gwBetterBagsHooked then
        searchCategoryConfig.__gwBetterBagsHooked = true
        _G.hooksecurefunc(searchCategoryConfig, "Open", function(dialog)
            if IsThemeActive(database) then SkinWindowContents(dialog.frame) end
        end)
    end

    local decorations = {}
    local tabDecorations = {}
    local itemDecorations = {}
    local tabBackgrounds = {}
    local opacityByFrame = {}

    local function SkinTabContainer(tabFrame)
        if not tabFrame or not tabFrame.CreateTexture then return end
        local background = tabBackgrounds[tabFrame]
        if background then
            background.solid:Show()
            background.texture:Show()
            return background
        end
        background = {
            solid = tabFrame:CreateTexture(nil, "BACKGROUND", nil, -2),
            texture = tabFrame:CreateTexture(nil, "BACKGROUND", nil, -1),
        }
        background.solid:SetAllPoints(tabFrame)
        background.solid:SetColorTexture(0.035, 0.022, 0.018, 1)
        background.texture:SetAllPoints(tabFrame)
        background.texture:SetTexture(BAG_SEPARATOR)
        local owner = tabFrame.GetParent and tabFrame:GetParent()
        local opacity = opacityByFrame[owner] or 1
        background.solid:SetAlpha(opacity)
        background.texture:SetAlpha(opacity)
        tabFrame.__gwBetterBagsBackground = background
        tabBackgrounds[tabFrame] = background
        return background
    end

    local function GetDecoration(frame)
        return frame and decorations[frame:GetName()]
    end

    local function CreatePortrait(frame)
        local name = frame:GetName()
        local decoration = decorations[name]
        if decoration then
            decoration:Show()
            if frame.Owner and frame.Owner.tabs then SkinTabContainer(frame.Owner.tabs.frame) end
            return decoration
        end

        decoration = CreateFrame("Frame", name .. "GW2UIPlus", frame)
        decoration:SetAllPoints()
        decoration:SetFrameStrata(frame:GetFrameStrata())
        SetFrameLevel(decoration, frame)
        decoration.panelButtons = {}
        decoration.title = decoration:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        GW.CreateFrameHeaderWithBody(decoration, decoration.title, BAG_ICON, {})
        decoration.gwHeader:ClearAllPoints()
        decoration.gwHeader:SetPoint("BOTTOMLEFT", decoration, "TOPLEFT", 0, -25)
        decoration.gwHeader:SetPoint("BOTTOMRIGHT", decoration, "TOPRIGHT", 0, -25)
        if decoration.gwHeader.windowIcon then
            decoration.gwHeader.windowIcon:ClearAllPoints()
            decoration.gwHeader.windowIcon:SetPoint("CENTER", decoration, "TOPLEFT", -16, 0)
        end
        SetTitleFont(decoration.title, GW)
        decoration.title:ClearAllPoints()
        decoration.title:SetPoint("BOTTOMLEFT", decoration.gwHeader, "BOTTOMLEFT", 35, 10)
        decoration.title:SetText(themes.titles[name] or "")
        SkinMoneyFrame(frame.Owner)
        if frame.Owner and frame.Owner.tabs then SkinTabContainer(frame.Owner.tabs.frame) end

        if decoration.tex then
            decoration.tex:SetTexture(BAG_BACKGROUND)
            decoration.tex:SetDrawLayer("BACKGROUND", 0)
            decoration.tex:Show()
        end
        decoration.solidBackground = decoration:CreateTexture(nil, "BACKGROUND", nil, -1)
        decoration.solidBackground:SetColorTexture(0.025, 0.02, 0.02, 1)
        decoration.solidBackground:SetPoint("TOPLEFT", decoration.gwHeader, "BOTTOMLEFT", 0, 0)
        decoration.solidBackground:SetPoint("BOTTOMRIGHT", decoration, "BOTTOMRIGHT", 0, 0)
        decoration.footer = decoration:CreateTexture(nil, "ARTWORK", nil, 1)
        decoration.footer:SetTexture(BAG_FOOTER)
        decoration.footer:SetHeight(55)
        decoration.footer:SetPoint("TOPLEFT", decoration, "BOTTOMLEFT", 0, 30)
        decoration.footer:SetPoint("TOPRIGHT", decoration, "BOTTOMRIGHT", -3, 30)
        decoration.leftPanel = decoration:CreateTexture(nil, "ARTWORK", nil, 1)
        decoration.leftPanel:SetTexture(BAG_LEFT_PANEL)
        decoration.leftPanel:SetWidth(40)
        decoration.leftPanel:SetPoint("TOPRIGHT", frame, "TOPLEFT", 0, 25)
        decoration.leftPanel:SetPoint("BOTTOMRIGHT", frame, "BOTTOMLEFT", 0, 25)

        CreateCloseButton(decoration.gwHeader, decoration.gwHeader, function()
            local owner = frame.Owner
            local ctx = NewContext(context, "GW2UIPlus_Close")
            if owner and ctx and type(owner.Hide) == "function" then owner:Hide(ctx) end
        end)

        if type(searchBox.CreateBox) == "function" and frame.Owner then
            local box = searchBox:CreateBox(frame.Owner.kind, decoration)
            if box and box.frame then
                box.frame:SetPoint("TOPLEFT", decoration, "TOPLEFT", 0, -40)
                box.frame:SetPoint("BOTTOMRIGHT", decoration, "TOPRIGHT", -10, -60)
                box.frame:SetFrameStrata("DIALOG")
                box.frame:SetFrameLevel(decoration:GetFrameLevel() + 1)
                if box.textBox and type(GW.SkinBagSearchBox) == "function" then
                    GW.SkinBagSearchBox(box.textBox)
                end
                decoration.search = box
            end
        end

        AddPanelButton(decoration, BAG_BUTTON, "显示背包栏", function()
            local owner = frame.Owner
            local slots = owner and owner.slots
            local ctx = NewContext(context, "GW2UIPlus_ToggleSlots")
            if not slots or not ctx then return end
            if slots:IsShown() then
                if owner.kind == (constants and constants.BAG_KIND and constants.BAG_KIND.BANK)
                    and database and type(database.SetShowBankTabs) == "function" then
                    database:SetShowBankTabs(false)
                end
                slots:Hide()
            else
                if owner.kind == (constants and constants.BAG_KIND and constants.BAG_KIND.BANK)
                    and database and type(database.SetShowBankTabs) == "function" then
                    database:SetShowBankTabs(true)
                end
                slots:Draw(ctx)
                slots:Show()
            end
        end)
        AddPanelButton(decoration, SORT_BUTTON, "整理背包", function()
            local owner = frame.Owner
            local ctx = NewContext(context, "GW2UIPlus_Sort")
            if owner and ctx and type(owner.Sort) == "function" then owner:Sort(ctx) end
        end)
        AddPanelButton(decoration, SETTINGS_BUTTON, "打开 BetterBags 设置", function()
            local ctx = NewContext(context, "GW2UIPlus_OpenSettings")
            if events and ctx and type(events.SendMessage) == "function" then
                events:SendMessage(ctx, "config/Open")
            end
        end)
        AddPanelButton(decoration, MENU_BUTTON, "打开背包菜单", function()
            local ctx = NewContext(context, "GW2UIPlus_OpenMenu")
            if contextMenu and ctx and frame.Owner and type(contextMenu.Show) == "function" then
                contextMenu:Show(ctx, frame.Owner.menuList)
            end
        end)

        decorations[name] = decoration
        return decoration
    end

    local function CreateBackdrop(frame, hasClose)
        local name = frame:GetName()
        local decoration = decorations[name]
        if decoration then
            decoration:Show()
            return decoration
        end

        decoration = CreateFrame("Frame", name .. "GW2UIPlus", frame, "BackdropTemplate")
        decoration.__gwBetterBagsSkinSkip = true
        decoration:SetAllPoints()
        decoration:SetFrameStrata(frame:GetFrameStrata())
        SetFrameLevel(decoration, frame)
        decoration:SetBackdrop(GW.BackdropTemplates.Default)
        decoration.title = decoration:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        decoration.title:SetPoint("TOP", decoration, "TOP", 0, -5)
        SetTitleFont(decoration.title, GW)
        decoration.title:SetText(themes.titles[name] or "")
        if hasClose then
            CreateCloseButton(decoration, decoration, function() frame:Hide() end)
        end
        decorations[name] = decoration
        return decoration
    end

    local function ApplySimple(frame)
        if config and config.configFrame and config.configFrame.frame == frame then
            SkinForm(config.configFrame, GW)
        else
            SkinWindowContents(frame)
        end
        CreateBackdrop(frame, true)
    end

    local function ApplyFlat(frame)
        if not IsBagSlotWindow(frame) then SkinWindowContents(frame) end
        CreateBackdrop(frame, false)
    end

    local function ClearTabTexture(texture)
        if not texture then return end
        texture:SetColorTexture(0, 0, 0, 0)
    end

    local function SetTabTextState(decoration, selected)
        if not decoration or not decoration.Text then return end
        if selected then
            decoration.Text:SetTextColor(1, 0.82, 0, 1)
        else
            decoration.Text:SetTextColor(0.92, 0.9, 0.84, 1)
        end
    end

    local function CreateTab(tab)
        local name = tab and tab.GetName and tab:GetName()
        if not name then return themes.CreateDefaultTabDecoration(tab) end
        local decoration = tabDecorations[name]
        if decoration then
            decoration:Show()
            return decoration
        end
        decoration = themes.tabs and themes.tabs[name]
        if not decoration then
            decoration = themes.CreateDefaultTabDecoration(tab)
        end
        SkinTabContainer(tab.GetParent and tab:GetParent())
        for _, texture in ipairs({
            decoration.Left, decoration.Middle, decoration.Right,
            decoration.LeftActive, decoration.MiddleActive, decoration.RightActive,
            decoration.LeftHighlight, decoration.MiddleHighlight, decoration.RightHighlight,
        }) do
            ClearTabTexture(texture)
        end
        decoration.deselectedTextY = 0
        decoration.selectedTextY = 0
        local activeTexture = decoration.LeftActive
        if activeTexture and not decoration.__gwBetterBagsStateHooked
            and type(_G.hooksecurefunc) == "function" then
            decoration.__gwBetterBagsStateHooked = true
            _G.hooksecurefunc(activeTexture, "Show", function()
                SetTabTextState(decoration, true)
            end)
            _G.hooksecurefunc(activeTexture, "Hide", function()
                SetTabTextState(decoration, false)
            end)
        end
        SetTabTextState(decoration, activeTexture and activeTexture:IsShown())
        if decoration.Text and type(Skin.SkinFont) == "function" then
            Skin.SkinFont(decoration.Text, "Normal", "OUTLINE")
            if decoration.Text.GwSetFontTemplate and type(_G.hooksecurefunc) == "function" then
                local applyingFont = false
                _G.hooksecurefunc(decoration.Text, "SetFontObject", function(font)
                    if applyingFont then return end
                    applyingFont = true
                    Skin.SkinFont(font, "Normal", "OUTLINE")
                    SetTabTextState(decoration, activeTexture and activeTexture:IsShown())
                    applyingFont = false
                end)
            end
        end
        tabDecorations[name] = decoration
        return decoration
    end

    if events and type(events.RegisterMessage) == "function"
        and not events.__gwBetterBagsItemHooked then
        events.__gwBetterBagsItemHooked = true
        events:RegisterMessage("item/Updated", function(_, _, decoration)
            if IsActiveTheme() then SkinItemDecoration(decoration) end
        end)
    end

    themes:RegisterTheme("GW2UIPlus", {
        Name = "GW2 UI Plus",
        Description = "由 GW2_UI_PLUS 提供的完整 GW2 风格主题。",
        Available = true,
        DisableMasque = true,
        Portrait = CreatePortrait,
        Simple = ApplySimple,
        Flat = ApplyFlat,
        Opacity = function(frame, alpha)
            local decoration = GetDecoration(frame)
            if not decoration then return end
            local opacity = (alpha or 100) / 100
            opacityByFrame[frame] = opacity
            if decoration.solidBackground then decoration.solidBackground:SetAlpha(opacity) end
            if decoration.tex then decoration.tex:SetAlpha(opacity) end
            if decoration.footer then decoration.footer:SetAlpha(opacity) end
            if decoration.leftPanel then decoration.leftPanel:SetAlpha(opacity) end
            local tabs = frame.Owner and frame.Owner.tabs
            local tabBackground = tabs and tabBackgrounds[tabs.frame]
            if tabBackground then
                tabBackground.solid:SetAlpha(opacity)
                tabBackground.texture:SetAlpha(opacity)
            end
            if decoration.SetBackdropColor then decoration:SetBackdropColor(1, 1, 1, opacity) end
        end,
        SectionFont = function(font)
            if font and font.GwSetFontTemplate and GW.Enum and GW.Enum.TextSizeType then
                font:GwSetFontTemplate(DAMAGE_TEXT_FONT, GW.Enum.TextSizeType.Normal, "OUTLINE")
                font:SetShadowColor(0, 0, 0, 0)
            elseif font and fonts and fonts.UnitFrame12White then
                font:SetFontObject(fonts.UnitFrame12White)
            end
        end,
        SetTitle = function(frame, title)
            local decoration = GetDecoration(frame)
            if decoration and decoration.title then decoration.title:SetText(title or "") end
        end,
        ToggleSearch = function(frame, shown)
            local decoration = GetDecoration(frame)
            if decoration and decoration.search and type(decoration.search.SetShown) == "function" then
                decoration.search:SetShown(shown)
            end
        end,
        PositionBagSlots = function(frame, bagSlotWindow)
            if not frame or not bagSlotWindow then return end
            bagSlotWindow:ClearAllPoints()
            if frame.Owner and frame.Owner.slots and frame.Owner.slots:IsShown() then
                bagSlotWindow:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 0, -2)
            else
                bagSlotWindow:SetPoint("BOTTOMLEFT", frame, "TOPLEFT", 8, 16)
            end
        end,
        OffsetSidebar = function() return -35 end,
        GetFlatHeaderHeight = function() return 0 end,
        ItemButton = function(item)
            local button = item and item.button
            local name = button and button.GetName and button:GetName()
            if not name then return end
            local decoration = itemDecorations[name]
            if not decoration then
                decoration = themes.CreateBlankItemButtonDecoration(item.frame, THEME_KEY, name)
                itemDecorations[name] = decoration
            end
            decoration:Show()
            SkinItemDecoration(decoration)
            return decoration
        end,
        Tab = function(tab)
            return CreateTab(tab)
        end,
        Reset = function()
            for _, decoration in pairs(decorations) do decoration:Hide() end
            for _, decoration in pairs(itemDecorations) do decoration:Hide() end
            for _, decoration in pairs(tabDecorations) do decoration:Hide() end
            for _, background in pairs(tabBackgrounds) do
                background.solid:Hide()
                background.texture:Hide()
            end
        end,
    })
end

Skin.Register("BetterBags", RegisterTheme)
