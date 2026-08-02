local _, addonTable = ...

local Skin = addonTable.Skin
if not Skin then return end

local BAG_ICON = "Interface/AddOns/GW2_UI/textures/bag/bagicon"
local BAG_BACKGROUND = "Interface/AddOns/GW2_UI/textures/bag/bagbg"
local BAG_FOOTER = "Interface/AddOns/GW2_UI/textures/bag/bagfooter"
local BAG_LEFT_PANEL = "Interface/AddOns/GW2_UI/textures/bag/bagleftpanel"
local BAG_SEPARATOR = "Interface/AddOns/GW2_UI/textures/bag/bag-sep"
local BAG_BUTTON = "Interface/AddOns/GW2_UI/Textures/icons/bagmicrobutton-up"
local SORT_BUTTON = "Interface/AddOns/GW2_UI/Textures/icons/microicons/collectionsmicrobutton-up"
local SETTINGS_BUTTON = "Interface/AddOns/GW2_UI/Textures/icons/microicons/questlogmicrobutton-up"
local MENU_BUTTON = "Interface/AddOns/GW2_UI/Textures/icons/microicons/mainmenumicrobutton-up"

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
        button:SetPoint("TOPLEFT", panel, "TOPLEFT", 4, -40)
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

local function SkinWindowContents(frame)
    local function SkinObject(object, isRoot)
        if not object or object.__gwBetterBagsSkinSkip
            or (object.IsProtected and object:IsProtected())
            or object.item or object.rowButton or object.ItemButton
            or (not isRoot and object.__gwBetterBagsSkinned) then return end
        if not isRoot then object.__gwBetterBagsSkinned = true end

        local objectType = object.GetObjectType and object:GetObjectType()
        if objectType == "FontString" then
            if type(Skin.SkinFont) == "function" then Skin.SkinFont(object, "Normal") end
            return
        end

        local skipChildren = false
        if objectType == "CheckButton" then
            if type(Skin.SkinCheckBox) == "function" then Skin.SkinCheckBox(object) end
        elseif objectType == "EditBox" then
            if type(Skin.SkinEditBox) == "function" then Skin.SkinEditBox(object) end
        elseif objectType == "Slider" then
            if type(Skin.SkinSlider) == "function" then Skin.SkinSlider(object) end
        elseif object.GwSkinScrollBar then
            if type(Skin.SkinScrollBar) == "function" then Skin.SkinScrollBar(object) end
            skipChildren = true
        elseif object.GwHandleDropDownBox or object.GwSkinDropDownMenu then
            if type(Skin.SkinDropDown) == "function" then Skin.SkinDropDown(object) end
            skipChildren = true
        elseif objectType == "Frame" and object.GetScript and object:GetScript("OnMouseDown")
            and object.GetWidth and object.GetHeight
            and object:GetWidth() == 24 and object:GetHeight() == 24 then
            if object.GwCreateBackdrop then object:GwCreateBackdrop() end
        elseif objectType == "Button" then
            if type(Skin.SkinButton) == "function" then Skin.SkinButton(object) end
        end
        if skipChildren then return end

        if object.GetRegions then
            for _, region in ipairs({ object:GetRegions() }) do
                SkinObject(region)
            end
        end
        if object.GetChildren then
            for _, child in ipairs({ object:GetChildren() }) do
                SkinObject(child)
            end
        end
    end

    SkinObject(frame, true)
    if frame and not frame.__gwBetterBagsSkinOnShow and frame.HookScript then
        frame.__gwBetterBagsSkinOnShow = true
        frame:HookScript("OnShow", function(shownFrame)
            SkinWindowContents(shownFrame)
        end)
    end
end

