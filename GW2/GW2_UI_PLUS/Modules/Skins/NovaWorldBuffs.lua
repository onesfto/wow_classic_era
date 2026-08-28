local _, addonTable = ...
local Skin = addonTable.Skin
if not Skin then return end
local function SkinTimerFrame(tf)
    if not tf then return end
    if tf.GwStripTextures then tf:GwStripTextures() end
    if tf.Background then tf.Background:SetAlpha(0) end
    for _, key in ipairs({ "fs", "fs1", "fs2" }) do
        Skin.SkinFont(tf[key], "Small", "OUTLINE")
    end
end
local function SkinMarker(frame)
    if not frame then return end
    if frame.tooltip then Skin.SkinTooltip(frame.tooltip) end
    for _, key in ipairs({ "timerFrame", "noLayerFrame" }) do
        SkinTimerFrame(frame[key])
    end
    for _, key in ipairs({ "fs", "fs1", "fs2", "fsLayer" }) do
        Skin.SkinFont(frame[key], "Small", "OUTLINE")
    end
end
local function SkinMarkers(tbl)
    if not tbl then return end
    for k in pairs(tbl) do
        SkinMarker(_G[k .. "NWB"])
        SkinMarker(_G[k .. "NWBMini"])
    end
end
local PAD = 30
local CONTROL_GAP = 8
local BUFF_LIST_TOP_GAP = 20
local BUFF_FIXED_REGION_HEIGHT = PAD + 32
local BUFF_SCROLL_INSET = PAD + 44
local function StackButtonsTopRight(frameName, buttonNames)
    local anchor = _G[frameName]
    if not anchor then return end
    local prev
    for _, key in ipairs(buttonNames) do
        local btn = _G[key]
        if btn then
            btn:ClearAllPoints()
            if not prev then
                btn:SetPoint("TOPRIGHT", anchor, "TOPRIGHT", -PAD, -PAD)
            else
                btn:SetPoint("TOPRIGHT", prev, "BOTTOMRIGHT", 0, -5)
            end
            prev = btn
        end
    end
end
local function LayoutGWScrollBar(frame, scrollBar, scrollInset)
    if not frame or not scrollBar then return end
    local inset = scrollInset or 24
    scrollBar:ClearAllPoints()
    scrollBar:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -8, -inset)
    scrollBar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -8, inset)
    if not scrollBar.__gwTrack and scrollBar.CreateTexture then
        scrollBar.__gwTrack = scrollBar:CreateTexture(nil, "BACKGROUND")
    end
    local track = scrollBar.__gwTrack
    if track then
        track:SetTexture("Interface/AddOns/GW2_UI/textures/uistuff/scrollbg.png")
        track:ClearAllPoints()
        track:SetPoint("TOP", scrollBar, "TOP")
        track:SetPoint("BOTTOM", scrollBar, "BOTTOM")
        track:SetWidth(3)
    end
end
local function EnsureBuffViewport(frame)
    if not frame then return end
    if not frame.__gwBuffViewport then
        local viewport = CreateFrame("Frame", nil, frame)
        viewport:SetClipsChildren(true)
        frame.__gwBuffViewport = viewport
    end
    local viewport = frame.__gwBuffViewport
    viewport:ClearAllPoints()
    viewport:SetPoint("TOPLEFT", frame, "TOPLEFT", 0, -BUFF_FIXED_REGION_HEIGHT)
    viewport:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 0, BUFF_FIXED_REGION_HEIGHT)
    viewport:SetFrameLevel(frame:GetFrameLevel() + 1)
    return viewport
end
local function BuffWindow_OnMouseWheel(self, delta)
    local scrollBar = self.__gwBuffScrollBar
    if scrollBar and scrollBar:IsShown() then
        scrollBar:SetValue(scrollBar:GetValue() - (delta * 42))
    end
