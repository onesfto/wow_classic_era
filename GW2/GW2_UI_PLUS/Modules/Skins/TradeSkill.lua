local _, addonTable = ...
local GW = _G.GW2_ADDON
if not GW then return end
local Utils = addonTable.TradeSkillSkinUtils
local Layout = addonTable.TradeSkillSkinLayout
local Skin = addonTable.TradeSkillSkin
if not Utils or not Layout or not Skin then
    print("GW2_UI_PLUS TradeSkill: 缺少依赖模块")
    return
end
local function LoadTradeSkillFrameSkin()
    if GW2_UI_PLUS_SV and GW2_UI_PLUS_SV.TRADESKILL_SKIN_ENABLED == false then return end
    local f = CreateFrame("Frame")
    f:RegisterEvent("ADDON_LOADED")
    f:SetScript("OnEvent", function(_, _, addon)
        if addon == "Blizzard_TradeSkillUI" then
            Skin.SkinTradeSkillFrame()
        elseif addon == "Blizzard_CraftUI" then
            Skin.SkinCraftFrame()
        end
    end)
    local isAddOnLoaded = C_AddOns and C_AddOns.IsAddOnLoaded or IsAddOnLoaded
    if isAddOnLoaded and isAddOnLoaded("Blizzard_TradeSkillUI") then
        Skin.SkinTradeSkillFrame()
    end
    if isAddOnLoaded and isAddOnLoaded("Blizzard_CraftUI") then
        Skin.SkinCraftFrame()
    end
end
addonTable.LoadTradeSkillFrameSkin = LoadTradeSkillFrameSkin
local loader = CreateFrame("Frame")
loader:RegisterEvent("PLAYER_ENTERING_WORLD")
loader:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    LoadTradeSkillFrameSkin()
end)
