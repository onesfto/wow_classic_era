import re
import os

media_file = "/Applications/World of Warcraft/_classic_era_/Interface/AddOns/Leatrix_Plus/Leatrix_Plus_Media.lua"
sounds_music_file = "/Applications/World of Warcraft/_classic_era_/Interface/AddOns/Leatrix_Sounds/Leatrix_Sounds_Music.lua"
sounds_effects_file = "/Applications/World of Warcraft/_classic_era_/Interface/AddOns/Leatrix_Sounds/Leatrix_Sounds_Effects.lua"
output_file = "/Applications/World of Warcraft/_classic_era_/Interface/AddOns/InnGramophone/BuiltinTracks.lua"

path_to_id = {}

def parse_sounds_file(filepath):
    if not os.path.exists(filepath): return
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()
    matches = re.findall(r'"([^"#]+)#(\d+)"', content)
    for path, file_id in matches:
        path_to_id[path.lower()] = int(file_id)

parse_sounds_file(sounds_music_file)
parse_sounds_file(sounds_effects_file)

with open(media_file, "r", encoding="utf-8") as f:
    content = f.read()

translations = {
    'L["Zones"]': "区域背景音乐",
    'L["Dungeons"]': "副本背景音乐",
    'L["Various"]': "更多音频",
    'L["Random"]': "随机乐单",
    'L["Search"]': "搜索",
    'L["Movies"]': "过场动画",
    
    'L["Eastern Kingdoms"]': "东部王国",
    'L["Kalimdor"]': "卡利姆多",
    'L["World of Warcraft"]': "魔兽世界",
    
    'L["Alterac Mountains"]': "奥特兰克山脉",
    'L["Arathi Highlands"]': "阿拉希高地",
    'L["Badlands"]': "荒芜之地",
    'L["Blasted Lands"]': "诅咒之地",
    'L["Burning Steppes"]': "燃烧平原",
    'L["Deadwind Pass"]': "逆风小径",
    'L["Dun Morogh"]': "丹莫罗",
    'L["Duskwood"]': "暮色森林",
    'L["Eastern Plaguelands"]': "东瘟疫之地",
    'L["Elwynn Forest"]': "艾尔文森林",
    'L["Hillsbrad Foothills"]': "希尔斯布莱德丘陵",
    'L["Hinterlands"]': "辛特兰",
    'L["Loch Modan"]': "洛克莫丹",
    'L["Redridge Mountains"]': "赤脊山",
    'L["Searing Gorge"]': "灼热峡谷",
    'L["Silverpine Forest"]': "银松森林",
    'L["Stranglethorn Vale"]': "荆棘谷",
    'L["Swamp of Sorrows"]': "悲伤沼泽",
    'L["Tirisfal Glades"]': "提瑞斯法林地",
    'L["Western Plaguelands"]': "西瘟疫之地",
    'L["Westfall"]': "西部荒野",
    'L["Wetlands"]': "湿地",
    
    'L["Ashenvale"]': "灰谷",
    'L["Azshara"]': "艾萨拉",
    'L["Darkshore"]': "黑海岸",
    'L["Desolace"]': "凄凉之地",
    'L["Durotar"]': "杜隆塔尔",
    'L["Dustwallow Marsh"]': "尘泥沼泽",
    'L["Felwood"]': "费伍德森林",
    'L["Feralas"]': "菲拉斯",
    'L["Moonglade"]': "月光林地",
    'L["Mulgore"]': "莫高雷",
    'L["Silithus"]': "希利苏斯",
    'L["Stonetalon Mountains"]': "石爪山脉",
    'L["Tanaris"]': "塔纳利斯",
    'L["Teldrassil"]': "泰达希尔",
    'L["The Barrens"]': "贫瘠之地",
    'L["Thousand Needles"]': "千针石林",
    'L["Un\'Goro Crater"]': "安戈洛环形山",
    'L["Winterspring"]': "冬泉谷",
    
    'L["Blackfathom Deeps"]': "黑暗深渊",
    'L["Blackrock Depths"]': "黑石深渊",
    'L["Blackwing Lair"]': "黑翼之巢",
    'L["Deadmines"]': "死亡矿井",
    'L["Dire Maul"]': "厄运之槌",
    'L["Gnomeregan"]': "诺莫瑞根",
    'L["Maraudon"]': "玛拉顿",
    'L["Molten Core"]': "熔火之心",
    'L["Naxxramas"]': "纳克萨玛斯",
    'L["Onyxia\'s Lair"]': "奥妮克希亚的巢穴",
    'L["Razorfen Downs"]': "剃刀高地",
    'L["Razorfen Kraul"]': "剃刀沼泽",
    'L["Scarlet Monastery"]': "血色修道院",
    'L["Scholomance"]': "通灵学院",
    'L["Shadowfang Keep"]': "影牙城堡",
    'L["Stratholme"]': "斯坦索姆",
    'L["Sunken Temple"]': "沉没的神庙",
    'L["Uldaman"]': "奥达曼",
    'L["Wailing Caverns"]': "哀嚎洞穴",
    'L["Zul\'Farrak"]': "祖尔法拉克",
    'L["Zul\'Gurub"]': "祖尔格拉布",
    'L["Ahn\'Qiraj"]': "安其拉",
    
    'L["Alliance"]': "联盟",
    'L["Horde"]': "部落",
    'L["Neutral"]': "中立",
    'L["Scourge"]': "天灾军团",
    'L["Events"]': "节日事件",
    'L["Darnassus"]': "达纳苏斯",
    'L["Ironforge"]': "铁炉堡",
    'L["Stormwind"]': "暴风城",
    'L["Orgrimmar"]': "奥格瑞玛",
    'L["Thunder Bluff"]': "雷霆崖",
    'L["Undercity"]': "幽暗城",
    'L["Booty Bay"]': "藏宝海湾",
    'L["Darkmoon Faire"]': "暗月马戏团",
    'L["Holiday Events"]': "节日事件",
    'L["Taverns"]': "旅店",
    'L["Zeppelins"]': "飞艇",
    'L["Credits"]': "有功人员",
    'L["Cinematics"]': "过场动画音频",
    'L["Main Titles"]': "版本主题曲",
    'L["Musical Moments"]': "音乐主题时刻",
    'L["Narration"]': "旁白",
    'L["Angelic"]': "神圣",
    'L["Battle"]': "战斗",
    'L["Gloomy"]': "忧郁",
    'L["Haunted"]': "闹鬼",
    'L["Magic"]': "魔法",
    'L["Mystery"]': "神秘",
    'L["Sacred"]': "神圣",
    'L["Spooky"]': "惊悚",
    'L["Swamp"]': "沼泽",
    'L["Battlegrounds"]': "战场",
    'L["Ragefire Chasm"]': "怒焰裂谷",
    'L["Stockade"]': "监狱",
    'L["Temple of Atal\'Hakkar"]': "阿塔哈卡神庙",
    'L["Ten Years of Warcraft"]': "魔兽世界十周年",
    'L["Cinematics Audio"]': "过场动画音频",
}