end
local function LayoutBuffLines(frame, viewport, captureAnchors, scrollValue)
    if not frame or not viewport then return end
    local scrollBar = _G.NWBbuffListFrameScrollBar or frame.ScrollBar
    local scrollOffset = scrollValue
        or (scrollBar and scrollBar.GetValue and scrollBar:GetValue()) or 0
    local maxDepth = 0
    local index = 1
    while _G[index .. "NWBBuffsLine"] do
        local line = _G[index .. "NWBBuffsLine"]
        local _, relativeTo, _, _, y = line:GetPoint(1)
        if line:IsShown() then
            if y and (captureAnchors or relativeTo == frame.EditBox) then
                line.__gwBuffBaseY = y - PAD - BUFF_LIST_TOP_GAP
            end
            local baseY = line.__gwBuffBaseY
            if baseY then
                line:SetParent(viewport)
                line:ClearAllPoints()
                line:SetPoint("LEFT", viewport, "TOPLEFT",
                    PAD, baseY + BUFF_FIXED_REGION_HEIGHT + scrollOffset)
                line:SetWidth(frame:GetWidth() - PAD - 120)
                line:SetFrameLevel(viewport:GetFrameLevel() + 1)
                line.__gwBuffScrollBar = scrollBar
                line:EnableMouseWheel(true)
                line:SetScript("OnMouseWheel", BuffWindow_OnMouseWheel)
                maxDepth = math.max(maxDepth,
                    -(baseY + BUFF_FIXED_REGION_HEIGHT) + (line:GetHeight() / 2) + PAD)
            end
        end
        index = index + 1
    end
    local maxScroll = math.max(0, maxDepth - viewport:GetHeight())
    if scrollBar then
        frame.__gwUpdatingBuffScroll = true
        scrollBar:SetMinMaxValues(0, maxScroll)
        if scrollBar.SetValueStep then scrollBar:SetValueStep(14) end
        if scrollBar:GetValue() > maxScroll then scrollBar:SetValue(maxScroll) end
        scrollBar:SetShown(maxScroll > 0)
        frame.__gwUpdatingBuffScroll = nil
    end
