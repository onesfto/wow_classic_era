local combat = false
local popupName
local eventFrame

local function NewAuraFrame()
    return {
        shown = true,
        SetShown = function(self, shown) self.shown = shown end,
    }
end

GW2_UI_PLUS_SV = nil
GW2_ADDON = {
    settings = {PLAYER_BUFFS_ENABLED = true},
}
GW2UIPlayerBuffs = NewAuraFrame()
GW2UIPlayerDebuffs = NewAuraFrame()

function InCombatLockdown() return combat end
function StaticPopup_Show(name) popupName = name end
C_Timer = {
    After = function(_, callback) callback() end,
}

function CreateFrame()
    eventFrame = {events = {}, scripts = {}}
    function eventFrame:RegisterEvent(event) self.events[event] = true end
    function eventFrame:UnregisterEvent(event) self.events[event] = nil end
    function eventFrame:SetScript(script, handler)
        self.scripts[script] = handler
    end
    return eventFrame
end

local addonTable = {}
assert(loadfile("MainMenu/PlayerAuras.lua"))(
    "GW2_UI_PLUS", addonTable)
local Auras = assert(addonTable.PlusPlayerAuras)

local db = Auras.InitDB()
assert(db.playerBuffAurasEnabled == true,
    "增益光环开关首次应继承 GW2 总开关")
assert(db.playerDebuffAurasEnabled == true,
    "减益光环开关首次应继承 GW2 总开关")

Auras.SetEnabled("buff", false)
assert(GW2UIPlayerBuffs.shown == false,
    "关闭增益光环应隐藏增益框")
assert(GW2UIPlayerDebuffs.shown == true,
    "关闭增益光环不能影响减益框")

combat = true
Auras.SetEnabled("debuff", false)
assert(GW2UIPlayerDebuffs.shown == true,
    "战斗中不能立即隐藏受保护的减益框")
assert(eventFrame.events.PLAYER_REGEN_ENABLED == true,
    "战斗中修改应等待脱战")

combat = false
eventFrame.scripts.OnEvent(eventFrame, "PLAYER_REGEN_ENABLED")
assert(GW2UIPlayerBuffs.shown == false,
    "脱战后应保持增益光环保存状态")
assert(GW2UIPlayerDebuffs.shown == false,
    "脱战后应应用减益光环保存状态")
assert(eventFrame.events.PLAYER_REGEN_ENABLED == nil,
    "应用完成后应取消脱战事件")

GW2_UI_PLUS_SV.playerBuffAurasEnabled = false
GW2_ADDON.settings.PLAYER_BUFFS_ENABLED = false
popupName = nil
Auras.SetEnabled("buff", true)
assert(GW2_ADDON.settings.PLAYER_BUFFS_ENABLED == true,
    "开启任一光环时应启用 GW2 底层光环系统")
assert(popupName == "GW2_UI_PLUS_RELOAD",
    "启用底层光环系统时应提示重载")

print("PlayerAuras_test: OK")
