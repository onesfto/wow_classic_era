-- GW2_UI_PLUS 频道按钮条
-- 独立实现：自带 SavedVariables，不读写 !Pig 的任何数据，可与 !Pig 并存。
-- 视觉直接套 GW2_UI 风格，不提供样式切换。

local _, addonTable = ...

local ChatBar = {}
addonTable.ChatBar = ChatBar
_G.GW2Plus_ChatBar = ChatBar -- 方便调试与设置面板访问

local GW = _G.GW2_ADDON
local MEDIA = "Interface/AddOns/GW2_UI/textures/emoji/"
local BUTTON_SIZE = 25
local IsLoaded = (_G.C_AddOns and _G.C_AddOns.IsAddOnLoaded) or _G.IsAddOnLoaded

--------------------------------------------------------------------------------
-- 一、默认配置
--------------------------------------------------------------------------------

local defaults = {
    enable = true,
    hidden = {},        -- [按钮 key] = true 表示隐藏
    anchor = 1,         -- 1 = 聊天栏上方，2 = 聊天栏下方
    offsetX = 0,
    offsetY = 0,
    scale = 1.0,
    fadeOnLeave = false, -- 鼠标离开渐隐
    autoHide = true,     -- 动态显隐：不在队伍/团队/战场时隐藏对应按钮
    banWindow = nil,     -- 频道屏蔽控制窗口名，nil 表示第一个聊天窗口
}

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

--------------------------------------------------------------------------------
-- 二、表情数据
--------------------------------------------------------------------------------
-- 直接用 GW2_UI 的表情资源与表情码。点击插入 :name: 后由 GW2_UI 的聊天模块
-- 渲染成图标（需要 GW2_UI 设置里的「聊天表情」开着）。

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

--------------------------------------------------------------------------------
-- 三、按钮定义
--------------------------------------------------------------------------------
-- kind      = "chat"    内置聊天类型，左键用斜杠命令切换输入框
--             "channel" 编号频道，左键需要先确保已加入
--             "tool"    功能按钮
-- cmd       左键斜杠命令
-- rightCmd  右键斜杠命令；设了它右键就是发言，不再是屏蔽
-- noRight   右键无任何行为
-- msgGroup  右键屏蔽/取消屏蔽时要操作的消息组，缺省用 key
-- visible   动态显隐判定，返回 false 时该按钮让位
-- addon     依赖的插件，未安装则整个按钮不创建

