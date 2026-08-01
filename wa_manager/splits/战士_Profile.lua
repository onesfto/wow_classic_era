
WeakAurasSaved = {
["editor_tab_spaces"] = 4,
["login_squelch_time"] = 10,
["PULL(Need DBM BW ERT)PULL"] = 5,
["dbVersion"] = 90,
["标记目标 Mark TargetSet"] = false,
["displays"] = {
["战斗怒吼（缺失文字）"] = {
["outline"] = "OUTLINE",
["authorOptions"] = {
},
["displayText_format_p_time_dynamic_threshold"] = 60,
["yOffset"] = 150,
["anchorPoint"] = "CENTER",
["displayText_format_p_time_format"] = 0,
["customTextUpdate"] = "event",
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
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showOnMissing",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["auranames"] = {
"11549",
},
["unit"] = "player",
["names"] = {
},
["useName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = -10,
},
["displayText_format_p_format"] = "timed",
["internalVersion"] = 90,
["selfPoint"] = "BOTTOM",
["desc"] = "",
["font"] = "Rurutia",
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
["spec"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
},
},
["use_combat"] = true,
["spellknown"] = 11549,
["size"] = {
["multi"] = {
},
},
},
["fontSize"] = 24,
["shadowXOffset"] = 1,
["displayText_format_p_time_legacy_floor"] = false,
["regionType"] = "text",
["animation"] = {
["start"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
["main"] = {
["colorR"] = 1,
["duration_type"] = "seconds",
["alphaType"] = "alphaPulse",
["colorB"] = 1,
["colorG"] = 1,
["alphaFunc"] = "function(progress, start, delta)\n    local angle = (progress * 2 * math.pi) - (math.pi / 2)\n    return start + (((math.sin(angle) + 1)/2) * delta)\nend\n",
["duration"] = "1",
["use_translate"] = false,
["use_alpha"] = true,
["preset"] = "alphaPulse",
["type"] = "custom",
["rotate"] = 0,
["easeType"] = "easeOutIn",
["translateFunc"] = "function(progress, startX, startY, deltaX, deltaY)\n    local prog\n    if(progress < 0.25) then\n        prog = progress * 4\n    elseif(progress < .75) then\n        prog = 2 - (progress * 4)\n    else\n        prog = (progress - 1) * 4\n    end\n    return startX + (prog * deltaX), startY + (prog * deltaY)\nend\n",
["use_color"] = false,
["alpha"] = 0.5,
["colorType"] = "straightColor",
["y"] = 0,
["x"] = 0,
["translateType"] = "shake",
["colorA"] = 1,
["colorFunc"] = "function(progress, r1, g1, b1, a1, r2, g2, b2, a2)\n    return r1 + (progress * (r2 - r1)), g1 + (progress * (g2 - g1)), b1 + (progress * (b2 - b1)), a1 + (progress * (a2 - a1))\nend\n",
["easeStrength"] = 1,
["scaley"] = 1,
["scalex"] = 1,
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["displayText"] = "** 缺少战斗怒吼 **",
["conditions"] = {
},
["color"] = {
1,
0,
0,
1,
},
["displayText_format_p_time_precision"] = 1,
["shadowYOffset"] = -1,
["config"] = {
},
["parent"] = "战士",
["justify"] = "LEFT",
["tocversion"] = 11508,
["id"] = "战斗怒吼（缺失文字）",
["wordWrap"] = "WordWrap",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["uid"] = "Kt(idKxUxyv",
["displayText_format_p_time_mod_rate"] = true,
["preferToUpdate"] = false,
["shadowColor"] = {
0,
0,
0,
1,
},
["fixedWidth"] = 200,
["information"] = {
["showNilIsFalse"] = true,
},
["automaticWidth"] = "Auto",
},
["斩杀（狂怒/武器）"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["spellName"] = 5308,
["realSpellName"] = "斩杀",
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
["single"] = 87,
},
["use_inverse"] = true,
["event"] = "Talent Known",
["unit"] = "player",
["use_spec"] = true,
["use_unit"] = true,
["use_talent"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
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
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 5308,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "斩杀（狂怒/武器）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "5w8xf3qLS42",
["inverse"] = true,
["icon"] = true,
["conditions"] = {
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
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
},
["cooldown"] = true,
["keepAspectRatio"] = true,
},
["盾牌猛击"] = {
["iconSource"] = 0,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"23922",
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["unit"] = "player",
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
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 23922,
["realSpellName"] = "盾牌猛击",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
[98] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
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
["spellknown"] = 23922,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = 134951,
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "盾牌猛击",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "KaVqf4KCgep",
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
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
{
["property"] = "color",
},
{
["property"] = "desaturate",
},
},
},
},
["cooldown"] = true,
["keepAspectRatio"] = true,
},
["战士 怒气条"] = {
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
["adjustedMax"] = "",
["yOffset"] = -4,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "",
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
0.6901960968971252,
0,
0,
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
["faction"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "WARRIOR",
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
["use_vehicleUi"] = false,
["pvptalent"] = {
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
["tocversion"] = 11508,
["alpha"] = 1,
["sparkColor"] = {
1,
0.94901960784314,
0,
1,
},
["borderBackdrop"] = "None",
["wagoID"] = "tRi9estlC",
["parent"] = "战士 资源条",
["adjustedMin"] = "",
["sparkRotationMode"] = "MANUAL",
["triggers"] = {
{
["trigger"] = {
["ownOnly"] = true,
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "SPELL",
["powertype"] = 1,
["use_powertype"] = true,
["spellName"] = 200183,
["custom_hide"] = "timed",
["type"] = "unit",
["unit"] = "player",
["unevent"] = "auto",
["use_showOn"] = true,
["names"] = {
"Прославление",
},
["event"] = "Power",
["use_genericShowOn"] = true,
["realSpellName"] = "Прославление",
["use_spellName"] = true,
["spellIds"] = {
200183,
},
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
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
["text_fixedWidth"] = 64,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_c_format"] = "none",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_text_format_1.power_round_type"] = "floor",
["text_fontSize"] = 16,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_shadowXOffset"] = 0,
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
{
["tick_rotation"] = 0,
["tick_xOffset"] = 0,
["tick_desaturate"] = false,
["use_texture"] = false,
["tick_placement_mode"] = "AtPercent",
["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["tick_length"] = 30,
["tick_blend_mode"] = "ADD",
["type"] = "subtick",
["tick_placements"] = {
"60",
},
["automatic_length"] = true,
["tick_thickness"] = 2,
["tick_color"] = {
1,
1,
1,
1,
},
["tick_visible"] = false,
["tick_yOffset"] = 0,
["tick_mirror"] = false,
["progressSources"] = {
{
-2,
"",
},
},
},
},
["height"] = 17,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["source"] = "import",
["spark"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["xOffset"] = 0,
["icon"] = false,
["uid"] = "3YM0dVUobLu",
["borderInFront"] = false,
["sparkOffsetX"] = 0,
["icon_side"] = "RIGHT",
["backgroundColor"] = {
0,
0,
0,
0.300000011920929,
},
["anchorFrameType"] = "SCREEN",
["sparkHeight"] = 20,
["config"] = {
},
["overlaysTexture"] = {
"Solid",
},
["customText"] = "function()\n    local mana = UnitPower(\"player\",0)\n    local manaMax = UnitPowerMax(\"player\",0)\n    local manaPerc = (mana / manaMax) * 100\n    return string.format(\"%.0f\",manaPerc)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
["semver"] = "1.1.0",
["sparkHidden"] = "BOTH",
["id"] = "战士 怒气条",
["sparkWidth"] = 5,
["frameStrata"] = 2,
["width"] = 297,
["customTextUpdate"] = "event",
["backdropColor"] = {
1,
1,
1,
0,
},
["inverse"] = false,
["sparkDesature"] = false,
["orientation"] = "HORIZONTAL",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "percentpower",
["value"] = "0",
["op"] = ">",
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.4.automatic_length",
},
},
},
},
["barColor2"] = {
0.9098039865493774,
0.2666666805744171,
0.1215686351060867,
1,
},
["preferToUpdate"] = false,
},
["横扫攻击（战士，语音）"] = {
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】剑来.ogg",
["sound"] = " custom",
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
["type"] = "aura2",
["use_debuffClass"] = false,
["useExactSpellId"] = true,
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["auranames"] = {
},
["useName"] = false,
["spellIds"] = {
},
["auraspellids"] = {
"12292",
},
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
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
["text_visible"] = false,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "横扫",
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
0.77647058823529,
0.6078431372549,
0.42745098039216,
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
["useGlowColor"] = false,
["glowType"] = "buttonOverlay",
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
["glow"] = true,
["glowXOffset"] = 0,
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
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = false,
["use_itemequiped"] = false,
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 12328,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["preferToUpdate"] = false,
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
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["url"] = "",
["zoom"] = 0.3,
["alpha"] = 1,
["tocversion"] = 11508,
["id"] = "横扫攻击（战士，语音）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["parent"] = "战士（BUFF）",
["uid"] = "CbpE02YuYk7",
["inverse"] = false,
["selfPoint"] = "CENTER",
["displayIcon"] = "",
["cooldown"] = true,
["authorOptions"] = {
},
},
["拦截"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 20252,
["realSpellName"] = "拦截",
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
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 20252,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "spiral",
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 动态分组 左",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "拦截",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "IrJvJEjICg3",
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
["keepAspectRatio"] = true,
},
["战士（BUFF）"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"乱舞（战士，天赋）",
"狂怒（战士，天赋）",
"补雷霆（防战）",
"补挫志（防战）",
"补破甲（战士，BOSS战，5秒补破甲语音）",
"鲁莽（战士，语音）",
"横扫攻击（战士，语音）",
"【露露】战士 补撕裂语音（1秒，BOSS战加载）",
"血性狂暴/狂暴之怒 就绪语音",
},
["borderBackdrop"] = "Blizzard Tooltip",
["parent"] = "战士",
["preferToUpdate"] = false,
["groupIcon"] = "interface/icons/classicon_warrior.blp",
["anchorPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["rowSpace"] = 35,
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
["radius"] = 200,
["regionType"] = "dynamicgroup",
["selfPoint"] = "TOPLEFT",
["align"] = "CENTER",
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
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["rotation"] = 0,
["space"] = 2,
["useLimit"] = true,
["subRegions"] = {
},
["internalVersion"] = 90,
["yOffset"] = 20,
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
["uid"] = "r)t5)x(qvu8",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["config"] = {
},
["animate"] = false,
["source"] = "import",
["scale"] = 1.1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["limit"] = 10,
["gridWidth"] = 5,
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["constantFactor"] = "RADIUS",
["stagger"] = 0,
["borderOffset"] = 4,
["sortHybridTable"] = {
["【露露】战士 补撕裂语音（1秒，BOSS战加载）"] = false,
["横扫攻击（战士，语音）"] = false,
["乱舞（战士，天赋）"] = false,
["补挫志（防战）"] = false,
["鲁莽（战士，语音）"] = false,
["补破甲（战士，BOSS战，5秒补破甲语音）"] = false,
["补雷霆（防战）"] = false,
["血性狂暴/狂暴之怒 就绪语音"] = false,
},
["tocversion"] = 11508,
["id"] = "战士（BUFF）",
["sort"] = "none",
["alpha"] = 1,
["anchorFrameType"] = "UIPARENT",
["xOffset"] = 142,
["borderInset"] = 1,
["arcLength"] = 360,
["authorOptions"] = {
},
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["gridType"] = "RD",
},
["盾墙"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"871",
},
["names"] = {
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["useMatch_count"] = true,
["spellIds"] = {
},
["match_countOperator"] = ">",
["match_count"] = "0",
["unit"] = "player",
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
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 871,
["realSpellName"] = "盾墙",
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
["use_form"] = true,
["unit"] = "player",
["type"] = "unit",
["use_unit"] = true,
["form"] = {
["single"] = 2,
},
["event"] = "Stance/Form/Aura",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 871,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "盾墙",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "3fpdJ228IHI",
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
["keepAspectRatio"] = true,
},
["乱舞（战士，天赋）"] = {
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
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
["subeventPrefix"] = "SPELL",
["useExactSpellId"] = false,
["useName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["auranames"] = {
"12974",
},
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
["progressSource"] = {
-1,
"",
},
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
["text_text_format_p_format"] = "timed",
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
["text_text_format_p_time_mod_rate"] = true,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_visible"] = false,
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
["text_text_format_n_format"] = "string",
["text_text_format_s_format"] = "none",
["text_text"] = "%n",
["text_text_format_n_pad_mode"] = "left",
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_text_format_n_pad"] = false,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_fontSize"] = 15,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_n_abbreviate_max"] = 2,
["text_text_format_p_time_precision"] = 1,
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
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "OUTER_TOP",
["text_text_format_n_pad_max"] = 8,
["text_text_format_p_time_dynamic_threshold"] = 0,
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
["text_visible"] = true,
["text_text_format_p_format"] = "timed",
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_text_format_p_time_format"] = 0,
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
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
["single"] = "WARRIOR",
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
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = ">=",
["variable"] = "stacks",
["value"] = "3",
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
["useAdjustededMin"] = false,
["regionType"] = "icon",
["desaturate"] = false,
["keepAspectRatio"] = false,
["config"] = {
},
["icon"] = true,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["url"] = "",
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["tocversion"] = 11508,
["id"] = "乱舞（战士，天赋）",
["authorOptions"] = {
},
["useCooldownModRate"] = true,
["width"] = 30,
["alpha"] = 1,
["uid"] = "79v0IWYrP1U",
["inverse"] = false,
["xOffset"] = 0,
["displayIcon"] = "",
["cooldown"] = true,
["parent"] = "战士（BUFF）",
},
["战士 动态分组 左"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"血之狂热",
"雷霆一击（狂怒/武器）",
"撕裂（狂怒/武器）",
"盾牌格挡（狂怒/武器）",
"斩杀（防护）",
"冲锋",
"拦截",
"战斗怒吼（语音）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["parent"] = "战士（中心分组）",
["preferToUpdate"] = false,
["yOffset"] = 24,
["sortHybridTable"] = {
["盾牌格挡（狂怒/武器）"] = false,
["斩杀（防护）"] = false,
["挑战怒吼"] = false,
["雷霆一击（狂怒/武器）"] = false,
["拦截"] = false,
["惩戒痛击"] = false,
["缴械"] = false,
["嘲讽"] = false,
["撕裂（狂怒/武器）"] = false,
["冲锋"] = false,
["战斗怒吼（语音）"] = false,
},
["regionType"] = "dynamicgroup",
["frameStrata"] = 1,
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
["unit"] = "player",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["event"] = "Health",
["debuffType"] = "HELPFUL",
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
["space"] = 3,
["anchorPoint"] = "CENTER",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["selfPoint"] = "BOTTOMLEFT",
["version"] = 3,
["rotation"] = 0,
["borderColor"] = {
0,
0,
0,
1,
},
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
["radius"] = 200,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["groupIcon"] = "interface/icons/classicon_warrior.blp",
["source"] = "import",
["customGrow"] = "function(newPositions, activeRegions)\n    local limit = 10 -- limit of icons per row\n    local rows = 1 -- total rows\n    local spacing = 3 -- spacing between icons\n    ----------------------\n    local check = true\n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    \n    local xOffset = 0\n    local yOffset = 0\n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        local region = regionData.region\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= limit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows-1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        xOffset = 0 - (region.width + spacing) / 2 * (rowTotal-1) + (xCount * (region.width + spacing))\n        yOffset = 0 + (region.height + spacing) * yCount -- change '-' to '+' after 0 to grow up instead of down\n        \n        xCount = xCount + 1\n        \n        if yCount < rows-1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend\n\n",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["sort"] = "none",
["alpha"] = 1,
["animate"] = false,
["constantFactor"] = "RADIUS",
["uid"] = "MYi6y4T3eus",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11508,
["id"] = "战士 动态分组 左",
["limit"] = 8,
["gridWidth"] = 4,
["anchorFrameType"] = "SCREEN",
["xOffset"] = -149,
["borderInset"] = 1,
["arcLength"] = 360,
["authorOptions"] = {
},
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["gridType"] = "RU",
},
["猛击"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["parent"] = "战士 核心分组",
["adjustedMax"] = "",
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
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["realSpellName"] = "猛击",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 8820,
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
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
["version"] = 25,
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
["single"] = "WARRIOR",
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
["use_exact_spellknown"] = false,
["spellknown"] = 8820,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["icon"] = true,
["source"] = "import",
["preferToUpdate"] = false,
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
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["authorOptions"] = {
},
["uid"] = "LGmh6uCaJiM",
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "猛击",
["zoom"] = 0.3,
["alpha"] = 1,
["width"] = 32,
["useCooldownModRate"] = true,
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
["keepAspectRatio"] = true,
},
["血之狂热"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["parent"] = "战士 动态分组 左",
["adjustedMax"] = "",
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
["useExactSpellId"] = false,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["auranames"] = {
"16488",
},
["names"] = {
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
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "spiral",
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
["version"] = 25,
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
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
[35] = true,
[52] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
},
},
["use_talent"] = false,
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
["icon"] = true,
["source"] = "import",
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["xOffset"] = 0,
["width"] = 32,
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "血之狂热",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "qoCvpEKminH",
["inverse"] = false,
["keepAspectRatio"] = true,
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
["desc"] = "",
},
["重伤"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["authorOptions"] = {
},
["adjustedMax"] = "",
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
["unit"] = "target",
["unitExists"] = false,
["useExactSpellId"] = false,
["spellIds"] = {
},
["auranames"] = {
"12834",
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
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
["easeType"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["preset"] = "spiral",
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
["version"] = 25,
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
["text_text_format_s_format"] = "none",
["text_text"] = "%s",
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_anchorYOffset"] = -2,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowYOffset"] = 0,
["text_shadowXOffset"] = 0,
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
["text_fontSize"] = 18,
["anchorXOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
},
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["single"] = 51,
["multi"] = {
[51] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
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
["spellknown"] = 12834,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 32,
["source"] = "import",
["cooldownEdge"] = true,
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["preferToUpdate"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "战士 动态分组 右",
["icon"] = true,
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
["useCooldownModRate"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.23",
["tocversion"] = 11508,
["id"] = "重伤",
["auto"] = true,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "G26cpjAxWU2",
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
["selfPoint"] = "CENTER",
},
["撕裂（狂怒/武器）"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["auranames"] = {
"772",
},
["spellIds"] = {
},
["type"] = "aura2",
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
["type"] = "unit",
["spellName"] = 12294,
["talent"] = {
["single"] = 99,
},
["genericShowOn"] = "showOnCooldown",
["use_inverse"] = true,
["event"] = "Talent Known",
["use_talent"] = true,
["realSpellName"] = 0,
["use_spellName"] = true,
["use_genericShowOn"] = true,
["use_spec"] = true,
["use_unit"] = true,
["unit"] = "player",
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["spellName"] = 12294,
["talent"] = {
["single"] = 58,
},
["genericShowOn"] = "showOnCooldown",
["use_inverse"] = true,
["event"] = "Talent Known",
["use_talent"] = true,
["realSpellName"] = 0,
["use_spellName"] = true,
["use_genericShowOn"] = true,
["use_spec"] = true,
["use_unit"] = true,
["unit"] = "player",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["single"] = 97,
["multi"] = {
[97] = true,
},
},
["not_spellknown"] = 12298,
["zoneIds"] = "",
["use_not_spellknown"] = true,
["use_class"] = true,
["use_spellknown"] = true,
["class"] = {
["single"] = "WARRIOR",
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
["spellknown"] = 772,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
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
["preferToUpdate"] = false,
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
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["uid"] = "V6L73Ia8qU4",
["parent"] = "战士 动态分组 左",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.23",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "撕裂（狂怒/武器）",
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["width"] = 32,
["useCooldownModRate"] = true,
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
["keepAspectRatio"] = true,
},
["战士"] = {
["controlledChildren"] = {
"战斗怒吼（缺失文字）",
"战士（BUFF）",
"战士（中心分组）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["groupIcon"] = "classicon-warrior",
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
["yOffset"] = 0,
["tocversion"] = 11508,
["id"] = "战士",
["selfPoint"] = "CENTER",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["uid"] = "FTAvjl6spvW",
["borderInset"] = 1,
["config"] = {
},
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
},
["alpha"] = 1,
},
["【露露】战士 补撕裂语音（1秒，BOSS战加载）"] = {
["outline"] = "OUTLINE",
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["displayText_format_p_time_dynamic_threshold"] = 60,
["anchorFrameParent"] = false,
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["displayText_format_p_time_format"] = 0,
["customTextUpdate"] = "event",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["rem"] = "1",
["auranames"] = {
"772",
},
["ownOnly"] = true,
["subeventPrefix"] = "SPELL",
["debuffType"] = "HARMFUL",
["type"] = "aura2",
["use_debuffClass"] = false,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["names"] = {
},
["matchesShowOn"] = "showOnActive",
["auraspellids"] = {
"25203",
},
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
["displayText_format_p_time_mod_rate"] = true,
["internalVersion"] = 90,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["displayText_format_p_time_legacy_floor"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["conditions"] = {
},
["desaturate"] = true,
["parent"] = "战士（BUFF）",
["font"] = "Friz Quadrata TT",
["actions"] = {
["start"] = {
["sound"] = " custom",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】撕裂.ogg",
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
["subRegions"] = {
{
["type"] = "subbackground",
},
},
["height"] = 28,
["preferToUpdate"] = false,
["load"] = {
["ingroup"] = {
["multi"] = {
["group"] = true,
["raid"] = true,
},
},
["use_level"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["WARRIOR"] = true,
["ROGUE"] = true,
},
},
["use_encounter"] = true,
["use_never"] = false,
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["spec"] = {
["multi"] = {
},
},
["level_operator"] = {
">=",
},
["level"] = {
"60",
},
["spellknown"] = 772,
["size"] = {
["multi"] = {
},
},
},
["config"] = {
},
["alpha"] = 1,
["fontSize"] = 12,
["source"] = "import",
["anchorFrameType"] = "SCREEN",
["shadowXOffset"] = 1,
["frameStrata"] = 1,
["xOffset"] = -3000,
["displayIcon"] = "",
["regionType"] = "text",
["wordWrap"] = "WordWrap",
["displayText"] = "",
["zoom"] = 0,
["animation"] = {
["start"] = {
["type"] = "preset",
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
["displayText_format_p_time_precision"] = 1,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["shadowYOffset"] = -1,
["cooldownTextDisabled"] = true,
["justify"] = "LEFT",
["tocversion"] = 11508,
["id"] = "【露露】战士 补撕裂语音（1秒，BOSS战加载）",
["displayText_format_p_format"] = "timed",
["useCooldownModRate"] = true,
["width"] = 28,
["url"] = "",
["uid"] = "GBdqdwLr1GN",
["inverse"] = false,
["authorOptions"] = {
},
["shadowColor"] = {
0,
0,
0,
1,
},
["fixedWidth"] = 200,
["cooldown"] = true,
["automaticWidth"] = "Auto",
},
["破釜沉舟"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"12975",
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["unit"] = "player",
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
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 12975,
["realSpellName"] = "破釜沉舟",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 12975,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "破釜沉舟",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "q)u3M63Jqgd",
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
["keepAspectRatio"] = true,
},
["撕裂（防护）"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"772",
},
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["unit"] = "target",
["unitExists"] = true,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["type"] = "aura2",
["ownOnly"] = true,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_form"] = false,
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_spec"] = true,
["debuffType"] = "HELPFUL",
["type"] = "unit",
["talent"] = {
["single"] = 99,
},
["form"] = {
},
["event"] = "Stance/Form/Aura",
["realSpellName"] = 0,
["use_spellName"] = true,
["use_talent"] = true,
["use_inverse"] = true,
["use_unit"] = true,
["use_track"] = true,
["spellName"] = 12294,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["debuffType"] = "HELPFUL",
["talent"] = {
["single"] = 58,
},
["event"] = "Talent Known",
["use_inverse"] = true,
["genericShowOn"] = "showOnCooldown",
["use_unit"] = true,
["realSpellName"] = 0,
["use_spellName"] = true,
["use_genericShowOn"] = true,
["use_spec"] = true,
["unit"] = "player",
["use_talent"] = true,
["use_track"] = true,
["spellName"] = 12294,
},
["untrigger"] = {
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
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["single"] = 97,
["multi"] = {
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
},
},
["use_talent"] = true,
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
["spellknown"] = 772,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "撕裂（防护）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "reLhqLjY(W0",
["inverse"] = false,
["icon"] = true,
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
["keepAspectRatio"] = true,
},
["拳击"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["spellName"] = 6552,
["realSpellName"] = "拳击",
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
["type"] = "item",
["use_itemTypeName"] = false,
["itemTypeName"] = {
["multi"] = {
[1030] = true,
},
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_itemName"] = true,
["event"] = "Item Type Equipped",
["itemName"] = 0,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t) \n    return not t[2]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 6552,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "拳击",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "OWXnbwHviSi",
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
["keepAspectRatio"] = true,
},
["嘲讽"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
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
["showClones"] = false,
["useName"] = true,
["auranames"] = {
"355",
},
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["unitExists"] = false,
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["names"] = {
},
["unit"] = "target",
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
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["realSpellName"] = "嘲讽",
["use_spellName"] = true,
["spellName"] = 355,
["event"] = "Cooldown Progress (Spell)",
["use_showgcd"] = false,
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
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "spiral",
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
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 355,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["url"] = "",
["icon"] = true,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "战士 动态分组 右",
["keepAspectRatio"] = true,
["uid"] = "F4tE2vess5P",
["authorOptions"] = {
},
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.23",
["tocversion"] = 11508,
["id"] = "嘲讽",
["auto"] = true,
["alpha"] = 1,
["width"] = 32,
["zoom"] = 0.3,
["config"] = {
},
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
["【露露】副手平砍（战士）"] = {
["sparkWidth"] = 20,
["iconSource"] = -1,
["xOffset"] = -6.7816841681319e-05,
["adjustedMax"] = "",
["yOffset"] = -28.36977274244288,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "",
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
["desc"] = "自制自用WA，WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["sparkOffsetY"] = 0,
["gradientOrientation"] = "HORIZONTAL",
["load"] = {
["ingroup"] = {
["multi"] = {
},
},
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
["single"] = "WARRIOR",
["multi"] = {
["WARRIOR"] = true,
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["use_class"] = true,
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
["use_spec"] = true,
["race"] = {
["multi"] = {
},
},
["talent2"] = {
["multi"] = {
},
},
["zoneIds"] = "",
},
["toolTipArea"] = "ICON",
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["sparkDesaturate"] = false,
["texture"] = "!Rurutia02",
["sparkTexture"] = "XPBarAnim-OrangeSpark",
["spark"] = true,
["tocversion"] = 11508,
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
["use_unit"] = true,
["duration"] = "1",
["unit"] = "player",
["spellIds"] = {
},
["use_hand"] = true,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["hand"] = "off",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
["hand"] = "off",
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
["text_shadowXOffset"] = 1,
["text_text"] = "%p",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorYOffset"] = 0,
["anchorXOffset"] = 0,
["type"] = "subtext",
["text_text_format_p_format"] = "timed",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_n_format"] = "none",
["text_shadowYOffset"] = -1,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_text_format_p_time_precision"] = 1,
["anchor_point"] = "INNER_CENTER",
["text_fontSize"] = 12,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
},
},
["height"] = 5,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["backdropColor"] = {
0,
0,
0,
1,
},
["source"] = "import",
["uid"] = "51gy1fRX7Yw",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["useAdjustedMax"] = false,
["auto"] = true,
["config"] = {
},
["authorOptions"] = {
},
["borderInFront"] = true,
["useAdjustededMax"] = false,
["icon_side"] = "RIGHT",
["progressSource"] = {
-1,
"",
},
["icon"] = false,
["sparkHeight"] = 14,
["width"] = 297,
["zoom"] = 0,
["borderBackdrop"] = "None",
["semver"] = "1.0.8",
["sparkHidden"] = "FULL",
["id"] = "【露露】副手平砍（战士）",
["parent"] = "战士 资源条",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["backgroundColor"] = {
0.31764705882353,
0.22745098039216,
0.16862745098039,
0,
},
["desaturate"] = false,
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
["barColor2"] = {
1,
1,
0,
1,
},
["preferToUpdate"] = false,
},
["血性狂暴/狂暴之怒 就绪语音"] = {
["outline"] = "OUTLINE",
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["displayText_format_p_time_dynamic_threshold"] = 60,
["anchorFrameParent"] = false,
["shadowYOffset"] = -1,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["displayText_format_p_time_format"] = 0,
["customTextUpdate"] = "event",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["message"] = "",
["message_type"] = "SMARTRAID",
["do_sound"] = true,
["message_tts_voice"] = 0,
["do_message"] = false,
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】狂热鞭笞.ogg",
["sound"] = " custom",
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
["type"] = "spell",
["debuffType"] = "HELPFUL",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Ready (Spell)",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["realSpellName"] = "血性狂暴",
["use_spellName"] = true,
["spellIds"] = {
},
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["use_track"] = true,
["spellName"] = 2687,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "spell",
["spellName"] = 18499,
["subeventSuffix"] = "_CAST_START",
["genericShowOn"] = "showOnCooldown",
["use_genericShowOn"] = true,
["event"] = "Cooldown Ready (Spell)",
["names"] = {
},
["realSpellName"] = "狂暴之怒",
["use_spellName"] = true,
["spellIds"] = {
},
["duration"] = "1",
["unit"] = "player",
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
["displayText_format_p_time_mod_rate"] = true,
["displayText_format_p_time_legacy_floor"] = false,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["internalVersion"] = 90,
["cooldown"] = true,
["conditions"] = {
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["fixedWidth"] = 200,
["font"] = "Friz Quadrata TT",
["icon"] = true,
["subRegions"] = {
{
["type"] = "subbackground",
},
},
["height"] = 28,
["preferToUpdate"] = false,
["load"] = {
["ingroup"] = {
["multi"] = {
["group"] = true,
["raid"] = true,
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["ROGUE"] = true,
["WARRIOR"] = true,
},
},
["use_level"] = false,
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["spec"] = {
["multi"] = {
},
},
["level_operator"] = {
">=",
},
["level"] = {
"60",
},
["spellknown"] = 402877,
["size"] = {
["multi"] = {
},
},
},
["uid"] = "rgjkDTpgmLY",
["alpha"] = 1,
["fontSize"] = 12,
["source"] = "import",
["width"] = 28,
["shadowXOffset"] = 1,
["frameStrata"] = 1,
["yOffset"] = 0,
["displayText_format_p_format"] = "timed",
["regionType"] = "text",
["wordWrap"] = "WordWrap",
["displayText"] = "",
["zoom"] = 0,
["xOffset"] = -3000,
["displayText_format_p_time_precision"] = 1,
["desaturate"] = true,
["automaticWidth"] = "Auto",
["cooldownTextDisabled"] = true,
["justify"] = "LEFT",
["tocversion"] = 11508,
["id"] = "血性狂暴/狂暴之怒 就绪语音",
["animation"] = {
["start"] = {
["type"] = "preset",
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
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["url"] = "",
["config"] = {
},
["inverse"] = false,
["authorOptions"] = {
},
["shadowColor"] = {
0,
0,
0,
1,
},
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["parent"] = "战士（BUFF）",
},
["战斗怒吼（语音）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "战士 动态分组 左",
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"11549",
},
["duration"] = "1",
["unit"] = "player",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["matchesShowOn"] = "showOnActive",
["type"] = "aura2",
["event"] = "Item Count",
["names"] = {
},
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
"11549",
},
["duration"] = "1",
["names"] = {
},
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["useName"] = true,
["unevent"] = "auto",
["use_itemName"] = true,
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["event"] = "Item Count",
["type"] = "aura2",
["matchesShowOn"] = "showOnMissing",
["use_unit"] = true,
["unit"] = "player",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["unit"] = "player",
["use_unit"] = true,
["use_vehicle"] = false,
["debuffType"] = "HELPFUL",
["event"] = "Conditions",
["use_mounted"] = false,
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
["customTriggerLogic"] = "function(t)\n    return t[1] or t[2]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 6,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
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
["glowScale"] = 1,
["glowXOffset"] = 0,
["glowDuration"] = 1,
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
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
},
},
["spellknown"] = 11549,
["size"] = {
["multi"] = {
},
},
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = 136076,
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
["type"] = "description",
["text"] = "Shadowform",
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
["name"] = "Shadowform",
["key"] = "shadowform",
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
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
["maintenance"] = {
["shadowform"] = {
["behavior"] = 2,
},
},
},
["xOffset"] = 0,
["width"] = 32,
["anchorFrameParent"] = false,
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["semver"] = "2.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "战斗怒吼（语音）",
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["uid"] = "Gul8gxivuaW",
["inverse"] = false,
["cooldownEdge"] = false,
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
["trigger"] = 2,
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
["trigger"] = 2,
["variable"] = "show",
["value"] = 1,
},
{
["trigger"] = 4,
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
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】吼战斗.ogg",
["sound_channel"] = "Master",
},
["property"] = "sound",
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
["value"] = "5",
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
["value"] = {
["sound_type"] = "Play",
["sound"] = " custom",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】吼战斗.ogg",
["sound_channel"] = "Master",
},
["property"] = "sound",
},
{
["value"] = true,
["property"] = "sub.2.glow",
},
},
},
},
["cooldown"] = true,
["keepAspectRatio"] = true,
},
["复仇（强化复仇）"] = {
["iconSource"] = 0,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "spell",
["debuffType"] = "HELPFUL",
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["use_unit"] = true,
["realSpellName"] = "复仇",
["use_spellName"] = true,
["spellIds"] = {
},
["unit"] = "player",
["names"] = {
},
["event"] = "Action Usable",
["use_track"] = true,
["spellName"] = 6572,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "combatlog",
["missType"] = "DODGE",
["subeventSuffix"] = "_MISSED",
["unit"] = "player",
["duration"] = "5",
["event"] = "Combat Log",
["subeventPrefix"] = "SWING",
["destUnit"] = "target",
["names"] = {
},
["spellIds"] = {
},
["use_missType"] = true,
["use_sourceUnit"] = true,
["use_destUnit"] = true,
["sourceUnit"] = "player",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["use_spellCount"] = false,
["event"] = "Cooldown Progress (Spell)",
["realSpellName"] = "复仇",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 6572,
["subeventPrefix"] = "SPELL",
["use_track"] = true,
["names"] = {
},
},
["untrigger"] = {
},
},
{
["trigger"] = {
["debuffType"] = "HELPFUL",
["type"] = "unit",
["use_form"] = true,
["form"] = {
["single"] = 2,
},
["use_unit"] = true,
["use_inverse"] = false,
["event"] = "Stance/Form/Aura",
["unit"] = "player",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[4]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = false,
["use_never"] = false,
["use_spec"] = true,
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["use_exact_spellknown"] = false,
["spellknown"] = 7384,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = 132353,
["cooldownEdge"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "复仇（强化复仇）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "sfd9VguzQ1l",
["inverse"] = false,
["icon"] = true,
["conditions"] = {
{
["check"] = {
["trigger"] = 3,
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
["trigger"] = 3,
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
["trigger"] = 3,
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
["trigger"] = 3,
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
["trigger"] = 3,
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
{
["property"] = "color",
},
{
["property"] = "desaturate",
},
},
},
{
["check"] = {
["trigger"] = -2,
["variable"] = "OR",
["checks"] = {
{
["value"] = 1,
["variable"] = "show",
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
["property"] = "cooldownEdge",
},
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = 132223,
["property"] = "displayIcon",
},
{
["property"] = "desaturate",
},
{
["property"] = "inverse",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 1,
["checks"] = {
{
["value"] = 1,
["variable"] = "show",
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
["property"] = "cooldownEdge",
},
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = 132353,
["property"] = "displayIcon",
},
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
["keepAspectRatio"] = true,
},
["盾牌格挡（狂怒/武器）"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"2565",
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["unit"] = "player",
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
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 2565,
["realSpellName"] = "盾牌格挡",
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
["single"] = 14,
},
["use_inverse"] = false,
["event"] = "Talent Known",
["unit"] = "player",
["use_spec"] = true,
["use_unit"] = true,
["use_talent"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["talent"] = {
["single"] = 51,
},
["use_inverse"] = false,
["event"] = "Talent Known",
["unit"] = "player",
["use_spec"] = true,
["use_unit"] = true,
["use_talent"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return (t[1] or t[2]) and (t[3] or t[4])\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["single"] = 99,
["multi"] = {
[99] = true,
[59] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
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
["spellknown"] = 2565,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "spiral",
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 动态分组 左",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "盾牌格挡（狂怒/武器）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "SjwMB1JnYwe",
["inverse"] = true,
["icon"] = true,
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
["keepAspectRatio"] = true,
},
["冲锋"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 100,
["realSpellName"] = "冲锋",
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
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 100,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "spiral",
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 动态分组 左",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "冲锋",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "iU5n4F43)vV",
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
["keepAspectRatio"] = true,
},
["战士（中心分组）"] = {
["controlledChildren"] = {
"血条斩杀线提示（战士）",
"战士 动态分组 左",
"战士 动态分组 右",
"战士 核心分组",
"战士 资源条",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["groupIcon"] = "interface/icons/classicon_warrior.blp",
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
["unevent"] = "timed",
["duration"] = "1",
["event"] = "Conditions",
["unit"] = "player",
["spellIds"] = {
},
["buffShowOn"] = "showOnActive",
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["activeTriggerMode"] = 1,
},
["internalVersion"] = 90,
["selfPoint"] = "CENTER",
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
["parent"] = "战士",
["borderOffset"] = 5,
["semver"] = "1.1.0",
["tocversion"] = 11508,
["id"] = "战士（中心分组）",
["xOffset"] = 0,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["yOffset"] = -224,
["config"] = {
},
["uid"] = "sIz6PrXpwH5",
["borderInset"] = 11,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["ignoreOptionsEventErrors"] = true,
["forceEvents"] = true,
["groupOffset"] = false,
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
["战士 动态分组 右"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"嘲讽",
"惩戒痛击",
"挑战怒吼",
"破甲（三系）",
"缴械",
"挫志怒吼（三系）",
"重伤",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = false,
["groupIcon"] = "interface/icons/classicon_warrior.blp",
["sortHybridTable"] = {
["挫志怒吼（三系）"] = false,
["重伤"] = false,
["血之狂热"] = false,
["破甲（三系）"] = false,
["狂怒/激怒（TTS关闭）"] = false,
},
["animate"] = false,
["gridWidth"] = 4,
["borderColor"] = {
0,
0,
0,
1,
},
["rowSpace"] = 5,
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
["xOffset"] = 149,
["anchorPoint"] = "CENTER",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["radius"] = 200,
["version"] = 3,
["fullCircle"] = true,
["arcLength"] = 360,
["uid"] = "(RK2xlVoMWm",
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
["gridType"] = "LU",
["source"] = "import",
["customGrow"] = "function(newPositions, activeRegions)\n    local limit = 10 -- limit of icons per row\n    local rows = 1 -- total rows\n    local spacing = 3 -- spacing between icons\n    ----------------------\n    local check = true\n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    \n    local xOffset = 0\n    local yOffset = 0\n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        local region = regionData.region\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= limit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows-1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        xOffset = 0 - (region.width + spacing) / 2 * (rowTotal-1) + (xCount * (region.width + spacing))\n        yOffset = 0 + (region.height + spacing) * yCount -- change '-' to '+' after 0 to grow up instead of down\n        \n        xCount = xCount + 1\n        \n        if yCount < rows-1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend\n\n",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 10,
["alpha"] = 1,
["space"] = 3,
["constantFactor"] = "RADIUS",
["sort"] = "none",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11508,
["id"] = "战士 动态分组 右",
["stepAngle"] = 15,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["config"] = {
},
["borderInset"] = 1,
["useLimit"] = true,
["yOffset"] = 24,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["parent"] = "战士（中心分组）",
},
["旋风斩"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["spellName"] = 1680,
["realSpellName"] = "旋风斩",
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
["disjunctive"] = "all",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
},
["height"] = 32,
["load"] = {
["talent2"] = {
},
["class_and_spec"] = {
["multi"] = {
},
},
["talent"] = {
["multi"] = {
[20] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_petbattle"] = false,
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
["spellknown"] = 1680,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "旋风斩",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "r9Lz933VczK",
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
["variable"] = "onCooldown",
["value"] = 1,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "onCooldown",
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
["value"] = true,
["property"] = "desaturate",
},
},
},
},
["cooldown"] = true,
["keepAspectRatio"] = true,
},
["补破甲（战士，BOSS战，5秒补破甲语音）"] = {
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["rem"] = "5",
["auranames"] = {
"7386",
"8647",
"402818",
"770",
"704",
},
["matchesShowOn"] = "showOnActive",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HARMFUL",
["type"] = "aura2",
["use_debuffClass"] = false,
["auraspellids"] = {
"25203",
},
["event"] = "Health",
["useExactSpellId"] = false,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["unit"] = "target",
["remOperator"] = "<=",
["useName"] = true,
["names"] = {
},
["useRem"] = false,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["use_debuffClass"] = false,
["useExactSpellId"] = false,
["matchesShowOn"] = "showOnMissing",
["event"] = "Health",
["unit"] = "target",
["auraspellids"] = {
"25203",
},
["useName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["auranames"] = {
"7386",
"8647",
"402818",
"770",
"704",
},
["subeventPrefix"] = "SPELL",
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["rem"] = "5",
["auranames"] = {
"7386",
"8647",
"770",
"704",
},
["matchesShowOn"] = "showOnActive",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HARMFUL",
["type"] = "aura2",
["use_debuffClass"] = false,
["auraspellids"] = {
"25203",
},
["event"] = "Health",
["subeventSuffix"] = "_CAST_START",
["unit"] = "target",
["spellIds"] = {
},
["names"] = {
},
["remOperator"] = "<=",
["useName"] = true,
["useExactSpellId"] = false,
["useRem"] = true,
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
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "破甲",
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
0.77647058823529,
0.6078431372549,
0.42745098039216,
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
["glowLength"] = 8,
["glowYOffset"] = 0,
["glowColor"] = {
1,
0,
0,
1,
},
["glowThickness"] = 2,
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
["text_fontSize"] = 18,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
},
},
["height"] = 30,
["load"] = {
["ingroup"] = {
["multi"] = {
["group"] = true,
["raid"] = true,
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["ROGUE"] = true,
["WARRIOR"] = true,
},
},
["use_encounter"] = true,
["use_level"] = false,
["use_class"] = true,
["use_spellknown"] = false,
["use_itemequiped"] = false,
["level_operator"] = {
">=",
},
["spec"] = {
["multi"] = {
},
},
["level"] = {
"60",
},
["spellknown"] = 23922,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["keepAspectRatio"] = false,
["preferToUpdate"] = false,
["cooldown"] = true,
["displayIcon"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["desaturate"] = true,
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
["uid"] = "1uzKDOkUpdi",
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
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["cooldownEdge"] = false,
["zoom"] = 0.3,
["alpha"] = 1,
["tocversion"] = 11508,
["id"] = "补破甲（战士，BOSS战，5秒补破甲语音）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["parent"] = "战士（BUFF）",
["config"] = {
},
["inverse"] = false,
["xOffset"] = 0,
["conditions"] = {
{
["check"] = {
["trigger"] = 3,
["variable"] = "expirationTime",
["op"] = "<=",
["value"] = "5",
},
["changes"] = {
{
["value"] = {
["sound_type"] = "Play",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】补破甲.ogg",
["sound"] = " custom",
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
},
["authorOptions"] = {
},
},
["顺劈斩"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["subeventSuffix"] = "_CAST_START",
["event"] = "Queued Action",
["spellName"] = 845,
["realSpellName"] = "Heroic Throw",
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
["type"] = "spell",
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["unit"] = "player",
["realSpellName"] = "顺劈斩",
["use_spellName"] = true,
["spellName"] = 845,
["event"] = "Cooldown Progress (Spell)",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "Pixel",
["glowLength"] = 12,
["glowYOffset"] = 1,
["glowColor"] = {
1,
1,
1,
1,
},
["glow"] = false,
["glowScale"] = 1,
["glowThickness"] = 2,
["glowXOffset"] = 1,
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
["single"] = "WARRIOR",
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
["spellknown"] = 845,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "spiral",
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = 132282,
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "顺劈斩",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "akmKyfy3m6F",
["inverse"] = true,
["icon"] = true,
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
["trigger"] = 2,
["variable"] = "insufficientResources",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = {
0.4745098352432251,
0.5137255191802979,
1,
1,
},
["property"] = "color",
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
["keepAspectRatio"] = true,
},
["反击风暴"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"20230",
},
["names"] = {
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["useMatch_count"] = true,
["spellIds"] = {
},
["match_countOperator"] = ">",
["match_count"] = "0",
["unit"] = "player",
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
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 20230,
["realSpellName"] = "反击风暴",
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
["use_form"] = true,
["unit"] = "player",
["type"] = "unit",
["use_unit"] = true,
["form"] = {
["single"] = 1,
},
["event"] = "Stance/Form/Aura",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 20230,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "反击风暴",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "aUmdacFzAFh",
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
["keepAspectRatio"] = true,
},
["致死打击"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["spellName"] = 12294,
["realSpellName"] = "致死打击",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 12294,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "致死打击",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "jorwyGynA((",
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
["keepAspectRatio"] = true,
},
["补雷霆（防战）"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
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
"12666",
"20187",
},
["matchesShowOn"] = "showOnMissing",
["event"] = "Health",
["unit"] = "target",
["useExactSpellId"] = false,
["useName"] = true,
["spellIds"] = {
},
["auraspellids"] = {
"25264",
"12666",
},
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["debuffType"] = "HARMFUL",
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
["desaturate"] = true,
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
["text_text"] = "雷霆",
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
0.77647058823529,
0.6078431372549,
0.42745098039216,
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
["glowLength"] = 8,
["glowYOffset"] = 0,
["glowColor"] = {
1,
0,
0,
1,
},
["glowThickness"] = 2,
["glowScale"] = 1,
["glow"] = true,
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
["text_text_format_p_time_precision"] = 1,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = false,
["text_text_format_p_time_format"] = 0,
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 18,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
},
},
["height"] = 30,
["load"] = {
["ingroup"] = {
["multi"] = {
["group"] = true,
["raid"] = true,
},
},
["use_encounter"] = true,
["talent"] = {
["multi"] = {
},
},
["use_never"] = false,
["level_operator"] = {
">=",
},
["use_level"] = false,
["use_spellknown"] = true,
["use_class"] = true,
["use_ingroup"] = false,
["use_itemequiped"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["WARLOCK"] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["level"] = {
"60",
},
["spellknown"] = 23922,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 30,
["source"] = "import",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["preferToUpdate"] = false,
["cooldown"] = true,
["displayIcon"] = 132315,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["selfPoint"] = "CENTER",
["progressSource"] = {
-1,
"",
},
["uid"] = "Y3JT1TFfVOl",
["color"] = {
1,
1,
1,
1,
},
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["url"] = "",
["zoom"] = 0.3,
["alpha"] = 1,
["tocversion"] = 11508,
["id"] = "补雷霆（防战）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["parent"] = "战士（BUFF）",
["config"] = {
},
["inverse"] = false,
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
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "3",
["op"] = "<=",
},
["changes"] = {
{
["value"] = {
["sound_type"] = "Play",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】补雷霆.ogg",
["sound"] = " custom",
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
},
["xOffset"] = 0,
},
["压制（语音）"] = {
["iconSource"] = 0,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["type"] = "spell",
["debuffType"] = "HELPFUL",
["subeventSuffix"] = "_CAST_START",
["genericShowOn"] = "showOnCooldown",
["use_genericShowOn"] = true,
["event"] = "Action Usable",
["subeventPrefix"] = "SPELL",
["realSpellName"] = "压制",
["use_spellName"] = true,
["spellIds"] = {
},
["unit"] = "player",
["use_unit"] = true,
["names"] = {
},
["use_track"] = true,
["spellName"] = 7384,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "combatlog",
["subeventSuffix"] = "_MISSED",
["missType"] = "DODGE",
["unit"] = "player",
["duration"] = "5",
["event"] = "Combat Log",
["names"] = {
},
["destUnit"] = "target",
["subeventPrefix"] = "SWING",
["spellIds"] = {
},
["use_sourceUnit"] = true,
["use_missType"] = true,
["use_destUnit"] = true,
["sourceUnit"] = "player",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["unit"] = "player",
["use_form"] = false,
["type"] = "unit",
["use_inverse"] = false,
["use_unit"] = true,
["form"] = {
["single"] = 1,
["multi"] = {
true,
[3] = true,
},
},
["event"] = "Stance/Form/Aura",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["event"] = "Power",
["use_unit"] = true,
["powertype"] = 1,
["percentpower_operator"] = {
"<",
},
["percentpower"] = {
"5",
},
["unit"] = "player",
["use_percentpower"] = true,
["use_powertype"] = true,
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
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 7384,
["zoneIds"] = "",
},
["desaturate"] = false,
["useAdjustededMax"] = false,
["authorOptions"] = {
},
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = 132223,
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
["icon"] = true,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["preferToUpdate"] = false,
["width"] = 32,
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.23",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "压制（语音）",
["alpha"] = 1,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["color"] = {
1,
1,
1,
1,
},
["uid"] = "g53e5Ws0P3L",
["inverse"] = true,
["url"] = "",
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = -2,
["variable"] = "OR",
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
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
["sound_type"] = "Play",
["sound"] = " custom",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】压制.ogg",
["sound_channel"] = "Master",
},
["property"] = "sound",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "show",
["value"] = 0,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 1,
},
{
["trigger"] = 1,
["variable"] = "spellUsable",
["value"] = 0,
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
["trigger"] = 4,
["variable"] = "show",
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
["parent"] = "战士 核心分组",
},
["斩杀（防护）"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["event"] = "Action Usable",
["spellName"] = 5308,
["realSpellName"] = "斩杀",
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
["track"] = "auto",
["use_matchedRune"] = false,
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["subeventPrefix"] = "SPELL",
["use_showgcd"] = true,
["use_spec"] = true,
["debuffType"] = "HELPFUL",
["type"] = "unit",
["spellName"] = 5308,
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["duration"] = "1",
["event"] = "Talent Known",
["unevent"] = "auto",
["realSpellName"] = "Execute",
["use_spellName"] = true,
["spellIds"] = {
},
["unit"] = "player",
["talent"] = {
["single"] = 87,
},
["use_unit"] = true,
["use_track"] = true,
["use_talent"] = true,
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
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 5308,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "spiral",
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 动态分组 左",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "斩杀（防护）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "JMEKPo5kQjp",
["inverse"] = true,
["icon"] = true,
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
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
},
},
},
["cooldown"] = true,
["keepAspectRatio"] = true,
},
["雷霆一击（防护）"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["spellName"] = 8205,
["realSpellName"] = "雷霆一击",
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
["single"] = 14,
},
["form"] = {
["single"] = 2,
},
["event"] = "Stance/Form/Aura",
["unit"] = "player",
["use_inverse"] = false,
["use_form"] = true,
["use_unit"] = true,
["use_talent"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["talent"] = {
["single"] = 14,
},
["form"] = {
["single"] = 1,
},
["event"] = "Stance/Form/Aura",
["unit"] = "player",
["use_inverse"] = false,
["use_form"] = true,
["use_unit"] = true,
["use_talent"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2] or t[3]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["single"] = 97,
["multi"] = {
[99] = true,
[59] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_talent"] = true,
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
["spellknown"] = 8205,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "雷霆一击（防护）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "Kl5Bah0uxb8",
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
["variable"] = "onCooldown",
["value"] = 1,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "onCooldown",
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
["value"] = true,
["property"] = "desaturate",
},
},
},
},
["cooldown"] = true,
["keepAspectRatio"] = true,
},
["缴械"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"676",
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["unit"] = "target",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["names"] = {
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
["realSpellName"] = "缴械",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 676,
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 676,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "spiral",
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 动态分组 右",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "缴械",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "5oSU0la1zLU",
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
["keepAspectRatio"] = true,
},
["破甲（三系）"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
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
["useExactSpellId"] = false,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["auranames"] = {
"7386",
},
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
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "spiral",
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
["version"] = 25,
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
["text_text_format_s_format"] = "none",
["text_text"] = "%s",
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_text_format_p_time_format"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["anchorXOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_text_format_p_time_precision"] = 1,
["anchor_point"] = "TOP",
["text_fontSize"] = 18,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_anchorYOffset"] = -2,
},
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["single"] = 51,
["multi"] = {
[51] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
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
["spellknown"] = 7386,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["url"] = "",
["icon"] = true,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "战士 动态分组 右",
["keepAspectRatio"] = true,
["uid"] = "Vhmmf)bRUaX",
["authorOptions"] = {
},
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.23",
["tocversion"] = 11508,
["id"] = "破甲（三系）",
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
},
["cooldown"] = true,
["selfPoint"] = "CENTER",
},
["英勇打击"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["track"] = "auto",
["use_matchedRune"] = false,
["duration"] = "1",
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_showgcd"] = true,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Queued Action",
["spellName"] = 1608,
["realSpellName"] = "Heroic Throw",
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
["type"] = "spell",
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["unit"] = "player",
["realSpellName"] = "英勇打击",
["use_spellName"] = true,
["spellName"] = 1608,
["event"] = "Cooldown Progress (Spell)",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowDuration"] = 1,
["glowType"] = "Pixel",
["glowLength"] = 12,
["glowYOffset"] = 1,
["glowColor"] = {
1,
1,
1,
1,
},
["glow"] = false,
["glowScale"] = 1,
["glowThickness"] = 2,
["glowXOffset"] = 1,
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
["single"] = "WARRIOR",
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
["spellknown"] = 1608,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "spiral",
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = 132282,
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "英勇打击",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "aj4qcmT9Qr6",
["inverse"] = true,
["icon"] = true,
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
["trigger"] = 2,
["variable"] = "insufficientResources",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "desaturate",
},
{
["value"] = {
0.4745098352432251,
0.5137255191802979,
1,
1,
},
["property"] = "color",
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
["keepAspectRatio"] = true,
},
["鲁莽"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"1719",
},
["names"] = {
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["useMatch_count"] = true,
["spellIds"] = {
},
["match_countOperator"] = ">",
["match_count"] = "0",
["unit"] = "player",
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
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 1719,
["realSpellName"] = "鲁莽",
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
["use_form"] = true,
["unit"] = "player",
["type"] = "unit",
["use_unit"] = true,
["form"] = {
["single"] = 3,
},
["event"] = "Stance/Form/Aura",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 1719,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "鲁莽",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "MIqTQoXF1)(",
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
["keepAspectRatio"] = true,
},
["鲁莽（战士，语音）"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["sound"] = " custom",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】龙神の剣を喰らえ！.ogg",
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
["rem"] = "5",
["auranames"] = {
"1719",
},
["ownOnly"] = true,
["unit"] = "player",
["debuffType"] = "HELPFUL",
["useName"] = true,
["use_debuffClass"] = false,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["useExactSpellId"] = false,
["auraspellids"] = {
},
["spellIds"] = {
},
["names"] = {
},
["remOperator"] = "<=",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["useRem"] = false,
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
["text_visible"] = false,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "鲁莽",
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
["useGlowColor"] = false,
["glowType"] = "buttonOverlay",
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
["glow"] = true,
["glowXOffset"] = 0,
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
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 1719,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["desaturate"] = false,
["preferToUpdate"] = false,
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
["xOffset"] = 0,
["anchorFrameParent"] = false,
["alpha"] = 1,
["url"] = "",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["tocversion"] = 11508,
["id"] = "鲁莽（战士，语音）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 30,
["parent"] = "战士（BUFF）",
["uid"] = "p6TyvF3FfrX",
["inverse"] = false,
["selfPoint"] = "CENTER",
["displayIcon"] = "",
["cooldown"] = true,
["color"] = {
1,
1,
1,
1,
},
},
["死亡之愿（语音）"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"12328",
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["unit"] = "player",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["names"] = {
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
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 12328,
["realSpellName"] = "死亡之愿",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["text_text_format_p_time_format"] = 0,
["text_color"] = {
1,
0.88627450980392,
0.76862745098039,
1,
},
["text_font"] = "Rurutia",
["anchorXOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_text_format_p_time_precision"] = 1,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 21,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_anchorYOffset"] = -4,
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
["single"] = "WARRIOR",
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
["spellknown"] = 12328,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "死亡之愿（语音）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "trHNMw(XjBN",
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
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = 2,
["variable"] = "onCooldown",
["value"] = 0,
},
{
["trigger"] = 2,
["variable"] = "insufficientResources",
["value"] = 1,
},
},
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
["value"] = true,
["property"] = "cooldownEdge",
},
{
["property"] = "color",
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
["value"] = {
["sound_type"] = "Play",
["sound"] = " custom",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】竜が我が敌を喰らう！.ogg",
["sound_channel"] = "Master",
},
["property"] = "sound",
},
},
},
},
["cooldown"] = true,
["keepAspectRatio"] = true,
},
["嗜血（狂怒）"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["spellName"] = 23881,
["realSpellName"] = "嗜血",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 23881,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "嗜血（狂怒）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "z26pPgVxv4m",
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
0.874509871006012,
0.3411764800548554,
0.3294117748737335,
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
["keepAspectRatio"] = true,
},
["盾牌格挡"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["spellIds"] = {
},
["useName"] = true,
["auranames"] = {
"2565",
},
["unit"] = "player",
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
["spellName"] = 2565,
["realSpellName"] = "盾牌格挡",
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
["single"] = 98,
},
["spellName"] = 23922,
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["realSpellName"] = 0,
["use_spellName"] = true,
["event"] = "Talent Known",
["use_spec"] = true,
["use_unit"] = true,
["use_talent"] = true,
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_form"] = true,
["use_unit"] = true,
["type"] = "unit",
["debuffType"] = "HELPFUL",
["form"] = {
["single"] = 2,
},
["event"] = "Stance/Form/Aura",
["unit"] = "player",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[3]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["text_text_format_p_time_format"] = 0,
["text_color"] = {
1,
0.88627450980392,
0.76862745098039,
1,
},
["text_font"] = "Rurutia",
["anchorXOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_text_format_p_time_precision"] = 1,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 21,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_anchorYOffset"] = -4,
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
["single"] = "WARRIOR",
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
["spellknown"] = 2565,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "盾牌格挡",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "4Kkrq2XIyNO",
["inverse"] = false,
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
{
["check"] = {
["trigger"] = 4,
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
["keepAspectRatio"] = true,
},
["狂暴之怒"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"18499",
},
["names"] = {
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["useMatch_count"] = true,
["spellIds"] = {
},
["match_countOperator"] = ">",
["match_count"] = "0",
["unit"] = "player",
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
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 18499,
["realSpellName"] = "狂暴之怒",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 18499,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "狂暴之怒",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "BahRxduMOeC",
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
["keepAspectRatio"] = true,
},
["血性狂暴"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = false,
["useMatch_count"] = true,
["auraspellids"] = {
"2687",
"2688",
"29131",
},
["auranames"] = {
"2687",
},
["names"] = {
},
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["useExactSpellId"] = true,
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["match_count"] = "0",
["unit"] = "player",
["match_countOperator"] = ">",
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
["spellName"] = 2687,
["realSpellName"] = "血性狂暴",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 2687,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "血性狂暴",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "xiJLrXG4kuz",
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
["keepAspectRatio"] = true,
},
["【露露】主手平砍（战士）"] = {
["sparkWidth"] = 20,
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["yOffset"] = -19.18488637122144,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "",
["backgroundColor"] = {
0.31764705882353,
0.22745098039216,
0.16862745098039,
0,
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
["size"] = {
["multi"] = {
},
},
["spec"] = {
["single"] = 1,
["multi"] = {
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["WARRIOR"] = true,
},
},
["use_class"] = true,
["difficulty"] = {
["multi"] = {
},
},
["role"] = {
["multi"] = {
},
},
["use_spec"] = true,
["faction"] = {
["multi"] = {
},
},
["pvptalent"] = {
["multi"] = {
},
},
["race"] = {
["multi"] = {
},
},
["ingroup"] = {
["multi"] = {
},
},
["zoneIds"] = "",
},
["toolTipArea"] = "ICON",
["smoothProgress"] = true,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["texture"] = "!Rurutia10",
["sparkTexture"] = "XPBarAnim-OrangeSpark",
["auto"] = true,
["tocversion"] = 11508,
["alpha"] = 1,
["sparkColor"] = {
1,
1,
1,
1,
},
["borderBackdrop"] = "None",
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
["genericShowOn"] = "showOnActive",
["use_absorbMode"] = true,
["event"] = "Swing Timer",
["use_unit"] = true,
["duration"] = "1",
["names"] = {
},
["spellIds"] = {
},
["use_hand"] = true,
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["hand"] = "main",
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
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
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
["easeStrength"] = 3,
["duration_type"] = "seconds",
["preset"] = "grow",
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
["text_shadowXOffset"] = 1,
["text_text"] = "%p",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorYOffset"] = 0,
["anchorXOffset"] = 0,
["type"] = "subtext",
["text_text_format_p_format"] = "timed",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_n_format"] = "none",
["text_shadowYOffset"] = -1,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_text_format_p_time_precision"] = 1,
["anchor_point"] = "INNER_CENTER",
["text_fontSize"] = 12,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
},
},
["height"] = 5,
["textureSource"] = "LSM",
["sparkBlendMode"] = "ADD",
["useAdjustededMax"] = false,
["source"] = "import",
["config"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["useAdjustedMax"] = false,
["uid"] = "YphFL9b82uj",
["xOffset"] = -6.7816841681319e-05,
["zoom"] = 0,
["borderInFront"] = true,
["backdropColor"] = {
0,
0,
0,
1,
},
["icon_side"] = "RIGHT",
["progressSource"] = {
-1,
"",
},
["actions"] = {
["start"] = {
},
["finish"] = {
["do_glow"] = false,
},
["init"] = {
},
},
["sparkHeight"] = 14,
["anchorFrameType"] = "SCREEN",
["icon"] = false,
["parent"] = "战士 资源条",
["semver"] = "1.0.8",
["sparkHidden"] = "FULL",
["id"] = "【露露】主手平砍（战士）",
["sparkOffsetX"] = 0,
["frameStrata"] = 1,
["width"] = 297,
["desc"] = "自制自用WA，WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["spark"] = true,
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
["barColor2"] = {
1,
1,
0,
1,
},
["preferToUpdate"] = false,
},
["补挫志（防战）"] = {
["iconSource"] = -1,
["xOffset"] = 0,
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
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
["matchesShowOn"] = "showOnMissing",
["event"] = "Health",
["unit"] = "target",
["auranames"] = {
"6190",
"1735",
"702",
"67",
},
["useName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["auraspellids"] = {
"25203",
},
["subeventPrefix"] = "SPELL",
["debuffType"] = "HARMFUL",
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
["desaturate"] = true,
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
["text_text_format_p_time_dynamic_threshold"] = 2,
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
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "挫志",
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
0.77647058823529,
0.6078431372549,
0.42745098039216,
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
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowType"] = "Pixel",
["glowLength"] = 8,
["glowYOffset"] = 0,
["glowColor"] = {
1,
0,
0,
1,
},
["glowScale"] = 1,
["glowThickness"] = 2,
["glow"] = true,
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
["text_fontSize"] = 18,
["anchorXOffset"] = 0,
["text_text_format_p_time_format"] = 0,
},
},
["height"] = 30,
["load"] = {
["ingroup"] = {
["multi"] = {
["group"] = true,
["raid"] = true,
},
},
["use_encounter"] = true,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["WARLOCK"] = true,
},
},
["level_operator"] = {
">=",
},
["use_never"] = false,
["use_ingroup"] = false,
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["use_level"] = false,
["spec"] = {
["multi"] = {
},
},
["level"] = {
"60",
},
["spellknown"] = 23922,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["selfPoint"] = "CENTER",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "3",
["op"] = "<=",
},
["changes"] = {
{
["value"] = {
["sound_type"] = "Play",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】补挫志.ogg",
["sound"] = " custom",
["sound_channel"] = "Master",
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
["icon"] = true,
["config"] = {
},
["parent"] = "战士（BUFF）",
["anchorFrameParent"] = false,
["alpha"] = 1,
["url"] = "",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["tocversion"] = 11508,
["id"] = "补挫志（防战）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 30,
["authorOptions"] = {
},
["uid"] = "rz3BpagTMKB",
["inverse"] = false,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["displayIcon"] = "",
["cooldown"] = true,
["color"] = {
1,
1,
1,
1,
},
},
["破胆怒吼"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"5246",
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["unit"] = "target",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["names"] = {
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
["realSpellName"] = "破胆怒吼",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 5246,
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 5246,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "破胆怒吼",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "Ay(OyltsgPT",
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
["keepAspectRatio"] = true,
},
["惩戒痛击"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
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
"694",
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["unit"] = "target",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "SPELL",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "惩戒痛击",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 694,
["names"] = {
},
["use_track"] = true,
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
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "spiral",
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
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 694,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["url"] = "",
["icon"] = true,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "战士 动态分组 右",
["keepAspectRatio"] = true,
["uid"] = "W3y4Xg8MZoq",
["authorOptions"] = {
},
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.23",
["tocversion"] = 11508,
["id"] = "惩戒痛击",
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
["selfPoint"] = "CENTER",
},
["挑战怒吼"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
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
["showClones"] = false,
["useName"] = true,
["auranames"] = {
"1161",
},
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["unitExists"] = false,
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["names"] = {
},
["unit"] = "target",
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
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["realSpellName"] = "挑战怒吼",
["use_spellName"] = true,
["spellName"] = 1161,
["event"] = "Cooldown Progress (Spell)",
["use_showgcd"] = false,
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
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "spiral",
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
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 1161,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["url"] = "",
["icon"] = true,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "战士 动态分组 右",
["keepAspectRatio"] = true,
["uid"] = "NVqHUObi1gU",
["authorOptions"] = {
},
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.23",
["tocversion"] = 11508,
["id"] = "挑战怒吼",
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
["selfPoint"] = "CENTER",
},
["横扫攻击"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"12292",
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["unit"] = "player",
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
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 12292,
["realSpellName"] = "横扫攻击",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 12292,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "横扫攻击",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "qUUsC5B8WFQ",
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
["keepAspectRatio"] = true,
},
["雷霆一击（狂怒/武器）"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["realSpellName"] = "雷霆一击",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 8205,
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["type"] = "unit",
["talent"] = {
["single"] = 14,
},
["form"] = {
["single"] = 2,
},
["event"] = "Stance/Form/Aura",
["unit"] = "player",
["use_inverse"] = false,
["use_talent"] = true,
["use_unit"] = true,
["use_form"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["talent"] = {
["single"] = 14,
},
["form"] = {
["single"] = 1,
},
["event"] = "Stance/Form/Aura",
["unit"] = "player",
["use_inverse"] = false,
["use_talent"] = true,
["use_unit"] = true,
["use_form"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2] or t[3]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["single"] = 87,
["multi"] = {
[59] = true,
[87] = true,
[99] = true,
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
},
},
["not_spellknown"] = 12298,
["use_not_spellknown"] = true,
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
["spellknown"] = 8205,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
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
["preferToUpdate"] = false,
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
["variable"] = "onCooldown",
["value"] = 1,
["checks"] = {
{
["trigger"] = 1,
["variable"] = "onCooldown",
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
["value"] = true,
["property"] = "desaturate",
},
},
},
},
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["uid"] = "2yDsURQ65CF",
["parent"] = "战士 动态分组 左",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["authorOptions"] = {
},
["semver"] = "2.0.23",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "雷霆一击（狂怒/武器）",
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["width"] = 32,
["useCooldownModRate"] = true,
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
["keepAspectRatio"] = true,
},
["盾击"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
["spellName"] = 72,
["realSpellName"] = "盾击",
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
["type"] = "item",
["use_itemTypeName"] = false,
["itemTypeName"] = {
["multi"] = {
[1030] = true,
},
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_itemName"] = true,
["event"] = "Item Type Equipped",
["itemName"] = 0,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
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
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 72,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "盾击",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "zFLY)16VXo7",
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
["keepAspectRatio"] = true,
},
["挫志怒吼（三系）"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
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
["useExactSpellId"] = false,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["auranames"] = {
"1160",
},
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
["progressSource"] = {
-1,
"",
},
["animation"] = {
["start"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "spiral",
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
["version"] = 25,
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
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["single"] = 51,
["multi"] = {
[51] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
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
["spellknown"] = 1160,
["zoneIds"] = "",
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["url"] = "",
["icon"] = true,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "战士 动态分组 右",
["keepAspectRatio"] = true,
["uid"] = "QM85Lg7oW(e",
["authorOptions"] = {
},
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.23",
["tocversion"] = 11508,
["id"] = "挫志怒吼（三系）",
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
},
["cooldown"] = true,
["selfPoint"] = "CENTER",
},
["狂怒（战士，天赋）"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
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
["useExactSpellId"] = false,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["auranames"] = {
"12795",
},
["names"] = {
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["power"] = {
"0",
},
["power_operator"] = {
">=",
},
["use_power"] = true,
["use_requirePowerType"] = false,
["use_percentpower"] = false,
["debuffType"] = "HELPFUL",
["powertype"] = 1,
["use_powertype"] = true,
["event"] = "Power",
["unit"] = "player",
["use_unit"] = true,
["percentpower"] = {
},
["percentpower_operator"] = {
"<=",
},
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[1]\nend",
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
["easeType"] = "none",
["easeStrength"] = 3,
["preset"] = "spiral",
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
["version"] = 25,
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
},
["height"] = 32,
["load"] = {
["ingroup"] = {
},
["use_never"] = false,
["talent"] = {
["multi"] = {
[42] = true,
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
},
},
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
["use_class"] = true,
["use_spellknown"] = false,
["use_petbattle"] = false,
["use_spec"] = true,
["raid_role"] = {
},
["race"] = {
},
["spellknown"] = 18265,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["url"] = "",
["icon"] = true,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["parent"] = "战士（BUFF）",
["keepAspectRatio"] = true,
["uid"] = "EJVKauSI43x",
["authorOptions"] = {
},
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.23",
["tocversion"] = 11508,
["id"] = "狂怒（战士，天赋）",
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
},
["cooldown"] = true,
["selfPoint"] = "CENTER",
},
["血条斩杀线提示（战士）"] = {
["iconSource"] = 0,
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 1,
["anchorPoint"] = "LEFT",
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
["duration"] = "1",
["use_unit"] = true,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["health_operator"] = {
">=",
},
["type"] = "unit",
["use_health"] = false,
["nameplateType"] = "hostile",
["use_absorbMode"] = true,
["percenthealth"] = {
"20",
},
["event"] = "Health",
["unevent"] = "auto",
["spellIds"] = {
},
["use_absorbHealMode"] = true,
["health"] = {
"80",
},
["subeventSuffix"] = "_CAST_START",
["use_nameplateType"] = true,
["use_percenthealth"] = true,
["percenthealth_operator"] = {
"<=",
},
["unit"] = "nameplate",
},
["untrigger"] = {
["unit"] = "nameplate",
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
["selfPoint"] = "RIGHT",
["desc"] = "",
["version"] = 7,
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
["text_font"] = "Friz Quadrata TT",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 12,
["anchorXOffset"] = 0,
["text_visible"] = true,
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["glowXOffset"] = 0,
["glowType"] = "ACShine",
["glowLength"] = 4.1,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["glow"] = true,
["glowScale"] = 1.2,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 6,
["glowBorder"] = false,
},
},
["height"] = 15,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 3,
["multi"] = {
[8] = true,
[9] = true,
[3] = true,
},
},
["use_class_and_spec"] = true,
["zoneIds"] = "",
["use_class"] = true,
["use_spellknown"] = true,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
["PALADIN"] = true,
},
},
["class_and_spec"] = {
["single"] = 63,
["multi"] = {
[70] = true,
[65] = true,
[66] = true,
},
},
["covenant"] = {
["multi"] = {
["1"] = true,
["4"] = true,
["3"] = true,
["0"] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 5308,
["size"] = {
["multi"] = {
},
},
},
["icon"] = true,
["useAdjustededMax"] = false,
["preferToUpdate"] = false,
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
["cooldown"] = false,
["displayIcon"] = 135358,
["desaturate"] = false,
["keepAspectRatio"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "vJuhdtlbkfr",
["xOffset"] = -10,
["width"] = 18,
["alpha"] = 1,
["anchorFrameParent"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "血条斩杀线提示（战士）",
["frameStrata"] = 5,
["useCooldownModRate"] = true,
["anchorFrameType"] = "NAMEPLATE",
["url"] = "",
["config"] = {
},
["inverse"] = false,
["authorOptions"] = {
},
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["parent"] = "战士（中心分组）",
},
["战士 核心分组"] = {
["grow"] = "CUSTOM",
["controlledChildren"] = {
"英勇打击",
"顺劈斩",
"嗜血（狂怒）",
"旋风斩",
"斩杀（狂怒/武器）",
"压制（语音）",
"致死打击",
"盾牌猛击",
"复仇（强化复仇）",
"撕裂（防护）",
"猛击",
"雷霆一击（防护）",
"盾牌格挡",
"横扫攻击",
"死亡之愿（语音）",
"震荡猛击",
"破釜沉舟",
"盾击",
"拳击",
"狂暴之怒",
"血性狂暴",
"破胆怒吼",
"反击风暴",
"鲁莽",
"盾墙",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["xOffset"] = 0,
["preferToUpdate"] = false,
["limit"] = 5,
["groupIcon"] = "interface/icons/classicon_warrior.blp",
["sortHybridTable"] = {
["致死打击"] = false,
["盾墙"] = false,
["盾牌格挡"] = false,
["撕裂（防护）"] = false,
["嗜血（狂怒）"] = false,
["死亡之愿（语音）"] = false,
["旋风斩"] = false,
["复仇（强化复仇）"] = false,
["血性狂暴"] = false,
["狂暴之怒"] = false,
["破胆怒吼"] = false,
["英勇打击"] = false,
["震荡猛击"] = false,
["盾牌猛击"] = false,
["横扫攻击"] = false,
["斩杀（狂怒/武器）"] = false,
["猛击"] = false,
["压制（语音）"] = false,
["顺劈斩"] = false,
["破釜沉舟"] = false,
["拳击"] = false,
["反击风暴"] = false,
["鲁莽"] = false,
["盾击"] = false,
["雷霆一击（防护）"] = false,
},
["gridWidth"] = 5,
["gridType"] = "RD",
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
["finish"] = {
},
["init"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["unit"] = "player",
["type"] = "aura2",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["event"] = "Health",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
},
["columnSpace"] = 1,
["radius"] = 200,
["authorOptions"] = {
},
["selfPoint"] = "CENTER",
["align"] = "CENTER",
["growOn"] = "changed",
["arcLength"] = 360,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["useLimit"] = false,
["version"] = 3,
["rotation"] = 0,
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
["uid"] = "0Qb7K)QLuyr",
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
["parent"] = "战士（中心分组）",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["config"] = {
},
["animate"] = false,
["customGrow"] = "function(newPositions, activeRegions)\n    local limits = { --icons per row\n        7, --row 1\n        9, --row 2\n        \n    }\n    local rows = #limits -- total rows (matches limits size)\n    local iconSizes = { --have to match #limits size (if limits is {x,y} iconSizes have to be {a, b}, i.e. 2 and 2)\n        40, --row 1\n        35, --row 2\n        \n    }\n    local spacings = {\n        1, --row 1\n        40, --row 2\n        \n    }\n    \n    -- spacing between icons\n    local checkFit = true --resize only if total clones > totalWidth. Otherwise 1-2 icons will be giga huge\n    ----------------------\n    local check = true\n    \n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    local lastRowCount = 0\n    \n    local limit = limits[yCount+1]\n    local firstRowLimit = limits[yCount+1]\n    \n    local xSpacing = 3\n    local ySpacing = spacings[yCount+1]\n    local offset = spacings[yCount+1]\n    \n    local xOffset = 0\n    local yOffset = 0\n    \n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        \n        local region = regionData.region\n        if iconSizes[yCount+1] then\n            regionData.region:SetRegionWidth(iconSizes[yCount+1])\n            regionData.region:SetRegionHeight(iconSizes[yCount+1])\n        end\n        \n        local why = 0\n        for i=1, yCount+1 do\n            local wtf = (i==1 or i==yCount+1) and iconSizes[i]/2 or iconSizes[i]\n            why = why + wtf\n        end\n        local shift = yCount == 0 and 0 or why + offset\n        \n        local width = width or region.width\n        local totalWidth = totalWidth or (width + xSpacing) * limit\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= firstRowLimit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows - 1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        if yCount == rows - 1 then\n            local fit = checkFit and (width + xSpacing) * rowTotal < totalWidth\n            local lastRowWidth = fit and width or ((totalWidth - (rowTotal * xSpacing)) / rowTotal)\n            \n            xOffset = 0 - (lastRowWidth + xSpacing) / 2 * (rowTotal - 1) + (lastRowCount * (lastRowWidth + xSpacing))\n            yOffset = 0 - (shift - (width - lastRowWidth) / 2)-- change '-' to '+' after 0 to grow up instead of down\n            \n            lastRowCount = lastRowCount + 1\n            \n            regionData.region:SetRegionWidth(lastRowWidth)\n            regionData.region:SetRegionHeight(lastRowWidth)\n        else\n            xOffset = 0 - (width + xSpacing) / 2 * (rowTotal - 1) + (xCount * (width + xSpacing))\n            yOffset = 0 - shift\n        end\n        \n        xCount = xCount + 1\n        \n        if yCount < rows - 1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n                limit = limits[yCount+1]\n                ySpacing = spacings[yCount+1]\n                offset = offset + ySpacing\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["sort"] = "none",
["frameStrata"] = 1,
["source"] = "import",
["constantFactor"] = "RADIUS",
["space"] = 3,
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11508,
["id"] = "战士 核心分组",
["regionType"] = "dynamicgroup",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["internalVersion"] = 90,
["borderInset"] = 1,
["fullCircle"] = true,
["anchorPoint"] = "CENTER",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["yOffset"] = 0.5,
},
["战士 资源条"] = {
["controlledChildren"] = {
"【露露】主手平砍（战士）",
"【露露】副手平砍（战士）",
"战士 怒气条",
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
["selfPoint"] = "CENTER",
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
["uid"] = "YRlGVBsVYBz",
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
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11508,
["id"] = "战士 资源条",
["xOffset"] = 0,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["parent"] = "战士（中心分组）",
["config"] = {
},
["borderInset"] = 1,
["frameStrata"] = 1,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["groupIcon"] = "interface/icons/classicon_warrior.blp",
},
["震荡猛击"] = {
["iconSource"] = -1,
["wagoID"] = "0AFdqklgD",
["xOffset"] = 0,
["adjustedMax"] = "",
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
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["auranames"] = {
"12809",
},
["event"] = "Health",
["unit"] = "target",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["names"] = {
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
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 12809,
["realSpellName"] = "震荡猛击",
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
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 25,
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
["single"] = "WARRIOR",
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
["spellknown"] = 12809,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
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
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["authorOptions"] = {
},
["width"] = 32,
["anchorFrameParent"] = false,
["parent"] = "战士 核心分组",
["semver"] = "2.0.23",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "震荡猛击",
["zoom"] = 0.3,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "7PXlsEfw6om",
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
["keepAspectRatio"] = true,
},
},
}
