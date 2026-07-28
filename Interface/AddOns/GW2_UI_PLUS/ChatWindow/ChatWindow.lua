-- GW2_UI_PLUS 聊天窗口位置与大小
-- 把主聊天窗 ChatFrame1 注册到 GW2_UI 的移动界面；位置跟随原生 mover，
-- 尺寸继续由本模块设置，并写回暴雪聊天窗口存档。
--
-- 只管 ChatFrame1：停靠在它上面的标签页（综合、战斗记录……）会自动跟随尺寸，
-- 撕出去的独立窗口不动。

local _, addonTable = ...

local GW = _G.GW2_ADDON

local ChatWindow = {}
addonTable.ChatWindow = ChatWindow
_G.GW2Plus_ChatWindow = ChatWindow -- 方便调试与设置面板访问

--------------------------------------------------------------------------------
-- 一、默认配置
--------------------------------------------------------------------------------

local defaults = {
    -- 位置与大小
    enable = true,
    width = 400,
    height = 200,
    offsetX = 37,   -- 聊天窗左边距屏幕左边的距离
    offsetY = 46,   -- 聊天窗底边距屏幕底边的距离

    -- 外观
    classColor = true,      -- 频道里的玩家名用职业颜色
    editBoxTop = false,     -- 输入栏移到聊天窗顶部

    -- 消息过滤
    hideJoinLeave = true,   -- 不显示进入/离开频道信息
    trimRepeat = true,      -- 重复符号、词、句裁减
    blacklistEnable = false,
    blacklist = "",         -- 关键词黑名单，逗号分隔
    hideBugGrabberSpam = true,  -- 不显示 BugGrabber 的「错误太多」警告
}
ChatWindow.defaults = defaults

local MOVER_SETTING = "ChatFrame1_pos"
local MOVER_DEFAULT = {
    point = "BOTTOMLEFT",
    relativePoint = "BOTTOMLEFT",
    xOfs = defaults.offsetX,
    yOfs = defaults.offsetY,
    hasMoved = false,
}

local function InitDB()
    GW2_UI_PLUS_ChatWindowSV = GW2_UI_PLUS_ChatWindowSV or {}
    local db = GW2_UI_PLUS_ChatWindowSV
    for k, v in pairs(defaults) do
        if db[k] == nil then
            db[k] = v
        end
    end
    return db
end
ChatWindow.InitDB = InitDB

local function EnsureMoverSettings(db)
    if not GW or not GW.settings or not GW.RegisterMovableFrame then return false end

    if GW.globalDefault and GW.globalDefault.profile then
        GW.globalDefault.profile[MOVER_SETTING] = GW.CopyTable(MOVER_DEFAULT)
    end
    if not GW.settings[MOVER_SETTING] then
        local point = GW.CopyTable(MOVER_DEFAULT)
        point.xOfs = db.offsetX
        point.yOfs = db.offsetY
        point.hasMoved = point.xOfs ~= MOVER_DEFAULT.xOfs
            or point.yOfs ~= MOVER_DEFAULT.yOfs
        GW.settings[MOVER_SETTING] = point
    end

    return true
end

--------------------------------------------------------------------------------
-- 二、应用
--------------------------------------------------------------------------------

-- 整个 Apply 期间持锁。下面那个 SetPoint 钩子会调回 Apply，
-- 而 Apply 自己就要调 SetPoint、FCF_DockUpdate，不锁住必然无限递归。
local applying = false

local function RoundOffset(value)
    if GW and GW.RoundInt then return GW.RoundInt(value) end
    return math.floor(value + 0.5)
end

local function SyncDBFromMover(frame)
    local mover = frame and frame.gwMover
    local left = mover and mover:GetLeft()
    local bottom = mover and mover:GetBottom()
    if not left or not bottom then return end

    local db = InitDB()
    db.offsetX = RoundOffset(left)
    db.offsetY = RoundOffset(bottom)

    if FCF_SavePositionAndDimensions then
        FCF_SavePositionAndDimensions(frame)
    end
