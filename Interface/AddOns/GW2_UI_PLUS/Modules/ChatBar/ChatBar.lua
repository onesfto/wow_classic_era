local _, addonTable = ...
local ChatBar = {}
addonTable.ChatBar = ChatBar
_G.GW2Plus_ChatBar = ChatBar
local GW = _G.GW2_ADDON
local MEDIA = "Interface/AddOns/GW2_UI/textures/emoji/"
local BUTTON_SIZE = 25
local IsLoaded = (_G.C_AddOns and _G.C_AddOns.IsAddOnLoaded) or _G.IsAddOnLoaded
local defaults = {
    enable = true,
    hidden = {},
    anchor = 1,
    offsetX = -26,
    offsetY = 10,
    scale = 1.0,
    fadeOnLeave = false,
    autoHide = true,
    banWindow = nil,
}
ChatBar.defaults = defaults
local function InitDB()
    GW2_UI_PLUS_ChatBarSV = GW2_UI_PLUS_ChatBarSV or {}
    local db = GW2_UI_PLUS_ChatBarSV
    for k, v in pairs(defaults) do
        if db[k] == nil then
            db[k] = (type(v) == "table") and CopyTable(v) or v
        end
    end
    return db
end
ChatBar.InitDB = InitDB
local EmojiData = {
    {":smile:", MEDIA .. "smile.png"},           {":grin:", MEDIA .. "grin.png"},
    {":joy:", MEDIA .. "joy.png"},               {":wink:", MEDIA .. "wink.png"},
    {":blush:", MEDIA .. "blush.png"},           {":smirk:", MEDIA .. "smirk.png"},
    {":sunglasses:", MEDIA .. "sunglasses.png"}, {":heart_eyes:", MEDIA .. "hearteyes.png"},
    {":thinking:", MEDIA .. "thinking.png"},     {":open_mouth:", MEDIA .. "openmouth.png"},
    {":stuck_out_tongue:", MEDIA .. "stuckouttongue.png"},
    {":stuck_out_tongue_closed_eyes:", MEDIA .. "stuckouttongueclosedeyes.png"},
    {":slight_frown:", MEDIA .. "slightfrown.png"}, {":cry:", MEDIA .. "cry.png"},
    {":sob:", MEDIA .. "sob.png"},               {":scream:", MEDIA .. "scream.png"},
    {":angry:", MEDIA .. "angry.png"},           {":rage:", MEDIA .. "rage.png"},
    {":zzz:", MEDIA .. "zzz.png"},               {":scream_cat:", MEDIA .. "screamcat.png"},
    {":heart:", MEDIA .. "heart.png"},           {":broken_heart:", MEDIA .. "brokenheart.png"},
    {":thumbs_up:", MEDIA .. "thumbsup.png"},    {":ok_hand:", MEDIA .. "okhand.png"},
    {":call_me:", MEDIA .. "callme.png"},        {":middle_finger:", MEDIA .. "middlefinger.png"},
    {":poop:", MEDIA .. "poop.png"},
}
ChatBar.EmojiData = EmojiData
local BUTTONS = {
    {key = "SAY",   text = "说", kind = "chat", cmd = "s",  color = {1, 1, 1},           noRight = true,
        onRight = function() ReloadUI() end, rightTip = "重载界面"},
    {key = "YELL",  text = "喊", kind = "chat", cmd = "y",  color = {1, 0.25, 0.25}},
    {key = "GUILD", text = "会", kind = "chat", cmd = "g",  color = {0.25, 1, 0.25},     msgGroup = {"GUILD", "OFFICER"},
        visible = function() return IsInGuild() end},
    {key = "PARTY", text = "队", kind = "chat", cmd = "p",  color = {0.6667, 0.6667, 1}, noRight = true,
        visible = function() return IsInGroup() end},
    {key = "RAID",  text = "团", kind = "chat", cmd = "ra", color = {1, 0.498, 0},       rightCmd = "rw",
        visible = function() return IsInRaid() end},
    {key = "INSTANCE_CHAT", text = "战", kind = "chat", cmd = "bg", color = {1, 0.498, 0}, rightCmd = "rw",
        visible = function() return IsInRaid(LE_PARTY_CATEGORY_INSTANCE or 2) end},
    {key = "GENERAL",        text = "综", kind = "channel", color = {0.888, 0.668, 0.668}},
    {key = "TRADE",          text = "交", kind = "channel", color = {0.888, 0.668, 0.668}},
    {key = "LOOK_FOR_GROUP", text = "组", kind = "channel", color = {0.888, 0.668, 0.668}},
    {key = "PIG",            text = "P", kind = "channel", color = {0.888, 0.668, 0.668},
        channelName = "PIG"},
    {key = "BIGFOOTWORLD",   text = "世", kind = "channel", color = {0.888, 0.668, 0.668},
        channelName = "大脚世界频道"},
    {key = "EMOJI", text = "表", kind = "tool", color = {1, 0.82, 0},
        tip = "点击展开表情面板"},
    {key = "ROLL",  text = "骰", kind = "tool", color = {1, 0.82, 0},
        tip = "|cff00FFff左键-|r|cffFFFF00Roll 1-100|r\n|cff00FFff右键-|r|cffFFFF00拾取记录|r",
        onClick = function(_, button)
            if button == "LeftButton" then
                RandomRoll(1, 100)
            elseif ToggleLootHistoryFrame then
                ToggleLootHistoryFrame()
            end
        end},
    {key = "MACRO", text = "宏", kind = "tool", color = {1, 0.82, 0},
        tip = "打开宏命令窗口",
        onClick = function()
            if InCombatLockdown() then
                ChatBar.Print("战斗中无法打开宏命令窗口")
                return
            end
            if MacroFrame and MacroFrame:IsShown() then
                HideUIPanel(MacroFrame)
            else
                ShowMacroFrame()
            end
        end},
    {key = "DBM", text = "距", kind = "tool", color = {0.6, 0.9, 1}, addon = "DBM-Core",
        tip = "DBM 距离检测",
        onClick = function()
            local rc = _G.DBM and _G.DBM.RangeCheck
            if not rc then return end
            if rc:IsShown() then rc:Hide(true) else rc:Show(10, nil, true) end
        end},
    {key = "ATLASLOOT", text = "掉", kind = "tool", color = {0.6, 0.9, 1}, addon = "AtlasLootClassic",
        tip = "AtlasLoot 掉落查询",
        onClick = function()
            if SlashCmdList["ATLASLOOT"] then SlashCmdList["ATLASLOOT"]("") end
        end},
    {key = "BIAOGE", text = "金", kind = "tool", color = {0.6, 0.9, 1}, addon = "BiaoGe",
        tip = "打开表格",
        onClick = function()
            if SlashCmdList["BIAOGE"] then SlashCmdList["BIAOGE"]("") end
        end},
    {key = "MEETINGHORN", text = "集", kind = "tool", color = {0.6, 0.9, 1}, addon = "MeetingHorn",
        tip = "打开集结号",
        onClick = function()
            local mh = LibStub and LibStub("AceAddon-3.0", true)
                and LibStub("AceAddon-3.0"):GetAddon("MeetingHorn", true)
            if mh then mh:Toggle() end
        end},
    {key = "MRT", text = "M", kind = "tool", color = {0.6, 0.9, 1}, addon = "MRT",
        tip = "MRT 团队检查",
        onClick = function()
            if _G.ExRT and _G.ExRT.A and _G.ExRT.A.RaidCheck then
                _G.ExRT.A.RaidCheck:ReadyCheckWindow(nil, nil, true)
            end
        end},
}
ChatBar.BUTTONS = BUTTONS
function ChatBar.Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cffFFaa00[频道按钮]|r " .. msg)
end
local CHANNEL_SUFFIX_MAX = 5
local function GetChannelIndex(name)
    if not name then return 0 end
    local function find(target)
        local channels = {GetChannelList()}
        for i = 1, #channels, 3 do
            if channels[i + 1] == target then return channels[i] end
        end
        return 0
    end
    local id = find(name)
    if id > 0 then return id end
    for i = 1, CHANNEL_SUFFIX_MAX do
        id = find(name .. i)
        if id > 0 then return id end
    end
    return 0
