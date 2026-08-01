
WeakAurasSaved = {
["editor_tab_spaces"] = 4,
["login_squelch_time"] = 10,
["PULL(Need DBM BW ERT)PULL"] = 5,
["dbVersion"] = 90,
["标记目标 Mark TargetSet"] = false,
["displays"] = {
["挫志咆哮"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["parent"] = "Core - Druid",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["unit"] = "target",
["unitExists"] = true,
["spellIds"] = {
},
["type"] = "aura2",
["names"] = {
},
["subeventPrefix"] = "SPELL",
["auranames"] = {
"99",
},
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"5487",
"9634",
},
["unit"] = "player",
["ownOnly"] = true,
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 99,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["source"] = "import",
["progressSource"] = {
-1,
"",
},
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["adjustedMax"] = "",
["cooldown"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["authorOptions"] = {
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["xOffset"] = 0,
["uid"] = "cpGxNsyXSqb",
["anchorFrameParent"] = false,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.8",
["tocversion"] = 11500,
["id"] = "挫志咆哮",
["zoom"] = 0.3,
["frameStrata"] = 1,
["width"] = 48,
["alpha"] = 1,
["config"] = {
},
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = "<",
["variable"] = "buffed",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 1,
["op"] = "<",
["variable"] = "buffed",
["value"] = 0,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = {
1,
1,
1,
0.5,
},
["property"] = "color",
},
},
},
{
["check"] = {
["trigger"] = 1,
["op"] = ">",
["variable"] = "buffed",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["color"] = {
1,
1,
1,
1,
},
},
["自然之赐（平衡）音效"] = {
["iconSource"] = -1,
["parent"] = "【露露】德鲁伊（BUFF）",
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["use_debuffClass"] = false,
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["useExactSpellId"] = false,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["auranames"] = {
"16886",
},
["unit"] = "player",
["auraspellids"] = {
"16886",
},
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["preset"] = "slidebottom",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desaturate"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = true,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorYOffset"] = 0,
["type"] = "subtext",
["anchorXOffset"] = 0,
["text_color"] = {
1,
0.97254901960784,
0.050980392156863,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 15,
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_text_format_p_time_mod_rate"] = true,
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "急速",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 1,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowXOffset"] = 0,
["glowType"] = "Pixel",
["glowLength"] = 5,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glowScale"] = 1,
["glow"] = false,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
[8] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = false,
["use_itemequiped"] = false,
["class"] = {
["single"] = "DRUID",
["multi"] = {
["HUNTER"] = true,
["WARLOCK"] = true,
["PALADIN"] = true,
["DRUID"] = true,
["SHAMAN"] = true,
["PRIEST"] = true,
},
},
["spellknown"] = 16886,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["xOffset"] = 0,
["actions"] = {
["start"] = {
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】急速.ogg",
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!Wind-OnePlusLight.ogg",
["do_sound"] = false,
},
["init"] = {
},
["finish"] = {
},
},
["cooldown"] = true,
["displayIcon"] = 135829,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["uid"] = "0)Vd5IWCrkt",
["url"] = "https://space.bilibili.com/455259",
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["color"] = {
1,
1,
1,
1,
},
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["tocversion"] = 20501,
["id"] = "自然之赐（平衡）音效",
["useCooldownModRate"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["selfPoint"] = "CENTER",
["config"] = {
},
["inverse"] = false,
["adjustedMax"] = "",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["authorOptions"] = {
},
},
["斜掠"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = true,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["useName"] = true,
["spellIds"] = {
},
["auranames"] = {
"1822",
},
["ownOnly"] = true,
["unit"] = "target",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"768",
},
["unit"] = "player",
["ownOnly"] = true,
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["spellknown"] = 1822,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "Core - Druid",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["uid"] = "t9XXcGKFB8e",
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "斜掠",
["semver"] = "2.0.8",
["useCooldownModRate"] = true,
["width"] = 48,
["zoom"] = 0.3,
["config"] = {
},
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 1,
},
{
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
},
{
["value"] = "0",
["op"] = "==",
["variable"] = "matchCount",
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = {
1,
1,
1,
0.5,
},
["property"] = "color",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
},
["猫德变身次数（by Jixel，支持简中，露露修改自用）"] = {
["outline"] = "OUTLINE",
["iconSource"] = -1,
["authorOptions"] = {
},
["displayText"] = "%c",
["customText"] = "function()\n    return cat_cost, cat_mana;\nend",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "\n\n",
["do_custom"] = false,
},
["finish"] = {
},
},
["cooldownSwipe"] = true,
["justify"] = "LEFT",
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["use_alwaystrue"] = true,
["duration"] = "1",
["names"] = {
},
["powertype"] = 0,
["use_unit"] = true,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
["unevent"] = "auto",
["type"] = "custom",
["custom_type"] = "event",
["subeventSuffix"] = "_CAST_START",
["power_operator"] = {
"<",
},
["subeventPrefix"] = "SPELL",
["event"] = "Power",
["customStacks"] = "function()\n    return math.floor(cat_mana/cat_cost);\nend",
["customDuration"] = "function()\n    return cat_mana, cat_cost, true\nend\n\n\n",
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player UNIT_POWER_FREQUENT:player",
["custom"] = "function()\n    cat_mana = UnitPower('player',0); \n    cat_cost = GetSpellPowerCost(768)[1].cost\n    return true\nend\n\n\n",
["spellIds"] = {
},
["check"] = "event",
["custom_hide"] = "custom",
["use_power"] = false,
["unit"] = "player",
},
["untrigger"] = {
["custom"] = "\n\n\n\n\n",
},
},
{
["trigger"] = {
["use_form"] = true,
["useName"] = true,
["auranames"] = {
"768",
},
["subeventSuffix"] = "_CAST_START",
["use_unit"] = true,
["duration"] = "1",
["event"] = "Stance/Form/Aura",
["names"] = {
},
["unit"] = "player",
["ownOnly"] = true,
["spellIds"] = {
},
["type"] = "aura2",
["form"] = {
["single"] = 3,
},
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = 1,
},
["selfPoint"] = "CENTER",
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["wordWrap"] = "WordWrap",
["preferToUpdate"] = false,
["cooldown"] = true,
["fixedWidth"] = 200,
["desc"] = "露露备注：项目引用自 Jixel，触发器已修改支持简中。\n英文原版：https://wago.io/tEf7cR1dG/\n转载请保留出处，请勿二次上传wago。",
["automaticWidth"] = "Auto",
["font"] = "Friz Quadrata TT",
["version"] = 2,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%s",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["anchor_point"] = "CENTER",
["text_fontSize"] = 24,
["anchorXOffset"] = 0,
["border_color"] = {
},
},
{
["text_text_format_p_time_precision"] = 1,
["text_text"] = "%p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_mod_rate"] = true,
["type"] = "subtext",
["anchorXOffset"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_legacy_floor"] = true,
["text_shadowYOffset"] = 0,
["text_shadowXOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "INNER_TOP",
["text_fontSize"] = 14,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_t_time_legacy_floor"] = true,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_t_time_format"] = 0,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_t_format"] = "timed",
["type"] = "subtext",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_t_time_mod_rate"] = true,
["text_shadowYOffset"] = 0,
["anchorXOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text"] = "%t",
["text_visible"] = false,
["anchor_point"] = "INNER_BOTTOM",
["text_fontSize"] = 14,
["text_text_format_t_time_dynamic_threshold"] = 60,
["text_text_format_t_time_precision"] = 1,
},
},
["height"] = 38,
["desaturate"] = false,
["load"] = {
["use_class"] = true,
["talent"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["zoneIds"] = "",
},
["uid"] = "TsT0g1kHcEo",
["useAdjustededMax"] = false,
["fontSize"] = 12,
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["width"] = 38,
["useCooldownModRate"] = true,
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = "<",
["variable"] = "stacks",
["value"] = "1",
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
{
["value"] = true,
["property"] = "sub.4.text_visible",
},
},
},
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["url"] = "https://space.bilibili.com/455259",
["xOffset"] = 0,
["auto"] = true,
["cooldownTextDisabled"] = true,
["alpha"] = 1,
["keepAspectRatio"] = false,
["zoom"] = 0.3,
["semver"] = "1.0.1",
["tocversion"] = 11302,
["id"] = "猫德变身次数（by Jixel，支持简中，露露修改自用）",
["adjustedMax"] = "",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["adjustedMin"] = "",
["config"] = {
},
["inverse"] = false,
["color"] = {
1,
1,
1,
1,
},
["displayIcon"] = 132115,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["parent"] = "德鲁伊 动态分组 左",
},
["Energy Bar - Druid"] = {
["overlays"] = {
{
0,
0,
0,
0.40000003576279,
},
},
["iconSource"] = -1,
["authorOptions"] = {
},
["preferToUpdate"] = false,
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["backgroundColor"] = {
0,
0,
0,
0.30000001192093,
},
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["selfPoint"] = "TOP",
["barColor"] = {
1,
0.78823529411765,
0.23921568627451,
1,
},
["desaturate"] = false,
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["use_class"] = true,
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
[3] = true,
},
},
["size"] = {
["multi"] = {
},
},
},
["toolTipArea"] = "ICON",
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["overlayclip"] = true,
["texture"] = "Solid",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["spark"] = false,
["tocversion"] = 11500,
["alpha"] = 1,
["uid"] = "0DvX1MKRUm)",
["sparkOffsetX"] = 0,
["wagoID"] = "Ner0rxotC",
["parent"] = "Resources - Druid",
["adjustedMin"] = "",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["duration"] = "1",
["unevent"] = "auto",
["unit"] = "player",
["use_absorbMode"] = true,
["use_showCost"] = false,
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
["powertype"] = 3,
["spellIds"] = {
},
["event"] = "Power",
["names"] = {
},
["subeventPrefix"] = "SPELL",
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"768",
},
["unit"] = "player",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = 1,
},
["configGroup"] = "energy_bar",
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["isPrimaryResource"] = true,
["version"] = 28,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_shadowXOffset"] = 1,
["text_text"] = "%p",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = true,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_format"] = "timed",
["anchorXOffset"] = 0,
["type"] = "subtext",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_format"] = 0,
["text_shadowYOffset"] = -1,
["text_text_format_1.percentpower_format"] = "none",
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["anchorYOffset"] = 0,
["text_visible"] = true,
["anchor_point"] = "INNER_CENTER",
["text_fontSize"] = 20,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_precision"] = 1,
},
},
["height"] = 20,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["source"] = "import",
["auto"] = true,
["barColor2"] = {
1,
1,
0,
1,
},
["icon_side"] = "RIGHT",
["xOffset"] = 0,
["sparkWidth"] = 10,
["sparkHeight"] = 30,
["sparkColor"] = {
1,
1,
1,
1,
},
["icon"] = false,
["config"] = {
},
["semver"] = "2.0.25",
["actions"] = {
["start"] = {
["do_message"] = false,
["custom"] = "",
["do_custom"] = false,
},
["init"] = {
["custom"] = "aura_env.region.configGroup = \"energy_bar\"",
["do_custom"] = true,
},
["finish"] = {
},
},
["sparkHidden"] = "NEVER",
["width"] = 405,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["id"] = "Energy Bar - Druid",
["zoom"] = 0,
["inverse"] = false,
["internalVersion"] = 90,
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
},
["Resources - Druid"] = {
["controlledChildren"] = {
"Combo Points - Druid",
"Mana Bar - Druid",
"Rage Bar - Druid",
"Energy Bar - Druid",
"Form Mana Bar - Druid",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["yOffset"] = 0,
["anchorPoint"] = "TOP",
["borderColor"] = {
0,
0,
0,
1,
},
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["names"] = {
},
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["internalVersion"] = 90,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "Luxthos：https://wago.io/p/Luxthos",
["version"] = 28,
["subRegions"] = {
},
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["source"] = "import",
["scale"] = 1,
["customAnchor"] = "",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "group",
["borderSize"] = 2,
["anchorFrameParent"] = false,
["groupIcon"] = "interface/icons/classicon_druid.blp",
["parent"] = "德鲁伊（中心分组，by 露露緹婭@Bilibili）",
["borderOffset"] = 4,
["semver"] = "2.0.25",
["tocversion"] = 11500,
["id"] = "Resources - Druid",
["authorOptions"] = {
},
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["config"] = {
},
["uid"] = "j4E1H(LMng4",
["borderInset"] = 1,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["selfPoint"] = "CENTER",
},
["激活（可点击施法，左键目标，右键玩家）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 激活\")\nbtn:SetAttribute(\"macrotext2\",\"/cast [@player]激活\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a激活（目标）|r\\n|cffffffff右键：|r|cffff7c0a激活（玩家）|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["ignoreDead"] = true,
["useMatch_count"] = true,
["useName"] = true,
["match_countOperator"] = ">",
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "group",
["ignoreDisconnected"] = true,
["type"] = "aura2",
["spellIds"] = {
},
["auranames"] = {
"29166",
},
["match_count"] = "0",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 29166,
["realSpellName"] = "激活",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["use_genericShowOn"] = true,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["unit"] = "player",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[3]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["single"] = 95,
["multi"] = {
[95] = true,
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 29166,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["parent"] = "Core - Druid",
["width"] = 48,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.8",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "激活（可点击施法，左键目标，右键玩家）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "t4GQAkAeNOc",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["【露露】德鲁伊（BUFF）"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"节能施法/清晰预兆（德鲁伊，猫叫音效）",
"迷梦（符文）",
"怒风之怒（符文，露露语音）",
"自然之赐（平衡）音效",
"星涌术（平衡）",
"【露露】德鲁伊 技能释放发言（激活）",
"【露露】德鲁伊 野蛮咆哮语音（3秒，团战加载）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["groupIcon"] = "interface/icons/classicon_druid.blp",
["anchorPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["space"] = 2,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["event"] = "Health",
["names"] = {
},
},
["untrigger"] = {
},
},
},
["columnSpace"] = 4,
["radius"] = 200,
["alpha"] = 1,
["useLimit"] = true,
["align"] = "CENTER",
["selfPoint"] = "TOPLEFT",
["gridType"] = "RD",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["sortHybridTable"] = {
},
["rotation"] = 0,
["subRegions"] = {
},
["parent"] = "德鲁伊（60plus，by 露露緹婭@Bilibili）1005更",
["yOffset"] = -37.45,
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["borderInset"] = 1,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["uid"] = "4NVPk750OFD",
["animate"] = false,
["xOffset"] = 142,
["scale"] = 1.1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["limit"] = 10,
["frameStrata"] = 1,
["regionType"] = "dynamicgroup",
["anchorFrameParent"] = false,
["constantFactor"] = "RADIUS",
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["borderOffset"] = 4,
["rowSpace"] = 35,
["tocversion"] = 20501,
["id"] = "【露露】德鲁伊（BUFF）",
["sort"] = "none",
["gridWidth"] = 5,
["anchorFrameType"] = "UIPARENT",
["source"] = "import",
["config"] = {
},
["internalVersion"] = 90,
["fullCircle"] = true,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["arcLength"] = 360,
},
["星涌术（平衡）"] = {
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["use_debuffClass"] = false,
["auraspellids"] = {
"16886",
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["auranames"] = {
"417157",
},
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["useExactSpellId"] = false,
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["duration_type"] = "seconds",
["preset"] = "slidebottom",
["easeStrength"] = 3,
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desaturate"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "%p",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = true,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["type"] = "subtext",
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_color"] = {
1,
0.97254901960784,
0.050980392156863,
1,
},
["text_font"] = "Rurutia",
["anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_shadowXOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "急速",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_shadowYOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 1,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["anchorXOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_shadowXOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = false,
["text_text_format_p_format"] = "timed",
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 15,
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_time_format"] = 0,
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "Pixel",
["glowLength"] = 5,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["useGlowColor"] = false,
["glowXOffset"] = 0,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
[8] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["class"] = {
["single"] = "DRUID",
["multi"] = {
["HUNTER"] = true,
["WARLOCK"] = true,
["PALADIN"] = true,
["DRUID"] = true,
["SHAMAN"] = true,
["PRIEST"] = true,
},
},
["spellknown"] = 417157,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["selfPoint"] = "CENTER",
["parent"] = "【露露】德鲁伊（BUFF）",
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["conditions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["authorOptions"] = {
},
["config"] = {
},
["xOffset"] = 0,
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["url"] = "https://space.bilibili.com/455259",
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["tocversion"] = 20501,
["id"] = "星涌术（平衡）",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 30,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["uid"] = "Zyy8KGaWzSc",
["inverse"] = false,
["adjustedMax"] = "",
["displayIcon"] = 135829,
["cooldown"] = true,
["actions"] = {
["start"] = {
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】急速.ogg",
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!Wind-OnePlusLight.ogg",
["do_sound"] = false,
},
["finish"] = {
},
["init"] = {
},
},
},
["Class Options - Druid"] = {
["iconSource"] = 0,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
{
["subOptions"] = {
{
["subOptions"] = {
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["softMin"] = 5,
["type"] = "range",
["bigStep"] = 1,
["max"] = 50,
["step"] = 1,
["width"] = 1.25,
["min"] = 5,
["key"] = "height",
["softMax"] = 50,
["useDesc"] = false,
["name"] = "Resource Height",
["default"] = 20,
},
{
["type"] = "select",
["values"] = {
"12345",
"12,3K",
"12345 (100%)",
"12,3K (100%)",
"100%",
},
["default"] = 1,
["key"] = "format",
["useDesc"] = false,
["name"] = "Text Format",
["width"] = 0.75,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["type"] = "header",
["useName"] = true,
["text"] = "Default Color",
["noMerge"] = true,
["width"] = 1,
},
{
["type"] = "color",
["key"] = "color1",
["default"] = {
0.03921568627451,
0.45098039215686,
0.82745098039216,
1,
},
["useDesc"] = false,
["name"] = "Color 1",
["width"] = 1,
},
{
["type"] = "color",
["key"] = "color2",
["default"] = {
0.23137254901961,
0.63137254901961,
1,
1,
},
["useDesc"] = false,
["name"] = "Color 2",
["width"] = 1,
},
{
["type"] = "select",
["values"] = {
"Horizontal",
"Vertical",
"None",
},
["default"] = 1,
["key"] = "gradient",
["useDesc"] = false,
["name"] = "Gradient Direction",
["width"] = 1,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["width"] = 1,
["useCollapse"] = true,
["collapse"] = true,
["name"] = "Mana Bar",
["key"] = "mana_bar",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
{
["subOptions"] = {
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["softMin"] = 5,
["type"] = "range",
["bigStep"] = 1,
["max"] = 50,
["step"] = 1,
["width"] = 1.25,
["min"] = 5,
["key"] = "height",
["softMax"] = 50,
["useDesc"] = false,
["name"] = "Resource Height",
["default"] = 5,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["type"] = "header",
["useName"] = true,
["text"] = "Default Color",
["noMerge"] = true,
["width"] = 1,
},
{
["type"] = "color",
["key"] = "color1",
["default"] = {
0.03921568627451,
0.45098039215686,
0.82745098039216,
1,
},
["useDesc"] = false,
["name"] = "Color 1",
["width"] = 1,
},
{
["type"] = "color",
["key"] = "color2",
["default"] = {
0.23137254901961,
0.63137254901961,
1,
1,
},
["useDesc"] = false,
["name"] = "Color 2",
["width"] = 1,
},
{
["type"] = "select",
["values"] = {
"Horizontal",
"Vertical",
"None",
},
["default"] = 1,
["key"] = "gradient",
["useDesc"] = false,
["name"] = "Gradient Direction",
["width"] = 1,
},
{
["type"] = "header",
["useName"] = true,
["text"] = "Over 90% Mana in Form",
["noMerge"] = true,
["width"] = 1,
},
{
["type"] = "color",
["key"] = "full_color1",
["default"] = {
1,
1,
1,
0.35000002384186,
},
["useDesc"] = false,
["name"] = "Color 1",
["width"] = 1,
},
{
["type"] = "color",
["key"] = "full_color2",
["default"] = {
1,
1,
1,
0.44999998807907,
},
["useDesc"] = false,
["name"] = "Color 2",
["width"] = 1,
},
{
["type"] = "select",
["values"] = {
"Horizontal",
"Vertical",
"None",
},
["default"] = 1,
["key"] = "full_gradient",
["useDesc"] = false,
["name"] = "Gradient Direction",
["width"] = 1,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["width"] = 1,
["useCollapse"] = true,
["collapse"] = true,
["name"] = "Form Mana Bar",
["key"] = "form_mana_bar",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
{
["subOptions"] = {
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["softMin"] = 5,
["type"] = "range",
["bigStep"] = 1,
["max"] = 50,
["step"] = 1,
["width"] = 1.25,
["min"] = 5,
["key"] = "height",
["softMax"] = 50,
["useDesc"] = false,
["name"] = "Resource Height",
["default"] = 20,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["type"] = "header",
["useName"] = true,
["text"] = "Default Color",
["noMerge"] = true,
["width"] = 1,
},
{
["type"] = "color",
["key"] = "color1",
["default"] = {
0.69019607843137,
0,
0,
1,
},
["useDesc"] = false,
["name"] = "Color 1",
["width"] = 1,
},
{
["type"] = "color",
["key"] = "color2",
["default"] = {
0.90980392156863,
0.26666666666667,
0.12156862745098,
1,
},
["useDesc"] = false,
["name"] = "Color 2",
["width"] = 1,
},
{
["type"] = "select",
["values"] = {
"Horizontal",
"Vertical",
"None",
},
["default"] = 1,
["key"] = "gradient",
["useDesc"] = false,
["name"] = "Gradient Direction",
["width"] = 1,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["width"] = 1,
["useCollapse"] = true,
["collapse"] = true,
["name"] = "Rage Bar",
["key"] = "rage_bar",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
{
["subOptions"] = {
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["softMin"] = 5,
["type"] = "range",
["bigStep"] = 1,
["max"] = 50,
["step"] = 1,
["width"] = 1.25,
["min"] = 5,
["key"] = "height",
["softMax"] = 50,
["useDesc"] = false,
["name"] = "Resource Height",
["default"] = 20,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["type"] = "header",
["useName"] = true,
["text"] = "Default Color",
["noMerge"] = true,
["width"] = 1,
},
{
["type"] = "color",
["key"] = "color1",
["default"] = {
1,
0.74901960784314,
0.16078431372549,
1,
},
["useDesc"] = false,
["name"] = "Color 1",
["width"] = 1,
},
{
["type"] = "color",
["key"] = "color2",
["default"] = {
1,
0.85490196078431,
0.41960784313725,
1,
},
["useDesc"] = false,
["name"] = "Color 2",
["width"] = 1,
},
{
["type"] = "select",
["values"] = {
"Horizontal",
"Vertical",
"None",
},
["default"] = 1,
["key"] = "gradient",
["useDesc"] = false,
["name"] = "Gradient Direction",
["width"] = 1,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["width"] = 1,
["useCollapse"] = true,
["collapse"] = true,
["name"] = "Energy Bar",
["key"] = "energy_bar",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
{
["subOptions"] = {
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["softMin"] = 5,
["type"] = "range",
["bigStep"] = 1,
["max"] = 50,
["step"] = 1,
["width"] = 1.25,
["min"] = 5,
["key"] = "height",
["softMax"] = 50,
["useDesc"] = false,
["name"] = "Resource Height",
["default"] = 15,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["type"] = "header",
["useName"] = true,
["text"] = "Default Color",
["noMerge"] = true,
["width"] = 1,
},
{
["type"] = "color",
["key"] = "color1",
["default"] = {
0.83137254901961,
0.14901960784314,
0,
1,
},
["useDesc"] = false,
["name"] = "Color 1",
["width"] = 1,
},
{
["type"] = "color",
["key"] = "color2",
["default"] = {
1,
0.34117647058824,
0.27843137254902,
1,
},
["useDesc"] = false,
["name"] = "Color 2",
["width"] = 1,
},
{
["type"] = "select",
["values"] = {
"Horizontal",
"Vertical",
"None",
},
["default"] = 1,
["key"] = "gradient",
["useDesc"] = false,
["name"] = "Gradient Direction",
["width"] = 1,
},
{
["type"] = "header",
["useName"] = true,
["text"] = "Highlight",
["noMerge"] = true,
["width"] = 1,
},
{
["type"] = "color",
["key"] = "highlight_color1",
["default"] = {
0.25098039215686,
0.69019607843137,
0.18823529411765,
1,
},
["useDesc"] = false,
["name"] = "Color 1",
["width"] = 1,
},
{
["type"] = "color",
["key"] = "highlight_color2",
["default"] = {
0.49019607843137,
0.94509803921569,
0.42745098039216,
1,
},
["useDesc"] = false,
["name"] = "Color 2",
["width"] = 1,
},
{
["type"] = "select",
["values"] = {
"Horizontal",
"Vertical",
"None",
},
["default"] = 1,
["key"] = "highlight_gradient",
["useDesc"] = false,
["name"] = "Gradient Direction",
["width"] = 1,
},
{
["type"] = "header",
["useName"] = true,
["text"] = "Full",
["noMerge"] = true,
["width"] = 1,
},
{
["type"] = "color",
["key"] = "full_color1",
["default"] = {
0.92549019607843,
0.92549019607843,
0.92549019607843,
1,
},
["useDesc"] = false,
["name"] = "Color 1",
["width"] = 1,
},
{
["type"] = "color",
["key"] = "full_color2",
["default"] = {
1,
1,
1,
1,
},
["useDesc"] = false,
["name"] = "Color 2",
["width"] = 1,
},
{
["type"] = "select",
["values"] = {
"Horizontal",
"Vertical",
"None",
},
["default"] = 1,
["key"] = "full_gradient",
["useDesc"] = false,
["name"] = "Gradient Direction",
["width"] = 1,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["width"] = 1,
["useCollapse"] = true,
["collapse"] = true,
["name"] = "Combo Points",
["key"] = "combo_points",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["collapse"] = false,
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["name"] = "Resources",
["key"] = "resources",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["event"] = "GTFO",
["unit"] = "player",
["custom_hide"] = "timed",
["events"] = "OPTIONS",
["custom"] = "function ()\n    local LWA = LWA[aura_env.CLASS]\n    \n    if LWA.ThrottledInit then\n        LWA.ThrottledInit()\n    end\nend",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["custom_type"] = "event",
["spellIds"] = {
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = false,
["selfPoint"] = "TOP",
["desaturate"] = false,
["version"] = 28,
["subRegions"] = {
{
["type"] = "subbackground",
},
},
["height"] = 1,
["load"] = {
["use_class"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["width"] = 1,
["source"] = "import",
["parent"] = "德鲁伊（中心分组，by 露露緹婭@Bilibili）",
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "aura_env.CLASS = aura_env.id:gsub(\"Class Options %- \", \"\")\n\nLWA = LWA or {}\nLWA[aura_env.CLASS] = LWA[aura_env.CLASS] or {}\n\nlocal LWA = LWA[aura_env.CLASS]\n\nLWA.configs = LWA.configs or {}\nLWA.configs[\"class\"] = aura_env.config\n\n",
["do_custom"] = true,
},
["finish"] = {
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["displayIcon"] = "interface/icons/classicon_druid.blp",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["url"] = "https://space.bilibili.com/455259",
["config"] = {
["resources"] = {
["rage_bar"] = {
["height"] = 20,
["gradient"] = 1,
["color2"] = {
0.90980392156863,
0.26666666666667,
0.12156862745098,
1,
},
["color1"] = {
0.69019607843137,
0,
0,
1,
},
},
["energy_bar"] = {
["height"] = 20,
["gradient"] = 1,
["color2"] = {
1,
0.85490196078431,
0.41960784313725,
1,
},
["color1"] = {
1,
0.74901960784314,
0.16078431372549,
1,
},
},
["form_mana_bar"] = {
["color2"] = {
0.23137254901961,
0.63137254901961,
1,
1,
},
["full_gradient"] = 1,
["full_color2"] = {
1,
1,
1,
0.44999998807907,
},
["full_color1"] = {
1,
1,
1,
0.35000002384186,
},
["gradient"] = 1,
["height"] = 5,
["color1"] = {
0.03921568627451,
0.45098039215686,
0.82745098039216,
1,
},
},
["mana_bar"] = {
["color2"] = {
0.23137254901961,
0.63137254901961,
1,
1,
},
["height"] = 20,
["gradient"] = 1,
["format"] = 3,
["color1"] = {
0.03921568627451,
0.45098039215686,
0.82745098039216,
1,
},
},
["combo_points"] = {
["full_gradient"] = 1,
["highlight_gradient"] = 1,
["color1"] = {
0.83137254901961,
0.14901960784314,
0,
1,
},
["color2"] = {
1,
0.34117647058824,
0.27843137254902,
1,
},
["highlight_color2"] = {
0.49019607843137,
0.94509803921569,
0.42745098039216,
1,
},
["full_color2"] = {
1,
1,
1,
1,
},
["height"] = 15,
["gradient"] = 1,
["highlight_color1"] = {
0.25098039215686,
0.69019607843137,
0.18823529411765,
1,
},
["full_color1"] = {
0.92549019607843,
0.92549019607843,
0.92549019607843,
1,
},
},
},
},
["color"] = {
0,
0,
0,
0,
},
["desc"] = "Luxthos：https://wago.io/p/Luxthos",
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["semver"] = "2.0.25",
["tocversion"] = 11500,
["id"] = "Class Options - Druid",
["frameStrata"] = 1,
["alpha"] = 0,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["uid"] = "GlOXC69Zy0E",
["inverse"] = false,
["adjustedMax"] = "",
["conditions"] = {
},
["cooldown"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
},
["野性成长（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["type"] = "aura2",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["unit"] = "target",
["ownOnly"] = true,
["auranames"] = {
"408120",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["debuffType"] = "HELPFUL",
["auranames"] = {
"768",
"5487",
"9634",
},
["useName"] = true,
["ownOnly"] = true,
["matchesShowOn"] = "showOnMissing",
["unit"] = "player",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = false,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%s",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_color"] = {
1,
0.86274509803922,
0.62745098039216,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_anchorYOffset"] = -4,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 22,
["anchorXOffset"] = 0,
["text_visible"] = true,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["zoneIds"] = "",
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spellknown"] = 408120,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 48,
["source"] = "import",
["parent"] = "Core - Druid",
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["cooldownEdge"] = true,
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["config"] = {
},
["xOffset"] = 0,
["anchorFrameParent"] = false,
["alpha"] = 1,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.8",
["tocversion"] = 11500,
["id"] = "野性成长（符文）",
["auto"] = true,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["zoom"] = 0.3,
["uid"] = "ZNBKaHC7YGQ",
["inverse"] = false,
["authorOptions"] = {
},
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 1,
},
{
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
},
{
["value"] = "0",
["op"] = "==",
["variable"] = "matchCount",
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = {
1,
1,
1,
0.5,
},
["property"] = "color",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
},
["精灵之火（野性）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["spellName"] = 16857,
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "SPELL",
["realSpellName"] = "精灵之火（野性）",
["use_spellName"] = true,
["spellIds"] = {
},
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["unit"] = "player",
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 38,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
[54] = true,
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["spellknown"] = 16857,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "德鲁伊 动态分组 左",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["uid"] = "QH7uttrNRUi",
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "精灵之火（野性）",
["semver"] = "2.0.8",
["useCooldownModRate"] = true,
["width"] = 38,
["zoom"] = 0.3,
["config"] = {
},
["inverse"] = true,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
},
["潜行（德鲁伊）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useMatch_count"] = true,
["match_countOperator"] = ">",
["names"] = {
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["auranames"] = {
"5215",
},
["match_count"] = "0",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 5215,
["realSpellName"] = "潜行",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["use_genericShowOn"] = true,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["unit"] = "player",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 38,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 5215,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["parent"] = "德鲁伊 动态分组 左",
["width"] = 38,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.8",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "潜行（德鲁伊）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "eBj4MSNvoFZ",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["愈合"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["type"] = "aura2",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["unit"] = "target",
["ownOnly"] = true,
["auranames"] = {
"8939",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["debuffType"] = "HELPFUL",
["auranames"] = {
"768",
"5487",
"9634",
},
["useName"] = true,
["matchesShowOn"] = "showOnMissing",
["ownOnly"] = true,
["unit"] = "player",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = false,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%s",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_color"] = {
1,
0.86274509803922,
0.62745098039216,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_anchorYOffset"] = -4,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 22,
["anchorXOffset"] = 0,
["text_visible"] = true,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["zoneIds"] = "",
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spellknown"] = 8939,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 48,
["source"] = "import",
["parent"] = "Core - Druid",
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["xOffset"] = 0,
["cooldownEdge"] = true,
["config"] = {
},
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.8",
["tocversion"] = 11500,
["id"] = "愈合",
["auto"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "cMdr5HAvmxl",
["inverse"] = false,
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 1,
},
{
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
},
{
["value"] = "0",
["op"] = "==",
["variable"] = "matchCount",
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = {
1,
1,
1,
0.5,
},
["property"] = "color",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["color"] = {
1,
1,
1,
1,
},
},
["虫群"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = true,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["type"] = "aura2",
["auranames"] = {
"5570",
},
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["unit"] = "target",
["unitExists"] = true,
["useName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["subeventPrefix"] = "SPELL",
["names"] = {
},
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["use_alwaystrue"] = true,
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["event"] = "Conditions",
["unit"] = "player",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["unit"] = "player",
["auranames"] = {
"5487",
"9634",
"768",
"33891",
},
["useName"] = true,
["ownOnly"] = true,
["matchesShowOn"] = "showOnMissing",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["spellknown"] = 5570,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "Core - Druid",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["uid"] = "n7QQ0FXtrPs",
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "虫群",
["semver"] = "2.0.8",
["useCooldownModRate"] = true,
["width"] = 48,
["zoom"] = 0.3,
["config"] = {
},
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
},
{
["value"] = "0",
["op"] = "==",
["variable"] = "matchCount",
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = 0.5,
["property"] = "alpha",
},
},
},
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 1,
},
{
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = 1,
["property"] = "alpha",
},
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
},
["自然之握"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = false,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 自然之握\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a自然之握|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["type"] = "aura2",
["unit"] = "player",
["names"] = {
},
["auranames"] = {
"16689",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 16689,
["realSpellName"] = "自然之握",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["use_genericShowOn"] = true,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["unit"] = "player",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["single"] = 39,
["multi"] = {
[39] = true,
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 16689,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["parent"] = "Core - Druid",
["width"] = 48,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.8",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "自然之握",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "R3Th)RqCnHo",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["急奔（可点击施法，自动变豹）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cancelform [noform:3]\\n/cast [noform:3] 猎豹形态\\n/cast 急奔\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a急奔（自动变豹）|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useMatch_count"] = true,
["match_countOperator"] = ">",
["names"] = {
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["auranames"] = {
"1850",
},
["match_count"] = "0",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 1850,
["realSpellName"] = "急奔",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["use_genericShowOn"] = true,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["unit"] = "player",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 1850,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["parent"] = "Core - Druid",
["width"] = 48,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.8",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "急奔（可点击施法，自动变豹）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "8lbUw3FvnD0",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["野蛮咆哮（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["type"] = "aura2",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["ownOnly"] = true,
["auranames"] = {
"407988",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"768",
},
["debuffType"] = "HELPFUL",
["ownOnly"] = true,
["useName"] = true,
["unit"] = "player",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = false,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["zoneIds"] = "",
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spellknown"] = 407988,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 48,
["source"] = "import",
["cooldownEdge"] = true,
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["xOffset"] = 0,
["config"] = {
},
["authorOptions"] = {
},
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "野蛮咆哮（符文）",
["semver"] = "2.0.8",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "iX78JW583i1",
["inverse"] = false,
["parent"] = "Core - Druid",
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 1,
},
{
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
},
{
["value"] = "0",
["op"] = "==",
["variable"] = "matchCount",
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = {
1,
1,
1,
0.5,
},
["property"] = "color",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["icon"] = true,
},
["5秒回蓝（德鲁伊）"] = {
["sparkWidth"] = 20,
["iconSource"] = -1,
["authorOptions"] = {
{
["type"] = "toggle",
["key"] = "showoptimalcaststart",
["default"] = true,
["name"] = "Show optimal timing for start casting and gain mana regen tick",
["width"] = 2,
},
{
["type"] = "description",
["text"] = "Cast time of your main spell :",
["fontSize"] = "medium",
["width"] = 2,
},
{
["type"] = "number",
["useDesc"] = false,
["max"] = 10,
["step"] = 0.1,
["width"] = 0.5,
["min"] = 0,
["key"] = "MAGE",
["name"] = "|T135150:0|t Mage",
["default"] = 2,
},
{
["type"] = "number",
["useDesc"] = false,
["max"] = 10,
["step"] = 0.1,
["width"] = 0.5,
["min"] = 0,
["key"] = "PRIEST",
["name"] = "|T135167:0|t Priest",
["default"] = 1.5,
},
{
["type"] = "number",
["useDesc"] = false,
["max"] = 10,
["step"] = 0.1,
["width"] = 0.5,
["min"] = 0,
["key"] = "HUNTER",
["name"] = "|T135495:0|t Hunter",
["default"] = 1.5,
},
{
["type"] = "number",
["useDesc"] = false,
["max"] = 10,
["step"] = 0.1,
["width"] = 0.5,
["min"] = 0,
["key"] = "WARLOCK",
["name"] = "|T136020:0|t Warlock",
["default"] = 1.5,
},
{
["type"] = "number",
["useDesc"] = false,
["max"] = 10,
["step"] = 0.1,
["width"] = 0.5,
["min"] = 0,
["key"] = "SHAMAN",
["name"] = "|T133437:0|t Shaman",
["default"] = 1.5,
},
{
["type"] = "number",
["useDesc"] = false,
["max"] = 10,
["step"] = 0.1,
["width"] = 0.5,
["min"] = 0,
["key"] = "PALADIN",
["name"] = "|T133038:0|t Paladin",
["default"] = 1.5,
},
{
["type"] = "number",
["useDesc"] = false,
["max"] = 10,
["step"] = 0.1,
["width"] = 0.5,
["min"] = 0,
["key"] = "DRUID",
["name"] = "|T134297:0|t Druid",
["default"] = 1.5,
},
},
["preferToUpdate"] = false,
["yOffset"] = -59.52380947536892,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
["custom"] = "WeakAuras.ScanEvents(\"TICKUPDATE\", true)",
["do_custom"] = false,
},
},
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["selfPoint"] = "CENTER",
["barColor"] = {
1,
0,
0,
0,
},
["desaturate"] = false,
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["use_class"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "DRUID",
["multi"] = {
["HUNTER"] = true,
["WARLOCK"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["PRIEST"] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["toolTipArea"] = "ICON",
["smoothProgress"] = false,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["sparkDesaturate"] = true,
["texture"] = "Solid",
["zoom"] = 0,
["spark"] = true,
["tocversion"] = 11500,
["alpha"] = 1,
["uid"] = "fAokenDladT",
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "XoGkZt2VR",
["parent"] = "德鲁伊（中心分组，by 露露緹婭@Bilibili）",
["customText"] = "function()\n    if aura_env.config.showoptimalcaststart then\n        if aura_env.state and aura_env.state.duration then\n            local bar = aura_env.region.bar\n            local _, class = UnitClass(\"player\")\n            local spellduration = aura_env.config[class]\n            if not bar.mark then\n                local mark = bar:CreateTexture(nil, \"ARTWORK\");\n                mark:SetDrawLayer(\"ARTWORK\", 3);\n                bar.mark = mark\n                bar.mark:SetTexture([[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite]])\n                bar.mark:SetWidth(2);\n                bar.mark:SetHeight(bar:GetHeight() - 4);\n                bar.mark:SetBlendMode(\"BLEND\");\n                bar.mark:SetVertexColor(1, 1, 1, 0.5)\n            end\n            if spellduration < aura_env.state.duration then\n                bar.mark:ClearAllPoints()\n                bar.mark:SetPoint(\n                    \"RIGHT\",\n                    bar,\n                    \"RIGHT\",\n                    -((bar:GetWidth() / aura_env.state.duration) * spellduration),\n                    0\n                )\n                bar.mark:Show()\n            else\n                bar.mark:Hide()\n            end\n        end\n    elseif aura_env.region.bar.mark then\n        aura_env.region.bar.mark:Hide()\n    end\nend",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["duration"] = "2",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "custom",
["custom_type"] = "stateupdate",
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_ENERGIZE",
["event"] = "Health",
["use_unit"] = true,
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player UNIT_POWER_FREQUENT:player",
["spellIds"] = {
},
["custom"] = "function(a, e, t)\n    local currMana = UnitPower(\"player\", 0)\n    local maxMana = UnitPowerMax(\"player\", 0)\n    if currMana < maxMana then\n        if (e == \"UNIT_POWER_FREQUENT\" and currMana > (aura_env.lastMana or 0))\n        then\n            local dur = 2\n            a[\"\"] = {\n                show = true,\n                changed = true,\n                duration = dur,\n                expirationTime = GetTime() + dur,\n                progressType = \"timed\",\n                autoHide = true\n            }\n            aura_env.lastMana = currMana\n        elseif e == \"UNIT_SPELLCAST_SUCCEEDED\" and currMana < (aura_env.lastMana or math.huge) then\n            local dur = 6.45\n            a[\"\"] = {\n                show = true,\n                changed = true,\n                duration = dur,\n                expirationTime = GetTime() + dur,\n                progressType = \"timed\",\n                autoHide = true\n            }\n            aura_env.lastMana = currMana\n        end\n    end\n    return true\nend",
["use_sourceUnit"] = true,
["check"] = "event",
["unevent"] = "auto",
["sourceUnit"] = "player",
["unit"] = "player",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["debuffType"] = "HELPFUL",
["auranames"] = {
"5488",
"9634",
"768",
},
["ownOnly"] = true,
["matchesShowOn"] = "showOnMissing",
["useName"] = true,
["unit"] = "player",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["backdropInFront"] = false,
["stickyDuration"] = false,
["version"] = 4,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_shadowXOffset"] = 1,
["text_text"] = "%c",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_c_format"] = "none",
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Friz Quadrata TT",
["text_shadowYOffset"] = -1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "None",
["anchorYOffset"] = 0,
["anchor_point"] = "INNER_RIGHT",
["text_fontSize"] = 12,
["anchorXOffset"] = 0,
["text_visible"] = true,
},
},
["height"] = 25,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["source"] = "import",
["desc"] = "from：https://wago.io/XoGkZt2VR/",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["sparkOffsetX"] = 0,
["borderInFront"] = true,
["adjustedMax"] = "",
["icon_side"] = "RIGHT",
["backgroundColor"] = {
0,
0,
0,
0,
},
["sparkTexture"] = "XPBarAnim-OrangeSpark",
["sparkHeight"] = 38,
["sparkColor"] = {
1,
1,
1,
1,
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["semver"] = "1.1.2",
["id"] = "5秒回蓝（德鲁伊）",
["sparkHidden"] = "NEVER",
["config"] = {
["HUNTER"] = 1.5,
["SHAMAN"] = 1.5,
["WARLOCK"] = 1.5,
["PALADIN"] = 1.5,
["MAGE"] = 2,
["DRUID"] = 1.5,
["showoptimalcaststart"] = false,
["PRIEST"] = 1.5,
},
["frameStrata"] = 5,
["width"] = 297,
["xOffset"] = 0,
["auto"] = true,
["inverse"] = true,
["icon"] = false,
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["barColor2"] = {
1,
1,
0,
1,
},
["adjustedMin"] = "",
},
["2秒回能（德鲁伊）"] = {
["sparkWidth"] = 20,
["iconSource"] = -1,
["xOffset"] = 0,
["preferToUpdate"] = false,
["yOffset"] = -78,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["icon"] = false,
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["selfPoint"] = "CENTER",
["barColor"] = {
1,
0,
0,
0,
},
["desaturate"] = false,
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
["ROGUE"] = true,
["DRUID"] = true,
},
},
["use_class"] = true,
["use_spellknown"] = false,
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 5487,
["size"] = {
["multi"] = {
},
},
},
["toolTipArea"] = "ICON",
["smoothProgress"] = false,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["sparkDesaturate"] = true,
["texture"] = "Solid",
["zoom"] = 0,
["auto"] = true,
["tocversion"] = 11500,
["alpha"] = 1,
["sparkColor"] = {
1,
1,
1,
1,
},
["sparkOffsetX"] = 0,
["wagoID"] = "XoGkZt2VR",
["parent"] = "德鲁伊（中心分组，by 露露緹婭@Bilibili）",
["customText"] = "function()\n    if aura_env.config.showoptimalcaststart then\n        if aura_env.state and aura_env.state.duration then\n            local bar = aura_env.region.bar\n            local _, class = UnitClass(\"player\")\n            local spellduration = aura_env.config[class]\n            if not bar.mark then\n                local mark = bar:CreateTexture(nil, \"ARTWORK\");\n                mark:SetDrawLayer(\"ARTWORK\", 3);\n                bar.mark = mark\n                bar.mark:SetTexture([[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite]])\n                bar.mark:SetWidth(2);\n                bar.mark:SetHeight(bar:GetHeight() - 4);\n                bar.mark:SetBlendMode(\"BLEND\");\n                bar.mark:SetVertexColor(1, 1, 1, 0.5)\n            end\n            if spellduration < aura_env.state.duration then\n                bar.mark:ClearAllPoints()\n                bar.mark:SetPoint(\n                    \"RIGHT\",\n                    bar,\n                    \"RIGHT\",\n                    -((bar:GetWidth() / aura_env.state.duration) * spellduration),\n                    0\n                )\n                bar.mark:Show()\n            else\n                bar.mark:Hide()\n            end\n        end\n    elseif aura_env.region.bar.mark then\n        aura_env.region.bar.mark:Hide()\n    end\nend",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["duration"] = "2",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "custom",
["unevent"] = "auto",
["names"] = {
},
["unit"] = "player",
["event"] = "Health",
["custom_type"] = "stateupdate",
["events"] = "UNIT_POWER_FREQUENT:player ENERGYTICK",
["custom"] = "function(a, e, t)\n    local currEnergy = UnitPower(\"player\", 3)\n    local dur = 2\n    if (e == \"UNIT_POWER_FREQUENT\" and currEnergy > (aura_env.lastEnergy or 0))\n    or (e == \"ENERGYTICK\" and t and currEnergy == UnitPowerMax(\"player\", 3))\n    then\n        if not a[\"\"]  then\n            a[\"\"] = {\n                show = true,\n                changed = true,\n                duration = dur,\n                expirationTime = GetTime() + dur,\n                progressType = \"timed\"\n            }\n        else\n            local s = a[\"\"]\n            s.changed = true\n            s.duration = dur\n            s.expirationTime = GetTime() + dur\n            s.show = true\n            C_Timer.After(2, function() WeakAuras.ScanEvents(\"ENERGYTICK\", true) end)\n        end\n    end\n    aura_env.lastEnergy = currEnergy\n    return true\nend",
["spellIds"] = {
},
["use_sourceUnit"] = true,
["check"] = "event",
["subeventSuffix"] = "_ENERGIZE",
["sourceUnit"] = "player",
["subeventPrefix"] = "SPELL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"499",
},
["form"] = {
["single"] = 2,
},
["event"] = "Stance/Form/Aura",
["unit"] = "player",
["use_form"] = true,
["useName"] = true,
["use_unit"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["event"] = "Power",
["unit"] = "player",
["powertype"] = 3,
["percentpower_operator"] = {
"<",
},
["percentpower"] = {
"100",
},
["use_percentpower"] = true,
["use_unit"] = true,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["backdropInFront"] = false,
["stickyDuration"] = false,
["version"] = 4,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_shadowXOffset"] = 1,
["text_text"] = "%c",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_c_format"] = "none",
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Friz Quadrata TT",
["text_shadowYOffset"] = -1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "None",
["anchorYOffset"] = 0,
["anchor_point"] = "INNER_RIGHT",
["text_fontSize"] = 12,
["anchorXOffset"] = 0,
["text_visible"] = true,
},
},
["height"] = 25,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["source"] = "import",
["authorOptions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["desc"] = "from：https://wago.io/XoGkZt2VR/",
["anchorFrameFrame"] = "WeakAuras:Energy Bar - Druid",
["adjustedMax"] = "",
["borderInFront"] = true,
["sparkTexture"] = "XPBarAnim-OrangeSpark",
["icon_side"] = "RIGHT",
["color"] = {
},
["spark"] = true,
["sparkHeight"] = 38,
["uid"] = "wt1H0o(Tp)e",
["anchorFrameType"] = "SCREEN",
["config"] = {
},
["semver"] = "1.1.2",
["sparkHidden"] = "NEVER",
["id"] = "2秒回能（德鲁伊）",
["useAdjustededMax"] = false,
["frameStrata"] = 5,
["width"] = 297,
["actions"] = {
["start"] = {
},
["finish"] = {
["custom"] = "WeakAuras.ScanEvents(\"TICKUPDATE\", true)",
["do_custom"] = false,
},
["init"] = {
},
},
["backgroundColor"] = {
0,
0,
0,
0,
},
["inverse"] = true,
["borderBackdrop"] = "Blizzard Tooltip",
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["barColor2"] = {
1,
1,
0,
1,
},
["adjustedMin"] = "",
},
["猛虎之怒"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["parent"] = "Core - Druid",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
["do_message"] = false,
},
["init"] = {
["do_custom"] = false,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 猛虎之怒\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a猛虎之怒|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["useName"] = true,
["spellIds"] = {
},
["auranames"] = {
"9846",
},
["ownOnly"] = true,
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["type"] = "spell",
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["use_showgcd"] = false,
["use_spellName"] = true,
["spellName"] = 9846,
["genericShowOn"] = "showAlways",
["realSpellName"] = "猛虎之怒",
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"768",
},
["unit"] = "player",
["ownOnly"] = true,
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[3]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "可点击施法暂时取消",
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["spellknown"] = 9846,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["desaturate"] = false,
["source"] = "import",
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["icon"] = true,
["uid"] = "0PDlyvdHtVl",
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.8",
["tocversion"] = 11500,
["id"] = "猛虎之怒",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["width"] = 48,
["useCooldownModRate"] = true,
["config"] = {
},
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "insufficientResources",
["value"] = 1,
},
["changes"] = {
{
["value"] = {
0.47450980392157,
0.51372549019608,
1,
1,
},
["property"] = "color",
},
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["property"] = "color",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["selfPoint"] = "CENTER",
},
["德鲁伊（中心分组，by 露露緹婭@Bilibili）"] = {
["controlledChildren"] = {
"Class Options - Druid",
"General Options - Druid",
"德鲁伊 动态分组 左",
"德鲁伊 动态分组 右",
"Core - Druid",
"Resources - Druid",
"5秒回蓝（德鲁伊）",
"2秒回能（德鲁伊）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["groupIcon"] = "interface/icons/classicon_druid.blp",
["anchorPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["names"] = {
},
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["internalVersion"] = 90,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。\n\n使用的英文模板来自：\nAfenar：https://wago.io/p/Afenar\nLuxthos：https://wago.io/p/Luxthos",
["version"] = 28,
["subRegions"] = {
},
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["source"] = "import",
["scale"] = 0.8,
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "group",
["borderSize"] = 2,
["borderInset"] = 1,
["yOffset"] = -253,
["borderOffset"] = 4,
["semver"] = "2.0.25",
["tocversion"] = 11500,
["id"] = "德鲁伊（中心分组，by 露露緹婭@Bilibili）",
["xOffset"] = 0,
["frameStrata"] = 3,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["config"] = {
},
["parent"] = "德鲁伊（60plus，by 露露緹婭@Bilibili）1005更",
["uid"] = "vG3HWvzVpPQ",
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["selfPoint"] = "CENTER",
},
["割伤"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["parent"] = "Core - Druid",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = true,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"414644",
},
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["type"] = "aura2",
["matchesShowOn"] = "showAlways",
["subeventPrefix"] = "SPELL",
["unit"] = "target",
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"5487",
"9634",
},
["unit"] = "player",
["ownOnly"] = true,
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%s",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_color"] = {
1,
0.86274509803922,
0.62745098039216,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 22,
["anchorXOffset"] = 0,
["text_anchorYOffset"] = -4,
},
},
["height"] = 48,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 33745,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["source"] = "import",
["progressSource"] = {
-1,
"",
},
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["adjustedMax"] = "",
["cooldown"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["authorOptions"] = {
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["xOffset"] = 0,
["uid"] = "ffDhViEpkax",
["anchorFrameParent"] = false,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.8",
["tocversion"] = 11500,
["id"] = "割伤",
["zoom"] = 0.3,
["frameStrata"] = 1,
["width"] = 48,
["alpha"] = 1,
["config"] = {
},
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 1,
},
{
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
},
{
["value"] = "0",
["op"] = "==",
["variable"] = "matchCount",
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = {
1,
1,
1,
0.5,
},
["property"] = "color",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["color"] = {
1,
1,
1,
1,
},
},
["阳炎术（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["type"] = "aura2",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["unit"] = "target",
["ownOnly"] = true,
["auranames"] = {
"414684",
},
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 0,
["use_hostility"] = true,
["use_genericShowOn"] = true,
["use_itemName"] = true,
["unit"] = "target",
["event"] = "Unit Characteristics",
["hostility"] = "hostile",
["use_unit"] = true,
["genericShowOn"] = "showOnCooldown",
["type"] = "unit",
["use_attackable"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowType"] = "Pixel",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
0,
0,
1,
},
["glowThickness"] = 3,
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 38,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["zoneIds"] = "",
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spellknown"] = 414684,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 38,
["source"] = "import",
["cooldownEdge"] = true,
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["xOffset"] = 0,
["config"] = {
},
["authorOptions"] = {
},
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "阳炎术（符文）",
["semver"] = "2.0.8",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "2do1mRIJ)nq",
["inverse"] = false,
["parent"] = "德鲁伊 动态分组 右",
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 1,
},
{
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
},
{
["value"] = "0",
["op"] = "==",
["variable"] = "matchCount",
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = {
1,
1,
1,
0.5,
},
["property"] = "color",
},
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = true,
["property"] = "sub.2.useGlowColor",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["icon"] = true,
},
["生命绽放（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = true,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["useName"] = true,
["spellIds"] = {
},
["auranames"] = {
"408124",
},
["ownOnly"] = true,
["unit"] = "target",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["unit"] = "player",
["auranames"] = {
"768",
"5487",
"9634",
},
["ownOnly"] = true,
["matchesShowOn"] = "showOnMissing",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%s",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_color"] = {
1,
0.86274509803922,
0.62745098039216,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 22,
["anchorXOffset"] = 0,
["text_anchorYOffset"] = -4,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["spellknown"] = 408124,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "Core - Druid",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["uid"] = "oNnYT)QpSiA",
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "生命绽放（符文）",
["semver"] = "2.0.8",
["useCooldownModRate"] = true,
["width"] = 48,
["zoom"] = 0.3,
["config"] = {
},
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 1,
},
{
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
},
{
["value"] = "0",
["op"] = "==",
["variable"] = "matchCount",
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = {
1,
1,
1,
0.5,
},
["property"] = "color",
},
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
},
["Rage Bar - Druid"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["xOffset"] = 0,
["preferToUpdate"] = false,
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["backgroundColor"] = {
0,
0,
0,
0.30000001192093,
},
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["selfPoint"] = "TOP",
["barColor"] = {
0.8,
0.13333333333333,
0.062745098039216,
1,
},
["desaturate"] = false,
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["role"] = {
["multi"] = {
},
},
["use_spec"] = true,
["size"] = {
["multi"] = {
},
},
["pvptalent"] = {
},
["spec"] = {
["single"] = 3,
["multi"] = {
true,
},
},
["zoneIds"] = "",
},
["toolTipArea"] = "ICON",
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["overlayclip"] = true,
["texture"] = "Solid",
["zoom"] = 0,
["spark"] = false,
["tocversion"] = 11500,
["alpha"] = 1,
["uid"] = "wzGOW8i)ajg",
["sparkOffsetX"] = 0,
["wagoID"] = "Ner0rxotC",
["parent"] = "Resources - Druid",
["adjustedMin"] = "",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["duration"] = "1",
["unevent"] = "auto",
["unit"] = "player",
["use_absorbMode"] = true,
["use_showCost"] = true,
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
["powertype"] = 1,
["spellIds"] = {
},
["event"] = "Power",
["names"] = {
},
["subeventPrefix"] = "SPELL",
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["debuffType"] = "HELPFUL",
["auranames"] = {
"5487",
"9634",
},
["useName"] = true,
["duration"] = "1",
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["realSpellName"] = 192081,
["use_spellName"] = true,
["unevent"] = "auto",
["ownOnly"] = true,
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["use_track"] = true,
["spellName"] = 192081,
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["isPrimaryResource"] = true,
["version"] = 28,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_shadowXOffset"] = 1,
["text_text"] = "%p",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = true,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_format"] = "timed",
["anchorXOffset"] = 0,
["type"] = "subtext",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_format"] = 0,
["text_shadowYOffset"] = -1,
["text_text_format_1.percentpower_format"] = "none",
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["anchorYOffset"] = 0,
["text_visible"] = true,
["anchor_point"] = "INNER_CENTER",
["text_fontSize"] = 20,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_precision"] = 1,
},
},
["height"] = 20,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["source"] = "import",
["auto"] = true,
["barColor2"] = {
1,
1,
0,
1,
},
["icon_side"] = "RIGHT",
["authorOptions"] = {
},
["overlays"] = {
{
0,
0,
0,
0.40000003576279,
},
},
["sparkHeight"] = 30,
["config"] = {
},
["actions"] = {
["start"] = {
["do_message"] = false,
},
["init"] = {
["custom"] = "aura_env.region.configGroup = \"rage_bar\"",
["do_custom"] = true,
},
["finish"] = {
},
},
["sparkColor"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.25",
["icon"] = false,
["id"] = "Rage Bar - Druid",
["width"] = 405,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["sparkHidden"] = "NEVER",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["inverse"] = false,
["configGroup"] = "rage_bar",
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
},
["General Options - Druid"] = {
["iconSource"] = 0,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
{
["useName"] = true,
["type"] = "header",
["text"] = "Global Settings",
["width"] = 1,
},
{
["subOptions"] = {
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["softMin"] = 0,
["type"] = "range",
["bigStep"] = 1,
["max"] = 10,
["step"] = 1,
["width"] = 1,
["min"] = 0,
["key"] = "border_size",
["softMax"] = 10,
["useDesc"] = false,
["name"] = "Border Size",
["default"] = 0,
},
{
["softMin"] = 0,
["type"] = "range",
["bigStep"] = 1,
["max"] = 100,
["step"] = 1,
["width"] = 1,
["min"] = 0,
["key"] = "zoom",
["softMax"] = 100,
["useDesc"] = false,
["name"] = "Icon Zoom",
["default"] = 30,
},
{
["type"] = "color",
["key"] = "border_color",
["default"] = {
0,
0,
0,
1,
},
["useDesc"] = false,
["name"] = "Border Color",
["width"] = 1,
},
{
["type"] = "toggle",
["key"] = "apply_border",
["default"] = true,
["useDesc"] = false,
["name"] = "Apply Border to Resources",
["width"] = 1,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["width"] = 1,
["useCollapse"] = true,
["collapse"] = true,
["name"] = "Global Style",
["key"] = "style",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
{
["subOptions"] = {
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["softMin"] = 0,
["type"] = "range",
["bigStep"] = 0.05,
["max"] = 1,
["step"] = 0.05,
["width"] = 2,
["min"] = 0,
["key"] = "alpha",
["desc"] = "Change the alpha of the groups when out of combat.",
["softMax"] = 1,
["useDesc"] = true,
["name"] = "Out of Combat Alpha",
["default"] = 1,
},
{
["type"] = "toggle",
["default"] = true,
["desc"] = "Enable to show full opacity on enemy target.",
["key"] = "ignore_enemy",
["useDesc"] = true,
["name"] = "Ignore on Enemy Target",
["width"] = 1,
},
{
["type"] = "toggle",
["default"] = true,
["desc"] = "Enable to show full opacity on friendly target.",
["key"] = "ignore_friendly",
["useDesc"] = true,
["name"] = "Ignore on Friendly Target",
["width"] = 1,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["width"] = 1,
["useCollapse"] = true,
["collapse"] = true,
["name"] = "Out of Combat Alpha",
["key"] = "ooc_alpha",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
{
["useName"] = true,
["type"] = "header",
["text"] = "Icons Size & Spacing",
["width"] = 1,
},
{
["subOptions"] = {
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["softMin"] = 16,
["type"] = "range",
["bigStep"] = 2,
["max"] = 72,
["step"] = 2,
["width"] = 1,
["min"] = 16,
["key"] = "width",
["softMax"] = 72,
["useDesc"] = false,
["name"] = "Width",
["default"] = 48,
},
{
["softMin"] = 8,
["type"] = "range",
["bigStep"] = 2,
["max"] = 72,
["step"] = 2,
["width"] = 1,
["min"] = 8,
["key"] = "height",
["softMax"] = 72,
["useDesc"] = false,
["name"] = "Height",
["default"] = 48,
},
{
["softMin"] = 0,
["type"] = "range",
["bigStep"] = 1,
["max"] = 20,
["step"] = 1,
["width"] = 1,
["min"] = 0,
["key"] = "spacing",
["softMax"] = 20,
["useDesc"] = false,
["name"] = "Spacing",
["default"] = 3,
},
{
["softMin"] = 4,
["type"] = "range",
["bigStep"] = 1,
["max"] = 12,
["step"] = 1,
["width"] = 1,
["min"] = 4,
["key"] = "nb",
["softMax"] = 12,
["useDesc"] = false,
["name"] = "Number of Icons",
["default"] = 8,
},
{
["type"] = "select",
["values"] = {
"Above Main Icons",
"Below Main Icons",
},
["default"] = 2,
["key"] = "resources_position",
["useDesc"] = false,
["name"] = "Resources Position",
["width"] = 1,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["width"] = 1,
["useCollapse"] = true,
["collapse"] = true,
["name"] = "Main Icons",
["key"] = "primary",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
{
["subOptions"] = {
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["softMin"] = 16,
["type"] = "range",
["bigStep"] = 2,
["max"] = 72,
["step"] = 2,
["width"] = 1,
["min"] = 16,
["key"] = "width",
["softMax"] = 72,
["useDesc"] = false,
["name"] = "Width",
["default"] = 32,
},
{
["softMin"] = 8,
["type"] = "range",
["bigStep"] = 2,
["max"] = 72,
["step"] = 2,
["width"] = 1,
["min"] = 8,
["key"] = "height",
["softMax"] = 72,
["useDesc"] = false,
["name"] = "Height",
["default"] = 32,
},
{
["softMin"] = 0,
["type"] = "range",
["bigStep"] = 1,
["max"] = 20,
["step"] = 1,
["width"] = 1,
["min"] = 0,
["key"] = "spacing",
["softMax"] = 20,
["useDesc"] = false,
["name"] = "Spacing",
["default"] = 3,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["width"] = 1,
["useCollapse"] = true,
["collapse"] = true,
["name"] = "Secondary Icons",
["key"] = "secondary",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
{
["subOptions"] = {
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["softMin"] = 16,
["type"] = "range",
["bigStep"] = 2,
["max"] = 72,
["step"] = 2,
["width"] = 1,
["min"] = 16,
["key"] = "width",
["softMax"] = 72,
["useDesc"] = false,
["name"] = "Width",
["default"] = 34,
},
{
["softMin"] = 8,
["type"] = "range",
["bigStep"] = 2,
["max"] = 72,
["step"] = 2,
["width"] = 1,
["min"] = 8,
["key"] = "height",
["softMax"] = 72,
["useDesc"] = false,
["name"] = "Height",
["default"] = 34,
},
{
["softMin"] = 0,
["type"] = "range",
["bigStep"] = 1,
["max"] = 20,
["step"] = 1,
["width"] = 1,
["min"] = 0,
["key"] = "spacing",
["softMax"] = 20,
["useDesc"] = false,
["name"] = "Spacing",
["default"] = 3,
},
{
["softMin"] = 0,
["type"] = "range",
["bigStep"] = 1,
["max"] = 200,
["step"] = 1,
["width"] = 1,
["min"] = 0,
["key"] = "margin",
["softMax"] = 50,
["useDesc"] = false,
["name"] = "Bottom Margin",
["default"] = 10,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["width"] = 1,
["useCollapse"] = true,
["collapse"] = true,
["name"] = "Dynamic Icons",
["key"] = "dynamic",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
{
["subOptions"] = {
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["softMin"] = 16,
["type"] = "range",
["bigStep"] = 2,
["max"] = 72,
["step"] = 2,
["width"] = 1,
["min"] = 16,
["key"] = "width",
["softMax"] = 72,
["useDesc"] = false,
["name"] = "Width",
["default"] = 36,
},
{
["softMin"] = 8,
["type"] = "range",
["bigStep"] = 2,
["max"] = 72,
["step"] = 2,
["width"] = 1,
["min"] = 8,
["key"] = "height",
["softMax"] = 72,
["useDesc"] = false,
["name"] = "Height",
["default"] = 36,
},
{
["softMin"] = 0,
["type"] = "range",
["bigStep"] = 1,
["max"] = 20,
["step"] = 1,
["width"] = 1,
["min"] = 0,
["key"] = "spacing",
["softMax"] = 20,
["useDesc"] = false,
["name"] = "Spacing",
["default"] = 3,
},
{
["softMin"] = 0,
["type"] = "range",
["bigStep"] = 1,
["max"] = 200,
["step"] = 1,
["width"] = 1,
["min"] = 0,
["key"] = "margin",
["softMax"] = 50,
["useDesc"] = false,
["name"] = "Side Margin",
["default"] = 3,
},
{
["type"] = "toggle",
["key"] = "grow_horizontal",
["default"] = false,
["useDesc"] = false,
["name"] = "Grow Horizontally",
["width"] = 1,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["width"] = 1,
["useCollapse"] = true,
["collapse"] = true,
["name"] = "Side Icons",
["key"] = "side",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
{
["subOptions"] = {
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["type"] = "description",
["text"] = "Please take note that all maintenance icons will be hidden while in a rested area out of combat no matter what behavior is selected. To see the normal behavior, leave the rested area or simply enter combat.",
["fontSize"] = "medium",
["width"] = 2,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 1,
["width"] = 2,
["useHeight"] = true,
},
{
["type"] = "header",
["useName"] = true,
["text"] = "Icon Size & Spacing",
["noMerge"] = true,
["width"] = 1,
},
{
["softMin"] = 16,
["type"] = "range",
["bigStep"] = 2,
["max"] = 72,
["step"] = 2,
["width"] = 1,
["min"] = 16,
["key"] = "width",
["softMax"] = 72,
["useDesc"] = false,
["name"] = "Width",
["default"] = 36,
},
{
["softMin"] = 8,
["type"] = "range",
["bigStep"] = 2,
["max"] = 72,
["step"] = 2,
["width"] = 1,
["min"] = 8,
["key"] = "height",
["softMax"] = 72,
["useDesc"] = false,
["name"] = "Height",
["default"] = 36,
},
{
["softMin"] = 0,
["type"] = "range",
["bigStep"] = 1,
["max"] = 20,
["step"] = 1,
["width"] = 1,
["min"] = 0,
["key"] = "spacing",
["softMax"] = 20,
["useDesc"] = false,
["name"] = "Spacing",
["default"] = 3,
},
{
["softMin"] = 0,
["type"] = "range",
["bigStep"] = 1,
["max"] = 200,
["step"] = 1,
["width"] = 1,
["min"] = 0,
["key"] = "margin",
["softMax"] = 50,
["useDesc"] = false,
["name"] = "Top Margin",
["default"] = 10,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["width"] = 1,
["useCollapse"] = true,
["collapse"] = true,
["name"] = "Maintenance Icons",
["key"] = "maintenance",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
{
["useName"] = true,
["type"] = "header",
["text"] = "Resources",
["width"] = 1,
},
{
["subOptions"] = {
{
["subOptions"] = {
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["softMin"] = 5,
["type"] = "range",
["bigStep"] = 1,
["max"] = 50,
["step"] = 1,
["width"] = 1.25,
["min"] = 5,
["key"] = "height",
["softMax"] = 50,
["useDesc"] = false,
["name"] = "Resource Height",
["default"] = 20,
},
{
["type"] = "select",
["values"] = {
"12345",
"12,3K",
"12345 (100%)",
"12,3K (100%)",
"100%",
},
["default"] = 1,
["key"] = "format",
["useDesc"] = false,
["name"] = "Text Format",
["width"] = 0.75,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["type"] = "header",
["useName"] = true,
["text"] = "Default Color",
["noMerge"] = true,
["width"] = 1,
},
{
["type"] = "color",
["key"] = "color1",
["default"] = {
0.34509803921569,
0.64313725490196,
0.28235294117647,
1,
},
["useDesc"] = false,
["name"] = "Color 1",
["width"] = 1,
},
{
["type"] = "color",
["key"] = "color2",
["default"] = {
0.5843137254902,
0.90588235294118,
0.52156862745098,
1,
},
["useDesc"] = false,
["name"] = "Color 2",
["width"] = 1,
},
{
["type"] = "select",
["values"] = {
"Horizontal",
"Vertical",
"None",
},
["default"] = 1,
["key"] = "gradient",
["useDesc"] = false,
["name"] = "Gradient Direction",
["width"] = 1,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["width"] = 1,
["useCollapse"] = true,
["collapse"] = true,
["name"] = "Health Bar",
["key"] = "health_bar",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
{
["subOptions"] = {
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["softMin"] = 5,
["type"] = "range",
["bigStep"] = 1,
["max"] = 50,
["step"] = 1,
["width"] = 1.25,
["min"] = 5,
["key"] = "height",
["softMax"] = 50,
["useDesc"] = false,
["name"] = "Resource Height",
["default"] = 20,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
{
["type"] = "header",
["useName"] = true,
["text"] = "Default Color",
["noMerge"] = true,
["width"] = 1,
},
{
["type"] = "color",
["key"] = "color1",
["default"] = {
0.52941176470588,
0.090196078431373,
0.090196078431373,
1,
},
["useDesc"] = false,
["name"] = "Color 1",
["width"] = 1,
},
{
["type"] = "color",
["key"] = "color2",
["default"] = {
0.77647058823529,
0.1843137254902,
0.1843137254902,
1,
},
["useDesc"] = false,
["name"] = "Color 2",
["width"] = 1,
},
{
["type"] = "select",
["values"] = {
"Horizontal",
"Vertical",
"None",
},
["default"] = 1,
["key"] = "gradient",
["useDesc"] = false,
["name"] = "Gradient Direction",
["width"] = 1,
},
{
["type"] = "header",
["useName"] = true,
["text"] = "Uninterruptible",
["noMerge"] = true,
["width"] = 1,
},
{
["type"] = "color",
["key"] = "unint_color1",
["default"] = {
0.52549019607843,
0.52549019607843,
0.52549019607843,
0.90000000596046,
},
["useDesc"] = false,
["name"] = "Color 1",
["width"] = 1,
},
{
["type"] = "color",
["key"] = "unint_color2",
["default"] = {
0.70980392156863,
0.70980392156863,
0.70980392156863,
1,
},
["useDesc"] = false,
["name"] = "Color 2",
["width"] = 1,
},
{
["type"] = "select",
["values"] = {
"Horizontal",
"Vertical",
"None",
},
["default"] = 1,
["key"] = "unint_gradient",
["useDesc"] = false,
["name"] = "Gradient Direction",
["width"] = 1,
},
{
["type"] = "space",
["variableWidth"] = true,
["height"] = 2,
["width"] = 2,
["useHeight"] = true,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["width"] = 1,
["useCollapse"] = true,
["collapse"] = true,
["name"] = "Cast Bar",
["key"] = "cast_bar",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["collapse"] = false,
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["name"] = "Resources",
["key"] = "resources",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
{
["useName"] = true,
["type"] = "header",
["text"] = "Cast Bar Notice",
["width"] = 1,
},
{
["type"] = "description",
["text"] = "This suite of WeakAuras contains a Casting Bar that will replace the default World of Warcraft casting bar. If you want to remove it, simply select the \"Cast Bar\" aura inside the Resources Group and check \"Never\" in the Load Tab. Once that's done, make sure to \"/reload\".\n\n",
["fontSize"] = "medium",
["width"] = 2,
},
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["event"] = "GTFO",
["unit"] = "player",
["custom_hide"] = "timed",
["events"] = "OPTIONS,PLAYER_ENTERING_WORLD,PLAYER_SPECIALIZATION_CHANGED,UPDATE_SHAPESHIFT_FORM,PLAYER_TALENT_UPDATE,PLAYER_PVP_TALENT_UPDATE,PLAYER_LEVEL_UP,UNIT_PET,UNIT_ENTERED_VEHICLE,UNIT_EXITED_VEHICLE,UNIT_HEALTH,CINEMATIC_STOP,STOP_MOVIE,CLIENT_SCENE_CLOSED,LWA_UPDATE_BAR",
["custom"] = "function(event, ...)\n    local arg1, arg2 = ...\n    local LWA = LWA[aura_env.CLASS]\n    local valid = false\n    \n    if \"OPTIONS\" == event then\n        LWA.ThrottledInit()\n        \n    elseif \"PLAYER_ENTERING_WORLD\" == event and (arg1 or arg2) then\n        C_Timer.After(0.05, LWA.Init)\n        C_Timer.After(1, LWA.ThrottledInit)\n        \n    elseif \"UNIT_PET\" == event or \"UNIT_ENTERED_VEHICLE\" == event or \"UNIT_EXITED_VEHICLE\" == event then\n        valid = (\"player\" == arg1)\n        \n    elseif \"UNIT_HEALTH\" == event then\n        valid = (\"pet\" == arg1)\n        \n    elseif \"LWA_UPDATE_BAR\" == event and arg1 then\n        LWA.UpdateBar(...)\n    else\n        valid = true\n    end\n    \n    if valid then\n        C_Timer.After(0.05, LWA.UpdateResources)\n    end\nend",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["custom_type"] = "event",
["spellIds"] = {
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["event"] = "GTFO",
["unit"] = "player",
["custom_hide"] = "timed",
["events"] = "PLAYER_ENTERING_WORLD,PLAYER_REGEN_ENABLED,PLAYER_REGEN_DISABLED,PLAYER_TARGET_CHANGED,PLAYER_ALIVE,PLAYER_DEAD,PLAYER_UNGHOST,BARBER_SHOP_OPEN,BARBER_SHOP_CLOSE,OPTIONS",
["custom"] = "function(event, ...)\n    if not aura_env.parentFrame then\n        aura_env.parentFrame = WeakAuras.GetRegion(aura_env.parent)\n    end\n    \n    local frame = aura_env.parentFrame\n    \n    if frame then\n        local alpha = 1\n        \n        if \"BARBER_SHOP_OPEN\" == event then\n            alpha = 0\n        else\n            local cfg = LWA[aura_env.CLASS].GetConfig(\"ooc_alpha\")\n            \n            if not UnitAffectingCombat(\"player\") then\n                alpha = cfg.alpha\n            end\n            \n            if UnitExists(\"target\") then\n                local isEnemy = UnitCanAttack(\"player\", \"target\") or UnitIsEnemy(\"player\", \"target\")\n                \n                if (not isEnemy and cfg.ignore_friendly) or (isEnemy and cfg.ignore_enemy) then\n                    alpha = 1\n                end\n            end\n        end\n        \n        frame:SetAlpha(alpha)\n        \n        return true\n    end\n    \n    return false\nend",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["custom_type"] = "event",
["spellIds"] = {
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "custom",
["events"] = "STATUS",
["custom_type"] = "status",
["check"] = "event",
["unit"] = "player",
["custom"] = "function()\n    local LWA = LWA[aura_env.CLASS]\n    \n    LWA.ThrottledInit()\n    C_Timer.After(1, LWA.Init)\nend",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["use_alwaystrue"] = true,
["unit"] = "player",
["debuffType"] = "HELPFUL",
["event"] = "Conditions",
["use_unit"] = true,
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = false,
["selfPoint"] = "TOP",
["desaturate"] = false,
["version"] = 28,
["subRegions"] = {
{
["type"] = "subbackground",
},
},
["height"] = 48,
["load"] = {
["use_class"] = true,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["width"] = 405,
["source"] = "import",
["parent"] = "德鲁伊（中心分组，by 露露緹婭@Bilibili）",
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "local local_env = aura_env\nlocal CLASS = local_env.id:gsub(\"General Options %- \", \"\")\nlocal_env.CLASS = CLASS\n\nLWA = LWA or {}\nLWA[CLASS] = LWA[CLASS] or {}\n\nlocal LWA = LWA[CLASS]\n\nLWA.config = nil\nLWA.configs = LWA.configs or {}\nLWA.configs[\"general\"] = local_env.config\n\nLWA.CLASS = CLASS\nLWA.MAX_WIDTH = 405\nLWA.RESOURCES_HEIGHT = 0\n\nlocal CLASS_GROUP = \"Luxthos - \" .. CLASS\nlocal CLASS_OPTIONS = \"Class Options - \" .. CLASS\nlocal CORE_GROUP = \"Core - \" .. CLASS\nlocal RESOURCES_GROUP = \"Resources - \" .. CLASS\nlocal DYNAMIC_EFFECTS_GROUP = \"Dynamic Effects - \" .. CLASS\nlocal DYNAMIC_SPELLS_GROUP = \"Dynamic Spells - \" .. CLASS\nlocal LEFT_SIDE_GROUP = \"Left Side - \" .. CLASS\nlocal RIGHT_SIDE_GROUP = \"Right Side - \" .. CLASS\nlocal MAINTENANCE_GROUP = \"Maintenance - \" .. CLASS\nlocal CAST_BAR = \"Cast Bar - \" .. CLASS\n\nlocal_env.parent = CLASS_GROUP\nlocal nbCore = 8\nlocal resources\n\nlocal function tclone(t1)\n    local t = {}\n    \n    if t1 then\n        for k, v in pairs(t1) do\n            if \"table\" == type(v) then\n                v = tclone(v)\n            end\n            \n            if \"string\" == type(k) then\n                t[k] = v\n            else\n                tinsert(t, v)\n            end\n        end\n    end\n    \n    return t\nend\n\nlocal function tmerge(...)\n    local ts = {...}\n    local t = tclone(ts[1])\n    local t2\n    \n    for i = 2, #ts do\n        t2 = ts[i] or {}\n        \n        for k, v in pairs(t2) do\n            if \"table\" == type(v) then\n                v = tclone(v)\n                \n                if t[k] and #t[k] == 0 then\n                    t[k] = tmerge(t[k], v)\n                else\n                    t[k] = v\n                end\n            else\n                t[k] = v\n            end\n        end\n    end\n    \n    return t\nend\n\nlocal function SetRegionSize(r, w, h)\n    r:SetRegionWidth(w)\n    r:SetRegionHeight(h)\nend\n\nlocal function ResizeAnchorFrame()\n    local config = LWA.GetConfig()\n    local h = 0\n    local cr = WeakAuras.GetRegion(CORE_GROUP)\n    \n    if cr and cr:IsVisible() then\n        h = cr:GetHeight()\n        \n        if config.primary.resources_position == 1 then -- Above\n            h = h + config.primary.spacing + LWA.RESOURCES_HEIGHT\n        end\n    end\n    \n    if 1 == h % 2 then\n        h = h + 1\n    end\n    \n    SetRegionSize(local_env.region, LWA.MAX_WIDTH, max(1, h, config.primary.height + config.primary.spacing + LWA.RESOURCES_HEIGHT))\n    \n    local g = WeakAuras.GetRegion(g)\n    \n    if g then\n        g:PositionChildren()\n        \n        if 0 == #g.sortedChildren then\n            g:SetHeight(configs[i].height)\n            g.currentHeight = configs[i].height\n        end\n    end\nend\n\nfunction LWA.GetConfig(grp, force)\n    local default = {\n        style = {\n            border_size = 0,\n            border_color = { [1] = 0, [2] = 0, [3] = 0, [4] = 1 },\n            apply_border = true,\n            zoom = 30,\n        },\n        primary = {\n            nb = 8,\n            width = 48,\n            height = 48,\n            spacing = 0,\n            resources_position = 2, -- Below\n        },\n        secondary = {\n            width = 38,\n            height = 38,\n            spacing = 0,\n        },\n        dynamic = {\n            width = 38,\n            height = 38,\n            spacing = 0,\n            margin = 10,\n        },\n        side = {\n            width = 36,\n            height = 36,\n            spacing = 0,\n            margin = 3,\n            grow_horizontal = 0,\n        },\n        maintenance = {\n            width = 36,\n            height = 36,\n            spacing = 0,\n            margin = 10,\n        },\n        ooc_alpha = {\n            alpha = 1,\n            ignore_enemy = true,\n            ignore_friendly = true,\n        },\n        resources = {\n            health_bar = {\n                format = 1\n            },\n            mana_bar = {\n                format = 1\n            }\n        },\n    }\n    \n    if force or not LWA.config or WeakAuras.IsOptionsOpen() then\n        LWA.config = tmerge(\n            default,\n            LWA.configs[\"general\"],\n            LWA.configs[\"class\"] or {}\n        )\n    end\n    \n    if grp then\n        return LWA.config[grp] or {}\n    end\n    \n    return LWA.config\nend\n\nlocal throttledInitHandler = nil\nlocal initLastRun = 0\n\nfunction LWA.ThrottledInit()\n    if throttledInitHandler then return end\n    \n    local currentTime = time()\n    \n    if WeakAuras.IsImporting() then\n        throttledInitHandler = C_Timer.NewTimer(2, LWA.ThrottledInit)\n        \n    elseif initLastRun <= currentTime - 0.2 then\n        throttledInitHandler = C_Timer.NewTimer(0.05, LWA.Init)\n    else\n        throttledInitHandler = C_Timer.NewTimer(max(0.05, currentTime - initLastRun), LWA.Init)\n    end\nend\n\nfunction LWA.Init()\n    if WeakAuras.IsImporting() then return end\n    \n    initLastRun = time()\n    \n    local config = LWA.GetConfig(nil, true)\n    local isOptionsOpen = WeakAuras.IsOptionsOpen()\n    local zoom = config.style.zoom / 100\n    \n    if throttledInitHandler then\n        throttledInitHandler:Cancel()\n        throttledInitHandler = nil\n    end\n    \n    if not local_env.parentFrame then\n        local_env.parentFrame = WeakAuras.GetRegion(CLASS_GROUP)\n    end\n    \n    if local_env.parentFrame and not local_env.parentFrame.SetRealScale then\n        local_env.parentFrame.SetRealScale = local_env.parentFrame.SetScale\n        \n        local_env.parentFrame.SetScale = function(self, scale)\n            local_env.parentFrame:SetRealScale(scale)\n            local castBar = WeakAuras.GetRegion(CAST_BAR)\n            \n            if castBar then\n                castBar:SetScale(scale)\n            end\n        end\n    end\n    \n    if isOptionsOpen then\n        nbCore = config.primary.nb\n    else\n        nbCore = max(4, min(nbCore, config.primary.nb))\n    end\n    \n    LWA.MAX_WIDTH = nbCore * (config.primary.width + config.primary.spacing) - config.primary.spacing\n    \n    local function InitIcons(group, c, selfPoint)\n        local grpRegion = WeakAuras.GetRegion(group)\n        \n        if not grpRegion then return end\n        \n        local i, isAbilities = 0, CORE_GROUP == group\n        \n        for childId, regions in pairs(grpRegion.controlledChildren) do\n            local region = regions[\"\"] and regions[\"\"].regionData.region\n            \n            i = i + 1\n            \n            if region then\n                region:SetAnchor(selfPoint, region.relativeTo, region.relativePoint)\n                \n                if region.SetZoom then\n                    region:SetZoom(min(1, zoom + (region.extraZoom or 0)))\n                else\n                    print(\"LWA Issue: \" .. CLASS .. \" > \" .. group .. \" > \" .. childId)\n                end\n                \n                if isAbilities and i > nbCore then\n                    SetRegionSize(region, config.secondary.width, config.secondary.height)\n                else\n                    SetRegionSize(region, c.width, c.height)\n                end\n                \n                LWA.UpdateBorder(region)\n            end\n        end\n        \n        if isAbilities then\n            grpRegion:PositionChildren()\n            \n            if not isOptionsOpen then\n                nbCore = max(4, min(#grpRegion.sortedChildren, config.primary.nb))\n                \n                LWA.MAX_WIDTH = nbCore * (config.primary.width + config.primary.spacing) - config.primary.spacing\n            end\n            \n            local_env.region:SetRegionWidth(LWA.MAX_WIDTH)\n        end\n    end\n    \n    InitIcons(CORE_GROUP, config.primary, \"TOP\")\n    InitIcons(LEFT_SIDE_GROUP, config.side, \"TOPRIGHT\")\n    InitIcons(RIGHT_SIDE_GROUP, config.side, \"TOPLEFT\")\n    InitIcons(MAINTENANCE_GROUP, config.maintenance, \"TOP\")\n    InitIcons(DYNAMIC_EFFECTS_GROUP, config.dynamic, \"BOTTOMLEFT\")\n    InitIcons(DYNAMIC_SPELLS_GROUP, config.dynamic, \"BOTTOMRIGHT\")\n    \n    LWA.UpdateResources()\n    \n    for i, g in ipairs({ DYNAMIC_EFFECTS_GROUP, DYNAMIC_SPELLS_GROUP, LEFT_SIDE_GROUP, RIGHT_SIDE_GROUP }) do\n        g = WeakAuras.GetRegion(g)\n        \n        if g then\n            g:PositionChildren()\n        end\n    end\nend\n\nhooksecurefunc(\"SetUIVisibility\", function(isVisible)\n        if isVisible and LWA.ThrottledInit then\n            LWA.ThrottledInit()\n        end\nend)\n\nfunction LWA.UpdateResources()\n    if WeakAuras.IsImporting() then return end\n    \n    local config = LWA.GetConfig()\n    \n    local totalHeight, nb = 0, 0\n    local h1 = config.primary.height\n    local s1 = config.primary.spacing\n    local y = 0\n    local grpRegion = WeakAuras.GetRegion(RESOURCES_GROUP)\n    \n    if not resources then\n        local grpData = WeakAuras.GetData(RESOURCES_GROUP)\n        \n        resources = grpData and grpData.controlledChildren\n    end\n    \n    if grpRegion and resources and #resources > 0 then\n        if config.primary.resources_position == 2 then -- Below\n            y = h1 + s1\n        end\n        \n        grpRegion:SetOffset(0, -y)\n        \n        local isOptionsOpen = WeakAuras.IsOptionsOpen()\n        \n        local resData, resRegion, isVisible, regionType\n        local w, h = 0, 0\n        \n        local function InitResource(region, index, nb)\n            if not region then return end\n            \n            index = max(1, index or 1)\n            nb = max(1, nb or 1)\n            \n            w, h = LWA.MAX_WIDTH, 20\n            \n            if nb > 1 then\n                local s = config.primary.spacing\n                \n                w = (w + s) / nb - s\n            end\n            \n            local cg = region.configGroup\n            \n            if cg and config.resources[cg] then\n                h = config.resources[cg].height or 20\n            end\n            \n            SetRegionSize(region, w, h)\n            region.bar:Update()\n            LWA.UpdateBorder(region, true)\n            LWA.UpdateBar({ region = region }, index, nb)\n            \n            if region.bar.spark then\n                region.bar.spark:SetHeight(max(15, Round(h * 2)))\n            end\n        end\n        \n        y = 0\n        \n        for _, resId in ipairs(resources) do\n            resRegion = WeakAuras.GetRegion(resId)\n            \n            if resRegion then\n                isVisible = isOptionsOpen or resRegion:IsVisible()\n                regionType = resRegion.regionType\n                h = 0\n                \n                if \"aurabar\" == regionType then\n                    InitResource(resRegion)\n                    \n                elseif \"dynamicgroup\" == regionType then\n                    local nbChild = 0\n                    local childRegions = {}\n                    \n                    for _, region in pairs(resRegion.controlledChildren) do\n                        if region and region[\"\"] then\n                            nbChild = nbChild + 1\n                            \n                            childRegions[region[\"\"].regionData.dataIndex] = region[\"\"].regionData.region\n                        end\n                    end\n                    \n                    if not isOptionsOpen and childRegions[1] then\n                        isVisible = childRegions[1]:IsVisible()\n                    end\n                    \n                    for i, region in ipairs(childRegions) do\n                        InitResource(region, i, nbChild)\n                        \n                        region:SetYOffset(-y)\n                    end\n                end\n                \n                if isVisible then\n                    nb = nb + 1\n                    \n                    if isVisible then\n                        if \"dynamicgroup\" == regionType then\n                            resRegion:PositionChildren()\n                        else\n                            resRegion:SetOffset(0, -y)\n                        end\n                    end\n                    \n                    totalHeight = totalHeight + h\n                    y = y + h + s1\n                end\n            end\n        end\n        \n        LWA.RESOURCES_HEIGHT = totalHeight + max(nb - 1, 0) * config.primary.spacing\n    end\n    \n    grpRegion = WeakAuras.GetRegion(CORE_GROUP)\n    \n    if grpRegion then\n        grpRegion:DoPositionChildren()\n    end\n    \n    ResizeAnchorFrame()\n    \n    local castBar = WeakAuras.GetRegion(CAST_BAR)\n    \n    if castBar then\n        castBar:SetParent(UIParent)\n        \n        if local_env.parentFrame then\n            castBar:SetScale(local_env.parentFrame:GetScale())\n        end\n    end\n    \n    grpRegion = WeakAuras.GetRegion(MAINTENANCE_GROUP)\n    \n    if grpRegion then\n        grpRegion:DoPositionChildren()\n    end\n    \n    C_Timer.After(0.1, ResizeAnchorFrame)\nend\n\nfunction LWA.GrowCore(newPositions, activeRegions)\n    local nb = #activeRegions\n    \n    if nb <= 0 then\n        C_Timer.After(0.125, ResizeAnchorFrame)\n        \n        return\n    end\n    \n    local config = LWA.GetConfig()\n    \n    local w1 = config.primary.width\n    local h1 = config.primary.height\n    local s1 = config.primary.spacing\n    \n    \n    local maxCore = min(nb, config.primary.nb)\n    local x, y\n    local xOffset = ((maxCore - 1) * (w1 + s1) / 2)\n    local yOffset = 0\n    \n    if not WeakAuras.IsOptionsOpen() then\n        nbCore = max(4, maxCore)\n        \n        LWA.MAX_WIDTH = nbCore * (w1 + s1) - s1\n        \n        ResizeAnchorFrame()\n    end\n    \n    if config.primary.resources_position == 1 then  -- Above\n        yOffset = LWA.RESOURCES_HEIGHT + s1\n    end\n    \n    for i, regionData in ipairs(activeRegions) do\n        x = (i - 1) * (w1 + s1) - xOffset\n        y = -yOffset\n        \n        SetRegionSize(regionData.region, w1, h1)\n        \n        newPositions[i] = { x, y }\n        \n        if i == maxCore then break end\n    end\n    \n    local maxSecondary = nb - maxCore\n    \n    if maxSecondary > 0 then\n        local w2 = config.secondary.width\n        local h2 = config.secondary.height\n        local s2 = config.secondary.spacing\n        \n        local nbPerRow = math.floor((LWA.MAX_WIDTH + s2) / (w2 + s2)) or 1\n        local yOffset = yOffset + h1 - h2 + max(s1, s2) - s2\n        local i2, m\n        \n        if config.primary.resources_position == 2 then -- Below\n            yOffset = yOffset + LWA.RESOURCES_HEIGHT + s1\n        end\n        \n        for i, regionData in ipairs(activeRegions) do\n            if i > maxCore then\n                i2 = i - maxCore\n                m = (i2 % nbPerRow)\n                \n                if m == 1 then\n                    xOffset = (min(maxSecondary - i + maxCore, nbPerRow - 1)) * (w2 + s2) / 2\n                    yOffset = yOffset + h2 + s2\n                end\n                \n                if m == 0 then\n                    m = nbPerRow\n                end\n                \n                x = (m - 1) * (w2 + s2) - xOffset\n                y = -yOffset\n                \n                SetRegionSize(regionData.region, w2, h2)\n                \n                newPositions[i] = { x, y }\n            end\n        end\n    end\n    \n    C_Timer.After(0.125, ResizeAnchorFrame)\nend\n\nfunction LWA.GrowDynamicEffects(newPositions, activeRegions)\n    local nb = #activeRegions\n    \n    if nb <= 0 then return end\n    \n    local config = LWA.GetConfig()\n    \n    local w = config.dynamic.width\n    local h = config.dynamic.height\n    local s1 = config.primary.spacing\n    local s2 = config.dynamic.spacing\n    \n    local xOffset = 0\n    local yOffset = config.dynamic.margin + max(s1, s2) - s2 - h\n    local nbPerRow, m = math.floor(((LWA.MAX_WIDTH / 2) + s2) / (w + s2)) or 1\n    \n    for i, regionData in ipairs(activeRegions) do\n        m = (i % nbPerRow)\n        \n        if m == 1 then\n            xOffset = 0\n            yOffset = yOffset + h + s2\n        end\n        \n        if m == 0 then\n            m = nbPerRow\n        end\n        \n        newPositions[i] = { xOffset, yOffset }\n        \n        xOffset = xOffset + w + s2\n    end\nend\n\nfunction LWA.GrowDynamicSpells(newPositions, activeRegions)\n    local nb = #activeRegions\n    \n    if nb <= 0 then return end\n    \n    local config = LWA.GetConfig()\n    \n    local w = config.dynamic.width\n    local h = config.dynamic.height\n    local s1 = config.primary.spacing\n    local s2 = config.dynamic.spacing\n    \n    local xOffset = 0\n    local yOffset = config.dynamic.margin + max(s1, s2) - s2 - h\n    local nbPerRow, m = math.floor(((LWA.MAX_WIDTH / 2) + s2) / (w + s2)) or 1\n    \n    for i, regionData in ipairs(activeRegions) do\n        m = (i % nbPerRow)\n        \n        if m == 1 then\n            xOffset = 0\n            yOffset = yOffset + h + s2\n        end\n        \n        if m == 0 then\n            m = nbPerRow\n        end\n        \n        newPositions[i] = { -xOffset, yOffset }\n        \n        xOffset = xOffset + w + s2\n    end\nend\n\nfunction LWA.GrowLeftSide(newPositions, activeRegions)\n    local nb = #activeRegions\n    \n    if nb <= 0 then return end\n    \n    local config = LWA.GetConfig()\n    \n    local w1 = config.primary.width\n    local h1 = config.primary.height\n    local s1 = config.primary.spacing\n    \n    local w2 = config.side.width\n    local h2 = config.side.height\n    local s2 = config.side.spacing\n    \n    local x, y\n    local xOffset = config.side.margin + max(s1, s2)\n    local yOffset = 0\n    \n    for i, regionData in ipairs(activeRegions) do\n        x = -xOffset\n        y = -yOffset\n        \n        newPositions[i] = { x, y }\n        \n        if config.side.grow_horizontal then\n            xOffset = xOffset + w2 + s2\n        else\n            yOffset = yOffset + h2 + s2\n        end\n    end\nend\n\nfunction LWA.GrowRightSide(newPositions, activeRegions)\n    local nb = #activeRegions\n    \n    if nb <= 0 then return end\n    \n    local config = LWA.GetConfig()\n    \n    local w1 = config.primary.width\n    local h1 = config.primary.height\n    local s1 = config.primary.spacing\n    \n    local w2 = config.side.width\n    local h2 = config.side.height\n    local s2 = config.side.spacing\n    \n    local x, y\n    local xOffset = config.side.margin + max(s1, s2)\n    local yOffset = 0\n    \n    for i, regionData in ipairs(activeRegions) do\n        x = xOffset\n        y = -yOffset\n        \n        newPositions[i] = { x, y }\n        \n        if config.side.grow_horizontal then\n            xOffset = xOffset + w2 + s2\n        else\n            yOffset = yOffset + h2 + s2\n        end\n    end\nend\n\nfunction LWA.GrowMaintenance(newPositions, activeRegions)\n    local nb = #activeRegions\n    \n    if nb <= 0 then return end\n    \n    local config = LWA.GetConfig()\n    \n    local maxCore = min(nb, config.primary.nb)\n    \n    local w1 = config.primary.width\n    local h1 = config.primary.height\n    local s1 = config.primary.spacing\n    \n    local w2 = config.maintenance.width\n    local h2 = config.maintenance.height\n    local s2 = config.maintenance.spacing\n    \n    local x, y\n    local xOffset = (maxCore - 1) * (w1 + s1) / 2\n    local yOffset = config.maintenance.margin + max(s1, s2) - s2 - h2\n    \n    local nbPerRow = math.floor((LWA.MAX_WIDTH + s2) / (w2 + s2)) or 1\n    local m\n    \n    for i, regionData in ipairs(activeRegions) do\n        m = (i % nbPerRow)\n        \n        if m == 1 then\n            xOffset = (min(nb - i, nbPerRow - 1)) * (w2 + s2) / 2\n            yOffset = yOffset + h2 + s2\n        end\n        \n        if m == 0 then\n            m = nbPerRow\n        end\n        \n        x = (m - 1) * (w2 + s2) - xOffset\n        y = -yOffset\n        \n        newPositions[i] = { x, y }\n    end\nend\n\nfunction LWA.UpdateBorder(region, isBar)\n    if #region.subRegions > 0 then\n        local config, size, r, g, b, a = LWA.GetConfig(), 0\n        \n        if not isBar or (isBar and config.style.apply_border) then\n            size = config.style.border_size\n            r, g, b, a = unpack(config.style.border_color)\n        end\n        \n        for _, border in ipairs(region.subRegions) do\n            if \"subborder\" == border.type then\n                border:SetVisible(size > 0)\n                \n                if size > 0 then\n                    local bd = border:GetBackdrop()\n                    bd.edgeSize = size\n                    border:SetBackdrop(bd)\n                    border:SetBorderColor(r, g, b, a)\n                end\n            end\n        end\n    end\nend\n\nlocal function MixRGB(c1, c2, pos)\n    pos = 1 - (pos or 0.5)\n    \n    return {\n        (c1[1] * pos) + (c2[1] * (1 - pos)),\n        (c1[2] * pos) + (c2[2] * (1 - pos)),\n        (c1[3] * pos) + (c2[3] * (1 - pos)),\n        (c1[4] * pos) + (c2[4] * (1 - pos))\n    }\nend\n\nfunction LWA.UpdateBar(aura, i, nb)\n    local config = LWA.GetConfig(\"resources\")\n    local e = aura or aura_env\n    local region = e.region\n    local cg = region.configGroup\n    \n    if not (region and cg and config[cg]) then return end\n    \n    cg = config[cg]\n    \n    local cs = region.colorState or \"\"\n    \n    if cs ~= \"\" then\n        cs = cs .. \"_\"\n    end\n    \n    i = (i or region.index or 1) - (region.colorOffset or 0)\n    nb = min(region.colorMax or 99, nb or 1)\n    \n    local c1, c2 = cg[cs .. \"color1\"], cg[cs .. \"color2\"]\n    local bar = region.bar\n    \n    if cg[cs .. \"gradient\"] and cg[cs .. \"gradient\"] < 3 then\n        if nb > 1 and 1 == cg[cs .. \"gradient\"] then\n            local cc1, cc2 = c1, c2\n            \n            if i > 1 then\n                c1 = MixRGB(cc1, cc2, (i - 1) / nb)\n            end\n            \n            c2 = MixRGB(cc1, cc2, i / nb)\n        end\n        \n        local orientation = \"HORIZONTAL\"\n        \n        if 2 == cg[cs .. \"gradient\"] then\n            orientation = \"VERTICAL\"\n            \n            local tmp = c1\n            c1 = c2\n            c2 = tmp\n        end\n        \n        if bar.fg.SetGradientAlpha then\n            bar.fg:SetGradientAlpha(orientation, c1[1], c1[2], c1[3], c1[4], c2[1], c2[2], c2[3], c2[4])\n        else\n            bar.fg:SetGradient(orientation, CreateColor(unpack(c1)), CreateColor(unpack(c2)))\n        end\n    else\n        bar:SetForegroundColor(unpack(c1))\n    end\n    \n    if region.ot then\n        region.ot:SetColorTexture(unpack(c2))\n    end\nend\n\nfunction LWA.GrowDynamicResource(newPositions, activeRegions)\n    local nb = #activeRegions\n    \n    if nb <= 0 then return end\n    \n    local config = LWA.GetConfig()\n    \n    local s = config.primary.spacing\n    \n    local w, h = (LWA.MAX_WIDTH + s) / nb\n    local x, xOffset = 0, (LWA.MAX_WIDTH - w + s) / 2\n    \n    for i, regionData in ipairs(activeRegions) do\n        x = (i - 1) * w - xOffset\n        \n        regionData.region:SetRegionWidth(w - s)\n        LWA.UpdateBar({ region = regionData.region }, i, nb)\n        regionData.region.bar:Update()\n        \n        newPositions[i] = { x, 0 }\n    end\nend\n\nlocal function round(num, decimals)\n    local mult = 10^(decimals or 0)\n    \n    return Round(num * mult) / mult\nend\n\nlocal barFormats = {\n    \"value\",\n    \"kvalue\",\n    \"value (percent%)\",\n    \"kvalue (percent%)\",\n    \"percent%\",\n}\n\nfunction LWA.UpdateBarText(value, percent, format)\n    local text = barFormats[format] or \"value\"\n    \n    text = text:gsub(\"percent\", round(percent, 0))\n    \n    if 2 == format or 4 == format then\n        local rem = math.fmod(value, 1000) or 0\n        \n        if rem >= 950 then\n            rem = 0\n        end\n        \n        text = text:gsub(\"kvalue\", FormatLargeNumber(Round((value - rem) / 1000)) .. \".\" .. Round(rem / 100) .. \"K\"):gsub(\"%.0K\", \"K\"):gsub(\"%.\", DECIMAL_SEPERATOR)\n    else\n        text = text:gsub(\"value\", value)\n    end\n    \n    return text\nend",
["do_custom"] = true,
},
["finish"] = {
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["displayIcon"] = "interface/icons/classicon_druid.blp",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["url"] = "https://space.bilibili.com/455259",
["config"] = {
["side"] = {
["grow_horizontal"] = false,
["spacing"] = 3,
["height"] = 36,
["margin"] = 3,
["width"] = 36,
},
["style"] = {
["apply_border"] = true,
["border_size"] = 0,
["border_color"] = {
0,
0,
0,
1,
},
["zoom"] = 30,
},
["maintenance"] = {
["height"] = 36,
["width"] = 36,
["margin"] = 10,
["spacing"] = 3,
},
["dynamic"] = {
["height"] = 34,
["width"] = 34,
["margin"] = 10,
["spacing"] = 3,
},
["primary"] = {
["spacing"] = 3,
["height"] = 48,
["resources_position"] = 2,
["nb"] = 7,
["width"] = 48,
},
["resources"] = {
["cast_bar"] = {
["color2"] = {
0.77647058823529,
0.1843137254902,
0.1843137254902,
1,
},
["unint_gradient"] = 1,
["gradient"] = 1,
["height"] = 20,
["unint_color2"] = {
0.70980392156863,
0.70980392156863,
0.70980392156863,
1,
},
["unint_color1"] = {
0.52549019607843,
0.52549019607843,
0.52549019607843,
0.90000000596046,
},
["color1"] = {
0.52941176470588,
0.090196078431373,
0.090196078431373,
1,
},
},
["health_bar"] = {
["color2"] = {
0.5843137254902,
0.90588235294118,
0.52156862745098,
1,
},
["height"] = 20,
["gradient"] = 1,
["format"] = 1,
["color1"] = {
0.34509803921569,
0.64313725490196,
0.28235294117647,
1,
},
},
},
["ooc_alpha"] = {
["ignore_enemy"] = true,
["alpha"] = 1,
["ignore_friendly"] = true,
},
["secondary"] = {
["height"] = 38,
["spacing"] = 3,
["width"] = 38,
},
},
["color"] = {
0,
0,
0,
0,
},
["desc"] = "Luxthos：https://wago.io/p/Luxthos",
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["semver"] = "2.0.25",
["tocversion"] = 11500,
["id"] = "General Options - Druid",
["frameStrata"] = 1,
["alpha"] = 0,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["uid"] = "44ta(qk14T6",
["inverse"] = false,
["adjustedMax"] = "",
["conditions"] = {
},
["cooldown"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
},
["精灵之火（减益缺失）"] = {
["iconSource"] = -1,
["wagoID"] = "m9HQxS-Xu",
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showOnMissing",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["type"] = "aura2",
["unit"] = "target",
["names"] = {
},
["auranames"] = {
"770",
"16857",
},
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["use_hostility"] = true,
["subeventSuffix"] = "_CAST_START",
["hostility"] = "hostile",
["matchesShowOn"] = "showOnMissing",
["event"] = "Unit Characteristics",
["names"] = {
},
["useName"] = true,
["auranames"] = {
"770",
"16857",
},
["spellIds"] = {
},
["unit"] = "target",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["use_attackable"] = true,
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.faerie_fire.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = true,
["version"] = 6,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%p",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["anchorXOffset"] = 0,
["text_color"] = {
1,
0.90588235294118,
0.74509803921569,
1,
},
["text_font"] = "Expressway",
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["anchorYOffset"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["text_text_format_p_time_dynamic_threshold"] = 1,
["text_text_format_p_format"] = "timed",
},
},
["height"] = 38,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["zoneIds"] = "",
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["race"] = {
},
["use_spec"] = true,
["use_level"] = false,
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spellknown"] = 770,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["parent"] = "德鲁伊 动态分组 左",
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["xOffset"] = 0,
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "fade",
["duration_type"] = "seconds",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "fade",
["duration_type"] = "seconds",
},
},
["uid"] = "63YjfbAM9oY",
["authorOptions"] = {
{
["subOptions"] = {
{
["useName"] = true,
["type"] = "header",
["text"] = "Behavior",
["noMerge"] = false,
["width"] = 1,
},
{
["subOptions"] = {
{
["type"] = "description",
["text"] = "Faerie Fire",
["fontSize"] = "large",
["width"] = 1,
},
{
["type"] = "select",
["default"] = 1,
["values"] = {
"Show if Applied",
"Show if Missing",
"Always Show",
},
["key"] = "behavior",
["useDesc"] = false,
["name"] = "Behavior",
["width"] = 1,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["collapse"] = false,
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["name"] = "Faerie Fire",
["key"] = "faerie_fire",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["collapse"] = true,
["width"] = 1,
["useCollapse"] = true,
["noMerge"] = false,
["name"] = "Maintenance Icons",
["key"] = "maintenance",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
},
["anchorFrameParent"] = false,
["alpha"] = 1,
["frameStrata"] = 1,
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "精灵之火（减益缺失）",
["semver"] = "1.0.5",
["useCooldownModRate"] = true,
["width"] = 38,
["cooldownTextDisabled"] = false,
["config"] = {
["maintenance"] = {
["faerie_fire"] = {
["behavior"] = 1,
},
},
},
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
},
["cooldown"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
},
["德鲁伊 动态分组 右"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"阳炎术（符文）",
"锤击",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["yOffset"] = 4,
["gridType"] = "LU",
["grow"] = "GRID",
["xOffset"] = -5.548650568181818e-05,
["fullCircle"] = true,
["rowSpace"] = 3,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["names"] = {
},
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 3,
["radius"] = 200,
["useLimit"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["align"] = "CENTER",
["groupIcon"] = "interface/icons/classicon_druid.blp",
["sortHybridTable"] = {
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["parent"] = "德鲁伊（中心分组，by 露露緹婭@Bilibili）",
["version"] = 28,
["subRegions"] = {
},
["borderColor"] = {
0,
0,
0,
1,
},
["space"] = 2,
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["internalVersion"] = 90,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["anchorPoint"] = "TOPRIGHT",
["animate"] = false,
["customGrow"] = "function(newPositions, activeRegions)\n    local LWA = LWA and LWA[\"Druid\"] or {}\n\n    if LWA and LWA.GrowDynamicEffects then\n        LWA.GrowDynamicEffects(newPositions, activeRegions)\n    end\nend",
["scale"] = 1.1,
["centerType"] = "LR",
["border"] = false,
["anchorFrameFrame"] = "WeakAuras:General Options - Druid",
["stepAngle"] = 15,
["borderSize"] = 2,
["sort"] = "none",
["selfPoint"] = "BOTTOMRIGHT",
["rotation"] = 0,
["borderInset"] = 1,
["anchorFrameParent"] = false,
["constantFactor"] = "RADIUS",
["source"] = "import",
["borderOffset"] = 4,
["semver"] = "2.0.25",
["tocversion"] = 11500,
["id"] = "德鲁伊 动态分组 右",
["borderEdge"] = "Square Full White",
["frameStrata"] = 1,
["anchorFrameType"] = "SELECTFRAME",
["regionType"] = "dynamicgroup",
["uid"] = "JX6NOW6NqVu",
["limit"] = 5,
["alpha"] = 1,
["gridWidth"] = 4,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["config"] = {
},
},
["月火术"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = true,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["type"] = "aura2",
["auranames"] = {
"8921",
},
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["unit"] = "target",
["unitExists"] = true,
["useName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["subeventPrefix"] = "SPELL",
["names"] = {
},
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["use_alwaystrue"] = true,
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["event"] = "Conditions",
["unit"] = "player",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_form"] = true,
["auranames"] = {
"5487",
"9634",
"768",
"33891",
},
["matchesShowOn"] = "showOnMissing",
["event"] = "Talent Known",
["use_unit"] = true,
["unit"] = "player",
["useName"] = true,
["ownOnly"] = true,
["form"] = {
["single"] = 0,
},
["type"] = "aura2",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["spellknown"] = 8921,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "Core - Druid",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["uid"] = "RgVq)lXxTRM",
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "月火术",
["semver"] = "2.0.8",
["useCooldownModRate"] = true,
["width"] = 48,
["zoom"] = 0.3,
["config"] = {
},
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
},
{
["value"] = "0",
["op"] = "==",
["variable"] = "matchCount",
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = 0.5,
["property"] = "alpha",
},
},
},
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 1,
},
{
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = 1,
["property"] = "alpha",
},
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
},
["迷梦（符文）"] = {
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】BIU.ogg",
["sound"] = " custom",
["do_sound"] = true,
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["use_debuffClass"] = false,
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["auranames"] = {
"408258",
},
["unit"] = "player",
["spellIds"] = {
},
["useExactSpellId"] = false,
["subeventPrefix"] = "SPELL",
["auraspellids"] = {
},
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["duration_type"] = "seconds",
["preset"] = "slidebottom",
["easeStrength"] = 3,
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = true,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorYOffset"] = 0,
["type"] = "subtext",
["anchorXOffset"] = 0,
["text_color"] = {
1,
0.97254901960784,
0.050980392156863,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 15,
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_text_format_p_time_mod_rate"] = true,
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "迷梦",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 1,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowXOffset"] = 0,
["glowType"] = "buttonOverlay",
["glowLength"] = 5,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glowScale"] = 1,
["glow"] = true,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["use_level"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["use_never"] = false,
["level_operator"] = {
">=",
},
["level"] = {
"20",
},
["spellknown"] = 408258,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["selfPoint"] = "CENTER",
["parent"] = "【露露】德鲁伊（BUFF）",
["cooldown"] = true,
["displayIcon"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["xOffset"] = 0,
["uid"] = "dDmpRHGMSUJ",
["url"] = "https://space.bilibili.com/455259",
["anchorFrameParent"] = false,
["alpha"] = 1,
["desaturate"] = false,
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["tocversion"] = 20501,
["id"] = "迷梦（符文）",
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["icon"] = true,
["config"] = {
},
["inverse"] = false,
["adjustedMax"] = "",
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["authorOptions"] = {
},
},
["荆棘术（三系，可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
{
["subOptions"] = {
{
["useName"] = true,
["type"] = "header",
["text"] = "Behavior",
["noMerge"] = false,
["width"] = 1,
},
{
["subOptions"] = {
{
["type"] = "description",
["text"] = "Thorns",
["fontSize"] = "large",
["width"] = 1,
},
{
["type"] = "select",
["default"] = 2,
["values"] = {
"Show if Applied",
"Show if Missing",
"Always Show",
},
["key"] = "behavior",
["useDesc"] = false,
["name"] = "Behavior",
["width"] = 1,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["collapse"] = false,
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["name"] = "Thorns",
["key"] = "thorns",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["collapse"] = true,
["width"] = 1,
["useCollapse"] = true,
["noMerge"] = false,
["name"] = "Maintenance Icons",
["key"] = "maintenance",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = true,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"467",
},
["matchesShowOn"] = "showOnMissing",
["names"] = {
},
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["unit"] = "player",
["use_unit"] = true,
["spellIds"] = {
},
["use_itemName"] = true,
["useName"] = true,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"467",
},
["matchesShowOn"] = "showOnActive",
["unit"] = "player",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["rem"] = "300",
["type"] = "aura2",
["use_itemName"] = true,
["use_unit"] = true,
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["duration"] = "1",
["remOperator"] = "<=",
["event"] = "Item Count",
["names"] = {
},
["useRem"] = true,
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.thorns.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["spec"] = {
["multi"] = {
},
},
["use_combat"] = false,
["spellknown"] = 467,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "Core - Druid",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["uid"] = "ZvYA0Rto9QN",
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "荆棘术（三系，可点击施法）",
["semver"] = "2.0.8",
["useCooldownModRate"] = true,
["width"] = 48,
["zoom"] = 0.3,
["config"] = {
["maintenance"] = {
["thorns"] = {
["behavior"] = 2,
},
},
},
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "unitCount",
["op"] = "==",
["value"] = "0",
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = 0.5,
["property"] = "alpha",
},
},
},
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "unitCount",
["value"] = "1",
["op"] = "==",
},
{
["trigger"] = 1,
["op"] = ">=",
["variable"] = "expirationTime",
["value"] = "180",
},
},
},
["changes"] = {
{
["property"] = "alpha",
},
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 荆棘术\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a荆棘术|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
},
["清晰预兆（三系，可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["parent"] = "Core - Druid",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = true,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 清晰预兆\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a清晰预兆|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
["triggers"] = {
{
["trigger"] = {
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"16864",
},
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["unevent"] = "auto",
["names"] = {
},
["spellIds"] = {
},
["matchesShowOn"] = "showOnMissing",
["type"] = "aura2",
["use_itemName"] = true,
["use_unit"] = true,
["unit"] = "player",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"16864",
},
["matchesShowOn"] = "showOnActive",
["names"] = {
},
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["rem"] = "300",
["useName"] = true,
["event"] = "Item Count",
["unevent"] = "auto",
["unit"] = "player",
["use_unit"] = true,
["spellIds"] = {
},
["use_itemName"] = true,
["remOperator"] = "<=",
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["useRem"] = true,
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.thorns.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = false,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_combat"] = false,
["spellknown"] = 16864,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 48,
["source"] = "import",
["xOffset"] = 0,
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["url"] = "https://space.bilibili.com/455259",
["authorOptions"] = {
{
["subOptions"] = {
{
["type"] = "header",
["useName"] = true,
["text"] = "Behavior",
["noMerge"] = false,
["width"] = 1,
},
{
["subOptions"] = {
{
["text"] = "Thorns",
["type"] = "description",
["fontSize"] = "large",
["width"] = 1,
},
{
["type"] = "select",
["values"] = {
"Show if Applied",
"Show if Missing",
"Always Show",
},
["default"] = 2,
["name"] = "Behavior",
["useDesc"] = false,
["key"] = "behavior",
["width"] = 1,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["name"] = "Thorns",
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["collapse"] = false,
["type"] = "group",
["limitType"] = "none",
["groupType"] = "simple",
["key"] = "thorns",
["size"] = 10,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["name"] = "Maintenance Icons",
["width"] = 1,
["useCollapse"] = true,
["noMerge"] = false,
["collapse"] = true,
["type"] = "group",
["limitType"] = "none",
["groupType"] = "simple",
["key"] = "maintenance",
["size"] = 10,
},
},
["config"] = {
["maintenance"] = {
["thorns"] = {
["behavior"] = 2,
},
},
},
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "清晰预兆（三系，可点击施法）",
["semver"] = "2.0.8",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "00WTPfUHrWv",
["inverse"] = false,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "unitCount",
["value"] = "0",
["op"] = "==",
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = 0.5,
["property"] = "alpha",
},
},
},
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "unitCount",
["op"] = "==",
["value"] = "1",
},
{
["trigger"] = 1,
["op"] = ">=",
["value"] = "180",
["variable"] = "expirationTime",
},
},
},
["changes"] = {
{
["property"] = "alpha",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["icon"] = true,
},
["激怒"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["useName"] = true,
["spellIds"] = {
},
["auranames"] = {
"5229",
},
["ownOnly"] = true,
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["type"] = "spell",
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["use_showgcd"] = false,
["use_spellName"] = true,
["debuffType"] = "HELPFUL",
["genericShowOn"] = "showAlways",
["realSpellName"] = "狂怒",
["use_track"] = true,
["spellName"] = 5229,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"5487",
"9634",
},
["unit"] = "player",
["type"] = "aura2",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[3]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "可点击施法暂时取消",
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["spellknown"] = 5229,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["desaturate"] = false,
["source"] = "import",
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["selfPoint"] = "CENTER",
["uid"] = "V7d7buiqtNv",
["authorOptions"] = {
},
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.8",
["tocversion"] = 11500,
["id"] = "激怒",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 48,
["frameStrata"] = 1,
["config"] = {
},
["inverse"] = true,
["parent"] = "Core - Druid",
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "insufficientResources",
["value"] = 1,
},
["changes"] = {
{
["value"] = {
0.47450980392157,
0.51372549019608,
1,
1,
},
["property"] = "color",
},
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["property"] = "color",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = false,
["custom"] = "\n\nlocal e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 激怒\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a激怒|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
},
["日蚀（平衡）"] = {
["iconSource"] = 0,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"48517",
},
["event"] = "Health",
["names"] = {
},
["spellIds"] = {
},
["unit"] = "player",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["spellId"] = {
"48518",
},
["use_matchedRune"] = false,
["duration"] = "30",
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "combatlog",
["names"] = {
},
["unevent"] = "auto",
["sourceUnit"] = "player",
["use_genericShowOn"] = true,
["event"] = "Combat Log",
["use_spellId"] = true,
["realSpellName"] = 0,
["use_spellName"] = false,
["spellIds"] = {
},
["use_sourceUnit"] = true,
["subeventSuffix"] = "_AURA_APPLIED",
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["spellName"] = {
"",
},
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["type"] = "unit",
["use_alwaystrue"] = true,
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["use_percenthealth"] = true,
["event"] = "Conditions",
["unit"] = "player",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"768",
"5487",
"9634",
},
["unit"] = "player",
["matchesShowOn"] = "showOnMissing",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\nreturn t[4]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["progressSource"] = {
-1,
"",
},
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
[22] = true,
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_talent"] = false,
["use_class"] = true,
["use_spellknown"] = false,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 3674,
["zoneIds"] = "",
},
["internalVersion"] = 90,
["useAdjustededMax"] = false,
["xOffset"] = 0,
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = 136006,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["adjustedMax"] = "",
["width"] = 48,
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.8",
["tocversion"] = 11500,
["id"] = "日蚀（平衡）",
["alpha"] = 1,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["uid"] = "9NMwOCgNnDD",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["property"] = "color",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["parent"] = "Core - Druid",
},
["狂暴回复（可点击施法，自动变巨熊）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["useName"] = true,
["spellIds"] = {
},
["auranames"] = {
"22842",
},
["ownOnly"] = true,
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["type"] = "spell",
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["use_showgcd"] = false,
["use_spellName"] = true,
["spellName"] = 22842,
["genericShowOn"] = "showAlways",
["realSpellName"] = "狂暴回复",
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["spellknown"] = 22842,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "Core - Druid",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["uid"] = "ZnvhlBjZOHd",
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "狂暴回复（可点击施法，自动变巨熊）",
["semver"] = "2.0.8",
["useCooldownModRate"] = true,
["width"] = 48,
["zoom"] = 0.3,
["config"] = {
},
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cancelform [noform:1]\\n/cast [noform:1] 巨熊形态\\n/cast 狂暴回复\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a狂暴回复（自动变巨熊）|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
},
["德鲁伊 动态分组 左"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"猫德变身次数（by Jixel，支持简中，露露修改自用）",
"精灵之火（野性）",
"精灵之火（减益缺失）",
"潜行（德鲁伊）",
"挑战咆哮",
"低吼",
"畏缩（野性）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "Ner0rxotC",
["xOffset"] = -5.548650568181818e-05,
["preferToUpdate"] = false,
["yOffset"] = 4,
["anchorPoint"] = "TOPLEFT",
["grow"] = "GRID",
["parent"] = "德鲁伊（中心分组，by 露露緹婭@Bilibili）",
["fullCircle"] = true,
["rowSpace"] = 3,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["names"] = {
},
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 3,
["radius"] = 200,
["selfPoint"] = "BOTTOMLEFT",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["align"] = "CENTER",
["groupIcon"] = "interface/icons/classicon_druid.blp",
["gridType"] = "RU",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["rotation"] = 0,
["authorOptions"] = {
},
["version"] = 28,
["subRegions"] = {
},
["borderColor"] = {
0,
0,
0,
1,
},
["space"] = 2,
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["internalVersion"] = 90,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["sortHybridTable"] = {
["割碎"] = false,
["精灵之火（减益缺失）"] = false,
["潜行（德鲁伊）"] = false,
["精灵之火（野性）"] = false,
["畏缩（野性）"] = false,
["挑战咆哮"] = false,
["低吼"] = false,
},
["animate"] = false,
["customGrow"] = "function(newPositions, activeRegions)\n    local LWA = LWA and LWA[\"Druid\"] or {}\n\n    if LWA and LWA.GrowDynamicSpells then\n        LWA.GrowDynamicSpells(newPositions, activeRegions)\n    end\nend",
["scale"] = 1.1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["limit"] = 8,
["useLimit"] = true,
["stagger"] = 0,
["borderInset"] = 1,
["anchorFrameParent"] = false,
["constantFactor"] = "RADIUS",
["source"] = "import",
["borderOffset"] = 4,
["semver"] = "2.0.25",
["tocversion"] = 11500,
["id"] = "德鲁伊 动态分组 左",
["anchorFrameFrame"] = "WeakAuras:General Options - Druid",
["alpha"] = 1,
["anchorFrameType"] = "SELECTFRAME",
["regionType"] = "dynamicgroup",
["uid"] = "D6BRpm9Q4kM",
["sort"] = "none",
["frameStrata"] = 1,
["gridWidth"] = 4,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["config"] = {
},
},
["Combo Point 4 - Druid"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["xOffset"] = 0,
["adjustedMax"] = "4",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["icon"] = false,
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["selfPoint"] = "TOP",
["barColor"] = {
0.85882352941176,
0.14509803921569,
0.050980392156863,
1,
},
["desaturate"] = false,
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["use_class"] = true,
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
[3] = true,
},
},
["size"] = {
["multi"] = {
},
},
},
["toolTipArea"] = "ICON",
["smoothProgress"] = false,
["useAdjustededMin"] = true,
["regionType"] = "aurabar",
["texture"] = "Solid",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["spark"] = false,
["tocversion"] = 11500,
["alpha"] = 1,
["config"] = {
},
["colorState"] = "",
["sparkOffsetX"] = 0,
["wagoID"] = "Ner0rxotC",
["parent"] = "Combo Points - Druid",
["adjustedMin"] = "3",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["use_absorbMode"] = true,
["unevent"] = "auto",
["unit"] = "player",
["duration"] = "1",
["event"] = "Power",
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
["powertype"] = 4,
["spellIds"] = {
},
["use_power"] = false,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"768",
},
["unit"] = "player",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = 1,
},
["configGroup"] = "combo_points",
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["isPrimaryResource"] = false,
["version"] = 28,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
},
["height"] = 20,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = true,
["source"] = "import",
["sparkColor"] = {
1,
1,
1,
1,
},
["barColor2"] = {
1,
1,
0,
1,
},
["icon_side"] = "RIGHT",
["authorOptions"] = {
},
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "aura_env.region.configGroup = \"combo_points\"",
["do_custom"] = true,
},
["finish"] = {
},
},
["sparkHeight"] = 30,
["auto"] = true,
["uid"] = "4X62Y0an9tX",
["backgroundColor"] = {
0,
0,
0,
0.34336978197098,
},
["semver"] = "2.0.25",
["zoom"] = 0,
["sparkHidden"] = "NEVER",
["width"] = 56,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["id"] = "Combo Point 4 - Druid",
["anchorFrameParent"] = false,
["inverse"] = false,
["internalVersion"] = 90,
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = "<=",
["variable"] = "power",
["value"] = "3",
},
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 4, 5)",
},
["property"] = "customcode",
},
},
},
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "4",
},
["linked"] = true,
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"highlight\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 4, 5)",
},
["property"] = "customcode",
},
},
},
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "5",
},
["linked"] = true,
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"full\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 4, 5)",
},
["property"] = "customcode",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
},
["自然迅捷（德鲁伊）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["type"] = "aura2",
["unit"] = "player",
["names"] = {
},
["auranames"] = {
"17116",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 17116,
["realSpellName"] = "自然迅捷",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["use_genericShowOn"] = true,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["unit"] = "player",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["single"] = 39,
["multi"] = {
[39] = true,
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 17116,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["parent"] = "Core - Druid",
["width"] = 48,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.8",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "自然迅捷（德鲁伊）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "rixW7HYVvI9",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["Combo Point 2 - Druid"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["xOffset"] = 0,
["adjustedMax"] = "2",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["icon"] = false,
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["selfPoint"] = "TOP",
["barColor"] = {
0.85882352941176,
0.14509803921569,
0.050980392156863,
1,
},
["desaturate"] = false,
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["use_class"] = true,
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
[3] = true,
},
},
["size"] = {
["multi"] = {
},
},
},
["toolTipArea"] = "ICON",
["smoothProgress"] = false,
["useAdjustededMin"] = true,
["regionType"] = "aurabar",
["texture"] = "Solid",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["spark"] = false,
["tocversion"] = 11500,
["alpha"] = 1,
["config"] = {
},
["colorState"] = "",
["sparkOffsetX"] = 0,
["wagoID"] = "Ner0rxotC",
["parent"] = "Combo Points - Druid",
["adjustedMin"] = "1",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["use_absorbMode"] = true,
["unevent"] = "auto",
["unit"] = "player",
["duration"] = "1",
["event"] = "Power",
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
["powertype"] = 4,
["spellIds"] = {
},
["use_power"] = false,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"768",
},
["unit"] = "player",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = 1,
},
["configGroup"] = "combo_points",
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["isPrimaryResource"] = false,
["version"] = 28,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
},
["height"] = 20,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = true,
["source"] = "import",
["sparkColor"] = {
1,
1,
1,
1,
},
["barColor2"] = {
1,
1,
0,
1,
},
["icon_side"] = "RIGHT",
["authorOptions"] = {
},
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "aura_env.region.configGroup = \"combo_points\"",
["do_custom"] = true,
},
["finish"] = {
},
},
["sparkHeight"] = 30,
["auto"] = true,
["uid"] = "FN7gVrBBOwr",
["backgroundColor"] = {
0,
0,
0,
0.34336978197098,
},
["semver"] = "2.0.25",
["zoom"] = 0,
["sparkHidden"] = "NEVER",
["width"] = 56,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["id"] = "Combo Point 2 - Druid",
["anchorFrameParent"] = false,
["inverse"] = false,
["internalVersion"] = 90,
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = "<=",
["variable"] = "power",
["value"] = "3",
},
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 2, 5)",
},
["property"] = "customcode",
},
},
},
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "4",
},
["linked"] = true,
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"highlight\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 2, 5)",
},
["property"] = "customcode",
},
},
},
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "5",
},
["linked"] = true,
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"full\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 2, 5)",
},
["property"] = "customcode",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
},
["Combo Point 3 - Druid"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["xOffset"] = 0,
["adjustedMax"] = "3",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["icon"] = false,
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["selfPoint"] = "TOP",
["barColor"] = {
0.85882352941176,
0.14509803921569,
0.050980392156863,
1,
},
["desaturate"] = false,
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["use_class"] = true,
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
[3] = true,
},
},
["size"] = {
["multi"] = {
},
},
},
["toolTipArea"] = "ICON",
["smoothProgress"] = false,
["useAdjustededMin"] = true,
["regionType"] = "aurabar",
["texture"] = "Solid",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["spark"] = false,
["tocversion"] = 11500,
["alpha"] = 1,
["config"] = {
},
["colorState"] = "",
["sparkOffsetX"] = 0,
["wagoID"] = "Ner0rxotC",
["parent"] = "Combo Points - Druid",
["adjustedMin"] = "2",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["use_absorbMode"] = true,
["unevent"] = "auto",
["unit"] = "player",
["duration"] = "1",
["event"] = "Power",
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
["powertype"] = 4,
["spellIds"] = {
},
["use_power"] = false,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"768",
},
["unit"] = "player",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = 1,
},
["configGroup"] = "combo_points",
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["isPrimaryResource"] = false,
["version"] = 28,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
},
["height"] = 20,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = true,
["source"] = "import",
["sparkColor"] = {
1,
1,
1,
1,
},
["barColor2"] = {
1,
1,
0,
1,
},
["icon_side"] = "RIGHT",
["authorOptions"] = {
},
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "aura_env.region.configGroup = \"combo_points\"",
["do_custom"] = true,
},
["finish"] = {
},
},
["sparkHeight"] = 30,
["auto"] = true,
["uid"] = "cz1DthPZOqq",
["backgroundColor"] = {
0,
0,
0,
0.34336978197098,
},
["semver"] = "2.0.25",
["zoom"] = 0,
["sparkHidden"] = "NEVER",
["width"] = 56,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["id"] = "Combo Point 3 - Druid",
["anchorFrameParent"] = false,
["inverse"] = false,
["internalVersion"] = 90,
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = "<=",
["variable"] = "power",
["value"] = "3",
},
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 3, 5)",
},
["property"] = "customcode",
},
},
},
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "4",
},
["linked"] = true,
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"highlight\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 3, 5)",
},
["property"] = "customcode",
},
},
},
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "5",
},
["linked"] = true,
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"full\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 3, 5)",
},
["property"] = "customcode",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
},
["Core - Druid"] = {
["grow"] = "CUSTOM",
["controlledChildren"] = {
"野蛮咆哮（符文）",
"狂暴",
"割碎（符文）",
"斜掠",
"割裂",
"猛虎之怒",
"割伤",
"挫志咆哮",
"激怒",
"生命绽放（符文）",
"野性成长（符文）",
"回春术",
"愈合",
"迅捷治愈",
"月火术",
"虫群",
"日蚀（平衡）",
"月蚀（平衡）",
"自然迅捷（德鲁伊）",
"激活（可点击施法，左键目标，右键玩家）",
"宁静",
"树皮术（可点击施法）",
"生存本能（可点击施法）",
"狂暴回复（可点击施法，自动变巨熊）",
"重击（可点击施法，自动变巨熊）",
"自然之握",
"急奔（可点击施法，自动变豹）",
"野性冲锋",
"复生（可点击施法）",
"野性印记（可点击施法，左键小，右键大）",
"荆棘术（三系，可点击施法）",
"清晰预兆（三系，可点击施法）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "Ner0rxotC",
["xOffset"] = -6.103515625e-05,
["preferToUpdate"] = false,
["yOffset"] = 0,
["sortHybridTable"] = {
["割裂"] = false,
["野性冲锋 - 熊"] = false,
["月火术（触发器修改）熊/猫形态以外"] = false,
["激活（奶德，可点击施法，左键目标，右键玩家）"] = false,
["野性成长（恢复）"] = false,
["急奔（可点击施法，自动变豹）"] = false,
["愈合（恢复）"] = false,
["野性印记（可点击施法，左键小，右键大）"] = false,
["虫群（触发器修改）熊/猫形态以外"] = false,
["生命绽放（恢复）"] = false,
["月蚀（平衡）"] = false,
["荆棘术（三系，可点击施法）"] = false,
["树皮术（可点击施法）"] = false,
["日蚀（平衡）"] = false,
["激怒"] = false,
["迅捷治愈（恢复）"] = false,
["挫志咆哮"] = false,
["斜掠"] = false,
["割伤"] = false,
["猛击（可点击施法，自动变巨熊）"] = false,
["回春术（恢复）"] = false,
["自然迅捷（德鲁伊）"] = false,
["复生（可点击施法）"] = false,
["宁静（恢复，可点击施法）"] = false,
["猛虎之怒"] = false,
["自然之握（可点击施法）"] = false,
["狂暴回复（可点击施法，自动变巨熊）"] = false,
},
["rotation"] = 0,
["arcLength"] = 360,
["fullCircle"] = true,
["space"] = 2,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["names"] = {
},
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["internalVersion"] = 90,
["parent"] = "德鲁伊（中心分组，by 露露緹婭@Bilibili）",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["align"] = "CENTER",
["growOn"] = "changed",
["source"] = "import",
["desc"] = "Luxthos：https://wago.io/p/Luxthos",
["stagger"] = 0,
["groupIcon"] = "interface/icons/classicon_druid.blp",
["version"] = 28,
["subRegions"] = {
},
["anchorPoint"] = "CENTER",
["selfPoint"] = "TOP",
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["borderColor"] = {
0,
0,
0,
1,
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["rowSpace"] = 1,
["animate"] = false,
["customGrow"] = "function(newPositions, activeRegions)\n    local LWA = LWA and LWA[\"Druid\"] or {}\n\n    if LWA and LWA.GrowCore then\n        LWA.GrowCore(newPositions, activeRegions)\n    end\nend",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["sort"] = "none",
["radius"] = 200,
["authorOptions"] = {
},
["useLimit"] = false,
["constantFactor"] = "RADIUS",
["frameStrata"] = 1,
["borderOffset"] = 4,
["semver"] = "2.0.25",
["tocversion"] = 11500,
["id"] = "Core - Druid",
["limit"] = 5,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["uid"] = "ExSesMCYhiR",
["borderInset"] = 1,
["config"] = {
},
["stepAngle"] = 15,
["gridWidth"] = 5,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["gridType"] = "RD",
},
["狂暴"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useMatch_count"] = true,
["match_countOperator"] = ">",
["unit"] = "player",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["spellIds"] = {
},
["auranames"] = {
"417141",
},
["match_count"] = "0",
["subeventSuffix"] = "_CAST_START",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "狂暴",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 417141,
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = false,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 417141,
["size"] = {
["multi"] = {
},
},
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["xOffset"] = 0,
["cooldown"] = true,
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["color"] = {
1,
1,
1,
1,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "4oSAslvqcXX",
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["cooldownEdge"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.8",
["tocversion"] = 11500,
["id"] = "狂暴",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["width"] = 48,
["alpha"] = 1,
["config"] = {
},
["inverse"] = true,
["parent"] = "Core - Druid",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = false,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 狂暴\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a狂暴|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["宁静"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
["do_message"] = false,
},
["init"] = {
["do_custom"] = false,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 宁静\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a宁静|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 740,
["realSpellName"] = "宁静",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["use_genericShowOn"] = true,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["unit"] = "player",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["type"] = "unit",
["talent"] = {
["single"] = 95,
},
["spellName"] = 0,
["use_genericShowOn"] = true,
["event"] = "Talent Known",
["unit"] = "player",
["realSpellName"] = 0,
["use_spellName"] = true,
["genericShowOn"] = "showOnCooldown",
["use_spec"] = true,
["use_unit"] = true,
["use_talent"] = true,
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["single"] = 95,
["multi"] = {
[95] = true,
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 740,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["parent"] = "Core - Druid",
["width"] = 48,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.8",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "宁静",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "QwdbY9(v6mW",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["德鲁伊（60plus，by 露露緹婭@Bilibili）1005更"] = {
["controlledChildren"] = {
"【露露】德鲁伊（BUFF）",
"德鲁伊（中心分组，by 露露緹婭@Bilibili）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 0,
["groupIcon"] = "classicon-druid",
["anchorPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["event"] = "Health",
["names"] = {
},
},
["untrigger"] = {
},
},
},
["internalVersion"] = 90,
["selfPoint"] = "CENTER",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。\n\n使用的英文模板来自：\nAfenar：https://wago.io/p/Afenar\nLuxthos：https://wago.io/p/Luxthos",
["subRegions"] = {
},
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["scale"] = 1,
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "group",
["borderSize"] = 2,
["borderOffset"] = 4,
["yOffset"] = 0,
["id"] = "德鲁伊（60plus，by 露露緹婭@Bilibili）1005更",
["authorOptions"] = {
},
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["borderInset"] = 1,
["config"] = {
},
["uid"] = "1iivIEUU4QC",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
},
["alpha"] = 1,
},
["【露露】德鲁伊 野蛮咆哮语音（3秒，团战加载）"] = {
["outline"] = "OUTLINE",
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
["authorOptions"] = {
},
["displayText"] = "",
["shadowYOffset"] = -1,
["anchorPoint"] = "CENTER",
["alpha"] = 1,
["cooldownSwipe"] = true,
["displayText_format_p_time_format"] = 0,
["customTextUpdate"] = "event",
["url"] = "https://space.bilibili.com/455259",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["rem"] = "3",
["auranames"] = {
"407988",
},
["matchesShowOn"] = "showOnActive",
["unit"] = "player",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["showClones"] = false,
["type"] = "aura2",
["useExactSpellId"] = false,
["event"] = "Health",
["auraspellids"] = {
"146739",
},
["names"] = {
},
["ownOnly"] = true,
["spellIds"] = {
},
["useName"] = true,
["remOperator"] = "<=",
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["useRem"] = true,
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["displayText_format_p_format"] = "timed",
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["wordWrap"] = "WordWrap",
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = false,
["yOffset"] = -3000,
["desaturate"] = false,
["anchorFrameParent"] = false,
["font"] = "Rurutia",
["version"] = 12,
["subRegions"] = {
{
["type"] = "subbackground",
},
},
["height"] = 48,
["cooldownEdge"] = true,
["load"] = {
["size"] = {
["multi"] = {
},
},
["ingroup"] = {
["single"] = "raid",
["multi"] = {
["raid"] = true,
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["use_petbattle"] = false,
["race"] = {
},
["use_class"] = true,
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["use_spellknown"] = true,
["use_spec"] = true,
["use_ingroup"] = true,
["use_combat"] = true,
["spellknown"] = 407988,
["zoneIds"] = "",
},
["actions"] = {
["start"] = {
["sound"] = " custom",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】BUFF没咯~.ogg",
["do_sound"] = true,
},
["init"] = {
},
["finish"] = {
},
},
["displayText_format_p_time_mod_rate"] = true,
["fontSize"] = 10,
["source"] = "import",
["displayText_format_p_time_legacy_floor"] = false,
["shadowXOffset"] = 1,
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["fixedWidth"] = 200,
["regionType"] = "text",
["xOffset"] = 0,
["displayText_format_p_time_dynamic_threshold"] = 60,
["uid"] = "ov89BnodoJc",
["justify"] = "LEFT",
["anchorFrameType"] = "SCREEN",
["displayText_format_p_time_precision"] = 1,
["frameStrata"] = 1,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "【露露】德鲁伊 野蛮咆哮语音（3秒，团战加载）",
["automaticWidth"] = "Auto",
["useCooldownModRate"] = true,
["width"] = 48,
["semver"] = "2.0.10",
["config"] = {
},
["inverse"] = false,
["zoom"] = 0.3,
["shadowColor"] = {
0,
0,
0,
1,
},
["conditions"] = {
},
["cooldown"] = true,
["parent"] = "【露露】德鲁伊（BUFF）",
},
["畏缩（野性）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["track"] = "auto",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["spellName"] = 8998,
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["realSpellName"] = "畏缩",
["use_spellName"] = true,
["spellIds"] = {
},
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 38,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["spellknown"] = 8998,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "德鲁伊 动态分组 左",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["uid"] = "8s52Y24Bi8n",
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "畏缩（野性）",
["semver"] = "2.0.8",
["useCooldownModRate"] = true,
["width"] = 38,
["zoom"] = 0.3,
["config"] = {
},
["inverse"] = true,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
},
["挑战咆哮"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"5209",
},
["event"] = "Health",
["names"] = {
},
["spellIds"] = {
},
["unit"] = "target",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["names"] = {
},
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "挑战咆哮",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 5209,
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["use_track"] = true,
["duration"] = "1",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 38,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 5209,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["parent"] = "德鲁伊 动态分组 左",
["width"] = 38,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.8",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "挑战咆哮",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "hxiKkj)l(Ay",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["【露露】德鲁伊 技能释放发言（激活）"] = {
["iconSource"] = -1,
["xOffset"] = 0,
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["debuffType"] = "HELPFUL",
["type"] = "combatlog",
["spellId"] = {
"29166",
},
["subeventSuffix"] = "_CAST_SUCCESS",
["names"] = {
},
["duration"] = "3",
["event"] = "Combat Log",
["subeventPrefix"] = "SPELL",
["use_sourceName"] = false,
["use_spellName"] = false,
["spellIds"] = {
},
["use_sourceUnit"] = true,
["unit"] = "player",
["use_spellId"] = true,
["sourceUnit"] = "player",
["spellName"] = {
"激活",
},
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desc"] = "by 露露緹婭@Bilibili，斗鱼9593311，转载请保留出处，请勿二次上传wago。",
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%s",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 12,
["anchorXOffset"] = 0,
["text_fontType"] = "OUTLINE",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = false,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 29166,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["actions"] = {
["start"] = {
["message_format_1.unitName_format"] = "none",
["message_format_1.destName_format"] = "none",
["message_type"] = "SMARTRAID",
["do_message"] = false,
["message_format_1.spellName_format"] = "none",
["message"] = "",
["message_format_p_time_dynamic_threshold"] = 60,
["message_format_1.casterName_format"] = "none",
["message_format_p_format"] = "timed",
["message_format_n_format"] = "none",
["message_format_p_time_format"] = 0,
["message_format_1.sourceName_format"] = "none",
["message_format_p_time_precision"] = 1,
},
["finish"] = {
},
["init"] = {
},
},
["authorOptions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = {
["message"] = "已对 %1.destName 施放 %1.spellName",
["message_type"] = "SMARTRAID",
["message_format_1.spellName_format"] = "none",
["message_format_1.destName_format"] = "none",
},
["property"] = "chat",
},
},
},
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["preferToUpdate"] = false,
["progressSource"] = {
-1,
"",
},
["uid"] = "5m0oQI6nprf",
["cooldownEdge"] = false,
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["desaturate"] = false,
["cooldownTextDisabled"] = false,
["parent"] = "【露露】德鲁伊（BUFF）",
["tocversion"] = 30403,
["id"] = "【露露】德鲁伊 技能释放发言（激活）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["width"] = 30,
["alpha"] = 0,
["config"] = {
},
["inverse"] = false,
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["displayIcon"] = "",
["cooldown"] = false,
["color"] = {
1,
1,
1,
1,
},
},
["Form Mana Bar - Druid"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["xOffset"] = 0,
["preferToUpdate"] = false,
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["icon"] = false,
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["selfPoint"] = "TOP",
["barColor"] = {
0.03921568627451,
0.45098039215686,
0.82745098039216,
1,
},
["desaturate"] = false,
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["use_spec"] = false,
["size"] = {
["multi"] = {
},
},
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
true,
true,
true,
},
},
["zoneIds"] = "",
},
["toolTipArea"] = "ICON",
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["overlayclip"] = true,
["texture"] = "Solid",
["zoom"] = 0,
["spark"] = false,
["tocversion"] = 11500,
["alpha"] = 1,
["sparkColor"] = {
1,
1,
1,
1,
},
["colorState"] = "",
["sparkOffsetX"] = 0,
["wagoID"] = "Ner0rxotC",
["parent"] = "Resources - Druid",
["adjustedMin"] = "",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["use_absorbMode"] = true,
["use_showCost"] = true,
["unit"] = "player",
["powertype"] = 0,
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
["type"] = "unit",
["subeventSuffix"] = "_CAST_START",
["event"] = "Power",
["use_percentpower"] = false,
["subeventPrefix"] = "SPELL",
["duration"] = "1",
["spellIds"] = {
},
["use_unit"] = true,
["names"] = {
},
["unevent"] = "auto",
["percentpower"] = {
"90",
},
["percentpower_operator"] = {
"<=",
},
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"768",
"5487",
"9634",
},
["unit"] = "player",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["isPrimaryResource"] = false,
["version"] = 28,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
},
["height"] = 5,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["source"] = "import",
["overlays"] = {
{
0,
0,
0,
0.40000003576279,
},
},
["barColor2"] = {
1,
1,
0,
1,
},
["icon_side"] = "RIGHT",
["uid"] = "Ai2HUT(KjJE",
["backgroundColor"] = {
0,
0,
0,
0.30000001192093,
},
["sparkHeight"] = 30,
["configGroup"] = "mana_bar",
["config"] = {
},
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["semver"] = "2.0.25",
["auto"] = true,
["id"] = "Form Mana Bar - Druid",
["width"] = 405,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["sparkHidden"] = "NEVER",
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "aura_env.region.configGroup = \"form_mana_bar\"\n",
["do_custom"] = true,
},
["finish"] = {
},
},
["inverse"] = false,
["authorOptions"] = {
},
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = ">=",
["variable"] = "percentpower",
["value"] = "80",
},
["linked"] = false,
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"full\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env)",
},
["property"] = "customcode",
},
},
},
{
["check"] = {
["trigger"] = -1,
["op"] = "<=",
["variable"] = "alwaystrue",
},
["linked"] = true,
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env)",
},
["property"] = "customcode",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
},
["锤击"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Queued Action",
["names"] = {
},
["realSpellName"] = "割碎",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 6808,
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = false,
["glowType"] = "Pixel",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glowScale"] = 1,
["glow"] = true,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 38,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 6808,
["size"] = {
["multi"] = {
},
},
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["xOffset"] = 0,
["cooldown"] = true,
["conditions"] = {
},
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "blzD9Q6M8CF",
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["icon"] = true,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.8",
["tocversion"] = 11500,
["id"] = "锤击",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["width"] = 38,
["alpha"] = 1,
["config"] = {
},
["inverse"] = true,
["cooldownEdge"] = false,
["displayIcon"] = 132136,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["parent"] = "德鲁伊 动态分组 右",
},
["复生（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 复生\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a复生|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 20484,
["realSpellName"] = "复生",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["use_genericShowOn"] = true,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["unit"] = "player",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 20484,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["parent"] = "Core - Druid",
["width"] = 48,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.8",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "复生（可点击施法）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "PE)w7y89aWN",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["Combo Point 1 - Druid"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["xOffset"] = 0,
["adjustedMax"] = "1",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["icon"] = false,
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["selfPoint"] = "TOP",
["barColor"] = {
0.85882352941176,
0.14509803921569,
0.050980392156863,
1,
},
["desaturate"] = false,
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["use_class"] = true,
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
[3] = true,
},
},
["size"] = {
["multi"] = {
},
},
},
["toolTipArea"] = "ICON",
["smoothProgress"] = false,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["texture"] = "Solid",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["spark"] = false,
["tocversion"] = 11500,
["alpha"] = 1,
["config"] = {
},
["colorState"] = "",
["sparkOffsetX"] = 0,
["wagoID"] = "Ner0rxotC",
["parent"] = "Combo Points - Druid",
["adjustedMin"] = "0",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["use_absorbMode"] = true,
["unevent"] = "auto",
["unit"] = "player",
["duration"] = "1",
["event"] = "Power",
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
["powertype"] = 4,
["spellIds"] = {
},
["use_power"] = false,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"768",
},
["unit"] = "player",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = 1,
},
["configGroup"] = "combo_points",
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["isPrimaryResource"] = false,
["version"] = 28,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
},
["height"] = 20,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = true,
["source"] = "import",
["sparkColor"] = {
1,
1,
1,
1,
},
["barColor2"] = {
1,
1,
0,
1,
},
["icon_side"] = "RIGHT",
["authorOptions"] = {
},
["actions"] = {
["start"] = {
["do_custom"] = false,
},
["init"] = {
["custom"] = "aura_env.region.configGroup = \"combo_points\"",
["do_custom"] = true,
},
["finish"] = {
},
},
["sparkHeight"] = 30,
["auto"] = true,
["uid"] = "2GvALqy0J87",
["backgroundColor"] = {
0,
0,
0,
0.34336978197098,
},
["semver"] = "2.0.25",
["zoom"] = 0,
["sparkHidden"] = "NEVER",
["width"] = 56,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["id"] = "Combo Point 1 - Druid",
["anchorFrameParent"] = false,
["inverse"] = false,
["internalVersion"] = 90,
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = "<=",
["variable"] = "power",
["value"] = "3",
},
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 1, 5)",
},
["property"] = "customcode",
},
},
},
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "4",
},
["linked"] = true,
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"highlight\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 1, 5)",
},
["property"] = "customcode",
},
},
},
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "5",
},
["linked"] = true,
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"full\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 1, 5)",
},
["property"] = "customcode",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
},
["野性印记（可点击施法，左键小，右键大）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
{
["subOptions"] = {
{
["useName"] = true,
["type"] = "header",
["text"] = "Behavior",
["noMerge"] = false,
["width"] = 1,
},
{
["subOptions"] = {
{
["type"] = "description",
["text"] = "Mark of the Wild",
["fontSize"] = "large",
["width"] = 1,
},
{
["type"] = "select",
["default"] = 2,
["values"] = {
"Show if Applied",
"Show if Missing",
"Always Show",
},
["key"] = "behavior",
["useDesc"] = false,
["name"] = "Behavior",
["width"] = 1,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["collapse"] = false,
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["name"] = "Mark of the Wild",
["key"] = "mark_of_the_wild",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["collapse"] = true,
["width"] = 1,
["useCollapse"] = true,
["noMerge"] = false,
["name"] = "Maintenance Icons",
["key"] = "maintenance",
["limitType"] = "none",
["groupType"] = "simple",
["type"] = "group",
["size"] = 10,
},
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = true,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"1126",
"21849",
},
["matchesShowOn"] = "showAlways",
["names"] = {
},
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["unit"] = "player",
["use_unit"] = true,
["spellIds"] = {
},
["use_itemName"] = true,
["useName"] = true,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n    \n    local behavior = aura_env.config.maintenance.mark_of_the_wild.behavior\n    \n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 1126,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "Core - Druid",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["uid"] = "iblMih4QexS",
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "野性印记（可点击施法，左键小，右键大）",
["semver"] = "2.0.8",
["useCooldownModRate"] = true,
["width"] = 48,
["zoom"] = 0.3,
["config"] = {
["maintenance"] = {
["mark_of_the_wild"] = {
["behavior"] = 2,
},
},
},
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
["changes"] = {
{
["value"] = {
1,
1,
1,
0.5,
},
["property"] = "color",
},
{
["value"] = true,
["property"] = "desaturate",
},
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 野性印记\")\nbtn:SetAttribute(\"macrotext2\",\"/cast 野性赐福\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a野性印记|r\\n|cffffffff右键：|r|cffff7c0a野性赐福|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
},
["迅捷治愈"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 18562,
["realSpellName"] = "迅捷治愈",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["use_genericShowOn"] = true,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["unit"] = "player",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"768",
"5487",
"9634",
},
["unit"] = "player",
["matchesShowOn"] = "showOnMissing",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["use_never"] = false,
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_exact_spellknown"] = false,
["spellknown"] = 18562,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["parent"] = "Core - Druid",
["width"] = 48,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.8",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "迅捷治愈",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "0Ud0qZm2Znb",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["生存本能（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["parent"] = "Core - Druid",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["match_countOperator"] = ">",
["names"] = {
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["useMatch_count"] = true,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["auranames"] = {
"408024",
},
["match_count"] = "0",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 408024,
["realSpellName"] = "生存本能",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["use_genericShowOn"] = true,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["names"] = {
},
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 408024,
["zoneIds"] = "",
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 生存本能\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a生存本能|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 48,
["anchorFrameParent"] = false,
["xOffset"] = 0,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.8",
["tocversion"] = 11500,
["id"] = "生存本能（可点击施法）",
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "r2k(2Id7Nxx",
["inverse"] = true,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["url"] = "https://space.bilibili.com/455259",
},
["Mana Bar - Druid"] = {
["overlays"] = {
{
0,
0,
0,
0.40000003576279,
},
},
["iconSource"] = -1,
["xOffset"] = 0,
["preferToUpdate"] = false,
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["icon"] = false,
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["selfPoint"] = "TOP",
["barColor"] = {
0.03921568627451,
0.45098039215686,
0.82745098039216,
1,
},
["desaturate"] = false,
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["use_class"] = true,
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
[3] = true,
},
},
["size"] = {
["multi"] = {
},
},
},
["toolTipArea"] = "ICON",
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["overlayclip"] = true,
["texture"] = "Solid",
["zoom"] = 0,
["spark"] = false,
["tocversion"] = 11500,
["alpha"] = 1,
["config"] = {
},
["sparkOffsetX"] = 0,
["wagoID"] = "Ner0rxotC",
["parent"] = "Resources - Druid",
["customText"] = "function()\n    local s = aura_env.state\n    local LWA = LWA and LWA[\"Druid\"] or {}\n    \n    if LWA and LWA.UpdateBarText then\n        local format = LWA.GetConfig(\"resources\").mana_bar.format\n        \n        return LWA.UpdateBarText(s.value, s.percentpower, format)\n    end\n    \n    return s.value\nend",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["duration"] = "1",
["unevent"] = "auto",
["unit"] = "player",
["use_absorbMode"] = true,
["use_showCost"] = true,
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
["powertype"] = 0,
["spellIds"] = {
},
["event"] = "Power",
["names"] = {
},
["subeventPrefix"] = "SPELL",
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["useName"] = true,
["debuffType"] = "HELPFUL",
["auranames"] = {
"768",
"5487",
"9634",
},
["type"] = "aura2",
["matchesShowOn"] = "showOnMissing",
["ownOnly"] = true,
["unit"] = "player",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend\n    \n    ",
["activeTriggerMode"] = 1,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["isPrimaryResource"] = true,
["version"] = 28,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_shadowXOffset"] = 1,
["text_text"] = "%c",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = true,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorYOffset"] = 0,
["anchorXOffset"] = 0,
["text_text_format_c_format"] = "none",
["type"] = "subtext",
["text_text_format_p_format"] = "timed",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_visible"] = true,
["text_shadowYOffset"] = -1,
["text_text_format_1.percentpower_format"] = "none",
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "INNER_CENTER",
["text_fontSize"] = 20,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_precision"] = 1,
},
},
["height"] = 20,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["source"] = "import",
["sparkWidth"] = 10,
["barColor2"] = {
1,
1,
0,
1,
},
["actions"] = {
["start"] = {
["do_message"] = false,
["custom"] = "",
["do_custom"] = false,
},
["init"] = {
["custom"] = "aura_env.region.configGroup = \"mana_bar\"",
["do_custom"] = true,
},
["finish"] = {
},
},
["icon_side"] = "RIGHT",
["adjustedMax"] = "",
["configGroup"] = "mana_bar",
["sparkHeight"] = 30,
["uid"] = "Of4tfbr7O)D",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["auto"] = true,
["semver"] = "2.0.25",
["width"] = 405,
["id"] = "Mana Bar - Druid",
["sparkHidden"] = "NEVER",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["backgroundColor"] = {
0,
0,
0,
0.30000001192093,
},
["sparkColor"] = {
1,
1,
1,
1,
},
["inverse"] = false,
["authorOptions"] = {
},
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMin"] = "",
},
["割裂"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = true,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["useName"] = true,
["spellIds"] = {
},
["auranames"] = {
"1079",
},
["ownOnly"] = true,
["unit"] = "target",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"768",
},
["unit"] = "player",
["ownOnly"] = true,
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["spellknown"] = 1079,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "Core - Druid",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["uid"] = "ddkzXtcnE1c",
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "割裂",
["semver"] = "2.0.8",
["useCooldownModRate"] = true,
["width"] = 48,
["zoom"] = 0.3,
["config"] = {
},
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 1,
},
{
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
},
{
["value"] = "0",
["op"] = "==",
["variable"] = "matchCount",
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = {
1,
1,
1,
0.5,
},
["property"] = "color",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
},
["回春术"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["parent"] = "Core - Druid",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = true,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["useName"] = true,
["spellIds"] = {
},
["auranames"] = {
"2090",
},
["ownOnly"] = true,
["unit"] = "target",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["unit"] = "player",
["auranames"] = {
"768",
"5487",
"9634",
},
["matchesShowOn"] = "showOnMissing",
["ownOnly"] = true,
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%s",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_color"] = {
1,
0.86274509803922,
0.62745098039216,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 22,
["anchorXOffset"] = 0,
["text_anchorYOffset"] = -4,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["spellknown"] = 2090,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["xOffset"] = 0,
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["authorOptions"] = {
},
["color"] = {
1,
1,
1,
1,
},
["uid"] = "FJIAeYy4UBW",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["alpha"] = 1,
["zoom"] = 0.3,
["semver"] = "2.0.8",
["tocversion"] = 11500,
["id"] = "回春术",
["auto"] = true,
["frameStrata"] = 1,
["width"] = 48,
["cooldownTextDisabled"] = false,
["config"] = {
},
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 1,
},
{
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
},
{
["value"] = "0",
["op"] = "==",
["variable"] = "matchCount",
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = {
1,
1,
1,
0.5,
},
["property"] = "color",
},
},
},
},
["cooldown"] = true,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
},
["野性冲锋"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 16979,
["realSpellName"] = "野性冲锋",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["use_genericShowOn"] = true,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["unit"] = "player",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 16979,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["parent"] = "Core - Druid",
["width"] = 48,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.8",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "野性冲锋",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "ZR5N1BFdeyi",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["Combo Points - Druid"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"Combo Point 1 - Druid",
"Combo Point 2 - Druid",
"Combo Point 3 - Druid",
"Combo Point 4 - Druid",
"Combo Point 5 - Druid",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "Ner0rxotC",
["parent"] = "Resources - Druid",
["preferToUpdate"] = false,
["hybridPosition"] = "hybridFirst",
["yOffset"] = 0,
["gridType"] = "RD",
["frameStrata"] = 1,
["useLimit"] = false,
["borderColor"] = {
0,
0,
0,
1,
},
["space"] = 2,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["names"] = {
},
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["radius"] = 200,
["rowSpace"] = 1,
["selfPoint"] = "TOP",
["align"] = "LEFT",
["growOn"] = "changed",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["grow"] = "CUSTOM",
["stagger"] = 0,
["authorOptions"] = {
},
["version"] = 28,
["subRegions"] = {
},
["anchorPoint"] = "CENTER",
["config"] = {
},
["load"] = {
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["rotation"] = 0,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["animate"] = false,
["source"] = "import",
["customGrow"] = "function(newPositions, activeRegions)\n    local LWA = LWA and LWA[\"Druid\"] or {}\n    \n    if LWA and LWA.GrowDynamicResource then\n        LWA.GrowDynamicResource(newPositions, activeRegions)\n    end\nend",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 6,
["alpha"] = 1,
["stepAngle"] = 15,
["constantFactor"] = "RADIUS",
["xOffset"] = 0,
["borderOffset"] = 4,
["semver"] = "2.0.25",
["tocversion"] = 11500,
["id"] = "Combo Points - Druid",
["sort"] = "none",
["gridWidth"] = 5,
["anchorFrameType"] = "SCREEN",
["internalVersion"] = 90,
["borderInset"] = 1,
["uid"] = "CAdAqbii(zf",
["fullCircle"] = true,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["sortHybridTable"] = {
["Combo Point 3 - Druid"] = false,
["Combo Point 2 - Druid"] = false,
["Combo Point 4 - Druid"] = false,
["Combo Point 1 - Druid"] = false,
["Combo Point 5 - Druid"] = false,
},
},
["节能施法/清晰预兆（德鲁伊，猫叫音效）"] = {
["iconSource"] = -1,
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\KittenMeow.ogg",
["do_sound"] = true,
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["use_debuffClass"] = false,
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["auranames"] = {
},
["unit"] = "player",
["spellIds"] = {
},
["useExactSpellId"] = true,
["subeventPrefix"] = "SPELL",
["auraspellids"] = {
"16870",
},
["useName"] = false,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = true,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorYOffset"] = 0,
["type"] = "subtext",
["anchorXOffset"] = 0,
["text_color"] = {
1,
0.97254901960784,
0.050980392156863,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 15,
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_text_format_p_time_mod_rate"] = true,
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "节能",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 1,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowXOffset"] = 0,
["glowType"] = "buttonOverlay",
["glowLength"] = 5,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glowScale"] = 1,
["glow"] = true,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["use_level"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = false,
["use_itemequiped"] = false,
["use_never"] = false,
["level_operator"] = {
">=",
},
["level"] = {
"20",
},
["spellknown"] = 16864,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["icon"] = true,
["url"] = "https://space.bilibili.com/455259",
["cooldown"] = true,
["displayIcon"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["parent"] = "【露露】德鲁伊（BUFF）",
["uid"] = "RUc4fwLtr5p",
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["duration_type"] = "seconds",
["preset"] = "slidebottom",
["easeStrength"] = 3,
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["anchorFrameParent"] = false,
["alpha"] = 1,
["color"] = {
1,
1,
1,
1,
},
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["tocversion"] = 20501,
["id"] = "节能施法/清晰预兆（德鲁伊，猫叫音效）",
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["desaturate"] = false,
["config"] = {
},
["inverse"] = false,
["adjustedMax"] = "",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["authorOptions"] = {
},
},
["月蚀（平衡）"] = {
["iconSource"] = 0,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"48518",
},
["event"] = "Health",
["names"] = {
},
["spellIds"] = {
},
["unit"] = "player",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["spellId"] = {
"48517",
},
["use_matchedRune"] = false,
["duration"] = "30",
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "combatlog",
["names"] = {
},
["unevent"] = "auto",
["sourceUnit"] = "player",
["use_genericShowOn"] = true,
["event"] = "Combat Log",
["use_spellId"] = true,
["realSpellName"] = 0,
["use_spellName"] = false,
["spellIds"] = {
},
["use_sourceUnit"] = true,
["subeventSuffix"] = "_AURA_APPLIED",
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["spellName"] = {
"",
},
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["type"] = "unit",
["use_alwaystrue"] = true,
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["use_percenthealth"] = true,
["event"] = "Conditions",
["unit"] = "player",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"768",
"5487",
"9634",
},
["unit"] = "player",
["matchesShowOn"] = "showOnMissing",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\nreturn t[4]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["progressSource"] = {
-1,
"",
},
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
[22] = true,
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_talent"] = false,
["use_class"] = true,
["use_spellknown"] = false,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 3674,
["zoneIds"] = "",
},
["internalVersion"] = 90,
["useAdjustededMax"] = false,
["xOffset"] = 0,
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = 135753,
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["adjustedMax"] = "",
["width"] = 48,
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.8",
["tocversion"] = 11500,
["id"] = "月蚀（平衡）",
["alpha"] = 1,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["uid"] = "9ebTNiTwp)7",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["property"] = "color",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["parent"] = "Core - Druid",
},
["低吼"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["names"] = {
},
["unitExists"] = false,
["useName"] = true,
["spellIds"] = {
},
["auranames"] = {
"6795",
},
["ownOnly"] = true,
["unit"] = "target",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["type"] = "spell",
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["realSpellName"] = "低吼",
["use_spellName"] = true,
["spellName"] = 6795,
["genericShowOn"] = "showOnCooldown",
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 38,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = true,
["use_spec"] = true,
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["spellknown"] = 6795,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["progressSource"] = {
-1,
"",
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "德鲁伊 动态分组 左",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["uid"] = "pK1SpNVEiIV",
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "低吼",
["semver"] = "2.0.8",
["useCooldownModRate"] = true,
["width"] = 38,
["zoom"] = 0.3,
["config"] = {
},
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
},
["树皮术（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 树皮术\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a树皮术|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useMatch_count"] = true,
["match_countOperator"] = ">",
["names"] = {
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["auranames"] = {
"22812",
},
["match_count"] = "0",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 22812,
["realSpellName"] = "树皮术",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["use_genericShowOn"] = true,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["unit"] = "player",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 22812,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["parent"] = "Core - Druid",
["width"] = 48,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.8",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "树皮术（可点击施法）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "zVHTa0vtfqJ",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["割碎（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["type"] = "aura2",
["unit"] = "target",
["names"] = {
},
["auranames"] = {
"407995",
},
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["spellName"] = 407995,
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "割碎",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["use_genericShowOn"] = true,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["unit"] = "player",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"5487",
"768",
},
["debuffType"] = "HELPFUL",
["ownOnly"] = true,
["useName"] = true,
["unit"] = "player",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[1] or t[2] and t[3]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 407995,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["parent"] = "Core - Druid",
["width"] = 48,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.8",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "割碎（符文）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "EKazP6dlf(Q",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "spellInRange",
["value"] = 0,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = {
0.874509871006012,
0.3411764800548554,
0.3294117748737335,
1,
},
["property"] = "color",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["重击（可点击施法，自动变巨熊）"] = {
["iconSource"] = -1,
["wagoID"] = "Ner0rxotC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cancelform [noform:1]\\n/cast [noform:1] 熊形态\\n/cast 重击\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff7c0a重击（自动变熊）|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"5211",
},
["event"] = "Health",
["names"] = {
},
["spellIds"] = {
},
["unit"] = "target",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["names"] = {
},
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "重击",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 5211,
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["use_track"] = true,
["duration"] = "1",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 11,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 48,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 5211,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["parent"] = "Core - Druid",
["width"] = 48,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.8",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "重击（可点击施法，自动变巨熊）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "2RBpqHiYPjY",
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
},
["changes"] = {
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
{
["value"] = false,
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["Combo Point 5 - Druid"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["xOffset"] = 0,
["adjustedMax"] = "5",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["icon"] = false,
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = false,
["selfPoint"] = "TOP",
["barColor"] = {
0.85882352941176,
0.14509803921569,
0.050980392156863,
1,
},
["desaturate"] = false,
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["use_class"] = true,
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
[3] = true,
},
},
["size"] = {
["multi"] = {
},
},
},
["toolTipArea"] = "ICON",
["smoothProgress"] = false,
["useAdjustededMin"] = true,
["regionType"] = "aurabar",
["texture"] = "Solid",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["spark"] = false,
["tocversion"] = 11500,
["alpha"] = 1,
["config"] = {
},
["colorState"] = "",
["sparkOffsetX"] = 0,
["wagoID"] = "Ner0rxotC",
["parent"] = "Combo Points - Druid",
["adjustedMin"] = "4",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["use_absorbMode"] = true,
["unevent"] = "auto",
["unit"] = "player",
["duration"] = "1",
["event"] = "Power",
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
["powertype"] = 4,
["spellIds"] = {
},
["use_power"] = false,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"768",
},
["unit"] = "player",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = 1,
},
["configGroup"] = "combo_points",
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["isPrimaryResource"] = false,
["version"] = 28,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
},
["height"] = 20,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = true,
["source"] = "import",
["sparkColor"] = {
1,
1,
1,
1,
},
["barColor2"] = {
1,
1,
0,
1,
},
["icon_side"] = "RIGHT",
["authorOptions"] = {
},
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "aura_env.region.configGroup = \"combo_points\"",
["do_custom"] = true,
},
["finish"] = {
},
},
["sparkHeight"] = 30,
["auto"] = true,
["uid"] = "xYUAViyXt2E",
["backgroundColor"] = {
0,
0,
0,
0.34336978197098,
},
["semver"] = "2.0.25",
["zoom"] = 0,
["sparkHidden"] = "NEVER",
["width"] = 56,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["id"] = "Combo Point 5 - Druid",
["anchorFrameParent"] = false,
["inverse"] = false,
["internalVersion"] = 90,
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = "<=",
["variable"] = "power",
["value"] = "3",
},
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 5, 5)",
},
["property"] = "customcode",
},
},
},
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "4",
},
["linked"] = true,
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"highlight\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 5, 5)",
},
["property"] = "customcode",
},
},
},
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "5",
},
["linked"] = true,
["changes"] = {
{
["value"] = {
["custom"] = "aura_env.region.colorState = \"full\"\nWeakAuras.ScanEvents(\"LWA_UPDATE_BAR\", aura_env, 5, 5)",
},
["property"] = "customcode",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
},
["怒风之怒（符文，露露语音）"] = {
["iconSource"] = 0,
["parent"] = "【露露】德鲁伊（BUFF）",
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["use_debuffClass"] = false,
["auraspellids"] = {
},
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["useExactSpellId"] = false,
["unit"] = "player",
["spellIds"] = {
},
["auranames"] = {
"414800",
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["preset"] = "slidebottom",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "%p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_mod_rate"] = true,
["type"] = "subtext",
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_color"] = {
1,
0.97254901960784,
0.050980392156863,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_legacy_floor"] = true,
["text_shadowYOffset"] = 0,
["text_shadowXOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "秒触",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_shadowYOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 1,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["anchorXOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_text_format_p_format"] = "timed",
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 15,
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_time_format"] = 0,
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowLength"] = 5,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = true,
["glowScale"] = 1,
["useGlowColor"] = false,
["glowXOffset"] = 0,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "DRUID",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["use_level"] = false,
["level_operator"] = {
">=",
},
["level"] = {
"20",
},
["spellknown"] = 414799,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["authorOptions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["conditions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["url"] = "https://space.bilibili.com/455259",
["config"] = {
},
["actions"] = {
["start"] = {
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】BIU.ogg",
["sound"] = " custom",
["do_sound"] = true,
},
["finish"] = {
},
["init"] = {
},
},
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["selfPoint"] = "CENTER",
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["tocversion"] = 20501,
["id"] = "怒风之怒（符文，露露语音）",
["frameStrata"] = 1,
["alpha"] = 1,
["width"] = 30,
["desaturate"] = false,
["uid"] = "rmN2bCZ9I7X",
["inverse"] = false,
["adjustedMax"] = "",
["displayIcon"] = 136041,
["cooldown"] = true,
["xOffset"] = 0,
},
},
}
