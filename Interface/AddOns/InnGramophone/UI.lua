local _, LMP = ...

local UI = {}
LMP.ui = UI


local sourceLabels = {
    all = "全部歌曲",
    Zones = "区域背景音乐",
    Dungeons = "副本背景音乐",
    Various = "更多音频",
    ["local"] = "本地音乐",
    builtin = "内置原声",
}

UI.currentSkinData = nil
UI.themedBackdrops = {}
UI.themedLabels = {}
UI.themedRows = {}

function UI:ApplySkin(skinName)
    local skin = LMP.Skins[skinName] or LMP.Skins["Default"]
    UI.currentSkinData = skin
    if InnGramophoneDB then InnGramophoneDB.skin = skinName end

    for _, data in ipairs(UI.themedBackdrops) do
        if skin.backdrop and (data.bgKey == "panel" or data.bgKey == "sidebar") then
            data.frame:SetBackdrop(skin.backdrop)
        else
            data.frame:SetBackdrop({
                bgFile = "Interface\\Buttons\\WHITE8X8",
                edgeFile = "Interface\\Buttons\\WHITE8X8",
                edgeSize = 1,
            })
        end
        local bgColor = type(data.bgKey) == "string" and skin[data.bgKey] or data.bgKey or skin.panel
        local borderColor = type(data.borderKey) == "string" and skin[data.borderKey] or data.borderKey
        
        -- Transparent border fallback
        if not borderColor then borderColor = {0,0,0,0} end
        
        data.frame:SetBackdropColor(unpack(bgColor))
        data.frame:SetBackdropBorderColor(unpack(borderColor))
    end

    for _, data in ipairs(UI.themedLabels) do
        if data.colorKey then
            data.label:SetTextColor(unpack(skin[data.colorKey]))
        end
    end
    
    for _, row in ipairs(UI.themedRows) do
        if row.isHovered then
            row:SetBackdropColor(unpack(skin.rowHover))
        else
            local isPlaying = (row.trackIndex == LMP.currentIndex and LMP.status == "playing")
            if isPlaying then
                row:SetBackdropColor(0.09, 0.20, 0.17, 1) -- Keep the green tint for active
                row.song:SetTextColor(unpack(skin.accent))
                row.artist:SetTextColor(unpack(skin.accent))
            else
                row:SetBackdropColor(unpack(skin.row))
                row.song:SetTextColor(1, 1, 1, 1)
                row.artist:SetTextColor(unpack(skin.muted))
            end
        end
    end
    
    if UI.playButton then
        UI.playButton:SetBackdropBorderColor(unpack(skin.accent))
    end
    
    if UI.skinBtnText then
        UI.skinBtnText:SetText("皮肤: " .. skin.name)
    end
    
    if UI.RefreshSourceButtons then UI:RefreshSourceButtons() end
    if UI.RefreshSubcategories then UI:RefreshSubcategories() end
end

local modeLabels = {
    sequence = "列表循环",
    ["repeat-one"] = "单曲循环",
    shuffle = "随机播放",
}

local function setBackdrop(frame, bgKey, borderKey)
    table.insert(UI.themedBackdrops, {frame = frame, bgKey = bgKey, borderKey = borderKey})
    if UI.currentSkinData then
        if UI.currentSkinData.backdrop and (bgKey == "panel" or bgKey == "sidebar") then
            frame:SetBackdrop(UI.currentSkinData.backdrop)
        else
            frame:SetBackdrop({
                bgFile = "Interface\\Buttons\\WHITE8X8",
                edgeFile = "Interface\\Buttons\\WHITE8X8",
                edgeSize = 1,
            })
        end
        local bgColor = type(bgKey) == "string" and UI.currentSkinData[bgKey] or bgKey or UI.currentSkinData.panel
        local borderColor = type(borderKey) == "string" and UI.currentSkinData[borderKey] or borderKey
        if not borderColor then borderColor = {0,0,0,0} end
        frame:SetBackdropColor(unpack(bgColor))
        frame:SetBackdropBorderColor(unpack(borderColor))
    else
        frame:SetBackdrop({
            bgFile = "Interface\\Buttons\\WHITE8X8",
            edgeFile = "Interface\\Buttons\\WHITE8X8",
            edgeSize = 1,
        })
    end
end

