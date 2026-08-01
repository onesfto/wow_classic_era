local _, addonTable = ...
local ChatWindow = addonTable.ChatWindow
if not ChatWindow then return end
local CHAT_TYPES = {
    "SAY", "EMOTE", "YELL", "GUILD", "OFFICER", "WHISPER",
    "PARTY", "PARTY_LEADER", "RAID", "RAID_LEADER", "RAID_WARNING",
    "INSTANCE_CHAT", "INSTANCE_CHAT_LEADER",
}
local function Apply()
    local db = ChatWindow.InitDB()
    local on = db.classColor and true or false
    SetCVar("chatClassColorOverride", on and "0" or "1")
    for _, chatType in ipairs(CHAT_TYPES) do
        SetChatColorNameByClass(chatType, on)
    end
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
