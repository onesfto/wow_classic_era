
WeakAurasSaved = {
["editor_tab_spaces"] = 4,
["login_squelch_time"] = 10,
["PULL(Need DBM BW ERT)PULL"] = 5,
["dbVersion"] = 90,
["标记目标 Mark TargetSet"] = false,
["displays"] = {
["大地之盾（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
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
["group_countOperator"] = ">",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["auranames"] = {
"408514",
},
["useGroup_count"] = true,
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "group",
["ignoreDisconnected"] = true,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["useName"] = true,
["group_count"] = "0",
["names"] = {
},
["ignoreDead"] = true,
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
["spellName"] = 408514,
["realSpellName"] = "大地之盾",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%s",
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_p_time_dynamic_threshold"] = 60,
["type"] = "subtext",
["text_text_format_p_time_precision"] = 1,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_format"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_anchorYOffset"] = -3,
["anchor_point"] = "TOP",
["text_fontSize"] = 17,
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 408514,
["size"] = {
["multi"] = {
},
},
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "萨满 核心分组",
["cooldown"] = true,
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.3.glow",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
},
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "yss2EJwRmpQ",
["authorOptions"] = {
},
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["semver"] = "2.0.6",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "大地之盾（符文）",
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["width"] = 32,
["frameStrata"] = 1,
["config"] = {
},
["inverse"] = false,
["color"] = {
1,
1,
1,
1,
},
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["url"] = "https://space.bilibili.com/455259",
},
["火系图腾"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = false,
["cooldownEdge"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["track"] = "auto",
["itemName"] = 0,
["use_absorbMode"] = true,
["genericShowOn"] = "showAlways",
["use_unit"] = true,
["use_showgcd"] = true,
["remaining"] = "0",
["use_genericShowOn"] = true,
["names"] = {
},
["use_totemType"] = true,
["debuffType"] = "HELPFUL",
["duration"] = "1",
["use_remaining"] = false,
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
["spellName"] = 5394,
["use_itemName"] = true,
["event"] = "Totem",
["totemType"] = 1,
["realSpellName"] = "Healing Stream Totem",
["use_spellName"] = true,
["spellIds"] = {
},
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["remaining_operator"] = ">",
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
"8182",
},
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["unit"] = "player",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
[3] = true,
},
},
["use_class"] = true,
["use_spellknown"] = false,
["use_spec"] = true,
["size"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "SHAMAN",
["multi"] = {
},
},
["class_and_spec"] = {
["single"] = 264,
["multi"] = {
[264] = true,
},
},
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = 135825,
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "火系图腾",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "g()KUeTejL9",
["inverse"] = false,
["parent"] = "萨满 动态分组 左",
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
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
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
["icon"] = true,
},
["主手武器附魔"] = {
["iconSource"] = 3,
["wagoID"] = "p-wCoCa05",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
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
["enchant"] = "",
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"465",
"7294",
"19746",
"19876",
"19888",
"19891",
"32223",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["unitExists"] = true,
["use_weapon"] = true,
["matchesShowOn"] = "showAlways",
["subeventPrefix"] = "SPELL",
["use_enchant"] = false,
["use_unit"] = true,
["spellName"] = 0,
["type"] = "item",
["useName"] = true,
["unevent"] = "auto",
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["event"] = "Weapon Enchant",
["use_itemName"] = true,
["debuffType"] = "HELPFUL",
["realSpellName"] = 0,
["use_spellName"] = true,
["spellIds"] = {
},
["duration"] = "1",
["showOn"] = "showOnActive",
["names"] = {
},
["use_track"] = true,
["weapon"] = "main",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["enchant"] = "",
["auranames"] = {
"465",
"7294",
"19746",
"19876",
"19888",
"19891",
"32223",
},
["remaining_operator"] = "<=",
["remaining"] = "60",
["use_weapon"] = true,
["spellName"] = 0,
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["use_itemName"] = true,
["use_track"] = true,
["itemName"] = 6265,
["use_count"] = false,
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["unitExists"] = true,
["unit"] = "player",
["debuffType"] = "HELPFUL",
["use_genericShowOn"] = true,
["useName"] = true,
["matchesShowOn"] = "showAlways",
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["event"] = "Weapon Enchant",
["duration"] = "1",
["use_enchant"] = false,
["realSpellName"] = 0,
["use_spellName"] = true,
["spellIds"] = {
},
["type"] = "item",
["showOn"] = "showOnActive",
["use_remaining"] = true,
["use_unit"] = true,
["weapon"] = "main",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 0,
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["unit"] = "player",
["itemSlot"] = 16,
["use_weapon"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["use_itemTypeName"] = true,
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["use_itemName"] = true,
["use_itemSlot"] = true,
["spellIds"] = {
},
["names"] = {
},
["showOn"] = "showAlways",
["subeventPrefix"] = "SPELL",
["event"] = "Cooldown Progress (Equipment Slot)",
["weapon"] = "main",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["use_unit"] = true,
["use_resting"] = true,
["debuffType"] = "HELPFUL",
["event"] = "Conditions",
["unit"] = "player",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_text_format_p_time_precision"] = 1,
["text_text"] = "主手",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_shadowXOffset"] = 0,
["anchorXOffset"] = 0,
["anchorYOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 1,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_format"] = "timed",
["text_anchorYOffset"] = 0,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_shadowYOffset"] = 0,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 14,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_format"] = 0,
},
},
["height"] = 32,
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "SHAMAN",
["multi"] = {
},
},
["use_class"] = true,
["use_itemtypeequipped"] = false,
["itemtypeequipped"] = {
["multi"] = {
[516] = true,
[525] = true,
[513] = true,
[522] = true,
[517] = true,
[512] = true,
[527] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["use_spellknown"] = true,
["spellknown"] = 8017,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["cooldown"] = true,
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 1,
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = true,
["property"] = "sub.2.glow",
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
["variable"] = "show",
["value"] = 1,
},
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 1,
},
},
},
["changes"] = {
{
["value"] = false,
["property"] = "desaturate",
},
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
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "60",
["op"] = ">=",
},
["changes"] = {
{
["property"] = "sub.3.text_visible",
},
},
},
},
["parent"] = "萨满 动态分组 左",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "tFHGKU8F6)B",
["icon"] = true,
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["xOffset"] = 0,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "主手武器附魔",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 32,
["alpha"] = 1,
["config"] = {
},
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["color"] = {
1,
1,
1,
1,
},
},
["风暴打击"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
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
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["unit"] = "player",
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "风暴打击",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 17364,
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 17364,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "风暴打击",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "WBpY1V75pZc",
["inverse"] = true,
["parent"] = "萨满 核心分组",
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
{
["check"] = {
["trigger"] = 1,
["variable"] = "spellInRange",
["value"] = 0,
["checks"] = {
{
["trigger"] = -1,
["variable"] = "hastarget",
["value"] = 1,
},
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = {
0.87450980392157,
0.34117647058824,
0.32941176470588,
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
},
["cooldown"] = true,
["icon"] = true,
},
["乱舞（萨满，符文）"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!IOS-竹子.ogg",
["do_sound"] = false,
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
["unit"] = "player",
["auraspellids"] = {
},
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["useExactSpellId"] = false,
["names"] = {
},
["auranames"] = {
"16284",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
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
["text_shadowXOffset"] = 0,
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
["text_text"] = "%n",
["text_shadowXOffset"] = 0,
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_n_pad"] = false,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_fontSize"] = 15,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_format"] = "timed",
["text_anchorYOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 1,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_fontType"] = "OUTLINE",
["text_shadowYOffset"] = 0,
["text_text_format_p_time_format"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_n_format"] = "string",
["text_text_format_n_abbreviate_max"] = 2,
["anchor_point"] = "OUTER_TOP",
["text_text_format_n_pad_max"] = 8,
["text_text_format_n_pad_mode"] = "left",
["text_text_format_n_abbreviate"] = true,
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
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
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
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
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
["glowScale"] = 1,
["glowDuration"] = 1,
["glowThickness"] = 1,
["glowXOffset"] = 0,
["glow"] = true,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["ingroup"] = {
},
["use_never"] = false,
["talent"] = {
["multi"] = {
[64] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = false,
["use_itemequiped"] = false,
["faction"] = {
},
["class"] = {
["single"] = "SHAMAN",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 413248,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["desaturate"] = false,
["cooldownEdge"] = false,
["cooldown"] = true,
["displayIcon"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["adjustedMax"] = "",
["xOffset"] = 0,
["uid"] = "Mf0DMs5V9)v",
["keepAspectRatio"] = false,
["anchorFrameParent"] = false,
["alpha"] = 1,
["parent"] = "【露露】萨满（BUFF）",
["cooldownTextDisabled"] = false,
["icon"] = true,
["tocversion"] = 30403,
["id"] = "乱舞（萨满，符文）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["config"] = {
},
["inverse"] = false,
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
["easeType"] = "none",
["duration_type"] = "seconds",
["preset"] = "bounce",
["easeStrength"] = 3,
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["color"] = {
1,
1,
1,
1,
},
},
["先祖指引（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["parent"] = "萨满 核心分组",
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
["useName"] = true,
["auranames"] = {
"409324",
},
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["spellIds"] = {
},
["type"] = "aura2",
["unit"] = "player",
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
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["realSpellName"] = "先祖指引",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 409324,
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 409324,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["xOffset"] = 0,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "先祖指引（符文）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["uid"] = "AnHXGLMG3K(",
["inverse"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
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
["cooldownEdge"] = false,
},
["地缚图腾"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
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
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 2484,
["realSpellName"] = "地缚图腾",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 2484,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "地缚图腾",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "L3Nhy6IhR3Z",
["inverse"] = true,
["parent"] = "萨满 核心分组",
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
},
["cooldown"] = true,
["icon"] = true,
},
["元素掌握"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
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
["type"] = "aura2",
["auranames"] = {
"16166",
},
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["spellIds"] = {
},
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
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
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 16166,
["realSpellName"] = "元素掌握",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 16166,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "元素掌握",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "OCPY1FXIVsn",
["inverse"] = false,
["parent"] = "萨满 核心分组",
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
["icon"] = true,
},
["根基图腾"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
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
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 8177,
["realSpellName"] = "根基图腾",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 8177,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "根基图腾",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "SfAYsT3AVre",
["inverse"] = true,
["parent"] = "萨满 核心分组",
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
},
["cooldown"] = true,
["icon"] = true,
},
["萨满 法力条"] = {
["overlays"] = {
{
0,
0,
0,
0.4000000357627869,
},
},
["iconSource"] = -1,
["authorOptions"] = {
},
["preferToUpdate"] = true,
["yOffset"] = -4,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["custom"] = "local c1, c2 = CreateColor(1,0.76,0.53,1), CreateColor(1,0.96,0.88,1)\n---------------------------------------\n\nif not aura_env.region.bar.gradient then\n    aura_env.region.bar.gradient = aura_env.region.bar:CreateTexture()\n    aura_env.region.bar.mask = aura_env.region.bar:CreateMaskTexture()\nend\n\nlocal bar = aura_env.region.bar\nlocal gradient = bar.gradient\nlocal mask = bar.mask\n\ngradient:SetTexture(bar:GetTexture())\ngradient:SetAllPoints(bar.bg)\ngradient:SetGradient(\"HORIZONTAL\",c1,c2)\n\nmask:SetTexture([[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite]], \"CLAMPTOBLACKADDITIVE\", \"CLAMPTOBLACKADDITIVE\", \"NEAREST\")\nmask:SetAllPoints(bar.fg)\n\nbar.fg:SetAlpha(0)\ngradient:AddMaskTexture(mask)",
["do_custom"] = false,
},
},
["fontFlags"] = "OUTLINE",
["icon_color"] = {
1,
1,
1,
1,
},
["enableGradient"] = true,
["selfPoint"] = "CENTER",
["barColor"] = {
0.0470588281750679,
0.4549019932746887,
0.8352941870689392,
1,
},
["desaturate"] = false,
["sparkOffsetY"] = 1,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["ingroup"] = {
["multi"] = {
},
},
["use_never"] = false,
["use_class_and_spec"] = false,
["use_class"] = true,
["use_dragonriding"] = false,
["use_spec"] = false,
["zoneIds"] = "",
["talent2"] = {
["multi"] = {
},
},
["class_and_spec"] = {
["single"] = 257,
["multi"] = {
[257] = true,
[256] = true,
},
},
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
true,
true,
},
},
["difficulty"] = {
["multi"] = {
},
},
["faction"] = {
["multi"] = {
},
},
["pvptalent"] = {
["multi"] = {
},
},
["use_vehicleUi"] = false,
["race"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "SHAMAN",
["multi"] = {
["SHAMAN"] = true,
["MONK"] = true,
["ROGUE"] = true,
},
},
["size"] = {
["multi"] = {
},
},
["role"] = {
["multi"] = {
},
},
},
["toolTipArea"] = "ICON",
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["texture"] = "Solid",
["zoom"] = 0,
["auto"] = true,
["tocversion"] = 100200,
["alpha"] = 1,
["sparkColor"] = {
1,
0.94901960784314,
0,
1,
},
["borderBackdrop"] = "None",
["wagoID"] = "tRi9estlC",
["parent"] = "萨满 资源条",
["customText"] = "function()\n    local mana = UnitPower(\"player\",0)\n    local manaMax = UnitPowerMax(\"player\",0)\n    local manaPerc = (mana / manaMax) * 100\n    return string.format(\"%.0f\",manaPerc)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
["customTextUpdate"] = "event",
["triggers"] = {
{
["trigger"] = {
["duration"] = "1",
["use_showCost"] = true,
["unit"] = "player",
["powertype"] = 0,
["use_powertype"] = true,
["custom_hide"] = "timed",
["debuffType"] = "HELPFUL",
["type"] = "unit",
["genericShowOn"] = "showOnCooldown",
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["unevent"] = "auto",
["event"] = "Power",
["use_genericShowOn"] = true,
["realSpellName"] = "Прославление",
["use_spellName"] = true,
["spellIds"] = {
200183,
},
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["ownOnly"] = true,
["names"] = {
"Прославление",
},
["spellName"] = 200183,
},
["untrigger"] = {
["spellName"] = 200183,
},
},
["disjunctive"] = "any",
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
["easeType"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["preset"] = "fade",
},
["main"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["finish"] = {
["colorR"] = 1,
["scalex"] = 1,
["alphaType"] = "custom",
["colorA"] = 1,
["colorG"] = 1,
["alphaFunc"] = "urn function(progress, start, delta)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    return start + (((math.sin(angle) + 1)/2) * delta)\nend\n\n\n",
["use_translate"] = false,
["use_alpha"] = false,
["type"] = "none",
["easeType"] = "none",
["translateFunc"] = "function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
["scaley"] = 1,
["alpha"] = 0,
["duration"] = "",
["y"] = 0,
["x"] = 0,
["duration_type"] = "seconds",
["rotate"] = 0,
["translateType"] = "straightTranslate",
["easeStrength"] = 3,
["preset"] = "fade",
["colorB"] = 1,
},
},
["backdropInFront"] = false,
["stickyDuration"] = false,
["version"] = 3,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.power (%1.percentpower%%)",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_1.power_round_type"] = "floor",
["text_text_format_c_format"] = "none",
["rotateText"] = "NONE",
["text_color"] = {
1,
1,
1,
1,
},
["text_text_format_1.power_pad_max"] = 8,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_1.percentpower_decimal_precision"] = 0,
["text_text_format_1.power_decimal_precision"] = 0,
["text_text_format_1.percentpower_pad"] = false,
["text_text_format_1.power_format"] = "Number",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_font"] = "Rurutia",
["text_text_format_1.percentpower_round_type"] = "floor",
["text_anchorYOffset"] = -0.5,
["text_text_format_1.percentpower_format"] = "Number",
["text_visible"] = true,
["text_text_format_1.power_pad"] = false,
["text_fixedWidth"] = 64,
["text_selfPoint"] = "AUTO",
["anchor_point"] = "INNER_CENTER",
["text_text_format_1.power_pad_mode"] = "left",
["text_text_format_1.percentpower_pad_mode"] = "left",
["text_text_format_1.percentpower_pad_max"] = 8,
},
},
["height"] = 17,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["source"] = "import",
["config"] = {
},
["barColor2"] = {
0.2235294282436371,
0.6274510025978088,
0.9921569228172302,
1,
},
["spark"] = false,
["adjustedMax"] = "",
["uid"] = "QhcXcHVqvJU",
["xOffset"] = 0,
["borderInFront"] = false,
["backgroundColor"] = {
0,
0,
0,
0.300000011920929,
},
["icon_side"] = "RIGHT",
["sparkRotationMode"] = "MANUAL",
["width"] = 255,
["sparkHeight"] = 20,
["backdropColor"] = {
1,
1,
1,
0,
},
["overlaysTexture"] = {
"Solid",
},
["icon"] = false,
["semver"] = "1.1.0",
["sparkHidden"] = "BOTH",
["id"] = "萨满 法力条",
["sparkOffsetX"] = 0,
["frameStrata"] = 2,
["anchorFrameType"] = "SCREEN",
["sparkWidth"] = 5,
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["inverse"] = false,
["sparkDesature"] = false,
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
["熔岩爆裂（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["parent"] = "萨满 核心分组",
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
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
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
["realSpellName"] = "熔岩爆裂",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 408490,
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["use_track"] = true,
["use_genericShowOn"] = true,
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 408490,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["xOffset"] = 0,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "熔岩爆裂（符文）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["uid"] = "uoKJAduS)7u",
["inverse"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
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
{
["check"] = {
["trigger"] = 1,
["variable"] = "spellInRange",
["value"] = 0,
["checks"] = {
{
["trigger"] = -1,
["variable"] = "hastarget",
["value"] = 1,
},
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = {
0.87450980392157,
0.34117647058824,
0.32941176470588,
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
["variable"] = "insufficientResources",
["value"] = 1,
["checks"] = {
{
["trigger"] = -1,
["variable"] = "hastarget",
["value"] = 1,
},
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = {
0.4745098352432251,
0.5137255191802979,
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
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["烈焰震击"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
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
["type"] = "aura2",
["auranames"] = {
"8050",
},
["group_countOperator"] = ">",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["useGroup_count"] = true,
["spellIds"] = {
},
["useName"] = true,
["group_count"] = "0",
["subeventPrefix"] = "SPELL",
["unit"] = "target",
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
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 8050,
["realSpellName"] = "烈焰震击",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "SHAMAN",
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
["spellknown"] = 8050,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
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
["selfPoint"] = "CENTER",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["uid"] = "9PdU(SCgKRF",
["parent"] = "萨满 核心分组",
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "烈焰震击",
["auto"] = true,
["alpha"] = 1,
["width"] = 32,
["zoom"] = 0.3,
["config"] = {
},
["inverse"] = false,
["xOffset"] = 0,
["conditions"] = {
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
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
["trigger"] = 1,
["variable"] = "spellInRange",
["value"] = 0,
["checks"] = {
{
["trigger"] = -1,
["variable"] = "hastarget",
["value"] = 1,
},
{
["value"] = 0,
["variable"] = "show",
},
},
},
["changes"] = {
{
["value"] = {
0.87450980392157,
0.34117647058824,
0.32941176470588,
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
},
["cooldown"] = true,
["authorOptions"] = {
},
},
["石爪图腾"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
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
["names"] = {
},
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["realSpellName"] = "石爪图腾",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 6390,
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 6390,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["cooldown"] = true,
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
["uid"] = "mT5rN2Sdkvd",
["icon"] = true,
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["xOffset"] = 0,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "石爪图腾",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 32,
["alpha"] = 1,
["config"] = {
},
["inverse"] = true,
["url"] = "https://space.bilibili.com/455259",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["parent"] = "萨满 核心分组",
},
["冰霜震击"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"8056",
},
["group_countOperator"] = ">",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["useGroup_count"] = true,
["spellIds"] = {
},
["useName"] = true,
["group_count"] = "0",
["subeventPrefix"] = "SPELL",
["unit"] = "target",
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
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 8056,
["realSpellName"] = "冰霜震击",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["single"] = 264,
["multi"] = {
[264] = true,
},
},
["talent"] = {
["single"] = 8,
["multi"] = {
[2] = true,
[8] = true,
},
},
["class"] = {
["single"] = "SHAMAN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["use_never"] = false,
["spellknown"] = 8056,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["cooldown"] = true,
["conditions"] = {
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
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
["trigger"] = 1,
["variable"] = "spellInRange",
["value"] = 0,
["checks"] = {
{
["trigger"] = -1,
["variable"] = "hastarget",
["value"] = 1,
},
{
["value"] = 0,
["variable"] = "show",
},
},
},
["changes"] = {
{
["value"] = {
0.87450980392157,
0.34117647058824,
0.32941176470588,
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
},
["parent"] = "萨满 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "ozVAQ3Nz9L2",
["icon"] = true,
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["xOffset"] = 0,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "冰霜震击",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 32,
["alpha"] = 1,
["config"] = {
},
["inverse"] = true,
["url"] = "https://space.bilibili.com/455259",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["color"] = {
1,
1,
1,
1,
},
},
["萨满 核心分组"] = {
["grow"] = "CUSTOM",
["controlledChildren"] = {
"盾牌精通（符文）",
"治疗之雨（符文）",
"先祖指引（符文）",
"大地之盾（符文）",
"激流（符文）",
"萨满之怒（符文）",
"熔岩爆裂（符文）",
"熔岩猛击（符文）",
"熔火爆裂（符文）",
"风暴打击",
"大地震击",
"烈焰震击",
"图腾投掷（符文）",
"头狼之魂（符文）",
"冰霜震击",
"自然迅捷（萨满）",
"法力之潮图腾",
"大地震击（恢复）",
"元素掌握",
"星界传送",
"火焰新星",
"根基图腾",
"石爪图腾",
"地缚图腾",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["parent"] = "萨满（中心分组，by 露露緹婭@Bilibili）",
["preferToUpdate"] = true,
["stepAngle"] = 15,
["yOffset"] = 0.5,
["anchorPoint"] = "CENTER",
["alpha"] = 1,
["selfPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["space"] = 3,
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
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["event"] = "Health",
["names"] = {
},
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["radius"] = 200,
["sortHybridTable"] = {
["法力护盾（可点击施法）"] = false,
["寒冰屏障（可点击施法，左键冰箱，右键取消）"] = false,
["气定神闲（可点击施法）"] = false,
["法术反制（可点击施法，左键反目标，右键反焦点）"] = false,
["燃烧（可点击施法）"] = false,
["唤醒（可点击施法）"] = false,
["活动炸弹（符文）"] = false,
["奥术强化（可点击施法）"] = false,
["时光倒转（符文）"] = false,
["次级隐形术（可点击施法）"] = false,
["冰霜新星"] = false,
["冰冷血脉（符文，可点击施法）"] = false,
["急速冷却（可点击施法）"] = false,
["群体再生（符文）"] = false,
["防护火焰结界/防护冰霜结界（可点击施法，左右键）"] = false,
["寒冰护体（可点击施法）"] = false,
["冲击波"] = false,
["闪现术"] = false,
["活体烈焰（符文）"] = false,
["火焰冲击"] = false,
},
["useLimit"] = false,
["align"] = "CENTER",
["growOn"] = "changed",
["authorOptions"] = {
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
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
["version"] = 3,
["arcLength"] = 360,
["groupIcon"] = "interface/icons/classicon_shaman.blp",
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
["borderInset"] = 1,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["fullCircle"] = true,
["animate"] = false,
["customGrow"] = "function(newPositions, activeRegions)\n    local limits = { --icons per row\n        6, --row 1\n        9, --row 2\n        \n    }\n    local rows = #limits -- total rows (matches limits size)\n    local iconSizes = { --have to match #limits size (if limits is {x,y} iconSizes have to be {a, b}, i.e. 2 and 2)\n        40, --row 1\n        35, --row 2\n        \n    }\n    local spacings = {\n        1, --row 1\n        25, --row 2\n        \n    }\n    \n    -- spacing between icons\n    local checkFit = true --resize only if total clones > totalWidth. Otherwise 1-2 icons will be giga huge\n    ----------------------\n    local check = true\n    \n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    local lastRowCount = 0\n    \n    local limit = limits[yCount+1]\n    local firstRowLimit = limits[yCount+1]\n    \n    local xSpacing = 3\n    local ySpacing = spacings[yCount+1]\n    local offset = spacings[yCount+1]\n    \n    local xOffset = 0\n    local yOffset = 0\n    \n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        \n        local region = regionData.region\n        if iconSizes[yCount+1] then\n            regionData.region:SetRegionWidth(iconSizes[yCount+1])\n            regionData.region:SetRegionHeight(iconSizes[yCount+1])\n        end\n        \n        local why = 0\n        for i=1, yCount+1 do\n            local wtf = (i==1 or i==yCount+1) and iconSizes[i]/2 or iconSizes[i]\n            why = why + wtf\n        end\n        local shift = yCount == 0 and 0 or why + offset\n        \n        local width = width or region.width\n        local totalWidth = totalWidth or (width + xSpacing) * limit\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= firstRowLimit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows - 1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        if yCount == rows - 1 then\n            local fit = checkFit and (width + xSpacing) * rowTotal < totalWidth\n            local lastRowWidth = fit and width or ((totalWidth - (rowTotal * xSpacing)) / rowTotal)\n            \n            xOffset = 0 - (lastRowWidth + xSpacing) / 2 * (rowTotal - 1) + (lastRowCount * (lastRowWidth + xSpacing))\n            yOffset = 0 - (shift - (width - lastRowWidth) / 2)-- change '-' to '+' after 0 to grow up instead of down\n            \n            lastRowCount = lastRowCount + 1\n            \n            regionData.region:SetRegionWidth(lastRowWidth)\n            regionData.region:SetRegionHeight(lastRowWidth)\n        else\n            xOffset = 0 - (width + xSpacing) / 2 * (rowTotal - 1) + (xCount * (width + xSpacing))\n            yOffset = 0 - shift\n        end\n        \n        xCount = xCount + 1\n        \n        if yCount < rows - 1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n                limit = limits[yCount+1]\n                ySpacing = spacings[yCount+1]\n                offset = offset + ySpacing\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 5,
["frameStrata"] = 1,
["source"] = "import",
["constantFactor"] = "RADIUS",
["gridType"] = "RD",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "萨满 核心分组",
["sort"] = "none",
["gridWidth"] = 5,
["anchorFrameType"] = "SCREEN",
["rowSpace"] = 1,
["uid"] = "HYTDJY5FIr8",
["xOffset"] = 0,
["rotation"] = 0,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["internalVersion"] = 90,
},
["萨满（60plus，by 露露緹婭@Bilibili） 1005更"] = {
["controlledChildren"] = {
"【露露】萨满（BUFF）",
"萨满（中心分组，by 露露緹婭@Bilibili）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 0,
["groupIcon"] = "interface/icons/classicon_shaman.blp",
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
["id"] = "萨满（60plus，by 露露緹婭@Bilibili） 1005更",
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
["uid"] = "hVsrAid6cu3",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
},
["alpha"] = 1,
},
["水之护盾/闪电之盾（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
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
["track"] = "auto",
["auranames"] = {
"408511",
"905",
},
["ownOnly"] = true,
["genericShowOn"] = "showAlways",
["use_unit"] = true,
["use_showgcd"] = true,
["matchesShowOn"] = "showAlways",
["use_genericShowOn"] = true,
["unit"] = "player",
["spellName"] = 8042,
["debuffType"] = "HELPFUL",
["subeventPrefix"] = "SPELL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["unevent"] = "auto",
["type"] = "aura2",
["talent"] = {
["single"] = 89,
},
["event"] = "Talent Known",
["use_exact_spellName"] = false,
["realSpellName"] = "大地震击",
["use_spellName"] = true,
["spellIds"] = {
},
["duration"] = "1",
["use_inverse"] = false,
["use_talent"] = true,
["use_track"] = true,
["names"] = {
},
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["track"] = "auto",
["auranames"] = {
"408511",
"905",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = true,
["names"] = {
},
["use_talent"] = true,
["use_inverse"] = false,
["debuffType"] = "HELPFUL",
["spellName"] = 905,
["duration"] = "1",
["type"] = "spell",
["unevent"] = "auto",
["subeventSuffix"] = "_CAST_START",
["useName"] = true,
["talent"] = {
["single"] = 89,
},
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "闪电之盾",
["use_spellName"] = true,
["spellIds"] = {
},
["ownOnly"] = true,
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["matchesShowOn"] = "showAlways",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["type"] = "spell",
["spellName"] = 408510,
["talent"] = {
},
["use_exact_spellName"] = true,
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["realSpellName"] = 0,
["use_spellName"] = true,
["use_unit"] = true,
["use_spec"] = true,
["event"] = "Spell Known",
["use_talent"] = false,
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_text_format_p_time_precision"] = 1,
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
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorYOffset"] = 0,
["text_text_format_p_time_dynamic_threshold"] = 60,
["type"] = "subtext",
["text_shadowXOffset"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_format"] = 0,
["text_anchorYOffset"] = -3,
["text_text_format_p_time_mod_rate"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_shadowYOffset"] = 0,
["anchor_point"] = "TOP",
["text_fontSize"] = 17,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
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
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["single"] = 264,
["multi"] = {
[264] = true,
},
},
["talent"] = {
["single"] = 8,
["multi"] = {
[2] = true,
[8] = true,
},
},
["class"] = {
["single"] = "SHAMAN",
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
["single"] = 1,
["multi"] = {
},
},
["use_never"] = false,
["spellknown"] = 905,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 闪电之盾\")\nbtn:SetAttribute(\"macrotext2\",\"/cast 水之护盾\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff露露的快捷按钮\\n左键：|r|cff0070dd\"..\"闪电之盾\"..\"|r|cffffffff\\n右键：|r|cff3fc6ea\"..\"水之护盾\"..\"|r\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
["do_custom"] = true,
},
["finish"] = {
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
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
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
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
["semver"] = "2.0.6",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "水之护盾/闪电之盾（可点击施法）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "jnnfIL20raj",
["inverse"] = false,
["parent"] = "萨满 动态分组 右",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
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
["trigger"] = 3,
["variable"] = "show",
["value"] = 0,
},
["changes"] = {
{
["value"] = 0,
["property"] = "iconSource",
},
{
["value"] = 136051,
["property"] = "displayIcon",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["萨满 底部分组"] = {
["grow"] = "HORIZONTAL",
["controlledChildren"] = {
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["xOffset"] = 0,
["preferToUpdate"] = true,
["stepAngle"] = 15,
["yOffset"] = -103,
["gridType"] = "RD",
["gridWidth"] = 5,
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
["fullCircle"] = true,
["rowSpace"] = 1,
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
["subeventPrefix"] = "SPELL",
["names"] = {
},
["event"] = "Health",
["unit"] = "player",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["radius"] = 200,
["arcLength"] = 360,
["selfPoint"] = "CENTER",
["align"] = "CENTER",
["growOn"] = "",
["borderColor"] = {
0,
0,
0,
1,
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["parent"] = "萨满（中心分组，by 露露緹婭@Bilibili）",
["version"] = 3,
["useLimit"] = false,
["groupIcon"] = "interface/icons/classicon_shaman.blp",
["uid"] = "1KpFlmKiwjO",
["load"] = {
["size"] = {
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
["talent"] = {
["multi"] = {
},
},
},
["anchorPoint"] = "CENTER",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["space"] = 3,
["source"] = "import",
["customGrow"] = "",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["sort"] = "none",
["frameStrata"] = 1,
["animate"] = false,
["constantFactor"] = "RADIUS",
["config"] = {
},
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "萨满 底部分组",
["limit"] = 5,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["internalVersion"] = 90,
["borderInset"] = 1,
["authorOptions"] = {
},
["rotation"] = 0,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["sortHybridTable"] = {
["法师护甲合集（可点击施法）"] = false,
["奥术智慧/奥术光辉/达拉然光辉（可点击施法）"] = false,
["魔法抑制/魔法增效（可点击施法，左键抑制，右键增效）"] = false,
},
},
["熔火爆裂（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["parent"] = "萨满 核心分组",
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
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
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
["realSpellName"] = "熔火爆裂",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 425339,
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["use_track"] = true,
["use_genericShowOn"] = true,
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 425339,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["xOffset"] = 0,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "熔火爆裂（符文）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["uid"] = "aioxPwb8EAS",
["inverse"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
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
{
["check"] = {
["trigger"] = 1,
["variable"] = "spellInRange",
["value"] = 0,
["checks"] = {
{
["trigger"] = -1,
["variable"] = "hastarget",
["value"] = 1,
},
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = {
0.87450980392157,
0.34117647058824,
0.32941176470588,
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
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["萨满（中心分组，by 露露緹婭@Bilibili）"] = {
["controlledChildren"] = {
"萨满 动态分组 左",
"萨满 动态分组 右",
"萨满 核心分组",
"萨满 底部分组",
"萨满 资源条",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["yOffset"] = -224,
["anchorPoint"] = "CENTER",
["borderColor"] = {
1,
1,
1,
0.5,
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
["type"] = "unit",
["use_alwaystrue"] = false,
["subeventSuffix"] = "_CAST_START",
["duration"] = "1",
["event"] = "Conditions",
["names"] = {
},
["spellIds"] = {
},
["debuffType"] = "HELPFUL",
["subeventPrefix"] = "SPELL",
["unevent"] = "timed",
["unit"] = "player",
["buffShowOn"] = "showOnActive",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = 1,
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
["version"] = 3,
["load"] = {
["talent2"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "PRIEST",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["race"] = {
["multi"] = {
},
},
["difficulty"] = {
["multi"] = {
},
},
["role"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["faction"] = {
["multi"] = {
},
},
["use_class"] = "true",
["pvptalent"] = {
["multi"] = {
},
},
["ingroup"] = {
["multi"] = {
},
},
["zoneIds"] = "",
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["source"] = "import",
["scale"] = 1,
["border"] = false,
["borderEdge"] = "None",
["regionType"] = "group",
["borderSize"] = 16,
["borderInset"] = 11,
["xOffset"] = 0,
["borderOffset"] = 5,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "萨满（中心分组，by 露露緹婭@Bilibili）",
["selfPoint"] = "CENTER",
["frameStrata"] = 3,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["config"] = {
},
["parent"] = "萨满（60plus，by 露露緹婭@Bilibili） 1005更",
["uid"] = "HjlHQpgMd9T",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["ignoreOptionsEventErrors"] = true,
["forceEvents"] = true,
["groupOffset"] = false,
},
["groupIcon"] = "interface/icons/classicon_shaman.blp",
},
["火焰新星"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
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
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 1535,
["realSpellName"] = "火焰新星图腾",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 1535,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "火焰新星",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "rb6tNEEMnA3",
["inverse"] = true,
["parent"] = "萨满 核心分组",
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
},
["cooldown"] = true,
["icon"] = true,
},
["治疗之雨（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
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
["track"] = "auto",
["use_matchedRune"] = false,
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["duration"] = "1",
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "治疗之雨",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 415236,
["subeventSuffix"] = "_CAST_START",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 415236,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["authorOptions"] = {
},
["cooldown"] = true,
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
{
["check"] = {
["trigger"] = 1,
["variable"] = "spellInRange",
["value"] = 0,
["checks"] = {
{
["trigger"] = -1,
["variable"] = "hastarget",
["value"] = 1,
},
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = {
0.87450980392157,
0.34117647058824,
0.32941176470588,
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
["variable"] = "insufficientResources",
["value"] = 1,
["checks"] = {
{
["trigger"] = -1,
["variable"] = "hastarget",
["value"] = 1,
},
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = {
0.4745098352432251,
0.5137255191802979,
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
},
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "UeC6RMCHPlK",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["xOffset"] = 0,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "治疗之雨（符文）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 32,
["alpha"] = 1,
["config"] = {
},
["inverse"] = true,
["url"] = "https://space.bilibili.com/455259",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["parent"] = "萨满 核心分组",
},
["激流（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["parent"] = "萨满 核心分组",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
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
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "group",
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["ignoreDisconnected"] = true,
["useGroup_count"] = true,
["spellIds"] = {
},
["useName"] = true,
["group_count"] = "0",
["ignoreDead"] = true,
["auranames"] = {
"408521",
},
["group_countOperator"] = ">",
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
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["realSpellName"] = "激流",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 408521,
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_text_format_p_time_precision"] = 1,
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
["text_text_format_p_format"] = "timed",
["anchorXOffset"] = 0,
["type"] = "subtext",
["text_text_format_p_time_legacy_floor"] = false,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_shadowXOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_mod_rate"] = true,
["text_anchorYOffset"] = -3,
["anchor_point"] = "TOP",
["text_fontSize"] = 17,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_format"] = 0,
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
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
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
["multi"] = {
},
},
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
["spellknown"] = 408521,
["zoneIds"] = "",
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["color"] = {
1,
1,
1,
1,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["authorOptions"] = {
},
["config"] = {
},
["xOffset"] = 0,
["width"] = 32,
["anchorFrameParent"] = false,
["alpha"] = 1,
["semver"] = "2.0.6",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "激流（符文）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["selfPoint"] = "CENTER",
["uid"] = "qb1aesk6C(W",
["inverse"] = false,
["progressSource"] = {
-1,
"",
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
["value"] = true,
["property"] = "sub.3.glow",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
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
["icon"] = true,
},
["萨满之怒（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["parent"] = "萨满 核心分组",
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
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["unit"] = "group",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["useName"] = true,
["group_count"] = "0",
["useGroup_count"] = true,
["auranames"] = {
"425336",
},
["group_countOperator"] = ">",
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
["realSpellName"] = "萨满之怒",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 425336,
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 425336,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["selfPoint"] = "CENTER",
["width"] = 32,
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "萨满之怒（符文）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "Qwu9mjTBXvI",
["inverse"] = true,
["xOffset"] = 0,
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
["authorOptions"] = {
},
},
["漩涡武器（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["parent"] = "萨满 动态分组 右",
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
["ownOnly"] = true,
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["duration"] = "1",
["debuffType"] = "HELPFUL",
["use_genericShowOn"] = true,
["useName"] = false,
["unevent"] = "auto",
["useExactSpellId"] = true,
["auraspellids"] = {
"408505",
},
["type"] = "aura2",
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "能量涌动",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 415100,
["subeventSuffix"] = "_CAST_START",
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
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glowScale"] = 1,
["glow"] = false,
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_precision"] = 1,
["anchorXOffset"] = 0,
["type"] = "subtext",
["text_text_format_p_time_legacy_floor"] = false,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_format"] = "timed",
["text_anchorYOffset"] = -2,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_mod_rate"] = true,
["text_shadowYOffset"] = 0,
["anchor_point"] = "TOP",
["text_fontSize"] = 17,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_format"] = 0,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = false,
["zoneIds"] = "",
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 408505,
["size"] = {
["multi"] = {
},
},
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["authorOptions"] = {
},
["cooldown"] = true,
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "stacks",
["value"] = "5",
["op"] = "==",
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
},
},
},
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "nJv)M8RS9Mt",
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "漩涡武器（符文）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["width"] = 32,
["alpha"] = 1,
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
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["icon"] = true,
},
["大地震击（恢复）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
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
["track"] = "auto",
["duration"] = "1",
["genericShowOn"] = "showAlways",
["subeventPrefix"] = "SPELL",
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "地震术",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 8042,
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["use_track"] = true,
["unit"] = "player",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["track"] = "auto",
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["use_unit"] = true,
["use_showgcd"] = true,
["use_spec"] = true,
["use_talent"] = true,
["spellName"] = 8042,
["subeventPrefix"] = "SPELL",
["type"] = "unit",
["unit"] = "player",
["subeventSuffix"] = "_CAST_START",
["use_inverse"] = false,
["unevent"] = "auto",
["event"] = "Talent Known",
["use_exact_spellName"] = false,
["realSpellName"] = "大地震击",
["use_spellName"] = true,
["spellIds"] = {
},
["talent"] = {
["single"] = 89,
},
["duration"] = "1",
["names"] = {
},
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowXOffset"] = 0,
["glowType"] = "buttonOverlay",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glow"] = false,
["glowThickness"] = 1,
["glowScale"] = 1,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["single"] = 264,
["multi"] = {
[264] = true,
},
},
["talent"] = {
["single"] = 8,
["multi"] = {
[2] = true,
[8] = true,
},
},
["class"] = {
["single"] = "SHAMAN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["use_never"] = false,
["spellknown"] = 8042,
["size"] = {
["multi"] = {
},
},
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["cooldown"] = true,
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
{
["check"] = {
["trigger"] = 1,
["variable"] = "spellInRange",
["value"] = 0,
["checks"] = {
{
["trigger"] = -1,
["variable"] = "hastarget",
["value"] = 1,
},
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = {
0.87450980392157,
0.34117647058824,
0.32941176470588,
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
},
["parent"] = "萨满 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "dXbVpJEzQ9K",
["color"] = {
1,
1,
1,
1,
},
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["semver"] = "2.0.6",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "大地震击（恢复）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["width"] = 32,
["alpha"] = 1,
["config"] = {
},
["inverse"] = true,
["authorOptions"] = {
},
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["selfPoint"] = "CENTER",
},
["水之护盾/闪电之盾/大地之盾（萨满自身）"] = {
["iconSource"] = -1,
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["finish"] = {
["message"] = "",
["do_sound"] = false,
["message_type"] = "ERROR",
["do_message"] = false,
["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BananaPeelSlip.ogg",
["sound_channel"] = "SFX",
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["use_debuffClass"] = false,
["useExactSpellId"] = false,
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["auraspellids"] = {
},
["unit"] = "player",
["auranames"] = {
"408511",
"3742",
"974",
"49281",
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
["selfPoint"] = "CENTER",
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
["text_text_format_p_time_legacy_floor"] = true,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorYOffset"] = 0,
["type"] = "subtext",
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_color"] = {
1,
0.97254901960784,
0.050980392156863,
1,
},
["text_font"] = "Rurutia",
["text_shadowXOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "水盾",
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
["text_anchorYOffset"] = 0,
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
["text_shadowYOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
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
["useGlowColor"] = true,
["glowType"] = "Pixel",
["glowLength"] = 5,
["glowYOffset"] = 0,
["glowColor"] = {
0.7843137254902,
0.098039215686275,
0.13725490196078,
1,
},
["glowScale"] = 1,
["glowThickness"] = 1.8,
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_p_format"] = "timed",
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_time_format"] = 0,
},
},
["height"] = 30,
["load"] = {
["use_level"] = false,
["talent"] = {
["multi"] = {
},
},
["use_vehicle"] = false,
["level_operator"] = {
">=",
},
["use_never"] = false,
["use_class"] = true,
["class"] = {
["single"] = "SHAMAN",
["multi"] = {
["WARLOCK"] = true,
},
},
["use_itemequiped"] = false,
["use_combat"] = true,
["use_alive"] = true,
["level"] = {
"60",
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
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["cooldownEdge"] = false,
["parent"] = "【露露】萨满（BUFF）",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
{
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 1,
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.4.glow",
},
{
["value"] = true,
["property"] = "desaturate",
},
},
},
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
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
["config"] = {
},
["icon"] = true,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["color"] = {
1,
1,
1,
1,
},
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["tocversion"] = 20501,
["id"] = "水之护盾/闪电之盾/大地之盾（萨满自身）",
["useCooldownModRate"] = true,
["alpha"] = 1,
["width"] = 30,
["desaturate"] = false,
["uid"] = "YjxahzlptwR",
["inverse"] = false,
["adjustedMax"] = "",
["displayIcon"] = 132315,
["cooldown"] = true,
["authorOptions"] = {
},
},
["水系图腾"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = false,
["cooldownEdge"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["track"] = "auto",
["itemName"] = 0,
["use_absorbMode"] = true,
["genericShowOn"] = "showAlways",
["use_unit"] = true,
["use_showgcd"] = true,
["remaining"] = "0",
["use_genericShowOn"] = true,
["names"] = {
},
["use_totemType"] = true,
["debuffType"] = "HELPFUL",
["duration"] = "1",
["use_remaining"] = false,
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
["spellName"] = 5394,
["use_itemName"] = true,
["event"] = "Totem",
["totemType"] = 3,
["realSpellName"] = "Healing Stream Totem",
["use_spellName"] = true,
["spellIds"] = {
},
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["remaining_operator"] = ">",
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
"6371",
"5677",
"8185",
},
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["unit"] = "player",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
[3] = true,
},
},
["use_class"] = true,
["use_spellknown"] = false,
["use_spec"] = true,
["size"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "SHAMAN",
["multi"] = {
},
},
["class_and_spec"] = {
["single"] = 264,
["multi"] = {
[264] = true,
},
},
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = 135127,
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "水系图腾",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "r4cUzgfuvy9",
["inverse"] = false,
["parent"] = "萨满 动态分组 左",
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
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
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
["icon"] = true,
},
["潮汐奔涌（符文）"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!IOS-竹子.ogg",
["do_sound"] = false,
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["use_debuffClass"] = false,
["auraspellids"] = {
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["subeventSuffix"] = "_CAST_START",
["useName"] = true,
["spellIds"] = {
},
["auranames"] = {
"432042",
},
["names"] = {
},
["useExactSpellId"] = false,
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
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
["text_text_format_p_time_precision"] = 1,
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
["text_text"] = "%n",
["text_shadowXOffset"] = 0,
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_n_pad"] = false,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_fontSize"] = 15,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_format"] = 0,
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
["text_fontType"] = "OUTLINE",
["text_anchorYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_n_format"] = "string",
["text_text_format_n_abbreviate_max"] = 2,
["anchor_point"] = "OUTER_TOP",
["text_text_format_n_pad_max"] = 8,
["text_text_format_n_pad_mode"] = "left",
["text_text_format_n_abbreviate"] = true,
},
{
["text_text_format_p_time_precision"] = 1,
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
["text_shadowYOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
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
["text_visible"] = true,
["text_text_format_p_format"] = "timed",
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_time_format"] = 0,
},
{
["glowFrequency"] = 0.25,
["glow"] = true,
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
["glowScale"] = 1,
["glowThickness"] = 1,
["glowDuration"] = 1,
["glowXOffset"] = 0,
["type"] = "subglow",
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["ingroup"] = {
},
["use_never"] = false,
["talent"] = {
["multi"] = {
[64] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = false,
["use_itemequiped"] = false,
["faction"] = {
},
["class"] = {
["single"] = "SHAMAN",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 413248,
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
["parent"] = "【露露】萨满（BUFF）",
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["conditions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["desaturate"] = false,
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
["easeType"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["preset"] = "bounce",
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
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["tocversion"] = 30403,
["id"] = "潮汐奔涌（符文）",
["icon"] = true,
["alpha"] = 1,
["width"] = 30,
["keepAspectRatio"] = false,
["uid"] = "RsAhC1uKvAe",
["inverse"] = false,
["adjustedMax"] = "",
["displayIcon"] = "",
["cooldown"] = true,
["url"] = "https://space.bilibili.com/455259",
},
["萨满 资源条"] = {
["controlledChildren"] = {
"萨满 法力条",
"5秒回蓝（萨满）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["xOffset"] = 0,
["preferToUpdate"] = true,
["yOffset"] = -26,
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
["subeventPrefix"] = "SPELL",
["names"] = {
},
["event"] = "Health",
["unit"] = "player",
},
["untrigger"] = {
},
},
},
["internalVersion"] = 90,
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
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["version"] = 3,
["load"] = {
["size"] = {
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
["talent"] = {
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
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "group",
["borderSize"] = 2,
["authorOptions"] = {
},
["selfPoint"] = "CENTER",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "萨满 资源条",
["groupIcon"] = "interface/icons/classicon_shaman.blp",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["borderInset"] = 1,
["config"] = {
},
["uid"] = "0kirsU1xinC",
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["parent"] = "萨满（中心分组，by 露露緹婭@Bilibili）",
},
["星界传送"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
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
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 556,
["realSpellName"] = "星界传送",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
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
["animation"] = {
["start"] = {
["type"] = "preset",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "shrink",
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
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
["subRegions"] = {
{
["type"] = "subbackground",
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 556,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "星界传送",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "7RMabu1Kx8q",
["inverse"] = true,
["parent"] = "萨满 核心分组",
["conditions"] = {
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
["icon"] = true,
},
["大地震击"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["track"] = "auto",
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["subeventPrefix"] = "SPELL",
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["unit"] = "player",
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "地震术",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 8042,
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["use_track"] = true,
["duration"] = "1",
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "all",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["single"] = 264,
["multi"] = {
[264] = true,
},
},
["talent"] = {
["single"] = 8,
["multi"] = {
[2] = true,
[8] = true,
},
},
["class"] = {
["single"] = "SHAMAN",
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
["single"] = 1,
["multi"] = {
},
},
["use_never"] = false,
["spellknown"] = 8042,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "大地震击",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "2W(NZ9Zu69a",
["inverse"] = true,
["parent"] = "萨满 核心分组",
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
{
["check"] = {
["trigger"] = 1,
["variable"] = "spellInRange",
["value"] = 0,
["checks"] = {
{
["trigger"] = -1,
["variable"] = "hastarget",
["value"] = 1,
},
{
["value"] = 0,
["variable"] = "show",
},
},
},
["changes"] = {
{
["value"] = {
0.87450980392157,
0.34117647058824,
0.32941176470588,
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
},
["cooldown"] = true,
["icon"] = true,
},
["萨满 动态分组 左"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"风系图腾",
"水系图腾",
"土系图腾",
"火系图腾",
"主手武器附魔",
"副手武器附魔",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["parent"] = "萨满（中心分组，by 露露緹婭@Bilibili）",
["preferToUpdate"] = true,
["yOffset"] = 28,
["sortHybridTable"] = {
["冰锥术"] = false,
},
["stepAngle"] = 15,
["frameStrata"] = 1,
["fullCircle"] = true,
["space"] = 3,
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
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["event"] = "Health",
["names"] = {
},
},
["untrigger"] = {
},
},
},
["columnSpace"] = 3,
["internalVersion"] = 90,
["grow"] = "GRID",
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
["anchorPoint"] = "CENTER",
["xOffset"] = -127,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["authorOptions"] = {
},
["version"] = 3,
["rotation"] = 0,
["radius"] = 200,
["borderInset"] = 1,
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
["groupIcon"] = "interface/icons/classicon_shaman.blp",
["source"] = "import",
["customGrow"] = "function(newPositions, activeRegions)\n    local limit = 10 -- limit of icons per row\n    local rows = 1 -- total rows\n    local spacing = 3 -- spacing between icons\n    ----------------------\n    local check = true\n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    \n    local xOffset = 0\n    local yOffset = 0\n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        local region = regionData.region\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= limit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows-1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        xOffset = 0 - (region.width + spacing) / 2 * (rowTotal-1) + (xCount * (region.width + spacing))\n        yOffset = 0 + (region.height + spacing) * yCount -- change '-' to '+' after 0 to grow up instead of down\n        \n        xCount = xCount + 1\n        \n        if yCount < rows-1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend\n\n",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 6,
["gridWidth"] = 4,
["animate"] = false,
["constantFactor"] = "RADIUS",
["uid"] = "Kd3A35ezJ)M",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "萨满 动态分组 左",
["sort"] = "none",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["useLimit"] = true,
["config"] = {
},
["selfPoint"] = "BOTTOMLEFT",
["rowSpace"] = 5,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["gridType"] = "RU",
},
["萨满 动态分组 右"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"水之护盾/闪电之盾（可点击施法）",
"能量涌动（符文）",
"漩涡武器（符文）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["yOffset"] = 28,
["gridType"] = "LU",
["source"] = "import",
["gridWidth"] = 4,
["fullCircle"] = true,
["space"] = 3,
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
["subeventPrefix"] = "SPELL",
["names"] = {
},
["event"] = "Health",
["unit"] = "player",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 3,
["internalVersion"] = 90,
["sortHybridTable"] = {
["启迪"] = false,
["时光道标"] = false,
["再生"] = false,
},
["selfPoint"] = "BOTTOMRIGHT",
["align"] = "CENTER",
["rowSpace"] = 5,
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
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["rotation"] = 0,
["stagger"] = 0,
["version"] = 3,
["groupIcon"] = "interface/icons/classicon_shaman.blp",
["borderColor"] = {
0,
0,
0,
1,
},
["uid"] = "gbBjtVTQnhV",
["load"] = {
["size"] = {
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
["talent"] = {
["multi"] = {
},
},
},
["radius"] = 200,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["parent"] = "萨满（中心分组，by 露露緹婭@Bilibili）",
["animate"] = false,
["customGrow"] = "function(newPositions, activeRegions)\n    local limit = 10 -- limit of icons per row\n    local rows = 1 -- total rows\n    local spacing = 3 -- spacing between icons\n    ----------------------\n    local check = true\n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    \n    local xOffset = 0\n    local yOffset = 0\n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        local region = regionData.region\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= limit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows-1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        xOffset = 0 - (region.width + spacing) / 2 * (rowTotal-1) + (xCount * (region.width + spacing))\n        yOffset = 0 + (region.height + spacing) * yCount -- change '-' to '+' after 0 to grow up instead of down\n        \n        xCount = xCount + 1\n        \n        if yCount < rows-1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend\n\n",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["limit"] = 9,
["frameStrata"] = 1,
["useLimit"] = true,
["constantFactor"] = "RADIUS",
["sort"] = "none",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "萨满 动态分组 右",
["regionType"] = "dynamicgroup",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["borderInset"] = 1,
["config"] = {
},
["anchorPoint"] = "CENTER",
["xOffset"] = 127,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["arcLength"] = 360,
},
["聪慧（符文）"] = {
["iconSource"] = -1,
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!IOS-竹子.ogg",
["do_sound"] = false,
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["use_debuffClass"] = false,
["auraspellids"] = {
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["subeventSuffix"] = "_CAST_START",
["useName"] = true,
["spellIds"] = {
},
["auranames"] = {
"415144",
},
["names"] = {
},
["useExactSpellId"] = false,
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
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
["text_text_format_p_time_precision"] = 1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["text_text_format_n_format"] = "string",
["text_text_format_s_format"] = "none",
["text_text"] = "%n",
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_n_pad"] = false,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_fontSize"] = 15,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_format"] = 0,
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
["text_visible"] = true,
["text_anchorYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_shadowXOffset"] = 0,
["text_text_format_n_abbreviate_max"] = 2,
["anchor_point"] = "OUTER_TOP",
["text_text_format_n_pad_max"] = 8,
["text_text_format_n_pad_mode"] = "left",
["text_text_format_n_abbreviate"] = true,
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
["text_anchorYOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["anchorXOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = false,
["text_text_format_p_format"] = "timed",
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_time_format"] = 0,
},
{
["glowFrequency"] = 0.25,
["glow"] = true,
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
["glowScale"] = 1,
["glowThickness"] = 1,
["glowDuration"] = 1,
["glowXOffset"] = 0,
["type"] = "subglow",
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["ingroup"] = {
},
["use_never"] = false,
["talent"] = {
["multi"] = {
[64] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = false,
["use_itemequiped"] = false,
["faction"] = {
},
["class"] = {
["single"] = "SHAMAN",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 413248,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["authorOptions"] = {
},
["color"] = {
1,
1,
1,
1,
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["conditions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
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
["easeType"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["preset"] = "bounce",
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
["keepAspectRatio"] = false,
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["tocversion"] = 30403,
["id"] = "聪慧（符文）",
["icon"] = true,
["alpha"] = 1,
["width"] = 30,
["parent"] = "【露露】萨满（BUFF）",
["uid"] = "krjMIEso623",
["inverse"] = false,
["adjustedMax"] = "",
["displayIcon"] = "",
["cooldown"] = true,
["url"] = "https://space.bilibili.com/455259",
},
["5秒回蓝（萨满）"] = {
["sparkWidth"] = 15,
["iconSource"] = -1,
["authorOptions"] = {
{
["type"] = "toggle",
["default"] = true,
["key"] = "showoptimalcaststart",
["name"] = "Show optimal timing for start casting and gain mana regen tick",
["width"] = 2,
},
{
["text"] = "Cast time of your main spell :",
["type"] = "description",
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
["default"] = 2,
["name"] = "|T135150:0|t Mage",
},
{
["type"] = "number",
["useDesc"] = false,
["max"] = 10,
["step"] = 0.1,
["width"] = 0.5,
["min"] = 0,
["key"] = "PRIEST",
["default"] = 1.5,
["name"] = "|T135167:0|t Priest",
},
{
["type"] = "number",
["useDesc"] = false,
["max"] = 10,
["step"] = 0.1,
["width"] = 0.5,
["min"] = 0,
["key"] = "HUNTER",
["default"] = 1.5,
["name"] = "|T135495:0|t Hunter",
},
{
["type"] = "number",
["useDesc"] = false,
["max"] = 10,
["step"] = 0.1,
["width"] = 0.5,
["min"] = 0,
["key"] = "WARLOCK",
["default"] = 1.5,
["name"] = "|T136020:0|t Warlock",
},
{
["type"] = "number",
["useDesc"] = false,
["max"] = 10,
["step"] = 0.1,
["width"] = 0.5,
["min"] = 0,
["key"] = "SHAMAN",
["default"] = 1.5,
["name"] = "|T133437:0|t Shaman",
},
{
["type"] = "number",
["useDesc"] = false,
["max"] = 10,
["step"] = 0.1,
["width"] = 0.5,
["min"] = 0,
["key"] = "PALADIN",
["default"] = 1.5,
["name"] = "|T133038:0|t Paladin",
},
{
["type"] = "number",
["useDesc"] = false,
["max"] = 10,
["step"] = 0.1,
["width"] = 0.5,
["min"] = 0,
["key"] = "DRUID",
["default"] = 1.5,
["name"] = "|T134297:0|t Druid",
},
},
["preferToUpdate"] = false,
["yOffset"] = -3,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
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
["desc"] = "from：https://wago.io/XoGkZt2VR/",
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["use_class"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "SHAMAN",
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
["zoneIds"] = "",
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
["uid"] = "Gkta3uzD1Og",
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "XoGkZt2VR",
["parent"] = "萨满 资源条",
["customText"] = "function()\n    if aura_env.config.showoptimalcaststart then\n        if aura_env.state and aura_env.state.duration then\n            local bar = aura_env.region.bar\n            local _, class = UnitClass(\"player\")\n            local spellduration = aura_env.config[class]\n            if not bar.mark then\n                local mark = bar:CreateTexture(nil, \"ARTWORK\");\n                mark:SetDrawLayer(\"ARTWORK\", 3);\n                bar.mark = mark\n                bar.mark:SetTexture([[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite]])\n                bar.mark:SetWidth(2);\n                bar.mark:SetHeight(bar:GetHeight() - 4);\n                bar.mark:SetBlendMode(\"BLEND\");\n                bar.mark:SetVertexColor(1, 1, 1, 0.5)\n            end\n            if spellduration < aura_env.state.duration then\n                bar.mark:ClearAllPoints()\n                bar.mark:SetPoint(\n                    \"RIGHT\",\n                    bar,\n                    \"RIGHT\",\n                    -((bar:GetWidth() / aura_env.state.duration) * spellduration),\n                    0\n                )\n                bar.mark:Show()\n            else\n                bar.mark:Hide()\n            end\n        end\n    elseif aura_env.region.bar.mark then\n        aura_env.region.bar.mark:Hide()\n    end\nend",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["duration"] = "2",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "custom",
["custom_type"] = "stateupdate",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["event"] = "Health",
["subeventSuffix"] = "_ENERGIZE",
["spellIds"] = {
},
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player UNIT_POWER_FREQUENT:player",
["custom"] = "function(a, e, t)\n    local currMana = UnitPower(\"player\", 0)\n    local maxMana = UnitPowerMax(\"player\", 0)\n    if currMana < maxMana then\n        if (e == \"UNIT_POWER_FREQUENT\" and currMana > (aura_env.lastMana or 0))\n        then\n            local dur = 2\n            a[\"\"] = {\n                show = true,\n                changed = true,\n                duration = dur,\n                expirationTime = GetTime() + dur,\n                progressType = \"timed\",\n                autoHide = true\n            }\n            aura_env.lastMana = currMana\n        elseif e == \"UNIT_SPELLCAST_SUCCEEDED\" and currMana < (aura_env.lastMana or math.huge) then\n            local dur = 6.45\n            a[\"\"] = {\n                show = true,\n                changed = true,\n                duration = dur,\n                expirationTime = GetTime() + dur,\n                progressType = \"timed\",\n                autoHide = true\n            }\n            aura_env.lastMana = currMana\n        end\n    end\n    return true\nend",
["use_sourceUnit"] = true,
["check"] = "event",
["names"] = {
},
["sourceUnit"] = "player",
["unevent"] = "auto",
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
["useAdjustededMax"] = false,
["source"] = "import",
["auto"] = true,
["barColor2"] = {
1,
1,
0,
1,
},
["xOffset"] = 0,
["borderInFront"] = true,
["adjustedMax"] = "",
["icon_side"] = "RIGHT",
["backgroundColor"] = {
0,
0,
0,
0,
},
["config"] = {
["HUNTER"] = 1.5,
["PALADIN"] = 1.5,
["WARLOCK"] = 1.5,
["SHAMAN"] = 1.5,
["MAGE"] = 2,
["DRUID"] = 1.5,
["showoptimalcaststart"] = false,
["PRIEST"] = 1.5,
},
["sparkHeight"] = 30,
["sparkOffsetX"] = 0,
["desaturate"] = false,
["width"] = 297,
["semver"] = "1.1.2",
["id"] = "5秒回蓝（萨满）",
["sparkHidden"] = "NEVER",
["sparkTexture"] = "XPBarAnim-OrangeSpark",
["frameStrata"] = 5,
["anchorFrameType"] = "SCREEN",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["sparkColor"] = {
1,
1,
1,
1,
},
["inverse"] = true,
["icon"] = false,
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
["【露露】萨满（BUFF）"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"水之护盾/闪电之盾/大地之盾（萨满自身）",
"潮汐奔涌（符文）",
"乱舞（萨满，符文）",
"聪慧（符文）",
"滚雷（符文）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 142,
["preferToUpdate"] = true,
["yOffset"] = -37.454545454545,
["anchorPoint"] = "CENTER",
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
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["names"] = {
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 4,
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
["align"] = "CENTER",
["alpha"] = 1,
["authorOptions"] = {
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["borderColor"] = {
0,
0,
0,
1,
},
["rotation"] = 0,
["subRegions"] = {
},
["selfPoint"] = "TOPLEFT",
["arcLength"] = 360,
["load"] = {
["size"] = {
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
["talent"] = {
["multi"] = {
},
},
},
["groupIcon"] = "interface/icons/classicon_shaman.blp",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["config"] = {
},
["source"] = "import",
["borderInset"] = 1,
["scale"] = 1.1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["sort"] = "none",
["animate"] = false,
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["constantFactor"] = "RADIUS",
["stepAngle"] = 15,
["borderOffset"] = 4,
["useLimit"] = true,
["sortHybridTable"] = {
["战斗怒吼（战士）"] = false,
["鲁莽（战士，语音）"] = false,
["孤寂（DK）"] = false,
["死亡之愿（战士，音效）"] = false,
["水之护盾/闪电之盾/大地之盾（萨满自身）"] = false,
["补破甲（防战）"] = false,
["自然之赐（德鲁伊）"] = false,
["补雷霆（防战）"] = false,
["清晰预兆（德鲁伊）"] = false,
["补挫志（防战）"] = false,
},
["id"] = "【露露】萨满（BUFF）",
["limit"] = 10,
["gridWidth"] = 5,
["anchorFrameType"] = "UIPARENT",
["gridType"] = "RD",
["uid"] = "0pKQQriDQbb",
["parent"] = "萨满（60plus，by 露露緹婭@Bilibili） 1005更",
["rowSpace"] = 35,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["radius"] = 200,
},
["滚雷（符文）"] = {
["iconSource"] = -1,
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
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!IOS-竹子.ogg",
["do_sound"] = false,
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
["unit"] = "player",
["auraspellids"] = {
},
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["useExactSpellId"] = false,
["names"] = {
},
["auranames"] = {
"432056",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
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
["text_shadowXOffset"] = 0,
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
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%n",
["text_text_format_n_format"] = "string",
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_n_pad"] = false,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_fontSize"] = 15,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_format"] = "timed",
["text_anchorYOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 1,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_visible"] = true,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_format"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_precision"] = 1,
["text_text_format_n_abbreviate_max"] = 2,
["anchor_point"] = "OUTER_TOP",
["text_text_format_n_pad_max"] = 8,
["text_text_format_n_pad_mode"] = "left",
["text_text_format_n_abbreviate"] = true,
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
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
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
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
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
["glowScale"] = 1,
["glowDuration"] = 1,
["glowThickness"] = 1,
["glowXOffset"] = 0,
["glow"] = true,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["ingroup"] = {
},
["use_never"] = false,
["talent"] = {
["multi"] = {
[64] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = false,
["use_itemequiped"] = false,
["faction"] = {
},
["class"] = {
["single"] = "SHAMAN",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 413248,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["cooldownEdge"] = false,
["desaturate"] = false,
["cooldown"] = true,
["displayIcon"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["adjustedMax"] = "",
["xOffset"] = 0,
["uid"] = "OSyvK9DISgs",
["parent"] = "【露露】萨满（BUFF）",
["anchorFrameParent"] = false,
["alpha"] = 1,
["authorOptions"] = {
},
["cooldownTextDisabled"] = false,
["icon"] = true,
["tocversion"] = 30403,
["id"] = "滚雷（符文）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["config"] = {
},
["inverse"] = false,
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
["easeType"] = "none",
["duration_type"] = "seconds",
["preset"] = "bounce",
["easeStrength"] = 3,
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["keepAspectRatio"] = false,
},
["副手武器附魔"] = {
["iconSource"] = 3,
["wagoID"] = "p-wCoCa05",
["parent"] = "萨满 动态分组 左",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
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
["enchant"] = "",
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"465",
"7294",
"19746",
"19876",
"19888",
"19891",
"32223",
},
["matchesShowOn"] = "showAlways",
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "SPELL",
["unitExists"] = true,
["use_weapon"] = true,
["use_enchant"] = false,
["use_unit"] = true,
["names"] = {
},
["use_genericShowOn"] = true,
["spellName"] = 0,
["duration"] = "1",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["unevent"] = "auto",
["use_showOn"] = true,
["use_itemName"] = true,
["event"] = "Weapon Enchant",
["debuffType"] = "HELPFUL",
["realSpellName"] = 0,
["use_spellName"] = true,
["spellIds"] = {
},
["useName"] = true,
["showOn"] = "showOnActive",
["unit"] = "player",
["use_track"] = true,
["weapon"] = "off",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["enchant"] = "",
["auranames"] = {
"465",
"7294",
"19746",
"19876",
"19888",
"19891",
"32223",
},
["matchesShowOn"] = "showAlways",
["remaining"] = "60",
["use_weapon"] = true,
["spellName"] = 0,
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["use_itemName"] = true,
["use_track"] = true,
["itemName"] = 6265,
["use_count"] = false,
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["unitExists"] = true,
["duration"] = "1",
["debuffType"] = "HELPFUL",
["use_unit"] = true,
["useName"] = true,
["remaining_operator"] = "<=",
["unevent"] = "auto",
["unit"] = "player",
["use_remaining"] = true,
["use_genericShowOn"] = true,
["type"] = "item",
["realSpellName"] = 0,
["use_spellName"] = true,
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["showOn"] = "showOnActive",
["event"] = "Weapon Enchant",
["use_enchant"] = false,
["weapon"] = "off",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 0,
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["names"] = {
},
["itemSlot"] = 17,
["use_weapon"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["use_itemTypeName"] = true,
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["use_itemName"] = true,
["use_itemSlot"] = true,
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["showOn"] = "showAlways",
["unit"] = "player",
["event"] = "Cooldown Progress (Equipment Slot)",
["weapon"] = "main",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_resting"] = true,
["unit"] = "player",
["type"] = "unit",
["debuffType"] = "HELPFUL",
["event"] = "Conditions",
["use_unit"] = true,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 0,
["itemTypeName"] = {
["multi"] = {
[1030] = true,
},
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["subeventPrefix"] = "SPELL",
["itemSlot"] = 17,
["use_weapon"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["use_itemTypeName"] = false,
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["use_itemName"] = true,
["use_itemSlot"] = true,
["spellIds"] = {
},
["names"] = {
},
["showOn"] = "showAlways",
["event"] = "Item Type Equipped",
["unit"] = "player",
["weapon"] = "main",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return (t[1] or t[2] or t[3] or t[4]) and not t[5]\nend",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "副手",
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorYOffset"] = 0,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 1,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_format"] = 0,
["text_shadowYOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_anchorYOffset"] = 0,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
},
["height"] = 32,
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
["size"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "SHAMAN",
["multi"] = {
},
},
["use_itemtypeequipped"] = false,
["spellknown"] = 8017,
["itemtypeequipped"] = {
["multi"] = {
[512] = true,
[527] = true,
[516] = true,
[525] = true,
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["xOffset"] = 0,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["selfPoint"] = "CENTER",
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
["width"] = 32,
["anchorFrameParent"] = false,
["icon"] = true,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "副手武器附魔",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["uid"] = "xwmxFiHbWCo",
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
["variable"] = "show",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
},
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 1,
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = true,
["property"] = "sub.2.glow",
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
["variable"] = "show",
["value"] = 1,
},
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 1,
},
},
},
["changes"] = {
{
["value"] = false,
["property"] = "desaturate",
},
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
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "60",
["op"] = ">=",
},
["changes"] = {
{
["property"] = "sub.3.text_visible",
},
},
},
},
["cooldown"] = true,
["url"] = "https://space.bilibili.com/455259",
},
["能量涌动（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
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
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["unit"] = "player",
["debuffType"] = "HELPFUL",
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["useExactSpellId"] = true,
["auraspellids"] = {
"415100",
},
["subeventSuffix"] = "_CAST_START",
["spellName"] = 415100,
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "能量涌动",
["use_spellName"] = true,
["spellIds"] = {
},
["duration"] = "1",
["useName"] = false,
["unevent"] = "auto",
["use_track"] = true,
["ownOnly"] = true,
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = true,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 415100,
["zoneIds"] = "",
},
["alpha"] = 1,
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
["parent"] = "萨满 动态分组 右",
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
["width"] = 32,
["anchorFrameParent"] = false,
["url"] = "https://space.bilibili.com/455259",
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "能量涌动（符文）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["uid"] = "CHdNY3UXqNj",
["inverse"] = false,
["icon"] = true,
["conditions"] = {
},
["cooldown"] = true,
["selfPoint"] = "CENTER",
},
["土系图腾"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = false,
["cooldownEdge"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["track"] = "auto",
["itemName"] = 0,
["use_absorbMode"] = true,
["genericShowOn"] = "showAlways",
["use_unit"] = true,
["use_showgcd"] = true,
["remaining"] = "0",
["use_genericShowOn"] = true,
["names"] = {
},
["use_totemType"] = true,
["debuffType"] = "HELPFUL",
["duration"] = "1",
["use_remaining"] = false,
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
["spellName"] = 5394,
["use_itemName"] = true,
["event"] = "Totem",
["totemType"] = 2,
["realSpellName"] = "Healing Stream Totem",
["use_spellName"] = true,
["spellIds"] = {
},
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["remaining_operator"] = ">",
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
"8072",
"8076",
},
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["unit"] = "player",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
[3] = true,
},
},
["use_class"] = true,
["use_spellknown"] = false,
["use_spec"] = true,
["size"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "SHAMAN",
["multi"] = {
},
},
["class_and_spec"] = {
["single"] = 264,
["multi"] = {
[264] = true,
},
},
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = 136098,
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "土系图腾",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "nplGuoD4n93",
["inverse"] = false,
["parent"] = "萨满 动态分组 左",
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
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
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
["icon"] = true,
},
["自然迅捷（萨满）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
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
"16188",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
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
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 16188,
["realSpellName"] = "自然迅捷",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 16188,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "自然迅捷（萨满）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "0JDj)Dc(2Oi",
["inverse"] = true,
["parent"] = "萨满 核心分组",
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
["icon"] = true,
},
["风系图腾"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = false,
["cooldownEdge"] = true,
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["track"] = "auto",
["itemName"] = 0,
["use_absorbMode"] = true,
["genericShowOn"] = "showAlways",
["use_unit"] = true,
["use_showgcd"] = true,
["remaining"] = "0",
["use_genericShowOn"] = true,
["names"] = {
},
["use_totemType"] = true,
["debuffType"] = "HELPFUL",
["duration"] = "1",
["use_remaining"] = false,
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
["spellName"] = 5394,
["use_itemName"] = true,
["event"] = "Totem",
["totemType"] = 4,
["realSpellName"] = "Healing Stream Totem",
["use_spellName"] = true,
["spellIds"] = {
},
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["remaining_operator"] = ">",
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
"8178",
"10596",
"6495",
},
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["unit"] = "player",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["single"] = 3,
["multi"] = {
[3] = true,
},
},
["use_class"] = true,
["use_spellknown"] = false,
["use_spec"] = true,
["size"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "SHAMAN",
["multi"] = {
},
},
["class_and_spec"] = {
["single"] = 264,
["multi"] = {
[264] = true,
},
},
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = 136039,
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "风系图腾",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "S9SqVIDuzb9",
["inverse"] = false,
["parent"] = "萨满 动态分组 左",
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
["property"] = "sub.2.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.2.glowType",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
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
["icon"] = true,
},
["熔岩猛击（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
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
["track"] = "auto",
["use_matchedRune"] = false,
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["duration"] = "1",
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "熔岩猛击",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 408507,
["subeventSuffix"] = "_CAST_START",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 408507,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["authorOptions"] = {
},
["cooldown"] = true,
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
{
["check"] = {
["trigger"] = 1,
["variable"] = "spellInRange",
["value"] = 0,
["checks"] = {
{
["trigger"] = -1,
["variable"] = "hastarget",
["value"] = 1,
},
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = {
0.87450980392157,
0.34117647058824,
0.32941176470588,
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
},
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "79fsmWFnBv1",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["xOffset"] = 0,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "熔岩猛击（符文）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 32,
["alpha"] = 1,
["config"] = {
},
["inverse"] = true,
["url"] = "https://space.bilibili.com/455259",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["parent"] = "萨满 核心分组",
},
["头狼之魂（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
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
["group_countOperator"] = ">",
["type"] = "aura2",
["ignoreDead"] = true,
["subeventSuffix"] = "_CAST_START",
["useName"] = true,
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["ignoreDisconnected"] = true,
["useGroup_count"] = true,
["spellIds"] = {
},
["auranames"] = {
"408696",
},
["group_count"] = "0",
["subeventPrefix"] = "SPELL",
["unit"] = "group",
["debuffType"] = "HELPFUL",
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
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["unit"] = "player",
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "头狼之魂",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 408696,
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
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
["useGlowColor"] = true,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 408696,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["icon"] = true,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["selfPoint"] = "CENTER",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["xOffset"] = 0,
["width"] = 32,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "头狼之魂（符文）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "vdcTW(GRdrY",
["inverse"] = true,
["parent"] = "萨满 核心分组",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
},
{
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 1,
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
{
["value"] = true,
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
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
},
},
},
["cooldown"] = true,
["url"] = "https://space.bilibili.com/455259",
},
["图腾投掷（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
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
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "图腾投射",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 437009,
["subeventSuffix"] = "_CAST_START",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 437009,
["size"] = {
["multi"] = {
},
},
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["cooldown"] = true,
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
{
["check"] = {
["trigger"] = 1,
["variable"] = "spellInRange",
["value"] = 0,
["checks"] = {
{
["trigger"] = -1,
["variable"] = "hastarget",
["value"] = 1,
},
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 0,
},
},
},
["changes"] = {
{
["value"] = {
0.87450980392157,
0.34117647058824,
0.32941176470588,
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
},
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "Fg(3qGkaU0M",
["authorOptions"] = {
},
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["parent"] = "萨满 核心分组",
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "图腾投掷（符文）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["width"] = 32,
["alpha"] = 1,
["config"] = {
},
["inverse"] = true,
["color"] = {
1,
1,
1,
1,
},
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["icon"] = true,
},
["法力之潮图腾"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
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
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 16190,
["realSpellName"] = "法力之潮图腾",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
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
["single"] = "SHAMAN",
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
["spellknown"] = 16190,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 32,
["anchorFrameParent"] = false,
["selfPoint"] = "CENTER",
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "法力之潮图腾",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "HWW2HCawJpb",
["inverse"] = true,
["parent"] = "萨满 核心分组",
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
["icon"] = true,
},
["盾牌精通（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["parent"] = "萨满 核心分组",
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
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["useName"] = true,
["spellIds"] = {
},
["auranames"] = {
"408525",
},
["ownOnly"] = true,
["unit"] = "player",
["subeventPrefix"] = "SPELL",
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
["ignoreWagoUpdate"] = true,
["version"] = 11,
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
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorYOffset"] = 0,
["text_text_format_p_time_dynamic_threshold"] = 60,
["type"] = "subtext",
["text_text_format_p_time_precision"] = 1,
["text_color"] = {
0,
1,
0,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_format"] = 0,
["text_anchorYOffset"] = -3,
["text_text_format_p_time_mod_rate"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_shadowYOffset"] = 0,
["anchor_point"] = "TOP",
["text_fontSize"] = 17,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "SHAMAN",
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
["spellknown"] = 408524,
["zoneIds"] = "",
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "FSBFR4kNRXU",
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
["semver"] = "2.0.8",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "盾牌精通（符文）",
["zoom"] = 0.3,
["alpha"] = 1,
["width"] = 32,
["useCooldownModRate"] = true,
["config"] = {
},
["inverse"] = false,
["xOffset"] = 0,
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
["property"] = "sub.3.glow",
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
},
}
