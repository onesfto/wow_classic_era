
WeakAurasSaved = {
["editor_tab_spaces"] = 4,
["login_squelch_time"] = 10,
["PULL(Need DBM BW ERT)PULL"] = 5,
["dbVersion"] = 90,
["标记目标 Mark TargetSet"] = false,
["displays"] = {
["军刀猛刺（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
["authorOptions"] = {
},
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
},
},
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["useName"] = true,
["auranames"] = {
"424785",
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "target",
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["names"] = {
},
["unitExists"] = false,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["auraspellids"] = {
"146739",
},
["ownOnly"] = true,
["type"] = "aura2",
["useExactSpellId"] = false,
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
["version"] = 12,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowXOffset"] = 0,
["glowType"] = "Pixel",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glow"] = true,
["glowThickness"] = 1,
["glowScale"] = 1,
["useGlowColor"] = false,
["glowDuration"] = 1,
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
["text_text_format_p_format"] = "timed",
["type"] = "subtext",
["anchorXOffset"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = true,
["anchor_point"] = "TOP",
["text_fontSize"] = 20,
["text_text_format_p_time_dynamic_threshold"] = 60,
["anchorYOffset"] = 0,
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
[4] = true,
},
},
["class"] = {
["single"] = "ROGUE",
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
["spellknown"] = 424785,
["size"] = {
["multi"] = {
},
},
},
["desc"] = "",
["useAdjustededMax"] = false,
["color"] = {
1,
1,
1,
1,
},
["source"] = "import",
["cooldown"] = true,
["conditions"] = {
},
["parent"] = "盗贼 动态分组 右",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "o7gRX9wEYk6",
["adjustedMax"] = "",
["width"] = 32,
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "军刀猛刺（符文）",
["alpha"] = 1,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["url"] = "https://space.bilibili.com/455259",
["config"] = {
},
["inverse"] = false,
["selfPoint"] = "CENTER",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["xOffset"] = 0,
},
["佯攻"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["unit"] = "player",
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 1966,
["realSpellName"] = "佯攻",
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
["single"] = "ROGUE",
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
["spellknown"] = 1966,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "佯攻",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "LcfjUSy8NXU",
["inverse"] = true,
["icon"] = true,
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
["cooldownEdge"] = false,
},
["闪避"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["match_countOperator"] = ">",
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["unit"] = "player",
["spellIds"] = {
},
["useMatch_count"] = true,
["match_count"] = "0",
["auranames"] = {
"5277",
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
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 5277,
["realSpellName"] = "闪避",
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
["single"] = "ROGUE",
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
["spellknown"] = 5277,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "闪避",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = ")QfT4aqWnHS",
["inverse"] = true,
["icon"] = true,
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
["冲动"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
"13750",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["useName"] = true,
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
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 13750,
["realSpellName"] = "冲动",
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
["single"] = "ROGUE",
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
["spellknown"] = 13750,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "冲动",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "g2NhXZ6vF8X",
["inverse"] = true,
["icon"] = true,
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
["盗贼 动态分组 左"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"毒药提醒 - 主手",
"毒药提醒 - 副手",
"毒药提醒 - 主手（致命阴谋）",
"毒药提醒 - 副手（致命阴谋）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["xOffset"] = -149,
["preferToUpdate"] = true,
["groupIcon"] = "interface/icons/classicon_rogue.blp",
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
["useLimit"] = true,
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
["borderColor"] = {
0,
0,
0,
1,
},
["anchorPoint"] = "CENTER",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["parent"] = "盗贼（中心分组，by 露露緹婭@Bilibili）",
["version"] = 3,
["yOffset"] = 24,
["grow"] = "GRID",
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
["space"] = 3,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["radius"] = 200,
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
["uid"] = "((XhhD4Hr82",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "盗贼 动态分组 左",
["sort"] = "none",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["rotation"] = 0,
["config"] = {
},
["sortHybridTable"] = {
["毒药提醒 - 副手（致命阴谋）"] = false,
["毒药提醒 - 副手"] = false,
["毒药提醒 - 主手（致命阴谋）"] = false,
["毒药提醒 - 主手"] = false,
},
["authorOptions"] = {
},
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["selfPoint"] = "BOTTOMLEFT",
},
["转嫁（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "51yjJjm7_",
["parent"] = "盗贼 核心分组",
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
["auranames"] = {
"438040",
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
["unit"] = "player",
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "转嫁",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 438040,
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
["selfPoint"] = "CENTER",
["desaturate"] = false,
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
["glow"] = false,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
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
["text_text_format_p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_text_format_p_time_dynamic_threshold"] = 3,
["text_color"] = {
1,
1,
0,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_format"] = "timed",
["text_shadowYOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
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
["single"] = 66,
["multi"] = {
[66] = true,
},
},
["class"] = {
["single"] = "ROGUE",
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
["use_level"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 438040,
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
["do_custom"] = false,
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
["xOffset"] = 0,
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
["tocversion"] = 11500,
["id"] = "转嫁（符文）",
["cooldownTextDisabled"] = true,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "Dt)RH4CgKbo",
["inverse"] = true,
["authorOptions"] = {
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
["凿击"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
"1776",
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "target",
["spellIds"] = {
},
["names"] = {
},
["useName"] = true,
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
["duration"] = "1",
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 1776,
["realSpellName"] = "凿击",
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
["single"] = "ROGUE",
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
["spellknown"] = 1776,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "凿击",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "seC7yheCnR2",
["inverse"] = true,
["icon"] = true,
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
["cooldownEdge"] = false,
},
["冷血"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
"14177",
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["useName"] = true,
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
["spellName"] = 14177,
["realSpellName"] = "冷血",
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
["single"] = "ROGUE",
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
["spellknown"] = 14177,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "冷血",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "(fCkjKRYtNH",
["inverse"] = true,
["icon"] = true,
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
["预谋（敏锐）"] = {
["iconSource"] = 2,
["wagoID"] = "foIUC5_yM",
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
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["subeventSuffix"] = "_CAST_SUCCESS",
["useName"] = false,
["spellId"] = {
"14183",
},
["auranames"] = {
},
["names"] = {
},
["ownOnly"] = true,
["event"] = "Combat Log",
["subeventPrefix"] = "SPELL",
["duration"] = "20",
["use_spellId"] = true,
["spellIds"] = {
},
["use_sourceUnit"] = true,
["unit"] = "player",
["type"] = "combatlog",
["sourceUnit"] = "player",
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
["spellName"] = 14183,
["realSpellName"] = "预谋",
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
["single"] = "ROGUE",
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
["spellknown"] = 14183,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "预谋（敏锐）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "RuNDEQDdVvs",
["inverse"] = true,
["icon"] = true,
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
["CP2（盗贼）"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["authorOptions"] = {
},
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
["single"] = "ROGUE",
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
["auto"] = true,
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
["wagoID"] = "foIUC5_yM",
["parent"] = "盗贼 连击点",
["adjustedMin"] = "1",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["use_power"] = false,
["unevent"] = "auto",
["unit"] = "player",
["use_absorbMode"] = true,
["event"] = "Power",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["powertype"] = 4,
["spellIds"] = {
},
["names"] = {
},
["duration"] = "1",
["subeventSuffix"] = "_CAST_START",
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
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
["version"] = 24,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
},
["height"] = 15,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = true,
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["icon_side"] = "RIGHT",
["xOffset"] = 0,
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
["sparkHeight"] = 30,
["internalVersion"] = 90,
["config"] = {
},
["anchorFrameParent"] = false,
["semver"] = "2.0.22",
["sparkHidden"] = "NEVER",
["id"] = "CP2（盗贼）",
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["width"] = 58,
["zoom"] = 0,
["backgroundColor"] = {
0,
0,
0,
0.3400000333786011,
},
["inverse"] = false,
["spark"] = false,
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "4",
},
["linked"] = false,
["changes"] = {
{
["value"] = {
0.250980406999588,
0.6901960968971252,
0.1882353127002716,
1,
},
["property"] = "barColor",
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
1,
1,
1,
1,
},
["property"] = "barColor",
},
},
},
},
["barColor2"] = {
1,
1,
0,
1,
},
["uid"] = "UdxCo4N6tMe",
},
["扰乱"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["unit"] = "player",
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 1725,
["realSpellName"] = "扰乱",
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
["single"] = "ROGUE",
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
["spellknown"] = 1725,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "扰乱",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "0UVyfJ(kvN9",
["inverse"] = true,
["icon"] = true,
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
["cooldownEdge"] = false,
},
["疾跑"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["match_countOperator"] = ">",
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["unit"] = "player",
["spellIds"] = {
},
["useMatch_count"] = true,
["match_count"] = "0",
["auranames"] = {
"2983",
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
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 2983,
["realSpellName"] = "疾跑",
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
["single"] = "ROGUE",
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
["spellknown"] = 2983,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "疾跑",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "oLckeGnuPG4",
["inverse"] = true,
["icon"] = true,
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
["埋伏（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["useName"] = true,
["auranames"] = {
"408700",
},
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["names"] = {
},
["unitExists"] = false,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["type"] = "aura2",
["ownOnly"] = true,
["unit"] = "target",
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
["glowXOffset"] = 0,
["glowType"] = "Pixel",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glow"] = true,
["glowThickness"] = 1,
["glowScale"] = 1,
["useGlowColor"] = false,
["glowDuration"] = 1,
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
["text_text_format_p_format"] = "timed",
["type"] = "subtext",
["anchorXOffset"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = true,
["anchor_point"] = "TOP",
["text_fontSize"] = 20,
["text_text_format_p_time_dynamic_threshold"] = 60,
["anchorYOffset"] = 0,
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
["class"] = {
["single"] = "ROGUE",
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
["spellknown"] = 408700,
["zoneIds"] = "",
},
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
["useAdjustededMax"] = false,
["parent"] = "盗贼 动态分组 右",
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["conditions"] = {
},
["url"] = "https://space.bilibili.com/455259",
["desc"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "fjLijedkX5e",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "埋伏（符文）",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 32,
["selfPoint"] = "CENTER",
["config"] = {
},
["inverse"] = false,
["authorOptions"] = {
},
["displayIcon"] = "",
["cooldown"] = true,
["color"] = {
1,
1,
1,
1,
},
},
["冷酷攻击"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["type"] = "aura2",
["auraspellids"] = {
"146739",
},
["useName"] = true,
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["unit"] = "player",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["useExactSpellId"] = false,
["auranames"] = {
"14143",
"14149",
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
["single"] = "ROGUE",
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
["spellknown"] = 14144,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["parent"] = "盗贼 动态分组 右",
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
["desc"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["xOffset"] = 0,
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
["cooldownEdge"] = true,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "冷酷攻击",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "NJwvJYt)uFb",
["inverse"] = false,
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
["cooldown"] = true,
["selfPoint"] = "CENTER",
},
["毒伤（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
["parent"] = "盗贼 动态分组 右",
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
["showClones"] = false,
["useName"] = true,
["auranames"] = {
"399963",
},
["useExactSpellId"] = false,
["names"] = {
},
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["unit"] = "player",
["unitExists"] = false,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["auraspellids"] = {
"146739",
},
["ownOnly"] = true,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
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
["version"] = 12,
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
1,
1,
1,
},
["glow"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["useGlowColor"] = false,
["glowXOffset"] = 0,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
[16] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "ROGUE",
["multi"] = {
},
},
["spellknown"] = 399963,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
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
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "毒伤（符文）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["width"] = 32,
["useCooldownModRate"] = true,
["uid"] = "UdPRMR7y8DC",
["inverse"] = false,
["xOffset"] = 0,
["conditions"] = {
},
["cooldown"] = true,
["cooldownEdge"] = true,
},
["盗贼 连击点"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"CP1（盗贼）",
"CP2（盗贼）",
"CP3（盗贼）",
"CP4（盗贼）",
"CP5（盗贼）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 0,
["preferToUpdate"] = false,
["yOffset"] = -4,
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
["names"] = {
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["radius"] = 200,
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
["align"] = "CENTER",
["gridWidth"] = 5,
["stepAngle"] = 15,
["internalVersion"] = 90,
["rotation"] = 0,
["authorOptions"] = {
},
["selfPoint"] = "CENTER",
["subRegions"] = {
},
["sortHybridTable"] = {
["CP5（盗贼）"] = false,
["CP4（盗贼）"] = false,
["CP1（盗贼）"] = false,
["CP2（盗贼）"] = false,
["CP3（盗贼）"] = false,
},
["grow"] = "HORIZONTAL",
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
["parent"] = "盗贼 资源条",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["uid"] = "q5Q1GBNCGXD",
["animate"] = false,
["source"] = "import",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 5,
["borderInset"] = 1,
["alpha"] = 1,
["constantFactor"] = "RADIUS",
["sort"] = "none",
["borderOffset"] = 4,
["fullCircle"] = true,
["tocversion"] = 11500,
["id"] = "盗贼 连击点",
["groupIcon"] = "interface/icons/classicon_rogue.blp",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["gridType"] = "RD",
["config"] = {
},
["rowSpace"] = 1,
["stagger"] = 0,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
},
["useLimit"] = false,
},
["破甲"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
["parent"] = "盗贼 核心分组",
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
["showClones"] = false,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["useExactSpellId"] = false,
["unit"] = "target",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["matchesShowOn"] = "showAlways",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["auraspellids"] = {
"146739",
},
["useName"] = true,
["auranames"] = {
"8647",
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
["selfPoint"] = "CENTER",
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
["single"] = "ROGUE",
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
["spellknown"] = 8647,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["icon"] = true,
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
["cooldownEdge"] = false,
["uid"] = "P4RB0sbSLj5",
["color"] = {
1,
1,
1,
1,
},
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "破甲",
["auto"] = true,
["useCooldownModRate"] = true,
["width"] = 32,
["cooldownTextDisabled"] = false,
["config"] = {
},
["inverse"] = false,
["authorOptions"] = {
},
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
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
["xOffset"] = 0,
},
["CP3（盗贼）"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["authorOptions"] = {
},
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
["single"] = "ROGUE",
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
["auto"] = true,
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
["wagoID"] = "foIUC5_yM",
["parent"] = "盗贼 连击点",
["adjustedMin"] = "2",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["use_power"] = false,
["unevent"] = "auto",
["unit"] = "player",
["use_absorbMode"] = true,
["event"] = "Power",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["powertype"] = 4,
["spellIds"] = {
},
["names"] = {
},
["duration"] = "1",
["subeventSuffix"] = "_CAST_START",
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
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
["version"] = 24,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
},
["height"] = 15,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = true,
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["icon_side"] = "RIGHT",
["xOffset"] = 0,
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
["sparkHeight"] = 30,
["internalVersion"] = 90,
["config"] = {
},
["anchorFrameParent"] = false,
["semver"] = "2.0.22",
["sparkHidden"] = "NEVER",
["id"] = "CP3（盗贼）",
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["width"] = 58,
["zoom"] = 0,
["backgroundColor"] = {
0,
0,
0,
0.3400000333786011,
},
["inverse"] = false,
["spark"] = false,
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "4",
},
["linked"] = false,
["changes"] = {
{
["value"] = {
0.250980406999588,
0.6901960968971252,
0.1882353127002716,
1,
},
["property"] = "barColor",
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
1,
1,
1,
1,
},
["property"] = "barColor",
},
},
},
},
["barColor2"] = {
1,
1,
0,
1,
},
["uid"] = "J5fx7RpCcYG",
},
["正中眉心（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["auranames"] = {
"400009",
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "target",
["spellIds"] = {
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["useName"] = true,
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
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "正中眉心",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 400009,
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["type"] = "unit",
["power"] = {
"0",
},
["power_operator"] = {
">",
},
["use_power"] = true,
["event"] = "Power",
["unit"] = "player",
["powertype"] = 4,
["use_unit"] = true,
["use_powertype"] = true,
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
["version"] = 12,
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
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "ROGUE",
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
["spellknown"] = 400009,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
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
["trigger"] = 3,
["variable"] = "show",
["value"] = 0,
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
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "h6hcTRvoRmG",
["cooldownEdge"] = false,
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["parent"] = "盗贼 核心分组",
["semver"] = "2.0.10",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "正中眉心（符文）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["width"] = 32,
["frameStrata"] = 1,
["config"] = {
},
["inverse"] = true,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
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
},
["肾击"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
"408",
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "target",
["spellIds"] = {
},
["names"] = {
},
["useName"] = true,
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
["duration"] = "1",
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 408,
["realSpellName"] = "肾击",
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
["single"] = "ROGUE",
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
["spellknown"] = 408,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "肾击",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "Q9IWhK232ZJ",
["inverse"] = true,
["icon"] = true,
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
["cooldownEdge"] = false,
},
["消失"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["unit"] = "player",
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 1856,
["realSpellName"] = "消失",
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
[27] = true,
},
},
["class"] = {
["single"] = "ROGUE",
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
["spellknown"] = 1856,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "消失",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "cxNXxCCnmJw",
["inverse"] = true,
["icon"] = true,
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
["cooldownEdge"] = false,
},
["剧毒之刃（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "51yjJjm7_",
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
},
["init"] = {
["do_custom"] = false,
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
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "剧毒之刃",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 425012,
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
["selfPoint"] = "CENTER",
["desaturate"] = false,
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
["glow"] = false,
["glowThickness"] = 1,
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
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
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_format"] = "timed",
["type"] = "subtext",
["anchorXOffset"] = 0,
["text_color"] = {
1,
1,
0,
1,
},
["text_font"] = "Rurutia",
["text_shadowXOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = true,
["anchor_point"] = "CENTER",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 3,
["anchorYOffset"] = 0,
},
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["single"] = 66,
["multi"] = {
[66] = true,
},
},
["class"] = {
["single"] = "ROGUE",
["multi"] = {
},
},
["zoneIds"] = "",
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
["use_level"] = false,
["spellknown"] = 425012,
["size"] = {
["multi"] = {
},
},
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
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "awjPP3PYgeY",
["cooldownEdge"] = false,
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["parent"] = "盗贼 核心分组",
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.6",
["tocversion"] = 11500,
["id"] = "剧毒之刃（符文）",
["cooldownTextDisabled"] = true,
["useCooldownModRate"] = true,
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
["icon"] = true,
},
["还击"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["names"] = {
},
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "还击",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 14251,
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["use_track"] = true,
["use_genericShowOn"] = true,
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
["single"] = "ROGUE",
["multi"] = {
},
},
["size"] = {
["multi"] = {
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
["spellknown"] = 14251,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "还击",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "6D6mcgmJusU",
["inverse"] = true,
["icon"] = true,
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
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "spellUsable",
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
["property"] = "desaturate",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["鬼魅攻击"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
"14278",
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["useName"] = true,
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
["spellName"] = 14278,
["realSpellName"] = "鬼魅攻击",
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
["single"] = "ROGUE",
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
["spellknown"] = 14278,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "鬼魅攻击",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "Ux96ACN3FJO",
["inverse"] = true,
["icon"] = true,
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
["cooldown"] = true,
["cooldownEdge"] = false,
},
["盗贼 能量条"] = {
["sparkWidth"] = 5,
["iconSource"] = -1,
["xOffset"] = 0,
["preferToUpdate"] = false,
["yOffset"] = -24,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "https://space.bilibili.com/455259",
["backgroundColor"] = {
0,
0,
0,
0.300000011920929,
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
1,
0.7490196228027344,
0.1607843190431595,
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
["role"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["pvptalent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "ROGUE",
["multi"] = {
["ROGUE"] = true,
["MONK"] = true,
["SHAMAN"] = true,
},
},
["race"] = {
["multi"] = {
},
},
["faction"] = {
["multi"] = {
},
},
["use_vehicleUi"] = false,
},
["toolTipArea"] = "ICON",
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["texture"] = "Solid",
["zoom"] = 0,
["auto"] = true,
["tocversion"] = 11500,
["alpha"] = 1,
["sparkColor"] = {
1,
0.94901960784314,
0,
1,
},
["sparkOffsetX"] = 0,
["wagoID"] = "tRi9estlC",
["parent"] = "盗贼 资源条",
["customText"] = "function()\n    local mana = UnitPower(\"player\",0)\n    local manaMax = UnitPowerMax(\"player\",0)\n    local manaPerc = (mana / manaMax) * 100\n    return string.format(\"%.0f\",manaPerc)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
["sparkRotationMode"] = "MANUAL",
["triggers"] = {
{
["trigger"] = {
["ownOnly"] = true,
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "SPELL",
["powertype"] = 3,
["use_powertype"] = true,
["spellName"] = 200183,
["unit"] = "player",
["type"] = "unit",
["names"] = {
"Прославление",
},
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["use_genericShowOn"] = true,
["event"] = "Power",
["custom_hide"] = "timed",
["realSpellName"] = "Прославление",
["use_spellName"] = true,
["spellIds"] = {
200183,
},
["use_unit"] = true,
["unevent"] = "auto",
["duration"] = "1",
["use_showCost"] = true,
["debuffType"] = "HELPFUL",
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
["colorR"] = 1,
["duration"] = "",
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
["colorB"] = 1,
["y"] = 0,
["x"] = 0,
["preset"] = "fade",
["easeStrength"] = 3,
["translateType"] = "straightTranslate",
["rotate"] = 0,
["duration_type"] = "seconds",
["scalex"] = 1,
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
["text_text_format_1.percentpower_decimal_precision"] = 0,
["text_text"] = "%1.power",
["text_text_format_1.power_decimal_precision"] = 0,
["text_shadowXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_c_format"] = "none",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_fontSize"] = 18,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_1.power_round_type"] = "floor",
["type"] = "subtext",
["text_visible"] = true,
["text_text_format_1.power_pad"] = false,
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_text_format_1.power_pad_max"] = 8,
["text_text_format_1.percentpower_round_type"] = "floor",
["text_anchorYOffset"] = -0.5,
["text_text_format_1.percentpower_format"] = "Number",
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_shadowYOffset"] = 0,
["text_font"] = "Rurutia",
["anchor_point"] = "INNER_CENTER",
["text_text_format_1.power_pad_mode"] = "left",
["anchorXOffset"] = 0,
["text_text_format_1.power_format"] = "Number",
},
},
["height"] = 17,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["backdropColor"] = {
1,
1,
1,
0,
},
["source"] = "import",
["spark"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["uid"] = "Y4hz)9LloHh",
["adjustedMax"] = "",
["config"] = {
},
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["borderInFront"] = false,
["actions"] = {
["start"] = {
},
["init"] = {
["custom"] = "local c1, c2 = CreateColor(1,0.76,0.53,1), CreateColor(1,0.96,0.88,1)\n---------------------------------------\n\nif not aura_env.region.bar.gradient then\n    aura_env.region.bar.gradient = aura_env.region.bar:CreateTexture()\n    aura_env.region.bar.mask = aura_env.region.bar:CreateMaskTexture()\nend\n\nlocal bar = aura_env.region.bar\nlocal gradient = bar.gradient\nlocal mask = bar.mask\n\ngradient:SetTexture(bar:GetTexture())\ngradient:SetAllPoints(bar.bg)\ngradient:SetGradient(\"HORIZONTAL\",c1,c2)\n\nmask:SetTexture([[Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite]], \"CLAMPTOBLACKADDITIVE\", \"CLAMPTOBLACKADDITIVE\", \"NEAREST\")\nmask:SetAllPoints(bar.fg)\n\nbar.fg:SetAlpha(0)\ngradient:AddMaskTexture(mask)",
["do_custom"] = false,
},
["finish"] = {
},
},
["icon_side"] = "RIGHT",
["authorOptions"] = {
},
["width"] = 297,
["sparkHeight"] = 20,
["icon"] = false,
["overlaysTexture"] = {
"Solid",
},
["customTextUpdate"] = "event",
["semver"] = "1.1.0",
["id"] = "盗贼 能量条",
["sparkHidden"] = "BOTH",
["useAdjustededMax"] = false,
["frameStrata"] = 2,
["anchorFrameType"] = "SCREEN",
["borderBackdrop"] = "None",
["overlays"] = {
{
0,
0,
0,
0.4000000357627869,
},
},
["inverse"] = false,
["sparkDesature"] = false,
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["barColor2"] = {
1,
0.8549020290374756,
0.4196078777313232,
1,
},
["adjustedMin"] = "",
},
["盗贼（60plus，by 露露緹婭@Bilibili） 1005更"] = {
["controlledChildren"] = {
"【露露】盗贼（BUFF）",
"盗贼（中心分组，by 露露緹婭@Bilibili）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 0,
["yOffset"] = 0,
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
["selfPoint"] = "CENTER",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。\n\n使用的英文模板来自：\nAfenar：https://wago.io/p/Afenar\nLuxthos：https://wago.io/p/Luxthos",
["subRegions"] = {
},
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
["scale"] = 1,
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "group",
["borderSize"] = 2,
["borderOffset"] = 4,
["uid"] = "mLiefmdMii(",
["id"] = "盗贼（60plus，by 露露緹婭@Bilibili） 1005更",
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
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["authorOptions"] = {
},
["config"] = {
},
["alpha"] = 1,
["borderInset"] = 1,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
},
["groupIcon"] = "interface/icons/classicon_rogue.blp",
},
["伺机待发（敏锐）"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["names"] = {
},
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "伺机待发",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 14185,
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
["single"] = "ROGUE",
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
["spellknown"] = 14185,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "伺机待发（敏锐）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "553xP3WoVBL",
["inverse"] = true,
["icon"] = true,
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
["CP1（盗贼）"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["authorOptions"] = {
},
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
["single"] = "ROGUE",
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
["auto"] = true,
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
["wagoID"] = "foIUC5_yM",
["parent"] = "盗贼 连击点",
["adjustedMin"] = "0",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["use_power"] = false,
["unevent"] = "auto",
["unit"] = "player",
["use_absorbMode"] = true,
["event"] = "Power",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["powertype"] = 4,
["spellIds"] = {
},
["names"] = {
},
["duration"] = "1",
["subeventSuffix"] = "_CAST_START",
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
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
["version"] = 24,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
},
["height"] = 15,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = true,
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["icon_side"] = "RIGHT",
["xOffset"] = 0,
["actions"] = {
["start"] = {
["do_custom"] = false,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
},
},
["sparkHeight"] = 30,
["internalVersion"] = 90,
["config"] = {
},
["anchorFrameParent"] = false,
["semver"] = "2.0.22",
["sparkHidden"] = "NEVER",
["id"] = "CP1（盗贼）",
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["width"] = 58,
["zoom"] = 0,
["backgroundColor"] = {
0,
0,
0,
0.3400000333786011,
},
["inverse"] = false,
["spark"] = false,
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "4",
},
["linked"] = false,
["changes"] = {
{
["value"] = {
0.250980406999588,
0.6901960968971252,
0.1882353127002716,
1,
},
["property"] = "barColor",
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
1,
1,
1,
1,
},
["property"] = "barColor",
},
},
},
},
["barColor2"] = {
1,
1,
0,
1,
},
["uid"] = "8QVHJzVOAJb",
},
["毒药提醒 - 副手"] = {
["iconSource"] = -1,
["wagoID"] = "GlZ4nri5M",
["authorOptions"] = {
},
["preferToUpdate"] = true,
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
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "item",
["itemName"] = 0,
["use_itemTypeName"] = true,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["use_inverse"] = false,
["event"] = "Item Equipped",
["subeventPrefix"] = "SPELL",
["use_itemSlot"] = true,
["itemSlot"] = 17,
["spellIds"] = {
},
["use_genericShowOn"] = true,
["names"] = {
},
["use_itemName"] = true,
["genericShowOn"] = "showOnCooldown",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
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
["names"] = {
},
["use_genericShowOn"] = true,
["use_unit"] = true,
["duration"] = "1",
["spellName"] = 0,
["unit"] = "player",
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
["showOn"] = "showOnMissing",
["use_enchant"] = false,
["use_track"] = true,
["weapon"] = "off",
},
["untrigger"] = {
},
},
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
["names"] = {
},
["use_weapon"] = true,
["matchesShowOn"] = "showAlways",
["use_unit"] = true,
["use_enchant"] = false,
["spellName"] = 0,
["debuffType"] = "HELPFUL",
["type"] = "item",
["useName"] = true,
["unevent"] = "auto",
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["subeventPrefix"] = "SPELL",
["use_itemName"] = true,
["event"] = "Weapon Enchant",
["realSpellName"] = 0,
["use_spellName"] = true,
["spellIds"] = {
},
["use_remaining"] = false,
["showOn"] = "showOnActive",
["duration"] = "1",
["use_track"] = true,
["weapon"] = "off",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    return t[1] or t[2]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 2,
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
["text_text_format_p_time_precision"] = 1,
["text_text"] = "副手",
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
["type"] = "subtext",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_format"] = "timed",
["text_shadowYOffset"] = 0,
["text_shadowXOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
},
["height"] = 32,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 68,
["multi"] = {
[68] = true,
},
},
["level_operator"] = {
">=",
},
["use_not_spellknown"] = true,
["use_class"] = true,
["use_spellknown"] = false,
["not_spellknown"] = 399965,
["spec"] = {
["multi"] = {
},
},
["use_level"] = true,
["level"] = {
"20",
},
["class"] = {
["single"] = "ROGUE",
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
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "盗贼 动态分组 左",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["xOffset"] = 0,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["cooldownEdge"] = false,
["width"] = 32,
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "1.0.1",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "毒药提醒 - 副手",
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["uid"] = "dfyj9uMj)E3",
["inverse"] = false,
["icon"] = true,
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
{
["value"] = false,
},
{
["value"] = true,
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 3,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = false,
["property"] = "desaturate",
},
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["property"] = "sub.3.text_visible",
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
["盗贼（中心分组，by 露露緹婭@Bilibili）"] = {
["controlledChildren"] = {
"盗贼 动态分组 左",
"盗贼 动态分组 右",
"盗贼 核心分组",
"盗贼 资源条",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["groupIcon"] = "interface/icons/classicon_rogue.blp",
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
["finish"] = {
},
["init"] = {
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
["buffShowOn"] = "showOnActive",
["unit"] = "player",
["unevent"] = "timed",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = 1,
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
["zoneIds"] = "",
["ingroup"] = {
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
["faction"] = {
["multi"] = {
},
},
["pvptalent"] = {
["multi"] = {
},
},
["use_class"] = "true",
["spec"] = {
["multi"] = {
},
},
["race"] = {
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
["border"] = false,
["borderEdge"] = "None",
["regionType"] = "group",
["borderSize"] = 16,
["frameStrata"] = 3,
["xOffset"] = 0,
["borderOffset"] = 5,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "盗贼（中心分组，by 露露緹婭@Bilibili）",
["selfPoint"] = "CENTER",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["parent"] = "盗贼（60plus，by 露露緹婭@Bilibili） 1005更",
["uid"] = "iOQ)uYz2mMP",
["borderInset"] = 11,
["config"] = {
},
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["groupOffset"] = false,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["yOffset"] = -224,
},
["【露露】盗贼（BUFF）"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"【露露】盗贼 补切割语音（3秒，团战加载）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 142,
["preferToUpdate"] = true,
["yOffset"] = -37.454545454545,
["sortHybridTable"] = {
["神恩回复（神圣）"] = false,
["精神分流（暗影）"] = false,
["暗影洞察（雕文）"] = false,
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
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["names"] = {
},
["event"] = "Health",
["debuffType"] = "HELPFUL",
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
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。\n部分触发器来自Luxthos",
["stagger"] = 0,
["radius"] = 200,
["authorOptions"] = {
},
["subRegions"] = {
},
["useLimit"] = true,
["grow"] = "GRID",
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
["uid"] = "h8nCONDMV(u",
["animate"] = false,
["anchorPoint"] = "CENTER",
["scale"] = 1.1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 10,
["sort"] = "none",
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["constantFactor"] = "RADIUS",
["alpha"] = 1,
["borderOffset"] = 4,
["parent"] = "盗贼（60plus，by 露露緹婭@Bilibili） 1005更",
["rowSpace"] = 35,
["id"] = "【露露】盗贼（BUFF）",
["stepAngle"] = 15,
["gridWidth"] = 5,
["anchorFrameType"] = "UIPARENT",
["source"] = "import",
["config"] = {
},
["fullCircle"] = true,
["gridType"] = "RD",
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["groupIcon"] = "interface/icons/classicon_rogue.blp",
},
["致盲"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["match_countOperator"] = ">",
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["unit"] = "multi",
["spellIds"] = {
},
["useMatch_count"] = true,
["match_count"] = "0",
["auranames"] = {
"2094",
},
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
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 2094,
["realSpellName"] = "致盲",
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
["single"] = "ROGUE",
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
["spellknown"] = 2094,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "致盲",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "APb6(jGwggx",
["inverse"] = true,
["icon"] = true,
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
["盗贼 资源条"] = {
["controlledChildren"] = {
"盗贼 连击点",
"盗贼 能量条",
"2秒回能（盗贼）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
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
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["version"] = 3,
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
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "group",
["borderSize"] = 2,
["config"] = {
},
["parent"] = "盗贼（中心分组，by 露露緹婭@Bilibili）",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "盗贼 资源条",
["xOffset"] = 0,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["selfPoint"] = "CENTER",
["borderInset"] = 1,
["frameStrata"] = 1,
["uid"] = "n1VuuFXVBiY",
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["groupIcon"] = "interface/icons/classicon_rogue.blp",
},
["毒药提醒 - 主手"] = {
["iconSource"] = -1,
["wagoID"] = "GlZ4nri5M",
["authorOptions"] = {
},
["preferToUpdate"] = true,
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
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "item",
["itemName"] = 0,
["use_itemTypeName"] = true,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["use_inverse"] = false,
["event"] = "Item Equipped",
["subeventPrefix"] = "SPELL",
["use_itemSlot"] = true,
["itemSlot"] = 16,
["spellIds"] = {
},
["use_genericShowOn"] = true,
["names"] = {
},
["use_itemName"] = true,
["genericShowOn"] = "showOnCooldown",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
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
["names"] = {
},
["use_genericShowOn"] = true,
["use_unit"] = true,
["duration"] = "1",
["spellName"] = 0,
["unit"] = "player",
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
["showOn"] = "showOnMissing",
["use_enchant"] = false,
["use_track"] = true,
["weapon"] = "main",
},
["untrigger"] = {
},
},
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
["names"] = {
},
["use_weapon"] = true,
["matchesShowOn"] = "showAlways",
["use_unit"] = true,
["use_enchant"] = false,
["spellName"] = 0,
["debuffType"] = "HELPFUL",
["type"] = "item",
["useName"] = true,
["unevent"] = "auto",
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["subeventPrefix"] = "SPELL",
["use_itemName"] = true,
["event"] = "Weapon Enchant",
["realSpellName"] = 0,
["use_spellName"] = true,
["spellIds"] = {
},
["use_remaining"] = false,
["showOn"] = "showOnActive",
["duration"] = "1",
["use_track"] = true,
["weapon"] = "main",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    return t[1] or t[2]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 2,
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
["text_text_format_p_time_precision"] = 1,
["text_text"] = "主手",
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
["type"] = "subtext",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_format"] = "timed",
["text_shadowYOffset"] = 0,
["text_shadowXOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
},
["height"] = 32,
["load"] = {
["use_level"] = true,
["talent"] = {
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
["use_class"] = true,
["use_not_spellknown"] = true,
["not_spellknown"] = 399965,
["use_spellknown"] = false,
["level_operator"] = {
">=",
},
["level"] = {
"20",
},
["class"] = {
["single"] = "ROGUE",
["multi"] = {
},
},
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
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "盗贼 动态分组 左",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["xOffset"] = 0,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["cooldownEdge"] = false,
["width"] = 32,
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "1.0.1",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "毒药提醒 - 主手",
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["uid"] = "tqFPI2(gthS",
["inverse"] = false,
["icon"] = true,
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
{
["value"] = false,
},
{
["value"] = true,
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 3,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = false,
["property"] = "desaturate",
},
{
["value"] = false,
["property"] = "sub.2.glow",
},
{
["property"] = "sub.3.text_visible",
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
["致命毒药（全等级）"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["showClones"] = false,
["useName"] = true,
["auranames"] = {
"434312",
"434313",
"11357",
"11358",
"25347",
},
["useExactSpellId"] = false,
["names"] = {
},
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["unit"] = "target",
["unitExists"] = false,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["auraspellids"] = {
"146739",
},
["ownOnly"] = true,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
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
["version"] = 12,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowXOffset"] = 0,
["glowType"] = "Pixel",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glow"] = true,
["glowThickness"] = 1,
["glowScale"] = 1,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
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
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["anchorXOffset"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_mod_rate"] = true,
["text_shadowYOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "TOP",
["text_fontSize"] = 20,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_legacy_floor"] = false,
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
["single"] = "ROGUE",
["multi"] = {
},
},
["zoneIds"] = "",
["use_class"] = true,
["race"] = {
},
["use_spellknown"] = false,
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
["spellknown"] = 14144,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["color"] = {
1,
1,
1,
1,
},
["source"] = "import",
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["adjustedMax"] = "",
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["authorOptions"] = {
},
["uid"] = "qfddImPG2lb",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["parent"] = "盗贼 动态分组 右",
["semver"] = "2.0.10",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "致命毒药（全等级）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["width"] = 32,
["frameStrata"] = 1,
["config"] = {
},
["inverse"] = false,
["cooldownEdge"] = true,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["desc"] = "",
},
["CP4（盗贼）"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["authorOptions"] = {
},
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
["single"] = "ROGUE",
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
["auto"] = true,
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
["wagoID"] = "foIUC5_yM",
["parent"] = "盗贼 连击点",
["adjustedMin"] = "3",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["use_power"] = false,
["unevent"] = "auto",
["unit"] = "player",
["use_absorbMode"] = true,
["event"] = "Power",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["powertype"] = 4,
["spellIds"] = {
},
["names"] = {
},
["duration"] = "1",
["subeventSuffix"] = "_CAST_START",
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
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
["version"] = 24,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
},
["height"] = 15,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = true,
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["icon_side"] = "RIGHT",
["xOffset"] = 0,
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
["sparkHeight"] = 30,
["internalVersion"] = 90,
["config"] = {
},
["anchorFrameParent"] = false,
["semver"] = "2.0.22",
["sparkHidden"] = "NEVER",
["id"] = "CP4（盗贼）",
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["width"] = 58,
["zoom"] = 0,
["backgroundColor"] = {
0,
0,
0,
0.3400000333786011,
},
["inverse"] = false,
["spark"] = false,
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "4",
},
["linked"] = false,
["changes"] = {
{
["value"] = {
0.250980406999588,
0.6901960968971252,
0.1882353127002716,
1,
},
["property"] = "barColor",
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
1,
1,
1,
1,
},
["property"] = "barColor",
},
},
},
},
["barColor2"] = {
1,
1,
0,
1,
},
["uid"] = "xCfJzSLQT1r",
},
["盗贼 核心分组"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"左右开弓（符文）",
"刃舞（符文）",
"正中眉心（符文）",
"鬼魅攻击",
"割裂（盗贼）",
"切割（3秒高亮）",
"破甲",
"还击",
"剑刃乱舞",
"冲动",
"冷血",
"预谋（敏锐）",
"伺机待发（敏锐）",
"转嫁（符文）",
"剧毒之刃（符文）",
"暗影步（符文）",
"闪转腾挪（符文）",
"敏锐大师（符文）",
"脚踢",
"肾击",
"凿击",
"致盲",
"闪避",
"消失",
"疾跑",
"扰乱",
"佯攻",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["stepAngle"] = 15,
["groupIcon"] = "interface/icons/classicon_rogue.blp",
["sortHybridTable"] = {
["左右开弓（符文）"] = false,
["扰乱"] = false,
["致盲"] = false,
["刃舞（符文）"] = false,
["正中眉心（符文）"] = false,
["还击"] = false,
["疾跑"] = false,
["割裂（盗贼）"] = false,
["脚踢"] = false,
["凿击"] = false,
["破甲"] = false,
["伺机待发（敏锐）"] = false,
["鬼魅攻击"] = false,
["闪避"] = false,
["佯攻"] = false,
["剑刃乱舞"] = false,
["冲动"] = false,
["切割（3秒高亮）"] = false,
["肾击"] = false,
["消失"] = false,
["预谋（敏锐）"] = false,
["冷血"] = false,
},
["alpha"] = 1,
["anchorPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
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
["internalVersion"] = 90,
["fullCircle"] = true,
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
["align"] = "CENTER",
["growOn"] = "changed",
["radius"] = 200,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["rotation"] = 0,
["version"] = 3,
["space"] = 3,
["selfPoint"] = "CENTER",
["config"] = {
},
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
["yOffset"] = 0.5,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["useLimit"] = false,
["animate"] = false,
["customGrow"] = "function(newPositions, activeRegions)\n    local limits = { --icons per row\n        7, --row 1\n        9, --row 2\n        \n    }\n    local rows = #limits -- total rows (matches limits size)\n    local iconSizes = { --have to match #limits size (if limits is {x,y} iconSizes have to be {a, b}, i.e. 2 and 2)\n        40, --row 1\n        35, --row 2\n        \n    }\n    local spacings = {\n        1, --row 1\n        42, --row 2\n        \n    }\n    \n    -- spacing between icons\n    local checkFit = true --resize only if total clones > totalWidth. Otherwise 1-2 icons will be giga huge\n    ----------------------\n    local check = true\n    \n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    local lastRowCount = 0\n    \n    local limit = limits[yCount+1]\n    local firstRowLimit = limits[yCount+1]\n    \n    local xSpacing = 3\n    local ySpacing = spacings[yCount+1]\n    local offset = spacings[yCount+1]\n    \n    local xOffset = 0\n    local yOffset = 0\n    \n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        \n        local region = regionData.region\n        if iconSizes[yCount+1] then\n            regionData.region:SetRegionWidth(iconSizes[yCount+1])\n            regionData.region:SetRegionHeight(iconSizes[yCount+1])\n        end\n        \n        local why = 0\n        for i=1, yCount+1 do\n            local wtf = (i==1 or i==yCount+1) and iconSizes[i]/2 or iconSizes[i]\n            why = why + wtf\n        end\n        local shift = yCount == 0 and 0 or why + offset\n        \n        local width = width or region.width\n        local totalWidth = totalWidth or (width + xSpacing) * limit\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= firstRowLimit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows - 1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        if yCount == rows - 1 then\n            local fit = checkFit and (width + xSpacing) * rowTotal < totalWidth\n            local lastRowWidth = fit and width or ((totalWidth - (rowTotal * xSpacing)) / rowTotal)\n            \n            xOffset = 0 - (lastRowWidth + xSpacing) / 2 * (rowTotal - 1) + (lastRowCount * (lastRowWidth + xSpacing))\n            yOffset = 0 - (shift - (width - lastRowWidth) / 2)-- change '-' to '+' after 0 to grow up instead of down\n            \n            lastRowCount = lastRowCount + 1\n            \n            regionData.region:SetRegionWidth(lastRowWidth)\n            regionData.region:SetRegionHeight(lastRowWidth)\n        else\n            xOffset = 0 - (width + xSpacing) / 2 * (rowTotal - 1) + (xCount * (width + xSpacing))\n            yOffset = 0 - shift\n        end\n        \n        xCount = xCount + 1\n        \n        if yCount < rows - 1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n                limit = limits[yCount+1]\n                ySpacing = spacings[yCount+1]\n                offset = offset + ySpacing\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend",
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
["gridType"] = "RD",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "盗贼 核心分组",
["limit"] = 5,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["parent"] = "盗贼（中心分组，by 露露緹婭@Bilibili）",
["borderInset"] = 1,
["uid"] = "veqnhyspduR",
["xOffset"] = 0,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["grow"] = "CUSTOM",
},
["敏锐大师（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "51yjJjm7_",
["parent"] = "盗贼 核心分组",
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
["showClones"] = false,
["useName"] = true,
["auranames"] = {
"425096",
},
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["names"] = {
},
["unitExists"] = false,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["ownOnly"] = true,
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
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
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
["text_anchorYOffset"] = -1,
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
["anchor_point"] = "TOP",
["text_fontSize"] = 18,
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_time_format"] = 0,
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "Pixel",
["glowLength"] = 8,
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
["class"] = {
["single"] = "ROGUE",
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
["spellknown"] = 425096,
["size"] = {
["multi"] = {
},
},
},
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMax"] = false,
["authorOptions"] = {
},
["source"] = "import",
["cooldown"] = true,
["displayIcon"] = "",
["color"] = {
1,
1,
1,
1,
},
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
["semver"] = "2.0.6",
["tocversion"] = 30400,
["id"] = "敏锐大师（符文）",
["frameStrata"] = 1,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["selfPoint"] = "CENTER",
["uid"] = "UGie4Sf4D0S",
["inverse"] = false,
["xOffset"] = 0,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
},
["毒药提醒 - 主手（致命阴谋）"] = {
["iconSource"] = -1,
["wagoID"] = "GlZ4nri5M",
["authorOptions"] = {
},
["preferToUpdate"] = true,
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
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["itemName"] = 0,
["type"] = "item",
["use_itemTypeName"] = true,
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_inverse"] = false,
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["use_itemSlot"] = true,
["itemSlot"] = 16,
["spellIds"] = {
},
["event"] = "Item Equipped",
["use_genericShowOn"] = true,
["use_itemName"] = true,
["unit"] = "player",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
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
["names"] = {
},
["unitExists"] = true,
["subeventPrefix"] = "SPELL",
["use_weapon"] = true,
["use_unit"] = true,
["use_genericShowOn"] = true,
["use_enchant"] = false,
["spellName"] = 0,
["debuffType"] = "HELPFUL",
["useName"] = true,
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["unevent"] = "auto",
["use_showOn"] = true,
["event"] = "Weapon Enchant",
["use_itemName"] = true,
["use_remaining"] = false,
["realSpellName"] = 0,
["use_spellName"] = true,
["spellIds"] = {
},
["duration"] = "1",
["showOn"] = "showOnActive",
["unit"] = "player",
["use_track"] = true,
["weapon"] = "main",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    return t[1] or t[2]\nend",
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
["version"] = 2,
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
["text_text"] = "主手",
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
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
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = false,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 60,
["anchorYOffset"] = 0,
},
},
["height"] = 32,
["load"] = {
["use_level"] = true,
["talent"] = {
["multi"] = {
},
},
["not_spellknown"] = 399965,
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
["class"] = {
["single"] = "ROGUE",
["multi"] = {
},
},
["use_class"] = true,
["use_not_spellknown"] = false,
["level_operator"] = {
">=",
},
["spec"] = {
["multi"] = {
},
},
["use_spellknown"] = true,
["level"] = {
"20",
},
["spellknown"] = 399965,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["xOffset"] = 0,
["cooldown"] = true,
["conditions"] = {
},
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "yY7ESOISh7B",
["color"] = {
1,
1,
1,
1,
},
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["parent"] = "盗贼 动态分组 左",
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.1",
["tocversion"] = 11500,
["id"] = "毒药提醒 - 主手（致命阴谋）",
["zoom"] = 0.3,
["alpha"] = 1,
["width"] = 32,
["useCooldownModRate"] = true,
["config"] = {
},
["inverse"] = false,
["selfPoint"] = "CENTER",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["url"] = "https://space.bilibili.com/455259",
},
["锁喉"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = true,
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
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["unitExists"] = false,
["auranames"] = {
"703",
},
["spellIds"] = {
},
["unit"] = "target",
["names"] = {
},
["matchesShowOn"] = "showOnActive",
["useName"] = true,
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
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
},
["height"] = 32,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "ROGUE",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 703,
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
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
["cooldown"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["url"] = "https://space.bilibili.com/455259",
["parent"] = "盗贼 动态分组 右",
["authorOptions"] = {
},
["uid"] = "utW(qZ21NjT",
["anchorFrameParent"] = false,
["width"] = 32,
["useCooldownModRate"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "锁喉",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["config"] = {
},
["inverse"] = false,
["selfPoint"] = "CENTER",
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
},
["icon"] = true,
},
["CP5（盗贼）"] = {
["sparkWidth"] = 10,
["iconSource"] = -1,
["authorOptions"] = {
},
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
["single"] = "ROGUE",
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
["auto"] = true,
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
["wagoID"] = "foIUC5_yM",
["parent"] = "盗贼 连击点",
["adjustedMin"] = "4",
["sparkRotationMode"] = "AUTO",
["triggers"] = {
{
["trigger"] = {
["type"] = "unit",
["use_power"] = false,
["unevent"] = "auto",
["unit"] = "player",
["use_absorbMode"] = true,
["event"] = "Power",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["powertype"] = 4,
["spellIds"] = {
},
["names"] = {
},
["duration"] = "1",
["subeventSuffix"] = "_CAST_START",
["use_powertype"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
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
["version"] = 24,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["type"] = "subforeground",
},
},
["height"] = 15,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = true,
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["icon_side"] = "RIGHT",
["xOffset"] = 0,
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
["sparkHeight"] = 30,
["internalVersion"] = 90,
["config"] = {
},
["anchorFrameParent"] = false,
["semver"] = "2.0.22",
["sparkHidden"] = "NEVER",
["id"] = "CP5（盗贼）",
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["width"] = 58,
["zoom"] = 0,
["backgroundColor"] = {
0,
0,
0,
0.3400000333786011,
},
["inverse"] = false,
["spark"] = false,
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = "==",
["variable"] = "power",
["value"] = "4",
},
["linked"] = false,
["changes"] = {
{
["value"] = {
0.250980406999588,
0.6901960968971252,
0.1882353127002716,
1,
},
["property"] = "barColor",
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
1,
1,
1,
1,
},
["property"] = "barColor",
},
},
},
},
["barColor2"] = {
1,
1,
0,
1,
},
["uid"] = "C)jASheVT)B",
},
["暗影步（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "51yjJjm7_",
["authorOptions"] = {
},
["preferToUpdate"] = true,
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
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["names"] = {
},
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "暗影步",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 400029,
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
["glow"] = false,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%p",
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorYOffset"] = 0,
["type"] = "subtext",
["text_text_format_p_time_dynamic_threshold"] = 3,
["text_color"] = {
1,
1,
0,
1,
},
["text_font"] = "Rurutia",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_shadowYOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = true,
["anchor_point"] = "CENTER",
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
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
["single"] = 66,
["multi"] = {
[66] = true,
},
},
["class"] = {
["single"] = "ROGUE",
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
["use_level"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 400029,
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
["auto"] = true,
["cooldownTextDisabled"] = true,
["semver"] = "2.0.6",
["tocversion"] = 11500,
["id"] = "暗影步（符文）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["uid"] = "h3T(aPK0kvM",
["inverse"] = true,
["parent"] = "盗贼 核心分组",
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
["color"] = {
1,
1,
1,
1,
},
},
["盗贼 动态分组 右"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"致命毒药（全等级）",
"毒伤（符文）",
"军刀猛刺（符文）",
"冷酷攻击",
"锁喉",
"埋伏（符文）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["yOffset"] = 24,
["anchorPoint"] = "CENTER",
["animate"] = false,
["frameStrata"] = 1,
["borderColor"] = {
0,
0,
0,
1,
},
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
["selfPoint"] = "BOTTOMRIGHT",
["align"] = "CENTER",
["gridType"] = "LU",
["radius"] = 200,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["rotation"] = 0,
["grow"] = "GRID",
["version"] = 3,
["fullCircle"] = true,
["groupIcon"] = "interface/icons/classicon_rogue.blp",
["uid"] = "NbAi97aiQJ5",
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
["stagger"] = 0,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["sortHybridTable"] = {
["冷酷攻击"] = false,
["毒伤（符文）"] = false,
["致命毒药"] = false,
},
["source"] = "import",
["customGrow"] = "function(newPositions, activeRegions)\n    local limit = 10 -- limit of icons per row\n    local rows = 1 -- total rows\n    local spacing = 3 -- spacing between icons\n    ----------------------\n    local check = true\n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    \n    local xOffset = 0\n    local yOffset = 0\n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        local region = regionData.region\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= limit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows-1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        xOffset = 0 - (region.width + spacing) / 2 * (rowTotal-1) + (xCount * (region.width + spacing))\n        yOffset = 0 + (region.height + spacing) * yCount -- change '-' to '+' after 0 to grow up instead of down\n        \n        xCount = xCount + 1\n        \n        if yCount < rows-1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend\n\n",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 9,
["gridWidth"] = 4,
["xOffset"] = 149,
["constantFactor"] = "RADIUS",
["sort"] = "none",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "盗贼 动态分组 右",
["stepAngle"] = 15,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["config"] = {
},
["borderInset"] = 1,
["space"] = 3,
["parent"] = "盗贼（中心分组，by 露露緹婭@Bilibili）",
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["useLimit"] = true,
},
["脚踢"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["unit"] = "player",
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 1766,
["realSpellName"] = "脚踢",
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
["single"] = "ROGUE",
["multi"] = {
},
},
["size"] = {
["multi"] = {
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
["spellknown"] = 1766,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "脚踢",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "(BKRn3GfZQW",
["inverse"] = true,
["icon"] = true,
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
["property"] = "desaturate",
},
},
},
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["左右开弓（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["type"] = "aura2",
["auranames"] = {
"424919",
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
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "左右开弓",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 424919,
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
["version"] = 12,
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
["multi"] = {
},
},
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "ROGUE",
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
["spellknown"] = 424919,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "盗贼 核心分组",
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
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "hkdSmcfCKas",
["url"] = "https://space.bilibili.com/455259",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.10",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "左右开弓（符文）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["width"] = 32,
["frameStrata"] = 1,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
},
["闪转腾挪（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "51yjJjm7_",
["authorOptions"] = {
},
["preferToUpdate"] = true,
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
["init"] = {
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["showClones"] = false,
["useName"] = true,
["auranames"] = {
"400016",
},
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["names"] = {
},
["unitExists"] = false,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["type"] = "aura2",
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
["ignoreWagoUpdate"] = true,
["version"] = 10,
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
["text_anchorYOffset"] = -1,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "TOP",
["text_fontSize"] = 18,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowXOffset"] = 0,
["glowType"] = "Pixel",
["glowLength"] = 8,
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
["class"] = {
["single"] = "ROGUE",
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
["spellknown"] = 400016,
["zoneIds"] = "",
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["xOffset"] = 0,
["source"] = "import",
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["conditions"] = {
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "wEOcwQYYeaU",
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.6",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "闪转腾挪（符文）",
["useCooldownModRate"] = true,
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
["inverse"] = false,
["icon"] = true,
["displayIcon"] = "",
["cooldown"] = true,
["parent"] = "盗贼 核心分组",
},
["割裂（盗贼）"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
["parent"] = "盗贼 核心分组",
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
["showClones"] = false,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["useExactSpellId"] = false,
["unit"] = "target",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["matchesShowOn"] = "showAlways",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["auraspellids"] = {
"146739",
},
["useName"] = true,
["auranames"] = {
"1943",
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
["selfPoint"] = "CENTER",
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
["single"] = "ROGUE",
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
["spellknown"] = 1943,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["icon"] = true,
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
["cooldownEdge"] = false,
["uid"] = "1tvZOU7w8Y7",
["color"] = {
1,
1,
1,
1,
},
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "割裂（盗贼）",
["auto"] = true,
["useCooldownModRate"] = true,
["width"] = 32,
["cooldownTextDisabled"] = false,
["config"] = {
},
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
["variable"] = "expirationTime",
["value"] = "3",
["op"] = "<=",
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
},
},
},
["cooldown"] = true,
["xOffset"] = 0,
},
["2秒回能（盗贼）"] = {
["sparkWidth"] = 15,
["iconSource"] = -1,
["xOffset"] = 0,
["preferToUpdate"] = false,
["yOffset"] = -23,
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
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "ROGUE",
["multi"] = {
["DRUID"] = true,
["ROGUE"] = true,
},
},
["use_class"] = true,
["use_spellknown"] = false,
["size"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 5487,
["zoneIds"] = "",
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
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "XoGkZt2VR",
["color"] = {
},
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
["events"] = "UNIT_POWER_FREQUENT:player ENERGYTICK",
["spellIds"] = {
},
["custom"] = "function(a, e, t)\n    local currEnergy = UnitPower(\"player\", 3)\n    local dur = 2\n    if (e == \"UNIT_POWER_FREQUENT\" and currEnergy > (aura_env.lastEnergy or 0))\n    or (e == \"ENERGYTICK\" and t and currEnergy == UnitPowerMax(\"player\", 3))\n    then\n        if not a[\"\"]  then\n            a[\"\"] = {\n                show = true,\n                changed = true,\n                duration = dur,\n                expirationTime = GetTime() + dur,\n                progressType = \"timed\"\n            }\n        else\n            local s = a[\"\"]\n            s.changed = true\n            s.duration = dur\n            s.expirationTime = GetTime() + dur\n            s.show = true\n            C_Timer.After(2, function() WeakAuras.ScanEvents(\"ENERGYTICK\", true) end)\n        end\n    end\n    aura_env.lastEnergy = currEnergy\n    return true\nend",
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
["backdropColor"] = {
1,
1,
1,
0.5,
},
["source"] = "import",
["parent"] = "盗贼 资源条",
["barColor2"] = {
1,
1,
0,
1,
},
["sparkTexture"] = "XPBarAnim-OrangeSpark",
["anchorFrameFrame"] = "WeakAuras:Energy Bar - Druid",
["adjustedMax"] = "",
["borderInFront"] = true,
["authorOptions"] = {
},
["icon_side"] = "RIGHT",
["spark"] = true,
["sparkOffsetX"] = 0,
["sparkHeight"] = 30,
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["uid"] = "FzkMQewDHys",
["semver"] = "1.1.2",
["icon"] = false,
["sparkHidden"] = "NEVER",
["id"] = "2秒回能（盗贼）",
["frameStrata"] = 5,
["width"] = 297,
["config"] = {
},
["backgroundColor"] = {
0,
0,
0,
0,
},
["inverse"] = true,
["desc"] = "from：https://wago.io/XoGkZt2VR/",
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
["毒药提醒 - 副手（致命阴谋）"] = {
["iconSource"] = -1,
["wagoID"] = "GlZ4nri5M",
["authorOptions"] = {
},
["preferToUpdate"] = true,
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
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["itemName"] = 0,
["type"] = "item",
["use_itemTypeName"] = true,
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_inverse"] = false,
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["use_itemSlot"] = true,
["itemSlot"] = 17,
["spellIds"] = {
},
["event"] = "Item Equipped",
["use_genericShowOn"] = true,
["use_itemName"] = true,
["unit"] = "player",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
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
["names"] = {
},
["unitExists"] = true,
["subeventPrefix"] = "SPELL",
["use_weapon"] = true,
["use_unit"] = true,
["use_genericShowOn"] = true,
["use_enchant"] = false,
["spellName"] = 0,
["debuffType"] = "HELPFUL",
["useName"] = true,
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["unevent"] = "auto",
["use_showOn"] = true,
["event"] = "Weapon Enchant",
["use_itemName"] = true,
["use_remaining"] = false,
["realSpellName"] = 0,
["use_spellName"] = true,
["spellIds"] = {
},
["duration"] = "1",
["showOn"] = "showOnActive",
["unit"] = "player",
["use_track"] = true,
["weapon"] = "off",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    return t[1] or t[2]\nend",
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
["version"] = 2,
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
["text_text"] = "副手",
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
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
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = false,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 60,
["anchorYOffset"] = 0,
},
},
["height"] = 32,
["load"] = {
["use_level"] = true,
["talent"] = {
["single"] = 68,
["multi"] = {
[68] = true,
},
},
["not_spellknown"] = 399965,
["level_operator"] = {
">=",
},
["class"] = {
["single"] = "ROGUE",
["multi"] = {
},
},
["use_class"] = true,
["use_not_spellknown"] = false,
["use_never"] = false,
["spec"] = {
["multi"] = {
},
},
["use_spellknown"] = true,
["level"] = {
"20",
},
["spellknown"] = 399965,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["xOffset"] = 0,
["cooldown"] = true,
["conditions"] = {
},
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "BFLxu7UdSxM",
["color"] = {
1,
1,
1,
1,
},
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["parent"] = "盗贼 动态分组 左",
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.1",
["tocversion"] = 11500,
["id"] = "毒药提醒 - 副手（致命阴谋）",
["zoom"] = 0.3,
["alpha"] = 1,
["width"] = 32,
["useCooldownModRate"] = true,
["config"] = {
},
["inverse"] = false,
["selfPoint"] = "CENTER",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["url"] = "https://space.bilibili.com/455259",
},
["切割（3秒高亮）"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
["parent"] = "盗贼 核心分组",
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
["showClones"] = false,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["useExactSpellId"] = false,
["unit"] = "player",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["matchesShowOn"] = "showAlways",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["auraspellids"] = {
"146739",
},
["useName"] = true,
["auranames"] = {
"5171",
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
["selfPoint"] = "CENTER",
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
["single"] = "ROGUE",
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
["spellknown"] = 5171,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["icon"] = true,
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
["cooldownEdge"] = true,
["uid"] = "jwowMTfqGSk",
["color"] = {
1,
1,
1,
1,
},
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "切割（3秒高亮）",
["auto"] = true,
["useCooldownModRate"] = true,
["width"] = 32,
["cooldownTextDisabled"] = false,
["config"] = {
},
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
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = 1,
["property"] = "alpha",
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
["variable"] = "expirationTime",
["value"] = "3",
["op"] = "<=",
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
},
},
},
["cooldown"] = true,
["xOffset"] = 0,
},
["剑刃乱舞"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
"13877",
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["useName"] = true,
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
["spellName"] = 13877,
["realSpellName"] = "剑刃乱舞",
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
["single"] = "ROGUE",
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
["spellknown"] = 13877,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "盗贼 核心分组",
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
["zoom"] = 0.3,
["semver"] = "2.0.10",
["tocversion"] = 11500,
["id"] = "剑刃乱舞",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "t2lE)HwvhWt",
["inverse"] = true,
["icon"] = true,
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
["刃舞（符文）"] = {
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
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
["showClones"] = false,
["type"] = "aura2",
["auranames"] = {
"400012",
},
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["unit"] = "player",
["unitExists"] = true,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["ownOnly"] = true,
["auraspellids"] = {
"146739",
},
["useName"] = true,
["useExactSpellId"] = false,
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
["version"] = 12,
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
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "ROGUE",
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
["spellknown"] = 400012,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 32,
["source"] = "import",
["authorOptions"] = {
},
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
["cooldownEdge"] = false,
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["anchorFrameParent"] = false,
["alpha"] = 1,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "刃舞（符文）",
["semver"] = "2.0.10",
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["zoom"] = 0.3,
["uid"] = "Tr8qN0HtpxE",
["inverse"] = false,
["parent"] = "盗贼 核心分组",
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
["value"] = true,
["property"] = "sub.2.glow",
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
["variable"] = "expirationTime",
["op"] = "<=",
["value"] = "3",
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
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
["【露露】盗贼 补切割语音（3秒，团战加载）"] = {
["outline"] = "OUTLINE",
["iconSource"] = -1,
["wagoID"] = "foIUC5_yM",
["xOffset"] = 0,
["displayText"] = "",
["shadowYOffset"] = -1,
["anchorPoint"] = "CENTER",
["frameStrata"] = 1,
["cooldownSwipe"] = true,
["displayText_format_p_time_format"] = 0,
["customTextUpdate"] = "event",
["url"] = "https://space.bilibili.com/455259",
["actions"] = {
["start"] = {
["sound"] = " custom",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】补切割.ogg",
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
["rem"] = "3",
["auranames"] = {
"5171",
},
["matchesShowOn"] = "showOnActive",
["subeventPrefix"] = "SPELL",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["showClones"] = false,
["useName"] = true,
["useExactSpellId"] = false,
["event"] = "Health",
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["auraspellids"] = {
"146739",
},
["spellIds"] = {
},
["type"] = "aura2",
["remOperator"] = "<=",
["ownOnly"] = true,
["names"] = {
},
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
["displayText_format_p_time_dynamic_threshold"] = 60,
["yOffset"] = -3000,
["desaturate"] = false,
["displayText_format_p_time_precision"] = 1,
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
["zoneIds"] = "",
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "ROGUE",
["multi"] = {
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["ingroup"] = {
["single"] = "raid",
["multi"] = {
["raid"] = true,
},
},
["role"] = {
["single"] = "DAMAGER",
["multi"] = {
["DAMAGER"] = true,
},
},
["use_class"] = true,
["use_ingroup"] = true,
["use_spellknown"] = true,
["use_spec"] = true,
["race"] = {
},
["use_combat"] = true,
["spellknown"] = 5171,
["size"] = {
["multi"] = {
},
},
},
["icon"] = true,
["displayText_format_p_time_mod_rate"] = true,
["fontSize"] = 10,
["source"] = "import",
["displayText_format_p_time_legacy_floor"] = false,
["shadowXOffset"] = 1,
["selfPoint"] = "CENTER",
["cooldown"] = true,
["conditions"] = {
},
["regionType"] = "text",
["parent"] = "【露露】盗贼（BUFF）",
["preferToUpdate"] = false,
["config"] = {
},
["justify"] = "LEFT",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
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
["cooldownTextDisabled"] = false,
["semver"] = "2.0.10",
["tocversion"] = 30400,
["id"] = "【露露】盗贼 补切割语音（3秒，团战加载）",
["automaticWidth"] = "Auto",
["useCooldownModRate"] = true,
["width"] = 48,
["auto"] = true,
["uid"] = "bdnn9GBX4Nw",
["inverse"] = false,
["zoom"] = 0.3,
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
["authorOptions"] = {
},
},
},
}