local function setTooltip(frame, title, description)
    frame:HookScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText(title, 1, 1, 1)
        if description then
            GameTooltip:AddLine(description, unpack(UI.currentSkinData and UI.currentSkinData["muted"] or LMP.Skins["Default"]["muted"]))
        end
        GameTooltip:Show()
    end)
    frame:HookScript("OnLeave", function()
        GameTooltip:Hide()
    end)
end

local function createLabel(parent, text, font, colorKey)
    local label = parent:CreateFontString(nil, "OVERLAY", font or "GameFontNormal")
    label:SetText(text or "")
    if colorKey and type(colorKey) == "string" then
        table.insert(UI.themedLabels, {label = label, colorKey = colorKey})
        if UI.currentSkinData then
            label:SetTextColor(unpack(UI.currentSkinData[colorKey]))
        elseif type(colorKey) ~= "string" then
            label:SetTextColor(unpack(colorKey))
        end
    end
    label:SetJustifyH("LEFT")
    return label
end

local function createTextButton(parent, width, height, text)
    local button = CreateFrame("Button", nil, parent, "BackdropTemplate")
    button:SetSize(width, height)
    setBackdrop(button, "row")

    button.label = createLabel(button, text, "GameFontHighlight")
    button.label:SetPoint("CENTER")
    button.label:SetJustifyH("CENTER")

    button:SetScript("OnEnter", function(self)
        self:SetBackdropColor(unpack(UI.currentSkinData and UI.currentSkinData["rowHover"] or LMP.Skins["Default"]["rowHover"]))
    end)
    button:SetScript("OnLeave", function(self)
        self:SetBackdropColor(unpack(UI.currentSkinData and UI.currentSkinData["row"] or LMP.Skins["Default"]["row"]))
    end)
    return button
end

local function createTransportButton(parent, text, tooltip)
    local button = CreateFrame("Button", nil, parent, "BackdropTemplate")
    button:SetSize(38, 38)
    setBackdrop(button, "row")

    button.label = createLabel(button, text, "GameFontHighlightLarge")
    button.label:SetPoint("CENTER", 0, 1)
    button.label:SetJustifyH("CENTER")

    button:SetScript("OnEnter", function(self)
        self:SetBackdropColor(0.13, 0.18, 0.17, 1)
        self:SetBackdropBorderColor(unpack(UI.currentSkinData and UI.currentSkinData["accent"] or LMP.Skins["Default"]["accent"]))
    end)
    button:SetScript("OnLeave", function(self)
        self:SetBackdropColor(unpack(UI.currentSkinData and UI.currentSkinData["row"] or LMP.Skins["Default"]["row"]))
        self:SetBackdropBorderColor(unpack(UI.currentSkinData and UI.currentSkinData["border"] or LMP.Skins["Default"]["border"]))
    end)
    setTooltip(button, tooltip)
    return button
end

local function formatTime(seconds)
    seconds = math.max(0, math.floor(tonumber(seconds) or 0))
    return ("%d:%02d"):format(math.floor(seconds / 60), seconds % 60)
end

local frame = CreateFrame("Frame", "InnGramophoneFrame", UIParent, "BackdropTemplate")
UI.frame = frame
frame:SetSize(760, 500)
frame:SetPoint("CENTER")
frame:SetFrameStrata("DIALOG")
frame:SetClampedToScreen(true)
frame:SetMovable(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", function(self)
    self:StartMoving()
end)
frame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
end)
setBackdrop(frame, "panel", "border")
frame:Hide()

table.insert(UISpecialFrames, "InnGramophoneFrame")

local topBar = CreateFrame("Frame", nil, frame, "BackdropTemplate")
topBar:SetPoint("TOPLEFT", 1, -1)
topBar:SetPoint("TOPRIGHT", -1, -1)
topBar:SetHeight(54)
setBackdrop(topBar, "sidebar", "border")

local logo = topBar:CreateTexture(nil, "ARTWORK")
logo:SetSize(34, 34)
logo:SetPoint("LEFT", 15, 0)
logo:SetTexture("Interface\\Icons\\INV_Misc_Drum_01")

local title = createLabel(topBar, "旅店留声机", "GameFontNormalLarge", "accent")
title:SetPoint("TOPLEFT", logo, "TOPRIGHT", 12, -8)

local subtitle = createLabel(topBar, "魔兽原声与本地曲库", "GameFontNormalSmall", "muted")
subtitle:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -2)

