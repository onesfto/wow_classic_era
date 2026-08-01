import re, os

FILE = '/Applications/World of Warcraft/_classic_era_/wa_manager/药剂组_Profile.lua'

with open(FILE, 'r', encoding='utf-8') as f:
    text = f.read()

def replacer(match):
    block = match.group(0)
    # We only target blocks that we previously modified to use btnCreated in init
    if "e.btnCreated" not in block:
        return block
    
    # New start action: safely create and show out of combat
    new_start = r'''["start"] = {
["custom"] = "local e = aura_env\nif not InCombatLockdown() then\n    if not _G[e.id..\"Button\"] then\n        local region = WeakAuras.GetRegion(e.id)\n        if region then\n            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")\n            btn:SetAllPoints(region)\n            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")\n            btn:SetAttribute(\"type1\", \"macro\")\n            btn:SetAttribute(\"type2\", \"macro\")\n            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)\n            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)\n            btn:SetScript(\"OnEnter\", function(self)\n                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")\n                GameTooltip:SetText(\"|r\"..e.id..\"\\n\", 0, 1, 0, 1, 1)\n            end)\n            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\n        end\n    end\n    local btn = _G[e.id..\"Button\"]\n    if btn then\n        btn:Show()\n    end\nend",
["do_custom"] = true,
},'''

    # New finish action: safely hide out of combat
    new_finish = r'''["finish"] = {
["custom"] = "local e = aura_env\nif not InCombatLockdown() then\n    local btn = _G[e.id..\"Button\"]\n    if btn then\n        btn:Hide()\n    end\nend",
["do_custom"] = true,
},'''

    # Clear init
    new_init = r'''["init"] = {
["custom"] = "",
["do_custom"] = false,
},'''

    block = re.sub(r'\["init"\]\s*=\s*\{.*?\n\},', new_init, block, flags=re.DOTALL)
    block = re.sub(r'\["start"\]\s*=\s*\{.*?\n\},', new_start, block, flags=re.DOTALL)
    block = re.sub(r'\["finish"\]\s*=\s*\{.*?\n\},', new_finish, block, flags=re.DOTALL)
    
    return block

pattern = r'\["actions"\]\s*=\s*\{(?:[^{}]*\{[^{}]*\}[^{}]*)*\}'
new_text, count = re.subn(pattern, replacer, text)

print(f"恢复并修复了 {count} 个 actions 块。")
with open(FILE, 'w', encoding='utf-8') as f:
    f.write(new_text)
