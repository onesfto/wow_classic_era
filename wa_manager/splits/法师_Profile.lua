
WeakAurasSaved = {
["editor_tab_spaces"] = 4,
["login_squelch_time"] = 10,
["PULL(Need DBM BW ERT)PULL"] = 5,
["dbVersion"] = 90,
["标记目标 Mark TargetSet"] = false,
["displays"] = {
["达纳苏斯"] = {
["iconSource"] = 0,
["parent"] = "法师传送&传送门",
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
["type"] = "custom",
["custom_type"] = "event",
["event"] = "Health",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["names"] = {
},
["events"] = "DOOR_BTN_SHOW,DOOR_BTN_HIDE",
["custom"] = "function(event)\n    if event == \"DOOR_BTN_SHOW\" then\n        return true\n    end\nend",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["custom_hide"] = "custom",
},
["untrigger"] = {
["custom"] = "function(event)\n    if event == \"DOOR_BTN_HIDE\" then\n        return true\n    end\nend",
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
["text_text"] = "达纳",
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
1,
1,
1,
1,
},
["text_font"] = "Friz Quadrata TT",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_anchorYOffset"] = 0,
["anchor_point"] = "INNER_BOTTOM",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_visible"] = true,
},
{
["border_size"] = 1,
["border_offset"] = 0,
["border_color"] = {
0.250980406999588,
0.7803922295570374,
0.9215686917304993,
1,
},
["border_visible"] = true,
["border_edge"] = "1 Pixel",
["type"] = "subborder",
},
},
["height"] = 30,
["adjustedMax"] = "",
["load"] = {
["use_never"] = true,
["class"] = {
["single"] = "MAGE",
["multi"] = {
["MAGE"] = true,
},
},
["use_class"] = true,
["race"] = {
},
["use_faction"] = true,
["size"] = {
["multi"] = {
},
},
["use_namerealm"] = false,
["namerealm"] = "山下智久",
["talent"] = {
["multi"] = {
},
},
["use_vehicle"] = false,
["spec"] = {
["multi"] = {
},
},
["use_spellknown"] = true,
["use_alive"] = true,
["faction"] = {
["single"] = "Alliance",
},
["use_exact_spellknown"] = false,
["use_combat"] = false,
["spellknown"] = 3565,
["zoneIds"] = "",
},
["progressSource"] = {
-1,
"",
},
["useAdjustededMax"] = false,
["authorOptions"] = {
},
["source"] = "import",
["cooldown"] = false,
["displayIcon"] = 135755,
["color"] = {
1,
1,
1,
1,
},
["customText"] = "function (...)\n    return GetItemCount(17032)\nend",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env\nif not _G[e.id..\"Button\"] then\n    local region = WeakAuras.GetRegion(e.id)\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")\n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"LeftButtonDown\", \"RightButtonDown\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region)\nend\n\nlocal btn = _G[e.id..\"Button\"]\nbtn:SetAttribute(\"macrotext1\",\"/cast 传送门：达纳苏斯\")\nbtn:SetAttribute(\"macrotext2\",\"/cast 传送：达纳苏斯\")\n\nbtn:SetScript(\"OnEnter\", function(self)\n        GameTooltip:SetOwner(self, \"ANCHOR_LEFT\")\n        GameTooltip:SetText(\"|cffffffff左键：|r传送门：达纳苏斯|cff04f192（\"..GetItemCount(17032)..\"）|r\\n|cffffffff右键：|r传送：达纳苏斯|cff04f192（\"..GetItemCount(17031)..\"）|r\", 0, 1, 0, 1, 1)\n        WeakAuras.ScanEvents(\"DOOR_BTN_SHOW\")\nend)\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide()\n        WeakAuras.ScanEvents(\"DOOR_BTN_HIDE\")\nend)",
},
["finish"] = {
},
},
["width"] = 30,
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["url"] = "",
["zoom"] = 0,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "达纳苏斯",
["useCooldownModRate"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
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
["uid"] = "cSnCK0e4Wnz",
["inverse"] = false,
["xOffset"] = 0,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["useTooltip"] = false,
},
["魔法抑制/魔法增效（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["text"] = "Amplify & Dampen Magic\n",
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
["default"] = 1,
["name"] = "Behavior",
["useDesc"] = false,
["key"] = "behavior",
["width"] = 1,
},
},
["hideReorder"] = true,
["useDesc"] = false,
["nameSource"] = 0,
["name"] = "Amplify & Dampen Magic",
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["collapse"] = false,
["type"] = "group",
["limitType"] = "none",
["groupType"] = "simple",
["key"] = "amplify_dampen",
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
["do_custom"] = true,
["custom"] = "local e = aura_env \n\nif not e.btn then \n    local region = WeakAuras.GetRegion(e.id) \n    \n    -- 将父级框架改为 UIParent 避免安全模板污染\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", UIParent, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonDown\", \"RightButtonDown\", \"MiddleButtonDown\")\n    \n    -- 改回使用 macro 属性，并写在初始化内\n    -- 左键：魔法抑制（支持 Alt 自我施法判断）\n    e.btn:SetAttribute(\"*type1\", \"macro\")\n    e.btn:SetAttribute(\"*macrotext1\", \"/cast [mod:alt,@player][] 魔法抑制\")\n    \n    -- 右键：魔法增效（支持 Alt 自我施法判断）\n    e.btn:SetAttribute(\"*type2\", \"macro\")\n    e.btn:SetAttribute(\"*macrotext2\", \"/cast [mod:alt,@player][] 魔法增效\")\n    \n    e.btn:SetAllPoints(region) \n    e.btn:SetFrameStrata(\"TOOLTIP\")\n    e.btn:SetFrameLevel(9999)\nend \n\nlocal btn = e.btn \n\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff左键：|r|cff1fff79魔法抑制|r\\n\"..\n            \"|cffffffff右键：|r|cffff9b3c魔法增效|r\\n\"..\n            \"|cffaaaaaaAlt + 点击：给自己施放|r\", \n            0, 1, 0, 1, 1\n        )\n        GameTooltip:Show()\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide() \nend)\n\nbtn:Show()",
},
},
["triggers"] = {
{
["trigger"] = {
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"604",
"1008",
},
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["names"] = {
},
["unevent"] = "auto",
["spellIds"] = {
},
["matchesShowOn"] = "showAlways",
["type"] = "aura2",
["use_itemName"] = true,
["unit"] = "player",
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
},
["height"] = 32,
["load"] = {
["use_class"] = true,
["use_spellknown"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "MAGE",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 604,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 32,
["source"] = "import",
["selfPoint"] = "CENTER",
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["cooldownEdge"] = true,
["color"] = {
1,
1,
1,
1,
},
["config"] = {
["maintenance"] = {
["amplify_dampen"] = {
["behavior"] = 1,
},
},
},
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "魔法抑制/魔法增效（可点击施法）",
["semver"] = "2.0.3",
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "XKVg4gEpTdV",
["inverse"] = false,
["parent"] = "法师 底部分组",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["variable"] = "buffed",
["value"] = 0,
},
["changes"] = {
{
["value"] = 0.5,
["property"] = "alpha",
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
["icon"] = true,
},
["燃烧（闪电音效）"] = {
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
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["auraspellids"] = {
},
["useName"] = true,
["spellIds"] = {
},
["useExactSpellId"] = false,
["unit"] = "player",
["auranames"] = {
"11129",
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
["text_text"] = "燃烧",
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
0.250980406999588,
0.7803922295570374,
0.9215686917304993,
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
["text_text_format_p_time_legacy_floor"] = true,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorYOffset"] = 0,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["type"] = "subtext",
["text_text_format_1.n_format"] = "none",
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_shadowXOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_format"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_text_format_p_format"] = "timed",
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 17,
["text_text_format_p_time_dynamic_threshold"] = 2,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 30,
["load"] = {
["use_class"] = true,
["use_spellknown"] = false,
["use_itemequiped"] = false,
["talent"] = {
["multi"] = {
},
},
["use_never"] = false,
["class"] = {
["single"] = "MAGE",
["multi"] = {
["PALADIN"] = true,
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
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["authorOptions"] = {
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
["uid"] = "uqw2r9nY3re",
["selfPoint"] = "CENTER",
["anchorFrameParent"] = false,
["alpha"] = 1,
["cooldownEdge"] = false,
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["tocversion"] = 20501,
["id"] = "燃烧（闪电音效）",
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
["value"] = {
["sound_type"] = "Play",
["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\ESPARK1.ogg",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】龙神の剣を喰らえ！.ogg",
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
["parent"] = "法师（BUFF）",
},
["唤醒（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["type"] = "aura2",
["auranames"] = {
"12051",
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["unit"] = "player",
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
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "唤醒",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 12051,
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
["version"] = 5,
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
["multi"] = {
},
},
["class"] = {
["single"] = "MAGE",
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
["spellknown"] = 12051,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "法师 核心分组",
["cooldown"] = true,
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
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "BSRBV6sK0iL",
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
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "唤醒（可点击施法）",
["zoom"] = 0.3,
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
["do_custom"] = true,
["custom"] = "local e = aura_env \nlocal spellName = \"唤醒\"\nlocal spellColor = \"2C4D9F\"\nlocal castCommand = \"/cast \" .. spellName\n\nif not e.btn then \n    local region = WeakAuras.GetRegion(e.id) \n    \n    -- 将父级框架改为 UIParent 避免安全模板污染\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", UIParent, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonDown\", \"RightButtonDown\", \"MiddleButtonDown\")\n    \n    -- 统一使用 macro 属性，并写在初始化内\n    e.btn:SetAttribute(\"type1\", \"macro\")\n    e.btn:SetAttribute(\"macrotext1\", castCommand)\n    \n    e.btn:SetAllPoints(region) \n    e.btn:SetFrameStrata(\"TOOLTIP\")\n    e.btn:SetFrameLevel(9999)\nend \n\nlocal btn = e.btn \n\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")\n        GameTooltip:SetText(\"|cff\" .. spellColor .. spellName .. \"|r\")\n        GameTooltip:Show()\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide() \nend)\n\nbtn:Show()",
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
["痛苦诅咒/强化灼烧（火法，火焰易伤）"] = {
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
["useName"] = false,
["use_debuffClass"] = false,
["auraspellids"] = {
"22959",
},
["useIgnoreExactSpellId"] = false,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["auranames"] = {
"22959",
},
["type"] = "aura2",
["spellIds"] = {
},
["useExactSpellId"] = true,
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "target",
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
["glowThickness"] = 1,
["glowScale"] = 1,
["glow"] = true,
["useGlowColor"] = false,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_text_format_n_format"] = "string",
["text_text_format_s_format"] = "none",
["text_text"] = "易伤",
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_shadowXOffset"] = 0,
["anchorYOffset"] = 0,
["text_text_format_n_abbreviate_max"] = 2,
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_justify"] = "CENTER",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["type"] = "subtext",
["text_anchorXOffset"] = 1,
["text_color"] = {
0.250980406999588,
0.7803922295570374,
0.9215686917304993,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_format"] = 0,
["text_text_format_p_time_precision"] = 1,
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 15,
["text_text_format_p_time_dynamic_threshold"] = 0,
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
["text_text_format_p_format"] = "timed",
["anchorYOffset"] = 0,
["text_text_format_n_abbreviate_max"] = 2,
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 0,
["text_justify"] = "CENTER",
["text_text_format_n_format"] = "string",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_format"] = 0,
["text_shadowYOffset"] = 0,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_anchorYOffset"] = 0,
["text_shadowXOffset"] = 0,
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 17,
["anchorXOffset"] = 0,
["text_text_format_n_abbreviate"] = true,
},
},
["height"] = 30,
["load"] = {
["use_class"] = true,
["use_spellknown"] = false,
["use_itemequiped"] = false,
["talent"] = {
["multi"] = {
[43] = true,
},
},
["use_never"] = false,
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "MAGE",
["multi"] = {
["PALADIN"] = true,
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
["cooldown"] = true,
["displayIcon"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["parent"] = "法师（BUFF）",
["uid"] = "VC5lNg2PC4Y",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["anchorFrameParent"] = false,
["alpha"] = 1,
["cooldownEdge"] = false,
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["tocversion"] = 20501,
["id"] = "痛苦诅咒/强化灼烧（火法，火焰易伤）",
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["desc"] = "",
["config"] = {
},
["inverse"] = false,
["adjustedMax"] = "",
["conditions"] = {
{
["check"] = {
["trigger"] = 1,
["op"] = ">=",
["value"] = "5",
["variable"] = "stacks",
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
},
["xOffset"] = 0,
},
["法师 核心分组"] = {
["grow"] = "CUSTOM",
["controlledChildren"] = {
"冲击波",
"燃烧（可点击施法）",
"奥术强化（可点击施法）",
"气定神闲（可点击施法）",
"寒冰屏障（可点击施法，左键冰箱，右键取消）",
"急速冷却（可点击施法）",
"火焰冲击",
"冰锥术",
"冰霜新星",
"唤醒（可点击施法）",
"法术反制（可点击施法）",
"缓落术（可点击施法）",
"闪现术",
"防护火焰结界/防护冰霜结界（可点击施法）",
"法力护盾（可点击施法）",
"寒冰护体（可点击施法）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["xOffset"] = 0,
["preferToUpdate"] = true,
["stepAngle"] = 15,
["yOffset"] = 0.5,
["anchorPoint"] = "CENTER",
["gridWidth"] = 5,
["parent"] = "法师（中心分组）",
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
["internalVersion"] = 90,
["arcLength"] = 360,
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
["useLimit"] = false,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["rotation"] = 0,
["stagger"] = 0,
["version"] = 3,
["selfPoint"] = "CENTER",
["groupIcon"] = "interface/icons/classicon_mage.blp",
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
["sortHybridTable"] = {
["急速冷却（可点击施法）"] = false,
["寒冰屏障（可点击施法，左键冰箱，右键取消）"] = false,
["气定神闲（可点击施法）"] = false,
["冰霜新星"] = false,
["防护火焰结界/防护冰霜结界（可点击施法，左右键）"] = false,
["燃烧（可点击施法）"] = false,
["法力护盾（可点击施法）"] = false,
["唤醒（可点击施法）"] = false,
["法术反制（可点击施法，左键反目标，右键反焦点）"] = false,
["寒冰护体（可点击施法）"] = false,
["冲击波"] = false,
["闪现术"] = false,
["奥术强化（可点击施法）"] = false,
["火焰冲击"] = false,
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["uid"] = ")l22vR)qb(r",
["source"] = "import",
["customGrow"] = "function(newPositions, activeRegions)\n    local limits = { --icons per row\n        7, --row 1\n        9, --row 2\n        \n    }\n    local rows = #limits -- total rows (matches limits size)\n    local iconSizes = { --have to match #limits size (if limits is {x,y} iconSizes have to be {a, b}, i.e. 2 and 2)\n        40, --row 1\n        35, --row 2\n        \n    }\n    local spacings = {\n        1, --row 1\n        20, --row 2\n        \n    }\n    \n    -- spacing between icons\n    local checkFit = true --resize only if total clones > totalWidth. Otherwise 1-2 icons will be giga huge\n    ----------------------\n    local check = true\n    \n    local xCount = 0\n    local yCount = 0\n    local tCount = 0\n    local lastRowCount = 0\n    \n    local limit = limits[yCount+1]\n    local firstRowLimit = limits[yCount+1]\n    \n    local xSpacing = 3\n    local ySpacing = spacings[yCount+1]\n    local offset = spacings[yCount+1]\n    \n    local xOffset = 0\n    local yOffset = 0\n    \n    local total = #activeRegions\n    \n    for i, regionData in ipairs(activeRegions) do\n        \n        local region = regionData.region\n        if iconSizes[yCount+1] then\n            regionData.region:SetRegionWidth(iconSizes[yCount+1])\n            regionData.region:SetRegionHeight(iconSizes[yCount+1])\n        end\n        \n        local why = 0\n        for i=1, yCount+1 do\n            local wtf = (i==1 or i==yCount+1) and iconSizes[i]/2 or iconSizes[i]\n            why = why + wtf\n        end\n        local shift = yCount == 0 and 0 or why + offset\n        \n        local width = width or region.width\n        local totalWidth = totalWidth or (width + xSpacing) * limit\n        \n        local regionsLeft = total - tCount\n        local rowTotal = 1\n        \n        if total <= firstRowLimit then\n            rowTotal = total\n        elseif (regionsLeft < limit and xCount < 1) or not check then\n            check = false\n            rowTotal = regionsLeft\n        elseif yCount >= rows - 1 then\n            rowTotal = regionsLeft\n        elseif total > limit then\n            rowTotal = limit\n        end\n        \n        if yCount == rows - 1 then\n            local fit = checkFit and (width + xSpacing) * rowTotal < totalWidth\n            local lastRowWidth = fit and width or ((totalWidth - (rowTotal * xSpacing)) / rowTotal)\n            \n            xOffset = 0 - (lastRowWidth + xSpacing) / 2 * (rowTotal - 1) + (lastRowCount * (lastRowWidth + xSpacing))\n            yOffset = 0 - (shift - (width - lastRowWidth) / 2)-- change '-' to '+' after 0 to grow up instead of down\n            \n            lastRowCount = lastRowCount + 1\n            \n            regionData.region:SetRegionWidth(lastRowWidth)\n            regionData.region:SetRegionHeight(lastRowWidth)\n        else\n            xOffset = 0 - (width + xSpacing) / 2 * (rowTotal - 1) + (xCount * (width + xSpacing))\n            yOffset = 0 - shift\n        end\n        \n        xCount = xCount + 1\n        \n        if yCount < rows - 1 and check then\n            tCount = tCount + 1\n            if xCount >= limit then\n                xCount = 0\n                yCount = yCount + 1\n                limit = limits[yCount+1]\n                ySpacing = spacings[yCount+1]\n                offset = offset + ySpacing\n            end\n        end\n        \n        newPositions[i] = {xOffset, yOffset}\n    end\nend",
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 5,
["frameStrata"] = 1,
["animate"] = false,
["constantFactor"] = "RADIUS",
["authorOptions"] = {
},
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "法师 核心分组",
["sort"] = "none",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["fullCircle"] = true,
["borderInset"] = 1,
["space"] = 3,
["gridType"] = "RD",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["radius"] = 200,
},
["闪现术"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["realSpellName"] = "闪现术",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 1953,
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
["version"] = 5,
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
["single"] = "MAGE",
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
["spellknown"] = 1953,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "法师 核心分组",
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
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "0scnWxbelYV",
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
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "闪现术",
["zoom"] = 0.3,
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
["do_custom"] = false,
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
["暴风城"] = {
["iconSource"] = 0,
["xOffset"] = 0,
["adjustedMax"] = "",
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
["do_custom"] = true,
["custom"] = "local e = aura_env\nif not _G[e.id..\"Button\"] then\n    local region = WeakAuras.GetRegion(e.id)\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")\n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"LeftButtonDown\", \"RightButtonDown\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region)\nend\n\nlocal btn = _G[e.id..\"Button\"]\nbtn:SetAttribute(\"macrotext1\",\"/cast 传送门：暴风城\")\nbtn:SetAttribute(\"macrotext2\",\"/cast 传送：暴风城\")\n\nbtn:SetScript(\"OnEnter\", function(self)\n        GameTooltip:SetOwner(self, \"ANCHOR_LEFT\")\n        GameTooltip:SetText(\"|cffffffff左键：|r传送门：暴风城|cff04f192（\"..GetItemCount(17032)..\"）|r\\n|cffffffff右键：|r传送：暴风城|cff04f192（\"..GetItemCount(17031)..\"）|r\", 0, 1, 0, 1, 1)\n        WeakAuras.ScanEvents(\"DOOR_BTN_SHOW\")\nend)\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide()\n        WeakAuras.ScanEvents(\"DOOR_BTN_HIDE\")\nend)",
},
},
["triggers"] = {
{
["trigger"] = {
["itemName"] = 8077,
["use_alwaystrue"] = true,
["unevent"] = "auto",
["duration"] = "1",
["event"] = "Conditions",
["unit"] = "player",
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["use_unit"] = true,
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "unit",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "custom",
["custom"] = "function(event)\n    if event == \"DOOR_BTN_SHOW\" then\n        return true\n    end\nend",
["custom_type"] = "event",
["custom_hide"] = "custom",
["events"] = "DOOR_BTN_SHOW,DOOR_BTN_HIDE",
["debuffType"] = "HELPFUL",
["unit"] = "player",
},
["untrigger"] = {
["custom"] = "function(event)\n    if event == \"DOOR_BTN_HIDE\" then\n        return true\n    end\nend",
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
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Friz Quadrata TT",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_anchorYOffset"] = 4,
["text_text_format_c_format"] = "none",
["anchor_point"] = "INNER_TOP",
["text_fontSize"] = 15,
["anchorXOffset"] = 0,
["text_fontType"] = "OUTLINE",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "传送",
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
1,
1,
1,
1,
},
["text_font"] = "Friz Quadrata TT",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["anchor_point"] = "INNER_BOTTOM",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_anchorYOffset"] = 0,
},
{
["type"] = "subborder",
["border_size"] = 1,
["border_color"] = {
0.250980406999588,
0.7803922295570374,
0.9215686917304993,
1,
},
["border_visible"] = true,
["border_edge"] = "1 Pixel",
["border_offset"] = 0,
},
},
["height"] = 30,
["keepAspectRatio"] = false,
["load"] = {
["use_never"] = true,
["level_operator"] = {
">=",
},
["use_class"] = true,
["race"] = {
},
["level"] = {
"20",
},
["size"] = {
["multi"] = {
},
},
["use_namerealm"] = false,
["namerealm"] = "山下智久",
["talent"] = {
["multi"] = {
},
},
["use_vehicle"] = false,
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "MAGE",
["multi"] = {
["MAGE"] = true,
},
},
["zoneIds"] = "",
["use_spellknown"] = false,
["use_combat"] = false,
["faction"] = {
["single"] = "Horde",
["multi"] = {
["Horde"] = true,
["Alliance"] = true,
},
},
["use_exact_spellknown"] = false,
["use_alive"] = true,
["spellknown"] = 53140,
["use_level"] = false,
},
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
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["useAdjustededMax"] = false,
["parent"] = "法师传送&传送门",
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["conditions"] = {
},
["authorOptions"] = {
},
["customText"] = "function (...)\n    return GetItemCount(17032)\nend",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "MCkh0h0IxAh",
["icon"] = true,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["cooldownEdge"] = false,
["zoom"] = 0,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "暴风城",
["useCooldownModRate"] = true,
["alpha"] = 1,
["width"] = 30,
["useTooltip"] = false,
["config"] = {
},
["inverse"] = false,
["color"] = {
1,
1,
1,
1,
},
["displayIcon"] = "135763",
["cooldown"] = false,
["preferToUpdate"] = false,
},
["血条斩杀线提示（火法）"] = {
["iconSource"] = 0,
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 1,
["anchorPoint"] = "LEFT",
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
["use_absorbMode"] = true,
["unit"] = "nameplate",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["debuffType"] = "HELPFUL",
["subeventSuffix"] = "_CAST_START",
["type"] = "unit",
["use_health"] = false,
["unevent"] = "auto",
["use_absorbHealMode"] = true,
["percenthealth"] = {
"20",
},
["event"] = "Health",
["nameplateType"] = "hostile",
["health"] = {
"80",
},
["duration"] = "1",
["spellIds"] = {
},
["health_operator"] = {
">=",
},
["use_nameplateType"] = true,
["use_percenthealth"] = true,
["percenthealth_operator"] = {
"<=",
},
["use_unit"] = true,
},
["untrigger"] = {
["unit"] = "nameplate",
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
["useGlowColor"] = false,
["glowType"] = "ACShine",
["glowLength"] = 4.1,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glow"] = true,
["glowThickness"] = 1,
["glowScale"] = 1.2,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 6,
["glowBorder"] = false,
},
},
["height"] = 15,
["load"] = {
["class_and_spec"] = {
["single"] = 63,
["multi"] = {
[70] = true,
[65] = true,
[66] = true,
},
},
["talent"] = {
["single"] = 3,
["multi"] = {
[8] = true,
[9] = true,
[3] = true,
},
},
["class"] = {
["single"] = "MAGE",
["multi"] = {
["MAGE"] = true,
["PALADIN"] = true,
},
},
["size"] = {
["multi"] = {
},
},
["use_class"] = true,
["use_spellknown"] = true,
["use_class_and_spec"] = true,
["spec"] = {
["multi"] = {
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
["use_never"] = false,
["spellknown"] = 11129,
["zoneIds"] = "",
},
["adjustedMax"] = "",
["useAdjustededMax"] = false,
["color"] = {
1,
1,
1,
1,
},
["desc"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["conditions"] = {
},
["icon"] = true,
["xOffset"] = -10,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["progressSource"] = {
-1,
"",
},
["anchorFrameType"] = "NAMEPLATE",
["frameStrata"] = 5,
["anchorFrameParent"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.0",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 90200,
["id"] = "血条斩杀线提示（火法）",
["useCooldownModRate"] = true,
["alpha"] = 1,
["width"] = 18,
["url"] = "",
["uid"] = "W5xLrgxwte7",
["inverse"] = false,
["parent"] = "法师（中心分组）",
["displayIcon"] = 135827,
["cooldown"] = false,
["selfPoint"] = "RIGHT",
},
["点燃详情"] = {
["iconSource"] = 0,
["parent"] = "法师 动态分组 右",
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 172,
["anchorPoint"] = "LEFT",
["cooldownSwipe"] = true,
["url"] = "https://wago.io/pwGA80Xno/1",
["actions"] = {
["start"] = {
["sound"] = "Interface\\AddOns\\WeakAuras\\Media\\Sounds\\Torch.ogg",
["do_sound"] = false,
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "ignite = {}\ntarget = \"\"\n\n--[[function NextIgniteTick(GUID)\n    if (temp[GUID] ~= nil) then\n        temp[GUID][\"Tick\"] = temp[GUID][\"Tick\"] + 2\n    end\nend--]]\n\nfunction GetGUID(orgGUID)\n    local GUID = \"\"\n    --去掉“-”字符\n    for name in string.gmatch(orgGUID,\"[^-]\") do\n        GUID = GUID..name              \n    end\n    --print(GUID)\n    return GUID\nend\n\n\n",
},
},
["triggers"] = {
{
["trigger"] = {
["rem"] = "2",
["auranames"] = {
"Ignite",
},
["duration"] = "2",
["names"] = {
},
["destUnit"] = "target",
["stacks"] = "5",
["debuffType"] = "HARMFUL",
["type"] = "aura2",
["stacksOperator"] = "==",
["auraspellids"] = {
"12654",
},
["unevent"] = "timed",
["event"] = "Combat Log",
["subeventPrefix"] = "SPELL_PERIODIC",
["spellName"] = {
"Ignite",
},
["use_spellName"] = true,
["spellIds"] = {
},
["unit"] = "target",
["remOperator"] = ">=",
["use_destUnit"] = true,
["useExactSpellId"] = true,
["subeventSuffix"] = "_DAMAGE",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "combatlog",
["subeventSuffix"] = "_DAMAGE",
["duration"] = "2",
["event"] = "Combat Log",
["subeventPrefix"] = "SPELL_PERIODIC",
["destUnit"] = "target",
["use_spellName"] = true,
["use_destUnit"] = true,
["unevent"] = "timed",
["spellName"] = {
"点燃",
},
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "custom",
["unevent"] = "timed",
["duration"] = "1",
["event"] = "Combat Log",
["subeventPrefix"] = "SPELL",
["customDuration"] = "\n\n",
["custom"] = "function()\n    local timestamp, subevent, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellId, spellName, spellSchool, auraType, amount = CombatLogGetCurrentEventInfo()\n    \n    --print(subevent,spellName, spellSchool, auraType, amount)\n    --去掉“-”字符\n    local GUID = GetGUID(destGUID)\n    \n    if (spellName == \"点燃\" and spellSchool == 4) then\n        \n        local t = GetTime() --时间\n        \n        if (subevent == \"SPELL_AURA_APPLIED\" ) then    \n            --print(GUID)\n            ignite[GUID] = {}  \n            ignite[GUID][\"Tick\"] = t + 2\n            ignite[GUID][\"ExpirationTime\"] = t + 4\n            ignite[GUID][\"Stacks\"] = 1\n        else if (subevent == \"SPELL_AURA_APPLIED_DOSE\") then \n                if (ignite[GUID] ~= nil) then\n                    while (ignite[GUID][\"Tick\"] < t)\n                    do                  \n                        ignite[GUID][\"Tick\"] = ignite[GUID][\"Tick\"] + 2\n                    end                  \n                    ignite[GUID][\"ExpirationTime\"] = ignite[GUID][\"Tick\"] + 2\n                    ignite[GUID][\"Stacks\"] = amount\n                end\n            else if (subevent == \"SPELL_AURA_REMOVED\") then \n                    if (ignite[GUID] ~= nil) then\n                        ignite[GUID][\"Tick\"] = 0\n                        ignite[GUID][\"ExpirationTime\"] = 0\n                        ignite[GUID][\"Stacks\"] = 0\n                    end\n                end\n            end\n        end\n    else if (subevent == \"UNIT_DIED\") then --垃圾回收\n            if (ignite[GUID] ~= nil) then \n                ignite[GUID] = nil\n            end\n        end\n    end\n    \n    --print(temp)\n    return false\nend\n\n\n\n\n",
["events"] = "COMBAT_LOG_EVENT_UNFILTERED",
["subeventSuffix"] = "_CAST_START",
["custom_type"] = "event",
["dynamicDuration"] = true,
["custom_hide"] = "timed",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["custom_hide"] = "timed",
["type"] = "custom",
["events"] = "COMBAT_LOG_EVENT_UNFILTERED",
["subeventSuffix"] = "_CAST_START",
["custom"] = "function()\n    --这个触发器用于5层点燃刷新 因为5层之后不触发任何事件\n    local timestamp, subevent, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellId, spellName, spellSchool, amount, overkill, school, resisted, blocked, absorbed, critical, glancing, crushing, isOffHand = CombatLogGetCurrentEventInfo()\n    \n    if subevent == \"SPELL_DAMAGE\"\n    and spellSchool == 4 \n    and critical \n    then\n        local localizedClass, englishClass, classIndex = UnitClass(sourceName)\n        local name, iconTexture, tier, column, rank, maxRank, isExceptional, available = GetTalentInfo(2, 3)\n        if classIndex == 8 \n        and rank ~= 0 then  --必须是点了点燃天赋的法师\n            local t = GetTime()\n            local GUID = GetGUID(destGUID)\n            if ignite[GUID] ~= nil\n            and ignite[GUID][\"Stacks\"] == 5 then  \n                --这里0.4是服务器延迟 是个估算值 偏小 因为大了问题较大 小了反而没有大问题\n                if ((t + 0.4) >= ignite[GUID][\"Tick\"] and (t + 0.4) <= ignite[GUID][\"ExpirationTime\"]) then \n                    ignite[GUID][\"Tick\"] = ignite[GUID][\"Tick\"] + 2\n                    ignite[GUID][\"ExpirationTime\"] = ignite[GUID][\"Tick\"] + 2\n                end       \n            end\n        end\n    end\nend\n\n\n",
["custom_type"] = "event",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "custom",
["custom_type"] = "status",
["duration"] = "1",
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["customDuration"] = "function(duration, expirationTime )\n    if target ~= \"\"\n    and ignite[target]\n    then \n        expirationTime = ignite[target][\"ExpirationTime\"]\n        duration = expirationTime - GetTime()\n        return duration, expirationTime\n    end      \nend",
["custom"] = "function()\n    if temp\n    and UnitExists(\"target\") \n    and UnitIsVisible(\"target\") \n    and (UnitCanAttack(\"player\", \"target\")) \n    and (not UnitIsDead(\"target\")) \n    then        \n        local destGUID = UnitGUID(\"target\")\n        --去掉“-”字符\n        local GUID = GetGUID(destGUID)\n        for key, val in pairs(ignite) do\n            if key == GUID\n            and GetTime() < val[\"ExpirationTime\"]\n            then\n                target = GUID\n                return true\n            end\n        end\n        \n    end\n    \n    target = \"\"\n    return false\nend\n\n\n\n\n",
["unevent"] = "auto",
["check"] = "update",
["unit"] = "player",
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[1]\nend\n\n--触发器1 目标身上是否有点燃，包括叠加层数\n--触发器2 点燃具体伤害\n--触发器3 1-4层点燃的持续时间更新器\n--触发器4 5层点燃的持续时间更新器\n--触发器5 点燃的持续时间",
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
["duration_type"] = "seconds",
["preset"] = "shrink",
},
["main"] = {
["type"] = "none",
["easeType"] = "none",
["easeStrength"] = 3,
["duration_type"] = "relative",
["preset"] = "pulse",
},
["finish"] = {
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desaturate"] = false,
["version"] = 1,
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
["text_text_format_p_time_format"] = 0,
["text_text"] = "%5.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_fixedWidth"] = 64,
["rotateText"] = "NONE",
["text_color"] = {
1,
0.94117647058823,
0.24313725490196,
1,
},
["text_text_format_5.p_format"] = "timed",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_fontSize"] = 24,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_text_format_5.p_time_format"] = 0,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_5.p_time_precision"] = 1,
["type"] = "subtext",
["text_text_format_4.p_time_format"] = 0,
["text_font"] = "默认",
["text_visible"] = false,
["text_shadowXOffset"] = 0,
["text_text_format_4.p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_time_dynamic_threshold"] = 3,
["text_text_format_5.p_time_dynamic_threshold"] = 60,
["text_text_format_4.p_time_precision"] = 1,
["anchor_point"] = "CENTER",
["text_text_format_4.p_format"] = "timed",
["text_text_format_5.p_time_legacy_floor"] = true,
["text_text_format_5.p_time_mod_rate"] = true,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.casterName",
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
0.250980406999588,
0.7803922295570374,
0.9215686917304993,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 16,
["anchorXOffset"] = 0,
["text_text_format_1.casterName_format"] = "none",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_3.amount_format"] = "none",
["text_text"] = "%2.amount",
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
0,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_anchorYOffset"] = -5,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "OUTER_BOTTOM",
["text_fontSize"] = 20,
["anchorXOffset"] = 0,
["text_text_format_2.amount_format"] = "none",
},
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "%1.s",
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
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_anchorYOffset"] = -5,
["text_fontType"] = "OUTLINE",
["anchor_point"] = "INNER_BOTTOM",
["text_fontSize"] = 24,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 48,
["load"] = {
["use_class"] = true,
["talent"] = {
["single"] = 23,
["multi"] = {
[23] = true,
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "MAGE",
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
["width"] = 48,
["icon"] = true,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["conditions"] = {
},
["color"] = {
1,
1,
1,
1,
},
["authorOptions"] = {
},
["config"] = {
},
["useCooldownModRate"] = true,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = false,
["tocversion"] = 11305,
["id"] = "点燃详情",
["zoom"] = 0.33,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["uid"] = "vJtR()H8qjY",
["inverse"] = false,
["preferToUpdate"] = false,
["displayIcon"] = "135818",
["cooldown"] = true,
["cooldownEdge"] = false,
},
["法师 法力条"] = {
["sparkWidth"] = 5,
["iconSource"] = -1,
["authorOptions"] = {
},
["preferToUpdate"] = true,
["yOffset"] = -4,
["anchorPoint"] = "CENTER",
["sparkRotation"] = 0,
["textureInput"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Circle_AlphaGradient_In.tga",
["url"] = "https://space.bilibili.com/455259",
["icon"] = false,
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
["single"] = "MAGE",
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
["smoothProgress"] = false,
["useAdjustededMin"] = false,
["regionType"] = "aurabar",
["texture"] = "GW2_UI_Blue",
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
["sparkOffsetX"] = 0,
["wagoID"] = "tRi9estlC",
["parent"] = "法师 资源条",
["customText"] = "function()\n    local mana = UnitPower(\"player\",0)\n    local manaMax = UnitPowerMax(\"player\",0)\n    local manaPerc = (mana / manaMax) * 100\n    return string.format(\"%.0f\",manaPerc)\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
["sparkRotationMode"] = "MANUAL",
["triggers"] = {
{
["trigger"] = {
["duration"] = "1",
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["powertype"] = 0,
["use_powertype"] = true,
["custom_hide"] = "timed",
["subeventPrefix"] = "SPELL",
["type"] = "unit",
["spellName"] = 200183,
["unevent"] = "auto",
["use_showOn"] = true,
["names"] = {
"Прославление",
},
["event"] = "Power",
["ownOnly"] = true,
["realSpellName"] = "Прославление",
["use_spellName"] = true,
["spellIds"] = {
200183,
},
["use_unit"] = true,
["use_genericShowOn"] = true,
["subeventSuffix"] = "_CAST_START",
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
["useAdjustededMax"] = false,
["source"] = "import",
["spark"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["config"] = {
},
["adjustedMax"] = "",
["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
["xOffset"] = 0,
["borderInFront"] = false,
["backdropColor"] = {
1,
1,
1,
0,
},
["icon_side"] = "RIGHT",
["backgroundColor"] = {
0,
0,
0,
0.300000011920929,
},
["width"] = 297,
["sparkHeight"] = 20,
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
["overlaysTexture"] = {
"Solid",
},
["customTextUpdate"] = "event",
["semver"] = "1.1.0",
["sparkHidden"] = "BOTH",
["id"] = "法师 法力条",
["borderBackdrop"] = "None",
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
["uid"] = "wFOQkJ07GM1",
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
["魔法晶水（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
["parent"] = "法师 底部分组",
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
["do_custom"] = true,
["custom"] = "local e = aura_env \n\nif not e.btn then \n    local region = WeakAuras.GetRegion(e.id) \n    \n    -- 将父级框架改为 UIParent 避免安全模板污染\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", UIParent, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonDown\", \"RightButtonDown\")\n    \n    -- 统一改回使用 macro 属性，并写在初始化内\n    -- 左键：使用物品\n    e.btn:SetAttribute(\"type1\", \"macro\")\n    e.btn:SetAttribute(\"macrotext1\", \"/use 魔法晶水\")\n    \n    -- 右键：施放技能\n    e.btn:SetAttribute(\"type2\", \"macro\")\n    e.btn:SetAttribute(\"macrotext2\", \"/cast 造水术\")\n    \n    e.btn:SetAllPoints(region) \n    e.btn:SetFrameStrata(\"TOOLTIP\")\n    e.btn:SetFrameLevel(9999)\nend \n\nlocal btn = e.btn \n\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff左键：|r|cff387add使用 魔法晶水|r\\n\"..\n            \"|cffffffff右键：|r|cff45d8ff施放 造水术|r\",\n            0, 1, 0, 1, 1\n        )\n        GameTooltip:Show()\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide() \nend)\n\nbtn:Show()",
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["useExactSpellId"] = false,
["event"] = "Health",
["unit"] = "player",
["names"] = {
},
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
["auranames"] = {
"喝水",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 8079,
["use_count"] = false,
["auranames"] = {
"6117",
"7302",
},
["duration"] = "1",
["unit"] = "player",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["use_exact_itemName"] = true,
["names"] = {
},
["event"] = "Item Count",
["unevent"] = "auto",
["matchesShowOn"] = "showAlways",
["count"] = "1",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "item",
["use_itemName"] = true,
["use_unit"] = true,
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.armors.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
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
["text_text_format_p_time_precision"] = 1,
["text_text"] = "%2.s",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_dynamic_threshold"] = 60,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_time_legacy_floor"] = false,
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 6,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -4,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_format"] = 0,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 12,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 32,
["load"] = {
["use_class"] = true,
["use_spellknown"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "MAGE",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 168,
["size"] = {
["multi"] = {
},
},
},
["frameStrata"] = 1,
["useAdjustededMax"] = false,
["icon"] = true,
["source"] = "import",
["keepAspectRatio"] = true,
["cooldown"] = true,
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "value",
["op"] = "==",
["value"] = "0",
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
["maintenance"] = {
["armors"] = {
["behavior"] = 2,
},
},
},
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
["text"] = "Armors",
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
["name"] = "Armors",
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["collapse"] = false,
["type"] = "group",
["limitType"] = "none",
["groupType"] = "simple",
["key"] = "armors",
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
["width"] = 32,
["anchorFrameParent"] = false,
["alpha"] = 1,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "2.0.3",
["tocversion"] = 30400,
["id"] = "魔法晶水（可点击施法）",
["cooldownTextDisabled"] = false,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["uid"] = "3uQISXPgZnL",
["inverse"] = false,
["preferToUpdate"] = true,
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["selfPoint"] = "CENTER",
},
["幽暗城"] = {
["iconSource"] = 0,
["authorOptions"] = {
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
["type"] = "custom",
["custom_type"] = "event",
["event"] = "Health",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["names"] = {
},
["events"] = "DOOR_BTN_SHOW,DOOR_BTN_HIDE",
["custom"] = "function(event)\n    if event == \"DOOR_BTN_SHOW\" then\n        return true\n    end\nend",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["custom_hide"] = "custom",
},
["untrigger"] = {
["custom"] = "function(event)\n    if event == \"DOOR_BTN_HIDE\" then\n        return true\n    end\nend",
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
["text_text"] = "幽暗",
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
1,
1,
1,
1,
},
["text_font"] = "Friz Quadrata TT",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_anchorYOffset"] = 0,
["anchor_point"] = "INNER_BOTTOM",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_visible"] = true,
},
{
["border_size"] = 1,
["border_offset"] = 0,
["border_color"] = {
0.250980406999588,
0.7803922295570374,
0.9215686917304993,
1,
},
["border_visible"] = true,
["border_edge"] = "1 Pixel",
["type"] = "subborder",
},
},
["height"] = 30,
["useTooltip"] = false,
["load"] = {
["use_never"] = true,
["class"] = {
["single"] = "MAGE",
["multi"] = {
["MAGE"] = true,
},
},
["use_class"] = true,
["race"] = {
},
["use_faction"] = true,
["size"] = {
["multi"] = {
},
},
["use_namerealm"] = false,
["namerealm"] = "山下智久",
["talent"] = {
["multi"] = {
},
},
["use_vehicle"] = false,
["spec"] = {
["multi"] = {
},
},
["use_spellknown"] = true,
["use_alive"] = true,
["faction"] = {
["single"] = "Horde",
},
["use_exact_spellknown"] = false,
["use_combat"] = false,
["spellknown"] = 3563,
["zoneIds"] = "",
},
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
["useAdjustededMax"] = false,
["color"] = {
1,
1,
1,
1,
},
["source"] = "import",
["cooldown"] = false,
["displayIcon"] = 135766,
["parent"] = "法师传送&传送门",
["progressSource"] = {
-1,
"",
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env\nif not _G[e.id..\"Button\"] then\n    local region = WeakAuras.GetRegion(e.id)\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")\n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"LeftButtonDown\", \"RightButtonDown\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region)\nend\n\nlocal btn = _G[e.id..\"Button\"]\nbtn:SetAttribute(\"macrotext1\",\"/cast 传送门：幽暗城\")\nbtn:SetAttribute(\"macrotext2\",\"/cast 传送：幽暗城\")\n\nbtn:SetScript(\"OnEnter\", function(self)\n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")\n        GameTooltip:SetText(\"|cffffffff左键：|r传送门：幽暗城|cff04f192（\"..GetItemCount(17032)..\"）|r\\n|cffffffff右键：|r传送：幽暗城|cff04f192（\"..GetItemCount(17031)..\"）|r\", 0, 1, 0, 1, 1)\n        WeakAuras.ScanEvents(\"DOOR_BTN_SHOW\")\nend)\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide()\n        WeakAuras.ScanEvents(\"DOOR_BTN_HIDE\")\nend)",
},
["finish"] = {
},
},
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["anchorFrameParent"] = false,
["customText"] = "function (...)\n    return GetItemCount(17032)\nend",
["zoom"] = 0,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "幽暗城",
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["width"] = 30,
["xOffset"] = 0,
["uid"] = "3Ab7TGnKgB1",
["inverse"] = false,
["cooldownEdge"] = false,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = true,
},
["奥术强化（闪电音效）"] = {
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
["use_debuffClass"] = false,
["auraspellids"] = {
"12042",
},
["ownOnly"] = true,
["event"] = "Health",
["unit"] = "player",
["useExactSpellId"] = true,
["useName"] = false,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["auranames"] = {
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
["desaturate"] = false,
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
{
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "奥强",
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
0.250980406999588,
0.7803922295570374,
0.9215686917304993,
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
["use_class"] = true,
["use_itemequiped"] = false,
["talent"] = {
["multi"] = {
},
},
["use_never"] = false,
["class"] = {
["single"] = "MAGE",
["multi"] = {
["PALADIN"] = true,
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
["parent"] = "法师（BUFF）",
["desc"] = "",
["cooldown"] = true,
["displayIcon"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["icon"] = true,
["uid"] = "i5Vhs38hDFh",
["selfPoint"] = "CENTER",
["anchorFrameParent"] = false,
["alpha"] = 1,
["cooldownEdge"] = false,
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["tocversion"] = 20501,
["id"] = "奥术强化（闪电音效）",
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["config"] = {
},
["inverse"] = false,
["adjustedMax"] = "",
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
["value"] = {
["sound_type"] = "Play",
["sound"] = "Interface\\Addons\\WeakAuras\\PowerAurasMedia\\Sounds\\ESPARK1.ogg",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】龙神の剣を喰らえ！.ogg",
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
["法力护盾（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["auranames"] = {
"1463",
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
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Spell)",
["spellName"] = 1463,
["realSpellName"] = "法力护盾",
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
["version"] = 5,
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
["single"] = "MAGE",
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
["spellknown"] = 1463,
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
["url"] = "",
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
["parent"] = "法师 核心分组",
["semver"] = "2.0.3",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "法力护盾（可点击施法）",
["cooldownTextDisabled"] = false,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["uid"] = "3Je1SmNp8cW",
["inverse"] = true,
["xOffset"] = 0,
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
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 法力护盾\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cff45d8ff\"..\"法力护盾\"..\"|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
},
["finish"] = {
},
},
},
["5秒回蓝（法师）"] = {
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
["use_never"] = true,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["class"] = {
["single"] = "MAGE",
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
["uid"] = "B1xuz(QM4gx",
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "XoGkZt2VR",
["parent"] = "法师 资源条",
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
["id"] = "5秒回蓝（法师）",
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
["法师传送&传送门"] = {
["grow"] = "DOWN",
["controlledChildren"] = {
"暴风城",
"奥格瑞玛",
"幽暗城",
"雷霆崖",
"铁炉堡",
"达纳苏斯",
},
["borderBackdrop"] = "Blizzard Tooltip",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["groupIcon"] = "135763",
["anchorPoint"] = "BOTTOMRIGHT",
["limit"] = 5,
["selfPoint"] = "TOP",
["fullCircle"] = true,
["space"] = 0,
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
["columnSpace"] = 1,
["radius"] = 20,
["yOffset"] = -30,
["useLimit"] = false,
["align"] = "CENTER",
["gridType"] = "RD",
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
["stagger"] = 0,
["xOffset"] = 0,
["rowSpace"] = 1,
["subRegions"] = {
},
["borderInset"] = 1,
["sortHybridTable"] = {
["奥格瑞玛"] = false,
["幽暗城"] = false,
["达纳苏斯"] = false,
["铁炉堡"] = false,
["雷霆崖"] = false,
["暴风城"] = false,
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
["uid"] = "ZzvsLKRPrYs",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["alpha"] = 1,
["source"] = "import",
["gridWidth"] = 3,
["scale"] = 1.1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["sort"] = "none",
["useAnchorPerUnit"] = false,
["regionType"] = "dynamicgroup",
["anchorFrameParent"] = false,
["constantFactor"] = "RADIUS",
["anchorFrameFrame"] = "Minimap",
["borderOffset"] = 4,
["animate"] = true,
["tocversion"] = 30400,
["id"] = "法师传送&传送门",
["rotation"] = 0,
["frameStrata"] = 1,
["anchorFrameType"] = "SELECTFRAME",
["parent"] = "法师",
["config"] = {
},
["arcLength"] = 360,
["internalVersion"] = 90,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["borderColor"] = {
0,
0,
0,
1,
},
},
["寒冰护体（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["useName"] = true,
["auranames"] = {
"11426",
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
["realSpellName"] = "寒冰护体",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 11426,
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
["single"] = "MAGE",
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
["spellknown"] = 11426,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "法师 核心分组",
["cooldown"] = true,
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
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "0)e8iH2Ip)0",
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
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "寒冰护体（可点击施法）",
["zoom"] = 0.3,
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
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 寒冰护体\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cff45d8ff\"..\"寒冰护体\"..\"|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
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
["法师（BUFF）"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"奥术强化（闪电音效）",
"气定神闲",
"燃烧（闪电音效）",
"节能施法（法师）",
"痛苦诅咒/强化灼烧（火法，火焰易伤）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["yOffset"] = 20,
["anchorPoint"] = "CENTER",
["fullCircle"] = true,
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
["columnSpace"] = 4,
["radius"] = 200,
["useLimit"] = true,
["align"] = "CENTER",
["config"] = {
},
["stagger"] = 0,
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["rotation"] = 0,
["internalVersion"] = 90,
["xOffset"] = 142,
["subRegions"] = {
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
["arcLength"] = 360,
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
["gridType"] = "RD",
["backdropColor"] = {
1,
1,
1,
0.5,
},
["borderInset"] = 1,
["animate"] = false,
["parent"] = "法师",
["scale"] = 1.1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["stepAngle"] = 15,
["borderSize"] = 2,
["limit"] = 10,
["regionType"] = "dynamicgroup",
["alpha"] = 1,
["anchorFrameParent"] = false,
["constantFactor"] = "RADIUS",
["frameStrata"] = 1,
["borderOffset"] = 4,
["selfPoint"] = "TOPLEFT",
["space"] = 2,
["id"] = "法师（BUFF）",
["sort"] = "none",
["gridWidth"] = 5,
["anchorFrameType"] = "UIPARENT",
["source"] = "import",
["uid"] = "x9t8gHdkPWL",
["borderColor"] = {
0,
0,
0,
1,
},
["sortHybridTable"] = {
["节能施法（法师）"] = false,
["奥术强化（闪电音效）"] = false,
["燃烧（闪电音效）"] = false,
["熔岩之怒（火法）"] = false,
["气定神闲"] = false,
["强化灼烧（火法）"] = false,
},
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
},
["groupIcon"] = "interface/icons/classicon_mage.blp",
},
["奥格瑞玛"] = {
["iconSource"] = 0,
["parent"] = "法师传送&传送门",
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
["do_custom"] = true,
["custom"] = "local e = aura_env\nif not _G[e.id..\"Button\"] then\n    local region = WeakAuras.GetRegion(e.id)\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")\n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"LeftButtonDown\", \"RightButtonDown\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region)\nend\n\nlocal btn = _G[e.id..\"Button\"]\nbtn:SetAttribute(\"macrotext1\",\"/cast 传送门：奥格瑞玛\")\nbtn:SetAttribute(\"macrotext2\",\"/cast 传送：奥格瑞玛\")\n\nbtn:SetScript(\"OnEnter\", function(self)\n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")\n        GameTooltip:SetText(\"|cffffffff左键：|r传送门：奥格瑞玛|cff04f192（\"..GetItemCount(17032)..\"）|r\\n|cffffffff右键：|r传送：奥格瑞玛|cff04f192（\"..GetItemCount(17031)..\"）|r\", 0, 1, 0, 1, 1)\n        WeakAuras.ScanEvents(\"DOOR_BTN_SHOW\")\nend)\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide()\n        WeakAuras.ScanEvents(\"DOOR_BTN_HIDE\")\nend)",
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["custom_type"] = "event",
["event"] = "Health",
["unit"] = "player",
["custom_hide"] = "custom",
["subeventPrefix"] = "SPELL",
["events"] = "DOOR_BTN_SHOW,DOOR_BTN_HIDE",
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["custom"] = "function(event)\n    if event == \"DOOR_BTN_SHOW\" then\n        return true\n    end\nend",
["names"] = {
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
["custom"] = "function(event)\n    if event == \"DOOR_BTN_HIDE\" then\n        return true\n    end\nend",
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
["text_shadowXOffset"] = 0,
["text_text_format_s_format"] = "none",
["text_text"] = "奥格",
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
1,
1,
1,
1,
},
["text_font"] = "Friz Quadrata TT",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["anchor_point"] = "INNER_BOTTOM",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_anchorYOffset"] = 0,
},
{
["border_size"] = 1,
["border_offset"] = 0,
["border_color"] = {
0.250980406999588,
0.7803922295570374,
0.9215686917304993,
1,
},
["border_visible"] = true,
["border_edge"] = "1 Pixel",
["type"] = "subborder",
},
},
["height"] = 30,
["icon"] = true,
["load"] = {
["use_never"] = true,
["class"] = {
["single"] = "MAGE",
["multi"] = {
["MAGE"] = true,
},
},
["use_class"] = true,
["race"] = {
},
["use_faction"] = true,
["zoneIds"] = "",
["use_namerealm"] = false,
["namerealm"] = "山下智久",
["talent"] = {
["multi"] = {
},
},
["use_vehicle"] = false,
["spec"] = {
["multi"] = {
},
},
["use_spellknown"] = true,
["use_alive"] = true,
["faction"] = {
["single"] = "Horde",
},
["use_exact_spellknown"] = false,
["use_combat"] = false,
["spellknown"] = 3567,
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
["useAdjustededMax"] = false,
["xOffset"] = 0,
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["conditions"] = {
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "suEif4X9cCq",
["url"] = "",
["width"] = 30,
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["customText"] = "function (...)\n    return GetItemCount(17032)\nend",
["zoom"] = 0,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "奥格瑞玛",
["frameStrata"] = 1,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["authorOptions"] = {
},
["config"] = {
},
["inverse"] = false,
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
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
["displayIcon"] = 135759,
["cooldown"] = false,
["preferToUpdate"] = true,
},
["冰霜新星"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["useName"] = true,
["auranames"] = {
"122",
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
["realSpellName"] = "冰霜新星",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 122,
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
["version"] = 5,
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
["single"] = "MAGE",
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
["spellknown"] = 122,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "法师 核心分组",
["cooldown"] = true,
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
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "YUN()RdsO9G",
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
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "冰霜新星",
["zoom"] = 0.3,
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
["do_custom"] = false,
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
["防护火焰结界/防护冰霜结界（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["type"] = "aura2",
["auranames"] = {
"543",
"6143",
},
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["useName"] = true,
["match_countOperator"] = ">",
["spellIds"] = {
},
["useMatch_count"] = true,
["match_count"] = "0",
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
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "防护火焰结界",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 543,
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
["version"] = 5,
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
["single"] = "MAGE",
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
["spellknown"] = 543,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "法师 核心分组",
["cooldown"] = true,
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
["uid"] = "0yze2HVF5l3",
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
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "防护火焰结界/防护冰霜结界（可点击施法）",
["zoom"] = 0.3,
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
["do_custom"] = true,
["custom"] = "local e = aura_env \nif not _G[e.id..\"Button\"] then \n    local region = WeakAuras.GetRegion(e.id) \n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"MiddleButtonUp\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region) \nend \n\nlocal btn = _G[e.id..\"Button\"] \nbtn:SetAttribute(\"macrotext1\",\"/cast 防护火焰结界\")\nbtn:SetAttribute(\"macrotext2\",\"/cast 防护冰霜结界\")\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n        \"|cffffffff左键：|r|cfff4334b\"..\"防护火焰结界\"..\"|r\\n|cffffffff右键：|r|cff45d8ff\"..\"防护冰霜结界\"..\"|r\")\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)\nbtn:Show()",
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
["寒冰屏障（可点击施法，左键冰箱，右键取消）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["type"] = "aura2",
["auranames"] = {
"11958",
},
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["useName"] = true,
["match_countOperator"] = ">",
["spellIds"] = {
},
["useMatch_count"] = true,
["match_count"] = "0",
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
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "寒冰屏障",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 11958,
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
["version"] = 5,
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
["single"] = "MAGE",
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
["spellknown"] = 11958,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "法师 核心分组",
["cooldown"] = true,
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
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "y5ujrjoiv)d",
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
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "寒冰屏障（可点击施法，左键冰箱，右键取消）",
["zoom"] = 0.3,
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
["do_custom"] = true,
["custom"] = "local e = aura_env \n\nlocal spellName = \"寒冰屏障\"\nlocal spellColor = \"1B5887\"\nlocal cancelColor = \"FF2020\"\n\nlocal leftClickMacro = \"/stopcasting\\n/cast \" .. spellName\nlocal rightClickMacro = \"/cancelaura \" .. spellName\n\nif not e.btn then \n    local region = WeakAuras.GetRegion(e.id) \n    \n    -- 将父级框架改为 UIParent 避免安全模板污染\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", UIParent, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonDown\", \"RightButtonDown\", \"MiddleButtonDown\")\n    \n    -- 左键：打断当前施法并施放冰箱\n    e.btn:SetAttribute(\"type1\", \"macro\")\n    e.btn:SetAttribute(\"macrotext1\", leftClickMacro)\n    \n    -- 右键：取消冰箱\n    e.btn:SetAttribute(\"type2\", \"macro\")\n    e.btn:SetAttribute(\"macrotext2\", rightClickMacro)\n    \n    e.btn:SetAllPoints(region) \n    e.btn:SetFrameStrata(\"TOOLTIP\")\n    e.btn:SetFrameLevel(9999)\nend \n\nlocal btn = e.btn \n\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")\n        GameTooltip:SetText(\"|cffffffff左键：|r|cff\" .. spellColor .. spellName .. \"|r\\n|cffffffff右键：|r|cff\" .. cancelColor .. \"取消\" .. spellName .. \"|r\")\n        GameTooltip:Show()\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide() \nend)\n\nbtn:Show()",
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
["节能施法（法师）"] = {
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
["auranames"] = {
"12536",
},
["ownOnly"] = true,
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["useName"] = true,
["names"] = {
},
["unit"] = "player",
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
0.250980406999588,
0.7803922295570374,
0.9215686917304993,
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
["use_class"] = true,
["use_spellknown"] = false,
["use_itemequiped"] = false,
["talent"] = {
["multi"] = {
[2] = true,
},
},
["class"] = {
["single"] = "MAGE",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["use_never"] = false,
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
["desc"] = "",
["uid"] = "BfTIXKQXPYx",
["cooldownEdge"] = false,
["anchorFrameParent"] = false,
["alpha"] = 1,
["parent"] = "法师（BUFF）",
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["tocversion"] = 20501,
["id"] = "节能施法（法师）",
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
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
["冲击波"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["realSpellName"] = "冲击波",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 11113,
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
["version"] = 5,
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
["single"] = 39,
["multi"] = {
[39] = true,
[50] = true,
},
},
["class"] = {
["single"] = "MAGE",
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
["spellknown"] = 11113,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "法师 核心分组",
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
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "VkpwcHowkHx",
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
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "冲击波",
["zoom"] = 0.3,
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
["do_custom"] = false,
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
["冰锥术"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["realSpellName"] = "冰锥术",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 120,
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
["ignoreWagoUpdate"] = true,
["version"] = 5,
["subRegions"] = {
{
["type"] = "subbackground",
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
["single"] = "MAGE",
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
["spellknown"] = 120,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "法师 核心分组",
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
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "6bNoECxEvdD",
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
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "冰锥术",
["zoom"] = 0.3,
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
["法师 底部分组"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"魔法抑制/魔法增效（可点击施法）",
"奥术智慧/奥术光辉（可点击施法）",
"法师护甲（可点击施法）",
"魔法面包（可点击施法）",
"魔法晶水（可点击施法）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["stepAngle"] = 15,
["groupIcon"] = "interface/icons/classicon_mage.blp",
["sortHybridTable"] = {
["法师护甲合集（可点击施法）"] = false,
["奥术智慧/奥术光辉/达拉然光辉（可点击施法）"] = false,
["魔法抑制/魔法增效（可点击施法，左键抑制，右键增效）"] = false,
},
["frameStrata"] = 1,
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
["parent"] = "法师（中心分组）",
["selfPoint"] = "CENTER",
["align"] = "CENTER",
["growOn"] = "",
["xOffset"] = 0,
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
["rotation"] = 0,
["grow"] = "HORIZONTAL",
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
["yOffset"] = -103,
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
["sort"] = "none",
["gridWidth"] = 5,
["animate"] = false,
["constantFactor"] = "RADIUS",
["gridType"] = "RD",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 11500,
["id"] = "法师 底部分组",
["limit"] = 5,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["borderColor"] = {
0,
0,
0,
1,
},
["uid"] = "pKo1bY)2WRV",
["config"] = {
},
["space"] = 3,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["radius"] = 200,
},
["法师（中心分组）"] = {
["controlledChildren"] = {
"血条斩杀线提示（火法）",
"法师 动态分组 左",
"法师 动态分组 右",
"法师 核心分组",
"法师 底部分组",
"法师 资源条",
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
["config"] = {
},
["xOffset"] = 0,
["borderOffset"] = 5,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "法师（中心分组）",
["alpha"] = 1,
["frameStrata"] = 3,
["anchorFrameType"] = "SCREEN",
["groupIcon"] = "interface/icons/classicon_mage.blp",
["borderInset"] = 11,
["uid"] = "2hsga1JUwDk",
["selfPoint"] = "CENTER",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["ignoreOptionsEventErrors"] = true,
["forceEvents"] = true,
["groupOffset"] = false,
},
["parent"] = "法师",
},
["缓落术（可点击施法）"] = {
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
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"130",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["names"] = {
},
["unitExists"] = true,
["spellName"] = 1706,
["debuffType"] = "HELPFUL",
["useName"] = true,
["unevent"] = "auto",
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_unit"] = true,
["event"] = "Cooldown Progress (Spell)",
["duration"] = "1",
["realSpellName"] = "漂浮术",
["use_spellName"] = true,
["spellIds"] = {
},
["use_itemName"] = true,
["matchesShowOn"] = "showOnActive",
["unit"] = "player",
["use_track"] = true,
["type"] = "aura2",
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
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["subeventPrefix"] = "SPELL",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["spellName"] = 130,
["names"] = {
},
["type"] = "spell",
["use_unit"] = true,
["unevent"] = "auto",
["duration"] = "1",
["unit"] = "player",
["event"] = "Cooldown Progress (Spell)",
["use_itemName"] = true,
["realSpellName"] = "漂浮术",
["use_spellName"] = true,
["spellIds"] = {
},
["useName"] = true,
["matchesShowOn"] = "showAlways",
["subeventSuffix"] = "_CAST_START",
["use_track"] = true,
["use_showgcd"] = false,
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.power_word_fortitude.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
["activeTriggerMode"] = 1,
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
["glow"] = false,
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
["type"] = "subglow",
["glowScale"] = 2,
["glowXOffset"] = 1,
["useGlowColor"] = false,
["glowThickness"] = 1,
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
["single"] = "MAGE",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 130,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 40,
["source"] = "import",
["xOffset"] = 0,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \nlocal spellName = \"缓落术\"\nlocal spellColor = \"ff8827\"\nlocal reagentName = \"轻羽毛\"\nlocal leftClickMacro = \"/cast \" .. spellName\nlocal rightClickMacro = \"/cancelaura \" .. spellName\n\nif not e.btn then \n    local region = WeakAuras.GetRegion(e.id) \n    \n    -- 将父级框架改为 UIParent 避免安全模板污染\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", UIParent, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonDown\", \"RightButtonDown\", \"MiddleButtonDown\")\n    \n    -- 统一使用 macro 属性，并写在初始化内\n    e.btn:SetAttribute(\"type1\", \"macro\")\n    e.btn:SetAttribute(\"macrotext1\", leftClickMacro)\n    \n    e.btn:SetAttribute(\"type2\", \"macro\")\n    e.btn:SetAttribute(\"macrotext2\", rightClickMacro)\n    \n    e.btn:SetAllPoints(region) \n    e.btn:SetFrameStrata(\"TOOLTIP\")\n    e.btn:SetFrameLevel(9999)\nend \n\nlocal btn = e.btn \n\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff左键：|r|cff\" .. spellColor .. spellName .. \" (\" .. GetItemCount(reagentName) .. \")|r\\n\" ..\n            \"|cffffffff右键：|r|cff\" .. spellColor .. \"取消\" .. spellName .. \"|r\"\n        )\n        GameTooltip:Show()\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide() \nend)\n\nbtn:Show()",
},
},
["cooldown"] = true,
["parent"] = "法师 核心分组",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["keepAspectRatio"] = true,
["adjustedMax"] = "",
["config"] = {
["maintenance"] = {
["power_word_fortitude"] = {
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
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11500,
["id"] = "缓落术（可点击施法）",
["semver"] = "2.0.0",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["zoom"] = 0.3,
["uid"] = "8J01TA)oKxl",
["inverse"] = false,
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
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["cooldownEdge"] = true,
},
["奥术智慧/奥术光辉（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["text"] = "Arcane Intellect",
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
["name"] = "Arcane Intellect",
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["collapse"] = false,
["type"] = "group",
["limitType"] = "none",
["groupType"] = "simple",
["key"] = "arcane_intellect",
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
["do_custom"] = true,
["custom"] = "local e = aura_env \n\nif not e.btn then \n    local region = WeakAuras.GetRegion(e.id) \n    \n    -- 将父级框架改为 UIParent 避免安全模板污染\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", UIParent, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonDown\", \"RightButtonDown\")\n    \n    -- 重新使用 macro 属性，但赋值必须在初始化内完成\n    -- 左键：奥术智慧\n    e.btn:SetAttribute(\"*type1\", \"macro\")\n    e.btn:SetAttribute(\"*macrotext1\", \"/cast [mod:alt,@player][] 奥术智慧\")\n    \n    -- 右键：奥术光辉\n    e.btn:SetAttribute(\"*type2\", \"macro\")\n    e.btn:SetAttribute(\"*macrotext2\", \"/cast [mod:alt,@player][] 奥术光辉\")\n    \n    e.btn:SetAllPoints(region) \n    e.btn:SetFrameStrata(\"TOOLTIP\")\n    e.btn:SetFrameLevel(9999)\nend \n\nlocal btn = e.btn \n\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff左键：|r|cff387add奥术智慧|r\\n\"..\n            \"|cffffffff右键：|r|cff45d8ff奥术光辉|r\\n\"..\n            \"|cffaaaaaaAlt + 点击：给自己施放|r\", \n            0, 1, 0, 1, 1\n        )\n        GameTooltip:Show()\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide() \nend)\n\nbtn:Show()",
},
},
["triggers"] = {
{
["trigger"] = {
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"1459",
"23028",
},
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["names"] = {
},
["unevent"] = "auto",
["spellIds"] = {
},
["matchesShowOn"] = "showAlways",
["type"] = "aura2",
["use_itemName"] = true,
["unit"] = "player",
["use_unit"] = true,
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n    \n    local behavior = aura_env.config.maintenance.arcane_intellect.behavior\n    \n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
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
},
["height"] = 32,
["load"] = {
["use_class"] = true,
["use_spellknown"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "MAGE",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 1459,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 32,
["source"] = "import",
["selfPoint"] = "CENTER",
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["cooldownEdge"] = true,
["color"] = {
1,
1,
1,
1,
},
["config"] = {
["maintenance"] = {
["arcane_intellect"] = {
["behavior"] = 2,
},
},
},
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "奥术智慧/奥术光辉（可点击施法）",
["semver"] = "2.0.3",
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "kk)tG4ZrAUR",
["inverse"] = false,
["parent"] = "法师 底部分组",
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
["icon"] = true,
},
["奥术强化（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["useName"] = true,
["auranames"] = {
"12042",
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
["realSpellName"] = "奥术强化",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 12042,
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
["version"] = 5,
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
["multi"] = {
},
},
["class"] = {
["single"] = "MAGE",
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
["spellknown"] = 12042,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "法师 核心分组",
["cooldown"] = true,
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
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "wqwzfBwAHEF",
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
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "奥术强化（可点击施法）",
["zoom"] = 0.3,
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
["do_custom"] = true,
["custom"] = "local e = aura_env \nlocal spellName = \"奥术强化\"\nlocal spellColor = \"2C4D9F\"\nlocal castCommand = \"/cast \" .. spellName\n\nif not e.btn then \n    local region = WeakAuras.GetRegion(e.id) \n    \n    -- 将父级框架改为 UIParent 避免安全模板污染\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", UIParent, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonDown\", \"RightButtonDown\", \"MiddleButtonDown\")\n    \n    -- 统一使用 macro 属性，并写在初始化内\n    e.btn:SetAttribute(\"type1\", \"macro\")\n    e.btn:SetAttribute(\"macrotext1\", castCommand)\n    \n    e.btn:SetAllPoints(region) \n    e.btn:SetFrameStrata(\"TOOLTIP\")\n    e.btn:SetFrameLevel(9999)\nend \n\nlocal btn = e.btn \n\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")\n        GameTooltip:SetText(\"|cff\" .. spellColor .. spellName .. \"|r\")\n        GameTooltip:Show()\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide() \nend)\n\nbtn:Show()",
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
["法师 动态分组 右"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"点燃详情",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["xOffset"] = 149,
["preferToUpdate"] = true,
["yOffset"] = 24,
["gridType"] = "LU",
["animate"] = false,
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
["useLimit"] = true,
["align"] = "CENTER",
["space"] = 3,
["anchorPoint"] = "CENTER",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["stagger"] = 0,
["rotation"] = 0,
["version"] = 3,
["sortHybridTable"] = {
},
["groupIcon"] = "interface/icons/classicon_mage.blp",
["uid"] = "KG5N2q2Sj)g",
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
["radius"] = 200,
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
["config"] = {
},
["constantFactor"] = "RADIUS",
["sort"] = "none",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "法师 动态分组 右",
["stepAngle"] = 15,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["borderColor"] = {
0,
0,
0,
1,
},
["borderInset"] = 1,
["arcLength"] = 360,
["selfPoint"] = "BOTTOMRIGHT",
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["parent"] = "法师（中心分组）",
},
["雷霆崖"] = {
["iconSource"] = 0,
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
["type"] = "custom",
["custom_type"] = "event",
["event"] = "Health",
["unit"] = "player",
["custom_hide"] = "custom",
["subeventPrefix"] = "SPELL",
["events"] = "DOOR_BTN_SHOW,DOOR_BTN_HIDE",
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["custom"] = "function(event)\n    if event == \"DOOR_BTN_SHOW\" then\n        return true\n    end\nend",
["names"] = {
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
["custom"] = "function(event)\n    if event == \"DOOR_BTN_HIDE\" then\n        return true\n    end\nend",
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
["text_shadowXOffset"] = 0,
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
["type"] = "subtext",
["text_anchorXOffset"] = 1,
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
["text_visible"] = true,
["anchor_point"] = "INNER_BOTTOM",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_anchorYOffset"] = 0,
},
{
["border_size"] = 1,
["border_offset"] = 0,
["border_color"] = {
0.250980406999588,
0.7803922295570374,
0.9215686917304993,
1,
},
["border_visible"] = true,
["border_edge"] = "1 Pixel",
["type"] = "subborder",
},
},
["height"] = 30,
["adjustedMax"] = "",
["load"] = {
["use_never"] = true,
["class"] = {
["single"] = "MAGE",
["multi"] = {
["MAGE"] = true,
},
},
["use_class"] = true,
["race"] = {
},
["use_faction"] = true,
["zoneIds"] = "",
["use_namerealm"] = false,
["namerealm"] = "山下智久",
["talent"] = {
["multi"] = {
},
},
["use_vehicle"] = false,
["spec"] = {
["multi"] = {
},
},
["use_spellknown"] = true,
["use_alive"] = true,
["faction"] = {
["single"] = "Horde",
},
["use_exact_spellknown"] = false,
["use_combat"] = false,
["spellknown"] = 3566,
["size"] = {
["multi"] = {
},
},
},
["progressSource"] = {
-1,
"",
},
["useAdjustededMax"] = false,
["parent"] = "法师传送&传送门",
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["conditions"] = {
},
["authorOptions"] = {
},
["customText"] = "function (...)\n    return GetItemCount(17032)\nend",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "SpQEhDZI807",
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env\nif not _G[e.id..\"Button\"] then\n    local region = WeakAuras.GetRegion(e.id)\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")\n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"LeftButtonDown\", \"RightButtonDown\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region)\nend\n\nlocal btn = _G[e.id..\"Button\"]\nbtn:SetAttribute(\"macrotext1\",\"/cast 传送门：雷霆崖\")\nbtn:SetAttribute(\"macrotext2\",\"/cast 传送：雷霆崖\")\n\nbtn:SetScript(\"OnEnter\", function(self)\n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")\n        GameTooltip:SetText(\"|cffffffff左键：|r传送门：雷霆崖|cff04f192（\"..GetItemCount(17032)..\"）|r\\n|cffffffff右键：|r传送：雷霆崖|cff04f192（\"..GetItemCount(17031)..\"）|r\", 0, 1, 0, 1, 1)\n        WeakAuras.ScanEvents(\"DOOR_BTN_SHOW\")\nend)\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide()\n        WeakAuras.ScanEvents(\"DOOR_BTN_HIDE\")\nend)",
},
},
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["anchorFrameParent"] = false,
["cooldownEdge"] = false,
["zoom"] = 0,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "雷霆崖",
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["width"] = 30,
["internalVersion"] = 90,
["config"] = {
},
["inverse"] = false,
["color"] = {
1,
1,
1,
1,
},
["displayIcon"] = 135765,
["cooldown"] = false,
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
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
["easeType"] = "none",
},
},
},
["急速冷却（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["realSpellName"] = "急速冷却",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 12472,
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
["version"] = 5,
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
["single"] = "MAGE",
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
["spellknown"] = 12472,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "法师 核心分组",
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
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "doyTTBXx)aG",
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
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "急速冷却（可点击施法）",
["zoom"] = 0.3,
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
["do_custom"] = true,
["custom"] = "local e = aura_env \nlocal spellName = \"急速冷却\"\nlocal spellColor = \"387add\"\nlocal castCommand = \"/cast \" .. spellName\n\nif not e.btn then \n    local region = WeakAuras.GetRegion(e.id) \n    \n    -- 将父级框架改为 UIParent 避免安全模板污染\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", UIParent, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonDown\", \"RightButtonDown\", \"MiddleButtonDown\")\n    \n    -- 统一使用 macro 属性，并写在初始化内\n    e.btn:SetAttribute(\"type1\", \"macro\")\n    e.btn:SetAttribute(\"macrotext1\", castCommand)\n    \n    e.btn:SetAllPoints(region) \n    e.btn:SetFrameStrata(\"TOOLTIP\")\n    e.btn:SetFrameLevel(9999)\nend \n\nlocal btn = e.btn \n\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")\n        GameTooltip:SetText(\"|cff\" .. spellColor .. spellName .. \"|r\")\n        GameTooltip:Show()\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide() \nend)\n\nbtn:Show()",
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
["气定神闲（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["useName"] = true,
["auranames"] = {
"12043",
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
["realSpellName"] = "气定神闲",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 12043,
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
["version"] = 5,
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
["multi"] = {
},
},
["class"] = {
["single"] = "MAGE",
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
["spellknown"] = 12043,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "法师 核心分组",
["cooldown"] = true,
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
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "sX41UxrG9Ac",
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
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "气定神闲（可点击施法）",
["zoom"] = 0.3,
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
["do_custom"] = true,
["custom"] = "local e = aura_env \nlocal spellName = \"气定神闲\"\nlocal spellColor = \"606770\"\nlocal castCommand = \"/cast \" .. spellName\n\nif not e.btn then \n    local region = WeakAuras.GetRegion(e.id) \n    \n    -- 将父级框架改为 UIParent 避免安全模板污染\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", UIParent, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonDown\", \"RightButtonDown\", \"MiddleButtonDown\")\n    \n    -- 统一使用 macro 属性，并写在初始化内\n    e.btn:SetAttribute(\"type1\", \"macro\")\n    e.btn:SetAttribute(\"macrotext1\", castCommand)\n    \n    e.btn:SetAllPoints(region) \n    e.btn:SetFrameStrata(\"TOOLTIP\")\n    e.btn:SetFrameLevel(9999)\nend \n\nlocal btn = e.btn \n\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")\n        GameTooltip:SetText(\"|cff\" .. spellColor .. spellName .. \"|r\")\n        GameTooltip:Show()\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide() \nend)\n\nbtn:Show()",
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
["铁炉堡"] = {
["iconSource"] = 0,
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
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "custom",
["custom_type"] = "event",
["event"] = "Health",
["unit"] = "player",
["custom_hide"] = "custom",
["subeventPrefix"] = "SPELL",
["events"] = "DOOR_BTN_SHOW,DOOR_BTN_HIDE",
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["custom"] = "function(event)\n    if event == \"DOOR_BTN_SHOW\" then\n        return true\n    end\nend",
["names"] = {
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
["custom"] = "function(event)\n    if event == \"DOOR_BTN_HIDE\" then\n        return true\n    end\nend",
},
},
["disjunctive"] = "any",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
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
["duration_type"] = "seconds",
["type"] = "none",
["easeStrength"] = 3,
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
["text_text"] = "铁炉",
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
1,
1,
1,
1,
},
["text_font"] = "Friz Quadrata TT",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["anchor_point"] = "INNER_BOTTOM",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_anchorYOffset"] = 0,
},
{
["border_size"] = 1,
["border_offset"] = 0,
["border_color"] = {
0.250980406999588,
0.7803922295570374,
0.9215686917304993,
1,
},
["border_visible"] = true,
["border_edge"] = "1 Pixel",
["type"] = "subborder",
},
},
["height"] = 30,
["internalVersion"] = 90,
["load"] = {
["use_never"] = true,
["class"] = {
["single"] = "MAGE",
["multi"] = {
["MAGE"] = true,
},
},
["use_class"] = true,
["race"] = {
},
["use_faction"] = true,
["zoneIds"] = "",
["use_namerealm"] = false,
["namerealm"] = "山下智久",
["talent"] = {
["multi"] = {
},
},
["use_vehicle"] = false,
["spec"] = {
["multi"] = {
},
},
["use_spellknown"] = true,
["use_alive"] = true,
["faction"] = {
["single"] = "Alliance",
},
["use_exact_spellknown"] = false,
["use_combat"] = false,
["spellknown"] = 3562,
["size"] = {
["multi"] = {
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["xOffset"] = 0,
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["conditions"] = {
},
["parent"] = "法师传送&传送门",
["progressSource"] = {
-1,
"",
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "xYkjMr0USk2",
["url"] = "",
["width"] = 30,
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["customText"] = "function (...)\n    return GetItemCount(17032)\nend",
["zoom"] = 0,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "铁炉堡",
["alpha"] = 1,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["authorOptions"] = {
},
["config"] = {
},
["inverse"] = false,
["actions"] = {
["start"] = {
},
["finish"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env\nif not _G[e.id..\"Button\"] then\n    local region = WeakAuras.GetRegion(e.id)\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")\n    e.btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\", \"LeftButtonDown\", \"RightButtonDown\")\n    e.btn:SetAttribute(\"type1\",\"macro\")\n    e.btn:SetAttribute(\"type2\",\"macro\")\n    e.btn:SetAllPoints(region)\nend\n\nlocal btn = _G[e.id..\"Button\"]\nbtn:SetAttribute(\"macrotext1\",\"/cast 传送门：铁炉堡\")\nbtn:SetAttribute(\"macrotext2\",\"/cast 传送：铁炉堡\")\n\nbtn:SetScript(\"OnEnter\", function(self)\n        GameTooltip:SetOwner(self, \"ANCHOR_LEFT\")\n        GameTooltip:SetText(\"|cffffffff左键：|r传送门：铁炉堡|cff04f192（\"..GetItemCount(17032)..\"）|r\\n|cffffffff右键：|r传送：铁炉堡|cff04f192（\"..GetItemCount(17031)..\"）|r\", 0, 1, 0, 1, 1)\n        WeakAuras.ScanEvents(\"DOOR_BTN_SHOW\")\nend)\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide()\n        WeakAuras.ScanEvents(\"DOOR_BTN_HIDE\")\nend)",
},
},
["displayIcon"] = 135757,
["cooldown"] = false,
["preferToUpdate"] = true,
},
["法术反制（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["type"] = "aura2",
["auranames"] = {
"2139",
},
["event"] = "Health",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["unit"] = "target",
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
["unit"] = "player",
["use_showgcd"] = false,
["debuffType"] = "HELPFUL",
["type"] = "spell",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Spell)",
["names"] = {
},
["realSpellName"] = "法术反制",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 2139,
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
["version"] = 5,
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
["multi"] = {
},
},
["class"] = {
["single"] = "MAGE",
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
["spellknown"] = 2139,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "法师 核心分组",
["cooldown"] = true,
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
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "R10FQk7abTD",
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
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "法术反制（可点击施法）",
["zoom"] = 0.3,
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
["do_custom"] = true,
["custom"] = "local e = aura_env \nlocal spellName = \"法术反制\"\nlocal spellColor = \"45d8ff\"\nlocal castCommand = \"/stopcasting\\n/cast \" .. spellName\n\nif not e.btn then \n    local region = WeakAuras.GetRegion(e.id) \n    \n    -- 将父级框架改为 UIParent 避免安全模板污染\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", UIParent, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonDown\")\n    \n    -- 统一使用 macro 属性，并写在初始化内\n    e.btn:SetAttribute(\"type1\", \"macro\")\n    e.btn:SetAttribute(\"macrotext1\", castCommand)\n    \n    e.btn:SetAllPoints(region) \n    e.btn:SetFrameStrata(\"TOOLTIP\")\n    e.btn:SetFrameLevel(9999)\nend \n\nlocal btn = e.btn \n\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\"|cff\" .. spellColor .. \"中断动作并\" .. spellName .. \"|r\")\n        GameTooltip:Show()\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide() \nend)\n\nbtn:Show()",
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
["法师护甲（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["text"] = "Armors",
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
["name"] = "Armors",
["width"] = 1,
["useCollapse"] = false,
["noMerge"] = false,
["collapse"] = false,
["type"] = "group",
["limitType"] = "none",
["groupType"] = "simple",
["key"] = "armors",
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
["do_custom"] = true,
["custom"] = "local e = aura_env \n\nif not e.btn then \n    local region = WeakAuras.GetRegion(e.id) \n    \n    -- 将父级框架改为 UIParent 避免安全模板污染\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", UIParent, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonDown\", \"RightButtonDown\")\n    \n    -- 统一改回使用 macro 属性，并写在初始化内\n    -- 左键：魔甲术\n    e.btn:SetAttribute(\"type1\", \"macro\")\n    e.btn:SetAttribute(\"macrotext1\", \"/cast 魔甲术\")\n    \n    -- 右键：冰甲术\n    e.btn:SetAttribute(\"type2\", \"macro\")\n    e.btn:SetAttribute(\"macrotext2\", \"/cast 冰甲术\")\n    \n    e.btn:SetAllPoints(region) \n    e.btn:SetFrameStrata(\"TOOLTIP\")\n    e.btn:SetFrameLevel(9999)\nend \n\nlocal btn = e.btn \n\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff左键：|r|cff45d8ff魔甲术|r\\n\"..\n            \"|cffffffff右键：|r|cff387add冰甲术|r\",\n            0, 1, 0, 1, 1\n        )\n        GameTooltip:Show()\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide() \nend)\n\nbtn:Show()",
},
},
["triggers"] = {
{
["trigger"] = {
["itemName"] = 6265,
["use_count"] = false,
["auranames"] = {
"6117",
"7302",
},
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["names"] = {
},
["unevent"] = "auto",
["spellIds"] = {
},
["matchesShowOn"] = "showAlways",
["type"] = "aura2",
["use_itemName"] = true,
["unit"] = "player",
["use_unit"] = true,
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.armors.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
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
},
["height"] = 32,
["load"] = {
["use_class"] = true,
["use_spellknown"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "MAGE",
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["spellknown"] = 168,
["size"] = {
["multi"] = {
},
},
},
["useAdjustededMax"] = false,
["width"] = 32,
["source"] = "import",
["selfPoint"] = "CENTER",
["progressSource"] = {
-1,
"",
},
["cooldown"] = true,
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["cooldownEdge"] = true,
["color"] = {
1,
1,
1,
1,
},
["config"] = {
["maintenance"] = {
["armors"] = {
["behavior"] = 2,
},
},
},
["xOffset"] = 0,
["anchorFrameParent"] = false,
["frameStrata"] = 1,
["alpha"] = 1,
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "法师护甲（可点击施法）",
["semver"] = "2.0.3",
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["uid"] = "6EkuOnVhsuj",
["inverse"] = false,
["parent"] = "法师 底部分组",
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
["icon"] = true,
},
["法师 资源条"] = {
["controlledChildren"] = {
"法师 法力条",
"5秒回蓝（法师）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["parent"] = "法师（中心分组）",
["preferToUpdate"] = true,
["groupIcon"] = "interface/icons/classicon_mage.blp",
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
["uid"] = "DPuUSu0oaH6",
["authorOptions"] = {
},
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "法师 资源条",
["frameStrata"] = 1,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["selfPoint"] = "CENTER",
["borderInset"] = 1,
["config"] = {
},
["xOffset"] = 0,
["conditions"] = {
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["yOffset"] = -26,
},
["燃烧（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["useName"] = true,
["auranames"] = {
"11129",
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
["realSpellName"] = "燃烧",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 11129,
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
["version"] = 5,
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
["glow"] = false,
["glowThickness"] = 1,
["glowScale"] = 1,
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
["text_anchorYOffset"] = -4,
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
["anchor_point"] = "OUTER_TOP",
["text_fontSize"] = 20,
["anchorXOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
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
[54] = true,
},
},
["class"] = {
["single"] = "MAGE",
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
["spellknown"] = 11129,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "法师 核心分组",
["cooldown"] = true,
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
["value"] = false,
["property"] = "desaturate",
},
{
["value"] = false,
["property"] = "inverse",
},
{
["value"] = true,
["property"] = "cooldownEdge",
},
},
},
},
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "B3rDPDm8aCV",
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
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "燃烧（可点击施法）",
["zoom"] = 0.3,
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
["do_custom"] = true,
["custom"] = "local e = aura_env \nlocal spellName = \"燃烧\"\nlocal spellColor = \"BB7E13\"\nlocal castCommand = \"/cast \" .. spellName\n\nif not e.btn then \n    local region = WeakAuras.GetRegion(e.id) \n    \n    -- 将父级框架改为 UIParent 避免安全模板污染\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", UIParent, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonDown\", \"RightButtonDown\", \"MiddleButtonDown\")\n    \n    -- 统一使用 macro 属性，并写在初始化内\n    e.btn:SetAttribute(\"type1\", \"macro\")\n    e.btn:SetAttribute(\"macrotext1\", castCommand)\n    \n    e.btn:SetAllPoints(region) \n    e.btn:SetFrameStrata(\"TOOLTIP\")\n    e.btn:SetFrameLevel(9999)\nend \n\nlocal btn = e.btn \n\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")\n        GameTooltip:SetText(\"|cff\" .. spellColor .. spellName .. \"|r\")\n        GameTooltip:Show()\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide() \nend)\n\nbtn:Show()",
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
["魔法面包（可点击施法）"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
["parent"] = "法师 底部分组",
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
["useName"] = true,
["auranames"] = {
"进食",
},
["event"] = "Health",
["unit"] = "player",
["names"] = {
},
["spellIds"] = {
},
["useExactSpellId"] = false,
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 22895,
["use_count"] = false,
["auranames"] = {
"6117",
"7302",
},
["duration"] = "1",
["use_unit"] = true,
["unitExists"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_exact_itemName"] = true,
["unit"] = "player",
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["event"] = "Item Count",
["useName"] = true,
["spellIds"] = {
},
["count"] = "1",
["matchesShowOn"] = "showAlways",
["unevent"] = "auto",
["names"] = {
},
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    if t[4] then -- If in Rested Area\n        return false\n    end\n\n    local behavior = aura_env.config.maintenance.armors.behavior\n\n    if behavior == 1 then -- Show if Applied\n        return t[1]\n    elseif behavior == 2 then -- Show if Missing\n        return t[2] or t[3]\n    else -- Always Show\n        return true\n    end\nend",
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
["desaturate"] = false,
["ignoreWagoUpdate"] = true,
["version"] = 5,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
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
["type"] = "subglow",
["glowThickness"] = 1,
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glowScale"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%2.s",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorXOffset"] = 0,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_format"] = "timed",
["text_text_format_p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 6,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_text_format_p_time_format"] = 0,
["text_anchorYOffset"] = -4,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_shadowYOffset"] = 0,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 12,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 32,
["load"] = {
["use_class"] = true,
["use_spellknown"] = false,
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
["single"] = "MAGE",
["multi"] = {
},
},
["spellknown"] = 168,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["keepAspectRatio"] = true,
["source"] = "import",
["actions"] = {
["start"] = {
},
["init"] = {
["do_custom"] = true,
["custom"] = "local e = aura_env \n\nif not e.btn then \n    local region = WeakAuras.GetRegion(e.id) \n    \n    -- 将父级框架改为 UIParent 避免安全模板污染\n    e.btn = CreateFrame(\"Button\", e.id..\"Button\", UIParent, \"SecureActionButtonTemplate\") \n    e.btn:RegisterForClicks(\"LeftButtonDown\", \"RightButtonDown\")\n    \n    -- 统一改回使用 macro 属性，并写在初始化内\n    -- 左键：使用物品\n    e.btn:SetAttribute(\"type1\", \"macro\")\n    e.btn:SetAttribute(\"macrotext1\", \"/use 魔法肉桂面包\")\n    \n    -- 右键：施放技能\n    e.btn:SetAttribute(\"type2\", \"macro\")\n    e.btn:SetAttribute(\"macrotext2\", \"/cast 造食术\")\n    \n    e.btn:SetAllPoints(region) \n    e.btn:SetFrameStrata(\"TOOLTIP\")\n    e.btn:SetFrameLevel(9999)\nend \n\nlocal btn = e.btn \n\nbtn:SetScript(\"OnEnter\", function(self)               \n        GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\") \n        GameTooltip:SetText(\n            \"|cffffffff左键：|r|cff387add使用 魔法肉桂面包|r\\n\"..\n            \"|cffffffff右键：|r|cff45d8ff施放 造食术|r\",\n            0, 1, 0, 1, 1\n        )\n        GameTooltip:Show()\nend)\n\nbtn:SetScript(\"OnLeave\", function(self) \n        GameTooltip:Hide() \nend)\n\nbtn:Show()",
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
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["adjustedMax"] = "",
["uid"] = "zQ5EQcXdD)5",
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
["text"] = "Armors",
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
["name"] = "Armors",
["key"] = "armors",
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
["anchorFrameType"] = "SCREEN",
["anchorFrameParent"] = false,
["useCooldownModRate"] = true,
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "魔法面包（可点击施法）",
["zoom"] = 0.3,
["frameStrata"] = 1,
["width"] = 32,
["xOffset"] = 0,
["config"] = {
["maintenance"] = {
["armors"] = {
["behavior"] = 2,
},
},
},
["inverse"] = false,
["selfPoint"] = "CENTER",
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "value",
["value"] = "0",
["op"] = "==",
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
["color"] = {
1,
1,
1,
1,
},
},
["法师 动态分组 左"] = {
["grow"] = "GRID",
["controlledChildren"] = {
},
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "tRi9estlC",
["authorOptions"] = {
},
["preferToUpdate"] = true,
["groupIcon"] = "interface/icons/classicon_mage.blp",
["sortHybridTable"] = {
["冰锥术"] = false,
},
["regionType"] = "dynamicgroup",
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
["radius"] = 200,
["stagger"] = 0,
["useLimit"] = true,
["align"] = "CENTER",
["rowSpace"] = 5,
["anchorPoint"] = "CENTER",
["desc"] = "WA制作：露露緹婭@Bilibili，抖音：露露缇娅。\n\n转载请保留出处，请勿修改或翻配后二次发布/无授权整合，商用禁止。",
["rotation"] = 0,
["selfPoint"] = "BOTTOMLEFT",
["version"] = 3,
["xOffset"] = -149,
["yOffset"] = 24,
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
["arcLength"] = 360,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["borderColor"] = {
0,
0,
0,
1,
},
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
["uid"] = "9Mfgg6hSbxx",
["borderOffset"] = 4,
["semver"] = "1.1.0",
["tocversion"] = 100200,
["id"] = "法师 动态分组 左",
["limit"] = 6,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["parent"] = "法师（中心分组）",
["borderInset"] = 1,
["gridType"] = "RU",
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
},
["information"] = {
["forceEvents"] = true,
["showNilIsFalse"] = true,
},
["internalVersion"] = 90,
},
["法师"] = {
["controlledChildren"] = {
"法师传送&传送门",
"法师（BUFF）",
"法师（中心分组）",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 0,
["yOffset"] = 50,
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
["uid"] = "lIyr(ZkQcyb",
["id"] = "法师",
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
["groupIcon"] = "classicon-mage",
},
["火焰冲击"] = {
["iconSource"] = -1,
["wagoID"] = "hDQ_JPvn0",
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
["realSpellName"] = "火焰冲击",
["use_spellName"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["use_track"] = true,
["spellName"] = 2136,
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
["ignoreWagoUpdate"] = true,
["version"] = 5,
["subRegions"] = {
{
["type"] = "subbackground",
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
["single"] = "MAGE",
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
["spellknown"] = 2136,
["size"] = {
["multi"] = {
},
},
},
["alpha"] = 1,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["parent"] = "法师 核心分组",
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
["url"] = "https://space.bilibili.com/455259",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["uid"] = "Jt6vhEyPO2A",
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
["semver"] = "2.0.3",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 30400,
["id"] = "火焰冲击",
["zoom"] = 0.3,
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
["do_custom"] = false,
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
["气定神闲"] = {
["iconSource"] = -1,
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
["subeventSuffix"] = "_CAST_START",
["ownOnly"] = true,
["event"] = "Health",
["names"] = {
},
["auranames"] = {
"12043",
},
["useName"] = true,
["spellIds"] = {
},
["auraspellids"] = {
"12043",
},
["subeventPrefix"] = "SPELL",
["useExactSpellId"] = false,
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
["text_text"] = "气定",
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
0.250980406999588,
0.7803922295570374,
0.9215686917304993,
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
["use_class"] = true,
["use_spellknown"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
[10] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "MAGE",
["multi"] = {
["PALADIN"] = true,
},
},
["use_itemequiped"] = false,
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
["cooldownEdge"] = false,
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
["sound_type"] = "Play",
["sound_path"] = "Interface\\AddOns\\Rurutia\\【露露】龙神の剣を喰らえ！.ogg",
["sound"] = "Interface\\Addons\\SharedMedia_MyMedia\\sound\\!Wind-OnePlusLight.ogg",
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
["xOffset"] = 0,
["config"] = {
},
["selfPoint"] = "CENTER",
["anchorFrameParent"] = false,
["alpha"] = 1,
["desc"] = "",
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["tocversion"] = 20501,
["id"] = "气定神闲",
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["width"] = 30,
["icon"] = true,
["uid"] = "Kg1v1bSD3yL",
["inverse"] = false,
["adjustedMax"] = "",
["displayIcon"] = "",
["cooldown"] = true,
["parent"] = "法师（BUFF）",
},
},
}