local countLabel = createLabel(topBar, "", "GameFontNormal", "amber")
UI.countLabel = countLabel
countLabel:SetPoint("RIGHT", -50, 0)
countLabel:SetWidth(150)
countLabel:SetJustifyH("RIGHT")

local closeButton = CreateFrame("Button", nil, topBar, "UIPanelCloseButton")
closeButton:SetPoint("TOPRIGHT", 2, 2)
closeButton:SetScript("OnClick", function()
    frame:Hide()
end)

local skinBtn = CreateFrame("Button", nil, topBar)
skinBtn:SetSize(120, 24)
skinBtn:SetPoint("RIGHT", UI.countLabel, "LEFT", -20, 0)
local skinBtnText = skinBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
skinBtnText:SetPoint("CENTER")
skinBtnText:SetText("皮肤: 默认")
UI.skinBtnText = skinBtnText
skinBtnText:SetTextColor(1, 0.82, 0)

-- Dropdown Menu for Skins
local skinDropdown = CreateFrame("Frame", "InnGramophoneSkinDropdown", skinBtn, "UIDropDownMenuTemplate")
skinDropdown:Hide()

local function SkinDropdown_Initialize(self, level)
    local info = UIDropDownMenu_CreateInfo()
    for _, skinName in ipairs(LMP.SkinOrder) do
        local skin = LMP.Skins[skinName]
        info.text = skin.name
        info.func = function()
            UI:ApplySkin(skinName)
        end
        info.checked = (UI.currentSkinData and UI.currentSkinData.name == skin.name)
        UIDropDownMenu_AddButton(info, level)
    end
end

UIDropDownMenu_Initialize(skinDropdown, SkinDropdown_Initialize, "MENU")

skinBtn:SetScript("OnClick", function(self)
    ToggleDropDownMenu(1, nil, skinDropdown, self, 0, 0)
end)
skinBtn:SetScript("OnEnter", function() skinBtnText:SetTextColor(1, 1, 1) end)
skinBtn:SetScript("OnLeave", function() skinBtnText:SetTextColor(1, 0.82, 0) end)


local sidebar = CreateFrame("Frame", nil, frame, "BackdropTemplate")
sidebar:SetPoint("TOPLEFT", 10, -64)
sidebar:SetSize(146, 322)
setBackdrop(sidebar, "sidebar")

local libraryTitle = createLabel(sidebar, "曲 库", "GameFontNormal", "muted")
libraryTitle:SetPoint("TOPLEFT", 14, -15)

UI.source = "all"
UI.sourceButtons = {}

local sourceOrder = {"all", "Zones", "Dungeons", "Various", "local"}
for index, source in ipairs(sourceOrder) do
    local button = createTextButton(sidebar, 122, 36, sourceLabels[source])
    button:SetPoint("TOPLEFT", 12, -42 - (index - 1) * 42)
    button.source = source
    button.label:ClearAllPoints()
    button.label:SetPoint("LEFT", 13, 0)
    button.label:SetJustifyH("LEFT")
    button:SetScript("OnClick", function(self)
        UI.source = self.source
        UI.scrollOffset = 0
        UI.subScrollOffset = 0
        UI.activeSubcategory = nil
        UI:RefreshLayout()
        UI:RefreshSubcategories()
        UI:RefreshLibrary()
    end)
    UI.sourceButtons[index] = button
end


local helpFrame = CreateFrame("Frame", "InnGramophoneHelp", frame, "BackdropTemplate")
helpFrame:SetSize(400, 260)
helpFrame:SetPoint("CENTER", frame, "CENTER")
helpFrame:SetFrameStrata("TOOLTIP")
setBackdrop(helpFrame, "sidebar")

-- Create Drop Shadow
local function CreateDropShadow(f)
    local shadow = CreateFrame("Frame", nil, f, "BackdropTemplate")
    shadow:SetFrameLevel(f:GetFrameLevel() - 1)
    shadow:SetPoint("TOPLEFT", -6, 6)
    shadow:SetPoint("BOTTOMRIGHT", 6, -6)
    shadow:SetBackdrop({
        edgeFile = "Interface\\AddOns\\InnGramophone\\shadow", -- if we don't have this, we use generic
        edgeSize = 16,
    })
    -- fallback to a generic glow if shadow texture not provided:
    shadow:SetBackdrop({
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", 
        edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 },
    })
    shadow:SetBackdropBorderColor(0, 0, 0, 1)