end

local function RegisterMover()
    local db = InitDB()
    local frame = _G.ChatFrame1
    if not db.enable or not frame or frame.gwMover or not EnsureMoverSettings(db) then return end

    GW.RegisterMovableFrame(frame, "主聊天窗口", MOVER_SETTING,
        "Blizzard", nil, {"default"}, nil, SyncDBFromMover)
end

local function Apply()
    if applying then return end

    local db = InitDB()
    local frame = _G.ChatFrame1
    if not db.enable or not frame then return end

    applying = true

    -- 不标 UserPlaced 的话，暴雪重排界面时会把聊天窗挪回它自己的默认位置
    if frame:IsMovable() then
        frame:SetUserPlaced(true)
    end

    frame:ClearAllPoints()
    if frame.gwMover then
        frame:SetPoint("BOTTOMLEFT", frame.gwMover, "BOTTOMLEFT", 0, 0)
    else
        frame:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", db.offsetX, db.offsetY)
    end
    frame:SetSize(db.width, db.height)

    -- 写回暴雪自己的存档（CVar），这样它下次还原时用的也是这套值
    if FCF_SavePositionAndDimensions then
        FCF_SavePositionAndDimensions(frame)
    end

    -- 标签条与停靠的其它窗口跟着新尺寸重排
    if FCF_DockUpdate then
        FCF_DockUpdate()
    end

    applying = false
end
ChatWindow.Apply = Apply

function ChatWindow.ApplyPosition()
    local db = InitDB()
    local frame = _G.ChatFrame1
    local mover = frame and frame.gwMover
    if not mover or not GW or not GW.settings then
        Apply()
        return
    end

    local point = GW.settings[MOVER_SETTING] or GW.CopyTable(MOVER_DEFAULT)
    point.point = "BOTTOMLEFT"
    point.relativePoint = "BOTTOMLEFT"
    point.xOfs = db.offsetX
    point.yOfs = db.offsetY
    point.hasMoved = point.xOfs ~= MOVER_DEFAULT.xOfs
        or point.yOfs ~= MOVER_DEFAULT.yOfs

    GW.settings[MOVER_SETTING] = point
    mover.savedPoint = GW.CopyTable(point)
    mover:ClearAllPoints()
    mover:SetPoint(point.point, UIParent, point.relativePoint, point.xOfs, point.yOfs)
    frame.isMoved = point.hasMoved
    frame:SetAttribute("isMoved", point.hasMoved)

    if GW.UpdateMatchingLayout then
        GW.UpdateMatchingLayout(mover, point)
    end

    Apply()
end

--------------------------------------------------------------------------------
-- 三、守住位置
--------------------------------------------------------------------------------

local hooked = false

local function HookFrame()
    if hooked then return end
    local frame = _G.ChatFrame1
    if not frame then return end
    hooked = true

    -- 暴雪和 GW2_UI 在登录之后还会多次重排聊天窗，被挪走就拉回来。
    -- Apply 内部的 SetPoint 由 applying 锁挡掉，不会打转。
    hooksecurefunc(frame, "SetPoint", function(_, _, anchor)
        if applying or anchor == frame.gwMover then return end
        Apply()
    end)
end

--------------------------------------------------------------------------------
-- 四、驱动
--------------------------------------------------------------------------------

local driver = CreateFrame("Frame")
driver:RegisterEvent("PLAYER_ENTERING_WORLD")
driver:RegisterEvent("UI_SCALE_CHANGED")
driver:RegisterEvent("DISPLAY_SIZE_CHANGED")
driver:SetScript("OnEvent", function(_, event)
    InitDB()
    RegisterMover()
    HookFrame()
    Apply()

    if event == "PLAYER_ENTERING_WORLD" then
        -- 上游在这之后还有几轮延时的聊天皮肤重排（GW2_UI 的 evLoadSkins 走
        -- C_Timer.After(0, ...)），等它们跑完再定一次
        C_Timer.After(0.3, Apply)
    end
end)
