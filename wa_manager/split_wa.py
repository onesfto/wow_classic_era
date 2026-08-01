import os
import sys

SRC = '/Applications/World of Warcraft/_classic_era_/wa_manager/WeakAuras.lua'
OUT_DIR = '/Applications/World of Warcraft/_classic_era_/wa_manager/splits'

os.makedirs(OUT_DIR, exist_ok=True)

# ── 1. 读取原文件 ──────────────────────────────────────────────
with open(SRC, 'r', encoding='utf-8', errors='replace') as f:
    raw = f.read()

DK = '["displays"] = {'
try:
    dk_pos = raw.index(DK)
except ValueError:
    print("未找到 displays 区段")
    sys.exit(1)

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

while pos < total:
    pos = skip_ws(raw, pos)
    if pos >= total or raw[pos] == '}': break
    if raw[pos] != '[':
        while pos < total and raw[pos] != '\n': pos += 1
        continue

    key, pos = parse_key(raw, pos)
    pos = skip_ws(raw, pos)
    if pos < total and raw[pos] == '=': pos += 1
    pos = skip_ws(raw, pos)
    if pos >= total or raw[pos] != '{':
        while pos < total and raw[pos] != '\n': pos += 1
        continue

    bstart = pos
    bend = find_block_end(raw, pos)
    if key:
        blocks[key] = raw[bstart:bend]
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

# ── 2. 找到所有根节点 ──────────────────────────────────────────
# 收集每个节点的 parent
parents = {}
for k, bt in blocks.items():
    parents[k] = top_str(bt, 'parent')

root_nodes = [k for k, p in parents.items() if not p or p not in blocks]
print(f'找到 {len(root_nodes)} 个根节点: {", ".join(root_nodes)}\n')

# ── 3. 递归收集子孙并导出文件 ──────────────────────────────────
def collect_descendants(key, visited=None):
    if visited is None: visited = set()
    if key in visited or key not in blocks: return visited
    visited.add(key)
    bt = blocks[key]
    children = get_children(bt)
    for ch in children:
        collect_descendants(ch, visited)
    return visited

for root in root_nodes:
    all_keys = collect_descendants(root)
    # 补充 parent 指向这些 key 的节点
    changed = True
    while changed:
        changed = False
        for k, bt in blocks.items():
            if k not in all_keys:
                p = parents.get(k)
                if p and p in all_keys:
                    all_keys.add(k)
                    changed = True
    
    parts = [header, '\r\n']
    for key in all_keys:
        safe_key = key.replace('\\','\\\\').replace('"','\\"')
        parts.append(f'["{safe_key}"] = {blocks[key]},\r\n')
    parts.append('},\r\n}\r\n')
    
    safe_name = root.replace('/', '_').replace(':', '_')
    dst = os.path.join(OUT_DIR, f'{safe_name}_Profile.lua')
    with open(dst, 'w', encoding='utf-8') as f:
        f.write(''.join(parts))
    
    sz = os.path.getsize(dst)
    print(f'✅ [{root}] 包含 {len(all_keys):>3} 条 -> {safe_name}_Profile.lua ({sz/1024:.1f} KB)')

print(f'\n🎉 已将 WeakAuras.lua 按根节点分割完成，保存在 {OUT_DIR} 目录下。')
