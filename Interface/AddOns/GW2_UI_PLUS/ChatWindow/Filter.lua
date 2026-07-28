-- GW2_UI_PLUS 聊天消息过滤
--
-- 思路照搬 CChatFilter（本机 Interface/AddOns/CChatFilter/filter.lua），
-- 但只取用户要的四件事，去掉了它那套副本关键词、白名单转发窗口、小地图按钮等。
-- 两个插件同时开着不冲突：各自注册各自的过滤器，暴雪会挨个问一遍。
--
-- 作用范围：
--   关键词黑名单   编号频道 + 说话 + 大喊
--   重复内容裁减   只管编号频道（刷屏都在那儿，队伍/密语裁了反而碍事）
--   进出频道信息   CHAT_MSG_CHANNEL_JOIN / LEAVE

local _, addonTable = ...

local ChatWindow = addonTable.ChatWindow
if not ChatWindow then return end

local TrimMessage = addonTable.ChatMsgTrim

--------------------------------------------------------------------------------
-- 一、关键词黑名单
--------------------------------------------------------------------------------

local keywords = {}

-- 逗号分隔的一串词拆成小写词表。配置一改就重建，匹配时不用反复 lower/split。
-- 中英文逗号都认，顺手去掉词两边的空格。
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

-- 用 plain 匹配，不当正则：用户填的是关键词，里面出现 [ 或 - 不该报错也不该改变语义
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

--------------------------------------------------------------------------------
-- 二、过滤器
--------------------------------------------------------------------------------

-- 同一条消息，每个开着的聊天标签都会各调一次过滤器，lineID 相同。
-- 缓存上一条的判定：既省掉重复计算，也保证各标签拿到一致的结果。
local lastLine, lastBlocked, lastMessage, lastTrimmed = nil, false, nil, 0

-- CHAT_MSG_CHANNEL 的参数（message 之后）：
--   1 发送者全名  4 发送者短名  5 特殊标记  7 频道区域号
--   8 频道编号    9 频道名      11 lineID   12 GUID
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

-- 进入/离开频道是独立事件，不是 CHAT_MSG_CHANNEL 的子类型。
-- 必须单独注册才拦得住——CChatFilter 是在 CHAT_MSG_CHANNEL 的过滤器里比对
-- event == CHAT_MSG_CHANNEL_JOIN，那个分支实际上永远不会成立。
local function JoinLeaveFilter()
    local db = ChatWindow.InitDB()
    return db.hideJoinLeave and true or false
end

--------------------------------------------------------------------------------
-- 三、BugGrabber 的「错误太多」警告
--------------------------------------------------------------------------------
-- 「用户界面有太多的错误……」这条不是暴雪发的，是 BugGrabber 自己 print 出来的
-- （!BugGrabber/BugGrabber.lua:325）：每秒错误数超过阈值时它就停止记录，
-- 每 10 秒往聊天框丢一条这个警告。
--
-- print 直接调 DEFAULT_CHAT_FRAME:AddMessage，不经过 ChatFrame_AddMessageEventFilter，
-- 所以这里只能包一层 AddMessage 才拦得住（CChatFilter 的 shortChannels 也是这么干的）。
--
-- 注意：这条消息响起来的时候 BugGrabber 已经暂停记录了，屏蔽它等于把仪表盘的
-- 警告灯拆掉——真正该做的是去 BugSack 里看是谁在报错。

local SPAM_MARKERS = {
    "用户界面有太多的错误",         -- zhCN
    "你的UI有太多的錯誤",           -- zhTW
    "too many errors in your UI",   -- enUS
}

local hookedAddMessage = false

local function HookAddMessage()
    if hookedAddMessage then return end
    local frame = DEFAULT_CHAT_FRAME
    if not frame or not frame.AddMessage then return end
    hookedAddMessage = true

    -- 要拦截而不是旁观，所以是包装不是 hooksecurefunc
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

--------------------------------------------------------------------------------
-- 四、驱动
--------------------------------------------------------------------------------

-- 过滤器一直挂着，开关全靠 db 里的标志位，所以改设置不需要重载
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL", ChannelFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", SayYellFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", SayYellFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_JOIN", JoinLeaveFilter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_CHANNEL_LEAVE", JoinLeaveFilter)

-- 存档变量要到 ADDON_LOADED 之后才有，黑名单等到那时候再建
local driver = CreateFrame("Frame")
driver:RegisterEvent("PLAYER_LOGIN")
driver:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    RebuildBlacklist()
    -- 等 GW2_UI 的聊天皮肤先包完 AddMessage，我们再包在最外层
    HookAddMessage()
end)
