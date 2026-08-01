local _, addonTable = ...
local ChatWindow = addonTable.ChatWindow
if not ChatWindow then return end
local applying = false
local function ApplyOne(frame)
    local db = ChatWindow.InitDB()
    if not db.editBoxTop or not frame then return end
    local name = frame:GetName()
    if not name then return end
    local editbox = _G[name .. "EditBox"]
    if not editbox then return end
    applying = true
    editbox:ClearAllPoints()
    editbox:SetPoint("TOP", frame, "TOP", 0, 0)
    editbox:SetPoint("LEFT", frame, "LEFT", 0, 0)
    editbox:SetPoint("RIGHT", frame, "RIGHT", 0, 0)
    local container = frame.Container
    if container then
        local left = (frame.buttonSide == "right") and -5 or -35
        container:ClearAllPoints()
        container:SetPoint("TOPLEFT", frame, "TOPLEFT", left, 5)
        container:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 5, 0)
    end
    applying = false
end
local hooked = {}
local function HookOne(frame)
    local name = frame and frame:GetName()
    if not name or hooked[name] then return end
    local editbox = _G[name .. "EditBox"]
    if not editbox then return end
    hooked[name] = true
    hooksecurefunc(editbox, "SetPoint", function()
        if applying then return end
        ApplyOne(frame)
    end)
end
local function ApplyAll()
    local db = ChatWindow.InitDB()
    if not db.editBoxTop then return end
    for _, name in ipairs(CHAT_FRAMES) do
        local frame = _G[name]
        if frame then
            HookOne(frame)
            ApplyOne(frame)
        end
    end
end
ChatWindow.ApplyEditBox = ApplyAll
hooksecurefunc("FCF_OpenTemporaryWindow", function()
    local frame = FCF_GetCurrentChatFrame()
    if frame then
        HookOne(frame)
        ApplyOne(frame)
    end
end)
local driver = CreateFrame("Frame")
driver:RegisterEvent("PLAYER_ENTERING_WORLD")
driver:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    ApplyAll()
    C_Timer.After(0.3, ApplyAll)
end)
