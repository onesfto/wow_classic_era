-- NovaWorldBuffs 简体中文补充翻译 for GW2 UI Plus
-- 补齐 NWB 官方 zhCN 缺失、导致界面回退英文的界面文本。
-- 通过 AceLocale-3.0 追加翻译键，不修改原插件任何代码。
-- 用 PLAYER_LOGIN 延迟注册：此时 NWB 已加载、AceLocale 已就绪，且与加载顺序无关。

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self)
    self:UnregisterEvent("PLAYER_LOGIN")

    local AceLocale = LibStub and LibStub("AceLocale-3.0", true)
    if not AceLocale then return end -- 未安装 NWB / 无 AceLocale

    local L = AceLocale:NewLocale("NovaWorldBuffs", "zhCN")
    if not L then return end -- 非简体中文客户端

    -- 位面信息里的活跃时长： "(Active 4天9小时)" → "(活跃 4天9小时)"
    L["Active"] = "活跃"
    -- 世界 Buff 掉落说明： "This drop doesn't trigger a cooldown"
    L["buffHasNoCooldown"] = "此掉落不触发冷却"
    -- 切换日志窗口的复选框
    L["Show Quest Handins Only"] = "仅显示交任务"
    -- 世界 Buff 窗口的滑块标题
    L["Min Level"] = "最低等级"
end)
