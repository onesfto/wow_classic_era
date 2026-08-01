local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")
    local AceLocale = LibStub and LibStub("AceLocale-3.0", true)
    if not AceLocale then return end
    local L = AceLocale:NewLocale("NovaWorldBuffs", "zhCN")
    if not L then return end
    L["Active"] = "活跃"
    L["buffHasNoCooldown"] = "此掉落不触发冷却"
    L["Show Quest Handins Only"] = "仅显示交任务"
    L["Min Level"] = "最低等级"
end)