local function HookCategoryPane(categoryPane)
    if not categoryPane or categoryPane.__gwBetterBagsCategoryHooked
        or type(categoryPane.Create) ~= "function" or type(_G.hooksecurefunc) ~= "function" then
        return
    end
    categoryPane.__gwBetterBagsCategoryHooked = true
    _G.hooksecurefunc(categoryPane, "Create", function(_, parent)
        if not parent or not parent.GetChildren then return end
        local children = { parent:GetChildren() }
        local pane = children[#children]
        if not pane or pane.__gwBetterBagsCategoryPane then return end
        pane.__gwBetterBagsCategoryPane = true
        local function ApplyPaneSkin()
            if not pane.IsShown or pane:IsShown() then SkinWindowContents(pane) end
        end
        if pane.HookScript then
            pane:HookScript("OnShow", function()
                if pane.__gwBetterBagsCategoryDeferred then return end
                pane.__gwBetterBagsCategoryDeferred = true
                if C_Timer and type(C_Timer.After) == "function" then
                    C_Timer.After(0, function()
                        ApplyPaneSkin()
                    end)
                else
                    ApplyPaneSkin()
                end
            end)
        else
            ApplyPaneSkin()
        end
    end)
end

local function IsBagSlotWindow(frame)
    local name = frame and frame.GetName and frame:GetName()
    return name and string.find(name, "BagSlots", 1, true) ~= nil
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
    if not themes or type(themes.RegisterTheme) ~= "function" or not searchBox then return end
    HookCategoryPane(categoryPane)

    local decorations = {}
    local tabDecorations = {}

    local function GetDecoration(frame)
        return frame and decorations[frame:GetName()]
    end

    local function CreatePortrait(frame)
        local name = frame:GetName()
        local decoration = decorations[name]
        if decoration then
            decoration:Show()
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
        SetTitleFont(decoration.title, GW)
        decoration.title:SetText(themes.titles[name] or "")
        SkinMoneyFrame(frame.Owner)

        if decoration.tex then
            decoration.tex:SetTexture(BAG_BACKGROUND)
            decoration.tex:SetDrawLayer("ARTWORK", 0)
            decoration.tex:Hide()
        end
        decoration.body = decoration:CreateTexture(nil, "ARTWORK", nil, 0)
        decoration.body:SetTexture(BAG_BACKGROUND)
        decoration.body:SetPoint("TOPLEFT", decoration.gwHeader, "BOTTOMLEFT", 0, 0)
        decoration.body:SetPoint("BOTTOMRIGHT", decoration, "BOTTOMRIGHT", 0, 0)
        decoration.footer = decoration:CreateTexture(nil, "ARTWORK", nil, 1)
        decoration.footer:SetTexture(BAG_FOOTER)
        decoration.footer:SetHeight(55)
        decoration.footer:SetPoint("TOPLEFT", decoration, "BOTTOMLEFT", 0, 30)
        decoration.footer:SetPoint("TOPRIGHT", decoration, "BOTTOMRIGHT", -3, 30)
        decoration.leftPanel = decoration:CreateTexture(nil, "ARTWORK", nil, 1)
        decoration.leftPanel:SetTexture(BAG_LEFT_PANEL)
        decoration.leftPanel:SetWidth(40)
        decoration.leftPanel:SetPoint("TOPLEFT", decoration, "TOPLEFT", 0, -25)
        decoration.leftPanel:SetPoint("BOTTOMLEFT", decoration, "BOTTOMLEFT", 0, 25)

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
        SkinWindowContents(frame)
        CreateBackdrop(frame, true)
    end

    local function ApplyFlat(frame)
        if not IsBagSlotWindow(frame) then SkinWindowContents(frame) end
        CreateBackdrop(frame, false)
    end

    local function ApplyTabTexture(texture, r, g, b, a)
        if not texture then return end
        texture:SetTexture(BAG_SEPARATOR)
        texture:SetVertexColor(r, g, b, a)
    end

    local function CreateTab(tab)
        local name = tab and tab.GetName and tab:GetName()
        if not name then return themes.CreateDefaultTabDecoration(tab) end
        local decoration = tabDecorations[name]
        if decoration then
            decoration:Show()
            return decoration
        end
        decoration = themes.CreateDefaultTabDecoration(tab)
        for _, texture in ipairs({ decoration.Left, decoration.Middle, decoration.Right }) do
            ApplyTabTexture(texture, 0.08, 0.08, 0.08, 0.95)
        end
        for _, texture in ipairs({ decoration.LeftActive, decoration.MiddleActive, decoration.RightActive }) do
            ApplyTabTexture(texture, 0.42, 0.28, 0.04, 1)
        end
        if decoration.Text and type(Skin.SkinFont) == "function" then
            Skin.SkinFont(decoration.Text, "Normal", "OUTLINE")
            if decoration.Text.GwSetFontTemplate and type(_G.hooksecurefunc) == "function" then
                local applyingFont = false
                _G.hooksecurefunc(decoration.Text, "SetFontObject", function(font)
                    if applyingFont then return end
                    applyingFont = true
                    Skin.SkinFont(font, "Normal", "OUTLINE")
                    applyingFont = false
                end)
            end
        end
        tabDecorations[name] = decoration
        return decoration
    end

    themes:RegisterTheme("GW2UIPlus", {
        Name = "GW2 UI Plus",
        Description = "由 GW2_UI_PLUS 提供的完整 GW2 风格主题。",
        Available = true,
        Portrait = CreatePortrait,
        Simple = ApplySimple,
        Flat = ApplyFlat,
        Opacity = function(frame, alpha)
            local decoration = GetDecoration(frame)
            if not decoration then return end
            local opacity = (alpha or 100) / 100
            if decoration.body then decoration.body:SetAlpha(opacity) end
            if decoration.tex then decoration.tex:SetAlpha(opacity) end
            if decoration.footer then decoration.footer:SetAlpha(opacity) end
            if decoration.leftPanel then decoration.leftPanel:SetAlpha(opacity) end
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
        OffsetSidebar = function() return 0 end,
        GetFlatHeaderHeight = function() return 0 end,
        Tab = function(tab)
            return CreateTab(tab)
        end,
        Reset = function()
            for _, decoration in pairs(decorations) do decoration:Hide() end
            for _, decoration in pairs(tabDecorations) do decoration:Hide() end
        end,
    })
end

Skin.Register("BetterBags", RegisterTheme)