end
CreateDropShadow(helpFrame)

local helpBg = helpFrame:CreateTexture(nil, "BACKGROUND")
helpBg:SetAllPoints()
helpBg:SetColorTexture(0.05, 0.06, 0.07, 0.98)
helpFrame:Hide()

local helpTitle = createLabel(helpFrame, "如何导入本地音乐？", "GameFontNormalLarge", "accent")
helpTitle:SetPoint("TOP", 0, -20)

local helpText = createLabel(helpFrame, "由于魔兽客户端的安全限制，插件无法直接扫描你的电脑文件。你需要手动注册音乐：\n\n1. 在插件目录 (Interface/AddOns/InnGramophone/) 下创建一个叫 Music 的文件夹。\n2. 将你的 .mp3 或 .ogg 音乐放入该文件夹。\n3. 用记事本打开插件目录下的 LocalTracks.lua 文件。\n4. 参考里面的模板，将你的歌名和文件名填入。\n5. 保存文件后，在游戏内输入 /reload 重载界面即可！", "GameFontHighlight", {1, 1, 1, 1})
helpText:SetPoint("TOPLEFT", 20, -55)
helpText:SetPoint("TOPRIGHT", -20, -55)
helpText:SetJustifyH("LEFT")

local helpCloseBtn = CreateFrame("Button", nil, helpFrame, "UIPanelButtonTemplate")
helpCloseBtn:SetSize(100, 30)
helpCloseBtn:SetPoint("BOTTOM", 0, 20)
helpCloseBtn:SetText("明白了")
helpCloseBtn:SetScript("OnClick", function() helpFrame:Hide() end)

local helpBtn = CreateFrame("Button", nil, topBar)
UI.helpBtn = helpBtn
helpBtn:SetSize(130, 24)
helpBtn:SetPoint("CENTER", 0, 0)
helpBtn:Hide()
local helpBtnText = helpBtn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
helpBtnText:SetPoint("CENTER")
helpBtnText:SetText("如何导入本地音乐？")
helpBtnText:SetTextColor(unpack(UI.currentSkinData and UI.currentSkinData["muted"] or LMP.Skins["Default"]["muted"]))
helpBtn:SetScript("OnClick", function() helpFrame:Show() end)
helpBtn:SetScript("OnEnter", function() helpBtnText:SetTextColor(unpack(UI.currentSkinData and UI.currentSkinData["accent"] or LMP.Skins["Default"]["accent"])) end)
helpBtn:SetScript("OnLeave", function() helpBtnText:SetTextColor(unpack(UI.currentSkinData and UI.currentSkinData["muted"] or LMP.Skins["Default"]["muted"])) end)


local subPanel = CreateFrame("Frame", nil, frame, "BackdropTemplate")
subPanel:SetPoint("TOPLEFT", 166, -64)
subPanel:SetSize(156, 322)
setBackdrop(subPanel, "sidebar")

local subTitle = createLabel(subPanel, "子分类", "GameFontNormal", "muted")
subTitle:SetPoint("TOPLEFT", 14, -15)

UI.subButtons = {}
UI.activeSubcategory = nil
UI.subScrollOffset = 0

for index = 1, 9 do
    local button = createTextButton(subPanel, 140, 28, "")
    button.label:ClearAllPoints()
    button.label:SetPoint("LEFT", 13, 0)
    button.label:SetJustifyH("LEFT")
    button.label:SetWordWrap(false)
    button:SetPoint("TOPLEFT", 12, -42 - (index - 1) * 30)
    button:SetScript("OnClick", function(self)
        if self.sub then
            UI.activeSubcategory = self.sub
            UI:RefreshSubcategories()
            UI.scrollOffset = 0
            UI:RefreshLibrary()
        end
    end)
    UI.subButtons[index] = button
end

subPanel:EnableMouseWheel(true)
subPanel:SetScript("OnMouseWheel", function(_, delta)
    if UI.subList and #UI.subList > 8 then
        local maxOffset = #UI.subList - 8
        UI.subScrollOffset = math.max(0, math.min(maxOffset, UI.subScrollOffset - delta * 2))
        UI:RefreshSubcategories()
    end
end)

