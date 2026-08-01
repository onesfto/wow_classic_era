import re, os

FILE = '/Applications/World of Warcraft/_classic_era_/wa_manager/药剂组_Profile.lua'

with open(FILE, 'r', encoding='utf-8') as f:
    text = f.read()

def replacer(match):
    block = match.group(0)
    # 只有当包含 "SecureActionButtonTemplate" 时才修改
    if "SecureActionButtonTemplate" not in block:
        return block
    
    # 构建新的 init 动作
    new_init = r'''["init"] = {
["custom"] = "local e = aura_env\nif not e.btnCreated then\n    local region = WeakAuras.GetRegion(e.id)\n    if region then\n        local btnName = e.id..\"Button\"\n        local btn = _G[btnName] or CreateFrame(\"Button\", btnName, region, \"SecureActionButtonTemplate\")\n        btn:SetAllPoints(region)\n        btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")\n        btn:SetAttribute(\"type1\", \"macro\")\n        btn:SetAttribute(\"type2\", \"macro\")\n        btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)\n        btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)\n        btn:SetScript(\"OnEnter\", function(self)\n            GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")\n            GameTooltip:SetText(\"|r\"..e.id..\"\\n\", 0, 1, 0, 1, 1)\n        end)\n        btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\n        e.btnCreated = true\n    end\nend",
["do_custom"] = true,
},'''
    
    new_start = r'''["start"] = {
["custom"] = "",
["do_custom"] = false,
},'''

    new_finish = r'''["finish"] = {
["custom"] = "",
["do_custom"] = false,
},'''

    # 使用正则替换 block 内对应的字段
    # 为了防止正则跨越边界，我们将各部分独立替换
    block = re.sub(r'\["init"\]\s*=\s*\{.*?\n\},', new_init, block, flags=re.DOTALL)
    block = re.sub(r'\["start"\]\s*=\s*\{.*?\n\},', new_start, block, flags=re.DOTALL)
    block = re.sub(r'\["finish"\]\s*=\s*\{.*?\n\},', new_finish, block, flags=re.DOTALL)
    
    return block

# 匹配完整的 ["actions"] = { ... } 区块
# 注意：actions 内没有嵌套深层花括号的可能，一般只有 start, finish, init
# 但为了安全，我们用非贪婪匹配到下一个 \n}, 
# 不过 actions 的结束是 \n}, 所以要小心
pattern = r'\["actions"\]\s*=\s*\{(?:[^{}]*\{[^{}]*\}[^{}]*)*\}'

new_text, count = re.subn(pattern, replacer, text)

print(f"处理了 {count} 个 actions 块。")
with open(FILE, 'w', encoding='utf-8') as f:
    f.write(new_text)
