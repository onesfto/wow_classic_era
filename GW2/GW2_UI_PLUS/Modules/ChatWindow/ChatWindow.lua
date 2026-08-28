local _, addonTable = ...
local GW = _G.GW2_ADDON
local ChatWindow = {}
addonTable.ChatWindow = ChatWindow
_G.GW2Plus_ChatWindow = ChatWindow
local defaults = {
    enable = true,
    width = 400,
    height = 200,
    offsetX = 37,
    offsetY = 46,
    classColor = true,
    editBoxTop = false,
    hideJoinLeave = true,
    trimRepeat = true,
    blacklistEnable = false,
    blacklist = "",
    hideBugGrabberSpam = true,
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
    if FCF_SavePositionAndDimensions then
        FCF_SavePositionAndDimensions(frame)
    end
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
local hooked = false
local function HookFrame()
    if hooked then return end
    local frame = _G.ChatFrame1
    if not frame then return end
    hooked = true
    hooksecurefunc(frame, "SetPoint", function(_, _, anchor)
        if applying or anchor == frame.gwMover then return end
        Apply()
    end)
end
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
        C_Timer.After(0.3, Apply)
    end
end)
