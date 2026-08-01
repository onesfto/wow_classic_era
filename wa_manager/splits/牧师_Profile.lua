
WeakAurasSaved = {
["editor_tab_spaces"] = 4,
["login_squelch_time"] = 10,
["PULL(Need DBM BW ERT)PULL"] = 5,
["dbVersion"] = 90,
["标记目标 Mark TargetSet"] = false,
["displays"] = {
["牧师（右侧图标）"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"能量灌注（战斗）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 303,
["yOffset"] = 160,
["anchorPoint"] = "CENTER",
["fullCircle"] = true,
["space"] = 1,
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
["columnSpace"] = 1,
["internalVersion"] = 90,
["selfPoint"] = "BOTTOMLEFT",
["align"] = "RIGHT",
["desc"] = "",
["rotation"] = 0,
["frameStrata"] = 3,
["stepAngle"] = 15,
["subRegions"] = {
},
["gridType"] = "RD",
["borderColor"] = {
0,
0,
0,
1,
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
["authorOptions"] = {
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["parent"] = "牧师",
["animate"] = false,
["groupIcon"] = "interface/icons/classicon_priest.blp",
["scale"] = 1.02,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 5,
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
["constantFactor"] = "RADIUS",
["alpha"] = 1,
["borderOffset"] = 4,
["uid"] = "z457PzqkP6N",
["stagger"] = 0,
["id"] = "牧师（右侧图标）",
["useLimit"] = false,
["gridWidth"] = 5,
["anchorFrameType"] = "UIPARENT",
["sort"] = "none",
["config"] = {
},
["grow"] = "RIGHT",
["rowSpace"] = 1,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["radius"] = 200,
},
["漂浮术（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
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
["text"] = "Power Word: Fortitude\n",
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
["name"] = "Power Word: Fortitude",
["key"] = "power_word_fortitude",
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
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 漂浮术\")\nbtn:SetAttribute(\"macrotext2\",\"/cancelaura 漂浮术\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\"|cffffffff左键：|r|cffff8827漂浮术 (\" .. GetItemCount(\"轻羽毛\") .. \")|r\\n|cffffffff右键：|r|cffff8827取消漂浮术|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
["triggers"] = {
{
["trigger"] = {
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"1706",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["use_unit"] = true,
["unitExists"] = true,
["spellName"] = 1706,
["useName"] = true,
["type"] = "aura2",
["names"] = {
},
["unevent"] = "auto",
["unit"] = "player",
["matchesShowOn"] = "showOnActive",
["event"] = "Cooldown Progress (Spell)",
["use_itemName"] = true,
["realSpellName"] = "漂浮术",
["use_spellName"] = true,
["spellIds"] = {
},
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"1243",
"21562",
},
["duration"] = "1",
["genericShowOn"] = "showAlways",
["use_unit"] = true,
["unitExists"] = true,
["use_showgcd"] = false,
["spellName"] = 1706,
["subeventPrefix"] = "SPELL",
["type"] = "spell",
["unevent"] = "auto",
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["useName"] = true,
["event"] = "Cooldown Progress (Spell)",
["use_itemName"] = true,
["realSpellName"] = "漂浮术",
["use_spellName"] = true,
["spellIds"] = {
},
["unit"] = "player",
["use_genericShowOn"] = true,
["names"] = {
},
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.power_word_fortitude.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
["activeTriggerMode"] = 1,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
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
["glowDuration"] = 1,
["glowType"] = "Pixel",
["glowLength"] = 10,
["glowYOffset"] = 1,
["glowColor"] = {
1,
1,
1,
1,
},
["glow"] = false,
["glowScale"] = 2,
["glowThickness"] = 1,
["useGlowColor"] = false,
["glowXOffset"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 40,
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
["single"] = "PRIEST",
["multi"] = {
},
},
["spellknown"] = 1706,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["source"] = "import",
["cooldownEdge"] = true,
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
["icon"] = true,
["parent"] = "牧师 核心分组",
["uid"] = "J1bP3tfrYIK",
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "漂浮术（可点击施法）",
["semver"] = "2.0.0",
["alpha"] = 1,
["width"] = 40,
["cooldownTextDisabled"] = false,
["config"] = {
["maintenance"] = {
["power_word_fortitude"] = {
["behavior"] = 2,
},
},
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
["variable"] = "show",
["value"] = 1,
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
["牧师 资源条"] = {
["controlledChildren"] = {
"牧师 法力条",
"5秒回蓝（牧师）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["parent"] = "牧师（中心分组）",
["preferToUpdate"] = true,
["groupIcon"] = "interface/icons/classicon_priest.blp",
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
["uid"] = "5LhfEDguObp",
["yOffset"] = -26,
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "牧师 资源条",
["xOffset"] = 0,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["config"] = {
},
["borderInset"] = 1,
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
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["authorOptions"] = {
},
},
["能量灌注（戒律）可点击施法，显示姓名，露露语音"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["xOffset"] = 0,
["preferToUpdate"] = true,
["customText"] = "function()\n    if WeakAuras.IsOptionsOpen() then\n        return \"|cffff0000玩家姓名\"\n    end\n    \n    local Name = aura_env.state.unitName\n    if Name then\n        if WA_ClassColorName(Name) ~= \"\" then\n            Name = WA_ClassColorName(Name)\n        end\n        return Name\n    end\nend",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useMatch_count"] = true,
["subeventSuffix"] = "_CAST_START",
["auranames"] = {
"10060",
},
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["unit"] = "group",
["names"] = {
},
["spellIds"] = {
},
["useName"] = true,
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
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["unit"] = "player",
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "能量灌注",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 10060,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%c",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_format"] = "timed",
["anchorXOffset"] = 0,
["type"] = "subtext",
["text_text_format_c_format"] = "none",
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
["text_shadowYOffset"] = 0,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_p_time_precision"] = 1,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowXOffset"] = 0,
},
},
["height"] = 40,
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
["single"] = "PRIEST",
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
["spellknown"] = 10060,
["size"] = {
["multi"] = {
},
},
},
["url"] = "",
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
["authorOptions"] = {
},
["adjustedMin"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "of2cIJBdNW3",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 能量灌注\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffbf12\"..\"能量灌注\"..\"|r\\n\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "能量灌注（戒律）可点击施法，显示姓名，露露语音",
["useCooldownModRate"] = true,
["alpha"] = 1,
["width"] = 40,
["selfPoint"] = "CENTER",
["config"] = {
},
["inverse"] = true,
["adjustedMax"] = "",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["parent"] = "牧师 核心分组",
},
["心灵震爆（暗影）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 核心分组",
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
["realSpellName"] = "心灵震爆",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 8092,
},
["untrigger"] = {
["genericShowOn"] = "showAlways",
},
},
{
["trigger"] = {
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "target",
["spellIds"] = {
},
["auranames"] = {
"431655",
},
["useName"] = true,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = 1,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
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
["text_text"] = "%2.s",
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
["text_text_format_p_time_format"] = 0,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_mod_rate"] = true,
["type"] = "subtext",
["text_text_format_p_format"] = "timed",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_legacy_floor"] = false,
["text_anchorYOffset"] = -1,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_shadowYOffset"] = 0,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "TOP",
["text_fontSize"] = 18,
["anchorXOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
},
},
["height"] = 40,
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
["single"] = "PRIEST",
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
["spellknown"] = 15473,
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
["trigger"] = 2,
["variable"] = "stacks",
["op"] = "==",
["value"] = "3",
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
["trigger"] = -2,
["variable"] = "AND",
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
{
["check"] = {
["trigger"] = -2,
["variable"] = "AND",
["checks"] = {
{
["trigger"] = 2,
["variable"] = "show",
["value"] = 0,
},
{
["trigger"] = 1,
["variable"] = "onCooldown",
["value"] = 0,
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
},
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "ngXc(IBI6Gf",
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
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
["semver"] = "2.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "心灵震爆（暗影）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["width"] = 40,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
},
["能量灌注（战斗）"] = {
["iconSource"] = -1,
["parent"] = "牧师（右侧图标）",
["preferToUpdate"] = true,
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
["auranames"] = {
"59891",
},
["ownOnly"] = true,
["genericShowOn"] = "showAlways",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["useName"] = true,
["use_debuffClass"] = false,
["subeventSuffix"] = "_CAST_START",
["useExactSpellId"] = false,
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Spell)",
["auraspellids"] = {
},
["realSpellName"] = "能量灌注",
["use_spellName"] = true,
["spellIds"] = {
},
["type"] = "spell",
["spellName"] = 10060,
["unit"] = "player",
["use_track"] = true,
["names"] = {
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
["desaturate"] = false,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.2,
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
["glowScale"] = 2,
["glow"] = false,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["ingroup"] = {
["single"] = "raid",
["multi"] = {
["group"] = true,
["raid"] = true,
},
},
["use_never"] = false,
["talent"] = {
["multi"] = {
[2] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["use_ingroup"] = false,
["use_class"] = true,
["use_spellknown"] = true,
["use_itemequiped"] = false,
["faction"] = {
},
["class"] = {
["single"] = "PRIEST",
["multi"] = {
["PALADIN"] = true,
},
},
["use_combat"] = true,
["spellknown"] = 10060,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["useCooldownModRate"] = true,
["adjustedMax"] = "",
["xOffset"] = 0,
["cooldown"] = true,
["displayIcon"] = "",
["desc"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "6Q0o1tVC9UT",
["icon"] = true,
["width"] = 30,
["anchorFrameParent"] = false,
["url"] = "",
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["zoom"] = 0,
["tocversion"] = 20501,
["id"] = "能量灌注（战斗）",
["color"] = {
1,
1,
1,
1,
},
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
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
["config"] = {
},
["inverse"] = false,
["useTooltip"] = false,
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
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["authorOptions"] = {
},
},
["绝望祷言（三系，可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
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
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 绝望祷言\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cff2189ff\"..\"绝望祷言\"..\"|r\\n\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
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
["spellName"] = 19243,
["realSpellName"] = "防护恐惧结界",
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
["glowDuration"] = 1,
["glowType"] = "buttonOverlay",
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowLength"] = 10,
["glowScale"] = 1,
["useGlowColor"] = false,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 40,
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
["single"] = "PRIEST",
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
["spellknown"] = 19243,
["zoneIds"] = "",
},
["useCooldownModRate"] = true,
["useAdjustededMax"] = false,
["icon"] = true,
["source"] = "import",
["cooldownEdge"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "牧师 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["authorOptions"] = {
},
["config"] = {
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
["width"] = 40,
["anchorFrameParent"] = false,
["xOffset"] = 0,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "绝望祷言（三系，可点击施法）",
["cooldownTextDisabled"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "Afo8d2O6fWP",
["inverse"] = true,
["progressSource"] = {
-1,
"",
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
["value"] = 1,
["op"] = ">",
["variable"] = "show",
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
["adjustedMax"] = "",
},
["暗影形态（未开时提示）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 动态分组 左",
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
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"15473",
},
["matchesShowOn"] = "showOnMissing",
["subeventPrefix"] = "SPELL",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["duration"] = "1",
["unevent"] = "auto",
["names"] = {
},
["spellIds"] = {
},
["useName"] = true,
["use_itemName"] = true,
["use_unit"] = true,
["ownOnly"] = true,
["unit"] = "player",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    if t[3] then -- If in Rested Area\n        return false\n    end\n    \n    local behavior = aura_env.config.maintenance.shadowform.behavior\n    \n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2]\n    else -- Always Show\n        return true\n    end\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
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
["use_class"] = true,
["use_spellknown"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "PRIEST",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 15473,
["size"] = {
["multi"] = {
},
},
},
["url"] = "",
["useAdjustededMax"] = false,
["xOffset"] = 0,
["source"] = "import",
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
["uid"] = "LxgTxTTUIGZ",
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
["text"] = "Shadowform",
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
["name"] = "Shadowform",
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["collapse"] = false,
["type"] = "group",
["limitType"] = "none",
["groupType"] = "simple",
["key"] = "shadowform",
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
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "暗影形态（未开时提示）",
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["width"] = 32,
["useTooltip"] = false,
["config"] = {
["maintenance"] = {
["shadowform"] = {
["behavior"] = 2,
},
},
},
["inverse"] = false,
["color"] = {
1,
1,
1,
1,
},
["displayIcon"] = 136076,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
},
["精神分流（暗影）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["authorOptions"] = {
},
["preferToUpdate"] = true,
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
["names"] = {
},
["unitExists"] = true,
["unit"] = "player",
["spellIds"] = {
},
["auranames"] = {
"15271",
},
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
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
["version"] = 6,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "分流",
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
["anchorXOffset"] = 0,
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
["text_shadowYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 15,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_mod_rate"] = true,
},
{
["glowFrequency"] = 0.25,
["glow"] = true,
["useGlowColor"] = false,
["glowType"] = "ACShine",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["type"] = "subglow",
["glowXOffset"] = 0,
["glowThickness"] = 1,
["glowScale"] = 1,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["single"] = 85,
["multi"] = {
[35] = true,
[84] = true,
},
},
["size"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "PRIEST",
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_talent"] = true,
["use_class"] = true,
["race"] = {
},
["ingroup"] = {
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
["alpha"] = 1,
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
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["uid"] = "15X5nTGpmiB",
["url"] = "https://space.bilibili.com/455259",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["xOffset"] = 0,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.0",
["tocversion"] = 30400,
["id"] = "精神分流（暗影）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["width"] = 30,
["useCooldownModRate"] = true,
["config"] = {
},
["inverse"] = false,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["conditions"] = {
},
["cooldown"] = true,
["parent"] = "牧师（BUFF）",
},
["吸血鬼的拥抱"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["xOffset"] = 0,
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "TOP",
["cooldownSwipe"] = true,
["url"] = "",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = false,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 吸血鬼的拥抱\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff露露的快捷按钮\\n左键：|r|cffa22aff\"..\"吸血鬼的拥抱\"..\"|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["ownOnly"] = true,
["useExactSpellId"] = false,
["spellIds"] = {
},
["useName"] = true,
["unit"] = "target",
["names"] = {
},
["auranames"] = {
"15286",
},
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.vampiric_embrace.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
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
["version"] = 6,
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
["glow"] = true,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 32,
["authorOptions"] = {
},
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "PRIEST",
["multi"] = {
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
["spec"] = {
["single"] = 2,
["multi"] = {
[3] = true,
},
},
["spellknown"] = 15286,
["size"] = {
["multi"] = {
},
},
},
["cooldownEdge"] = true,
["useAdjustededMax"] = false,
["cooldown"] = true,
["source"] = "import",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 1,
},
["changes"] = {
{
["value"] = false,
["property"] = "desaturate",
},
},
},
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
},
},
},
["icon"] = true,
["adjustedMax"] = "",
["uid"] = "y9jk7pzA52G",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["useTooltip"] = false,
["anchorFrameType"] = "SELECTFRAME",
["useCooldownModRate"] = true,
["parent"] = "牧师 动态分组 右",
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "吸血鬼的拥抱",
["anchorFrameFrame"] = "WeakAuras:Core - Priest",
["frameStrata"] = 1,
["width"] = 32,
["selfPoint"] = "BOTTOM",
["config"] = {
},
["inverse"] = false,
["progressSource"] = {
-1,
"",
},
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
0.50585615634918,
},
},
["心灵专注（三系）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 核心分组",
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
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["useName"] = true,
["unit"] = "player",
["names"] = {
},
["auranames"] = {
"14751",
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
["realSpellName"] = "心灵专注",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 14751,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 40,
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
["single"] = "PRIEST",
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
["spellknown"] = 14751,
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
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "DvATF0auZCR",
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
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
["semver"] = "2.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "心灵专注（三系）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["width"] = 40,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 心灵专注\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cff2189ff\"..\"心灵专注\"..\"|r\\n\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["牧师 底部分组"] = {
["arcLength"] = 360,
["controlledChildren"] = {
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["regionType"] = "dynamicgroup",
["yOffset"] = -103,
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
["fullCircle"] = true,
["space"] = 3,
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
},
["selfPoint"] = "CENTER",
["align"] = "CENTER",
["growOn"] = "changed",
["borderColor"] = {
0,
0,
0,
1,
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["rotation"] = 0,
["version"] = 3,
["rowSpace"] = 1,
["grow"] = "CUSTOM",
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
["groupIcon"] = "626004",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["useLimit"] = false,
["source"] = "import",
["customGrow"] = "function(newPositions, activeRegions)\n    local limit = 8 -- limit of icons per row\n    local rows = 3 -- total rows\n    local spacing = 3 -- spacing between icons\n    ----------------------\n    local check = true\n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    \n    local xOffset = 0\n    local yOffset = 0\n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        local region = regionData.region\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= limit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows-1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        xOffset = 0 - (region.width + spacing) / 2 * (rowTotal-1) + (xCount * (region.width + spacing))\n        yOffset = 0 - (region.height + spacing) * yCount -- change '-' to '+' after 0 to grow up instead of down\n        \n        xCount = xCount + 1\n        \n        if yCount < rows-1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["sort"] = "none",
["gridWidth"] = 5,
["animate"] = false,
["constantFactor"] = "RADIUS",
["anchorPoint"] = "CENTER",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "牧师 底部分组",
["limit"] = 5,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["internalVersion"] = 90,
["borderInset"] = 1,
["uid"] = "hwRKdipbsvH",
["parent"] = "牧师（中心分组）",
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["xOffset"] = 0,
},
["心灵尖啸（三系，可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
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
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 心灵尖啸\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cff2189ff\"..\"心灵尖啸\"..\"|r\\n\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
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
["unit"] = "player",
["realSpellName"] = "防护恐惧结界",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 10890,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 40,
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
["single"] = "PRIEST",
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
["spellknown"] = 19243,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["progressSource"] = {
-1,
"",
},
["source"] = "import",
["parent"] = "牧师 核心分组",
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
["value"] = 1,
["op"] = ">",
["variable"] = "show",
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
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["adjustedMax"] = "",
["uid"] = "0VTjd4y(B6j",
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
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
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "心灵尖啸（三系，可点击施法）",
["zoom"] = 0.3,
["useCooldownModRate"] = true,
["width"] = 40,
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
["渐隐术（三系，可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 核心分组",
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
["auranames"] = {
"586",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["names"] = {
},
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
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["realSpellName"] = "渐隐术",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 586,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 40,
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
["single"] = "PRIEST",
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
["spellknown"] = 586,
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
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "ev7DUSbiFxA",
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
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
["semver"] = "2.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "渐隐术（三系，可点击施法）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["width"] = 40,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 渐隐术\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cff2189ff\"..\"渐隐术\"..\"|r\\n\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["牧师 技能释放与就绪发言（语音）"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["displayText"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["displayText_format_p_time_format"] = 0,
["url"] = "",
["icon"] = true,
["displayText_format_p_time_mod_rate"] = true,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["font"] = "Rurutia",
["load"] = {
["use_level"] = false,
["talent"] = {
["multi"] = {
[2] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = false,
["level_operator"] = {
">=",
},
["class"] = {
["single"] = "PRIEST",
["multi"] = {
},
},
["level"] = {
"70",
},
["spellknown"] = 10060,
["size"] = {
["multi"] = {
},
},
},
["shadowXOffset"] = 1,
["useAdjustededMin"] = false,
["regionType"] = "text",
["zoom"] = 0,
["tocversion"] = 30403,
["alpha"] = 0,
["uid"] = "jKZMSSYhElD",
["displayIcon"] = "",
["outline"] = "OUTLINE",
["parent"] = "牧师（BUFF）",
["adjustedMin"] = "",
["shadowYOffset"] = -1,
["cooldownSwipe"] = true,
["customTextUpdate"] = "event",
["automaticWidth"] = "Auto",
["triggers"] = {
{
["trigger"] = {
["spellId"] = {
"10060",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "SPELL",
["use_direction"] = true,
["debuffType"] = "HELPFUL",
["use_sourceName"] = false,
["names"] = {
},
["subeventSuffix"] = "_CAST_SUCCESS",
["sourceUnit"] = "player",
["unit"] = "player",
["event"] = "Combat Log",
["use_spellName"] = false,
["realSpellName"] = "能量灌注",
["use_spellId"] = true,
["spellIds"] = {
},
["use_sourceUnit"] = true,
["type"] = "combatlog",
["duration"] = "3",
["use_track"] = true,
["spellName"] = {
10060,
},
},
["untrigger"] = {
},
},
{
["trigger"] = {
["spellId"] = "6346",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "SPELL",
["use_direction"] = true,
["spellName"] = 10060,
["use_sourceName"] = false,
["debuffType"] = "HELPFUL",
["subeventSuffix"] = "_CAST_SUCCESS",
["use_track"] = true,
["duration"] = "3",
["event"] = "Cooldown Ready (Spell)",
["type"] = "spell",
["realSpellName"] = "能量灌注",
["use_spellName"] = true,
["spellIds"] = {
},
["use_sourceUnit"] = true,
["use_spellId"] = true,
["unit"] = "player",
["sourceUnit"] = "player",
["names"] = {
},
},
["untrigger"] = {
},
},
{
["trigger"] = {
["spellId"] = {
"6346",
},
["duration"] = "3",
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_direction"] = true,
["debuffType"] = "HELPFUL",
["type"] = "combatlog",
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_SUCCESS",
["sourceUnit"] = "player",
["names"] = {
},
["event"] = "Combat Log",
["use_spellName"] = false,
["realSpellName"] = "能量灌注",
["use_spellId"] = true,
["spellIds"] = {
},
["use_sourceUnit"] = true,
["use_sourceName"] = false,
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = {
10060,
},
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["displayText_format_p_format"] = "timed",
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
["subRegions"] = {
{
["type"] = "subbackground",
},
},
["height"] = 30,
["useAdjustededMax"] = false,
["fontSize"] = 12,
["source"] = "import",
["preferToUpdate"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["displayText_format_p_time_dynamic_threshold"] = 60,
["config"] = {
},
["adjustedMax"] = "",
["color"] = {
1,
1,
1,
1,
},
["xOffset"] = 0,
["wordWrap"] = "WordWrap",
["displayText_format_p_time_precision"] = 1,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["justify"] = "LEFT",
["cooldownEdge"] = false,
["id"] = "牧师 技能释放与就绪发言（语音）",
["fixedWidth"] = 200,
["frameStrata"] = 1,
["width"] = 30,
["anchorFrameParent"] = false,
["desc"] = "",
["inverse"] = false,
["actions"] = {
["start"] = {
["message_format_1.unitName_format"] = "none",
["message_format_1.destName_format"] = "none",
["message_type"] = "SAY",
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
["shadowColor"] = {
0,
0,
0,
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
["value"] = {
["message"] = "已对 %1.destName 施放 %1.spellName",
["message_format_1.destName_format"] = "none",
["message_format_n_format"] = "none",
["message_format_1.spellName._format"] = "none",
["message_format_1.spellName_format"] = "none",
["message_type"] = "SMARTRAID",
},
["property"] = "chat",
},
},
},
{
["check"] = {
["trigger"] = 2,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = {
["sound_type"] = "Play",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】灌注好啦.ogg",
["sound"] = " custom",
["sound_channel"] = "Master",
},
["property"] = "sound",
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
["value"] = {
["message_format_1.destName_format"] = "none",
["message_type"] = "SMARTRAID",
["message_format_3.spellName_format"] = "none",
["message_format_3.destName_format"] = "none",
["message"] = "已对 %3.destName 施放 %3.spellName",
["message_format_6.spellName_format"] = "none",
["message_format_1.spellName_format"] = "none",
["message_format_4.spellName_format"] = "none",
["message_format_n_format"] = "none",
["message_format_5.spellName_format"] = "none",
["message_format_7.destName_format"] = "none",
["message_format_7.spellName_format"] = "none",
},
["property"] = "chat",
},
},
},
},
["cooldown"] = false,
["displayText_format_p_time_legacy_floor"] = false,
},
["暗影之波"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 动态分组 右",
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
["showClones"] = false,
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
["matchesShowOn"] = "showOnActive",
["event"] = "Health",
["unit"] = "player",
["unitExists"] = true,
["names"] = {
},
["spellIds"] = {
},
["auranames"] = {
"15258",
},
["subeventPrefix"] = "SPELL",
["auraspellids"] = {
"146739",
},
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
["version"] = 6,
["subRegions"] = {
{
["type"] = "subbackground",
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
["type"] = "subglow",
["glowXOffset"] = 0,
["glowThickness"] = 1,
["glowScale"] = 1,
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
["text_anchorYOffset"] = -1,
["text_color"] = {
1,
1,
1,
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
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
},
},
["height"] = 32,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
[35] = true,
[81] = true,
},
},
["class"] = {
["single"] = "PRIEST",
["multi"] = {
},
},
["use_talent"] = false,
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
["useAdjustededMax"] = false,
["width"] = 32,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
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
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "暗影之波",
["auto"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "Lzi7swxwsPc",
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
["variable"] = "expirationTime",
["op"] = "<=",
["value"] = "5",
},
["changes"] = {
{
["value"] = true,
},
{
["value"] = "Pixel",
},
},
},
},
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
["噬灵瘟疫（暗影）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 核心分组",
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
["showClones"] = false,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["auranames"] = {
"2944",
},
["subeventPrefix"] = "SPELL",
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["ownOnly"] = true,
["spellIds"] = {
},
["useExactSpellId"] = false,
["auraspellids"] = {
"146739",
},
["useName"] = true,
["unit"] = "target",
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["talent"] = {
["single"] = 61,
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
{
["trigger"] = {
["type"] = "unit",
["talent"] = {
["single"] = 19,
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
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
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
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 3,
["text_text_format_p_time_legacy_floor"] = false,
},
},
["height"] = 40,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
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
["use_class"] = true,
["use_spellknown"] = true,
["race"] = {
},
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
["spellknown"] = 15473,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 40,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
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
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "噬灵瘟疫（暗影）",
["auto"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = true,
["uid"] = "F7aR0aW(x65",
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
["variable"] = "expirationTime",
["op"] = "<=",
["value"] = "1.5",
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.3.text_color",
},
},
},
},
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
["精神之灵/精神祷言（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 核心分组",
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
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"14752",
"27681",
},
["matchesShowOn"] = "showAlways",
["unit"] = "player",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
["spellIds"] = {
},
["duration"] = "1",
["useName"] = true,
["use_itemName"] = true,
["use_unit"] = true,
["names"] = {
},
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.divine_spirit.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
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
["height"] = 40,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "PRIEST",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 14752,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 40,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 神圣之灵\")\nbtn:SetAttribute(\"macrotext2\",\"/cast 精神祷言\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff左键：|r|cff2189ff\"..\"神圣之灵\"..\"|r\\n\"..\n            \"|cffffffff右键：|r|cff2189ff\"..\"精神祷言\"..\"|r\\n\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
["xOffset"] = 0,
["config"] = {
["maintenance"] = {
["divine_spirit"] = {
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
["text"] = "Divine Spirit",
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
["name"] = "Divine Spirit",
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["collapse"] = false,
["type"] = "group",
["limitType"] = "none",
["groupType"] = "simple",
["key"] = "divine_spirit",
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
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["zoom"] = 0.3,
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "精神之灵/精神祷言（可点击施法）",
["auto"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "j71O0dREfxs",
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
["心灵之火（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 核心分组",
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
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"588",
},
["matchesShowOn"] = "showAlways",
["unit"] = "player",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
["spellIds"] = {
},
["duration"] = "1",
["useName"] = true,
["use_itemName"] = true,
["use_unit"] = true,
["names"] = {
},
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "function(t)\n    if t[5] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.inner_fire.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3] or t[4]\n    else -- Always Show\n        return true\n    end\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
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
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_anchorYOffset"] = -4,
["text_color"] = {
1,
0.86274509803922,
0.62745098039216,
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
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
},
},
["height"] = 40,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "PRIEST",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 588,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 40,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cancelaura 心灵之火\\n/cast 心灵之火\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffff8827\"..\"心灵之火\"..\"|r\\n\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
["xOffset"] = 0,
["config"] = {
["maintenance"] = {
["inner_fire"] = {
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
["text"] = "Inner Fire",
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
["name"] = "Inner Fire",
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["collapse"] = false,
["type"] = "group",
["limitType"] = "none",
["groupType"] = "simple",
["key"] = "inner_fire",
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
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["zoom"] = 0.3,
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "心灵之火（可点击施法）",
["auto"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "01deS1TdBzm",
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
["牧师 法力条"] = {
["sparkWidth"] = 5,
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
["role"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["use_vehicleUi"] = false,
["class"] = {
["single"] = "PRIEST",
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
["pvptalent"] = {
["multi"] = {
},
},
["faction"] = {
["multi"] = {
},
},
},
["toolTipArea"] = "ICON",
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["texture"] = "Solid",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["spark"] = false,
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
["parent"] = "牧师 资源条",
["customText"] = "function()\n    local mana = UnitPower(\"player\",0)\n    local manaMax = UnitPowerMax(\"player\",0)\n    local manaPerc = (mana / manaMax) * 100\n    return string.format(\"%.0f\",manaPerc)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
["customTextUpdate"] = "event",
["triggers"] = {
{
["trigger"] = {
["ownOnly"] = true,
["use_showCost"] = true,
["names"] = {
"Прославление",
},
["powertype"] = 0,
["use_powertype"] = true,
["custom_hide"] = "timed",
["spellName"] = 200183,
["type"] = "unit",
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
["use_showOn"] = true,
["unit"] = "player",
["event"] = "Power",
["use_genericShowOn"] = true,
["realSpellName"] = "Прославление",
["use_spellName"] = true,
["spellIds"] = {
200183,
},
["use_unit"] = true,
["duration"] = "1",
["subeventSuffix"] = "_CAST_START",
["genericShowOn"] = "showOnCooldown",
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
["colorB"] = 1,
["y"] = 0,
["x"] = 0,
["preset"] = "fade",
["easeStrength"] = 3,
["translateType"] = "straightTranslate",
["rotate"] = 0,
["duration_type"] = "seconds",
["duration"] = "",
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
["border_offset"] = 0.5,
["type"] = "subborder",
["border_visible"] = false,
["border_color"] = {
0,
0,
0,
1,
},
["anchor_area"] = "bar",
["border_edge"] = "Square Full White",
["border_size"] = 1,
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
["text_visible"] = true,
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_1.percentpower_decimal_precision"] = 0,
["text_text_format_1.power_decimal_precision"] = 0,
["text_text_format_1.percentpower_pad"] = false,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_font"] = "Rurutia",
["text_text_format_1.percentpower_round_type"] = "floor",
["text_anchorYOffset"] = -0.5,
["text_text_format_1.percentpower_format"] = "Number",
["text_text_format_1.percentpower_pad_max"] = 8,
["text_text_format_1.percentpower_pad_mode"] = "left",
["text_fixedWidth"] = 64,
["text_text_format_1.power_format"] = "Number",
["anchor_point"] = "INNER_CENTER",
["text_text_format_1.power_pad_mode"] = "left",
["text_text_format_1.power_pad"] = false,
["text_fontType"] = "OUTLINE",
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
["auto"] = true,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["zoom"] = 0,
["adjustedMax"] = "",
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
["uid"] = "ZuzdWKd2XkU",
["borderInFront"] = false,
["borderBackdrop"] = "None",
["icon_side"] = "RIGHT",
["config"] = {
},
["width"] = 297,
["sparkHeight"] = 20,
["sparkRotationMode"] = "MANUAL",
["overlaysTexture"] = {
"Solid",
},
["icon"] = false,
["semver"] = "1.1.0",
["id"] = "牧师 法力条",
["sparkHidden"] = "BOTH",
["xOffset"] = 0,
["frameStrata"] = 2,
["anchorFrameType"] = "SCREEN",
["overlays"] = {
{
0,
0,
0,
0.4000000357627869,
},
},
["useAdjustededMax"] = false,
["inverse"] = false,
["sparkDesature"] = false,
["orientation"] = "HORIZONTAL",
["conditions"] = {
},
["barColor2"] = {
0.2235294282436371,
0.6274510025978088,
0.9921569228172302,
1,
},
["adjustedMin"] = "",
},
["防护恐惧结界（三系，可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 核心分组",
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
["useMatch_count"] = true,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["unit"] = "group",
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["auranames"] = {
"6346",
},
["match_countOperator"] = ">",
["spellIds"] = {
},
["names"] = {
},
["match_count"] = "0",
["useGroup_count"] = false,
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
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["realSpellName"] = "防护恐惧结界",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 6346,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 40,
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
["single"] = "PRIEST",
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
["spellknown"] = 6346,
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
["op"] = ">",
["value"] = 1,
["variable"] = "show",
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
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "Whrr63XxLOu",
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
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
["semver"] = "2.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "防护恐惧结界（三系，可点击施法）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["width"] = 40,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 防护恐惧结界\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffff8827\"..\"防护恐惧结界\"..\"|r\\n\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
},
["沉默（暗影）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 核心分组",
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
["auranames"] = {
"15487",
},
["event"] = "Health",
["unit"] = "target",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
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
["names"] = {
},
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["realSpellName"] = "沉默",
["use_spellName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 15487,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 40,
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
["single"] = "PRIEST",
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
["spellknown"] = 15487,
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
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "KbLNyE9wnQj",
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
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
["semver"] = "2.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "沉默（暗影）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["width"] = 40,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
},
["暗言术：痛（暗影）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 动态分组 右",
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
["showClones"] = false,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["auranames"] = {
"589",
},
["subeventPrefix"] = "SPELL",
["matchesShowOn"] = "showAlways",
["event"] = "Health",
["names"] = {
},
["unitExists"] = true,
["ownOnly"] = true,
["spellIds"] = {
},
["useExactSpellId"] = false,
["auraspellids"] = {
"146739",
},
["useName"] = true,
["unit"] = "target",
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "unit",
["talent"] = {
["single"] = 61,
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
{
["trigger"] = {
["type"] = "unit",
["talent"] = {
["single"] = 19,
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
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
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
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "CENTER",
["text_fontSize"] = 16,
["text_text_format_p_time_dynamic_threshold"] = 3,
["text_text_format_p_time_legacy_floor"] = false,
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
["single"] = "PRIEST",
["multi"] = {
},
},
["zoneIds"] = "",
["use_class"] = true,
["use_spellknown"] = true,
["race"] = {
},
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
["spellknown"] = 15473,
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
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
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
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "暗言术：痛（暗影）",
["auto"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "XOiM4bRuuuk",
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
["variable"] = "expirationTime",
["op"] = "<=",
["value"] = "1.5",
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.2.glow",
},
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.3.text_color",
},
},
},
},
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
["防护暗影/暗影防护祷言（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 核心分组",
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
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"976",
"27683",
},
["matchesShowOn"] = "showAlways",
["unit"] = "player",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
["spellIds"] = {
},
["duration"] = "1",
["useName"] = true,
["use_itemName"] = true,
["use_unit"] = true,
["names"] = {
},
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.shadow_protection.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
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
["height"] = 40,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "PRIEST",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 976,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 40,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 防护暗影\")\nbtn:SetAttribute(\"macrotext2\",\"/cast 暗影防护祷言\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff左键：|r|cffff36ba\"..\"防护暗影\"..\"|r\\n\"..\n            \"|cffffffff右键：|r|cffff36ba\"..\"暗影防护祷言\"..\"|r\\n\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
["xOffset"] = 0,
["config"] = {
["maintenance"] = {
["shadow_protection"] = {
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
["text"] = "Shadow Protection",
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
["name"] = "Shadow Protection",
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["collapse"] = false,
["type"] = "group",
["limitType"] = "none",
["groupType"] = "simple",
["key"] = "shadow_protection",
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
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["zoom"] = 0.3,
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "防护暗影/暗影防护祷言（可点击施法）",
["auto"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "KbFQd8TKWCD",
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
["5秒回蓝（牧师）"] = {
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
["preferToUpdate"] = true,
["yOffset"] = -3,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["url"] = "",
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
["single"] = "PRIEST",
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
["uid"] = "EVN1(lBE)iQ",
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "XoGkZt2VR",
["parent"] = "牧师 资源条",
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
["spellIds"] = {
},
["custom"] = "function(a, e, t)\n    local currMana = UnitPower(\"player\", 0)\n    local maxMana = UnitPowerMax(\"player\", 0)\n    if currMana < maxMana then\n        if (e == \"UNIT_POWER_FREQUENT\" and currMana > (aura_env.lastMana or 0))\n        then\n            local dur = 2\n            a[\"\"] = {\n                show = true,\n                changed = true,\n                duration = dur,\n                expirationTime = GetTime() + dur,\n                progressType = \"timed\",\n                autoHide = true\n            }\n            aura_env.lastMana = currMana\n        elseif e == \"UNIT_SPELLCAST_SUCCEEDED\" and currMana < (aura_env.lastMana or math.huge) then\n            local dur = 6.45\n            a[\"\"] = {\n                show = true,\n                changed = true,\n                duration = dur,\n                expirationTime = GetTime() + dur,\n                progressType = \"timed\",\n                autoHide = true\n            }\n            aura_env.lastMana = currMana\n        end\n    end\n    return true\nend",
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
["sparkHeight"] = 30,
["sparkColor"] = {
1,
1,
1,
1,
},
["useAdjustededMax"] = false,
["anchorFrameType"] = "SCREEN",
["semver"] = "1.1.2",
["id"] = "5秒回蓝（牧师）",
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
["光明之井（神圣）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 核心分组",
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
["realSpellName"] = "光明之泉",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 724,
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
["glowScale"] = 1,
["glow"] = false,
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 40,
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
["single"] = "PRIEST",
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
["spellknown"] = 724,
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
},
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "WeQcHkzdVzj",
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
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
["semver"] = "2.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "光明之井（神圣）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["width"] = 40,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
},
["神圣之火"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 动态分组 右",
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
["track"] = "auto",
["auranames"] = {
"15262",
},
["use_matchedRune"] = false,
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "target",
["use_showgcd"] = false,
["debuffType"] = "HARMFUL",
["type"] = "aura2",
["unevent"] = "auto",
["duration"] = "1",
["names"] = {
},
["event"] = "Cooldown Progress (Spell)",
["use_exact_spellName"] = false,
["realSpellName"] = "神圣之火",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["spellName"] = 14914,
["use_track"] = true,
["useName"] = true,
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
["glow"] = true,
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
["single"] = "PRIEST",
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
["spellknown"] = 15262,
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
},
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "IIbVlz18ua5",
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
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
["semver"] = "2.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "神圣之火",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["width"] = 32,
["alpha"] = 1,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
},
},
},
["牧师（中心分组）"] = {
["controlledChildren"] = {
"牧师 动态分组 左",
"牧师 动态分组 右",
"牧师 核心分组",
"牧师 底部分组",
"牧师 资源条",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["groupIcon"] = "interface/icons/classicon_priest.blp",
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
["subeventSuffix"] = "_CAST_START",
["duration"] = "1",
["event"] = "Conditions",
["unit"] = "player",
["spellIds"] = {
},
["buffShowOn"] = "showOnActive",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["unevent"] = "timed",
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
["ingroup"] = {
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
["talent2"] = {
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
["config"] = {
},
["xOffset"] = 0,
["borderOffset"] = 5,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "牧师（中心分组）",
["yOffset"] = -224,
["frameStrata"] = 3,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["uid"] = "mTtjP1zkGng",
["parent"] = "牧师",
["borderInset"] = 11,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["groupOffset"] = false,
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
["牧师"] = {
["controlledChildren"] = {
"牧师（右侧图标）",
"牧师（BUFF）",
"牧师（中心分组）",
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
["desc"] = "",
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
["uid"] = "8bpMgzXsf79",
["id"] = "牧师",
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
["groupIcon"] = "classicon-priest",
},
["真言术：盾"] = {
["iconSource"] = 0,
["wagoID"] = "qHjvWZWZO",
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
["auranames"] = {
"17",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["subeventPrefix"] = "SPELL",
["use_showgcd"] = false,
["use_tooltip"] = true,
["debuffType"] = "HELPFUL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["fetchTooltip"] = false,
["event"] = "Cooldown Progress (Spell)",
["unit"] = "player",
["realSpellName"] = "真言术：盾",
["use_spellName"] = true,
["spellIds"] = {
},
["use_track"] = true,
["type"] = "aura2",
["names"] = {
},
["fetchRaidMark"] = false,
["spellName"] = 17,
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
["unit"] = "player",
["use_showgcd"] = false,
["use_spellName"] = true,
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["genericShowOn"] = "showAlways",
["realSpellName"] = "真言术：盾",
["use_track"] = true,
["spellName"] = 17,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["track"] = "auto",
["auranames"] = {
"6788",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["subeventPrefix"] = "SPELL",
["use_showgcd"] = false,
["debuffType"] = "HARMFUL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["realSpellName"] = "真言术：盾",
["use_spellName"] = true,
["spellIds"] = {
},
["spellName"] = 17,
["names"] = {
},
["type"] = "aura2",
["use_track"] = true,
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
["text_text"] = "%3.p",
["text_text_format_3.p_time_format"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fixedWidth"] = 64,
["rotateText"] = "NONE",
["text_text_format_3.p_big_number_format"] = "AbbreviateNumbers",
["text_color"] = {
0.988235354423523,
0.5843137502670288,
0.3098039329051971,
1,
},
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_text_format_3.p_gcd_hide_zero"] = false,
["text_fontSize"] = 18,
["anchorXOffset"] = 0,
["text_text_format_3.p_gcd_gcd"] = false,
["text_selfPoint"] = "CENTER",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_3.p_time_precision"] = 1,
["text_text_format_3.p_gcd_cast"] = false,
["type"] = "subtext",
["text_text_format_3.p_decimal_precision"] = 1,
["text_text_format_3.p_gcd_channel"] = false,
["text_text_format_3.p_time_dynamic_threshold"] = 3,
["text_text_format_3.p_time_mod_rate"] = true,
["text_font"] = "Rurutia",
["text_text_format_3.p_format"] = "timed",
["text_text_format_3.p_time_legacy_floor"] = false,
["anchor_point"] = "TOP",
["text_anchorYOffset"] = -1,
["text_text_format_3.p_round_type"] = "ceil",
["text_fontType"] = "OUTLINE",
},
},
["height"] = 40,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
[91] = false,
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "PRIEST",
["multi"] = {
},
},
["spellknown"] = 17,
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
["parent"] = "牧师 核心分组",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["displayIcon"] = 135940,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["adjustedMax"] = "",
["cooldownEdge"] = false,
["config"] = {
},
["progressSource"] = {
-1,
"",
},
["anchorFrameParent"] = false,
["alpha"] = 1,
["selfPoint"] = "CENTER",
["zoom"] = 0.3,
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "真言术：盾",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["width"] = 40,
["frameStrata"] = 1,
["uid"] = "RehYZUeQIVP",
["inverse"] = true,
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
["value"] = 1,
["variable"] = "show",
["trigger"] = 1,
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
["trigger"] = 3,
["variable"] = "show",
["value"] = 1,
},
["changes"] = {
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 3,
["variable"] = "expirationTime",
["value"] = "3",
["op"] = "<=",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.3.text_color",
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
["神恩回复（神圣）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["authorOptions"] = {
},
["preferToUpdate"] = true,
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
["names"] = {
},
["unitExists"] = true,
["unit"] = "player",
["spellIds"] = {
},
["auranames"] = {
"27813",
},
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
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
["version"] = 6,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text_format_s_format"] = "none",
["text_text"] = "回复",
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
["anchorXOffset"] = 0,
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
["text_shadowYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 15,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_mod_rate"] = true,
},
{
["glowFrequency"] = 0.25,
["glow"] = true,
["useGlowColor"] = false,
["glowType"] = "ACShine",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["type"] = "subglow",
["glowXOffset"] = 0,
["glowThickness"] = 1,
["glowScale"] = 1,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
},
["height"] = 30,
["load"] = {
["use_petbattle"] = false,
["use_never"] = false,
["talent"] = {
["single"] = 55,
["multi"] = {
[35] = true,
[55] = true,
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
["use_talent"] = true,
["use_class"] = true,
["race"] = {
},
["ingroup"] = {
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
["alpha"] = 1,
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
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["uid"] = "CQFFiV9Z21i",
["url"] = "https://space.bilibili.com/455259",
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["xOffset"] = 0,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "2.0.0",
["tocversion"] = 30400,
["id"] = "神恩回复（神圣）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["width"] = 30,
["useCooldownModRate"] = true,
["config"] = {
},
["inverse"] = false,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["conditions"] = {
},
["cooldown"] = true,
["parent"] = "牧师（BUFF）",
},
["牧师（BUFF）"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"神恩回复（神圣）",
"精神分流（暗影）",
"牧师 技能释放与就绪发言（语音）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["yOffset"] = 20,
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
["rowSpace"] = 35,
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
["columnSpace"] = 4,
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
["regionType"] = "dynamicgroup",
["grow"] = "GRID",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。\n部分触发器来自Luxthos",
["rotation"] = 0,
["anchorPoint"] = "CENTER",
["stagger"] = 0,
["subRegions"] = {
},
["groupIcon"] = "interface/icons/classicon_priest.blp",
["useLimit"] = true,
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
["parent"] = "牧师",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["borderInset"] = 1,
["source"] = "import",
["animate"] = false,
["scale"] = 1.1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["sort"] = "none",
["config"] = {
},
["alpha"] = 1,
["anchorFrameParent"] = false,
["constantFactor"] = "RADIUS",
["gridWidth"] = 5,
["borderOffset"] = 4,
["internalVersion"] = 90,
["xOffset"] = 142,
["id"] = "牧师（BUFF）",
["limit"] = 10,
["frameStrata"] = 1,
["anchorFrameType"] = "UIPARENT",
["space"] = 2,
["uid"] = "ypd(o86GImQ",
["fullCircle"] = true,
["selfPoint"] = "TOPLEFT",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["gridType"] = "RD",
},
["牧师 动态分组 左"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"暗影形态（未开时提示）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["parent"] = "牧师（中心分组）",
["preferToUpdate"] = true,
["yOffset"] = 24,
["sortHybridTable"] = {
["吸血鬼的拥抱（可点击施法）脱战检测"] = false,
["神圣之火"] = false,
["暗影形态（未开时提示）"] = false,
},
["regionType"] = "dynamicgroup",
["gridWidth"] = 4,
["fullCircle"] = true,
["space"] = 3,
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
["selfPoint"] = "BOTTOMLEFT",
["align"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
["authorOptions"] = {
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["rotation"] = 0,
["gridType"] = "RU",
["version"] = 3,
["arcLength"] = 360,
["xOffset"] = -149,
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
["stagger"] = 0,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["groupIcon"] = "interface/icons/classicon_priest.blp",
["source"] = "import",
["customGrow"] = "function(newPositions, activeRegions)\n    local limit = 10 -- limit of icons per row\n    local rows = 1 -- total rows\n    local spacing = 3 -- spacing between icons\n    ----------------------\n    local check = true\n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    \n    local xOffset = 0\n    local yOffset = 0\n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        local region = regionData.region\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= limit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows-1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        xOffset = 0 - (region.width + spacing) / 2 * (rowTotal-1) + (xCount * (region.width + spacing))\n        yOffset = 0 + (region.height + spacing) * yCount -- change '-' to '+' after 0 to grow up instead of down\n        \n        xCount = xCount + 1\n        \n        if yCount < rows-1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend\n\n",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["sort"] = "none",
["frameStrata"] = 1,
["animate"] = false,
["constantFactor"] = "RADIUS",
["uid"] = "wyXi(i4nIQz",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "牧师 动态分组 左",
["limit"] = 6,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["rowSpace"] = 5,
["borderInset"] = 1,
["anchorPoint"] = "CENTER",
["useLimit"] = true,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["radius"] = 200,
},
["牧师 动态分组 右"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"暗影之波",
"吸血鬼的拥抱",
"暗言术：痛（暗影）",
"神圣之火",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["groupIcon"] = "interface/icons/classicon_priest.blp",
["sortHybridTable"] = {
["暗影之波"] = false,
},
["animate"] = false,
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
["radius"] = 200,
["yOffset"] = 24,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["rotation"] = 0,
["stagger"] = 0,
["version"] = 3,
["rowSpace"] = 5,
["selfPoint"] = "BOTTOMRIGHT",
["uid"] = "a5Wp0zJRVBm",
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
["parent"] = "牧师（中心分组）",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["anchorPoint"] = "CENTER",
["source"] = "import",
["customGrow"] = "function(newPositions, activeRegions)\n    local limit = 10 -- limit of icons per row\n    local rows = 1 -- total rows\n    local spacing = 3 -- spacing between icons\n    ----------------------\n    local check = true\n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    \n    local xOffset = 0\n    local yOffset = 0\n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        local region = regionData.region\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= limit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows-1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        xOffset = 0 - (region.width + spacing) / 2 * (rowTotal-1) + (xCount * (region.width + spacing))\n        yOffset = 0 + (region.height + spacing) * yCount -- change '-' to '+' after 0 to grow up instead of down\n        \n        xCount = xCount + 1\n        \n        if yCount < rows-1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend\n\n",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 9,
["gridWidth"] = 3,
["useLimit"] = true,
["constantFactor"] = "RADIUS",
["sort"] = "none",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "牧师 动态分组 右",
["stepAngle"] = 15,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["config"] = {
},
["borderInset"] = 1,
["gridType"] = "LU",
["xOffset"] = 149,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["fullCircle"] = true,
},
["真言术：韧/坚韧祷言（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "qHjvWZWZO",
["parent"] = "牧师 核心分组",
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
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"1243",
"21562",
},
["matchesShowOn"] = "showAlways",
["unit"] = "player",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
["spellIds"] = {
},
["duration"] = "1",
["useName"] = true,
["use_itemName"] = true,
["use_unit"] = true,
["names"] = {
},
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.power_word_fortitude.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = true,
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
["height"] = 40,
["load"] = {
["use_class"] = true,
["use_spellknown"] = true,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "PRIEST",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 1243,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 40,
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
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 真言术：韧\")\nbtn:SetAttribute(\"macrotext2\",\"/cast 坚韧祷言\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff左键：|r|cff00ff00\"..\"真言术：韧\"..\"|r\\n\"..\n            \"|cffffffff右键：|r|cff00ff00\"..\"坚韧祷言\"..\"|r\\n\"\n        , 0, 1, 0, 1, 1)\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
},
["xOffset"] = 0,
["config"] = {
["maintenance"] = {
["power_word_fortitude"] = {
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
["text"] = "Power Word: Fortitude\n",
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
["name"] = "Power Word: Fortitude",
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["collapse"] = false,
["type"] = "group",
["limitType"] = "none",
["groupType"] = "simple",
["key"] = "power_word_fortitude",
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
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["zoom"] = 0.3,
["semver"] = "2.0.0",
["tocversion"] = 11500,
["id"] = "真言术：韧/坚韧祷言（可点击施法）",
["auto"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "cXuSGOuakgq",
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
["牧师 核心分组"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"真言术：盾",
"心灵专注（三系）",
"能量灌注（戒律）可点击施法，显示姓名，露露语音",
"光明之井（神圣）",
"沉默（暗影）",
"心灵尖啸（三系，可点击施法）",
"心灵震爆（暗影）",
"噬灵瘟疫（暗影）",
"防护恐惧结界（三系，可点击施法）",
"渐隐术（三系，可点击施法）",
"绝望祷言（三系，可点击施法）",
"漂浮术（可点击施法）",
"真言术：韧/坚韧祷言（可点击施法）",
"精神之灵/精神祷言（可点击施法）",
"防护暗影/暗影防护祷言（可点击施法）",
"心灵之火（可点击施法）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["regionType"] = "dynamicgroup",
["yOffset"] = 0.5,
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
["fullCircle"] = true,
["space"] = 3,
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
["心灵专注（三系）"] = false,
["沉默（暗影）"] = false,
["噬灵瘟疫（暗影）"] = false,
["心灵之火（可点击施法）"] = false,
["漂浮术（可点击施法）"] = false,
["暗言术-灭（符文）"] = false,
["能量灌注（戒律）可点击施法，显示姓名，露露语音"] = false,
["真言术：韧/坚韧祷言（可点击施法）"] = false,
["暗言术：痛（暗影）"] = false,
["真言术：盾"] = false,
["心灵震爆（暗影）"] = false,
["精神之灵/精神祷言（可点击施法）"] = false,
["渐隐术（三系，可点击施法）"] = false,
["光明之井（神圣）"] = false,
["防护恐惧结界（三系，可点击施法）"] = false,
["暗影防护/暗影防护祷言（可点击施法）"] = false,
},
["selfPoint"] = "CENTER",
["align"] = "CENTER",
["growOn"] = "changed",
["borderColor"] = {
0,
0,
0,
1,
},
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["rotation"] = 0,
["version"] = 3,
["rowSpace"] = 1,
["grow"] = "CUSTOM",
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
["groupIcon"] = "interface/icons/classicon_priest.blp",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["useLimit"] = false,
["source"] = "import",
["customGrow"] = "function(newPositions, activeRegions)\n    local limits = { --icons per row\n        7, --row 1\n        9, --row 2\n        \n    }\n    local rows = #limits -- total rows (matches limits size)\n    local iconSizes = { --have to match #limits size (if limits is {x,y} iconSizes have to be {a, b}, i.e. 2 and 2)\n        40, --row 1\n        35, --row 2\n        \n    }\n    local spacings = {\n        1, --row 1\n        23, --row 2\n        \n    }\n    \n    -- spacing between icons\n    local checkFit = true --resize only if total clones > totalWidth. Otherwise 1-2 icons will be giga huge\n    ----------------------\n    local check = true\n    \n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    local lastRowCount = 0\n    \n    local limit = limits[yCount+1]\n    local firstRowLimit = limits[yCount+1]\n    \n    local xSpacing = 3\n    local ySpacing = spacings[yCount+1]\n    local offset = spacings[yCount+1]\n    \n    local xOffset = 0\n    local yOffset = 0\n    \n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        \n        local region = regionData.region\n        if iconSizes[yCount+1] then\n            regionData.region:SetRegionWidth(iconSizes[yCount+1])\n            regionData.region:SetRegionHeight(iconSizes[yCount+1])\n        end\n        \n        local why = 0\n        for i=1, yCount+1 do\n            local wtf = (i==1 or i==yCount+1) and iconSizes[i]/2 or iconSizes[i]\n            why = why + wtf\n        end\n        local shift = yCount == 0 and 0 or why + offset\n        \n        local width = width or region.width\n        local totalWidth = totalWidth or (width + xSpacing) * limit\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= firstRowLimit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows - 1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        if yCount == rows - 1 then\n            local fit = checkFit and (width + xSpacing) * rowTotal < totalWidth\n            local lastRowWidth = fit and width or ((totalWidth - (rowTotal * xSpacing)) / rowTotal)\n            \n            xOffset = 0 - (lastRowWidth + xSpacing) / 2 * (rowTotal - 1) + (lastRowCount * (lastRowWidth + xSpacing))\n            yOffset = 0 - (shift - (width - lastRowWidth) / 2)-- change '-' to '+' after 0 to grow up instead of down\n            \n            lastRowCount = lastRowCount + 1\n            \n            regionData.region:SetRegionWidth(lastRowWidth)\n            regionData.region:SetRegionHeight(lastRowWidth)\n        else\n            xOffset = 0 - (width + xSpacing) / 2 * (rowTotal - 1) + (xCount * (width + xSpacing))\n            yOffset = 0 - shift\n        end\n        \n        xCount = xCount + 1\n        \n        if yCount < rows - 1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n                limit = limits[yCount+1]\n                ySpacing = spacings[yCount+1]\n                offset = offset + ySpacing\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["sort"] = "none",
["gridWidth"] = 5,
["animate"] = false,
["constantFactor"] = "RADIUS",
["anchorPoint"] = "CENTER",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "牧师 核心分组",
["limit"] = 5,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["internalVersion"] = 90,
["borderInset"] = 1,
["uid"] = "C(AZq2dFnPg",
["parent"] = "牧师（中心分组）",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["xOffset"] = 0,
},
},
}
