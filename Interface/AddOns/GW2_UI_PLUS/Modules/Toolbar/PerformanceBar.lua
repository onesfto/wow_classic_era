local _, addonTable = ...
local Toolbar = addonTable.Toolbar
if not Toolbar then return end
local PerformanceBar = {}
Toolbar.performanceBar = PerformanceBar
local updateElapsed = 0
local function AddMetric(frame, key)
    local text = frame:CreateFontString(nil, "OVERLAY")
    text:SetFont(UNIT_NAME_FONT or "Fonts\\FRIZQT__.TTF", 11, "OUTLINE")
    text:SetTextColor(0.75, 0.95, 0.84)
    text:SetJustifyH("CENTER")
    PerformanceBar.metrics[key] = text
    return text
end
local function Layout()
    local frame = PerformanceBar.frame
    if not frame then return end
    local db = Toolbar.InitDB().performanceBar
    frame:SetSize(db.width, db.height)
    local visible = {}
    for _, key in ipairs({"fps", "home", "world"}) do
        local show = db[key == "fps" and "showFPS" or
            key == "home" and "showHome" or "showWorld"]
        PerformanceBar.metrics[key]:SetShown(show)
        if show then visible[#visible + 1] = PerformanceBar.metrics[key] end
    end
    local itemWidth = db.width / math.max(1, #visible)
    for index, text in ipairs(visible) do
        text:ClearAllPoints()
        text:SetPoint("LEFT", frame, "LEFT",
            (index - 0.5) * itemWidth, 0)
        text:SetWidth(itemWidth)
    end
end
local function UpdateText()
    if not PerformanceBar.frame or not PerformanceBar.frame:IsShown() then
        return
    end
    local fps = math.floor(GetFramerate() + 0.5)
    local _, _, home, world = GetNetStats()
    PerformanceBar.metrics.fps:SetText(string.format("FPS %d", fps))
    PerformanceBar.metrics.home:SetText(string.format("本地 %dms", home or 0))
    PerformanceBar.metrics.world:SetText(string.format("世界 %dms", world or 0))
end
local function EnsureFrame()
    if PerformanceBar.frame then return true end
    local db = Toolbar.InitDB().performanceBar
    local frame = Toolbar.CreateBarFrame(
        "GwPlusToolbarPerformanceBar", db.width, db.height)
    PerformanceBar.frame = frame
    PerformanceBar.metrics = {}
    AddMetric(frame, "fps")
    AddMetric(frame, "home")
    AddMetric(frame, "world")
    Toolbar.RegisterMover("performanceBar", frame, "Widgets")
    frame:SetScript("OnUpdate", function(_, elapsed)
        updateElapsed = updateElapsed + elapsed
        if updateElapsed >= 0.25 then
            updateElapsed = 0
            UpdateText()
        end
    end)
    return true
end
function PerformanceBar.Refresh()
    if not EnsureFrame() then return end
    local db = Toolbar.InitDB().performanceBar
    PerformanceBar.frame:SetShown(db.enabled)
    Toolbar.SetMoverEnabled("performanceBar", db.enabled)
    Layout()
    UpdateText()
end
function PerformanceBar.SetEnabled(value)
    Toolbar.InitDB().performanceBar.enabled = value == true
    PerformanceBar.Refresh()
end
function PerformanceBar.SetSize(key, value)
    local db = Toolbar.InitDB().performanceBar
    if key == "width" then
        db.width = math.max(120, math.min(500, tonumber(value) or 210))
    elseif key == "height" then
        db.height = math.max(18, math.min(60, tonumber(value) or 24))
    end
    PerformanceBar.Refresh()
end
function PerformanceBar.SetMetric(key, value)
    local db = Toolbar.InitDB().performanceBar
    if db[key] == nil then return end
    if value ~= true and db[key] == true then
        local enabledCount = (db.showFPS and 1 or 0)
            + (db.showHome and 1 or 0)
            + (db.showWorld and 1 or 0)
        if enabledCount <= 1 then
            Toolbar.RedrawOption(
                "GW2PlusToolbarPerformanceBar" .. key)
            return
        end
    end
    db[key] = value == true
    PerformanceBar.Refresh()
end
function PerformanceBar.Reset()
    local db = Toolbar.InitDB().performanceBar
    local defaults = Toolbar.defaults.performanceBar
    for key, value in pairs(defaults) do db[key] = value end
    Toolbar.ResetMover("performanceBar")
    PerformanceBar.Refresh()
end
local driver = CreateFrame("Frame")
driver:RegisterEvent("PLAYER_LOGIN")
driver:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    PerformanceBar.Refresh()
end)
