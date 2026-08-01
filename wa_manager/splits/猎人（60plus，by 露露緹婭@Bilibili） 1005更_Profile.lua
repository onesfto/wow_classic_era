
WeakAurasSaved = {
["editor_tab_spaces"] = 4,
["login_squelch_time"] = 10,
["PULL(Need DBM BW ERT)PULL"] = 5,
["dbVersion"] = 90,
["标记目标 Mark TargetSet"] = false,
["displays"] = {
["侧翼打击（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "侧翼打击",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 415320,
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["type"] = "spell",
["use_genericShowOn"] = true,
["event"] = "Cooldown Ready (Spell)",
["unit"] = "player",
["realSpellName"] = "侧翼打击",
["use_spellName"] = true,
["debuffType"] = "HELPFUL",
["genericShowOn"] = "showOnCooldown",
["duration"] = "1",
["use_track"] = true,
["spellName"] = 415320,
},
["untrigger"] = {
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
["version"] = 14,
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
0,
1,
0,
1,
},
["glowThickness"] = 2,
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
["text_shadowYOffset"] = 0,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_mod_rate"] = true,
["text_anchorYOffset"] = -1,
["anchor_point"] = "TOP",
["text_fontSize"] = 19,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_format"] = 0,
},
},
["height"] = 32,
["progressSource"] = {
-1,
"",
},
["load"] = {
["talent2"] = {
["multi"] = {
[66] = false,
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
[106] = false,
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
},
},
["zoneIds"] = "",
["use_petbattle"] = false,
["use_class"] = true,
["use_spellknown"] = true,
["class_and_spec"] = {
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
["use_exact_spellknown"] = false,
["spellknown"] = 415320,
["size"] = {
["multi"] = {
},
},
},
["useTooltip"] = false,
["useAdjustededMax"] = false,
["authorOptions"] = {
},
["source"] = "import",
["cooldown"] = true,
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["value"] = 0,
["variable"] = "show",
},
{
["trigger"] = 1,
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
},
},
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["value"] = 0,
["variable"] = "show",
},
{
["trigger"] = 1,
["variable"] = "spellInRange",
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
["trigger"] = 2,
["variable"] = "show",
["value"] = 1,
["checks"] = {
{
["value"] = 1,
["variable"] = "show",
},
{
["trigger"] = 1,
["variable"] = "onCooldown",
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
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = true,
["property"] = "sub.2.useGlowColor",
},
{
["value"] = {
["sound_type"] = "Play",
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\【露露】BIU.ogg",
["sound_channel"] = "Master",
},
["property"] = "sound",
},
{
["property"] = "inverse",
},
{
["property"] = "desaturate",
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
["variable"] = "onCooldown",
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
["property"] = "inverse",
},
{
["property"] = "desaturate",
},
},
},
},
["parent"] = "猎人 核心分组",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "C7fA18u0JOP",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["tocversion"] = 30403,
["id"] = "侧翼打击（符文）",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["inverse"] = true,
["selfPoint"] = "CENTER",
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
},
},
},
["准备就绪"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["duration"] = "1",
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "准备就绪",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 23989,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 23989,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
},
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "UEQEu)NvI(u",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "准备就绪",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["削凿（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["spellName"] = 425711,
["realSpellName"] = "削凿",
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
["version"] = 14,
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
["progressSource"] = {
-1,
"",
},
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
[106] = false,
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["talent2"] = {
["multi"] = {
[66] = false,
},
},
["use_class"] = true,
["use_spellknown"] = true,
["class_and_spec"] = {
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
["use_exact_spellknown"] = false,
["spellknown"] = 425711,
["zoneIds"] = "",
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["color"] = {
1,
1,
1,
1,
},
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["icon"] = true,
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["adjustedMax"] = "",
["width"] = 32,
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["semver"] = "2.0.11",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "削凿（符文）",
["frameStrata"] = 1,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["url"] = "https://space.bilibili.com/455259",
["uid"] = "Defg9CHzMNp",
["inverse"] = true,
["parent"] = "猎人 核心分组",
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
["快速射击（强化雄鹰守护，露露语音）"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["sound"] = " custom",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】雄鹰.ogg",
["do_sound"] = true,
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
["type"] = "aura2",
["auraspellids"] = {
"146739",
},
["useName"] = true,
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["unit"] = "player",
["unitExists"] = false,
["names"] = {
},
["spellIds"] = {
},
["useExactSpellId"] = false,
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["auranames"] = {
"6150",
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
["version"] = 14,
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
["use_never"] = false,
["talent"] = {
["single"] = 2,
["multi"] = {
[2] = true,
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["zoneIds"] = "",
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
["use_spellknown"] = false,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 32,
["source"] = "import",
["icon"] = true,
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "猎人 动态分组 右",
["selfPoint"] = "CENTER",
["config"] = {
},
["authorOptions"] = {
},
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["tocversion"] = 30403,
["id"] = "快速射击（强化雄鹰守护，露露语音）",
["auto"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["zoom"] = 0.3,
["uid"] = "V4NframkEu5",
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
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["cooldownEdge"] = true,
},
["侧翼打击（猎人）"] = {
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
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!IOS-完成.ogg",
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
["auranames"] = {
"415320",
},
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["useExactSpellId"] = false,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["auraspellids"] = {
},
["unit"] = "player",
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
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%n",
["text_text_format_n_format"] = "string",
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
["text_text_format_n_abbreviate_max"] = 2,
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
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
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["text_justify"] = "CENTER",
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
["glowScale"] = 1.8,
["useGlowColor"] = false,
["glowXOffset"] = 0,
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
["use_spellknown"] = true,
["use_itemequiped"] = false,
["faction"] = {
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 415320,
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
["parent"] = "【露露】猎人（BUFF）",
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["conditions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["url"] = "https://space.bilibili.com/455259",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["icon"] = true,
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["desaturate"] = false,
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["tocversion"] = 30403,
["id"] = "侧翼打击（猎人）",
["zoom"] = 0.3,
["alpha"] = 1,
["width"] = 30,
["color"] = {
1,
1,
1,
1,
},
["uid"] = "(xnFG5h43oG",
["inverse"] = false,
["adjustedMax"] = "",
["displayIcon"] = "",
["cooldown"] = true,
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
},
["猎人印记（猎人）15秒补"] = {
["iconSource"] = -1,
["authorOptions"] = {
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
["rem"] = "15",
["auranames"] = {
"1130",
},
["matchesShowOn"] = "showOnActive",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HARMFUL",
["type"] = "aura2",
["use_debuffClass"] = false,
["auraspellids"] = {
},
["event"] = "Health",
["ownOnly"] = true,
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["useName"] = true,
["remOperator"] = "<=",
["useExactSpellId"] = false,
["unit"] = "target",
["useRem"] = true,
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
["type"] = "preset",
["easeType"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
["preset"] = "bounce",
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
["anchorXOffset"] = 0,
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
["text_visible"] = false,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 15,
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_text_format_p_format"] = "timed",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "印记",
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
["glowFrequency"] = 0.2,
["type"] = "subglow",
["glowXOffset"] = 0,
["glowType"] = "ACShine",
["glowLength"] = 5,
["glowYOffset"] = 0,
["glowColor"] = {
0.7843137254902,
0.098039215686275,
0.13725490196078,
1,
},
["glowThickness"] = 1.8,
["glowScale"] = 1.6,
["glow"] = true,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 3,
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
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
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
["use_never"] = false,
["level_operator"] = {
">=",
},
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["use_combat"] = true,
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["WARLOCK"] = true,
},
},
["level"] = {
"60",
},
["spellknown"] = 1130,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["xOffset"] = 0,
["selfPoint"] = "CENTER",
["cooldown"] = true,
["displayIcon"] = 132315,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["actions"] = {
["start"] = {
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!FF-Aggro.mp3",
["do_sound"] = true,
},
["init"] = {
},
["finish"] = {
["message"] = "",
["do_sound"] = false,
["message_type"] = "ERROR",
["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\BananaPeelSlip.ogg",
["do_message"] = false,
["sound_channel"] = "SFX",
},
},
["uid"] = "qEbU)jqdVsl",
["color"] = {
1,
1,
1,
1,
},
["anchorFrameParent"] = false,
["alpha"] = 1,
["parent"] = "【露露】猎人（BUFF）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["tocversion"] = 20501,
["id"] = "猎人印记（猎人）15秒补",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["url"] = "https://space.bilibili.com/455259",
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
["desaturate"] = false,
},
["照明弹"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["duration"] = "1",
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "照明弹",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 1543,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 1543,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
},
["parent"] = "猎人 动态分组 左",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "OfuNGuW33qX",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "照明弹",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["猎人守护合集（60plus）"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"13165",
"13161",
"5118",
"13159",
"13163",
"20043",
"415423",
},
["duration"] = "1",
["names"] = {
},
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["unevent"] = "auto",
["use_unit"] = true,
["spellIds"] = {
},
["matchesShowOn"] = "showOnMissing",
["useName"] = true,
["event"] = "Item Count",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    return (t[1] and t[4]) or (t[2] and t[3])\nend",
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
["alpha"] = 1,
["version"] = 14,
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
["glowThickness"] = 2,
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = true,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
["authorOptions"] = {
},
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 13163,
["size"] = {
["multi"] = {
},
},
},
["url"] = "https://space.bilibili.com/455259",
["authorMode"] = true,
["cooldown"] = true,
["source"] = "import",
["conditions"] = {
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
["value"] = 1,
["variable"] = "show",
},
},
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
{
["value"] = true,
["property"] = "sub.2.glow",
},
},
},
},
["xOffset"] = 0,
["useTooltip"] = false,
["uid"] = "sFfGO5lSS6h",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["adjustedMax"] = "",
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "猎人守护合集（60plus）",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["useCooldownModRate"] = true,
["width"] = 32,
["selfPoint"] = "CENTER",
["config"] = {
},
["inverse"] = false,
["parent"] = "猎人 动态分组 右",
["displayIcon"] = 136076,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["progressSource"] = {
-1,
"",
},
},
["宠物状态"] = {
["outline"] = "OUTLINE",
["color"] = {
1,
0.9921568627451,
0.97647058823529,
1,
},
["displayText"] = "%c",
["customText"] = "-- 定义一个匿名函数，没有指定名称，可能是作为局部函数或者回调函数使用\nfunction()\n    -- 获取宠物当前经验和下一个等级所需的经验值\n    local currXP, nextXP = GetPetExperience()\n    \n    -- 获取宠物和玩家的等级\n    local PetLevel = UnitLevel(\"pet\")\n    local PlayerLevel = UnitLevel(\"player\")\n    \n    -- 获取宠物的幸福感、伤害百分比和忠诚度\n    local happiness, damagePercentage, loyaltyRate = GetPetHappiness()\n    \n    -- 计算宠物升级所需的经验值\n    local PetExp = nextXP - currXP\n    \n    -- 初始化宠物状态文本变量\n    local state = \"\"\n    \n    -- 如果未来想要使用忠诚度信息，可以取消注释以下代码\n    -- local petLoyaltyText = GetPetLoyalty();\n    \n    -- 宠物等级信息\n    -- 判断宠物等级是否等于玩家等级\n    if PetLevel == PlayerLevel then\n        -- 如果相等，说明宠物等级已达到最大，设置PetMax为等级值后跟\"( Max)\"，Petlvl为\"0\"\n        PetMax = PetLevel..\" (Max)\"\n        Petlvl =  \"0\"\n    else\n        -- 如果不相等，设置PetMax为宠物等级，Petlvl为宠物升级所需的经验值\n        PetMax = PetLevel\n        Petlvl = PetExp\n    end\n    \n    -- 幸福感信息（从其他用户那里借鉴）\n    -- 根据宠物的幸福感设置state变量的值，state变量用于显示宠物的状态颜色\n    if happiness then\n        if happiness == 3 then\n            -- 如果幸福感为3，设置state为绿色文本\"快乐\"\n            state = \"|CFF20C000快乐\"\n        elseif happiness == 2 then\n            -- 如果幸福感为2，设置state为橙色文本\"满足\"\n            state = \"|CFFFE8A0E满足\"\n        else\n            -- 如果幸福感小于2，设置state为红色文本\"不高兴\"\n            state = \"|CFFFF0303不高兴\"\n        end\n    end     \n    \n    -- 返回格式化的文本，包括宠物的状态\n    -- \"|CFFFFFFFF\" 是白色文本的代码，\"\\n\" 是换行符\n    return \"|CFFFFFFFF\\n\"..state\nend",
["shadowYOffset"] = -1,
["anchorPoint"] = "CENTER",
["customTextUpdate"] = "update",
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
["type"] = "unit",
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["duration"] = "1",
["event"] = "Conditions",
["unit"] = "player",
["ownOnly"] = true,
["unevent"] = "auto",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["use_strength"] = true,
["use_unit"] = true,
["use_HasPet"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["subeventSuffix"] = "_CAST_START",
["use_inverse"] = true,
["event"] = "Stance/Form/Aura",
["use_unit"] = true,
["use_form"] = false,
["form"] = {
["multi"] = {
nil,
true,
true,
true,
},
},
["unevent"] = "auto",
["duration"] = "1",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["preset"] = "fade",
["easeStrength"] = 3,
["duration_type"] = "seconds",
},
["main"] = {
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
["finish"] = {
["type"] = "none",
["easeType"] = "none",
["preset"] = "fade",
["easeStrength"] = 3,
["duration_type"] = "seconds",
},
},
["desc"] = "",
["font"] = "Rurutia",
["version"] = 4,
["subRegions"] = {
{
["type"] = "subbackground",
},
},
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["HUNTER"] = true,
},
},
["use_class"] = true,
["zoneIds"] = "",
["use_itemequiped"] = false,
["spec"] = {
["multi"] = {
},
},
["use_level"] = false,
["level"] = {
"70",
},
["level_operator"] = {
">=",
},
["size"] = {
["multi"] = {
},
},
},
["fontSize"] = 16,
["source"] = "import",
["shadowXOffset"] = 1,
["selfPoint"] = "LEFT",
["regionType"] = "text",
["preferToUpdate"] = false,
["displayText_format_c_format"] = "none",
["fixedWidth"] = 200,
["anchorFrameParent"] = false,
["yOffset"] = -5,
["authorOptions"] = {
},
["config"] = {
},
["justify"] = "LEFT",
["tocversion"] = 11500,
["id"] = "宠物状态",
["automaticWidth"] = "Fixed",
["frameStrata"] = 4,
["anchorFrameType"] = "SCREEN",
["semver"] = "1.0.3",
["uid"] = "VsZ9OrDHT)B",
["xOffset"] = 30,
["parent"] = "【露露】猎人宠物工具（一键喂养与快乐度）",
["shadowColor"] = {
0,
0,
0,
1,
},
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["wordWrap"] = "WordWrap",
},
["胁迫"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["auranames"] = {
"19577",
},
["event"] = "Health",
["unit"] = "pet",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
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
["names"] = {
},
["realSpellName"] = "胁迫",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 19577,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 19577,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "cfX1ZDdkETu",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "胁迫",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["翼龙钉刺"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["realSpellName"] = "翼龙钉刺",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 19386,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 19386,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
},
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "0c8vNs()yvc",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "翼龙钉刺",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["震荡射击"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["auranames"] = {
"5116",
},
["event"] = "Health",
["unit"] = "target",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
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
["unevent"] = "auto",
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "震荡射击",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 5116,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 5116,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "efP1N9SvEe7",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "震荡射击",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["猎人印记"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
["xOffset"] = 0,
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
["auraspellids"] = {
"146739",
},
["useName"] = true,
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["unit"] = "target",
["unitExists"] = false,
["names"] = {
},
["spellIds"] = {
},
["useExactSpellId"] = false,
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["auranames"] = {
"1130",
},
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["rem"] = "60",
["auranames"] = {
"1130",
},
["matchesShowOn"] = "showOnActive",
["subeventPrefix"] = "SPELL",
["unitExists"] = false,
["debuffType"] = "HARMFUL",
["showClones"] = false,
["type"] = "aura2",
["useExactSpellId"] = false,
["event"] = "Health",
["unit"] = "target",
["names"] = {
},
["spellIds"] = {
},
["useName"] = true,
["remOperator"] = "<=",
["auraspellids"] = {
"146739",
},
["subeventSuffix"] = "_CAST_START",
["useRem"] = true,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["showClones"] = false,
["type"] = "aura2",
["auraspellids"] = {
"146739",
},
["useName"] = true,
["matchesShowOn"] = "showOnMissing",
["event"] = "Health",
["unit"] = "target",
["unitExists"] = false,
["names"] = {
},
["spellIds"] = {
},
["useExactSpellId"] = false,
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["auranames"] = {
"1130",
},
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_resting"] = true,
["use_incombat"] = false,
["debuffType"] = "HELPFUL",
["type"] = "unit",
["unit"] = "player",
["event"] = "Conditions",
["use_unit"] = true,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "custom",
["custom"] = "function()\n    if LWA and LWA.Init then\n        LWA.Init()\n    end\nend",
["custom_type"] = "event",
["debuffType"] = "HELPFUL",
["events"] = "OPTIONS",
["unit"] = "player",
["custom_hide"] = "custom",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.hunters_mark.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
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
["version"] = 14,
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
["use_never"] = false,
["talent"] = {
["single"] = 102,
["multi"] = {
[61] = true,
[102] = true,
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 14323,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["desc"] = "",
["source"] = "import",
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["adjustedMax"] = "",
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["selfPoint"] = "CENTER",
["uid"] = "aBRLvgmNrEI",
["color"] = {
1,
1,
1,
1,
},
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["parent"] = "猎人 核心分组",
["semver"] = "2.0.11",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "猎人印记",
["zoom"] = 0.3,
["frameStrata"] = 1,
["width"] = 32,
["useCooldownModRate"] = true,
["config"] = {
["maintenance"] = {
["hunters_mark"] = {
["behavior"] = 1,
},
},
},
["inverse"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = "<",
["value"] = 0,
["variable"] = "show",
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
["ignoreOptionsEventErrors"] = true,
},
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
["text"] = "Hunter's Mark",
["type"] = "description",
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
["name"] = "Behavior",
["useDesc"] = false,
["key"] = "behavior",
["width"] = 1,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["name"] = "Hunter's Mark",
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["collapse"] = false,
["type"] = "group",
["limitType"] = "none",
["groupType"] = "simple",
["key"] = "hunters_mark",
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
},
["灵猴守护"] = {
["iconSource"] = -1,
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
["use_debuffClass"] = false,
["auranames"] = {
"13163",
},
["useExactSpellId"] = false,
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["auraspellids"] = {
},
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["names"] = {
},
["unit"] = "player",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
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
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
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
["anchorXOffset"] = 0,
["text_color"] = {
1,
1,
1,
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
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_text_format_p_format"] = "timed",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "",
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
["text_anchorYOffset"] = 22,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["type"] = "subborder",
["border_offset"] = 1,
["border_color"] = {
0.54509803921569,
0.84313725490196,
0.45490196078431,
1,
},
["border_visible"] = false,
["border_edge"] = "Square Full White",
["border_size"] = 1,
},
},
["height"] = 28,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 13163,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["frameStrata"] = 1,
["adjustedMax"] = "",
["parent"] = "猎人 底部分组（可点击的守护条）",
["cooldown"] = false,
["displayIcon"] = 132159,
["internalVersion"] = 90,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "cfjQQgRPl0r",
["selfPoint"] = "CENTER",
["width"] = 28,
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["desaturate"] = false,
["tocversion"] = 20502,
["id"] = "灵猴守护",
["alpha"] = 1,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["actions"] = {
["start"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 灵猴守护\\n/click StaticPopup1Button1\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff露露的快捷按钮\\n左键：|r|cff00ff00\"..\"灵猴守护\"..\"|r\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["init"] = {
},
["finish"] = {
},
},
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
},
["changes"] = {
{
["value"] = false,
["property"] = "desaturate",
},
{
["value"] = 0.4,
["property"] = "alpha",
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
["property"] = "sub.4.border_visible",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["xOffset"] = 0,
},
["破甲虚弱（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["type"] = "aura2",
["use_debuffClass"] = false,
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["useExactSpellId"] = false,
["unit"] = "player",
["spellIds"] = {
},
["auranames"] = {
"409504",
},
["subeventPrefix"] = "SPELL",
["auraspellids"] = {
"12043",
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
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
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
["glow"] = true,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
["useTooltip"] = false,
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
[10] = true,
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["PALADIN"] = true,
},
},
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 409504,
["size"] = {
["multi"] = {
},
},
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
["useAdjustededMax"] = false,
["xOffset"] = 0,
["source"] = "import",
["cooldown"] = true,
["displayIcon"] = "",
["parent"] = "猎人 动态分组 左",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "vpf)oarKiWZ",
["adjustedMax"] = "",
["width"] = 32,
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 20501,
["id"] = "破甲虚弱（符文）",
["alpha"] = 1,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["actions"] = {
["start"] = {
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!IOS-竹子.ogg",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】攻强.ogg",
["do_sound"] = true,
},
["init"] = {
},
["finish"] = {
},
},
["config"] = {
},
["inverse"] = false,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["progressSource"] = {
-1,
"",
},
},
["猎豹守护"] = {
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
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 猎豹守护\\n/click StaticPopup1Button1\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff露露的快捷按钮\\n左键：|r|cff00ff00\"..\"猎豹守护\"..\"|r\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
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
["use_debuffClass"] = false,
["auranames"] = {
"5118",
},
["useExactSpellId"] = false,
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["auraspellids"] = {
},
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["names"] = {
},
["unit"] = "player",
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
["anchorXOffset"] = 0,
["text_color"] = {
1,
1,
1,
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
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_text_format_p_format"] = "timed",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "",
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
["text_anchorYOffset"] = 22,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["type"] = "subborder",
["border_offset"] = 1,
["border_color"] = {
0.54509803921569,
0.84313725490196,
0.45490196078431,
1,
},
["border_visible"] = false,
["border_edge"] = "Square Full White",
["border_size"] = 1,
},
},
["height"] = 28,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 5118,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["alpha"] = 1,
["adjustedMax"] = "",
["parent"] = "猎人 底部分组（可点击的守护条）",
["cooldown"] = false,
["displayIcon"] = 132242,
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "wr)tdq6Tnrl",
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
["width"] = 28,
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["tocversion"] = 20502,
["id"] = "猎豹守护",
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["icon"] = true,
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
},
["changes"] = {
{
["value"] = false,
["property"] = "desaturate",
},
{
["value"] = 0.4,
["property"] = "alpha",
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
["property"] = "sub.4.border_visible",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["xOffset"] = 0,
},
["猎人 法力条"] = {
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
["single"] = "HUNTER",
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
["parent"] = "猎人 资源条",
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
{
["trigger"] = {
["itemName"] = 0,
["use_count"] = false,
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["unit"] = "player",
["itemSlot"] = 0,
["use_weapon"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["use_itemTypeName"] = true,
["use_showOn"] = true,
["event"] = "Cooldown Progress (Equipment Slot)",
["use_itemSlot"] = true,
["use_testForCooldown"] = false,
["showOn"] = "showOnActive",
["use_itemName"] = true,
["weapon"] = "main",
},
["untrigger"] = {
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
["text_text"] = "%1.power - %2.s",
["text_text_format_2.p_time_format"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_2.p_time_legacy_floor"] = false,
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
["text_text_format_1.power_format"] = "Number",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_2.p_time_precision"] = 1,
["text_text_format_2.p_format"] = "timed",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_visible"] = true,
["text_font"] = "Rurutia",
["text_text_format_1.percentpower_round_type"] = "floor",
["text_anchorYOffset"] = -0.5,
["text_text_format_1.percentpower_format"] = "Number",
["text_fixedWidth"] = 64,
["text_text_format_2.p_time_dynamic_threshold"] = 60,
["text_text_format_2.p_time_mod_rate"] = true,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_CENTER",
["text_text_format_1.power_pad_mode"] = "left",
["text_text_format_1.power_pad"] = false,
["text_selfPoint"] = "AUTO",
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
["uid"] = "acwjPflChAr",
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
["width"] = 297,
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
["id"] = "猎人 法力条",
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
["蝎毒"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
["parent"] = "猎人 动态分组 右",
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
["useName"] = true,
["useExactSpellId"] = false,
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["unit"] = "target",
["unitExists"] = false,
["auranames"] = {
"24640",
},
["spellIds"] = {
},
["type"] = "aura2",
["auraspellids"] = {
"146739",
},
["subeventPrefix"] = "SPELL",
["names"] = {
},
["debuffType"] = "HARMFUL",
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
["version"] = 12,
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
["glow"] = false,
["glowScale"] = 1,
["glowThickness"] = 1,
["useGlowColor"] = false,
["glowXOffset"] = 0,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorYOffset"] = 0,
["type"] = "subtext",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
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
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
[4] = true,
},
},
["class"] = {
["single"] = "HUNTER",
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
["use_spellknown"] = false,
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
["spellknown"] = 14144,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
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
["selfPoint"] = "CENTER",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["desc"] = "",
["config"] = {
},
["xOffset"] = 0,
["width"] = 32,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.10",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "蝎毒",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "ArFC(huctza",
["inverse"] = false,
["url"] = "https://space.bilibili.com/455259",
["conditions"] = {
},
["cooldown"] = true,
["color"] = {
1,
1,
1,
1,
},
},
["假死"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["match_countOperator"] = ">",
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["names"] = {
},
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["useMatch_count"] = true,
["match_count"] = "0",
["auranames"] = {
"5384",
},
["type"] = "aura2",
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
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "假死",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 5384,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 5384,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
["parent"] = "猎人 动态分组 左",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "gsFENwmX5Vi",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "假死",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["野兽守护"] = {
["iconSource"] = -1,
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
["useName"] = true,
["use_debuffClass"] = false,
["auranames"] = {
"13161",
},
["useExactSpellId"] = false,
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["auraspellids"] = {
},
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["names"] = {
},
["unit"] = "player",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
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
["anchorXOffset"] = 0,
["text_color"] = {
1,
1,
1,
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
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_text_format_p_format"] = "timed",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "",
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
["text_anchorYOffset"] = 22,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["type"] = "subborder",
["border_offset"] = 1,
["border_color"] = {
0.54509803921569,
0.84313725490196,
0.45490196078431,
1,
},
["border_visible"] = false,
["border_edge"] = "Square Full White",
["border_size"] = 1,
},
},
["height"] = 28,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 13161,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["frameStrata"] = 1,
["adjustedMax"] = "",
["parent"] = "猎人 底部分组（可点击的守护条）",
["cooldown"] = false,
["displayIcon"] = 132252,
["internalVersion"] = 90,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "8G6hcTaQlBZ",
["color"] = {
1,
1,
1,
1,
},
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["desaturate"] = false,
["tocversion"] = 20502,
["id"] = "野兽守护",
["alpha"] = 1,
["useCooldownModRate"] = true,
["width"] = 28,
["actions"] = {
["start"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 野兽守护\\n/click StaticPopup1Button1\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff露露的快捷按钮\\n左键：|r|cff00ff00\"..\"野兽守护\"..\"|r\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["init"] = {
},
["finish"] = {
},
},
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
},
["changes"] = {
{
["value"] = false,
["property"] = "desaturate",
},
{
["value"] = 0.4,
["property"] = "alpha",
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
["property"] = "sub.4.border_visible",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
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
},
["【露露】平射/射击条（猎人）"] = {
["sparkWidth"] = 25,
["iconSource"] = -1,
["xOffset"] = -6.7816841681319e-05,
["preferToUpdate"] = true,
["yOffset"] = -19,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
["do_glow"] = false,
},
},
["fontFlags"] = "OUTLINE",
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
1,
1,
1,
},
["desaturate"] = false,
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["talent2"] = {
["multi"] = {
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["HUNTER"] = true,
["WARRIOR"] = true,
["ROGUE"] = true,
},
},
["ingroup"] = {
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
["pvptalent"] = {
["multi"] = {
},
},
["faction"] = {
["multi"] = {
},
},
["use_spec"] = true,
["use_class"] = true,
["spec"] = {
["single"] = 1,
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
["texture"] = "!Rurutia23",
["sparkTexture"] = "XPBarAnim-OrangeSpark",
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
["color"] = {
},
["adjustedMin"] = "",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["subeventSuffix"] = "_CAST_START",
["unevent"] = "auto",
["event"] = "Swing Timer",
["use_absorbMode"] = true,
["genericShowOn"] = "showOnActive",
["subeventPrefix"] = "SPELL",
["use_unit"] = true,
["names"] = {
},
["spellIds"] = {
},
["use_hand"] = true,
["unit"] = "player",
["duration"] = "1",
["hand"] = "ranged",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t) \n    return t[1]\nend\n",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["useAdjustedMin"] = false,
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
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "grow",
["duration_type"] = "seconds",
},
},
["backdropInFront"] = false,
["stickyDuration"] = false,
["version"] = 9,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text"] = "%p",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_p_time_dynamic_threshold"] = 60,
["type"] = "subtext",
["text_text_format_p_format"] = "timed",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_shadowYOffset"] = -1,
["text_text_format_p_time_format"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_shadowXOffset"] = 1,
["anchor_point"] = "INNER_CENTER",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_n_format"] = "none",
},
{
["tick_rotation"] = 0,
["tick_xOffset"] = 0,
["tick_desaturate"] = false,
["use_texture"] = false,
["tick_placement_mode"] = "AtPercent",
["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["tick_length"] = 10,
["tick_blend_mode"] = "ADD",
["type"] = "subtick",
["tick_placements"] = {
"25",
},
["automatic_length"] = false,
["tick_thickness"] = 5,
["tick_color"] = {
1,
1,
1,
1,
},
["tick_yOffset"] = 0,
["progressSources"] = {
{
-2,
"",
},
},
["tick_mirror"] = false,
["tick_visible"] = true,
},
},
["height"] = 5,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["source"] = "import",
["progressSource"] = {
-1,
"",
},
["barColor2"] = {
1,
1,
0,
1,
},
["useAdjustedMax"] = false,
["zoom"] = 0,
["desc"] = "自制自用WA，WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["parent"] = "猎人 资源条",
["borderInFront"] = true,
["config"] = {
},
["icon_side"] = "RIGHT",
["spark"] = false,
["borderBackdrop"] = "None",
["sparkHeight"] = 20,
["width"] = 297,
["icon"] = false,
["backgroundColor"] = {
0.31764705882353,
0.22745098039216,
0.16862745098039,
0,
},
["semver"] = "1.0.8",
["sparkHidden"] = "FULL",
["id"] = "【露露】平射/射击条（猎人）",
["backdropColor"] = {
0,
0,
0,
1,
},
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["uid"] = "n(8pNRUdcEJ",
["authorOptions"] = {
},
["inverse"] = true,
["sparkDesature"] = false,
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 1,
},
["changes"] = {
{
["value"] = 1,
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
["adjustedMax"] = "",
},
["猛禽一击（猎人）"] = {
["iconSource"] = -1,
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
"415362",
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
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_legacy_floor"] = true,
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
["text_shadowColor"] = {
0,
0,
0,
1,
},
},
{
["text_text_format_p_time_format"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%n",
["text_text_format_p_time_precision"] = 1,
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
["text_text_format_n_abbreviate_max"] = 2,
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_format"] = "timed",
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
["text_visible"] = true,
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_n_format"] = "string",
["text_justify"] = "CENTER",
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
["text_shadowXOffset"] = 0,
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
["glowScale"] = 1.8,
["glow"] = true,
["useGlowColor"] = false,
["glowDuration"] = 1,
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
["use_spellknown"] = true,
["use_itemequiped"] = false,
["faction"] = {
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 415342,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["cooldownEdge"] = false,
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
["cooldown"] = true,
["displayIcon"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["desaturate"] = false,
["uid"] = "qOY0YAPUPlj",
["color"] = {
1,
1,
1,
1,
},
["anchorFrameParent"] = false,
["alpha"] = 1,
["parent"] = "【露露】猎人（BUFF）",
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["tocversion"] = 30403,
["id"] = "猛禽一击（猎人）",
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
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
["actions"] = {
["start"] = {
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!IOS-完成.ogg",
["do_sound"] = false,
},
["init"] = {
},
["finish"] = {
},
},
},
["钉刺合集"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["cooldownEdge"] = true,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"1978",
"3034",
"3043",
"19386",
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "target",
["unitExists"] = true,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["names"] = {
},
["matchesShowOn"] = "showAlways",
["useName"] = true,
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 1978,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
["cooldown"] = true,
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
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "(rjX2)akWhz",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "钉刺合集",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
["config"] = {
},
["inverse"] = false,
["authorOptions"] = {
},
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["xOffset"] = 0,
},
["猎人 资源条"] = {
["controlledChildren"] = {
"猎人 法力条",
"5秒回蓝（猎人）",
"【露露】平射/射击条（猎人）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["parent"] = "猎人（中心分组，by 露露緹婭@Bilibili）",
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
["groupIcon"] = "interface/icons/classicon_hunter.blp",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "猎人 资源条",
["selfPoint"] = "CENTER",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["borderInset"] = 1,
["config"] = {
},
["uid"] = "BaapS)Uhv(T",
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["xOffset"] = 0,
},
["喂养宠物效果（猎人）"] = {
["iconSource"] = -1,
["parent"] = "【露露】猎人（BUFF）",
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
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["use_debuffClass"] = false,
["auranames"] = {
"喂养宠物效果",
},
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["type"] = "aura2",
["unit"] = "pet",
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
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
0.9725490808486938,
0.05098039656877518,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_legacy_floor"] = true,
["text_shadowYOffset"] = 0,
["text_shadowXOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "喂养",
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
["useGlowColor"] = false,
["glowType"] = "Pixel",
["glowLength"] = 5,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowScale"] = 1,
["glowThickness"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
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
["text_visible"] = false,
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
},
},
["height"] = 30,
["load"] = {
["use_class"] = true,
["use_itemequiped"] = false,
["talent"] = {
["single"] = 97,
["multi"] = {
[97] = true,
},
},
["use_never"] = false,
["class"] = {
["single"] = "HUNTER",
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
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["authorOptions"] = {
},
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["conditions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["icon"] = true,
["config"] = {
},
["cooldownEdge"] = false,
["anchorFrameParent"] = false,
["alpha"] = 1,
["color"] = {
1,
1,
1,
1,
},
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["tocversion"] = 20501,
["id"] = "喂养宠物效果（猎人）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["uid"] = "yNy2g1Uxry1",
["inverse"] = false,
["adjustedMax"] = "",
["displayIcon"] = 132165,
["cooldown"] = true,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
},
["猎人（中心分组，by 露露緹婭@Bilibili）"] = {
["controlledChildren"] = {
"【露露】猎人宠物工具（一键喂养与快乐度）",
"猎人 动态分组 左",
"猎人 动态分组 右",
"猎人 核心分组",
"猎人 底部分组（可点击的守护条）",
"猎人 资源条",
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
["frameStrata"] = 3,
["groupIcon"] = "interface/icons/classicon_hunter.blp",
["borderOffset"] = 5,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "猎人（中心分组，by 露露緹婭@Bilibili）",
["selfPoint"] = "CENTER",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["parent"] = "猎人（60plus，by 露露緹婭@Bilibili） 1005更",
["borderInset"] = 11,
["config"] = {
},
["uid"] = "Xm5f3bpgbGK",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["ignoreOptionsEventErrors"] = true,
["forceEvents"] = true,
["groupOffset"] = false,
},
["xOffset"] = 0,
},
["集中火力（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
["parent"] = "猎人 核心分组",
["preferToUpdate"] = true,
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
"428726",
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
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "集中火力",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 428726,
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["type"] = "aura2",
["useExactSpellId"] = true,
["debuffType"] = "HELPFUL",
["auraspellids"] = {
"428728",
},
["unit"] = "pet",
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
["version"] = 5,
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
["glow"] = false,
["glowThickness"] = 1,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%3.s",
["text_text_format_3.p_time_format"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["rotateText"] = "NONE",
["text_color"] = {
1,
1,
1,
1,
},
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontSize"] = 18,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_3.p_time_precision"] = 1,
["type"] = "subtext",
["text_text_format_3.p_time_legacy_floor"] = false,
["text_font"] = "Rurutia",
["text_shadowXOffset"] = 0,
["text_text_format_3.p_time_mod_rate"] = true,
["text_text_format_3.p_time_dynamic_threshold"] = 60,
["text_text_format_3.S_format"] = "none",
["text_text_format_3.s_format"] = "none",
["text_text_format_3.p_format"] = "timed",
["text_text_format_p_time_dynamic_threshold"] = 60,
["anchor_point"] = "TOP",
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_time_precision"] = 1,
["text_fontType"] = "OUTLINE",
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
["single"] = "HUNTER",
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
["spellknown"] = 428726,
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
["trigger"] = 3,
["variable"] = "stacks",
["op"] = "==",
["value"] = "5",
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
["value"] = {
0,
1,
0,
1,
},
["property"] = "sub.3.text_color",
},
},
},
},
["progressSource"] = {
-1,
"",
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["cooldownEdge"] = false,
["uid"] = "oLDPpokT9tr",
["color"] = {
1,
1,
1,
1,
},
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.3",
["tocversion"] = 30400,
["id"] = "集中火力（符文）",
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["width"] = 32,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = false,
["custom"] = "",
},
},
["config"] = {
},
["inverse"] = true,
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
["xOffset"] = 0,
},
["猎人（60plus，by 露露緹婭@Bilibili） 1005更"] = {
["controlledChildren"] = {
"【猎人】假死抵抗语音（seppala-faerlina）",
"【露露】猎人（BUFF）",
"猎人（中心分组，by 露露緹婭@Bilibili）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 0,
["groupIcon"] = "interface/icons/classicon_hunter.blp",
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
["id"] = "猎人（60plus，by 露露緹婭@Bilibili） 1005更",
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
["uid"] = "cDEZYfKzKj3",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
},
["alpha"] = 1,
},
["猎人 动态分组 左"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"破甲虚弱（符文）",
"宁神射击",
"蝰蛇钉刺",
"假死",
"照明弹",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["parent"] = "猎人（中心分组，by 露露緹婭@Bilibili）",
["preferToUpdate"] = true,
["groupIcon"] = "interface/icons/classicon_hunter.blp",
["gridType"] = "RU",
["stepAngle"] = 15,
["frameStrata"] = 1,
["fullCircle"] = true,
["rowSpace"] = 5,
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
["radius"] = 200,
["xOffset"] = -149,
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
["space"] = 3,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["rotation"] = 0,
["version"] = 3,
["selfPoint"] = "BOTTOMLEFT",
["borderColor"] = {
0,
0,
0,
1,
},
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
["authorOptions"] = {
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["arcLength"] = 360,
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
["uid"] = "u(atSFRzcTl",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "猎人 动态分组 左",
["sort"] = "none",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["yOffset"] = 24,
["config"] = {
},
["internalVersion"] = 90,
["useLimit"] = true,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["sortHybridTable"] = {
["冰锥术"] = false,
},
},
["雄狮之心"] = {
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
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 雄狮之心\\n/click StaticPopup1Button1\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff露露的快捷按钮\\n左键：|r|cff00ff00\"..\"雄狮之心\"..\"|r\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["use_debuffClass"] = false,
["auranames"] = {
"409580",
},
["useExactSpellId"] = false,
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["unit"] = "player",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["auraspellids"] = {
},
["ownOnly"] = true,
["names"] = {
},
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
["keepAspectRatio"] = false,
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
1,
1,
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
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "",
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
["text_anchorYOffset"] = 22,
["text_text_format_p_time_precision"] = 1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = false,
["text_text_format_p_format"] = "timed",
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_time_format"] = 0,
},
{
["border_offset"] = 1,
["border_size"] = 1,
["border_color"] = {
0.54509803921569,
0.84313725490196,
0.45490196078431,
1,
},
["border_visible"] = false,
["border_edge"] = "Square Full White",
["type"] = "subborder",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
["useGlowColor"] = true,
["glowType"] = "Pixel",
["glowLength"] = 10,
["glowYOffset"] = 1,
["glowColor"] = {
1,
0,
0,
1,
},
["glowScale"] = 1,
["glowThickness"] = 2,
["glowDuration"] = 1,
["glowXOffset"] = 1,
["type"] = "subglow",
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 28,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["PALADIN"] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 409580,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["frameStrata"] = 1,
["adjustedMax"] = "",
["icon"] = true,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
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
["value"] = 1,
["property"] = "alpha",
},
{
["value"] = true,
["property"] = "sub.5.glow",
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
["property"] = "sub.4.border_visible",
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
["config"] = {
},
["useTooltip"] = false,
["width"] = 28,
["anchorFrameParent"] = false,
["parent"] = "猎人 底部分组（可点击的守护条）",
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["tocversion"] = 20502,
["id"] = "雄狮之心",
["useCooldownModRate"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["selfPoint"] = "CENTER",
["uid"] = "SImr(UZ)KG4",
["inverse"] = false,
["cooldownEdge"] = false,
["displayIcon"] = 136074,
["cooldown"] = false,
["xOffset"] = 0,
},
["荷枪实弹（猎人）"] = {
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
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!IOS-完成.ogg",
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
"415413",
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
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "%n",
["text_text_format_p_time_format"] = 0,
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
["text_text_format_n_abbreviate_max"] = 2,
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_format"] = "timed",
["text_text_format_n_format"] = "string",
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
["text_anchorYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_shadowXOffset"] = 0,
["text_justify"] = "CENTER",
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
["text_visible"] = false,
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
["glowScale"] = 1.8,
["glow"] = true,
["useGlowColor"] = false,
["glowDuration"] = 1,
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
["single"] = "HUNTER",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 415413,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["selfPoint"] = "CENTER",
["desaturate"] = false,
["cooldown"] = true,
["displayIcon"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["authorOptions"] = {
},
["url"] = "https://space.bilibili.com/455259",
["uid"] = "DVdXrZyB7NZ",
["xOffset"] = 0,
["anchorFrameParent"] = false,
["alpha"] = 1,
["progressSource"] = {
-1,
"",
},
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["tocversion"] = 30403,
["id"] = "荷枪实弹（猎人）",
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
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["parent"] = "【露露】猎人（BUFF）",
},
["猎人 动态分组 右"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"猎人守护合集（60plus）",
"蝎毒",
"快速射击（强化雄鹰守护，露露语音）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["parent"] = "猎人（中心分组，by 露露緹婭@Bilibili）",
["preferToUpdate"] = true,
["yOffset"] = 24,
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
["radius"] = 200,
["groupIcon"] = "interface/icons/classicon_hunter.blp",
["useLimit"] = true,
["align"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
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
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["rotation"] = 0,
["version"] = 3,
["grow"] = "GRID",
["selfPoint"] = "BOTTOMRIGHT",
["uid"] = "EIsAOTQCH)O",
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
["xOffset"] = 149,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["rowSpace"] = 5,
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
["authorOptions"] = {
},
["constantFactor"] = "RADIUS",
["sort"] = "none",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "猎人 动态分组 右",
["regionType"] = "dynamicgroup",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["borderInset"] = 1,
["config"] = {
},
["anchorPoint"] = "CENTER",
["internalVersion"] = 90,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["sortHybridTable"] = {
["启迪"] = false,
["时光道标"] = false,
["再生"] = false,
},
},
["狂野怒火"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
"19574",
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "pet",
["spellIds"] = {
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
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
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "狂野怒火",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 19574,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 19574,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "GHjQIVFGzlE",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "狂野怒火",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["【露露】猎人（BUFF）"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"荷枪实弹（猎人）",
"侧翼打击（猎人）",
"猛禽一击（猎人）",
"疾速杀戮（猎人）",
"狂乱/集中火力（猎人，宠物）",
"无宠物警告（猎人）",
"蝰蛇守护 开启提示",
"宠物低血量（猎人）",
"喂养宠物效果（猎人）",
"治疗宠物（猎人）",
"毒蛇钉刺、毒蝎钉刺（猎人）3秒补",
"猎人印记（猎人）15秒补",
"狙击训练（符文）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["parent"] = "猎人（60plus，by 露露緹婭@Bilibili） 1005更",
["preferToUpdate"] = true,
["yOffset"] = -37.454545454545,
["sortHybridTable"] = {
["宠物低血量（猎人）"] = false,
["快速射击/强化雄鹰守护（兽王猎）语音"] = false,
["猎人印记（猎人）15秒补"] = false,
["战术大师（兽王猎）"] = false,
["喂养宠物效果（猎人）"] = false,
["狂野怒火/野兽之心（兽王猎）"] = false,
["治疗宠物（猎人）"] = false,
["无宠物警告（猎人）"] = false,
["毒蝎钉刺（猎人）5秒补"] = false,
},
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
["selfPoint"] = "TOPLEFT",
["align"] = "CENTER",
["borderInset"] = 1,
["rotation"] = 0,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["radius"] = 200,
["xOffset"] = 142,
["subRegions"] = {
},
["useLimit"] = true,
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
["backdropColor"] = {
1,
1,
1,
0.5,
},
["config"] = {
},
["source"] = "import",
["gridType"] = "RD",
["scale"] = 1.1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["sort"] = "none",
["regionType"] = "dynamicgroup",
["alpha"] = 1,
["anchorFrameParent"] = false,
["constantFactor"] = "RADIUS",
["gridWidth"] = 5,
["borderOffset"] = 4,
["authorOptions"] = {
},
["rowSpace"] = 35,
["id"] = "【露露】猎人（BUFF）",
["limit"] = 10,
["frameStrata"] = 1,
["anchorFrameType"] = "UIPARENT",
["animate"] = false,
["uid"] = "tdL56aIxmwr",
["fullCircle"] = true,
["anchorPoint"] = "CENTER",
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["groupIcon"] = "interface/icons/classicon_hunter.blp",
},
["猛禽一击"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["auranames"] = {
"Arcane Shot",
},
["use_matchedRune"] = false,
["matchesShowOn"] = "showAlways",
["genericShowOn"] = "showAlways",
["unit"] = "player",
["unitExists"] = true,
["subeventPrefix"] = "SPELL",
["spellName"] = 2973,
["debuffType"] = "HELPFUL",
["names"] = {
},
["type"] = "spell",
["use_genericShowOn"] = true,
["subeventSuffix"] = "_CAST_START",
["use_spellCount"] = false,
["use_unit"] = true,
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "猛禽一击",
["use_spellName"] = true,
["spellIds"] = {
},
["useName"] = true,
["unevent"] = "auto",
["duration"] = "1",
["use_track"] = true,
["use_showgcd"] = false,
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["type"] = "unit",
["subeventSuffix"] = "",
["event"] = "Range Check",
["unit"] = "target",
["subeventPrefix"] = "",
["use_range"] = true,
["range"] = "5",
["use_unit"] = true,
["range_operator"] = "<=",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["unit"] = "target",
["type"] = "unit",
["use_hostility"] = true,
["event"] = "Unit Characteristics",
["hostility"] = "hostile",
["use_unit"] = true,
["use_attackable"] = true,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 2973,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
["cooldown"] = true,
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 0,
},
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 1,
["op"] = "<=",
},
{
["trigger"] = 3,
["variable"] = "show",
["value"] = 1,
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
},
},
},
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "8EJj476j4gi",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "猛禽一击",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["驱散射击"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["auranames"] = {
"19503",
},
["event"] = "Health",
["unit"] = "target",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
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
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "驱散射击",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 19503,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 19503,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
["trigger"] = 2,
["variable"] = "spellInRange",
["value"] = 0,
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
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "Xt4Dkm2rC56",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "驱散射击",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["宠物低血量（猎人）"] = {
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
["url"] = "https://space.bilibili.com/455259",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["auranames"] = {
"喂养宠物效果",
},
["ownOnly"] = true,
["use_unit"] = true,
["use_HasPet"] = false,
["debuffType"] = "HELPFUL",
["useName"] = true,
["use_debuffClass"] = false,
["subeventSuffix"] = "_CAST_START",
["percenthealth"] = {
"50",
},
["event"] = "Health",
["unit"] = "pet",
["spellIds"] = {
},
["names"] = {
},
["type"] = "unit",
["use_percenthealth"] = true,
["percenthealth_operator"] = {
"<=",
},
["subeventPrefix"] = "SPELL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_mounted"] = false,
["type"] = "unit",
["use_HasPet"] = true,
["use_unit"] = true,
["use_vehicle"] = false,
["debuffType"] = "HELPFUL",
["event"] = "Conditions",
["unit"] = "player",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = false,
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
0.28235294117647,
0.28627450980392,
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
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "收宠",
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
0.28235294117647,
0.28627450980392,
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
["useGlowColor"] = true,
["glowType"] = "Pixel",
["glowLength"] = 5,
["glowYOffset"] = 0,
["glowColor"] = {
1,
0.28235294117647,
0.28627450980392,
1,
},
["glowScale"] = 1,
["glowThickness"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
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
["text_shadowXOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
},
},
["height"] = 30,
["load"] = {
["use_level"] = true,
["talent"] = {
["single"] = 97,
["multi"] = {
[97] = true,
},
},
["use_vehicle"] = false,
["level_operator"] = {
">=",
},
["use_never"] = false,
["use_class"] = true,
["spec"] = {
["multi"] = {
},
},
["use_itemequiped"] = false,
["use_vehicleUi"] = false,
["level"] = {
"10",
},
["use_alive"] = true,
["class"] = {
["single"] = "HUNTER",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["parent"] = "【露露】猎人（BUFF）",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
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
["variable"] = "show",
["value"] = 1,
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
["value"] = "buttonOverlay",
["property"] = "sub.4.glowType",
},
{
["value"] = {
["sound_type"] = "Play",
["sound"] = " custom",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】Pirorirorin.ogg",
["sound_channel"] = "SFX",
},
["property"] = "sound",
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["config"] = {
},
["cooldownEdge"] = false,
["anchorFrameParent"] = false,
["alpha"] = 1,
["authorOptions"] = {
},
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["tocversion"] = 20501,
["id"] = "宠物低血量（猎人）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["uid"] = "(hc3iNZ69nL",
["inverse"] = false,
["adjustedMax"] = "",
["displayIcon"] = 136168,
["cooldown"] = true,
["selfPoint"] = "CENTER",
},
["奥术射击"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["duration"] = "1",
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "奥术射击",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 3044,
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
["version"] = 14,
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
["progressSource"] = {
-1,
"",
},
["load"] = {
["talent2"] = {
["multi"] = {
[66] = false,
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
[106] = false,
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
},
},
["zoneIds"] = "",
["use_petbattle"] = false,
["use_class"] = true,
["use_spellknown"] = true,
["class_and_spec"] = {
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
["use_exact_spellknown"] = false,
["spellknown"] = 3044,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "NSk(ivi7h(u",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "奥术射击",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["畏缩"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["match_countOperator"] = ">",
["unit"] = "pet",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["auranames"] = {
"1742",
},
["names"] = {
},
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["match_count"] = "0",
["useMatch_count"] = true,
["type"] = "aura2",
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
["names"] = {
},
["realSpellName"] = "畏缩",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 1742,
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
["version"] = 14,
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
["progressSource"] = {
-1,
"",
},
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["class_and_spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
},
},
["spellknown"] = 1742,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "7(Lx5pN3Vdr",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "畏缩",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["多重射击"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["duration"] = "1",
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "多重射击",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 2643,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
},
},
["zoneIds"] = "",
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
["spellknown"] = 2643,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "HSW68EXOwvC",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "多重射击",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["奇美拉射击（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
["parent"] = "猎人 核心分组",
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
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 409433,
["realSpellName"] = "奇美拉射击",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
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
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
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
["version"] = 14,
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
["progressSource"] = {
-1,
"",
},
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
[106] = false,
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["talent2"] = {
["multi"] = {
[66] = false,
},
},
["use_class"] = true,
["use_spellknown"] = true,
["class_and_spec"] = {
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
["use_exact_spellknown"] = false,
["spellknown"] = 409433,
["zoneIds"] = "",
},
["cooldownEdge"] = false,
["useAdjustededMax"] = false,
["authorOptions"] = {
},
["source"] = "import",
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
},
["finish"] = {
},
},
["internalVersion"] = 90,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["adjustedMax"] = "",
["width"] = 32,
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.11",
["tocversion"] = 30403,
["id"] = "奇美拉射击（符文）",
["frameStrata"] = 1,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["color"] = {
1,
1,
1,
1,
},
["uid"] = "xSXL6zfiemR",
["inverse"] = true,
["selfPoint"] = "CENTER",
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
["xOffset"] = 0,
},
["逃脱"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["duration"] = "1",
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "逃脱",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 781,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 781,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
},
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "cM6ZuyyOOtU",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "逃脱",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["狙击训练（符文）"] = {
["iconSource"] = -1,
["authorOptions"] = {
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
["useName"] = true,
["use_debuffClass"] = false,
["auraspellids"] = {
"64420",
},
["useExactSpellId"] = false,
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["names"] = {
},
["spellIds"] = {
},
["matchesShowOn"] = "showAlways",
["auranames"] = {
"415399",
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
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
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_legacy_floor"] = true,
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
["text_shadowColor"] = {
0,
0,
0,
1,
},
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "狙击",
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
["glowType"] = "Pixel",
["glowLength"] = 5,
["glowYOffset"] = 0,
["glowColor"] = {
1,
0,
0,
1,
},
["glowThickness"] = 2,
["glowScale"] = 1,
["glow"] = false,
["useGlowColor"] = true,
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
["text_text_format_p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = true,
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
},
["height"] = 30,
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
[104] = true,
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
["single"] = "HUNTER",
["multi"] = {
},
},
["spellknown"] = 415399,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["actions"] = {
["start"] = {
["sound_path"] = "",
["sound"] = " custom",
["do_sound"] = false,
},
["init"] = {
},
["finish"] = {
},
},
["cooldown"] = true,
["displayIcon"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["xOffset"] = 0,
["uid"] = "hZ(Sillucih",
["url"] = "https://space.bilibili.com/455259",
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
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
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["tocversion"] = 20501,
["id"] = "狙击训练（符文）",
["alpha"] = 1,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["config"] = {
},
["inverse"] = false,
["adjustedMax"] = "",
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
["property"] = "desaturate",
},
{
["value"] = true,
["property"] = "sub.4.glow",
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
["variable"] = "buffed",
["value"] = 0,
},
{
["trigger"] = -1,
["variable"] = "incombat",
["value"] = 0,
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
["property"] = "sub.3.text_visible",
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
["property"] = "desaturate",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["parent"] = "【露露】猎人（BUFF）",
},
["【露露】猎人一键喂养宠物按钮（60plus）"] = {
["iconSource"] = -1,
["wagoID"] = "34sqzRYkH",
["xOffset"] = 0,
["preferToUpdate"] = false,
["customText"] = "\n\n",
["yOffset"] = -1,
["anchorPoint"] = "BOTTOMLEFT",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/站立\\n/dismount\\n/click FOM_FeedButton\\n/click StaticPopup1Button1\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff露露的快捷按钮\\n左键：|r|cff00ff00\"..\"一键喂宠\"..\"|r\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env \nif  _G[e.id..\"Button\"] then \n    local btn = _G[e.id..\"Button\"] \n    btn:Hide()\nend \n\n",
["do_custom"] = true,
},
},
["triggers"] = {
{
["trigger"] = {
["itemName"] = 22521,
["use_alwaystrue"] = true,
["duration"] = "1",
["use_unit"] = true,
["use_includeCharges"] = true,
["use_HasPet"] = true,
["debuffType"] = "HELPFUL",
["type"] = "unit",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["names"] = {
},
["event"] = "Conditions",
["spellIds"] = {
},
["use_count"] = true,
["unevent"] = "auto",
["count"] = "1",
["unit"] = "player",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = false,
["selfPoint"] = "TOPLEFT",
["semver"] = "1.0.3",
["desaturate"] = false,
["progressSource"] = {
-1,
"",
},
["icon"] = true,
["version"] = 4,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "喂宝宝",
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
["text_text_format_p_time_mod_rate"] = true,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
0.6705882549285889,
0.8313726186752319,
0.4509804248809815,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_format"] = "timed",
["text_shadowYOffset"] = 0,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_text_format_p_time_legacy_floor"] = false,
["text_anchorYOffset"] = 0,
["anchor_point"] = "OUTER_RIGHT",
["text_fontSize"] = 17,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_format"] = 0,
},
},
["height"] = 25,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["load"] = {
["ingroup"] = {
["multi"] = {
["group"] = true,
["raid"] = true,
},
},
["use_never"] = false,
["use_ignoreNameRealm"] = false,
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["HUNTER"] = true,
["WARRIOR"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["ROGUE"] = true,
},
},
["size"] = {
["single"] = "fortyman",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["none"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["use_class"] = true,
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["talent"] = {
["multi"] = {
},
},
["use_alive"] = true,
["use_combat"] = false,
["spec"] = {
["multi"] = {
},
},
["zoneIds"] = "",
},
["conditions"] = {
},
["useAdjustededMax"] = false,
["adjustedMin"] = "",
["source"] = "import",
["color"] = {
1,
1,
1,
1,
},
["uid"] = ")iZRp73grLb",
["parent"] = "【露露】猎人宠物工具（一键喂养与快乐度）",
["anchorFrameType"] = "SCREEN",
["anchorFrameFrame"] = "oUF_Pet",
["regionType"] = "icon",
["frameStrata"] = 1,
["cooldownEdge"] = false,
["alpha"] = 1,
["authorOptions"] = {
},
["anchorFrameParent"] = true,
["zoom"] = 0.3,
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
["tocversion"] = 30402,
["id"] = "【露露】猎人一键喂养宠物按钮（60plus）",
["useTooltip"] = false,
["useCooldownModRate"] = true,
["width"] = 25,
["useAdjustededMin"] = false,
["config"] = {
},
["inverse"] = false,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["displayIcon"] = 132165,
["cooldown"] = false,
["adjustedMax"] = "",
},
["反击"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["realSpellName"] = "反击",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 19306,
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["unit"] = "player",
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
},
},
["zoneIds"] = "",
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
["spellknown"] = 19306,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
["cooldown"] = true,
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 0,
},
{
["trigger"] = 1,
["variable"] = "spellUsable",
["value"] = 1,
},
},
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
["variable"] = "spellUsable",
["value"] = 0,
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
["variable"] = "spellUsable",
["value"] = 1,
},
["changes"] = {
{
["property"] = "desaturate",
},
},
},
},
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "t27H632HDiv",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "反击",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["猎人 底部分组（可点击的守护条）"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"雄狮之心",
"雄鹰守护",
"蝰蛇守护",
"野性守护",
"灵猴守护",
"猎豹守护",
"豹群守护",
"野兽守护",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["stepAngle"] = 15,
["groupIcon"] = "interface/icons/classicon_hunter.blp",
["gridType"] = "RD",
["alpha"] = 1,
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
["internalVersion"] = 90,
["radius"] = 200,
["selfPoint"] = "CENTER",
["align"] = "CENTER",
["growOn"] = "",
["useLimit"] = false,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["rowSpace"] = 1,
["version"] = 3,
["grow"] = "HORIZONTAL",
["yOffset"] = -110,
["uid"] = "GFZTbWBcOqy",
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
["config"] = {
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["fullCircle"] = true,
["animate"] = false,
["customGrow"] = "",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["sort"] = "none",
["gridWidth"] = 5,
["source"] = "import",
["constantFactor"] = "RADIUS",
["anchorPoint"] = "CENTER",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "猎人 底部分组（可点击的守护条）",
["limit"] = 5,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["borderInset"] = 1,
["parent"] = "猎人（中心分组，by 露露緹婭@Bilibili）",
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
["【猎人】假死抵抗语音（seppala-faerlina）"] = {
["outline"] = "OUTLINE",
["wagoID"] = "-NL3YPtaa",
["parent"] = "猎人（60plus，by 露露緹婭@Bilibili） 1005更",
["displayText"] = "你假死抵抗啦！笨笨！",
["yOffset"] = 150,
["anchorPoint"] = "CENTER",
["customTextUpdate"] = "update",
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
["do_loop"] = false,
["message_type"] = "SMARTRAID",
["do_message"] = true,
["message"] = "我假死抵抗啦！",
["do_sound"] = true,
["do_custom"] = false,
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】你假死抵抗啦！笨笨！.ogg",
["sound"] = " custom",
["do_glow"] = false,
},
["init"] = {
["do_custom"] = false,
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["duration"] = "3",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "custom",
["subeventSuffix"] = "_CAST_START",
["custom_hide"] = "timed",
["unit"] = "player",
["event"] = "Health",
["events"] = "UI_ERROR_MESSAGE",
["customDuration"] = "",
["spellIds"] = {
},
["custom"] = "function(errorType, message)\n  local stringId = GetGameMessageInfo(message)\n  if stringId == \"ERR_FEIGN_DEATH_RESISTED\"  then\n    return true\n  end\nend\n\n\n",
["custom_type"] = "event",
["check"] = "update",
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["names"] = {
},
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = 1,
},
["internalVersion"] = 90,
["wordWrap"] = "WordWrap",
["desc"] = "原版by：seppala-faerlina，https://wago.io/-NL3YPtaa/\nFeign Death Resist",
["font"] = "Rurutia",
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
},
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["HUNTER"] = true,
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 5384,
["size"] = {
["multi"] = {
},
},
},
["fontSize"] = 38,
["source"] = "import",
["shadowXOffset"] = 1,
["regionType"] = "text",
["conditions"] = {
},
["automaticWidth"] = "Auto",
["preferToUpdate"] = false,
["anchorFrameParent"] = false,
["animation"] = {
["start"] = {
["colorR"] = 1,
["scalex"] = 1,
["alphaType"] = "straight",
["colorA"] = 1,
["colorG"] = 1,
["alphaFunc"] = "    function(progress, start, delta)\n      return start + (progress * delta)\n    end\n  ",
["use_translate"] = true,
["use_alpha"] = false,
["type"] = "none",
["easeType"] = "none",
["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      return startX + (progress * deltaX), startY + (progress * deltaY)\n    end\n  ",
["scaley"] = 1,
["alpha"] = 0,
["y"] = 0,
["x"] = 0,
["colorB"] = 1,
["preset"] = "slidetop",
["easeStrength"] = 3,
["rotate"] = 0,
["translateType"] = "straightTranslate",
["duration_type"] = "seconds",
},
["main"] = {
["colorR"] = 1,
["duration"] = "2",
["colorA"] = 1,
["colorG"] = 0.96078431372549,
["use_translate"] = false,
["colorB"] = 0.9921568627451,
["use_color"] = true,
["type"] = "preset",
["easeStrength"] = 3,
["easeType"] = "none",
["translateFunc"] = "    function(progress, startX, startY, deltaX, deltaY)\n      local angle = progress * 2 * math.pi\n      return startX + (deltaX * math.cos(angle)), startY + (deltaY * math.sin(angle))\n    end\n  ",
["scaley"] = 1,
["alpha"] = 0,
["x"] = 0,
["y"] = 5,
["colorType"] = "pulseColor",
["preset"] = "shake",
["translateType"] = "circle",
["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    local newProgress = ((math.sin(angle) + 1)/2);\n    return r1 + (newProgress * (r2 - r1)),\n         g1 + (newProgress * (g2 - g1)),\n         b1 + (newProgress * (b2 - b1)),\n         a1 + (newProgress * (a2 - a1))\nend\n",
["rotate"] = 0,
["scalex"] = 1,
["duration_type"] = "seconds",
},
["finish"] = {
["alphaType"] = "straight",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
["preset"] = "fade",
["duration_type"] = "seconds",
["duration"] = "1",
["use_alpha"] = false,
},
},
["shadowYOffset"] = -1,
["authorOptions"] = {
},
["justify"] = "LEFT",
["tocversion"] = 30400,
["id"] = "【猎人】假死抵抗语音（seppala-faerlina）",
["config"] = {
},
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["uid"] = "07jwrFTiQCr",
["semver"] = "1.0.0",
["color"] = {
0.66666666666667,
0.82745098039216,
0.44705882352941,
1,
},
["shadowColor"] = {
0,
0,
0,
1,
},
["fixedWidth"] = 200,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["selfPoint"] = "BOTTOM",
},
["【露露】猎人宠物工具（一键喂养与快乐度）"] = {
["controlledChildren"] = {
"【露露】猎人一键喂养宠物按钮（60plus）",
"宠物状态",
},
["borderBackdrop"] = "Blizzard Tooltip",
["authorOptions"] = {
},
["yOffset"] = -323.0473080105252,
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
["names"] = {
},
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
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
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。\n",
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
["frameStrata"] = 1,
["borderOffset"] = 4,
["parent"] = "猎人（中心分组，by 露露緹婭@Bilibili）",
["xOffset"] = -374.8569917201996,
["id"] = "【露露】猎人宠物工具（一键喂养与快乐度）",
["groupIcon"] = "interface/icons/classicon_hunter.blp",
["alpha"] = 1,
["anchorFrameType"] = "UIPARENT",
["uid"] = "BX6cw(pSYEV",
["config"] = {
},
["anchorFrameFrame"] = "ElvUF_Pet",
["borderInset"] = 1,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
},
["selfPoint"] = "CENTER",
},
["献祭陷阱"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["duration"] = "1",
["genericShowOn"] = "showAlways",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 13795,
["realSpellName"] = "献祭陷阱",
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
["version"] = 14,
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
[66] = false,
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 13795,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
["cooldown"] = true,
["conditions"] = {
{
["check"] = {
["value"] = 0,
["variable"] = "onCooldown",
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
["value"] = 1,
["variable"] = "onCooldown",
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
},
},
},
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "ILRmz8vD1fd",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "献祭陷阱",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["急速射击"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["auranames"] = {
"3045",
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
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
["names"] = {
},
["realSpellName"] = "急速射击",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 3045,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 3045,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "ga8gybetWTN",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "急速射击",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["疾速杀戮（猎人）"] = {
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
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["use_debuffClass"] = false,
["auranames"] = {
"415407",
},
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["useExactSpellId"] = false,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["auraspellids"] = {
},
["unit"] = "player",
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
["text_text_format_n_abbreviate_max"] = 2,
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
["text_text_format_p_time_precision"] = 1,
["text_justify"] = "CENTER",
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
["glowDuration"] = 1,
["glowThickness"] = 1,
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
["use_spellknown"] = true,
["use_itemequiped"] = false,
["faction"] = {
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 415405,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!IOS-完成.ogg",
["do_sound"] = false,
},
["finish"] = {
},
["init"] = {
},
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["conditions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["desaturate"] = false,
["parent"] = "【露露】猎人（BUFF）",
["config"] = {
},
["xOffset"] = 0,
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
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
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["tocversion"] = 30403,
["id"] = "疾速杀戮（猎人）",
["zoom"] = 0.3,
["alpha"] = 1,
["width"] = 30,
["authorOptions"] = {
},
["uid"] = "42pabbU2lmw",
["inverse"] = false,
["adjustedMax"] = "",
["displayIcon"] = "",
["cooldown"] = true,
["progressSource"] = {
-1,
"",
},
},
["瞄准射击（狙击训练）"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["use_remaining"] = false,
["unevent"] = "auto",
["spellName"] = 19434,
["duration"] = "1",
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "瞄准射击",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "spell",
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
["useName"] = false,
["debuffType"] = "HELPFUL",
["useExactSpellId"] = true,
["type"] = "aura2",
["ownOnly"] = true,
["auraspellids"] = {
"415399",
},
["unit"] = "player",
},
["untrigger"] = {
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
["version"] = 14,
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
["single"] = 27,
["multi"] = {
[27] = true,
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 19434,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
["trigger"] = 2,
["variable"] = "stacks",
["op"] = "==",
["value"] = "5",
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
},
},
},
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "ghQ)3i1qIkY",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "瞄准射击（狙击训练）",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["蝰蛇守护 开启提示"] = {
["iconSource"] = -1,
["parent"] = "【露露】猎人（BUFF）",
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["auranames"] = {
"415423",
},
["ownOnly"] = true,
["genericShowOn"] = "showOnCooldown",
["use_unit"] = true,
["use_HasPet"] = false,
["spellName"] = 0,
["useName"] = true,
["use_debuffClass"] = false,
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["realSpellName"] = 0,
["use_spellName"] = true,
["spellIds"] = {
},
["use_mounted"] = false,
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
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
["keepAspectRatio"] = false,
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
1,
1,
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
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "蝰蛇",
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
0.1843137294054031,
0.2352941334247589,
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
["glowType"] = "Pixel",
["glowLength"] = 8,
["glowYOffset"] = 1,
["glowColor"] = {
1,
0,
0,
1,
},
["glowThickness"] = 3,
["glow"] = true,
["glowScale"] = 1,
["useGlowColor"] = true,
["glowXOffset"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
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
["text_shadowXOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = false,
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
},
},
["height"] = 30,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 97,
["multi"] = {
[97] = true,
},
},
["use_vehicle"] = false,
["class"] = {
["single"] = "HUNTER",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_level"] = true,
["use_itemequiped"] = false,
["use_vehicleUi"] = false,
["use_alive"] = true,
["level"] = {
"10",
},
["level_operator"] = {
">=",
},
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
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
["selfPoint"] = "CENTER",
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["xOffset"] = 0,
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["tocversion"] = 20501,
["id"] = "蝰蛇守护 开启提示",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["cooldownEdge"] = false,
["uid"] = "CdmvAfgk9pv",
["inverse"] = false,
["adjustedMax"] = "",
["displayIcon"] = 134176,
["cooldown"] = false,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
},
["猎人 核心分组"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"猛禽一击",
"奇美拉射击（符文）",
"爆炸射击（符文）",
"削凿（符文）",
"杀戮命令（符文）",
"侧翼打击（符文）",
"集中火力（符文）",
"多重射击",
"钉刺合集",
"奥术射击",
"瞄准射击（狙击训练）",
"反击",
"狂野怒火",
"急速射击",
"准备就绪",
"胁迫",
"驱散射击",
"翼龙钉刺",
"威慑",
"逃脱",
"震荡射击",
"献祭陷阱",
"冰冻陷阱",
"畏缩",
"猎人印记",
"强击光环",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["parent"] = "猎人（中心分组，by 露露緹婭@Bilibili）",
["preferToUpdate"] = true,
["stepAngle"] = 15,
["groupIcon"] = "interface/icons/classicon_hunter.blp",
["anchorPoint"] = "CENTER",
["alpha"] = 1,
["useLimit"] = false,
["fullCircle"] = true,
["rowSpace"] = 1,
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
["gridType"] = "RD",
["selfPoint"] = "CENTER",
["align"] = "CENTER",
["growOn"] = "changed",
["space"] = 3,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["authorOptions"] = {
},
["version"] = 3,
["grow"] = "CUSTOM",
["yOffset"] = 0.5,
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
["animate"] = false,
["customGrow"] = "function(newPositions, activeRegions)\n    local limits = { --icons per row\n        7, --row 1\n        9, --row 2\n        \n    }\n    local rows = #limits -- total rows (matches limits size)\n    local iconSizes = { --have to match #limits size (if limits is {x,y} iconSizes have to be {a, b}, i.e. 2 and 2)\n        40, --row 1\n        35, --row 2\n        \n    }\n    local spacings = {\n        1, --row 1\n        30, --row 2\n        \n    }\n    \n    -- spacing between icons\n    local checkFit = true --resize only if total clones > totalWidth. Otherwise 1-2 icons will be giga huge\n    ----------------------\n    local check = true\n    \n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    local lastRowCount = 0\n    \n    local limit = limits[yCount+1]\n    local firstRowLimit = limits[yCount+1]\n    \n    local xSpacing = 3\n    local ySpacing = spacings[yCount+1]\n    local offset = spacings[yCount+1]\n    \n    local xOffset = 0\n    local yOffset = 0\n    \n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        \n        local region = regionData.region\n        if iconSizes[yCount+1] then\n            regionData.region:SetRegionWidth(iconSizes[yCount+1])\n            regionData.region:SetRegionHeight(iconSizes[yCount+1])\n        end\n        \n        local why = 0\n        for i=1, yCount+1 do\n            local wtf = (i==1 or i==yCount+1) and iconSizes[i]/2 or iconSizes[i]\n            why = why + wtf\n        end\n        local shift = yCount == 0 and 0 or why + offset\n        \n        local width = width or region.width\n        local totalWidth = totalWidth or (width + xSpacing) * limit\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= firstRowLimit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows - 1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        if yCount == rows - 1 then\n            local fit = checkFit and (width + xSpacing) * rowTotal < totalWidth\n            local lastRowWidth = fit and width or ((totalWidth - (rowTotal * xSpacing)) / rowTotal)\n            \n            xOffset = 0 - (lastRowWidth + xSpacing) / 2 * (rowTotal - 1) + (lastRowCount * (lastRowWidth + xSpacing))\n            yOffset = 0 - (shift - (width - lastRowWidth) / 2)-- change '-' to '+' after 0 to grow up instead of down\n            \n            lastRowCount = lastRowCount + 1\n            \n            regionData.region:SetRegionWidth(lastRowWidth)\n            regionData.region:SetRegionHeight(lastRowWidth)\n        else\n            xOffset = 0 - (width + xSpacing) / 2 * (rowTotal - 1) + (xCount * (width + xSpacing))\n            yOffset = 0 - shift\n        end\n        \n        xCount = xCount + 1\n        \n        if yCount < rows - 1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n                limit = limits[yCount+1]\n                ySpacing = spacings[yCount+1]\n                offset = offset + ySpacing\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend",
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
["sortHybridTable"] = {
["急速冷却（可点击施法）"] = false,
["寒冰屏障（可点击施法，左键冰箱，右键取消）"] = false,
["气定神闲（可点击施法）"] = false,
["活体烈焰（符文）"] = false,
["燃烧（可点击施法）"] = false,
["唤醒（可点击施法）"] = false,
["活动炸弹（符文）"] = false,
["寒冰护体（可点击施法）"] = false,
["冲击波"] = false,
["次级隐形术（可点击施法）"] = false,
["冰霜新星"] = false,
["防护火焰结界/防护冰霜结界（可点击施法，左右键）"] = false,
["奥术强化（可点击施法）"] = false,
["群体再生（符文）"] = false,
["法力护盾（可点击施法）"] = false,
["时光倒转（符文）"] = false,
["法术反制（可点击施法，左键反目标，右键反焦点）"] = false,
["闪现术"] = false,
["冰冷血脉（符文，可点击施法）"] = false,
["火焰冲击"] = false,
},
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "猎人 核心分组",
["sort"] = "none",
["gridWidth"] = 5,
["anchorFrameType"] = "SCREEN",
["borderColor"] = {
0,
0,
0,
1,
},
["uid"] = "40WrV37Y197",
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
["无宠物警告（猎人）"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["use_debuffClass"] = false,
["auranames"] = {
"喂养宠物效果",
},
["use_mounted"] = false,
["ownOnly"] = true,
["event"] = "Conditions",
["names"] = {
},
["useName"] = true,
["unit"] = "pet",
["spellIds"] = {
},
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["use_HasPet"] = false,
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
["text_text_format_p_time_precision"] = 1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_text_format_p_format"] = "timed",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "无宠",
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
["text_anchorXOffset"] = 1,
["text_color"] = {
1,
0.1843137294054031,
0.2352941334247589,
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
["glowXOffset"] = 1,
["glowType"] = "Pixel",
["glowLength"] = 8,
["glowYOffset"] = 1,
["glowColor"] = {
1,
0,
0,
1,
},
["glowThickness"] = 3,
["glowScale"] = 1,
["glow"] = true,
["useGlowColor"] = true,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
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
["text_shadowXOffset"] = 0,
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
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
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
["use_level"] = true,
["talent"] = {
["single"] = 97,
["multi"] = {
[97] = true,
},
},
["use_vehicle"] = false,
["spec"] = {
["multi"] = {
},
},
["use_never"] = false,
["use_class"] = true,
["level_operator"] = {
">=",
},
["use_itemequiped"] = false,
["use_vehicleUi"] = false,
["level"] = {
"10",
},
["use_alive"] = true,
["class"] = {
["single"] = "HUNTER",
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
["parent"] = "【露露】猎人（BUFF）",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["cooldown"] = false,
["displayIcon"] = 134176,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["cooldownEdge"] = false,
["uid"] = "xLMRj0AoWMC",
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["color"] = {
1,
1,
1,
1,
},
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["tocversion"] = 20501,
["id"] = "无宠物警告（猎人）",
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["width"] = 30,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
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
["selfPoint"] = "CENTER",
},
["野性守护"] = {
["iconSource"] = -1,
["parent"] = "猎人 底部分组（可点击的守护条）",
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
["use_debuffClass"] = false,
["auranames"] = {
"20190",
},
["useExactSpellId"] = false,
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["unit"] = "player",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["auraspellids"] = {
},
["ownOnly"] = true,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
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
1,
1,
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
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "",
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
["text_anchorYOffset"] = 22,
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
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_time_format"] = 0,
},
{
["type"] = "subborder",
["border_offset"] = 1,
["border_color"] = {
0.54509803921569,
0.84313725490196,
0.45490196078431,
1,
},
["border_visible"] = false,
["border_edge"] = "Square Full White",
["border_size"] = 1,
},
},
["height"] = 28,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 20043,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["alpha"] = 1,
["adjustedMax"] = "",
["internalVersion"] = 90,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "desaturate",
},
{
["value"] = 0.4,
["property"] = "alpha",
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
["property"] = "sub.4.border_visible",
},
},
},
},
["progressSource"] = {
-1,
"",
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["cooldownEdge"] = false,
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 28,
["anchorFrameParent"] = false,
["actions"] = {
["start"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 野性守护\\n/click StaticPopup1Button1\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff露露的快捷按钮\\n左键：|r|cff00ff00\"..\"野性守护\"..\"|r\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
["init"] = {
},
},
["authorOptions"] = {
},
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["tocversion"] = 20502,
["id"] = "野性守护",
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["selfPoint"] = "CENTER",
["uid"] = "GgMhaCuqu68",
["inverse"] = false,
["desaturate"] = false,
["displayIcon"] = 136074,
["cooldown"] = false,
["xOffset"] = 0,
},
["冰冻陷阱"] = {
["iconSource"] = 0,
["wagoID"] = "1NxtmsD1Z",
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
["duration"] = "1",
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "冰冻陷阱",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 1499,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 1499,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
},
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "qouL1RByb3(",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "冰冻陷阱",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
["config"] = {
},
["inverse"] = true,
["authorOptions"] = {
},
["displayIcon"] = 135834,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["xOffset"] = 0,
},
["威慑"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
"19263",
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
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
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "威慑",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 19263,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 19263,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
["parent"] = "猎人 核心分组",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "IqtpyWuUHYJ",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "威慑",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["5秒回蓝（猎人）"] = {
["sparkWidth"] = 15,
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
["yOffset"] = -3,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["backgroundColor"] = {
0,
0,
0,
0,
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
["single"] = "HUNTER",
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
["uid"] = "FQupK6zAd9M",
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "XoGkZt2VR",
["parent"] = "猎人 资源条",
["customText"] = "function()\n    if aura_env.config.showoptimalcaststart then\n        if aura_env.state and aura_env.state.duration then\n            local bar = aura_env.region.bar\n            local _, class = UnitClass(\"player\")\n            local spellduration = aura_env.config[class]\n            if not bar.mark then\n                local mark = bar:CreateTexture(nil, \"ARTWORK\");\n                mark:SetDrawLayer(\"ARTWORK\", 3);\n                bar.mark = mark\n                bar.mark:SetTexture([[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite]])\n                bar.mark:SetWidth(2);\n                bar.mark:SetHeight(bar:GetHeight() - 4);\n                bar.mark:SetBlendMode(\"BLEND\");\n                bar.mark:SetVertexColor(1, 1, 1, 0.5)\n            end\n            if spellduration < aura_env.state.duration then\n                bar.mark:ClearAllPoints()\n                bar.mark:SetPoint(\n                    \"RIGHT\",\n                    bar,\n                    \"RIGHT\",\n                    -((bar:GetWidth() / aura_env.state.duration) * spellduration),\n                    0\n                )\n                bar.mark:Show()\n            else\n                bar.mark:Hide()\n            end\n        end\n    elseif aura_env.region.bar.mark then\n        aura_env.region.bar.mark:Hide()\n    end\nend",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["duration"] = "2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["type"] = "custom",
["subeventSuffix"] = "_ENERGIZE",
["use_unit"] = true,
["names"] = {
},
["event"] = "Health",
["custom_type"] = "stateupdate",
["custom"] = "function(a, e, t)\n    local currMana = UnitPower(\"player\", 0)\n    local maxMana = UnitPowerMax(\"player\", 0)\n    if currMana < maxMana then\n        if (e == \"UNIT_POWER_FREQUENT\" and currMana > (aura_env.lastMana or 0))\n        then\n            local dur = 2\n            a[\"\"] = {\n                show = true,\n                changed = true,\n                duration = dur,\n                expirationTime = GetTime() + dur,\n                progressType = \"timed\",\n                autoHide = true\n            }\n            aura_env.lastMana = currMana\n        elseif e == \"UNIT_SPELLCAST_SUCCEEDED\" and currMana < (aura_env.lastMana or math.huge) then\n            local dur = 6.45\n            a[\"\"] = {\n                show = true,\n                changed = true,\n                duration = dur,\n                expirationTime = GetTime() + dur,\n                progressType = \"timed\",\n                autoHide = true\n            }\n            aura_env.lastMana = currMana\n        end\n    end\n    return true\nend",
["spellIds"] = {
},
["events"] = "UNIT_SPELLCAST_SUCCEEDED:player UNIT_POWER_FREQUENT:player",
["use_sourceUnit"] = true,
["check"] = "event",
["unevent"] = "auto",
["sourceUnit"] = "player",
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
["useAdjustededMax"] = false,
["source"] = "import",
["sparkTexture"] = "XPBarAnim-OrangeSpark",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["auto"] = true,
["borderInFront"] = true,
["adjustedMax"] = "",
["icon_side"] = "RIGHT",
["icon"] = false,
["xOffset"] = 0,
["sparkHeight"] = 30,
["desc"] = "from：https://wago.io/XoGkZt2VR/",
["sparkOffsetX"] = 0,
["anchorFrameType"] = "SCREEN",
["semver"] = "1.1.2",
["sparkHidden"] = "NEVER",
["id"] = "5秒回蓝（猎人）",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["frameStrata"] = 5,
["width"] = 297,
["sparkColor"] = {
1,
1,
1,
1,
},
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
["inverse"] = true,
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
["蝰蛇钉刺"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["duration"] = "1",
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "蝰蛇钉刺",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 3034,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 3034,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
},
["parent"] = "猎人 动态分组 左",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "elAnNhLxnti",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "蝰蛇钉刺",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["治疗宠物（猎人）"] = {
["iconSource"] = -1,
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://space.bilibili.com/455259",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["use_debuffClass"] = false,
["auranames"] = {
"3661",
},
["ownOnly"] = true,
["event"] = "Conditions",
["unit"] = "pet",
["subeventPrefix"] = "SPELL",
["useName"] = true,
["spellIds"] = {
},
["names"] = {
},
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
["use_HasPet"] = false,
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
["desaturate"] = false,
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
["anchorXOffset"] = 0,
["text_color"] = {
1,
0.9725490808486938,
0.05098039656877518,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_legacy_floor"] = true,
["text_shadowYOffset"] = 0,
["text_shadowXOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_text_format_p_format"] = "timed",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "治疗",
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
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
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
["use_class"] = true,
["use_itemequiped"] = false,
["talent"] = {
["single"] = 97,
["multi"] = {
[97] = true,
},
},
["use_never"] = false,
["class"] = {
["single"] = "HUNTER",
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
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
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
["cooldown"] = true,
["displayIcon"] = 132179,
["useAdjustededMin"] = false,
["regionType"] = "icon",
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
["uid"] = "R5eUfPJpuCg",
["cooldownEdge"] = false,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["color"] = {
1,
1,
1,
1,
},
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["tocversion"] = 20501,
["id"] = "治疗宠物（猎人）",
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["width"] = 30,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
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
["parent"] = "【露露】猎人（BUFF）",
},
["狂乱/集中火力（猎人，宠物）"] = {
["iconSource"] = -1,
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
["showClones"] = true,
["type"] = "aura2",
["use_debuffClass"] = false,
["auraspellids"] = {
},
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["useName"] = true,
["unit"] = "player",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["auranames"] = {
"431606",
"428726",
},
["useExactSpellId"] = false,
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
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "%n",
["text_text_format_p_time_format"] = 0,
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
["text_text_format_n_abbreviate_max"] = 2,
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_format"] = "timed",
["text_text_format_n_format"] = "string",
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
["text_anchorYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_shadowXOffset"] = 0,
["text_justify"] = "CENTER",
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
["glowThickness"] = 1,
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
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
["single"] = "HUNTER",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 415405,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["cooldownEdge"] = false,
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["displayIcon"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "【露露】猎人（BUFF）",
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
["uid"] = "4zNhnmySBec",
["authorOptions"] = {
},
["anchorFrameParent"] = false,
["alpha"] = 1,
["actions"] = {
["start"] = {
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!IOS-完成.ogg",
["do_sound"] = false,
},
["init"] = {
},
["finish"] = {
},
},
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["tocversion"] = 30403,
["id"] = "狂乱/集中火力（猎人，宠物）",
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["inverse"] = false,
["adjustedMax"] = "",
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "spellId",
["op"] = "==",
["value"] = "431606",
},
{
["trigger"] = 1,
["op"] = "<=",
["value"] = "4",
["variable"] = "stacks",
},
},
},
["changes"] = {
{
["property"] = "sub.5.glow",
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
["variable"] = "spellId",
["value"] = "431606",
["op"] = "==",
},
{
["trigger"] = 1,
["op"] = "==",
["variable"] = "stacks",
["value"] = "5",
},
},
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.5.glow",
},
{
["value"] = "Pixel",
["property"] = "sub.5.glowType",
},
{
["value"] = {
["sound_type"] = "Play",
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!MIUI-风铃.ogg",
["sound_channel"] = "Master",
},
["property"] = "sound",
},
},
},
{
["check"] = {
["op"] = "==",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "spellId",
["value"] = "431606",
["op"] = "==",
},
{
["trigger"] = 1,
["op"] = "<=",
["variable"] = "stacks",
["value"] = "4",
},
},
["trigger"] = 1,
["variable"] = "spellId",
["value"] = "428726",
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.5.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.5.glowType",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["desaturate"] = false,
},
["毒蛇钉刺、毒蝎钉刺（猎人）3秒补"] = {
["iconSource"] = -1,
["xOffset"] = 0,
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
["rem"] = "3",
["auranames"] = {
"3043",
"49001",
},
["matchesShowOn"] = "showOnActive",
["unit"] = "target",
["debuffType"] = "HARMFUL",
["useName"] = true,
["use_debuffClass"] = false,
["useExactSpellId"] = false,
["event"] = "Health",
["ownOnly"] = true,
["subeventPrefix"] = "SPELL",
["auraspellids"] = {
},
["spellIds"] = {
},
["type"] = "aura2",
["remOperator"] = "<=",
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["useRem"] = true,
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
["type"] = "preset",
["easeType"] = "none",
["duration_type"] = "seconds",
["preset"] = "bounce",
["easeStrength"] = 3,
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
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_legacy_floor"] = true,
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
["text_visible"] = false,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "钉刺",
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
["text_visible"] = true,
["text_text_format_p_format"] = "timed",
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 15,
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_time_format"] = 0,
},
{
["glowFrequency"] = 0.2,
["type"] = "subglow",
["useGlowColor"] = false,
["glowType"] = "ACShine",
["glowLength"] = 5,
["glowYOffset"] = 0,
["glowColor"] = {
0.7843137254902,
0.098039215686275,
0.13725490196078,
1,
},
["glowScale"] = 1.6,
["glowThickness"] = 1.8,
["glow"] = true,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 3,
["glowBorder"] = false,
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
["text_shadowXOffset"] = 0,
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
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
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
["level_operator"] = {
">=",
},
["use_never"] = false,
["spec"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["level"] = {
"60",
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["WARLOCK"] = true,
},
},
["use_combat"] = true,
["spellknown"] = 49001,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["parent"] = "【露露】猎人（BUFF）",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
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
["color"] = {
1,
1,
1,
1,
},
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["authorOptions"] = {
},
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["tocversion"] = 20501,
["id"] = "毒蛇钉刺、毒蝎钉刺（猎人）3秒补",
["zoom"] = 0.3,
["frameStrata"] = 1,
["width"] = 30,
["desaturate"] = false,
["uid"] = "6QMvd8ivJts",
["inverse"] = false,
["adjustedMax"] = "",
["displayIcon"] = 132315,
["cooldown"] = true,
["actions"] = {
["start"] = {
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】钉刺.ogg",
["sound"] = " custom",
["do_sound"] = true,
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
},
["宁神射击"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["duration"] = "1",
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "宁神射击",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 19801,
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
["version"] = 14,
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
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 19801,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["source"] = "import",
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
},
["parent"] = "猎人 动态分组 左",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "LWSQTHuP6ku",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "宁神射击",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
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
["xOffset"] = 0,
},
["爆炸射击（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["realSpellName"] = "爆炸射击",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 409552,
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
["disjunctive"] = "all",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
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
["version"] = 14,
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
["progressSource"] = {
-1,
"",
},
["load"] = {
["talent2"] = {
["multi"] = {
[66] = false,
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
[106] = false,
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
},
},
["zoneIds"] = "",
["use_petbattle"] = false,
["use_class"] = true,
["use_spellknown"] = true,
["class_and_spec"] = {
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
["use_exact_spellknown"] = false,
["spellknown"] = 409552,
["size"] = {
["multi"] = {
},
},
},
["internalVersion"] = 90,
["useAdjustededMax"] = false,
["parent"] = "猎人 核心分组",
["source"] = "import",
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
["xOffset"] = 0,
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "SAjo1abUynF",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "爆炸射击（符文）",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["url"] = "https://space.bilibili.com/455259",
["config"] = {
},
["inverse"] = true,
["selfPoint"] = "CENTER",
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
["雄鹰守护"] = {
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
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["use_debuffClass"] = false,
["useExactSpellId"] = false,
["auranames"] = {
"14321",
},
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["spellIds"] = {
},
["ownOnly"] = true,
["auraspellids"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
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
["anchorXOffset"] = 0,
["text_color"] = {
1,
1,
1,
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
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_text_format_p_format"] = "timed",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "",
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
["text_anchorYOffset"] = 22,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["type"] = "subborder",
["border_offset"] = 1,
["border_color"] = {
0.54509803921569,
0.84313725490196,
0.45490196078431,
1,
},
["border_visible"] = false,
["border_edge"] = "Square Full White",
["border_size"] = 1,
},
},
["height"] = 28,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 13165,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["alpha"] = 1,
["adjustedMax"] = "",
["internalVersion"] = 90,
["cooldown"] = false,
["displayIcon"] = 136074,
["progressSource"] = {
-1,
"",
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["cooldownEdge"] = false,
["uid"] = "J09my6vFuJ)",
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["parent"] = "猎人 底部分组（可点击的守护条）",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["tocversion"] = 20502,
["id"] = "雄鹰守护",
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["width"] = 28,
["actions"] = {
["start"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 雄鹰守护\\n/click StaticPopup1Button1\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff露露的快捷按钮\\n左键：|r|cff00ff00\"..\"雄鹰守护\"..\"|r\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["init"] = {
},
["finish"] = {
},
},
["config"] = {
},
["inverse"] = false,
["authorOptions"] = {
},
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "desaturate",
},
{
["value"] = 0.4,
["property"] = "alpha",
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
["property"] = "sub.4.border_visible",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["selfPoint"] = "CENTER",
},
["豹群守护"] = {
["iconSource"] = -1,
["parent"] = "猎人 底部分组（可点击的守护条）",
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
["use_debuffClass"] = false,
["auranames"] = {
"13159",
},
["useExactSpellId"] = false,
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["unit"] = "player",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["auraspellids"] = {
},
["ownOnly"] = true,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
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
1,
1,
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
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "",
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
["text_anchorYOffset"] = 22,
["text_shadowXOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = false,
["text_text_format_p_format"] = "timed",
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_time_format"] = 0,
},
{
["type"] = "subborder",
["border_offset"] = 1,
["border_color"] = {
0.54509803921569,
0.84313725490196,
0.45490196078431,
1,
},
["border_visible"] = false,
["border_edge"] = "Square Full White",
["border_size"] = 1,
},
},
["height"] = 28,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["PALADIN"] = true,
},
},
["spellknown"] = 13159,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["alpha"] = 1,
["adjustedMax"] = "",
["internalVersion"] = 90,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "desaturate",
},
{
["value"] = 0.4,
["property"] = "alpha",
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
["property"] = "sub.4.border_visible",
},
},
},
},
["progressSource"] = {
-1,
"",
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["cooldownEdge"] = false,
["config"] = {
},
["xOffset"] = 0,
["width"] = 28,
["anchorFrameParent"] = false,
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
["color"] = {
1,
1,
1,
1,
},
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["tocversion"] = 20502,
["id"] = "豹群守护",
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["authorOptions"] = {
},
["uid"] = "GTtUnVFjeSm",
["inverse"] = false,
["actions"] = {
["start"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 豹群守护\\n/click StaticPopup1Button1\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff露露的快捷按钮\\n左键：|r|cff00ff00\"..\"豹群守护\"..\"|r\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
["init"] = {
},
},
["displayIcon"] = 132267,
["cooldown"] = false,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
},
["蝰蛇守护"] = {
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
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 蝰蛇守护\\n/click StaticPopup1Button1\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff露露的快捷按钮\\n左键：|r|cff00ff00\"..\"蝰蛇守护\"..\"|r\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["use_debuffClass"] = false,
["auranames"] = {
"415423",
},
["useExactSpellId"] = false,
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["unit"] = "player",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["auraspellids"] = {
},
["ownOnly"] = true,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
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
1,
1,
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
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "",
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
["text_anchorYOffset"] = 22,
["text_text_format_p_time_precision"] = 1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = false,
["text_text_format_p_format"] = "timed",
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_time_format"] = 0,
},
{
["border_offset"] = 1,
["border_size"] = 1,
["border_color"] = {
0.54509803921569,
0.84313725490196,
0.45490196078431,
1,
},
["border_visible"] = false,
["border_edge"] = "Square Full White",
["type"] = "subborder",
},
},
["height"] = 28,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
["PALADIN"] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 415423,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["frameStrata"] = 1,
["adjustedMax"] = "",
["parent"] = "猎人 底部分组（可点击的守护条）",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
["changes"] = {
{
["value"] = false,
["property"] = "desaturate",
},
{
["value"] = 0.4,
["property"] = "alpha",
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
["property"] = "sub.4.border_visible",
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
["config"] = {
},
["xOffset"] = 0,
["width"] = 28,
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["internalVersion"] = 90,
["tocversion"] = 20502,
["id"] = "蝰蛇守护",
["useCooldownModRate"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["selfPoint"] = "CENTER",
["uid"] = "Hnxqh1lJgyg",
["inverse"] = false,
["desaturate"] = false,
["displayIcon"] = 136074,
["cooldown"] = false,
["icon"] = true,
},
["强击光环"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["type"] = "aura2",
["auraspellids"] = {
"146739",
},
["useName"] = true,
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["unit"] = "player",
["unitExists"] = true,
["names"] = {
},
["spellIds"] = {
},
["useExactSpellId"] = false,
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["auranames"] = {
"19506",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["showClones"] = false,
["type"] = "aura2",
["auraspellids"] = {
"146739",
},
["useName"] = true,
["matchesShowOn"] = "showOnMissing",
["event"] = "Health",
["unit"] = "player",
["unitExists"] = true,
["names"] = {
},
["spellIds"] = {
},
["useExactSpellId"] = false,
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["auranames"] = {
"19506",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_resting"] = true,
["use_incombat"] = false,
["debuffType"] = "HELPFUL",
["type"] = "unit",
["unit"] = "player",
["event"] = "Conditions",
["use_unit"] = true,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "custom",
["custom"] = "function()\n    if LWA and LWA.Init then\n        LWA.Init()\n    end\nend",
["custom_type"] = "event",
["debuffType"] = "HELPFUL",
["events"] = "OPTIONS",
["unit"] = "player",
["custom_hide"] = "custom",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    if t[3] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.trueshot_aura.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2]\n    else -- Always Show\n        return true\n    end\nend",
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
["version"] = 14,
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
["use_never"] = false,
["talent"] = {
["single"] = 17,
["multi"] = {
[17] = true,
[35] = true,
},
},
["class"] = {
["single"] = "HUNTER",
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
["spellknown"] = 19506,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 32,
["source"] = "import",
["icon"] = true,
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "猎人 核心分组",
["selfPoint"] = "CENTER",
["config"] = {
["maintenance"] = {
["trueshot_aura"] = {
["behavior"] = 2,
},
},
},
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
["text"] = "Trueshot Aura",
["type"] = "description",
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
["name"] = "Behavior",
["useDesc"] = false,
["key"] = "behavior",
["width"] = 1,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["name"] = "Trueshot Aura",
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["collapse"] = false,
["type"] = "group",
["limitType"] = "none",
["groupType"] = "simple",
["key"] = "trueshot_aura",
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
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.11",
["tocversion"] = 30403,
["id"] = "强击光环",
["auto"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["zoom"] = 0.3,
["uid"] = "hx5DUsaR113",
["inverse"] = false,
["xOffset"] = 0,
["conditions"] = {
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
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["cooldownEdge"] = false,
},
["杀戮命令（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "1NxtmsD1Z",
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
["spellName"] = 409379,
["realSpellName"] = "杀戮命令",
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
["version"] = 14,
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
["progressSource"] = {
-1,
"",
},
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
[106] = false,
},
},
["class"] = {
["single"] = "HUNTER",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["talent2"] = {
["multi"] = {
[66] = false,
},
},
["use_class"] = true,
["use_spellknown"] = true,
["class_and_spec"] = {
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
["use_exact_spellknown"] = false,
["spellknown"] = 409379,
["zoneIds"] = "",
},
["xOffset"] = 0,
["useAdjustededMax"] = false,
["color"] = {
1,
1,
1,
1,
},
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["url"] = "https://space.bilibili.com/455259",
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["adjustedMax"] = "",
["width"] = 32,
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["semver"] = "2.0.11",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "杀戮命令（符文）",
["frameStrata"] = 1,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["uid"] = "k9DST9xk8LF",
["inverse"] = true,
["selfPoint"] = "CENTER",
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
["parent"] = "猎人 核心分组",
},
},
}