local BUTTONS = {
    {key = "SAY",   text = "说", kind = "chat", cmd = "s",  color = {1, 1, 1},           noRight = true},
    {key = "YELL",  text = "喊", kind = "chat", cmd = "y",  color = {1, 0.25, 0.25}},
    {key = "GUILD", text = "会", kind = "chat", cmd = "g",  color = {0.25, 1, 0.25},     msgGroup = {"GUILD", "OFFICER"},
        visible = function() return IsInGuild() end},
    {key = "PARTY", text = "队", kind = "chat", cmd = "p",  color = {0.6667, 0.6667, 1}, noRight = true,
        visible = function() return IsInGroup() end},
    {key = "RAID",  text = "团", kind = "chat", cmd = "ra", color = {1, 0.498, 0},       rightCmd = "rw",
        visible = function() return IsInRaid() end},
    -- 战场频道：Classic Era 用 /bg。右键发战场通知，命令同 /rw
    {key = "INSTANCE_CHAT", text = "战", kind = "chat", cmd = "bg", color = {1, 0.498, 0}, rightCmd = "rw",
        visible = function() return IsInRaid(LE_PARTY_CATEGORY_INSTANCE or 2) end},

    {key = "GENERAL",        text = "综", kind = "channel", color = {0.888, 0.668, 0.668}},
    {key = "TRADE",          text = "交", kind = "channel", color = {0.888, 0.668, 0.668}},
    {key = "LOOK_FOR_GROUP", text = "组", kind = "channel", color = {0.888, 0.668, 0.668}},
    -- 下面两个不是暴雪的内置频道，频道名写死；GetChannelIndex 会自动兼容 PIG1..PIG5 这类后缀
    {key = "PIG",            text = "P", kind = "channel", color = {1, 0.6, 0.2},
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

--------------------------------------------------------------------------------
-- 四、频道辅助
--------------------------------------------------------------------------------

function ChatBar.Print(msg)
    DEFAULT_CHAT_FRAME:AddMessage("|cffFFaa00[频道按钮]|r " .. msg)
end

-- 编号频道支持 名称/名称1..5 的变体（部分服务器会拆分世界频道）
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

-- 屏蔽控制作用于哪个聊天窗口
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

-- 列出所有聊天窗口名，供设置面板下拉使用
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

-- 内置聊天类型当前是否显示在屏蔽控制窗口里
local function IsMessageShown(msgType)
    local _, index = GetBanChatFrame()
    for _, v in ipairs({GetChatWindowMessages(index)}) do
        if v == msgType then return true end
    end
    return false
end

-- 编号频道当前是否显示在屏蔽控制窗口里
local function IsChannelShown(channelName)
    local _, index = GetBanChatFrame()
    local channels = {GetChatWindowChannels(index)}
    for i = 1, #channels, 2 do
        if channels[i] == channelName then return true end
    end
    return false
end

-- 把文本塞进输入框，前面挂上斜杠命令
local function PrefixEditBox(prefix)
    local editBox = ChatEdit_ChooseBoxForSend()
    local text = editBox:GetText()
    if not editBox:HasFocus() then
        ChatEdit_ActivateChat(editBox)
    end
    editBox:SetText(prefix .. " " .. text)
end

--------------------------------------------------------------------------------
-- 五、按钮外观（GW2 风格）
--------------------------------------------------------------------------------

local function SkinButton(button)
    -- 底色兜底：GwCreateBackdrop 只画边框，没有它按钮会是全透明的
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

--------------------------------------------------------------------------------
-- 六、表情面板
--------------------------------------------------------------------------------

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

    -- 鼠标移开 1.5 秒后自动收起
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

--------------------------------------------------------------------------------
-- 七、按钮条
--------------------------------------------------------------------------------

local bar

local function CreateChannelButton(def)
    local button = CreateFrame("Button", nil, bar)
    button:SetSize(BUTTON_SIZE, BUTTON_SIZE)
    button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
    button.def = def
    SkinButton(button)

    -- 必须给一个继承模板：FontString 没有字体对象时 SetText 什么都不显示，
    -- 之后 SkinFont 再换成 GW2 字体
    button.Text = button:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    button.Text:SetPoint("CENTER")
    button.Text:SetText(def.text)
    SkinFont(button.Text)
    button.Text:SetTextColor(unpack(def.color))

    -- 已屏蔽标记
    button.blocked = button:CreateTexture(nil, "OVERLAY")
    button.blocked:SetTexture("interface/common/voicechat-muted.blp")
    button.blocked:SetSize(BUTTON_SIZE - 9, BUTTON_SIZE - 9)
    button.blocked:SetAlpha(0.7)
    button.blocked:SetPoint("CENTER")
    button.blocked:Hide()

    button:SetScript("OnMouseDown", function(self) self.Text:SetPoint("CENTER", 1, -1) end)
    button:SetScript("OnMouseUp", function(self) self.Text:SetPoint("CENTER", 0, 0) end)

    button:HookScript("OnEnter", function(self)
        bar:FadeIn()
        GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT", 0, 0)
        if def.tip then
            GameTooltip:SetText(def.tip)
        elseif def.rightCmd then
            GameTooltip:SetText("|cff00FFff左键-|r|cffFFFF00发言|r\n|cff00FFff右键-|r|cffFFFF00通知|r")
        elseif def.noRight then
            GameTooltip:SetText("|cff00FFff左键-|r|cffFFFF00发言|r")
        else
            GameTooltip:SetText("|cff00FFff左键-|r|cffFFFF00发言|r\n|cff00FFff右键-|r|cffFFFF00屏蔽/取消屏蔽|r")
        end
        GameTooltip:Show()
    end)
    button:HookScript("OnLeave", function()
        bar:FadeOut()
        GameTooltip:Hide()
    end)

    return button
end

-- 内置聊天类型的点击
local function OnChatClick(self, click)
    local def = self.def
    if click == "LeftButton" then
        PrefixEditBox("/" .. def.cmd)
        return
    end
    if def.noRight then return end
    if def.rightCmd then
        PrefixEditBox("/" .. def.rightCmd)
        return
    end

    -- 右键屏蔽/取消屏蔽
    local frame = GetBanChatFrame()
    local groups = def.msgGroup or {def.key}
    if IsMessageShown(def.key) then
        for _, g in ipairs(groups) do ChatFrame_RemoveMessageGroup(frame, g) end
        ChatBar.Print("已屏蔽 " .. (_G[def.key] or def.text) .. " 频道")
        self.blocked:Show()
    else
        for _, g in ipairs(groups) do ChatFrame_AddMessageGroup(frame, g) end
        ChatBar.Print("已取消屏蔽 " .. (_G[def.key] or def.text) .. " 频道")
        self.blocked:Hide()
    end
end

-- 编号频道的点击
local function OnChannelClick(self, click)
    local channelName = self.def.channelName or _G[self.def.key]
    if not channelName then return end
    local frame, index = GetBanChatFrame()

    if click == "LeftButton" then
        local id = GetChannelIndex(channelName)
        if id == 0 then
            -- 尚未加入，先加进来
            JoinTemporaryChannel(channelName, nil, index, 1)
            C_Timer.After(1, function()
                if GetChannelIndex(channelName) > 0 then
                    AddChannelToFrame(frame, channelName)
                    self.blocked:Hide()
                    ChatBar.Print("已加入 " .. channelName .. " 频道")
                else
                    ChatBar.Print("加入 " .. channelName .. " 频道失败，请稍后再试")
                end
            end)
            return
        end
        AddChannelToFrame(frame, channelName)
        PrefixEditBox("/" .. id)
        return
    end

    -- 右键屏蔽/取消屏蔽
    if GetChannelIndex(channelName) == 0 then
        ChatBar.Print("尚未加入 " .. channelName .. " 频道")
        return
    end
    if IsChannelShown(channelName) then
        RemoveChannelFromFrame(frame, channelName)
        ChatBar.Print("已屏蔽 " .. channelName .. " 频道")
        self.blocked:Show()
    else
        AddChannelToFrame(frame, channelName)
        ChatBar.Print("已取消屏蔽 " .. channelName .. " 频道")
        self.blocked:Hide()
    end
end

-- 刷新所有频道按钮的屏蔽标记
local function UpdateBlockedIcons()
    if not bar then return end
    for _, button in ipairs(bar.buttons) do
        local def = button.def
        if def.kind == "chat" and not def.rightCmd and not def.noRight then
            button.blocked:SetShown(not IsMessageShown(def.key))
        elseif def.kind == "channel" then
            local name = def.channelName or _G[def.key]
            button.blocked:SetShown(name ~= nil and not IsChannelShown(name))
        end
    end
end
ChatBar.UpdateBlockedIcons = UpdateBlockedIcons

--------------------------------------------------------------------------------
-- 八、布局与显隐
--------------------------------------------------------------------------------

function ChatBar.UpdateLayout()
    if not bar then return end
    local db = GW2_UI_PLUS_ChatBarSV
    local index = 0
    for _, button in ipairs(bar.buttons) do
        local def = button.def
        local show = not db.hidden[def.key]
        -- 动态显隐只作用于频道按钮
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

--------------------------------------------------------------------------------
-- 九、构建
--------------------------------------------------------------------------------

local function Build()
    bar = CreateFrame("Frame", "GW2PlusChatBar", UIParent)
    bar:SetSize(BUTTON_SIZE, BUTTON_SIZE)
    -- MEDIUM：LOW 会被 GW2_UI 的聊天框背景盖住
    bar:SetFrameStrata("MEDIUM")
    bar.buttons = {}
    ChatBar.bar = bar

    function bar:FadeIn() self:SetAlpha(1) end
    function bar:FadeOut()
        if GW2_UI_PLUS_ChatBarSV.fadeOnLeave then self:SetAlpha(0.06) else self:SetAlpha(1) end
    end

    for _, def in ipairs(BUTTONS) do
        -- 依赖的插件没装就不创建这个按钮
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

    -- 鼠标滑过聊天窗口时也让按钮条亮起来
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

    -- 频道订阅状态要等聊天系统就绪，分几次补刷
    for _, delay in ipairs({3, 5, 10}) do
        C_Timer.After(delay, UpdateBlockedIcons)
    end
end

--------------------------------------------------------------------------------
-- 十、诊断命令 /gwcb
--------------------------------------------------------------------------------

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

    p("---- 频道按钮诊断 ----")
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
