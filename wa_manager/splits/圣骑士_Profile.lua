
WeakAurasSaved = {
["editor_tab_spaces"] = 4,
["login_squelch_time"] = 10,
["PULL(Need DBM BW ERT)PULL"] = 5,
["dbVersion"] = 90,
["标记目标 Mark TargetSet"] = false,
["displays"] = {
["正义之怒未开（防护）"] = {
["iconSource"] = -1,
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
["actions"] = {
["start"] = {
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
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["use_debuffClass"] = false,
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showOnMissing",
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
["auranames"] = {
"25780",
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
["desc"] = "",
["subRegions"] = {
{
["type"] = "subbackground",
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
0.07843137254902,
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
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "正义",
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
0,
0,
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
},
["height"] = 30,
["load"] = {
["use_level"] = false,
["level_operator"] = {
">=",
},
["use_never"] = false,
["talent"] = {
["single"] = 51,
["multi"] = {
[57] = true,
},
},
["level"] = {
"60",
},
["spec"] = {
["multi"] = {
},
},
["use_encounterid"] = false,
["use_talent"] = true,
["raid_role"] = {
},
["use_spellknown"] = true,
["use_itemequiped"] = false,
["class"] = {
["single"] = "PALADIN",
["multi"] = {
["WARLOCK"] = true,
},
},
["use_class"] = true,
["use_combat"] = true,
["spellknown"] = 25780,
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
["cooldownEdge"] = false,
["cooldown"] = true,
["displayIcon"] = 135962,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["authorOptions"] = {
},
["uid"] = "fh2VXbuIaPQ",
["icon"] = true,
["anchorFrameParent"] = false,
["alpha"] = 1,
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
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["tocversion"] = 20501,
["id"] = "正义之怒未开（防护）",
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["desaturate"] = false,
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
["property"] = "sub.2.glow",
},
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = {
["sound_type"] = "Play",
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!FF-Notification.mp3",
["sound_channel"] = "Master",
},
["property"] = "sound",
},
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = false,
},
["parent"] = "骑士（BUFF）",
},
["圣疗术（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
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
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "圣疗术",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 633,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 35,
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
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 633,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["cooldownEdge"] = false,
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
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "QlwLe672byP",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "圣疗术（可点击施法）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 35,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 圣疗术\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\"|cffff92c2圣疗术|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["圣骑士 资源条"] = {
["controlledChildren"] = {
"圣骑士 法力条",
"5秒回蓝（骑士）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["parent"] = "圣骑士（中心分组）",
["preferToUpdate"] = true,
["groupIcon"] = "interface/icons/classicon_paladin.blp",
["anchorPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["url"] = "",
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
["yOffset"] = -26,
["selfPoint"] = "CENTER",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "圣骑士 资源条",
["authorOptions"] = {
},
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["config"] = {
},
["borderInset"] = 1,
["uid"] = "o87N8upu397",
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["xOffset"] = 0,
},
["奉献"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
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
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "奉献",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 26573,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 35,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
[12] = false,
[3] = true,
},
},
["class"] = {
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 26573,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["cooldownEdge"] = false,
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
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "D34OWORap3A",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "奉献",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 35,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = false,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 奉献\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff92c2奉献|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["复仇（惩戒）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "骑士（BUFF）",
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
["actions"] = {
["start"] = {
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!Wind-OnePlusLight.ogg",
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
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["auranames"] = {
"20050",
},
["unit"] = "player",
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["unitExists"] = false,
["matchesShowOn"] = "showOnActive",
["spellIds"] = {
},
["names"] = {
},
["auraspellids"] = {
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
["desc"] = "",
["version"] = 6,
["subRegions"] = {
{
["type"] = "subbackground",
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
0,
0,
1,
},
["glowThickness"] = 2,
["glow"] = false,
["glowScale"] = 2,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "复仇",
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 1,
["text_color"] = {
0.960784375667572,
0.5490196347236633,
0.729411780834198,
1,
},
["text_font"] = "Rurutia",
["text_shadowXOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_format"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_anchorYOffset"] = 0,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%s",
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
["anchorXOffset"] = 0,
["type"] = "subtext",
["text_text_format_p_time_precision"] = 1,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_mod_rate"] = true,
["text_shadowYOffset"] = 0,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_anchorYOffset"] = 0,
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 60,
["anchorYOffset"] = 0,
},
},
["height"] = 30,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
[35] = true,
[82] = true,
},
},
["class"] = {
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["use_spellknown"] = false,
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
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["xOffset"] = 0,
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
["color"] = {
1,
1,
1,
1,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["desaturate"] = false,
["uid"] = "q2MpHU93nCw",
["authorOptions"] = {
},
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["icon"] = true,
["semver"] = "2.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "复仇（惩戒）",
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["width"] = 30,
["frameStrata"] = 1,
["config"] = {
},
["inverse"] = false,
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
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["保护祝福（可点击施法）"] = {
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
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["auranames"] = {
"10278",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["unit"] = "player",
["spellName"] = 10278,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["ownOnly"] = true,
["realSpellName"] = "保护之手",
["use_spellName"] = true,
["spellIds"] = {
},
["useName"] = true,
["subeventPrefix"] = "SPELL",
["names"] = {
},
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["unit"] = "player",
["realSpellName"] = "保护祝福",
["use_spellName"] = true,
["spellIds"] = {
},
["event"] = "Cooldown Progress (Spell)",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["use_track"] = true,
["spellName"] = 10278,
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
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 3,
["text_text_format_p_time_legacy_floor"] = false,
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = false,
["glowType"] = "Pixel",
["glowLength"] = 15,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowScale"] = 1.7,
["glow"] = false,
["glowThickness"] = 2,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 6,
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
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "PALADIN",
["multi"] = {
},
},
["spellknown"] = 10278,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["desc"] = "",
["useTooltip"] = false,
["cooldown"] = true,
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["authorOptions"] = {
},
["cooldownEdge"] = false,
["config"] = {
},
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 保护祝福\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffff92c2保护祝福|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["selfPoint"] = "CENTER",
["zoom"] = 0.3,
["frameStrata"] = 1,
["tocversion"] = 11500,
["id"] = "保护祝福（可点击施法）",
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["width"] = 30,
["progressSource"] = {
-1,
"",
},
["uid"] = "2qB8TQiCImv",
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
["property"] = "sub.3.glow",
},
{
["property"] = "desaturate",
},
{
["value"] = 1,
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
["property"] = "inverse",
},
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
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["adjustedMax"] = "",
},
["圣盾术（可点击施法，左键开启，右键取消）"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useMatch_count"] = true,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["subeventPrefix"] = "SPELL",
["useName"] = true,
["spellIds"] = {
},
["auranames"] = {
"642",
},
["match_count"] = "0",
["match_countOperator"] = ">",
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
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "圣盾术",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 642,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 35,
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
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 642,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["cooldownEdge"] = false,
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
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "lyGmtz6gsoq",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "圣盾术（可点击施法，左键开启，右键取消）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 35,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 圣盾术\")\nbtn:SetAttribute(\"macrotext2\",\"/cancelaura 圣盾术\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\"|cffffffff左键：|r|cffff92c2圣盾术|r\\n|cffffffff右键：|r|cffff92c2取消圣盾术|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["自律（三系）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = true,
["actions"] = {
["start"] = {
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!Wind-OnePlusLight.ogg",
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
["showClones"] = false,
["type"] = "aura2",
["auraspellids"] = {
},
["auranames"] = {
"25771",
},
["names"] = {
},
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["unitExists"] = false,
["ownOnly"] = true,
["spellIds"] = {
},
["unit"] = "player",
["subeventSuffix"] = "_CAST_START",
["useName"] = true,
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
["selfPoint"] = "CENTER",
["desc"] = "",
["version"] = 6,
["subRegions"] = {
{
["type"] = "subbackground",
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
0,
0,
1,
},
["glow"] = true,
["glowThickness"] = 2,
["glowScale"] = 2,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "自律",
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
["anchorXOffset"] = 0,
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 1,
["text_color"] = {
1,
0,
0,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_mod_rate"] = true,
["text_anchorYOffset"] = 0,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["text_shadowYOffset"] = 0,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 15,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
},
},
["height"] = 30,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
[35] = true,
[24] = true,
},
},
["class"] = {
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["zoneIds"] = "",
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
["use_spellknown"] = false,
["size"] = {
["multi"] = {
},
},
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["authorOptions"] = {
},
["source"] = "import",
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["adjustedMax"] = "",
["color"] = {
1,
1,
1,
1,
},
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
["config"] = {
},
["desaturate"] = false,
["width"] = 30,
["anchorFrameParent"] = false,
["icon"] = true,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.0",
["tocversion"] = 30400,
["id"] = "自律（三系）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "n4sgiWdBiLY",
["inverse"] = false,
["parent"] = "骑士（BUFF）",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["url"] = "",
},
["圣骑士 法力条"] = {
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
["url"] = "",
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
["single"] = "PALADIN",
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
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["auto"] = true,
["tocversion"] = 11500,
["alpha"] = 1,
["sparkColor"] = {
1,
0.94901960784314,
0,
1,
},
["borderBackdrop"] = "None",
["wagoID"] = "tRi9estlC",
["parent"] = "圣骑士 资源条",
["customText"] = "function()\n    local mana = UnitPower(\"player\",0)\n    local manaMax = UnitPowerMax(\"player\",0)\n    local manaPerc = (mana / manaMax) * 100\n    return string.format(\"%.0f\",manaPerc)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
["sparkRotationMode"] = "MANUAL",
["triggers"] = {
{
["trigger"] = {
["ownOnly"] = true,
["use_showCost"] = true,
["unit"] = "player",
["powertype"] = 0,
["use_powertype"] = true,
["spellName"] = 200183,
["debuffType"] = "HELPFUL",
["type"] = "unit",
["genericShowOn"] = "showOnCooldown",
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["use_genericShowOn"] = true,
["event"] = "Power",
["unevent"] = "auto",
["realSpellName"] = "Прославление",
["use_spellName"] = true,
["spellIds"] = {
200183,
},
["use_unit"] = true,
["names"] = {
"Прославление",
},
["subeventPrefix"] = "SPELL",
["custom_hide"] = "timed",
["duration"] = "1",
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
["backdropColor"] = {
1,
1,
1,
0,
},
["source"] = "import",
["zoom"] = 0,
["barColor2"] = {
0.2235294282436371,
0.6274510025978088,
0.9921569228172302,
1,
},
["spark"] = false,
["adjustedMax"] = "",
["config"] = {
},
["xOffset"] = 0,
["borderInFront"] = false,
["sparkOffsetX"] = 0,
["icon_side"] = "RIGHT",
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
["width"] = 297,
["sparkHeight"] = 20,
["customTextUpdate"] = "event",
["overlaysTexture"] = {
"Solid",
},
["icon"] = false,
["semver"] = "1.1.0",
["sparkHidden"] = "BOTH",
["id"] = "圣骑士 法力条",
["useAdjustededMax"] = false,
["frameStrata"] = 2,
["anchorFrameType"] = "SCREEN",
["sparkWidth"] = 5,
["uid"] = "6BSP3CGnmNb",
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
["盾牌壁垒"] = {
["iconSource"] = -1,
["wagoID"] = "p-wCoCa05",
["parent"] = "圣骑士 动态分组 左",
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
"20134",
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["matchesShowOn"] = "showOnActive",
["spellIds"] = {
},
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["names"] = {
},
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
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_mod_rate"] = true,
["text_anchorYOffset"] = -1,
["anchor_point"] = "TOP",
["text_fontSize"] = 16,
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
["multi"] = {
},
},
["class"] = {
["single"] = "PALADIN",
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
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 20137,
["zoneIds"] = "",
},
["frameStrata"] = 1,
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
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = false,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 神恩术\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff92c2神恩术|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
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
["xOffset"] = 0,
["width"] = 32,
["anchorFrameParent"] = false,
["url"] = "",
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "盾牌壁垒",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "6mTPUlDkF8v",
["inverse"] = false,
["color"] = {
1,
1,
1,
1,
},
["conditions"] = {
},
["cooldown"] = true,
["authorOptions"] = {
},
},
["圣骑士 动态分组 右"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"超度亡灵（可点击施法）",
"驱邪术（可点击施法）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["parent"] = "圣骑士（中心分组）",
["preferToUpdate"] = true,
["yOffset"] = 24,
["gridType"] = "LU",
["source"] = "import",
["gridWidth"] = 4,
["fullCircle"] = true,
["rowSpace"] = 5,
["url"] = "",
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
["selfPoint"] = "BOTTOMRIGHT",
["align"] = "CENTER",
["space"] = 3,
["groupIcon"] = "interface/icons/classicon_paladin.blp",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["rotation"] = 0,
["version"] = 3,
["xOffset"] = 149,
["sortHybridTable"] = {
["审判（目标）3秒高亮"] = false,
},
["borderInset"] = 1,
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
["authorOptions"] = {
},
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
["uid"] = "zbLk4g0jAZr",
["constantFactor"] = "RADIUS",
["sort"] = "none",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "圣骑士 动态分组 右",
["regionType"] = "dynamicgroup",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["arcLength"] = 360,
["config"] = {
},
["borderColor"] = {
0,
0,
0,
1,
},
["useLimit"] = true,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["radius"] = 200,
},
["圣骑士 核心分组"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"审判（3秒高亮）",
"神圣震击",
"神恩术",
"奉献",
"制裁之锤",
"圣盾术（可点击施法，左键开启，右键取消）",
"圣佑术（可点击施法）",
"愤怒之锤（可点击施法）",
"神圣之盾",
"神圣愤怒（可点击施法）",
"正义之怒（可点击施法，左键开启，右键取消）",
"神圣干涉（可点击施法）",
"圣疗术（可点击施法）",
"牺牲祝福（可点击施法）",
"自由祝福（可点击施法）",
"保护祝福（可点击施法）",
"忏悔（可点击施法）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["parent"] = "圣骑士（中心分组）",
["preferToUpdate"] = true,
["stepAngle"] = 15,
["yOffset"] = 0.5,
["anchorPoint"] = "CENTER",
["alpha"] = 1,
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
["borderColor"] = {
0,
0,
0,
1,
},
["rowSpace"] = 1,
["url"] = "",
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
["奉献（防护/惩戒）"] = false,
["神圣干涉（可点击施法）"] = false,
["愤怒之锤（防护/惩戒，可点击施法）"] = false,
["愤怒之锤（神圣，可点击施法）"] = false,
["保护祝福（可点击施法）"] = false,
["圣光道标（5秒补道标语音，可点击施法）"] = false,
["驱邪术（惩戒，可点击施法）"] = false,
["责难"] = false,
["圣盾术（可点击施法，左键开启，右键取消）"] = false,
["制裁之锤"] = false,
["复仇者之盾"] = false,
["神圣愤怒（可点击施法）"] = false,
["正义之怒（可点击施法，左键开启，右键取消）"] = false,
["神圣风暴"] = false,
["忏悔（可点击施法）"] = false,
["神圣震击（神圣）"] = false,
["审判（3秒高亮）"] = false,
["十字军打击"] = false,
["自由祝福（可点击施法）"] = false,
["神圣之盾（防护）"] = false,
["牺牲祝福（可点击施法）"] = false,
["神恩术（神圣）"] = false,
["圣佑术（可点击施法）"] = false,
["圣疗术（可点击施法）"] = false,
},
["selfPoint"] = "CENTER",
["align"] = "CENTER",
["growOn"] = "changed",
["fullCircle"] = true,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["rotation"] = 0,
["stagger"] = 0,
["version"] = 3,
["internalVersion"] = 90,
["useLimit"] = false,
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
["groupIcon"] = "interface/icons/classicon_paladin.blp",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["xOffset"] = 0,
["animate"] = false,
["customGrow"] = "function(newPositions, activeRegions)\n    local limits = { --icons per row\n        7, --row 1\n        9, --row 2\n        \n    }\n    local rows = #limits -- total rows (matches limits size)\n    local iconSizes = { --have to match #limits size (if limits is {x,y} iconSizes have to be {a, b}, i.e. 2 and 2)\n        40, --row 1\n        35, --row 2\n        \n    }\n    local spacings = {\n        1, --row 1\n        20, --row 2\n        \n    }\n    \n    -- spacing between icons\n    local checkFit = true --resize only if total clones > totalWidth. Otherwise 1-2 icons will be giga huge\n    ----------------------\n    local check = true\n    \n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    local lastRowCount = 0\n    \n    local limit = limits[yCount+1]\n    local firstRowLimit = limits[yCount+1]\n    \n    local xSpacing = 3\n    local ySpacing = spacings[yCount+1]\n    local offset = spacings[yCount+1]\n    \n    local xOffset = 0\n    local yOffset = 0\n    \n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        \n        local region = regionData.region\n        if iconSizes[yCount+1] then\n            regionData.region:SetRegionWidth(iconSizes[yCount+1])\n            regionData.region:SetRegionHeight(iconSizes[yCount+1])\n        end\n        \n        local why = 0\n        for i=1, yCount+1 do\n            local wtf = (i==1 or i==yCount+1) and iconSizes[i]/2 or iconSizes[i]\n            why = why + wtf\n        end\n        local shift = yCount == 0 and 0 or why + offset\n        \n        local width = width or region.width\n        local totalWidth = totalWidth or (width + xSpacing) * limit\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= firstRowLimit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows - 1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        if yCount == rows - 1 then\n            local fit = checkFit and (width + xSpacing) * rowTotal < totalWidth\n            local lastRowWidth = fit and width or ((totalWidth - (rowTotal * xSpacing)) / rowTotal)\n            \n            xOffset = 0 - (lastRowWidth + xSpacing) / 2 * (rowTotal - 1) + (lastRowCount * (lastRowWidth + xSpacing))\n            yOffset = 0 - (shift - (width - lastRowWidth) / 2)-- change '-' to '+' after 0 to grow up instead of down\n            \n            lastRowCount = lastRowCount + 1\n            \n            regionData.region:SetRegionWidth(lastRowWidth)\n            regionData.region:SetRegionHeight(lastRowWidth)\n        else\n            xOffset = 0 - (width + xSpacing) / 2 * (rowTotal - 1) + (xCount * (width + xSpacing))\n            yOffset = 0 - shift\n        end\n        \n        xCount = xCount + 1\n        \n        if yCount < rows - 1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n                limit = limits[yCount+1]\n                ySpacing = spacings[yCount+1]\n                offset = offset + ySpacing\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend",
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
["tocversion"] = 11500,
["id"] = "圣骑士 核心分组",
["sort"] = "none",
["gridWidth"] = 5,
["anchorFrameType"] = "SCREEN",
["space"] = 3,
["config"] = {
},
["uid"] = "azclHDeQc0V",
["authorOptions"] = {
},
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["grow"] = "CUSTOM",
},
["圣骑士（中心分组）"] = {
["controlledChildren"] = {
"圣骑士 动态分组 左",
"圣骑士 动态分组 右",
"圣骑士 核心分组",
"骑士 底部分组",
"圣骑士 资源条",
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
["url"] = "",
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
["desc"] = "",
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
["xOffset"] = 0,
["borderOffset"] = 5,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "圣骑士（中心分组）",
["selfPoint"] = "CENTER",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["parent"] = "圣骑士",
["config"] = {
},
["uid"] = "geCsjVbWZFG",
["borderInset"] = 11,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["groupOffset"] = false,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["groupIcon"] = "interface/icons/classicon_paladin.blp",
},
["神圣之盾"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"20925",
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
["realSpellName"] = "神圣之盾",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 20925,
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
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_anchorYOffset"] = 0,
["text_color"] = {
1,
0.88627450980392,
0.76862745098039,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_format"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fontType"] = "OUTLINE",
["anchor_point"] = "TOP",
["text_fontSize"] = 26,
["anchorXOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
},
},
["height"] = 35,
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
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 20925,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["cooldownEdge"] = false,
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
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "JFB852Y8Onb",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "神圣之盾",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 35,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = false,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 神圣之盾\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff92c2神圣之盾|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["骑士 底部分组"] = {
["arcLength"] = 360,
["controlledChildren"] = {
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["stepAngle"] = 15,
["yOffset"] = -95.03174596715854,
["gridType"] = "RD",
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
["borderColor"] = {
0,
0,
0,
1,
},
["rowSpace"] = 1,
["url"] = "",
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
["parent"] = "圣骑士（中心分组）",
["useLimit"] = false,
["align"] = "CENTER",
["growOn"] = "",
["space"] = 3,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["rotation"] = 0,
["stagger"] = 0,
["version"] = 3,
["internalVersion"] = 90,
["xOffset"] = 0,
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
["groupIcon"] = "interface/icons/classicon_paladin.blp",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["anchorPoint"] = "CENTER",
["source"] = "import",
["customGrow"] = "",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 5,
["gridWidth"] = 5,
["animate"] = false,
["constantFactor"] = "RADIUS",
["sortHybridTable"] = {
},
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "骑士 底部分组",
["sort"] = "none",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["selfPoint"] = "CENTER",
["config"] = {
},
["uid"] = "GwCHhGJlHn)",
["fullCircle"] = true,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["grow"] = "HORIZONTAL",
},
["神圣愤怒（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
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
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "神圣愤怒",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 2812,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 35,
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
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 2812,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["cooldownEdge"] = false,
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
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "wm4Dw0sjnLd",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "神圣愤怒（可点击施法）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 35,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 神圣愤怒\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffff92c2神圣愤怒|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["审判（3秒高亮）"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["track"] = "auto",
["type"] = "spell",
["debuffType"] = "HELPFUL",
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Spell)",
["subeventPrefix"] = "SPELL",
["use_showgcd"] = false,
["use_spellName"] = true,
["spellIds"] = {
},
["names"] = {
},
["genericShowOn"] = "showAlways",
["realSpellName"] = "审判",
["use_track"] = true,
["spellName"] = 20271,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 35,
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
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 20271,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["cooldownEdge"] = false,
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
["trigger"] = -2,
["variable"] = "AND",
["op"] = "<=",
["checks"] = {
{
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = ">",
["value"] = "0",
},
{
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<=",
["value"] = "3",
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
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "dOqQuI1cV7k",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "审判（3秒高亮）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 35,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
},
["圣印组合集（无圣印提示，露露语音）"] = {
["iconSource"] = -1,
["parent"] = "圣骑士 动态分组 左",
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = false,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 保护之手\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff92c2保护之手|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
["triggers"] = {
{
["trigger"] = {
["auranames"] = {
"21084",
"407798",
"20164",
"20166",
"20165",
"20375",
"20306",
},
["matchesShowOn"] = "showAlways",
["genericShowOn"] = "showAlways",
["names"] = {
},
["spellName"] = 10278,
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["event"] = "Cooldown Progress (Spell)",
["ownOnly"] = true,
["realSpellName"] = "保护之手",
["use_spellName"] = true,
["spellIds"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["use_genericShowOn"] = true,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["use_unit"] = true,
["use_ingroup"] = false,
["ingroup"] = {
["multi"] = {
["group"] = true,
["raid"] = true,
},
},
["debuffType"] = "HELPFUL",
["event"] = "Conditions",
["unit"] = "player",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[1]\nend",
["activeTriggerMode"] = 1,
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
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
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
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 3,
["text_text_format_p_time_legacy_floor"] = false,
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
0,
0,
1,
},
["glowThickness"] = 1,
["glow"] = false,
["glowScale"] = 1.7,
["useGlowColor"] = true,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["use_vehicle"] = false,
["class"] = {
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["use_vehicleUi"] = false,
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 21084,
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
["authorOptions"] = {
},
["color"] = {
1,
1,
1,
1,
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["desaturate"] = false,
["icon"] = true,
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
["uid"] = "itq(sb63Sip",
["anchorFrameParent"] = false,
["width"] = 32,
["frameStrata"] = 1,
["zoom"] = 0.3,
["cooldownEdge"] = false,
["tocversion"] = 11500,
["id"] = "圣印组合集（无圣印提示，露露语音）",
["useCooldownModRate"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
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
["property"] = "sub.3.glow",
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
["variable"] = "expirationTime",
["value"] = "60",
["op"] = "<",
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.text_visible",
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
["trigger"] = 2,
["variable"] = "show",
["value"] = 1,
},
},
},
["changes"] = {
{
["value"] = {
["sound_type"] = "Play",
["sound"] = " custom",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】圣印.ogg",
["sound_channel"] = "Master",
},
["property"] = "sound",
},
},
},
},
["cooldown"] = false,
["adjustedMax"] = "",
},
["圣佑术（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useMatch_count"] = true,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["subeventPrefix"] = "SPELL",
["useName"] = true,
["spellIds"] = {
},
["auranames"] = {
"498",
},
["match_count"] = "0",
["match_countOperator"] = ">",
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
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "圣佑术",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 498,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 35,
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
["single"] = "PALADIN",
["multi"] = {
},
},
["zoneIds"] = "",
["use_not_spellknown"] = true,
["use_class"] = true,
["use_spellknown"] = true,
["not_spellknown"] = 642,
["use_spec"] = true,
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 498,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["cooldownEdge"] = false,
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
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "dugg6x5mNhX",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "圣佑术（可点击施法）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 35,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 圣佑术\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\"|cffff92c2圣佑术|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["正义之怒（可点击施法，左键开启，右键取消）"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["parent"] = "圣骑士 核心分组",
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
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 正义之怒\")\nbtn:SetAttribute(\"macrotext2\",\"/cancelaura 正义之怒\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff左键：|r|cffff92c2正义之怒\\n|cffffffff右键：|r|cffff92c2取消正义之怒|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
["triggers"] = {
{
["trigger"] = {
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"25780",
},
["duration"] = "1",
["names"] = {
},
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["unevent"] = "auto",
["use_unit"] = true,
["spellIds"] = {
},
["matchesShowOn"] = "showAlways",
["type"] = "aura2",
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["unit"] = "player",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    if t[3] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.righteous_fury.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2]\n    else -- Always Show\n        return true\n    end\nend",
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
["glowThickness"] = 1,
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 35,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
[47] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "PALADIN",
["multi"] = {
},
},
["spellknown"] = 25780,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 35,
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
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["preset"] = "shrink",
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
["icon"] = true,
["config"] = {
["maintenance"] = {
["righteous_fury"] = {
["behavior"] = 2,
},
},
},
["color"] = {
1,
1,
1,
1,
},
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "正义之怒（可点击施法，左键开启，右键取消）",
["auto"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "11Idy1tEL(W",
["inverse"] = false,
["url"] = "",
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
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["authorOptions"] = {
{
["subOptions"] = {
{
["type"] = "header",
["useName"] = true,
["text"] = "行为",
["noMerge"] = false,
["width"] = 1,
},
{
["subOptions"] = {
{
["text"] = "正义之怒",
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
["name"] = "行为",
["useDesc"] = false,
["key"] = "behavior",
["width"] = 1,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["name"] = "正义之怒",
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["collapse"] = false,
["type"] = "group",
["limitType"] = "none",
["groupType"] = "simple",
["key"] = "righteous_fury",
["size"] = 10,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["name"] = "常驻图标",
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
["牺牲祝福（可点击施法）"] = {
["iconSource"] = -1,
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
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 牺牲祝福\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffff92c2牺牲祝福|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
["triggers"] = {
{
["trigger"] = {
["track"] = "auto",
["auranames"] = {
"6940",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["unit"] = "group",
["ignoreSelf"] = true,
["group_count"] = "0",
["ignoreInvisible"] = false,
["debuffType"] = "HELPFUL",
["spellName"] = 6940,
["useName"] = true,
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["useGroup_count"] = true,
["event"] = "Cooldown Progress (Spell)",
["type"] = "aura2",
["realSpellName"] = "牺牲之手",
["use_spellName"] = true,
["spellIds"] = {
},
["ignoreDisconnected"] = true,
["ignoreDead"] = true,
["ownOnly"] = true,
["use_track"] = true,
["group_countOperator"] = ">",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["type"] = "spell",
["debuffType"] = "HELPFUL",
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Spell)",
["subeventPrefix"] = "SPELL",
["realSpellName"] = "牺牲祝福",
["use_spellName"] = true,
["spellIds"] = {
},
["unit"] = "player",
["genericShowOn"] = "showAlways",
["use_exact_spellName"] = false,
["use_track"] = true,
["spellName"] = 6940,
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
["desc"] = "",
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
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 3,
["text_text_format_p_time_legacy_floor"] = false,
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowXOffset"] = 0,
["glowType"] = "Pixel",
["glowLength"] = 15,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 2,
["glow"] = false,
["glowScale"] = 1.7,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 6,
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
["single"] = "PALADIN",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 6940,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["desaturate"] = false,
["useTooltip"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["xOffset"] = 0,
["icon"] = true,
["uid"] = "vcVR8Ga2O4n",
["url"] = "",
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
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["tocversion"] = 11500,
["id"] = "牺牲祝福（可点击施法）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
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
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.3.glow",
},
{
["property"] = "desaturate",
},
{
["value"] = 1,
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
["property"] = "inverse",
},
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
},
["cooldown"] = true,
["adjustedMax"] = "",
},
["清算"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
["actions"] = {
["start"] = {
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!Wind-OnePlusLight.ogg",
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
["subeventSuffix"] = "_CAST_START",
["auranames"] = {
"20178",
},
["unit"] = "player",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["unitExists"] = false,
["matchesShowOn"] = "showOnActive",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["auraspellids"] = {
},
["type"] = "aura2",
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
["version"] = 6,
["subRegions"] = {
{
["type"] = "subbackground",
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
0,
0,
1,
},
["glowThickness"] = 2,
["glow"] = true,
["glowScale"] = 2,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "清算",
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
["text_text_format_p_time_dynamic_threshold"] = 60,
["anchorYOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 1,
["text_color"] = {
0.960784375667572,
0.5490196347236633,
0.729411780834198,
1,
},
["text_font"] = "Rurutia",
["text_shadowXOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_p_time_format"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_shadowYOffset"] = 0,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
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
["text_text_format_p_format"] = "timed",
["anchorXOffset"] = 0,
["type"] = "subtext",
["text_text_format_p_time_precision"] = 1,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_mod_rate"] = true,
["text_anchorYOffset"] = 0,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["text_shadowYOffset"] = 0,
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_legacy_floor"] = false,
},
},
["height"] = 30,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
[35] = true,
[45] = true,
},
},
["class"] = {
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["race"] = {
},
["size"] = {
["multi"] = {
},
},
["use_spec"] = true,
["use_spellknown"] = false,
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
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
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
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
["xOffset"] = 0,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "骑士（BUFF）",
["uid"] = "JNPde9WCKd0",
["desc"] = "",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["icon"] = true,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.0",
["tocversion"] = 30400,
["id"] = "清算",
["zoom"] = 0.3,
["alpha"] = 1,
["width"] = 30,
["frameStrata"] = 1,
["config"] = {
},
["inverse"] = false,
["selfPoint"] = "CENTER",
["conditions"] = {
},
["cooldown"] = true,
["cooldownEdge"] = false,
},
["制裁之锤"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"853",
},
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["spellIds"] = {
},
["type"] = "aura2",
["unit"] = "target",
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
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "制裁之锤",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 853,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 35,
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
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 20271,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["cooldownEdge"] = false,
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
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "mNiyKDwoCue",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "制裁之锤",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 35,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = false,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 制裁之锤\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff92c2制裁之锤|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["忏悔（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"20066",
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "target",
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
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "忏悔",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 20066,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 35,
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
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 20066,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["cooldownEdge"] = false,
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
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "O9boNGxkDME",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "忏悔（可点击施法）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 35,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 忏悔\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffff92c2忏悔|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["自由祝福（可点击施法）"] = {
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
["auranames"] = {
"1044",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["ownOnly"] = true,
["realSpellName"] = "自由之手",
["use_spellName"] = true,
["spellIds"] = {
},
["useName"] = true,
["subeventPrefix"] = "SPELL",
["names"] = {
},
["use_track"] = true,
["spellName"] = 1044,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "spell",
["spellName"] = 1044,
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["use_exact_spellName"] = false,
["realSpellName"] = "自由祝福",
["use_spellName"] = true,
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["unit"] = "player",
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
["selfPoint"] = "CENTER",
["desc"] = "",
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
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 3,
["text_text_format_p_time_legacy_floor"] = false,
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowXOffset"] = 0,
["glowType"] = "Pixel",
["glowLength"] = 15,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 2,
["glow"] = false,
["glowScale"] = 1.7,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 6,
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
["single"] = "PALADIN",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 1044,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["desaturate"] = false,
["useTooltip"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 自由祝福\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffff92c2自由祝福|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
["uid"] = "AIxFxS7ZJtf",
["url"] = "",
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
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
["zoom"] = 0.3,
["frameStrata"] = 1,
["tocversion"] = 11500,
["id"] = "自由祝福（可点击施法）",
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["progressSource"] = {
-1,
"",
},
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
["property"] = "sub.3.glow",
},
{
["property"] = "desaturate",
},
{
["value"] = 1,
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
["property"] = "inverse",
},
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
},
["cooldown"] = true,
["adjustedMax"] = "",
},
["圣盾术"] = {
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
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["use_debuffClass"] = false,
["useExactSpellId"] = false,
["ownOnly"] = true,
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
"642",
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
["desaturate"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
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
["glowThickness"] = 2,
["glowScale"] = 1,
["glow"] = true,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "无敌",
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
0.960784375667572,
0.5490196347236633,
0.729411780834198,
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
},
["height"] = 30,
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
["use_spellknown"] = false,
["use_itemequiped"] = false,
["class"] = {
["single"] = "PALADIN",
["multi"] = {
},
},
["spellknown"] = 642,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["parent"] = "骑士（BUFF）",
["actions"] = {
["start"] = {
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!Wind-OnePlusLight.ogg",
["do_sound"] = true,
},
["init"] = {
},
["finish"] = {
},
},
["cooldown"] = true,
["displayIcon"] = 135896,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["desc"] = "",
["uid"] = "oSExkPs0lRV",
["cooldownEdge"] = false,
["anchorFrameParent"] = false,
["alpha"] = 1,
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
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["tocversion"] = 20501,
["id"] = "圣盾术",
["useCooldownModRate"] = true,
["frameStrata"] = 1,
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
["authorOptions"] = {
},
},
["圣骑士 动态分组 左"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"单人未上祝福提示",
"盾牌壁垒",
"圣印组合集（无圣印提示，露露语音）",
"骑士光环未开提醒（露露语音）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["xOffset"] = -149,
["preferToUpdate"] = true,
["yOffset"] = 24,
["sortHybridTable"] = {
["清算之手"] = false,
["圣印组合集（无圣印提示，露露语音）"] = false,
},
["stepAngle"] = 15,
["frameStrata"] = 1,
["borderColor"] = {
0,
0,
0,
1,
},
["space"] = 3,
["url"] = "",
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
["stagger"] = 0,
["useLimit"] = true,
["align"] = "CENTER",
["selfPoint"] = "BOTTOMLEFT",
["arcLength"] = 360,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["rotation"] = 0,
["authorOptions"] = {
},
["version"] = 3,
["internalVersion"] = 90,
["gridType"] = "RU",
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
["groupIcon"] = "interface/icons/classicon_paladin.blp",
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
["customGrow"] = "function(newPositions, activeRegions)\n    local limit = 10 -- limit of icons per row\n    local rows = 1 -- total rows\n    local spacing = 3 -- spacing between icons\n    ----------------------\n    local check = true\n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    \n    local xOffset = 0\n    local yOffset = 0\n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        local region = regionData.region\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= limit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows-1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        xOffset = 0 - (region.width + spacing) / 2 * (rowTotal-1) + (xCount * (region.width + spacing))\n        yOffset = 0 + (region.height + spacing) * yCount -- change '-' to '+' after 0 to grow up instead of down\n        \n        xCount = xCount + 1\n        \n        if yCount < rows-1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend\n\n",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 6,
["gridWidth"] = 4,
["source"] = "import",
["constantFactor"] = "RADIUS",
["uid"] = "ZkTSqQ8gdIT",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "圣骑士 动态分组 左",
["sort"] = "none",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["rowSpace"] = 5,
["config"] = {
},
["anchorPoint"] = "CENTER",
["fullCircle"] = true,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["parent"] = "圣骑士（中心分组）",
},
["神恩术"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"20216",
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
["realSpellName"] = "神恩术",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 20216,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 35,
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
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 20216,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["cooldownEdge"] = false,
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
{
["value"] = 0.5,
["property"] = "alpha",
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
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "LXNOK)ipf6Y",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "神恩术",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 35,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = false,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 神恩术\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffff92c2神恩术|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["超度亡灵（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
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
["url"] = "",
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 超度亡灵\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffff92c2超度亡灵|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
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
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 2878,
["realSpellName"] = "超度亡灵",
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
{
["trigger"] = {
["use_namerealm"] = false,
["type"] = "custom",
["use_hostility"] = false,
["custom_type"] = "status",
["use_factionID"] = true,
["use_character"] = true,
["event"] = "Unit Characteristics",
["use_unit"] = true,
["use_class"] = false,
["character"] = "npc",
["custom"] = "function()\n    if not UnitExists(\"target\") or UnitHealth(\"target\") <= 0 then \n        return false \n    end\n    \n    local cType = UnitCreatureType(\"target\")\n    if cType == \"亡灵\" or cType == \"恶魔\" then\n        return true\n    end\n    \n    return false\nend",
["unit"] = "target",
["check"] = "update",
["classification"] = {
},
["events"] = "PLAYER_TARGET_CHANGED, UNIT_HEALTH, UNIT_FLAGS",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
["custom"] = "function()\n    if not UnitExists(\"target\") or UnitHealth(\"target\") <= 0 then \n        return true \n    end\n    \n    local cType = UnitCreatureType(\"target\")\n    if cType ~= \"亡灵\" and cType ~= \"恶魔\" then\n        return true\n    end\n    \n    return false\nend\n\n\n",
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
["glow"] = false,
["glowScale"] = 1,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
[39] = true,
[48] = true,
},
},
["class"] = {
["single"] = "PALADIN",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = false,
["use_spec"] = true,
["use_vehicleUi"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_never"] = false,
["spellknown"] = 2878,
["zoneIds"] = "",
},
["frameStrata"] = 1,
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
["parent"] = "圣骑士 动态分组 右",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["selfPoint"] = "CENTER",
["width"] = 30,
["anchorFrameParent"] = false,
["cooldownEdge"] = false,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "超度亡灵（可点击施法）",
["zoom"] = 0.3,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "SP9maDWB(3a",
["inverse"] = true,
["icon"] = true,
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
["authorOptions"] = {
},
},
["愤怒之锤（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
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
["spellName"] = 24275,
["realSpellName"] = "愤怒之锤",
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
{
["trigger"] = {
["debuffType"] = "HELPFUL",
["type"] = "unit",
["use_unit"] = true,
["talent"] = {
["single"] = 12,
},
["use_talent"] = true,
["use_spec"] = true,
["event"] = "Talent Known",
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
["glowScale"] = 1,
["glowThickness"] = 1,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 35,
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
["single"] = "PALADIN",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["role"] = {
["single"] = "HEALER",
["multi"] = {
["DAMAGER"] = true,
["TANK"] = true,
["HEALER"] = true,
},
},
["use_spellknown"] = true,
["use_spec"] = true,
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 24275,
["zoneIds"] = "",
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["cooldownEdge"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 愤怒之锤\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffff92c2愤怒之锤|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
["width"] = 35,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "愤怒之锤（可点击施法）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["uid"] = "87AeLQu7I(u",
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
["variable"] = "spellUsable",
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
{
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 1,
["op"] = ">",
["variable"] = "spellUsable",
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
["selfPoint"] = "CENTER",
},
["单人未上祝福提示"] = {
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
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"19740",
"25916",
"19742",
"25918",
"19979",
"25890",
"25898",
"20217",
"25899",
"20951",
"1022",
"1044",
"6940",
},
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["unit"] = "player",
["names"] = {
},
["spellIds"] = {
},
["use_itemName"] = true,
["type"] = "aura2",
["matchesShowOn"] = "showOnMissing",
["unevent"] = "auto",
["use_unit"] = true,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["unit"] = "player",
["use_resting"] = false,
["debuffType"] = "HELPFUL",
["use_unit"] = true,
["event"] = "Conditions",
["use_mounted"] = false,
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "function(t)\n    return (t[1] and t[4]) or (t[2] and t[3])\nend",
["activeTriggerMode"] = 1,
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
["useCooldownModRate"] = true,
["version"] = 14,
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
["glowThickness"] = 2,
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
["ingroup"] = {
["multi"] = {
["solo"] = true,
},
},
["talent"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_ingroup"] = false,
["use_spellknown"] = true,
["class"] = {
["single"] = "PALADIN",
["multi"] = {
},
},
["spellknown"] = 19740,
["size"] = {
["multi"] = {
},
},
},
["color"] = {
1,
1,
1,
1,
},
["authorMode"] = true,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["source"] = "import",
["displayIcon"] = "",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["parent"] = "圣骑士 动态分组 左",
["config"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["useAdjustededMax"] = false,
["width"] = 32,
["frameStrata"] = 1,
["adjustedMax"] = "",
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["semver"] = "2.0.11",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "单人未上祝福提示",
["url"] = "",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["useTooltip"] = false,
["uid"] = "Qxt3NyAIyw7",
["inverse"] = false,
["selfPoint"] = "CENTER",
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
["cooldown"] = true,
["xOffset"] = 0,
},
["骑士光环未开提醒（露露语音）"] = {
["iconSource"] = -1,
["wagoID"] = "Hv4l1m9Je",
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
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"643",
"7294",
"19746",
"19876",
"19888",
"19891",
"20218",
},
["ownOnly"] = true,
["unit"] = "player",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["names"] = {
},
["subeventPrefix"] = "SPELL",
["duration"] = "1",
["spellIds"] = {
},
["use_itemName"] = true,
["useName"] = true,
["unevent"] = "auto",
["use_unit"] = true,
["matchesShowOn"] = "showOnMissing",
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
["desaturate"] = true,
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
["glow"] = false,
["glowScale"] = 1,
["glowThickness"] = 3,
["glowXOffset"] = 0,
["useGlowColor"] = true,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_text_format_p_time_precision"] = 1,
["text_text"] = "露露：你光环没开",
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
0.95686274509804,
0.54901960784314,
0.72941176470588,
1,
},
["text_font"] = "Rurutia",
["text_shadowXOffset"] = 1,
["text_shadowYOffset"] = -1,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 30,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["text_shadowXOffset"] = 1,
["text_text"] = "光环",
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
["text_anchorXOffset"] = 1,
["text_color"] = {
0.95686274509804,
0.54901960784314,
0.72941176470588,
1,
},
["text_font"] = "Rurutia",
["text_visible"] = true,
["text_shadowYOffset"] = -1,
["anchorXOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "TOP",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
},
},
["height"] = 32,
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["use_vehicle"] = false,
["class"] = {
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["use_vehicleUi"] = false,
["spec"] = {
["multi"] = {
},
},
["use_alive"] = true,
["spellknown"] = 643,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["parent"] = "圣骑士 动态分组 左",
["authorOptions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["adjustedMax"] = "",
["animation"] = {
["start"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["translateType"] = "shake",
["duration"] = "1",
["alphaType"] = "straight",
["colorB"] = 1,
["colorG"] = 1,
["alphaFunc"] = "function(progress, start, delta)\n    return start + (progress * delta)\nend\n",
["use_translate"] = false,
["use_alpha"] = true,
["type"] = "custom",
["easeType"] = "none",
["translateFunc"] = "function(progress, startX, startY, deltaX, deltaY)\n    local prog\n    if(progress < 0.25) then\n        prog = progress * 4\n    elseif(progress < .75) then\n        prog = 2 - (progress * 4)\n    else\n        prog = (progress - 1) * 4\n    end\n    return startX + (prog * deltaX), startY + (prog * deltaY)\nend\n",
["preset"] = "alphaPulse",
["alpha"] = 0.3,
["duration_type"] = "seconds",
["y"] = 0,
["x"] = 0,
["scalex"] = 1,
["easeStrength"] = 3,
["scaley"] = 1,
["rotate"] = 0,
["colorA"] = 1,
["colorR"] = 1,
},
["finish"] = {
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["uid"] = "syZFr(FbVAA",
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
["progressSource"] = {
-1,
"",
},
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30403,
["id"] = "骑士光环未开提醒（露露语音）",
["cooldownTextDisabled"] = true,
["alpha"] = 1,
["width"] = 32,
["frameStrata"] = 1,
["config"] = {
},
["inverse"] = false,
["url"] = "",
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
{
["value"] = {
["sound_type"] = "Play",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】光环.ogg",
["sound"] = " custom",
["sound_channel"] = "Master",
},
["property"] = "sound",
},
},
},
},
["cooldown"] = false,
["color"] = {
1,
1,
1,
1,
},
},
["圣骑士"] = {
["controlledChildren"] = {
"骑士（BUFF）",
"圣骑士（中心分组）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 0,
["groupIcon"] = "classicon-paladin",
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
["desc"] = "",
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
["borderInset"] = 1,
["id"] = "圣骑士",
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
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["authorOptions"] = {
},
["config"] = {
},
["uid"] = "2XySvcIzl2V",
["alpha"] = 1,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
},
["yOffset"] = 0,
},
["神圣震击"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
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
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "神圣震击",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 20473,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 35,
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
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = false,
["zoneIds"] = "",
["use_spec"] = true,
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 20473,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["cooldownEdge"] = false,
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
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "zh4qrqJ8WQJ",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "神圣震击",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 35,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
},
["神圣干涉（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
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
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "神圣干涉",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 19752,
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
["easeType"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["preset"] = "shrink",
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 35,
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
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["zoneIds"] = "",
["use_spec"] = true,
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 19752,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["cooldownEdge"] = false,
["cooldown"] = true,
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
["parent"] = "圣骑士 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "JsOjbbfvqRZ",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "神圣干涉（可点击施法）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 35,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 神圣干涉\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffff92c2神圣干涉|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["驱邪术（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "Tvh1vQwF4",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
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
["remaining"] = "3",
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["use_genericShowOn"] = true,
["names"] = {
},
["event"] = "Cooldown Progress (Spell)",
["remaining_operator"] = "<",
["realSpellName"] = "驱邪术",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["spellName"] = 879,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["use_remaining"] = false,
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"59578",
},
["unit"] = "player",
["events"] = "PLAYER_TARGET_CHANGED, UNIT_HEALTH, UNIT_FLAGS",
["custom"] = "function()\n    if not UnitExists(\"target\") or UnitHealth(\"target\") <= 0 then \n        return false \n    end\n    \n    local cType = UnitCreatureType(\"target\")\n    if cType == \"亡灵\" or cType == \"恶魔\" then\n        return true\n    end\n    \n    return false\nend",
["check"] = "update",
["type"] = "custom",
["custom_type"] = "status",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
["custom"] = "function()\n    if not UnitExists(\"target\") or UnitHealth(\"target\") <= 0 then \n        return true \n    end\n    \n    local cType = UnitCreatureType(\"target\")\n    if cType ~= \"亡灵\" and cType ~= \"恶魔\" then\n        return true\n    end\n    \n    return false\nend\n\n\n\n\n",
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "function(t)\n    return t[5]\nend",
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
[105] = true,
},
},
["class"] = {
["single"] = "PALADIN",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = false,
["zoneIds"] = "",
["use_spec"] = true,
["use_never"] = false,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 879,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["cooldownEdge"] = false,
["cooldown"] = true,
["conditions"] = {
},
["parent"] = "圣骑士 动态分组 右",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "JQ8WqCGqlwT",
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "驱邪术（可点击施法）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 30,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 驱邪术\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffff92c2驱邪术|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["骑士（BUFF）"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"圣盾术",
"正义之怒未开（防护）",
"自律（三系）",
"清算",
"复仇（惩戒）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["parent"] = "圣骑士",
["preferToUpdate"] = true,
["groupIcon"] = "interface/icons/classicon_paladin.blp",
["anchorPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["space"] = 2,
["url"] = "",
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
["useLimit"] = true,
["align"] = "CENTER",
["borderInset"] = 1,
["stagger"] = 0,
["desc"] = "",
["rotation"] = 0,
["radius"] = 200,
["authorOptions"] = {
},
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
["xOffset"] = 142,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["uid"] = "63kOxQurMux",
["source"] = "import",
["yOffset"] = 20,
["scale"] = 1.1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 10,
["stepAngle"] = 15,
["alpha"] = 1,
["anchorFrameParent"] = false,
["constantFactor"] = "RADIUS",
["gridWidth"] = 5,
["borderOffset"] = 4,
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
["gridType"] = "RD",
["id"] = "骑士（BUFF）",
["sort"] = "none",
["frameStrata"] = 1,
["anchorFrameType"] = "UIPARENT",
["animate"] = false,
["config"] = {
},
["fullCircle"] = true,
["sortHybridTable"] = {
["圣盾术（圣骑士）"] = false,
["正义之怒（防护）"] = false,
["炽热防御者（防护，春哥，白字）"] = false,
["复仇之怒（圣骑士，露露语音）"] = false,
},
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["rowSpace"] = 35,
},
["5秒回蓝（骑士）"] = {
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
["url"] = "",
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
["single"] = "PALADIN",
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
["uid"] = "XojahFnAxOz",
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "XoGkZt2VR",
["parent"] = "圣骑士 资源条",
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
["text_visible"] = true,
["anchor_point"] = "INNER_RIGHT",
["text_fontSize"] = 12,
["anchorXOffset"] = 0,
["anchorYOffset"] = 0,
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
["id"] = "5秒回蓝（骑士）",
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
},
}