end
local function GetBanChatFrame()
    local db = GW2_UI_PLUS_ChatBarSV
    if db and db.banWindow then
        for i = 1, NUM_CHAT_WINDOWS do
            local name = GetChatWindowInfo(i)
            if name == db.banWindow then
                return _G["ChatFrame" .. i] or DEFAULT_CHAT_FRAME, i
            end
        end
    end
    return ChatFrame1, 1
end
ChatBar.GetBanChatFrame = GetBanChatFrame
function ChatBar.GetChatWindowList()
    local list = {}
    for i = 1, NUM_CHAT_WINDOWS do
        local name = GetChatWindowInfo(i)
        if name and name ~= "" then
            table.insert(list, name)
        end
    end
    return list
end
local function AddChannelToFrame(frame, channel)
    if frame.AddChannel then frame:AddChannel(channel) else ChatFrame_AddChannel(frame, channel) end
end
local function RemoveChannelFromFrame(frame, channel)
    if frame.RemoveChannel then frame:RemoveChannel(channel) else ChatFrame_RemoveChannel(frame, channel) end
end
local function IsMessageShown(msgType)
    local _, index = GetBanChatFrame()
    for _, v in ipairs({GetChatWindowMessages(index)}) do
        if v == msgType then return true end
    end
    return false