seen_paths = set()
out_lua = [
    "local _, LMP = ...",
    "",
    "local tracks = {"
]

title_counters = {}

# Fix regex to match across newlines

content_no_comments = re.sub(r'--.*', '', content)
matches = re.finditer(r'Zn\(([^,]+),\s*([^,]+),\s*([^,]+),\s*\{(.*?)\}\)', content_no_comments, re.DOTALL)


for match in matches:
    where = match.group(1).strip()
    cat = match.group(2).strip()
    zone = match.group(3).strip()
    tracks_str = match.group(4)
    
    where_zh = translations.get(where, re.sub(r'L\["([^"]+)"\]', r'\1', where)).strip('"\' ')
    zone_zh = translations.get(zone, re.sub(r'L\["([^"]+)"\]', r'\1', zone)).strip('"\' ')
    
    track_matches = re.findall(r'"([a-zA-Z0-9_/\ -]+\.(?:mp3|ogg))#([0-9]+)"', tracks_str)
    for path, duration in track_matches:
        clean_path = path.lower()
        
        if clean_path.startswith("cinematics/"):
            clean_path = "interface/" + clean_path
        elif clean_path.startswith("cinematicvoices/") or clean_path.startswith("ambience/") or clean_path.startswith("spells/"):
            clean_path = "sound/" + clean_path
        else:
            clean_path = "sound/music/" + clean_path
        
        file_id = path_to_id.get(clean_path)
        path_val = str(file_id) if file_id else f'"{clean_path}"'
        
        if clean_path not in seen_paths:
            seen_paths.add(clean_path)
        
        if zone_zh not in title_counters:
            title_counters[zone_zh] = 1
        else:
            title_counters[zone_zh] += 1
        
        title = f"{zone_zh} {title_counters[zone_zh]}"
        if "Tavern" in zone or "Taverns" in zone:
            title = f"旅店音乐 {title_counters[zone_zh]}"
        if "battle" in clean_path.lower():
            title = f"战斗时刻 {title_counters[zone_zh]}"
        if "spells" in clean_path.lower():
            title = f"法术音效 {title_counters[zone_zh]}"
            
        # Give special titles for some cinematic ones based on their path
        if "narration" in clean_path.lower():
            race = clean_path.split("/")[-1].replace("narration.mp3", "").capitalize()
            if race == "Dwarf": race = "矮人"
            if race == "Gnome": race = "侏儒"
            if race == "Human": race = "人类"
            if race == "Nightelf": race = "暗夜精灵"
            if race == "Orc": race = "兽人"
            if race == "Tauren": race = "牛头人"
            if race == "Troll": race = "巨魔"
            if race == "Undead": race = "亡灵"
            title = f"{race}旁白"
            
        out_lua.append(f'    {{"{title}", "魔兽世界原声", {path_val}, {duration}, "{where_zh}", "{zone_zh}"}},')


out_lua.extend([
    '    {"联盟旅店 1", "魔兽世界原声", 53737, 102, "更多音频", "旅店"},',
    '    {"联盟旅店 2", "魔兽世界原声", 53738, 97, "更多音频", "旅店"},',
    '    {"部落旅店 1", "魔兽世界原声", 53744, 134, "更多音频", "旅店"},',
    '    {"部落旅店 2", "魔兽世界原声", 53745, 114, "更多音频", "旅店"},',
    '    {"部落旅店 3", "魔兽世界原声", 53746, 126, "更多音频", "旅店"},',
    '    {"被遗忘者旅店", "魔兽世界原声", 53747, 92, "更多音频", "旅店"},'
])

out_lua.extend([
    "}",
    "",
    "for _, t in ipairs(tracks) do",
    "    LMP:AddTrack({",
    "        title = t[1],",
    "        artist = t[2],",
    "        path = t[3],",
    "        duration = t[4],",
    "        source = \"builtin\",",
    "        category1 = t[5],",
    "        category2 = t[6]",
    "    })",
    "end"
])

with open(output_file, "w", encoding="utf-8") as f:
    f.write("\n".join(out_lua) + "\n")

print(f"Generated {len(seen_paths)} unique tracks.")
