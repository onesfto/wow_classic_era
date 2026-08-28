local _, addonTable = ...
local ChatWindow = addonTable.ChatWindow
if not ChatWindow then return end
local TrimMessage = addonTable.ChatMsgTrim
local keywords = {}
local function RebuildBlacklist()
    wipe(keywords)
    local db = ChatWindow.InitDB()
    for raw in string.gmatch(db.blacklist or "", "[^,，]+") do
        local word = string.lower(strtrim(raw))
        if word ~= "" then
            table.insert(keywords, word)
        end
    end
end
ChatWindow.RebuildBlacklist = RebuildBlacklist
local function HitBlacklist(lowerMessage, fullname)
    local lowerName = fullname and string.lower(fullname) or nil
    for _, word in ipairs(keywords) do
        if string.find(lowerMessage, word, 1, true) then
            return true
        end
        if lowerName and string.find(lowerName, word, 1, true) then
            return true
        end
    end
    return false
end
local lastLine, lastBlocked, lastMessage, lastTrimmed = nil, false, nil, 0
local function ChannelFilter(_, _, message, ...)
    local db = ChatWindow.InitDB()
    if not message or message == "" then return false end
    local fullname = select(1, ...)
    local line = select(10, ...)
    if line and line == lastLine then
        if lastBlocked then return true end
        if lastTrimmed == 0 then return false end
        return false, lastMessage, ...
    end
    lastLine, lastBlocked, lastMessage, lastTrimmed = line, false, message, 0
    if db.blacklistEnable and HitBlacklist(string.lower(message), fullname) then
        lastBlocked = true
        return true
    end
    if db.trimRepeat and TrimMessage then
        local trimmed, newMessage = TrimMessage(message)
        if trimmed > 0 then
            lastTrimmed, lastMessage = trimmed, newMessage
            return false, newMessage, ...
        end
    end
    return false
end
local function SayYellFilter(_, _, message, fullname)
    local db = ChatWindow.InitDB()
    if not db.blacklistEnable then return false end
    if not message or message == "" then return false end
    return HitBlacklist(string.lower(message), fullname) and true or false
end
local function JoinLeaveFilter()
    local db = ChatWindow.InitDB()
    return db.hideJoinLeave and true or false
end
local SPAM_MARKERS = {
    "用户界面有太多的错误",
    "你的UI有太多的錯誤",
    "too many errors in your UI",
}
local hookedAddMessage = false
local function HookAddMessage()
    if hookedAddMessage then return end
    local frame = DEFAULT_CHAT_FRAME
    if not frame or not frame.AddMessage then return end
    hookedAddMessage = true
    local origin = frame.AddMessage
    frame.AddMessage = function(self, text, ...)
        if type(text) == "string" then
            local db = ChatWindow.InitDB()
            if db.hideBugGrabberSpam then
                for _, marker in ipairs(SPAM_MARKERS) do
                    if string.find(text, marker, 1, true) then return end
                end
            end
        end
        return origin(self, text, ...)
    end
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", ChannelFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", SayYellFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", SayYellFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_JOIN", JoinLeaveFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_LEAVE", JoinLeaveFilter)
local driver = CreateFrame("Frame")
driver:RegisterEvent("PLAYER_LOGIN")
driver:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    RebuildBlacklist()
    HookAddMessage()
end)
