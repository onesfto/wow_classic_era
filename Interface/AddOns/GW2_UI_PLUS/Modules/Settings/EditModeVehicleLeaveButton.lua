local GW = _G.GW2_ADDON

local SETTING = "GW2PlusVehicleLeaveButton_pos"
local DISPLAY_NAME = "飞行请求终止"

local function CopyPoint(point)
    return {
        point = point.point,
        relativePoint = point.relativePoint,
        xOfs = point.xOfs,
        yOfs = point.yOfs,
        hasMoved = point.hasMoved,
    }
end

local function GetButtonCenter(button)
    local x, y = button:GetCenter()
    return {
        point = "CENTER",
        relativePoint = "BOTTOMLEFT",
        xOfs = x or 0,
        yOfs = y or 0,
        hasMoved = false,
    }
end

local function IsValidPoint(point)
    return type(point) == "table"
        and type(point.point) == "string"
        and type(point.relativePoint) == "string"
        and type(point.xOfs) == "number"
        and type(point.yOfs) == "number"
end

local function ApplyButtonPosition(moverFrame)
    local button = _G.MainMenuBarVehicleLeaveButton
    local anchor = _G.ActionButton12
    local mover = moverFrame and moverFrame.gwMover
    if not button or not anchor or not mover then return end

    local centerX, centerY = mover:GetCenter()
    local anchorRight = anchor:GetRight()
    local anchorCenterY = select(2, anchor:GetCenter())
    local anchorScale = anchor.GetEffectiveScale and anchor:GetEffectiveScale() or 1
    if not centerX or not centerY or not anchorRight or not anchorCenterY then return end

    local xOffset = (centerX - mover:GetWidth() / 2 - anchorRight) / anchorScale
    local yOffset = (centerY - anchorCenterY) / anchorScale

    button:ClearAllPoints()
    button:SetPoint("LEFT", anchor, "RIGHT", xOffset, yOffset)
end

local function RegisterVehicleLeaveButton()
    if not GW or not GW.RegisterMovableFrame or not GW.settings
        or not GW.globalDefault or not GW.globalDefault.profile then
        return
    end

    local button = _G.MainMenuBarVehicleLeaveButton
    local anchor = _G.ActionButton12
    if not button or not anchor or button.gwPlusMover then return end

    local defaultPoint = GetButtonCenter(button)
    local savedPoint = GW.settings[SETTING]
    if not IsValidPoint(savedPoint) then
        savedPoint = CopyPoint(defaultPoint)
        GW.settings[SETTING] = savedPoint
    end
    GW.globalDefault.profile[SETTING] = GW.globalDefault.profile[SETTING]
        or CopyPoint(defaultPoint)

    local moverFrame = CreateFrame("Frame", "GW2PlusVehicleLeaveButton", UIParent)
    moverFrame:SetSize(button:GetSize())
    button.gwPlusMover = moverFrame

    local function ApplyPosition()
        ApplyButtonPosition(moverFrame)
    end

    GW.RegisterMovableFrame(
        moverFrame,
        DISPLAY_NAME,
        SETTING,
        "Blizzard,Widgets",
        {button:GetSize()},
        {"default"},
        nil,
        ApplyPosition
    )

    ApplyPosition()
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    RegisterVehicleLeaveButton()
end)