end
local function LayoutBuffListFrame(NWB, captureLines)
    local frame = _G.NWBbuffListFrame
    if not frame then return end
    local viewport = EnsureBuffViewport(frame)
    local fixedLevel = frame:GetFrameLevel() + 3
    if NWB.showStatsButton then
        NWB.showStatsButton:SetParent(frame)
        NWB.showStatsButton:ClearAllPoints()
        NWB.showStatsButton:SetPoint("TOPLEFT", frame, "TOPLEFT", PAD, -PAD)
        NWB.showStatsButton:SetFrameLevel(fixedLevel)
    end
    local showStatsText = _G.NWBShowStatsButtonText
    if showStatsText and NWB.showStatsButton then
        showStatsText:ClearAllPoints()
        showStatsText:SetPoint("LEFT", NWB.showStatsButton, "RIGHT", CONTROL_GAP, 0)
        showStatsText:SetJustifyV("MIDDLE")
    end
    if NWB.showStatsAllButton and NWB.showStatsButton then
        NWB.showStatsAllButton:SetParent(frame)
        NWB.showStatsAllButton:ClearAllPoints()
        if showStatsText then
            NWB.showStatsAllButton:SetPoint("LEFT", showStatsText, "RIGHT", CONTROL_GAP, 0)
        else
            NWB.showStatsAllButton:SetPoint("LEFT", NWB.showStatsButton, "RIGHT", 72, 0)
        end
        NWB.showStatsAllButton:SetFrameLevel(fixedLevel)
    end
    local showStatsAllText = _G.NWBShowStatsAllButtonText
    if showStatsAllText and NWB.showStatsAllButton then
        showStatsAllText:ClearAllPoints()
        showStatsAllText:SetPoint("LEFT", NWB.showStatsAllButton, "RIGHT", CONTROL_GAP, 0)
        showStatsAllText:SetJustifyV("MIDDLE")
    end
    if frame.fs2 then
        frame.fs2:Hide()
    end
    if frame.fs3 then
        frame.fs3:SetParent(frame)
        frame.fs3:ClearAllPoints()
        frame.fs3:SetPoint("TOPLEFT", frame, "TOPLEFT", PAD, -(PAD + 32))
    end
    local confButton = _G.NWBbuffListFrameConfButton
    local wipeButton = _G.NWBbuffListFrameWipeButton
    if confButton and wipeButton then
        confButton:SetParent(frame)
        wipeButton:SetParent(frame)
        confButton:SetScript("OnMouseDown", nil)
        confButton:SetScript("OnMouseUp", nil)
        confButton:SetScript("OnHide", nil)
        confButton:ClearAllPoints()
        confButton:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -PAD, PAD)
        wipeButton:ClearAllPoints()
        wipeButton:SetPoint("RIGHT", confButton, "LEFT", -5, 0)
        confButton:SetFrameLevel(fixedLevel)
        wipeButton:SetFrameLevel(fixedLevel)
    end
    local charsMinLevelSlider = NWB.charsMinLevelSlider
    if charsMinLevelSlider then
        charsMinLevelSlider:SetParent(frame)
        charsMinLevelSlider:ClearAllPoints()
        charsMinLevelSlider:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -PAD, -(PAD + 6))
        charsMinLevelSlider:SetFrameLevel(fixedLevel)
        if charsMinLevelSlider.Text then
            charsMinLevelSlider.Text:ClearAllPoints()
            charsMinLevelSlider.Text:SetPoint("RIGHT", charsMinLevelSlider, "LEFT", -CONTROL_GAP, 0)
        end
    end
    if not frame.__gwBuffRangeHooked then
        frame.__gwBuffRangeHooked = true
        frame.scrollBarHideable = nil
        frame:SetScript("OnScrollRangeChanged", function() end)
    end
    local scrollBar = _G.NWBbuffListFrameScrollBar or frame.ScrollBar
    if scrollBar then
        scrollBar:SetFrameLevel(fixedLevel)
        scrollBar.__gwBuffOwner = frame
        scrollBar.__gwBuffViewport = viewport
        if not scrollBar.__gwBuffValueControlled then
            scrollBar.__gwBuffValueControlled = true
            scrollBar:SetScript("OnValueChanged", function(self, value)
                if self.__gwBuffOwner and not self.__gwBuffOwner.__gwUpdatingBuffScroll then
                    LayoutBuffLines(self.__gwBuffOwner, self.__gwBuffViewport, false, value)
                end
            end)
        end
        frame.__gwBuffScrollBar = scrollBar
        viewport.__gwBuffScrollBar = scrollBar
        frame:EnableMouseWheel(true)
        viewport:EnableMouseWheel(true)
        frame:SetScript("OnMouseWheel", BuffWindow_OnMouseWheel)
        viewport:SetScript("OnMouseWheel", BuffWindow_OnMouseWheel)
    end
    LayoutBuffLines(frame, viewport, captureLines)