local listPanel = CreateFrame("Frame", nil, frame, "BackdropTemplate")
listPanel:SetPoint("TOPLEFT", 166, -64)
listPanel:SetPoint("RIGHT", -10, 0)
listPanel:SetHeight(322)
setBackdrop(listPanel, "panel", "border")

local listHeader = CreateFrame("Frame", nil, listPanel, "BackdropTemplate")
listHeader:SetPoint("TOPLEFT", 1, -1)
listHeader:SetPoint("TOPRIGHT", -1, -1)
listHeader:SetHeight(28)
setBackdrop(listHeader, "row", "border")

local numberHeader = createLabel(listHeader, "#", "GameFontNormalSmall", "muted")
numberHeader:SetPoint("LEFT", 11, 0)
numberHeader:SetWidth(24)

local songHeader = createLabel(listHeader, "歌曲", "GameFontNormalSmall", "muted")
songHeader:SetPoint("LEFT", 43, 0)

local artistHeader = createLabel(listHeader, "艺术家", "GameFontNormalSmall", "muted")
artistHeader:SetPoint("RIGHT", -54, 0)
artistHeader:SetJustifyH("RIGHT")
    

local durationHeader = createLabel(listHeader, "时长", "GameFontNormalSmall", "muted")
durationHeader:SetPoint("RIGHT", -12, 0)
durationHeader:SetWidth(45)
durationHeader:SetJustifyH("RIGHT")

UI.rows = {}
UI.visibleTracks = {}
UI.scrollOffset = 0

for index = 1, 11 do
    local row = CreateFrame("Button", nil, listPanel, "BackdropTemplate")
    row:SetPoint("TOPLEFT", 5, -33 - (index - 1) * 25)
    row:SetPoint("TOPRIGHT", -5, -33 - (index - 1) * 25)
    row:SetHeight(24)
    setBackdrop(row, "row", nil)

    row.number = createLabel(row, "", "GameFontNormalSmall", "muted")
    row.number:SetPoint("LEFT", 7, 0)
    row.number:SetWidth(27)

    row.duration = createLabel(row, "", "GameFontNormalSmall", "muted")
    row.duration:SetPoint("RIGHT", -7, 0)
    row.duration:SetWidth(42)
    row.duration:SetJustifyH("RIGHT")

    row.artist = createLabel(row, "", "GameFontNormalSmall", "muted")
    row.artist:SetPoint("RIGHT", row.duration, "LEFT", -10)
    row.artist:SetWidth(110)
    row.artist:SetWordWrap(false)
    row.artist:SetJustifyH("RIGHT")

    row.song = createLabel(row, "", "GameFontHighlight")
    row.song:SetPoint("LEFT", 39, 0)
    row.song:SetPoint("RIGHT", row.artist, "LEFT", -10)
    row.song:SetWordWrap(false)

    row:SetScript("OnClick", function(self)
        if self.trackIndex then
            LMP:Play(self.trackIndex)
        end
    end)
    row:SetScript("OnEnter", function(self)
        self:SetBackdropColor(unpack(UI.currentSkinData and UI.currentSkinData["rowHover"] or LMP.Skins["Default"]["rowHover"]))
    end)
    row:SetScript("OnLeave", function()
        UI:RefreshRows()
    end)
    UI.rows[index] = row
end

