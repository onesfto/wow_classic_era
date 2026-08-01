local _, addonTable = ...
local GW = _G.GW2_ADDON
if not GW then return end
local AB = addonTable.PlusActionBar
if not AB then
    print("GW2_UI_PLUS ActionBar: 缺少 Core 模块")
    return
end
local function SafeRun(label, func)
    local ok, err = pcall(func)
    if not ok then
        DEFAULT_CHAT_FRAME:AddMessage("|cffff0000GW2_UI_PLUS ActionBar [" .. label .. "] 错误: " .. tostring(err) .. "|r")
    end
end
local function Init()
    AB.InitDB()
    AB.SyncPlayerHudEnabled()
    SafeRun("主动作条编辑框", AB.RegisterMainBarMover)
    SafeRun("按钮尺寸", function()
        if GW.UpdateMainBarHot and not GW.UpdateMainBarHot_GW2Plus then
            local orig = GW.UpdateMainBarHot
            GW.UpdateMainBarHot = function(...)
                orig(...)
                AB.ApplyMainBarLayout()
            end
            GW.UpdateMainBarHot_GW2Plus = true
        end
        AB.ApplyGlobeScale()
        AB.ApplyMainBarLayout()
        AB.ApplyMultiBarSizes()
        AB.ApplyCastbarSize()
    end)
    if addonTable.PlusActionBarLayout then
        SafeRun("动作条布局", addonTable.PlusActionBarLayout.Init)
    end
    SafeRun("普通玩家框体", AB.EnsureNormalPlayerFrame)
    if addonTable.PlusEquipmentDebounce then
        SafeRun("换装刷新防抖", function()
            if not addonTable.PlusEquipmentDebounce.Init() then
                local Notice = GW.Notice or function(msg) DEFAULT_CHAT_FRAME:AddMessage(msg) end
                Notice("|cffffaa00GW2_UI_PLUS 动作条：未找到 GW2_UI 换装事件框体，防抖未启用。|r")
            end
        end)
    end
    SafeRun("法师动作条", function()
        if addonTable.PlusMageBar then
            addonTable.PlusMageBar.Init()
        end
    end)
    SafeRun("渐隐效果", function()
        if addonTable.PlusFader then
            addonTable.PlusFader.Init()
        end
    end)
    AB.InitMoverOptions()
end
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_ENTERING_WORLD" then
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
        Init()
    end
end)
