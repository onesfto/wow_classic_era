-- GW2_UI_PLUS 社交窗口 —— raidList.lua
--
-- 团队列表。相对上游几乎全是正式服专属控件的空值保护。
--
-- 原先直接改在 GW2_UI/Games/Shared/Social/raidList.lua 里，现在整体搬进 PLUS。
-- 下面的 function GW.XXX 是写进 GW2_ADDON 这张共享表的，等于覆盖掉上游的同名函数。

local GW = _G.GW2_ADDON
if not GW then return end

local  raidInit = false

local StripAllTextures = {
    "RaidGroup1",
    "RaidGroup2",
    "RaidGroup3",
    "RaidGroup4",
    "RaidGroup5",
    "RaidGroup6",
    "RaidGroup7",
    "RaidGroup8",
}

local function LoadRaidFrame()
    if raidInit then return end
    if InCombatLockdown() then
        GW.CombatQueue:Queue(nil,  LoadRaidFrame)
        return
    end
    raidInit = true
    for _, object in pairs(StripAllTextures) do
        local obj = _G[object]
        if obj then
            obj:SetSize(230, 120)
            obj:GwStripTextures()
            local label = _G[object .. "Label"]
            if label then
                label:SetNormalFontObject("GameFontNormal")
                label:SetHighlightFontObject("GameFontHighlight")
            end
            for j = 1, 5 do
                local slot = _G[object .. "Slot" .. j]
                if slot then
                    slot:GwStripTextures()
                    slot:SetSize(220, 22)
                    slot:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder, true)
                end
            end
        end
    end

    for i = 1, (_G.MAX_RAID_GROUPS or 0) * 5 do
        local button = _G["RaidGroupButton" .. i]
        local name = _G["RaidGroupButton" .. i .. "Name"]
        local level = _G["RaidGroupButton" .. i .. "Level"]
        local class = _G["RaidGroupButton" .. i .. "Class"]

        if button then
            button:SetSize(220, 22)
            button:GwSkinButton(false, true, true)
            button:GwStripTextures()
            button:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder, true)
        end
        if name then
            name:SetFont(UNIT_NAME_FONT, 10)
            name:SetSize(60, 19)
        end
        if level then
            level:SetFont(UNIT_NAME_FONT, 10)
            level:SetSize(37, 19)
        end

        if class then
            if class.SetFont then
                class:SetFont(UNIT_NAME_FONT, 10)
            elseif class.text then
                class.text:SetFont(UNIT_NAME_FONT, 10)
            end
            class:SetSize(80, 19)
        end
    end

    hooksecurefunc("RaidGroupFrame_Update", function()
        for i = 1, (MAX_RAID_GROUPS or 0) * 5 do
            local _, rank, _, _, _, _, _, _, _, role = GetRaidRosterInfo(i)
            local rankTexture = _G["RaidGroupButton" .. i .. "RankTexture"]
            local roleTexture = _G["RaidGroupButton" .. i .. "RoleTexture"]

            if rankTexture then
                if rank == 2 then
                    rankTexture:SetTexture("Interface/AddOns/GW2_UI/textures/party/icon-groupleader.png")
                elseif rank == 1 then
                    rankTexture:SetTexture("Interface/AddOns/GW2_UI/textures/party/icon-assist.png")
                else
                    rankTexture:SetTexture("")
                end
            end

            if roleTexture then
                if role == "MAINTANK" then
                    roleTexture:SetTexture("Interface/AddOns/GW2_UI/textures/party/icon-maintank.png")
                elseif role == "MAINASSIST" then
                    roleTexture:SetTexture("Interface/AddOns/GW2_UI/textures/party/icon-mainassist.png")
                else
                    roleTexture:SetTexture("")
                end
            end
        end
    end)
end

