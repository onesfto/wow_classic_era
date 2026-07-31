local _, addonTable = ...

local GW = _G.GW2_ADDON
local Toolbar = addonTable.Toolbar
if not GW or not Toolbar then return end

local GroupManage = {}
Toolbar.groupManage = GroupManage

local function ApplyStateDriver()
    local db = Toolbar.InitDB().groupManage
    local controller = GroupManage.controller
    if not controller then return end

    local function Apply()
        UnregisterStateDriver(controller, "groupstate")
        RegisterStateDriver(
            controller,
            "groupstate",
            db.enabled and "[group] grouped; solo" or "solo")
    end
    Toolbar.QueueOutOfCombat(
        "GW2PlusToolbarGroupManageState", Apply)
end

local function EnsureFrames()
    if GroupManage.frame then return true end

    if GW.CreateRaidControlFrame then GW.CreateRaidControlFrame() end
    local button = _G.GwManageGroupButton
    local panel = _G.GwGroupManage
    if not button or not panel then return false end

    local holder = CreateFrame(
        "Frame", "GwPlusToolbarGroupManageHolder", UIParent)
    holder:SetSize(262, 320)
    holder:SetFrameStrata("LOW")
    holder:Show()

    button:SetParent(holder)
    button:ClearAllPoints()
    button:SetPoint("TOPLEFT", holder, "TOPLEFT")
    panel:SetParent(holder)
    panel:ClearAllPoints()
    panel:SetPoint("TOPLEFT", holder, "TOPLEFT", 62, 0)

    -- PLUS 不再提供渐隐选项，覆盖原按钮保存的渐隐回调。
    button.fadeOut = function() button:SetAlpha(1) end
    button.fadeIn = function() button:SetAlpha(1) end
    button:SetAlpha(1)

    local controller = CreateFrame(
        "Frame",
        "GwPlusToolbarGroupManageState",
        holder,
        "SecureHandlerStateTemplate")
    controller:SetFrameRef("GroupButton", button)
    controller:SetFrameRef("GroupPanel", panel)
    controller:SetAttribute("_onstate-groupstate", [=[
        local groupButton = self:GetFrameRef("GroupButton")
        local groupPanel = self:GetFrameRef("GroupPanel")
        if newstate == "grouped" then
            groupButton:Show()
        else
            groupPanel:Hide()
            groupButton:Hide()
            groupButton:SetAttribute("state", "closed")
            groupPanel:SetAttribute("state", "closed")
        end
    ]=])

    GroupManage.frame = holder
    GroupManage.button = button
    GroupManage.panel = panel
    GroupManage.controller = controller

    Toolbar.RegisterMover("groupManage", holder, "Group,Widgets")
    return true
end

function GroupManage.Refresh()
    if not EnsureFrames() then return end
    local db = Toolbar.InitDB().groupManage
    Toolbar.QueueOutOfCombat(
        "GW2PlusToolbarGroupManageScale",
        function() GroupManage.frame:SetScale(db.scale) end)
    Toolbar.SetMoverEnabled("groupManage", db.enabled)
    ApplyStateDriver()
end

function GroupManage.SetEnabled(value)
    Toolbar.InitDB().groupManage.enabled = value == true
    GroupManage.Refresh()
end

function GroupManage.SetScale(value)
    local db = Toolbar.InitDB().groupManage
    db.scale = tonumber(value) or 1
    GroupManage.Refresh()
end

function GroupManage.Reset()
    local db = Toolbar.InitDB().groupManage
    db.enabled = Toolbar.defaults.groupManage.enabled
    db.scale = Toolbar.defaults.groupManage.scale
    Toolbar.ResetMover("groupManage")
    GroupManage.Refresh()
end

local driver = CreateFrame("Frame")
driver:RegisterEvent("PLAYER_LOGIN")
driver:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    GroupManage.Refresh()
end)