end
local function IsChannelShown(channelName)
    local _, index = GetBanChatFrame()
    local channels = {GetChatWindowChannels(index)}
    for i = 1, #channels, 2 do
        if channels[i] == channelName then return true end
    end
    return false
end
local function PrefixEditBox(prefix)
    local editBox = ChatEdit_ChooseBoxForSend()
    local text = editBox:GetText()
    if not editBox:HasFocus() then
        ChatEdit_ActivateChat(editBox)
    end
    editBox:SetText(prefix .. " " .. text)
end
local function SkinButton(button)
    button.bg = button:CreateTexture(nil, "BACKGROUND")
    button.bg:SetAllPoints()
    button.bg:SetColorTexture(0, 0, 0, 0.55)
    if GW and button.GwCreateBackdrop then
        button:GwCreateBackdrop(GW.BackdropTemplates and GW.BackdropTemplates.Default)
    end
    button.hover = button:CreateTexture(nil, "ARTWORK")
    button.hover:SetAllPoints()
    button.hover:SetColorTexture(1, 1, 1, 0.12)
    button.hover:Hide()
    button:HookScript("OnEnter", function(self) self.hover:Show() end)
    button:HookScript("OnLeave", function(self) self.hover:Hide() end)
end
local function SkinFont(fs)
    if GW and fs.GwSetFontTemplate then
        fs:GwSetFontTemplate(UNIT_NAME_FONT, GW.Enum.TextSizeType.Normal, "OUTLINE")
        fs:SetShadowColor(0, 0, 0, 0)
    else
        fs:SetFont(UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    end
end
local EMOJI_PER_ROW = 10
local function BuildEmojiPanel(button)
    local rows = math.ceil(#EmojiData / EMOJI_PER_ROW)
    local panel = CreateFrame("Frame", nil, button, "BackdropTemplate")
    panel:SetSize(BUTTON_SIZE * EMOJI_PER_ROW + 2 * (EMOJI_PER_ROW - 1) + 10,
                  BUTTON_SIZE * rows + 2 * (rows - 1) + 12)
    panel:SetPoint("BOTTOMLEFT", button, "TOPLEFT", 0, 4)
    panel:SetFrameStrata("DIALOG")
    panel:Hide()
    if GW and panel.GwCreateBackdrop then
        panel:GwCreateBackdrop(GW.BackdropTemplates and GW.BackdropTemplates.Default)
    end
    panel.fadeTimer = 0
    panel:SetScript("OnUpdate", function(self, elapsed)
        if not self.counting then return end
        self.fadeTimer = self.fadeTimer - elapsed
        if self.fadeTimer <= 0 then
            self:Hide()
            self.counting = false
        end
    end)
    local function StartCountdown(self)
        local p = self.emojiPanel or self
        p.fadeTimer = 1.5
        p.counting = true
    end
    local function StopCountdown(self)
        local p = self.emojiPanel or self
        p.counting = false
    end
    panel:SetScript("OnEnter", StopCountdown)
    panel:SetScript("OnLeave", StartCountdown)
    local cells = {}
    for i, data in ipairs(EmojiData) do
        local cell = CreateFrame("Button", nil, panel)
        cell:SetSize(BUTTON_SIZE, BUTTON_SIZE)
        cells[i] = cell
        if i == 1 then
            cell:SetPoint("TOPLEFT", panel, "TOPLEFT", 5, -6)
        elseif (i - 1) % EMOJI_PER_ROW == 0 then
            cell:SetPoint("TOPLEFT", cells[i - EMOJI_PER_ROW], "BOTTOMLEFT", 0, -2)
        else
            cell:SetPoint("LEFT", cells[i - 1], "RIGHT", 2, 0)
        end
        cell.tex = cell:CreateTexture(nil, "ARTWORK")
        cell.tex:SetTexture(data[2])
        cell.tex:SetPoint("CENTER")
        cell.tex:SetSize(BUTTON_SIZE - 4, BUTTON_SIZE - 4)
        cell.emojiPanel = panel
        cell:SetScript("OnEnter", StopCountdown)
        cell:SetScript("OnLeave", StartCountdown)
        cell:SetScript("OnClick", function()
            local editBox = ChatEdit_ChooseBoxForSend()
            if not editBox:HasFocus() then
                ChatEdit_ActivateChat(editBox)
            end
            editBox:SetText(editBox:GetText() .. data[1])
            panel:Hide()
            panel.counting = false
        end)
    end
    button.emojiPanel = panel
    return panel
end
local bar
local BLOCKED_COLOR = {0.5, 0.5, 0.5}
local function SetBlockedState(button, blocked)
    if not button or not button.Text then return end
    if blocked then
        button.Text:SetTextColor(unpack(BLOCKED_COLOR))
    else
        button.Text:SetTextColor(unpack(button.def.color))
    end
end
local function CreateChannelButton(def)
    local button = CreateFrame("Button", nil, bar)
    button:SetSize(BUTTON_SIZE, BUTTON_SIZE)
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button.def = def
    SkinButton(button)
    button.Text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    button.Text:SetPoint("CENTER")
    button.Text:SetText(def.text)
    SkinFont(button.Text)
    button.Text:SetTextColor(unpack(def.color))
    button:SetScript("OnMouseDown", function(self) self.Text:SetPoint("CENTER", 1, -1) end)
    button:SetScript("OnMouseUp", function(self) self.Text:SetPoint("CENTER", 0, 0) end)
    button:HookScript("OnEnter", function(self)
        bar:FadeIn()
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT", 0, 0)
        if def.tip then
            GameTooltip:SetText(def.tip)
        else
            local leftText = (def.kind == "channel") and "切换频道" or "发言"
            local rightText
            if def.rightCmd then
                rightText = "通知"
            elseif def.onRight then
                rightText = def.rightTip
            elseif not def.noRight then
                rightText = "屏蔽"
            end
            local s = "|cff00FFff左键-|r|cffFFFF00" .. leftText .. "|r"
            if rightText then
                s = s .. "\n|cff00FFff右键-|r|cffFFFF00" .. rightText .. "|r"
            end
            GameTooltip:SetText(s)
        end
        GameTooltip:Show()
    end)
    button:HookScript("OnLeave", function()
        bar:FadeOut()
        GameTooltip:Hide()
    end)
    return button
end
local function OnChatClick(self, click)
    local def = self.def
    local canBlock = not def.rightCmd and not def.noRight and not def.onRight
    if click == "LeftButton" then
        if canBlock and not IsMessageShown(def.key) then
            local frame = GetBanChatFrame()
            for _, g in ipairs(def.msgGroup or {def.key}) do ChatFrame_AddMessageGroup(frame, g) end
            SetBlockedState(self, false)
            ChatBar.Print("已显示 " .. (_G[def.key] or def.text) .. " 频道")
        end
        PrefixEditBox("/" .. def.cmd)
        return
    end
    if def.onRight then def.onRight() return end
    if def.noRight then return end
    if def.rightCmd then
        PrefixEditBox("/" .. def.rightCmd)
        return
    end
    if IsMessageShown(def.key) then
        local frame = GetBanChatFrame()
        for _, g in ipairs(def.msgGroup or {def.key}) do ChatFrame_RemoveMessageGroup(frame, g) end
        ChatBar.Print("已屏蔽 " .. (_G[def.key] or def.text) .. " 频道")
        SetBlockedState(self, true)
    else
        ChatBar.Print((_G[def.key] or def.text) .. " 频道已是屏蔽状态")
    end
end
local function OnChannelClick(self, click)
    local channelName = self.def.channelName or _G[self.def.key]
    if not channelName then return end
    local frame, index = GetBanChatFrame()
    if click == "LeftButton" then
        local id = GetChannelIndex(channelName)
        if id == 0 then
            JoinTemporaryChannel(channelName, nil, index, 1)
            C_Timer.After(1, function()
                if GetChannelIndex(channelName) > 0 then
                    AddChannelToFrame(frame, channelName)
                    SetBlockedState(self, false)
                    ChatBar.Print("已加入 " .. channelName .. " 频道")
                else
                    ChatBar.Print("加入 " .. channelName .. " 频道失败，请稍后再试")
                end
            end)
            return
        end
        local wasHidden = not IsChannelShown(channelName)
        AddChannelToFrame(frame, channelName)
        SetBlockedState(self, false)
        if wasHidden then
            ChatBar.Print("已显示 " .. channelName .. " 频道")
        end
        PrefixEditBox("/" .. id)
        return
    end
    if GetChannelIndex(channelName) == 0 then
        ChatBar.Print("尚未加入 " .. channelName .. " 频道")
        return
    end
    if IsChannelShown(channelName) then
        RemoveChannelFromFrame(frame, channelName)
        ChatBar.Print("已屏蔽 " .. channelName .. " 频道")
        SetBlockedState(self, true)
    else
        ChatBar.Print(channelName .. " 频道已是屏蔽状态")
    end
end
local function UpdateBlockedIcons()
    if not bar then return end
    for _, button in ipairs(bar.buttons) do
        local def = button.def
        if def.kind == "chat" and not def.rightCmd and not def.noRight then
            SetBlockedState(button, not IsMessageShown(def.key))
        elseif def.kind == "channel" then
            local name = def.channelName or _G[def.key]
            SetBlockedState(button, name ~= nil and not IsChannelShown(name))
        end
    end
end
ChatBar.UpdateBlockedIcons = UpdateBlockedIcons
function ChatBar.UpdateLayout()
    if not bar then return end
    local db = GW2_UI_PLUS_ChatBarSV
    local index = 0
    for _, button in ipairs(bar.buttons) do
        local def = button.def
        local show = not db.hidden[def.key]
        if show and db.autoHide and def.visible and not def.visible() then
            show = false
        end
        if show then
            button:ClearAllPoints()
            button:SetPoint("LEFT", bar, "LEFT", index * BUTTON_SIZE, 0)
            button:Show()
            index = index + 1
        else
            button:Hide()
        end
    end
    bar:SetWidth(math.max(BUTTON_SIZE, index * BUTTON_SIZE))
end
function ChatBar.UpdatePoint()
    if not bar then return end
    local db = GW2_UI_PLUS_ChatBarSV
    bar:ClearAllPoints()
    if db.anchor == 2 then
        bar:SetPoint("TOPLEFT", ChatFrame1, "BOTTOMLEFT", -2 + db.offsetX, -4 + db.offsetY)
    else
        bar:SetPoint("BOTTOMLEFT", ChatFrame1, "TOPLEFT", db.offsetX, 28 + db.offsetY)
    end
end
function ChatBar.UpdateScale()
    if not bar then return end
    bar:SetScale(GW2_UI_PLUS_ChatBarSV.scale)
end
function ChatBar.UpdateFade()
    if not bar then return end
    bar:FadeOut()
end
local function Build()
    bar = CreateFrame("Frame", "GW2PlusChatBar", UIParent)
    bar:SetSize(BUTTON_SIZE, BUTTON_SIZE)
    bar:SetFrameStrata("MEDIUM")
    bar.buttons = {}
    ChatBar.bar = bar
    function bar:FadeIn() self:SetAlpha(1) end
    function bar:FadeOut()
        if GW2_UI_PLUS_ChatBarSV.fadeOnLeave then self:SetAlpha(0.06) else self:SetAlpha(1) end
    end
    for _, def in ipairs(BUTTONS) do
        if not def.addon or IsLoaded(def.addon) then
            local button = CreateChannelButton(def)
            table.insert(bar.buttons, button)
            if def.kind == "chat" then
                button:SetScript("OnClick", OnChatClick)
            elseif def.kind == "channel" then
                button:SetScript("OnClick", OnChannelClick)
            elseif def.key == "EMOJI" then
                local panel = BuildEmojiPanel(button)
                button:SetScript("OnClick", function()
                    if panel:IsShown() then
                        panel:Hide()
                        panel.counting = false
                    else
                        panel:Show()
                        panel.fadeTimer = 1.5
                        panel.counting = true
                    end
                end)
            else
                button:SetScript("OnClick", def.onClick)
            end
        end
    end
    for i = 1, NUM_CHAT_WINDOWS do
        for _, f in ipairs({_G["ChatFrame" .. i], _G["ChatFrame" .. i .. "Tab"]}) do
            if f then
                f:HookScript("OnEnter", function() bar:FadeIn() end)
                f:HookScript("OnLeave", function() bar:FadeOut() end)
            end
        end
    end
    ChatBar.UpdateScale()
    ChatBar.UpdatePoint()
    ChatBar.UpdateLayout()
    ChatBar.UpdateFade()
    bar:RegisterEvent("GROUP_ROSTER_UPDATE")
    bar:RegisterEvent("PLAYER_GUILD_UPDATE")
    bar:SetScript("OnEvent", function(self)
        if self.updateTimer then self.updateTimer:Cancel() end
        self.updateTimer = C_Timer.NewTimer(0.4, ChatBar.UpdateLayout)
    end)
    for _, delay in ipairs({3, 5, 10}) do
        C_Timer.After(delay, UpdateBlockedIcons)
    end
end
SLASH_GW2PLUSCHATBAR1 = "/gwcb"
SlashCmdList["GW2PLUSCHATBAR"] = function(msg)
    local db = GW2_UI_PLUS_ChatBarSV
    local p = ChatBar.Print
    if msg == "test" then
        if not bar then p("按钮条不存在，无法定位") return end
        bar:ClearAllPoints()
        bar:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
        bar:SetScale(2)
        bar:SetAlpha(1)
        bar:SetFrameStrata("TOOLTIP")
        p("已把按钮条移到屏幕正中、放大 2 倍。看得见就是位置/层级问题；看不见就是没画出来。")
        p("用 |cff00ff00/gwcb reset|r 恢复。")
        return
    end
    if msg == "reset" then
        if not bar then p("按钮条不存在") return end
        bar:SetFrameStrata("MEDIUM")
        ChatBar.UpdateScale()
        ChatBar.UpdatePoint()
        ChatBar.UpdateFade()
        p("已恢复正常位置。")
        return
    end
    p("=== ChatBar 调试信息 ===")
    p(("配置 enable = %s"):format(tostring(db and db.enable)))
    if not bar then
        p("|cffff0000按钮条未创建|r（Build 没跑，或 enable 为 false）")
        return
    end
    local shown = 0
    for _, b in ipairs(bar.buttons) do if b:IsShown() then shown = shown + 1 end end
    p(("按钮 %d 个，其中显示 %d 个"):format(#bar.buttons, shown))
    p(("可见=%s 透明度=%.2f 缩放=%.2f 层级=%s"):format(
        tostring(bar:IsShown()), bar:GetAlpha(), bar:GetScale(), bar:GetFrameStrata()))
    p(("尺寸 %.0f x %.0f"):format(bar:GetWidth(), bar:GetHeight()))
    local left, top = bar:GetLeft(), bar:GetTop()
    if left and top then
        p(("屏幕坐标 x=%.0f y=%.0f（屏幕 %.0f x %.0f）"):format(
            left, top, UIParent:GetWidth(), UIParent:GetHeight()))
    else
        p("|cffff0000取不到屏幕坐标——锚点没生效|r")
    end
    p(("锚定目标 ChatFrame1：可见=%s"):format(tostring(ChatFrame1 and ChatFrame1:IsShown())))
    p("看不见就跑 |cff00ff00/gwcb test|r 把它移到屏幕正中确认。")
end
local loader = CreateFrame("Frame")
loader:RegisterEvent("PLAYER_ENTERING_WORLD")
loader:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    GW = GW or _G.GW2_ADDON
    if not InitDB().enable then return end
    Build()
end)
