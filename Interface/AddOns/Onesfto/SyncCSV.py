import csv
import re
import os

csv_file = 'BetterBagsItems.csv'
lua_file = 'Modules/BetterBags.lua'

if not os.path.exists(csv_file):
    print(f"Error: {csv_file} not found.")
    exit(1)

categories = {}
with open(csv_file, 'r', encoding='utf-8') as f:
    reader = csv.DictReader(f)
    for row in reader:
        cat = row['Category']
        if cat not in categories:
            categories[cat] = []
        categories[cat].append((row['ItemID'], row['ItemName']))

def generate_lua_table(table_name, cat_name):
    if cat_name not in categories:
        return f"    local {table_name} = {{}}\n"
    
    lua_str = f"    local {table_name} = {{\n"
    items = sorted(categories[cat_name], key=lambda x: int(x[0]))
    for item_id, item_name in items:
        comment = f" -- {item_name}" if item_name else ""
        lua_str += f"        [{item_id}] = true,{comment}\n"
    lua_str += "    }\n"
    return lua_str

table_mappings = {
    "B_Ore_IDs": "B-矿",
    "B_Cloth_IDs": "B-布",
    "B_Leather_IDs": "B-皮",
    "B_Herb_IDs": "B-草",
    "B_Fish_IDs": "B-鱼",
    "T3_Items": "T3",
    "T25_Items": "T2.5",
    "T2_Items": "T2",
    "Caster_Gear_IDs": "装备-法系",
    "Caster_Jewelry_IDs": "首饰-法系",
    "Healer_Gear_IDs": "装备-治疗",
    "Healer_Jewelry_IDs": "首饰-治疗"
}

with open(lua_file, 'r', encoding='utf-8') as f:
    content = f.read()

for tbl, cat in table_mappings.items():
    new_table = generate_lua_table(tbl, cat)
    content = re.sub(r'local\s+' + tbl + r'\s*=\s*\{.*?\n\s*\}', new_table.strip(), content, flags=re.DOTALL)

with open(lua_file, 'w', encoding='utf-8') as f:
    f.write(content)

print("Successfully synced CSV data to BetterBags.lua!")