end
Skin.Register("NovaWorldBuffs", function()
    local NWB = LibStub and LibStub("AceAddon-3.0", true)
        and LibStub("AceAddon-3.0"):GetAddon("NovaWorldBuffs", true)
    if not NWB then return end
    local mainFrames = {
        { name = "NWBlayerFrame",     drag = "NWBlayerDragFrame" },
        { name = "NWBLayerMapFrame",  drag = "NWBLayerMapDragFrame" },
        { name = "NWBCopyFrame",      drag = "NWBCopyDragFrame" },
        { name = "NWBTimerLogFrame",  drag = "NWBTimerLogDragFrame" },
        { name = "NWBLFrame",         drag = "NWBLDragFrame" },
        { name = "NWBbuffListFrame",  drag = "NWBbuffListDragFrame" },
        { name = "NWBDMFListFrame",   drag = "NWBDMFListDragFrame" },
    }
    for _, info in ipairs(mainFrames) do
        local frame = _G[info.name]
        if frame then
            Skin.SkinFrame(frame)
            Skin.AddTitleBar(frame, info.drag, "Interface/AddOns/GW2_UI/textures/character/addon-window-icon.png")
            if frame.GwSkinScrollFrame then frame:GwSkinScrollFrame() end
            local scrollBar = _G[info.name .. "ScrollBar"]
                or (frame.scrollFrame and frame.scrollFrame.ScrollBar) or frame.ScrollBar
            Skin.SkinScrollBar(scrollBar)
            local scrollInset = info.name == "NWBbuffListFrame" and BUFF_SCROLL_INSET or nil
            LayoutGWScrollBar(frame, scrollBar, scrollInset)
            if frame.EditBox then
                Skin.SkinFont(frame.EditBox, "Normal")
                frame.EditBox:SetTextInsets(PAD, PAD, PAD, 0)
                hooksecurefunc(frame.EditBox, "SetFont", function(self)
                    if self.isSkinnedFont then return end
                    self.isSkinnedFont = true
                    Skin.SkinFont(self, "Normal")
                    self.isSkinnedFont = false
                end)
            end
            if frame.fs and not frame.fs.isSkinnedTitle then Skin.SkinFont(frame.fs, "Header") end
            if frame.fs2 and not frame.fs2.isSkinnedTitle then Skin.SkinFont(frame.fs2, "Normal") end
            if frame.fs3 and not frame.fs3.isSkinnedTitle then Skin.SkinFont(frame.fs3, "Normal") end
        end
    end
    if _G.NWBlayerFrame then
        if _G.NWBlayerFrame.fs2 then
            _G.NWBlayerFrame.fs2:ClearAllPoints()
            _G.NWBlayerFrame.fs2:SetPoint("TOPLEFT", PAD, -PAD)
        end
        if _G.NWBlayerFrame.EditBox then
            _G.NWBlayerFrame.EditBox:SetTextInsets(PAD, PAD, 15, 0)
        end
        if NWB.recalclayerFrame then
            hooksecurefunc(NWB, "recalclayerFrame", function()
                local fs3 = _G.NWBlayerFrame and _G.NWBlayerFrame.fs3
                if fs3 then
                    fs3:SetParent(_G.NWBlayerFrame)
                    fs3:ClearAllPoints()
                    fs3:SetPoint("BOTTOM", _G.NWBlayerFrame, 0, PAD)
                end
            end)
        end
    end
    local tooltips = {
        "NWBlayerDragTooltip", "NWBLayerMapDragTooltip", "NWBCopyDragTooltip",
        "NWBVersionDragTooltip", "NWBDmfDragTooltip", "NWBTimerLogDragTooltip",
        "NWBLDragTooltip", "NWBbuffListDragTooltip", "NWBDMFTooltip", "NWBDMFContinentTooltip",
        "NWBbuffListResetButtonTooltip", "NWBBuffsLineTooltip",
    }
    for _, key in ipairs(tooltips) do
        Skin.SkinTooltip(_G[key])
    end
    local closeButtons = {
        "NWBlayerFrameClose", "NWBLayerMapFrameClose", "NWBCopyFrameClose",
        "NWBbuffListFrameClose", "NWBDMFListFrameClose", "NWBTimerLogFrameClose", "NWBLFrameClose",
    }
    for _, key in ipairs(closeButtons) do
        Skin.SkinClose(_G[key])
    end
    local normalButtons = {
        "NWBlayerFrameConfButton", "NWBlayerFrameBuffsButton", "NWBlayerFrameMapButton",
        "NWBlayerFrameCopyButton", "NWBlayerFrameTimerLogButton", "NWBGuildLayersButton",
        "NWBLFrameRefreshButton", "NWBbuffListFrameWipeButton",
        "NWBbuffListFrameConfButton", "NWBbuffListFrameTimersButton", "NWBTimerLogRefreshButton",
    }
    for _, key in ipairs(normalButtons) do
        Skin.SkinButton(_G[key])
    end
    StackButtonsTopRight("NWBlayerFrame", {
        "NWBlayerFrameConfButton", "NWBlayerFrameBuffsButton", "NWBlayerFrameMapButton",
        "NWBlayerFrameTimerLogButton", "NWBGuildLayersButton", "NWBlayerFrameCopyButton",
    })
    StackButtonsTopRight("NWBTimerLogFrame", { "NWBTimerLogRefreshButton" })
    StackButtonsTopRight("NWBLFrame", { "NWBLFrameRefreshButton" })
    LayoutBuffListFrame(NWB)
    local function SkinChecks(keys)
        for _, key in ipairs(keys) do
            Skin.SkinCheckBox(NWB[key])
        end
    end
    if NWB.createBuffsListExtraButtons then
        hooksecurefunc(NWB, "createBuffsListExtraButtons", function()
            SkinChecks({ "showStatsButton", "showStatsAllButton" })
            Skin.SkinSlider(NWB.charsMinLevelSlider)
            LayoutBuffListFrame(NWB)
        end)
    end
    if NWB.recalcBuffListFrame then
        hooksecurefunc(NWB, "recalcBuffListFrame", function()
            LayoutBuffListFrame(NWB, true)
        end)
    end
    if NWB.createCopyFormatButton then
        hooksecurefunc(NWB, "createCopyFormatButton", function()
            SkinChecks({ "copyDiscordButton" })
            if NWB.copyDiscordButton and _G.NWBCopyFrame then
                NWB.copyDiscordButton:ClearAllPoints()
                NWB.copyDiscordButton:SetPoint("TOPRIGHT", _G.NWBCopyFrame, "TOPRIGHT", -84, -PAD)
            end
        end)
    end
    if NWB.createDmfHelperButtons then
        hooksecurefunc(NWB, "createDmfHelperButtons", function()
            SkinChecks({ "dmfChatCountdown", "dmfAutoResButton" })
        end)
    end
    if NWB.createTimerLogCheckboxes then
        hooksecurefunc(NWB, "createTimerLogCheckboxes", function()
            SkinChecks({ "timerLogShowRendButton", "timerLogShowOnyButton", "timerLogShowNefButton" })
        end)
    end
    if NWB.createTimerLogMergeLayersCheckbox then
        hooksecurefunc(NWB, "createTimerLogMergeLayersCheckbox", function()
            SkinChecks({ "timerLogMergeLayersButton" })
        end)
    end
    if NWB.createDisableLayerButton then
        hooksecurefunc(NWB, "createDisableLayerButton", function(_, count)
            Skin.SkinButton(_G["NWBDisableLayerButton" .. count])
            Skin.SkinButton(_G["NWBEnableLayerButton" .. count])
        end)
    end
    local minimap = _G.MinimapLayerFrame
    if minimap then
        if minimap.GwStripTextures then minimap:GwStripTextures()
        elseif minimap.StripTextures then minimap:StripTextures() end
        if minimap.tooltip then Skin.SkinTooltip(minimap.tooltip) end
    end
    if NWB.createSongflowerMarkers then
        hooksecurefunc(NWB, "createSongflowerMarkers", function() SkinMarkers(NWB.songFlowers) end)
    end
    if NWB.createTuberMarkers then
        hooksecurefunc(NWB, "createTuberMarkers", function() SkinMarkers(NWB.tubers) end)
    end
    if NWB.createDragonMarkers then
        hooksecurefunc(NWB, "createDragonMarkers", function() SkinMarkers(NWB.dragons) end)
    end
    SkinMarker(_G.NWBDMF)
    SkinMarker(_G.NWBDMFContinent)
end)
