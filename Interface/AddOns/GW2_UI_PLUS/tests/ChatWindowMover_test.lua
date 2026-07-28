local function Read(path)
    local file = assert(io.open(path, "r"))
    local source = file:read("*a")
    file:close()
    return source
end

local chatWindow = Read("ChatWindow/ChatWindow.lua")
local options = Read("ChatWindow/Options.lua")

assert(chatWindow:find('local MOVER_SETTING = "ChatFrame1_pos"', 1, true),
    "主聊天窗口应使用独立的 GW2 UI mover 设置")
assert(chatWindow:find("GW.globalDefault.profile[MOVER_SETTING]", 1, true)
    and chatWindow:find("GW.settings[MOVER_SETTING]", 1, true),
    "注册 mover 前应补齐 GW 默认值和当前设置")
assert(chatWindow:find("GW.RegisterMovableFrame(frame", 1, true),
    "ChatFrame1 应通过 GW.RegisterMovableFrame 注册")
assert(chatWindow:find('{"default"}', 1, true),
    "聊天窗口 mover 应只提供恢复默认选项")
assert(not chatWindow:find('"scaleable"', 1, true)
    and not chatWindow:find('"height"', 1, true),
    "聊天窗口 mover 不应提供缩放或高度选项")
assert(chatWindow:find('frame:SetPoint("BOTTOMLEFT", frame.gwMover', 1, true),
    "ChatFrame1 应锚定到自己的 mover")
assert(chatWindow:find("SyncDBFromMover", 1, true),
    "拖动结束后应同步现有边距存档")
assert(options:find("ChatWindow.ApplyPosition", 1, true),
    "设置页边距变化应主动移动 mover")

print("ChatWindowMover_test: OK")
