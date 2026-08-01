local _, addonTable = ...
local GW = _G.GW2_ADDON
if not GW then return end
local function LoadSocial()
    if not GW.LoadSocialFrame then return end
    GW.LoadSocialFrame()
end
local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    LoadSocial()
end)
if IsLoggedIn and IsLoggedIn() then
    f:UnregisterEvent("PLAYER_LOGIN")
    LoadSocial()
end
addonTable.LoadSocial = LoadSocial