function GW.SkinRaidList()
    if RaidFrameNotInRaid and RaidFrameNotInRaid.ScrollingDescription then
        RaidFrameNotInRaid.ScrollingDescription:ClearAllPoints()
        RaidFrameNotInRaid.ScrollingDescription:SetPoint("TOPLEFT", RaidFrameNotInRaid, "TOPLEFT", 0, -73)
        RaidFrameNotInRaid.ScrollingDescription:SetPoint("BOTTOMRIGHT", RaidFrameNotInRaid, "BOTTOMRIGHT", 0, 0)
        if RaidFrameNotInRaid.ScrollingDescription.ScrollBox and RaidFrameNotInRaid.ScrollingDescription.ScrollBox.FontStringContainer then
            local fontString = RaidFrameNotInRaid.ScrollingDescription.ScrollBox.FontStringContainer.FontString
            if fontString then
                fontString:SetJustifyH("CENTER")
                fontString:SetJustifyV("TOP")
                fontString:SetTextColor(1, 1, 1)
            end
        end
    end

    if RaidFrameAllAssistCheckButton then
        RaidFrameAllAssistCheckButton:ClearAllPoints()
        RaidFrameAllAssistCheckButton:SetPoint("TOPLEFT", 10, -33)
        if RaidFrameAllAssistCheckButton.text then
            RaidFrameAllAssistCheckButton.text:ClearAllPoints()
            RaidFrameAllAssistCheckButton.text:SetPoint("LEFT", RaidFrameAllAssistCheckButton, "RIGHT", 5, -2)
            RaidFrameAllAssistCheckButton.text:SetText(ALL .. " |TInterface/AddOns/GW2_UI/textures/party/icon-assist.png:25:25:0:-3|t")
        end
    end

    if RaidFrame and RaidFrame.RoleCount then
        RaidFrame.RoleCount:ClearAllPoints()
        RaidFrame.RoleCount:SetPoint("TOP", -80, -33)

        if RaidFrame.RoleCount.TankIcon then
            RaidFrame.RoleCount.TankIcon:SetTexture("Interface/AddOns/GW2_UI/textures/party/roleicon-tank.png")
        end
        if RaidFrame.RoleCount.HealerIcon then
            RaidFrame.RoleCount.HealerIcon:SetTexture("Interface/AddOns/GW2_UI/textures/party/roleicon-healer.png")
        end
        if RaidFrame.RoleCount.DamagerIcon then
            RaidFrame.RoleCount.DamagerIcon:SetTexture("Interface/AddOns/GW2_UI/textures/party/roleicon-dps.png")
            RaidFrame.RoleCount.DamagerIcon:SetSize(20, 20)
        end
    end

    if RaidFrameAllAssistCheckButton then
        RaidFrameAllAssistCheckButton:GwSkinCheckButton()
        RaidFrameAllAssistCheckButton:SetSize(18, 18)
    end

    if RaidFrameReadyCheckButton then
        RaidFrameReadyCheckButton:GwSkinButton(false, true)
    end

    if RaidFrameConvertToRaidButton then
        RaidFrameConvertToRaidButton:GwSkinButton(false, true)
    end
    if RaidFrameRaidInfoButton then
        RaidFrameRaidInfoButton:GwSkinButton(false, true)
        RaidFrameRaidInfoButton:SetPoint("TOPRIGHT", -7, -33)
    end
    if GW.settings.USE_CHARACTER_WINDOW and (GW.Retail or GW.Mists) and RaidFrameRaidInfoButton then
        RaidFrameRaidInfoButton:SetScript("OnClick", function()
            if InCombatLockdown() then return end
            if GwCharacterCurrencyRaidInfoFrame.RaidLocks:IsVisible() then
                GwCharacterWindow:SetAttribute("windowpanelopen", "nil")
                return
            end
            GwCharacterWindow:SetAttribute("windowpanelopen", "currency")
            GWCurrencyMenu.items.raidinfo:Click()
        end)
    end

    if _G.RaidFrame_LoadUI and RaidFrame and not RaidFrame.gwRaidFrameHooked then
        hooksecurefunc("RaidFrame_LoadUI", LoadRaidFrame)
        RaidFrame.gwRaidFrameHooked = true
    end
end