listPanel:EnableMouseWheel(true)
listPanel:SetScript("OnMouseWheel", function(_, delta)
    local maxOffset = math.max(0, #UI.visibleTracks - #UI.rows)
    UI.scrollOffset = math.max(0, math.min(maxOffset, UI.scrollOffset - delta * 3))
    UI:RefreshRows()
end)

local emptyLabel = createLabel(listPanel, "这个曲库还没有歌曲", "GameFontNormalLarge", "muted")
UI.emptyLabel = emptyLabel
emptyLabel:SetPoint("CENTER", 0, -10)

local footer = CreateFrame("Frame", nil, frame, "BackdropTemplate")
footer:SetPoint("BOTTOMLEFT", 1, 1)
footer:SetPoint("BOTTOMRIGHT", -1, 1)
footer:SetHeight(103)
setBackdrop(footer, "sidebar", "border")

local cover = footer:CreateTexture(nil, "ARTWORK")
cover:SetSize(58, 58)
cover:SetPoint("LEFT", 15, 6)
cover:SetTexture("Interface\\Icons\\INV_Misc_Drum_01")

local currentTitle = createLabel(footer, "选择一首歌曲", "GameFontHighlight")
UI.currentTitle = currentTitle
currentTitle:SetPoint("TOPLEFT", cover, "TOPRIGHT", 12, -5)
currentTitle:SetWidth(205)
currentTitle:SetWordWrap(false)

local currentArtist = createLabel(footer, "播放器已就绪", "GameFontNormalSmall", "muted")
UI.currentArtist = currentArtist
currentArtist:SetPoint("TOPLEFT", currentTitle, "BOTTOMLEFT", 0, -7)
currentArtist:SetWidth(205)
currentArtist:SetWordWrap(false)

local previousButton = createTransportButton(footer, "|<<", "上一首")
UI.previousButton = previousButton
previousButton:SetPoint("CENTER", footer, "CENTER", -54, 10)
previousButton:SetScript("OnClick", function()
    LMP:Previous()
end)

local playButton = createTransportButton(footer, ">", "播放")
UI.playButton = playButton
playButton:SetSize(46, 46)
playButton:SetPoint("CENTER", footer, "CENTER", 0, 10)
playButton:SetBackdropBorderColor(unpack(UI.currentSkinData and UI.currentSkinData["accent"] or LMP.Skins["Default"]["accent"]))
playButton:SetScript("OnClick", function()
    if LMP.status == "playing" then
        LMP:Pause()
    else
        LMP:Play()
    end
end)
setTooltip(playButton, "播放 / 暂停", "受 WoW 限制，暂停后再次播放会从歌曲开头开始。")

local nextButton = createTransportButton(footer, ">>|", "下一首")
UI.nextButton = nextButton
nextButton:SetPoint("CENTER", footer, "CENTER", 54, 10)
nextButton:SetScript("OnClick", function()
    LMP:Next()
end)

local modeButton = createTextButton(footer, 88, 28, modeLabels[LMP.mode])
UI.modeButton = modeButton
modeButton:SetPoint("RIGHT", -139, 11)
modeButton:SetScript("OnClick", function()
    LMP:CycleMode()
end)
setTooltip(modeButton, "切换播放模式", "列表循环、单曲循环、随机播放")

local volumeLabel = createLabel(footer, "主音量", "GameFontNormalSmall", "muted")
volumeLabel:SetPoint("BOTTOMRIGHT", -24, 15)

local volumeSlider = CreateFrame("Slider", "InnGramophoneVolumeSlider", footer, "OptionsSliderTemplate")
UI.volumeSlider = volumeSlider
volumeSlider:SetPoint("RIGHT", -17, 7)
volumeSlider:SetSize(105, 16)
volumeSlider:SetMinMaxValues(0, 1)
volumeSlider:SetValueStep(0.05)
volumeSlider:SetObeyStepOnDrag(true)
volumeSlider:SetValue(tonumber(GetCVar("Sound_MasterVolume")) or 1)
volumeSlider:SetScript("OnValueChanged", function(_, value)
    SetCVar("Sound_MasterVolume", ("%.2f"):format(value))
end)
for _, suffix in ipairs({"Low", "High", "Text"}) do
    local sliderLabel = _G[volumeSlider:GetName() .. suffix]
    if sliderLabel then
        sliderLabel:SetText("")
    end
end
setTooltip(volumeSlider, "主音量", "此滑块会调整游戏的全局主音量。")

local progress = CreateFrame("StatusBar", nil, footer, "BackdropTemplate")
UI.progress = progress
progress:SetPoint("BOTTOMLEFT", 15, 8)
progress:SetPoint("BOTTOMRIGHT", -15, 8)
progress:SetHeight(4)
progress:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
progress:SetStatusBarColor(unpack(UI.currentSkinData and UI.currentSkinData["accent"] or LMP.Skins["Default"]["accent"]))
progress:SetMinMaxValues(0, 1)
progress:SetValue(0)
setBackdrop(progress, "muted", nil)

local elapsedLabel = createLabel(footer, "0:00", "GameFontNormalSmall", "muted")
UI.elapsedLabel = elapsedLabel
elapsedLabel:SetPoint("BOTTOMLEFT", 15, 16)

local totalLabel = createLabel(footer, "0:00", "GameFontNormalSmall", "muted")
UI.totalLabel = totalLabel
totalLabel:SetPoint("BOTTOMLEFT", 52, 16)

function UI:RefreshLayout()
    if self.helpBtn then
        self.helpBtn:SetShown(self.source == "local")
    end
    if self.source == "all" or self.source == "local" then
        subPanel:Hide()
        listPanel:ClearAllPoints()
        listPanel:SetPoint("TOPLEFT", 166, -64)
        listPanel:SetPoint("RIGHT", -10, 0)
    else
        subPanel:Show()
        listPanel:ClearAllPoints()
        listPanel:SetPoint("TOPLEFT", 322, -64)
        listPanel:SetPoint("RIGHT", -10, 0)
    end
end

function UI:RefreshSubcategories()
    if self.source == "all" or self.source == "local" then
        return
    end
    
    local subs = {}
    local subSet = {}
    for _, track in ipairs(LMP.tracks) do
        if track.category1 == sourceLabels[self.source] then
            if track.category2 and not subSet[track.category2] then
                subSet[track.category2] = true
                table.insert(subs, track.category2)
            end
        end
    end
    self.subList = subs
    
    if not self.activeSubcategory and #subs > 0 then
        self.activeSubcategory = subs[1]
    end
    
    for index, button in ipairs(self.subButtons) do
        local subIndex = self.subScrollOffset + index
        local sub = subs[subIndex]
        if sub then
            button.sub = sub
            button.label:SetText(sub)
            if button.sub == self.activeSubcategory then
                button:SetBackdropColor(0.10, 0.18, 0.16, 1)
                button:SetBackdropBorderColor(unpack(UI.currentSkinData and UI.currentSkinData["accent"] or LMP.Skins["Default"]["accent"]))
                button.label:SetTextColor(unpack(UI.currentSkinData and UI.currentSkinData["accent"] or LMP.Skins["Default"]["accent"]))
            else
                button:SetBackdropColor(unpack(UI.currentSkinData and UI.currentSkinData["row"] or LMP.Skins["Default"]["row"]))
                button:SetBackdropBorderColor(unpack(UI.currentSkinData and UI.currentSkinData["border"] or LMP.Skins["Default"]["border"]))
                button.label:SetTextColor(1, 1, 1)
            end
            button:Show()
        else
            button.sub = nil
            button:Hide()
        end
    end
end

function UI:RefreshSourceButtons()
    for _, button in ipairs(self.sourceButtons) do
        if button.source == self.source then
            button:SetBackdropColor(0.10, 0.18, 0.16, 1)
            button:SetBackdropBorderColor(unpack(UI.currentSkinData and UI.currentSkinData["accent"] or LMP.Skins["Default"]["accent"]))
            button.label:SetTextColor(unpack(UI.currentSkinData and UI.currentSkinData["accent"] or LMP.Skins["Default"]["accent"]))
        else
            button:SetBackdropColor(unpack(UI.currentSkinData and UI.currentSkinData["row"] or LMP.Skins["Default"]["row"]))
            button:SetBackdropBorderColor(unpack(UI.currentSkinData and UI.currentSkinData["border"] or LMP.Skins["Default"]["border"]))
            button.label:SetTextColor(1, 1, 1)
        end
    end
end

function UI:RefreshRows()
    for rowIndex, row in ipairs(self.rows) do
        local visibleIndex = self.scrollOffset + rowIndex
        local trackIndex = self.visibleTracks[visibleIndex]
        local track = trackIndex and LMP.tracks[trackIndex]
        if track then
            row.trackIndex = trackIndex
            row.number:SetText(visibleIndex)
            row.song:SetText(track.title)
            row.artist:SetText(track.artist)
            row.duration:SetText(formatTime(track.duration))
            if trackIndex == LMP.currentIndex and LMP.status == "playing" then
                row:SetBackdropColor(0.09, 0.20, 0.17, 1)
                row.song:SetTextColor(unpack(UI.currentSkinData and UI.currentSkinData["accent"] or LMP.Skins["Default"]["accent"]))
            else
                local background = rowIndex % 2 == 0 and {0.06, 0.066, 0.067, 0.72} or (UI.currentSkinData and UI.currentSkinData["row"] or LMP.Skins["Default"]["row"])
                row:SetBackdropColor(unpack(background))
                row.song:SetTextColor(1, 1, 1)
            end
            row:Show()
        else
            row.trackIndex = nil
            row:Hide()
        end
    end
end

function UI:RefreshLibrary()
    self.visibleTracks = {}
    for index, track in ipairs(LMP.tracks) do
        local match = false
        if self.source == "all" then
            match = true
        elseif self.source == "local" then
            match = track.source == "local"
        else
            match = track.category1 == sourceLabels[self.source] and (not self.activeSubcategory or track.category2 == self.activeSubcategory)
        end
        
        if match then
            table.insert(self.visibleTracks, index)
        end
    end

    local maxOffset = math.max(0, #self.visibleTracks - #self.rows)
    self.scrollOffset = math.min(self.scrollOffset, maxOffset)
    self.countLabel:SetText(("%s · %d 首"):format(self.activeSubcategory or sourceLabels[self.source], #self.visibleTracks))
    self.emptyLabel:SetShown(#self.visibleTracks == 0)
    self:RefreshSourceButtons()
    self:RefreshRows()
end

function UI:RefreshPlayer()
    local track = LMP:GetCurrentTrack()
    if track then
        self.currentTitle:SetText(track.title)
        self.currentArtist:SetText(("%s · %s"):format(track.artist, sourceLabels[track.source]))
        self.totalLabel:SetText(formatTime(track.duration))
    else
        self.currentTitle:SetText("选择一首歌曲")
        self.currentArtist:SetText("播放器已就绪")
        self.totalLabel:SetText("0:00")
    end

    if LMP.status == "playing" then
        self.playButton.label:SetText("||")
    else
        self.playButton.label:SetText(">")
    end
    self.modeButton.label:SetText(modeLabels[LMP.mode] or modeLabels.sequence)
    self:RefreshRows()
end

function UI:RefreshProgress()
    local track = LMP:GetCurrentTrack()
    local elapsed = LMP:GetElapsed()
    local duration = track and track.duration or 0
    self.elapsedLabel:SetText(formatTime(elapsed))
    self.progress:SetValue(duration > 0 and elapsed / duration or 0)
end

function UI:Refresh()
    self:RefreshLayout()
    self:RefreshSubcategories()
    self:RefreshLibrary()
    self:RefreshPlayer()
    self:RefreshProgress()
end

frame:SetScript("OnShow", function()
    UI:Refresh()
end)

local updateElapsed = 0
frame:SetScript("OnUpdate", function(_, elapsed)
    updateElapsed = updateElapsed + elapsed
    if updateElapsed >= 0.2 then
        updateElapsed = 0
        UI:RefreshProgress()
    end
end)

LMP:LoadSettings()
LMP:SetStateChanged(function()
    UI:RefreshPlayer()
    UI:RefreshProgress()
end)
UI:Refresh()

SLASH_INNGRAMOPHONE1 = "/lmp"
SLASH_INNGRAMOPHONE2 = "/musicplayer"
SlashCmdList.INNGRAMOPHONE = function()
    if frame:IsShown() then
        frame:Hide()
    else
        frame:Show()
    end
end

local minimapButton = CreateFrame("Button", "InnGramophoneMinimapButton", Minimap, "BackdropTemplate")
UI.minimapButton = minimapButton
minimapButton:SetSize(32, 32)
minimapButton:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 5, 5)
minimapButton:RegisterForClicks("LeftButtonUp", "RightButtonUp")
setBackdrop(minimapButton, "panel", "accent")

local minimapIcon = minimapButton:CreateTexture(nil, "ARTWORK")
minimapIcon:SetPoint("TOPLEFT", 3, -3)
minimapIcon:SetPoint("BOTTOMRIGHT", -3, 3)
minimapIcon:SetTexture("Interface\\Icons\\INV_Misc_Drum_01")

minimapButton:SetScript("OnClick", function(_, button)
    if button == "RightButton" then
        LMP:Stop()
    else
        SlashCmdList.INNGRAMOPHONE()
    end
end)
setTooltip(minimapButton, "旅店留声机", "左键：打开播放器\n右键：停止播放")

print("|cff33d1b2[旅店留声机]|r 加载成功！请输入 /lmp 或点击小地图图标打开播放器。")

local eventFrame = CreateFrame("Frame")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:SetScript("OnEvent", function(self, event, addonName)
    if addonName == "InnGramophone" then
        if not InnGramophoneDB then
            InnGramophoneDB = { skin = "Default" }
        end
        UI:ApplySkin(InnGramophoneDB.skin or "Default")
    end
end)

-- Apply default skin immediately so it's not totally unstyled before ADDON_LOADED
UI:ApplySkin("Default")
