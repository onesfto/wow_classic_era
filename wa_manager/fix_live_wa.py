import os
import re
import shutil

FILE = '/Applications/World of Warcraft/_classic_era_/WTF/Account/216385191#2/SavedVariables/WeakAuras.lua'

# 1. 备份原文件
backup_path = FILE + ".bak_pre_fix"
if not os.path.exists(backup_path):
    shutil.copy2(FILE, backup_path)
    print(f"已备份原文件至 {backup_path}")

with open(FILE, 'r', encoding='utf-8', errors='replace') as f:
    raw = f.read()

DK = '["displays"] = {'
dk_pos = raw.index(DK)

header = raw[:dk_pos + len(DK)]
pos = dk_pos + len(DK)
total = len(raw)

def skip_ws(s, p):
    while p < len(s) and s[p] in ' \t\r\n': p += 1
    return p

def find_block_end(s, p):
    d = 1; p += 1
    while p < len(s) and d > 0:
        c = s[p]
        if c == '{': d += 1; p += 1
        elif c == '}': d -= 1; p += 1
        elif c == '"':
            p += 1
            while p < len(s):
                if s[p] == '\\': p += 2; continue
                if s[p] == '"': p += 1; break
                p += 1
        else: p += 1
    return p

def parse_key(s, p):
    p += 1
    if p >= len(s): return None, p
    if s[p] == '"':
        p += 1; name = ''
        while p < len(s) and s[p] != '"':
            if s[p] == '\\': p += 1; name += s[p] if p < len(s) else ''
            else: name += s[p]
            p += 1
        return name, p + 2
    else:
        while p < len(s) and s[p] != ']': p += 1
        return None, p + 1

blocks = {}
block_order = []

while pos < total:
    p_pre = pos
    pos = skip_ws(raw, pos)
    if pos >= total or raw[pos] == '}': 
        footer = raw[p_pre:]  # 把前面的空白也带着，保持缩进完美
        break
    if raw[pos] != '[':
        while pos < total and raw[pos] != '\n': pos += 1
        continue

    key, next_pos = parse_key(raw, pos)
    p2 = skip_ws(raw, next_pos)
    if p2 < total and raw[p2] == '=': p2 += 1
    p2 = skip_ws(raw, p2)
    if p2 >= total or raw[p2] != '{':
        pos = next_pos
        continue

    bstart = p2
    bend = find_block_end(raw, p2)
    if key:
        blocks[key] = raw[bstart:bend]
        block_order.append(key)
    pos = bend
    while pos < total and raw[pos] in ',\r\n ': pos += 1

def top_str(bt, key):
    needle = f'["{key}"] = "'
    p, d = 1, 1
    while p < len(bt):
        if d == 1 and bt.startswith(needle, p):
            p += len(needle); v = ''
            while p < len(bt) and bt[p] != '"':
                if bt[p] == '\\': p += 1; v += bt[p] if p < len(bt) else ''
                else: v += bt[p]
                p += 1
            return v or None
        c = bt[p]
        if c == '{': d += 1; p += 1
        elif c == '}':
            d -= 1
            if d < 1: break
            p += 1
        elif c == '"':
            p += 1
            while p < len(bt):
                if bt[p] == '\\': p += 2; continue
                if bt[p] == '"': p += 1; break
                p += 1
        else: p += 1
    return None

def get_children(bt):
    ci = bt.find('["controlledChildren"] = {')
    if ci == -1: return []
    p = ci + len('["controlledChildren"] = {')
    children = []
    while p < len(bt):
        while p < len(bt) and bt[p] in ' \t\r\n': p += 1
        if p >= len(bt) or bt[p] == '}': break
        if bt[p] == '"':
            p += 1; cn = ''
            while p < len(bt) and bt[p] != '"':
                if bt[p] == '\\': p += 1; cn += bt[p] if p < len(bt) else ''
                else: cn += bt[p]
                p += 1
            p += 1; children.append(cn)
            while p < len(bt) and bt[p] in ',\r\n ': p += 1
        else: p += 1
    return children

# 递归找到所有子孙
def collect_descendants(key, visited=None):
    if visited is None: visited = set()
    if key in visited or key not in blocks: return visited
    visited.add(key)
    bt = blocks[key]
    children = get_children(bt)
    for ch in children:
        collect_descendants(ch, visited)
    return visited

target = '药剂组'
all_keys = collect_descendants(target)

changed = True
while changed:
    changed = False
    for k, bt in blocks.items():
        if k not in all_keys:
            p = top_str(bt, 'parent')
            if p and p in all_keys:
                all_keys.add(k)
                changed = True

def replacer(match):
    block = match.group(0)
    
    new_start = r'''["start"] = {
["custom"] = "local e = aura_env\nif not InCombatLockdown() then\n    if not _G[e.id..\"Button\"] then\n        local region = e.region or WeakAuras.GetRegion(e.id)\n        if region then\n            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")\n            btn:RegisterForClicks(\"AnyUp\", \"AnyDown\")\n            btn:SetAttribute(\"type1\", \"macro\")\n            btn:SetAttribute(\"type2\", \"macro\")\n            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)\n            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)\n            btn:SetScript(\"OnEnter\", function(self)\n                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")\n                GameTooltip:SetText(\"|r\"..e.id..\"\\n\", 0, 1, 0, 1, 1)\n            end)\n            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\n        end\n    end\n    local btn = _G[e.id..\"Button\"]\n    if btn then\n        if e.region then\n            btn:ClearAllPoints()\n            btn:SetAllPoints(e.region)\n        end\n        btn:Show()\n    end\nend",
["do_custom"] = true,
},'''

    new_finish = r'''["finish"] = {
["custom"] = "local e = aura_env\nif not InCombatLockdown() then\n    local btn = _G[e.id..\"Button\"]\n    if btn then\n        btn:Hide()\n    end\nend",
["do_custom"] = true,
},'''

    new_init = r'''["init"] = {
["custom"] = "",
["do_custom"] = false,
},'''

    b = re.sub(r'\["init"\]\s*=\s*\{.*?\n\},', new_init, block, flags=re.DOTALL)
    b = re.sub(r'\["start"\]\s*=\s*\{.*?\n\},', new_start, b, flags=re.DOTALL)
    b = re.sub(r'\["finish"\]\s*=\s*\{.*?\n\},', new_finish, b, flags=re.DOTALL)
    
    return b

count = 0
pattern = r'\["actions"\]\s*=\s*\{(?:[^{}]*\{[^{}]*\}[^{}]*)*\}'

for key in all_keys:
    bt = blocks[key]
    if "SecureActionButtonTemplate" in bt:
        new_bt, sub_c = re.subn(pattern, replacer, bt)
        if sub_c > 0:
            blocks[key] = new_bt
            count += 1

print(f"在 {len(all_keys)} 个药剂组光环中，成功修正了 {count} 个包含安全宏按钮的光环！")

# 重新生成文件
parts = [header, '\n']
for key in block_order:
    safe_key = key.replace('\\','\\\\').replace('"','\\"')
    parts.append(f'\t\t["{safe_key}"] = {blocks[key]},\n')
parts.append(footer)

import tempfile
fd, temp_path = tempfile.mkstemp()
with os.fdopen(fd, 'w', encoding='utf-8') as f:
    f.write("".join(parts))

shutil.move(temp_path, FILE)
print("SavedVariables/WeakAuras.lua 文件保存成功！")
