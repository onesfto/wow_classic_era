-- GW2_UI_PLUS 输入栏置顶
--
-- 把聊天输入框从聊天窗下方挪到窗口顶端，做法参考 Leatrix Plus
-- （Leatrix_Plus.lua:10756 "Move chat editbox to top"）。
--
-- 比 Leatrix 多两件事，都是 GW2_UI 带来的：
--   1. GW2_UI 的 setButtonPosition 会把输入框重新按回下方，而它是个 local 函数、
--      够不着（README 第六节第 3 条），只能 hook 输入框的 SetPoint 事后改回来
--   2. GW2_UI 的背景容器底边原本锚在输入框右边框上，输入框一走背景会跟着塌，
--      得把容器改成框住聊天窗本体

local _, addonTable = ...

local ChatWindow = addonTable.ChatWindow
if not ChatWindow then return end

-- 自己调 SetPoint 时置位，挡住下面那个钩子的重入
local applying = false

local function ApplyOne(frame)
    local db = ChatWindow.InitDB()
    if not db.editBoxTop or not frame then return end

    local name = frame:GetName()
    if not name then return end
    local editbox = _G[name .. "EditBox"]
    if not editbox then return end

    applying = true

    -- 压在聊天窗内部顶端，和 Leatrix 一样。
    -- 不能改挂到框体外的上方——那儿是标签条 GeneralDockManager 的地盘
    -- （chatframe.lua:225，标签条就锚在 ChatFrame1 上方 3 像素处）
    editbox:ClearAllPoints()
    editbox:SetPoint("TOP", frame, "TOP", 0, 0)
    editbox:SetPoint("LEFT", frame, "LEFT", 0, 0)
    editbox:SetPoint("RIGHT", frame, "RIGHT", 0, 0)

    -- 容器原本是 BOTTOMRIGHT 锚到 ChatFrameNEditBoxRight 的（chatframe.lua:2233），
    -- 改成锚回聊天窗自己，否则背景底边会跟着输入框跑到顶部去
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

-- 密语、宠物对战之类的临时窗口是后建出来的，建一个收拾一个
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
    -- 上游的聊天皮肤还有几轮延时重排，等它们跑完再定一次
    C_Timer.After(0.3, ApplyAll)
end)
