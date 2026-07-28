-- GW2_UI_PLUS 聊天职业颜色
--
-- 让聊天里的玩家名按职业着色。做法和 Leatrix Plus / NDui / CChatFilter 三家一致：
-- 关掉 chatClassColorOverride 这个 CVar，再逐个聊天类型打开按职业着色。
--
-- 和 GW2_UI 自己的「提及时用职业色」(CHAT_CLASS_COLOR_MENTIONS) 不是一回事——
-- 那个管的是消息正文里提到某人名字时的着色，这里管的是发言人名字本身。

local _, addonTable = ...

local ChatWindow = addonTable.ChatWindow
if not ChatWindow then return end

-- Leatrix 的列表去掉了 VOICE_TEXT（经典旧世没有语音转文字）
local CHAT_TYPES = {
    "SAY", "EMOTE", "YELL", "GUILD", "OFFICER", "WHISPER",
    "PARTY", "PARTY_LEADER", "RAID", "RAID_LEADER", "RAID_WARNING",
    "INSTANCE_CHAT", "INSTANCE_CHAT_LEADER",
}

local function Apply()
    local db = ChatWindow.InitDB()
    local on = db.classColor and true or false

    -- "0" = 不覆盖（允许职业色），"1" = 覆盖（统一颜色）
    SetCVar("chatClassColorOverride", on and "0" or "1")

    for _, chatType in ipairs(CHAT_TYPES) do
        SetChatColorNameByClass(chatType, on)
    end

    -- 编号频道挨个来。频道号不连续（退了再加会跳号），扫到 50 稳妥
    for i = 1, 50 do
        SetChatColorNameByClass("CHANNEL" .. i, on)
    end
end
ChatWindow.ApplyClassColor = Apply

local driver = CreateFrame("Frame")
driver:RegisterEvent("PLAYER_ENTERING_WORLD")
driver:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    Apply()
end)
