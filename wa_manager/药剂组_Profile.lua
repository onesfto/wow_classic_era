
WeakAurasSaved = {
["editor_tab_spaces"] = 4,
["login_squelch_time"] = 10,
["PULL(Need DBM BW ERT)PULL"] = 5,
["dbVersion"] = 90,
["标记目标 Mark TargetSet"] = false,
["displays"] = {
["特效治疗药水"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
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
["itemName"] = 13446,
["type"] = "item",
["use_remaining"] = false,
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["use_unit"] = true,
["use_itemName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["duration"] = "1",
["unit"] = "player",
["event"] = "Cooldown Progress (Item)",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 13446,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["use_exact_itemName"] = false,
["names"] = {
},
["spellIds"] = {
},
["count"] = "1",
["event"] = "Item Count",
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
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
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "",
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
["glowDuration"] = 1,
["glowType"] = "Pixel",
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0.615686297416687,
0.615686297416687,
0.615686297416687,
1,
},
["glowLength"] = 10,
["type"] = "subglow",
["glowScale"] = 1,
["useGlowColor"] = true,
["glowXOffset"] = 0,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["adjustedMax"] = "",
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
["HUNTER"] = true,
["WARRIOR"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["ROGUE"] = true,
["PALADIN"] = true,
},
},
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["use_ignoreNameRealm"] = false,
["use_item_bonusid_equipped"] = false,
["itemtypeequipped"] = {
},
},
["internalVersion"] = 90,
["useAdjustededMax"] = false,
["url"] = "",
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["xOffset"] = 0,
["parent"] = "生命药剂",
["selfPoint"] = "CENTER",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "SJ1eQoUl675",
["color"] = {
1,
1,
1,
1,
},
["width"] = 36,
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30404,
["id"] = "特效治疗药水",
["useCooldownModRate"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["desaturate"] = false,
["config"] = {
},
["inverse"] = true,
["keepAspectRatio"] = false,
["conditions"] = {
},
["cooldown"] = true,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
},
["强效火力药剂"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"26276",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["itemName"] = 21546,
["use_unit"] = true,
["unevent"] = "auto",
["spellIds"] = {
},
["names"] = {
},
["event"] = "Item Count",
["count"] = "1",
["unit"] = "player",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
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
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
},
},
["height"] = 32,
["useCooldownModRate"] = true,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 44,
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_talent"] = true,
["use_class"] = false,
["use_zone"] = false,
["zoneIds"] = "",
["use_spellknown"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
["WARLOCK"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
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
["parent"] = "法系药剂",
["selfPoint"] = "CENTER",
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["icon"] = true,
["internalVersion"] = 90,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["cooldownEdge"] = false,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "强效火力药剂",
["xOffset"] = 0,
["frameStrata"] = 1,
["width"] = 32,
["preferToUpdate"] = false,
["uid"] = "lY5nq6XIqWE",
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
["customText"] = "\n\n",
},
["魔血药水"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["auranames"] = {
"24363",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["event"] = "Item Count",
["itemName"] = 20007,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["count"] = "1",
["unit"] = "player",
["use_itemName"] = true,
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["count_operator"] = ">=",
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
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_format"] = 0,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
},
["height"] = 32,
["useCooldownModRate"] = true,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 81,
["multi"] = {
[81] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["PRIEST"] = true,
},
},
["use_spellknown"] = false,
["zoneIds"] = "",
},
["adjustedMin"] = "",
["useAdjustededMax"] = false,
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
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["url"] = "",
["preferToUpdate"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "HJgQu6CSb(r",
["xOffset"] = 0,
["width"] = 32,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "魔血药水",
["color"] = {
1,
1,
1,
1,
},
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["useTooltip"] = false,
["config"] = {
},
["inverse"] = false,
["parent"] = "法系药剂",
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
},
["超强法力药水"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["parent"] = "法力药剂",
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["triggers"] = {
{
["trigger"] = {
["itemName"] = 13443,
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["subeventPrefix"] = "SPELL",
["use_unit"] = true,
["spellIds"] = {
},
["use_itemName"] = true,
["unevent"] = "auto",
["duration"] = "1",
["event"] = "Cooldown Progress (Item)",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 13443,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["use_exact_itemName"] = true,
["unevent"] = "auto",
["spellIds"] = {
},
["count"] = "1",
["event"] = "Item Count",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["names"] = {
},
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = false,
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
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "by 露露緹婭@Bilibili。\n\n转载请保留出处。",
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
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
["type"] = "subglow",
["glowScale"] = 1,
["useGlowColor"] = false,
["glowXOffset"] = 0,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["desaturate"] = false,
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
["HUNTER"] = true,
["WARRIOR"] = true,
["PALADIN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["SHAMAN"] = true,
["ROGUE"] = true,
},
},
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["use_ignoreNameRealm"] = false,
["use_item_bonusid_equipped"] = false,
["itemtypeequipped"] = {
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
["cooldownEdge"] = true,
["useTooltip"] = false,
["selfPoint"] = "CENTER",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "PJG4suLn1In",
["authorOptions"] = {
},
["width"] = 36,
["alpha"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["zoom"] = 0,
["auto"] = true,
["tocversion"] = 30404,
["id"] = "超强法力药水",
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["icon"] = true,
["config"] = {
},
["inverse"] = true,
["preferToUpdate"] = true,
["conditions"] = {
},
["cooldown"] = true,
["progressSource"] = {
-1,
"",
},
},
["特效治疗石"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
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
["use_remaining"] = false,
["type"] = "item",
["itemName"] = 9421,
["subeventSuffix"] = "_CAST_START",
["genericShowOn"] = "showOnCooldown",
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Item)",
["names"] = {
},
["duration"] = "1",
["unevent"] = "auto",
["spellIds"] = {
},
["use_itemName"] = true,
["use_unit"] = true,
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 9421,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["use_exact_itemName"] = false,
["subeventPrefix"] = "SPELL",
["use_unit"] = true,
["spellIds"] = {
},
["unit"] = "player",
["use_itemName"] = true,
["count"] = "1",
["unevent"] = "auto",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = false,
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
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "",
["version"] = 1,
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
["glowYOffset"] = 0,
["glowColor"] = {
0.615686297416687,
0.615686297416687,
0.615686297416687,
1,
},
["glowThickness"] = 1,
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = true,
["glowScale"] = 1,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -4,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["authorOptions"] = {
},
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
["HUNTER"] = true,
["WARRIOR"] = true,
["ROGUE"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["SHAMAN"] = true,
},
},
["itemtypeequipped"] = {
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["useAdjustededMax"] = false,
["progressSource"] = {
-1,
"",
},
["source"] = "import",
["cooldown"] = true,
["xOffset"] = 0,
["desaturate"] = false,
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["selfPoint"] = "CENTER",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "特效治疗石",
["frameStrata"] = 1,
["alpha"] = 1,
["width"] = 36,
["parent"] = "生命药剂",
["uid"] = ")8QBueVrRAq",
["inverse"] = true,
["useTooltip"] = false,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["cooldownEdge"] = true,
},
["厚甲蝎盐"] = {
["iconSource"] = -1,
["parent"] = "近战药剂",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"10669",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["itemName"] = 8412,
["use_unit"] = true,
["names"] = {
},
["count"] = "1",
["event"] = "Item Count",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["count_operator"] = ">=",
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
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_text_format_1.p_time_precision"] = 1,
["text_justify"] = "CENTER",
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_text_format_p_time_format"] = 0,
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
["text_text_format_p_time_legacy_floor"] = false,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_format"] = "timed",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_precision"] = 1,
},
},
["height"] = 32,
["useCooldownModRate"] = true,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["zoneIds"] = "",
["use_spellknown"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["ROGUE"] = true,
["WARRIOR"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["url"] = "",
["useAdjustededMax"] = false,
["customText"] = "\n\n",
["color"] = {
1,
1,
1,
1,
},
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["useTooltip"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "厚甲蝎盐",
["selfPoint"] = "CENTER",
["alpha"] = 1,
["width"] = 32,
["progressSource"] = {
-1,
"",
},
["uid"] = "IaWBXqjykcW",
["inverse"] = false,
["authorOptions"] = {
},
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
},
["巨人药剂"] = {
["iconSource"] = -1,
["xOffset"] = 0,
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"11405",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["itemName"] = 9206,
["names"] = {
},
["count"] = "1",
["spellIds"] = {
},
["use_itemName"] = true,
["unit"] = "player",
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_format"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["anchorYOffset"] = 0,
},
},
["height"] = 32,
["useCooldownModRate"] = true,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["ROGUE"] = true,
["WARRIOR"] = true,
},
},
["use_spellknown"] = false,
["zoneIds"] = "",
},
["internalVersion"] = 90,
["useAdjustededMax"] = false,
["color"] = {
1,
1,
1,
1,
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["keepAspectRatio"] = false,
["preferToUpdate"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "r)3BBxlZZty",
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
["width"] = 32,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "巨人药剂",
["customText"] = "\n\n",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["parent"] = "近战药剂",
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
["value"] = 1,
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
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["url"] = "",
},
["奥特兰克魔法点心"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["parent"] = "吃喝&其他",
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
["itemName"] = 13724,
["auranames"] = {
"喝水",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Item)",
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["duration"] = "1",
["unit"] = "player",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["useName"] = false,
["useExactSpellId"] = true,
["auraspellids"] = {
"26260",
},
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 19301,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["use_exact_itemName"] = true,
["subeventPrefix"] = "SPELL",
["count"] = "1",
["spellIds"] = {
},
["use_unit"] = true,
["event"] = "Item Count",
["unevent"] = "auto",
["names"] = {
},
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desc"] = "",
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
["glowDuration"] = 1,
["glowType"] = "Pixel",
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowLength"] = 10,
["type"] = "subglow",
["glowScale"] = 1,
["useGlowColor"] = false,
["glowXOffset"] = 0,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 35,
["xOffset"] = 0,
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
["HUNTER"] = true,
["WARRIOR"] = true,
["PALADIN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["SHAMAN"] = true,
["ROGUE"] = true,
},
},
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["use_ignoreNameRealm"] = false,
["use_item_bonusid_equipped"] = false,
["itemtypeequipped"] = {
},
},
["internalVersion"] = 90,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["authorOptions"] = {
},
["progressSource"] = {
-1,
"",
},
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "uSsRD5jgKYy",
["desaturate"] = false,
["width"] = 35,
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30404,
["id"] = "奥特兰克魔法点心",
["useCooldownModRate"] = true,
["alpha"] = 1,
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
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
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
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
},
["超级能量合剂"] = {
["iconSource"] = -1,
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["names"] = {
},
["spellIds"] = {
},
["unit"] = "player",
["auranames"] = {
"17628",
},
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["spellIds"] = {
},
["event"] = "Item Count",
["count"] = "1",
["itemName"] = 13512,
["subeventSuffix"] = "_CAST_START",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
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
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_format"] = 0,
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_format"] = "timed",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_mod_rate"] = true,
},
},
["height"] = 32,
["useCooldownModRate"] = true,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["zoneIds"] = "",
["use_spellknown"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
["WARLOCK"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["adjustedMax"] = "",
["useAdjustededMax"] = false,
["authorOptions"] = {
},
["progressSource"] = {
-1,
"",
},
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["icon"] = true,
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["internalVersion"] = 90,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "超级能量合剂",
["selfPoint"] = "CENTER",
["frameStrata"] = 1,
["width"] = 32,
["color"] = {
1,
1,
1,
1,
},
["uid"] = "LXNGfdNVVSh",
["inverse"] = false,
["parent"] = "法系药剂",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["customText"] = "\n\n",
},
["强效奥术防护药水"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["authorOptions"] = {
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = true,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["itemName"] = 13461,
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_unit"] = true,
["names"] = {
},
["spellIds"] = {
},
["event"] = "Cooldown Progress (Item)",
["unevent"] = "auto",
["duration"] = "1",
["use_itemName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 13461,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["use_exact_itemName"] = true,
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["use_itemName"] = true,
["unit"] = "player",
["count"] = "1",
["use_unit"] = true,
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = false,
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
["glow"] = false,
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
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowScale"] = 1,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["xOffset"] = 0,
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
["HUNTER"] = true,
["WARRIOR"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["ROGUE"] = true,
["PALADIN"] = true,
},
},
["itemtypeequipped"] = {
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
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
["preferToUpdate"] = true,
["source"] = "import",
["cooldown"] = true,
["parent"] = "生命药剂",
["url"] = "https://afdian.com/a/Rurutia",
["desc"] = "by 露露緹婭@Bilibili。\n\n转载请保留出处。",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "强效奥术防护药水",
["alpha"] = 1,
["useCooldownModRate"] = true,
["width"] = 36,
["progressSource"] = {
-1,
"",
},
["uid"] = "XS5EMFGEErI",
["inverse"] = true,
["selfPoint"] = "CENTER",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["useTooltip"] = false,
},
["厚符文布绷带"] = {
["iconSource"] = 1,
["parent"] = "生命药剂",
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["triggers"] = {
{
["trigger"] = {
["type"] = "aura2",
["auraspellids"] = {
"11196",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["names"] = {
},
["useExactSpellId"] = true,
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HARMFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["itemName"] = 14530,
["unevent"] = "auto",
["count"] = "1",
["spellIds"] = {
},
["unit"] = "player",
["use_itemName"] = true,
["use_unit"] = true,
["names"] = {
},
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
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
1,
0,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -4,
["text_wordWrap"] = "WordWrap",
["text_text_format_3.s_format"] = "none",
["text_visible"] = true,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_fontType"] = "OUTLINE",
},
},
["height"] = 36,
["load"] = {
["use_size"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["pvp"] = true,
["party"] = true,
["twenty"] = true,
["none"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["DRUID"] = true,
["WARRIOR"] = true,
["ROGUE"] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["zoneIds"] = "",
},
["preferToUpdate"] = false,
["useAdjustededMax"] = false,
["useCooldownModRate"] = true,
["xOffset"] = 0,
["icon"] = true,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = 133682,
["useTooltip"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["frameStrata"] = 1,
["uid"] = "HycydEJ9Ila",
["color"] = {
1,
1,
1,
1,
},
["anchorFrameType"] = "SCREEN",
["cooldownTextDisabled"] = false,
["semver"] = "1.0.7",
["zoom"] = 0.3,
["auto"] = false,
["tocversion"] = 11508,
["id"] = "厚符文布绷带",
["progressSource"] = {
-1,
"",
},
["alpha"] = 1,
["width"] = 36,
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
["config"] = {
},
["inverse"] = true,
["authorOptions"] = {
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
},
},
},
["cooldown"] = true,
["url"] = "",
},
["强效怒气药水"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
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
["type"] = "item",
["itemName"] = 13442,
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["event"] = "Cooldown Progress (Item)",
["unevent"] = "auto",
["duration"] = "1",
["use_itemName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 13442,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["use_exact_itemName"] = true,
["unevent"] = "auto",
["names"] = {
},
["spellIds"] = {
},
["use_itemName"] = true,
["use_unit"] = true,
["count"] = "1",
["subeventPrefix"] = "SPELL",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
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
["glow"] = false,
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
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowScale"] = 1,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["desc"] = "",
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
["HUNTER"] = true,
["WARRIOR"] = true,
["PALADIN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["SHAMAN"] = true,
["ROGUE"] = true,
},
},
["itemtypeequipped"] = {
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["useAdjustededMax"] = false,
["xOffset"] = 0,
["source"] = "import",
["cooldown"] = true,
["authorOptions"] = {
},
["selfPoint"] = "CENTER",
["parent"] = "战斗药剂",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["internalVersion"] = 90,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "强效怒气药水",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 36,
["keepAspectRatio"] = false,
["uid"] = "kswYY46LNRd",
["inverse"] = true,
["preferToUpdate"] = true,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["cooldownEdge"] = true,
},
["魔法晶水"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["parent"] = "吃喝&其他",
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
["itemName"] = 13724,
["auranames"] = {
"喝水",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["unevent"] = "auto",
["event"] = "Cooldown Progress (Item)",
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["duration"] = "1",
["unit"] = "player",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["useName"] = false,
["useExactSpellId"] = true,
["auraspellids"] = {
"22734",
},
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 8079,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["use_exact_itemName"] = true,
["subeventPrefix"] = "SPELL",
["count"] = "1",
["spellIds"] = {
},
["use_unit"] = true,
["event"] = "Item Count",
["unevent"] = "auto",
["names"] = {
},
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desc"] = "",
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
["glowDuration"] = 1,
["glowType"] = "Pixel",
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowLength"] = 10,
["type"] = "subglow",
["glowScale"] = 1,
["useGlowColor"] = false,
["glowXOffset"] = 0,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 35,
["xOffset"] = 0,
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
["HUNTER"] = true,
["WARLOCK"] = true,
["PALADIN"] = true,
["DRUID"] = true,
["SHAMAN"] = true,
["PRIEST"] = true,
},
},
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
["raid_role"] = {
},
["use_class"] = false,
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["spec"] = {
["multi"] = {
},
},
["use_ignoreNameRealm"] = false,
["zoneIds"] = "",
["use_item_bonusid_equipped"] = false,
["itemtypeequipped"] = {
},
},
["internalVersion"] = 90,
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["authorOptions"] = {
},
["progressSource"] = {
-1,
"",
},
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "Nn07KRMin2Q",
["desaturate"] = false,
["width"] = 35,
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30404,
["id"] = "魔法晶水",
["useCooldownModRate"] = true,
["alpha"] = 1,
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
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
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
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
},
["洛恩塔姆薯块"] = {
["iconSource"] = -1,
["parent"] = "法系药剂",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"22730",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["event"] = "Item Count",
["itemName"] = 18254,
["names"] = {
},
["spellIds"] = {
},
["count"] = "1",
["use_itemName"] = true,
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["count_operator"] = ">=",
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
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_precision"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
},
["height"] = 32,
["frameStrata"] = 1,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 81,
["multi"] = {
[81] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["WARLOCK"] = true,
["PALADIN"] = true,
["MAGE"] = true,
["DRUID"] = true,
["PRIEST"] = true,
},
},
["use_spellknown"] = false,
["zoneIds"] = "",
},
["xOffset"] = 0,
["useAdjustededMax"] = false,
["selfPoint"] = "CENTER",
["icon"] = true,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["progressSource"] = {
-1,
"",
},
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "yPl061sWLHy",
["useTooltip"] = false,
["width"] = 32,
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "洛恩塔姆薯块",
["url"] = "",
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["authorOptions"] = {
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
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["customText"] = "\n\n",
},
["赞扎之速"] = {
["iconSource"] = -1,
["parent"] = "团本药剂",
["preferToUpdate"] = false,
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"24383",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["itemName"] = 20081,
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["count"] = "1",
["use_unit"] = true,
["event"] = "Item Count",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_text_format_1.p_time_precision"] = 1,
["text_justify"] = "CENTER",
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_format"] = 0,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
},
},
["height"] = 32,
["frameStrata"] = 1,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 92,
["multi"] = {
[92] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_zone"] = false,
["zoneIds"] = "",
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["WARLOCK"] = true,
["PRIEST"] = true,
},
},
["use_spellknown"] = false,
["use_exact_spellknown"] = true,
["spellknown"] = 12,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["icon"] = true,
["useAdjustededMax"] = false,
["xOffset"] = 0,
["url"] = "",
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["adjustedMin"] = "",
["progressSource"] = {
-1,
"",
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["internalVersion"] = 90,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "赞扎之速",
["authorOptions"] = {
},
["alpha"] = 1,
["width"] = 32,
["adjustedMax"] = "",
["uid"] = "kZTVGmFn6CQ",
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
["color"] = {
1,
1,
1,
1,
},
},
["土狼兴奋剂"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["auranames"] = {
"10667",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["itemName"] = 8410,
["subeventPrefix"] = "SPELL",
["count"] = "1",
["spellIds"] = {
},
["use_itemName"] = true,
["use_unit"] = true,
["unevent"] = "auto",
["unit"] = "player",
["count_operator"] = ">=",
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
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_precision"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
},
},
["height"] = 32,
["alpha"] = 1,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["WARRIOR"] = true,
["ROGUE"] = true,
},
},
["use_spellknown"] = false,
["zoneIds"] = "",
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["useTooltip"] = false,
["parent"] = "近战药剂",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["url"] = "",
["preferToUpdate"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "Edq8oyeNj6q",
["icon"] = true,
["width"] = 32,
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "土狼兴奋剂",
["keepAspectRatio"] = false,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["customText"] = "\n\n",
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["color"] = {
1,
1,
1,
1,
},
},
["脑皮层混合饮料"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"10692",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["itemName"] = 8423,
["unit"] = "player",
["use_unit"] = true,
["spellIds"] = {
},
["event"] = "Item Count",
["count"] = "1",
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["count_operator"] = ">=",
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
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_text_format_1.p_time_precision"] = 1,
["text_justify"] = "CENTER",
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_format"] = "timed",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_format"] = 0,
},
},
["height"] = 32,
["alpha"] = 1,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 81,
["multi"] = {
[81] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_spellknown"] = false,
["zoneIds"] = "",
["use_zone"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
["DRUID"] = true,
["PRIEST"] = true,
["PALADIN"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["useTooltip"] = false,
["keepAspectRatio"] = false,
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["xOffset"] = 0,
["color"] = {
1,
1,
1,
1,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["parent"] = "法系药剂",
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "脑皮层混合饮料",
["adjustedMin"] = "",
["useCooldownModRate"] = true,
["width"] = 32,
["icon"] = true,
["uid"] = "1cBDB4Jn74P",
["inverse"] = false,
["preferToUpdate"] = false,
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["cooldownEdge"] = false,
},
["魂能之灰"] = {
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
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"16326",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["itemName"] = 12455,
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["event"] = "Item Count",
["use_unit"] = true,
["count"] = "1",
["unit"] = "player",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
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
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_text_format_1.p_time_precision"] = 1,
["text_justify"] = "CENTER",
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_format"] = "timed",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowXOffset"] = 0,
},
},
["height"] = 32,
["alpha"] = 1,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_zone"] = false,
["zoneIds"] = "",
["use_spellknown"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["ROGUE"] = true,
["WARRIOR"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["xOffset"] = 0,
["useAdjustededMax"] = false,
["authorOptions"] = {
},
["keepAspectRatio"] = false,
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["internalVersion"] = 90,
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["parent"] = "团本药剂",
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "魂能之灰",
["url"] = "",
["useCooldownModRate"] = true,
["width"] = 32,
["icon"] = true,
["uid"] = "oG74bFGt(Jz",
["inverse"] = false,
["customText"] = "\n\n",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["selfPoint"] = "CENTER",
},
["阿尔萨斯的礼物"] = {
["iconSource"] = -1,
["parent"] = "团本药剂",
["preferToUpdate"] = false,
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["auranames"] = {
"11371",
},
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["itemName"] = 9088,
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["event"] = "Item Count",
["count"] = "1",
["unevent"] = "auto",
["names"] = {
},
["count_operator"] = ">=",
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
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_text_format_1.p_time_precision"] = 1,
["text_justify"] = "CENTER",
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_mod_rate"] = true,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_precision"] = 1,
},
},
["height"] = 32,
["useCooldownModRate"] = true,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 81,
["multi"] = {
[81] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_spellknown"] = false,
["zoneIds"] = "",
["use_zone"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["WARLOCK"] = true,
["PALADIN"] = true,
["MAGE"] = true,
["DRUID"] = true,
["PRIEST"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
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
["useAdjustededMax"] = false,
["authorOptions"] = {
},
["keepAspectRatio"] = false,
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["useTooltip"] = false,
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "阿尔萨斯的礼物",
["xOffset"] = 0,
["frameStrata"] = 1,
["width"] = 32,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["uid"] = "uOkDP3enolA",
["inverse"] = false,
["adjustedMax"] = "",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMin"] = "",
},
["生命药剂"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"厚符文布绷带",
"特效治疗药水",
"特效治疗石",
"鞭根块茎",
"强效暗影防护药水",
"强效冰霜防护药水",
"强效火焰防护药水",
"强效自然防护药水",
"强效奥术防护药水",
},
["xOffset"] = 3,
["preferToUpdate"] = true,
["groupIcon"] = 236871,
["gridType"] = "RD",
["borderColor"] = {
0,
0,
0,
1,
},
["rowSpace"] = 1,
["url"] = "https://afdian.com/a/Rurutia",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["selfPoint"] = "TOPLEFT",
["desc"] = "",
["rotation"] = 0,
["load"] = {
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["class"] = {
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
["animate"] = false,
["customGrow"] = "\n\n",
["scale"] = 1,
["customAnchor"] = "function()\n    if ElvUI then\n        return ElvUF_Player\n    elseif NDui then\n        return oUF_Player\n    else\n        return UIParent\n    end\nend",
["stepAngle"] = 15,
["constantFactor"] = "RADIUS",
["borderOffset"] = 4,
["tocversion"] = 30404,
["alpha"] = 1,
["borderInset"] = 1,
["grow"] = "GRID",
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "GNLFqMh9Z",
["parent"] = "药剂组",
["sortHybridTable"] = {
["法力翡翠"] = false,
["强效火焰防护药水"] = false,
["暴怒药水"] = false,
["有限无敌药水"] = false,
["自由行动药剂"] = false,
["强效怒气药水"] = false,
["强效石盾药水"] = false,
["菊花茶"] = false,
["强效暗影防护药水"] = false,
["强效冰霜防护药水"] = false,
["超强法力药水"] = false,
["法力红宝石"] = false,
["特效治疗药水"] = false,
["特效法力药水"] = false,
["恶魔符文"] = false,
["强效自然防护药水"] = false,
["黑暗符文"] = false,
["强效奥术防护药水"] = false,
["法力黄水晶"] = false,
["特效活力药水"] = false,
},
["fullCircle"] = true,
["useAnchorPerUnit"] = false,
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
["useLimit"] = true,
["align"] = "CENTER",
["version"] = 1,
["subRegions"] = {
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["source"] = "import",
["centerType"] = "LR",
["border"] = false,
["anchorFrameFrame"] = "GwTargetUnitFrame",
["yOffset"] = -30,
["borderSize"] = 2,
["sort"] = "none",
["anchorPoint"] = "BOTTOMLEFT",
["limit"] = 8,
["uid"] = "poooDMZDplK",
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
["anchorPerUnit"] = "CUSTOM",
["authorOptions"] = {
},
["semver"] = "1.0.0",
["regionType"] = "dynamicgroup",
["id"] = "生命药剂",
["frameStrata"] = 1,
["gridWidth"] = 8,
["anchorFrameType"] = "SELECTFRAME",
["stagger"] = 0,
["borderEdge"] = "Square Full White",
["internalVersion"] = 90,
["space"] = 2,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["config"] = {
},
},
["魂能之力"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"16323",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["itemName"] = 12451,
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["count"] = "1",
["event"] = "Item Count",
["use_unit"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_text_format_1.p_time_precision"] = 1,
["text_justify"] = "CENTER",
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_format"] = "timed",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowXOffset"] = 0,
},
},
["height"] = 32,
["frameStrata"] = 1,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["zoneIds"] = "",
["use_spellknown"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["ROGUE"] = true,
["WARRIOR"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["customText"] = "\n\n",
["useAdjustededMax"] = false,
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
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["internalVersion"] = 90,
["xOffset"] = 0,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["keepAspectRatio"] = false,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "魂能之力",
["parent"] = "近战药剂",
["alpha"] = 1,
["width"] = 32,
["color"] = {
1,
1,
1,
1,
},
["uid"] = "laKrfIR216Y",
["inverse"] = false,
["cooldownEdge"] = false,
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
},
["主手磨刀石（致密/元素）"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["preferToUpdate"] = false,
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["auranames"] = {
"猫鼬药剂",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["use_unit"] = true,
["use_weapon"] = true,
["debuffType"] = "HELPFUL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["use_itemName"] = true,
["unit"] = "player",
["names"] = {
},
["use_enchant"] = false,
["spellIds"] = {
},
["event"] = "Weapon Enchant",
["showOn"] = "showOnActive",
["type"] = "item",
["subeventPrefix"] = "SPELL",
["weapon"] = "main",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["use_includeCharges"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["use_unit"] = true,
["count"] = "1",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["itemName"] = 12404,
["unit"] = "player",
["event"] = "Item Count",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "item",
["use_itemTypeName"] = false,
["subeventSuffix"] = "",
["itemTypeName"] = {
["multi"] = {
[518] = true,
[527] = true,
[512] = true,
[519] = true,
[513] = true,
[520] = true,
},
},
["use_genericShowOn"] = true,
["event"] = "Item Type Equipped",
["unit"] = "player",
["use_itemSlot"] = true,
["use_spellName"] = true,
["itemSlot"] = 16,
["use_itemName"] = true,
["subeventPrefix"] = "",
["genericShowOn"] = "showOnCooldown",
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
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
["type"] = "none",
["easeType"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
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
["anchorFrameType"] = "SCREEN",
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_text_format_p_time_format"] = 1,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_1.p_time_precision"] = 1,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text"] = "%1.p",
["text_text_format_p_time_mod_rate"] = true,
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_fontType"] = "OUTLINE",
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_text_format_1.p_format"] = "timed",
["text_text_format_p_time_legacy_floor"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_format"] = 0,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
},
},
["height"] = 32,
["alpha"] = 1,
["load"] = {
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
["zoneIds"] = "",
["use_class"] = false,
["use_zone"] = false,
["use_itemequiped"] = false,
["spec"] = {
["multi"] = {
},
},
["use_not_itemequiped"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["none"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["use_itemtypeequipped"] = false,
["itemtypeequipped"] = {
["single"] = 512,
["multi"] = {
[518] = true,
[513] = true,
[519] = true,
[512] = true,
[520] = true,
[527] = true,
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
["adjustedMin"] = "",
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
{
["check"] = {
["trigger"] = 3,
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
["progressSource"] = {
-1,
"",
},
["parent"] = "近战药剂",
["config"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["cooldownEdge"] = false,
["width"] = 32,
["useCooldownModRate"] = true,
["internalVersion"] = 90,
["semver"] = "1.0.7",
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "主手磨刀石（致密/元素）",
["selfPoint"] = "CENTER",
["frameStrata"] = 1,
["customTextUpdateThrottle"] = 0.9999999999999999,
["icon"] = true,
["uid"] = "xlzfq3Eu7Jp",
["inverse"] = false,
["xOffset"] = 0,
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
},
["魂能之寒"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"16325",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["itemName"] = 12457,
["names"] = {
},
["count"] = "1",
["spellIds"] = {
},
["use_itemName"] = true,
["unit"] = "player",
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["count_operator"] = ">=",
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
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_format"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["anchorYOffset"] = 0,
},
},
["height"] = 32,
["useCooldownModRate"] = true,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["WARRIOR"] = true,
["ROGUE"] = true,
},
},
["use_spellknown"] = false,
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
["useTooltip"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["keepAspectRatio"] = false,
["parent"] = "团本药剂",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "Tkol754UBYl",
["cooldownEdge"] = false,
["width"] = 32,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "魂能之寒",
["customText"] = "\n\n",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
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
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["adjustedMax"] = "",
},
["冰霜之力药剂"] = {
["iconSource"] = -1,
["parent"] = "法系药剂",
["adjustedMax"] = "",
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["auranames"] = {
"21920",
},
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["itemName"] = 17708,
["names"] = {
},
["unevent"] = "auto",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["event"] = "Item Count",
["count"] = "1",
["use_unit"] = true,
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_text_format_1.p_time_precision"] = 1,
["text_justify"] = "CENTER",
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_mod_rate"] = true,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
},
},
["height"] = 32,
["frameStrata"] = 1,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 81,
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_talent"] = true,
["use_class"] = false,
["use_zone"] = false,
["zoneIds"] = "",
["use_spellknown"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
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
["icon"] = true,
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["adjustedMin"] = "",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["url"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "冰霜之力药剂",
["internalVersion"] = 90,
["alpha"] = 1,
["width"] = 32,
["progressSource"] = {
-1,
"",
},
["uid"] = "b(0)i5Zv52H",
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
["preferToUpdate"] = false,
},
["超强防御药剂"] = {
["iconSource"] = -1,
["parent"] = "团本药剂",
["adjustedMax"] = "",
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"11348",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["event"] = "Item Count",
["itemName"] = 13445,
["names"] = {
},
["spellIds"] = {
},
["count"] = "1",
["subeventPrefix"] = "SPELL",
["use_itemName"] = true,
["subeventSuffix"] = "_CAST_START",
["use_unit"] = true,
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text"] = "%2.s",
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_format"] = 0,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_mod_rate"] = true,
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
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
["alpha"] = 1,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 44,
["multi"] = {
[44] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
["WARLOCK"] = true,
},
},
["use_spellknown"] = false,
["zoneIds"] = "",
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
["useAdjustededMax"] = false,
["preferToUpdate"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
["xOffset"] = 0,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "Ob4nOjj)4la",
["progressSource"] = {
-1,
"",
},
["width"] = 32,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "超强防御药剂",
["color"] = {
1,
1,
1,
1,
},
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["adjustedMin"] = "",
["config"] = {
},
["inverse"] = false,
["internalVersion"] = 90,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["authorOptions"] = {
},
},
["黑暗符文"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
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
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "item",
["itemName"] = 20520,
["use_remaining"] = false,
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Item)",
["names"] = {
},
["duration"] = "1",
["unevent"] = "auto",
["spellIds"] = {
},
["use_itemName"] = true,
["use_unit"] = true,
["unit"] = "player",
["genericShowOn"] = "showOnCooldown",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 20520,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["use_exact_itemName"] = false,
["unit"] = "player",
["names"] = {
},
["spellIds"] = {
},
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["count"] = "1",
["unevent"] = "auto",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
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
["preset"] = "fade",
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
["version"] = 1,
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
["glowYOffset"] = 0,
["glowColor"] = {
0.615686297416687,
0.615686297416687,
0.615686297416687,
1,
},
["glowThickness"] = 1,
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = true,
["glowScale"] = 1,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -4,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["url"] = "",
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
["HUNTER"] = true,
["WARRIOR"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["ROGUE"] = true,
["PALADIN"] = true,
},
},
["itemtypeequipped"] = {
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["useAdjustededMax"] = false,
["useTooltip"] = false,
["source"] = "import",
["cooldown"] = true,
["preferToUpdate"] = true,
["xOffset"] = 0,
["parent"] = "法力药剂",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["keepAspectRatio"] = false,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "黑暗符文",
["frameStrata"] = 1,
["alpha"] = 1,
["width"] = 36,
["authorOptions"] = {
},
["uid"] = "fwgzz)MDaE1",
["inverse"] = true,
["selfPoint"] = "CENTER",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["desaturate"] = false,
},
["强效石盾药水"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["xOffset"] = 0,
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
["itemName"] = 13455,
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_unit"] = true,
["names"] = {
},
["spellIds"] = {
},
["event"] = "Cooldown Progress (Item)",
["unevent"] = "auto",
["duration"] = "1",
["use_itemName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 13455,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["use_exact_itemName"] = true,
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["use_itemName"] = true,
["unit"] = "player",
["count"] = "1",
["use_unit"] = true,
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
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
["preset"] = "fade",
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
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
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
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowScale"] = 1,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["desaturate"] = false,
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
["HUNTER"] = true,
["WARRIOR"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["ROGUE"] = true,
["PALADIN"] = true,
},
},
["itemtypeequipped"] = {
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["useAdjustededMax"] = false,
["parent"] = "战斗药剂",
["source"] = "import",
["cooldown"] = true,
["keepAspectRatio"] = false,
["url"] = "",
["color"] = {
1,
1,
1,
1,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["authorOptions"] = {
},
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "强效石盾药水",
["frameStrata"] = 1,
["alpha"] = 1,
["width"] = 36,
["useTooltip"] = false,
["uid"] = "gIAMfIvpySv",
["inverse"] = true,
["adjustedMax"] = "",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["selfPoint"] = "CENTER",
},
["鞭根块茎"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
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
["itemName"] = 11951,
["type"] = "item",
["use_remaining"] = false,
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["use_unit"] = true,
["use_itemName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["duration"] = "1",
["unit"] = "player",
["event"] = "Cooldown Progress (Item)",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 11951,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["use_exact_itemName"] = false,
["names"] = {
},
["spellIds"] = {
},
["count"] = "1",
["event"] = "Item Count",
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
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
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "",
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
["glowDuration"] = 1,
["glowType"] = "Pixel",
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0.615686297416687,
0.615686297416687,
0.615686297416687,
1,
},
["glowLength"] = 10,
["type"] = "subglow",
["glowScale"] = 1,
["useGlowColor"] = true,
["glowXOffset"] = 0,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["adjustedMax"] = "",
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
["HUNTER"] = true,
["WARRIOR"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["ROGUE"] = true,
["PALADIN"] = true,
},
},
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["use_ignoreNameRealm"] = false,
["use_item_bonusid_equipped"] = false,
["itemtypeequipped"] = {
},
},
["internalVersion"] = 90,
["useAdjustededMax"] = false,
["url"] = "",
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["xOffset"] = 0,
["parent"] = "生命药剂",
["selfPoint"] = "CENTER",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "buzY)GmjLtx",
["color"] = {
1,
1,
1,
1,
},
["width"] = 36,
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30404,
["id"] = "鞭根块茎",
["useCooldownModRate"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["desaturate"] = false,
["config"] = {
},
["inverse"] = true,
["keepAspectRatio"] = false,
["conditions"] = {
},
["cooldown"] = true,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
},
["主手磨刀石（平衡/元素）"] = {
["iconSource"] = -1,
["parent"] = "近战药剂",
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["auranames"] = {
"猫鼬药剂",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "SPELL",
["use_weapon"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["use_itemName"] = true,
["use_unit"] = true,
["event"] = "Weapon Enchant",
["useName"] = true,
["spellIds"] = {
},
["unit"] = "player",
["showOn"] = "showOnActive",
["use_enchant"] = false,
["names"] = {
},
["weapon"] = "main",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 12643,
["use_count"] = true,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["use_includeCharges"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["unit"] = "player",
["names"] = {
},
["use_itemName"] = true,
["count"] = "1",
["unevent"] = "auto",
["use_exact_itemName"] = true,
["spellIds"] = {
},
["use_unit"] = true,
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "item",
["use_itemTypeName"] = false,
["subeventSuffix"] = "",
["itemTypeName"] = {
["multi"] = {
[522] = true,
[517] = true,
[516] = true,
[525] = true,
},
},
["use_genericShowOn"] = true,
["event"] = "Item Type Equipped",
["unit"] = "player",
["use_itemSlot"] = true,
["use_spellName"] = true,
["itemSlot"] = 16,
["use_itemName"] = true,
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "",
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
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
["easeType"] = "none",
["duration_type"] = "seconds",
["preset"] = "pulse",
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
["customTextUpdateThrottle"] = 0.9999999999999999,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_text_format_1.p_time_mod_rate"] = true,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
["rotateText"] = "NONE",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_text_format_p_time_format"] = 1,
["type"] = "subtext",
["text_visible"] = false,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_text_format_p_time_mod_rate"] = true,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_format"] = "timed",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_format"] = 0,
},
},
["height"] = 32,
["frameStrata"] = 1,
["load"] = {
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
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["pvp"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["none"] = true,
},
},
["use_not_itemequiped"] = false,
["use_zone"] = false,
["use_itemequiped"] = false,
["use_class"] = false,
["spec"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["use_itemtypeequipped"] = false,
["itemtypeequipped"] = {
["single"] = 516,
["multi"] = {
[522] = true,
[517] = true,
[525] = true,
[516] = true,
},
},
},
["authorOptions"] = {
},
["useAdjustededMax"] = false,
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
["xOffset"] = 0,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["uid"] = "Ngf3nDEG4dY",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["preferToUpdate"] = false,
["auto"] = true,
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "主手磨刀石（平衡/元素）",
["customText"] = "\n\n",
["useCooldownModRate"] = true,
["width"] = 32,
["selfPoint"] = "CENTER",
["config"] = {
},
["inverse"] = false,
["cooldownEdge"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
{
["check"] = {
["trigger"] = 3,
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
["cooldown"] = false,
["internalVersion"] = 90,
},
["美味风蛇 "] = {
["iconSource"] = 1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "https://wago.io/y7qMWv4rn/8",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["itemName"] = 6657,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["count"] = "1",
["names"] = {
},
["event"] = "Item Count",
["subeventPrefix"] = "SPELL",
["use_unit"] = true,
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["names"] = {
},
["spellIds"] = {
},
["auraspellids"] = {
"8219",
"8220",
"8221",
"8222",
},
["subeventPrefix"] = "SPELL",
["useExactSpellId"] = true,
["auranames"] = {
"诺格弗格药剂",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    if t[1] then\n        return true\n    end\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
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
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desaturate"] = false,
["version"] = 8,
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
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_anchorYOffset"] = 0,
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 12,
["anchorXOffset"] = 0,
["text_visible"] = true,
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
1,
0.96862745098039,
0.95686274509804,
1,
},
["glowLength"] = 10,
["glowType"] = "buttonOverlay",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%c",
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
0.32941176470588,
1,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_shadowYOffset"] = 0,
["text_text_format_c_format"] = "none",
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_visible"] = false,
},
},
["height"] = 35,
["frameStrata"] = 1,
["load"] = {
["use_size"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["WARRIOR"] = true,
["DRUID"] = true,
["ROGUE"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["none"] = true,
["flexible"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["internalVersion"] = 90,
["useAdjustededMax"] = false,
["parent"] = "吃喝&其他",
["icon"] = true,
["cooldown"] = false,
["conditions"] = {
{
["check"] = {
["trigger"] = -2,
["op"] = "<=",
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
["changes"] = {
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
["op"] = ">=",
["value"] = "1",
["variable"] = "value",
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
["value"] = 0.06,
["property"] = "sub.3.glowFrequency",
},
{
["value"] = false,
["property"] = "sub.3.glow",
},
{
["value"] = {
0.95686274509804,
1,
0.95686274509804,
0.84479919075966,
},
["property"] = "sub.3.glowColor",
},
},
},
{
["check"] = {
["trigger"] = 2,
["op"] = "<",
["value"] = "30",
["variable"] = "expirationTime",
},
["changes"] = {
{
["value"] = {
1,
0,
0.047058823529412,
1,
},
["property"] = "sub.4.text_color",
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
["op"] = ">=",
["value"] = "30",
["variable"] = "expirationTime",
},
{
["trigger"] = 2,
["op"] = "<",
["value"] = "60",
["variable"] = "expirationTime",
},
},
},
["changes"] = {
{
["value"] = {
1,
1,
1,
1,
},
["property"] = "sub.4.text_color",
},
{
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
["value"] = true,
["property"] = "sub.4.text_visible",
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
["variable"] = "show",
["value"] = 0,
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
["xOffset"] = 0,
["keepAspectRatio"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["cooldownEdge"] = false,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.7",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "美味风蛇 ",
["preferToUpdate"] = false,
["alpha"] = 1,
["width"] = 35,
["color"] = {
1,
1,
1,
1,
},
["uid"] = "66QZLaoOIXg",
["inverse"] = false,
["selfPoint"] = "CENTER",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["customText"] = "function(...)\n    local str\n    local time\n    \n    if aura_env.states[2].expirationTime then\n        -- print(2)\n        time=aura_env.states[2].expirationTime\n        str=-1*(GetTime()-time)\n        if str >=60 then\n            \n            return  math.ceil(str/60) ..\" m\"\n        elseif str >0 and  str <60 then \n            return math.floor(str) ..\" s\"\n        else\n            return\n        end\n        \n    end\n    \n\n\nend",
},
["神圣太阳果"] = {
["iconSource"] = -1,
["parent"] = "近战药剂",
["preferToUpdate"] = false,
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["auranames"] = {
"18125",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["itemName"] = 13810,
["subeventPrefix"] = "SPELL",
["count"] = "1",
["spellIds"] = {
},
["use_itemName"] = true,
["use_unit"] = true,
["unevent"] = "auto",
["unit"] = "player",
["count_operator"] = ">=",
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
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_precision"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
},
},
["height"] = 32,
["frameStrata"] = 1,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["ROGUE"] = true,
["WARRIOR"] = true,
},
},
["use_spellknown"] = false,
["zoneIds"] = "",
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
["useAdjustededMax"] = false,
["icon"] = true,
["xOffset"] = 0,
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
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "HW2)4NejW1K",
["adjustedMin"] = "",
["width"] = 32,
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "神圣太阳果",
["keepAspectRatio"] = false,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["useTooltip"] = false,
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
["value"] = 1,
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
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["cooldownEdge"] = false,
},
["戈多克绿酒"] = {
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["auranames"] = {
"22789",
},
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["itemName"] = 18269,
["names"] = {
},
["unevent"] = "auto",
["count"] = "1",
["event"] = "Item Count",
["use_unit"] = true,
["spellIds"] = {
},
["unit"] = "player",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
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
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_text_format_1.p_time_precision"] = 1,
["text_justify"] = "CENTER",
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_text_format_p_time_precision"] = 1,
["text_text"] = "%2.s",
["text_text_format_p_format"] = "timed",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_mod_rate"] = true,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowXOffset"] = 0,
},
},
["height"] = 32,
["alpha"] = 1,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 81,
["multi"] = {
[81] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_zone"] = false,
["zoneIds"] = "",
["use_spellknown"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["adjustedMin"] = "",
["useAdjustededMax"] = false,
["xOffset"] = 0,
["authorOptions"] = {
},
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["selfPoint"] = "CENTER",
["progressSource"] = {
-1,
"",
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["parent"] = "团本药剂",
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "戈多克绿酒",
["preferToUpdate"] = false,
["useCooldownModRate"] = true,
["width"] = 32,
["url"] = "",
["uid"] = "6gva7)))hhV",
["inverse"] = false,
["internalVersion"] = 90,
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
},
["法系药剂"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"法系主手",
"治疗主手",
"超级能量合剂",
"精炼智慧合剂",
"强效奥法药剂",
"强效火力药剂",
"暗影之力药剂",
"冰霜之力药剂",
"魔血药水",
"脑皮层混合饮料",
"夜鳞鱼汤",
"洛恩塔姆薯块",
},
["borderBackdrop"] = "Blizzard Tooltip",
["authorOptions"] = {
},
["yOffset"] = -65,
["anchorPoint"] = "BOTTOMLEFT",
["borderColor"] = {
0,
0,
0,
1,
},
["rowSpace"] = 1,
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
["columnSpace"] = 1,
["internalVersion"] = 90,
["useLimit"] = false,
["align"] = "CENTER",
["frameStrata"] = 1,
["rotation"] = 0,
["parent"] = "药剂组",
["gridWidth"] = 8,
["subRegions"] = {
},
["groupIcon"] = "236871",
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
["fullCircle"] = true,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["config"] = {
},
["animate"] = false,
["borderInset"] = 1,
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 8,
["radius"] = 200,
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
["anchorFrameParent"] = true,
["constantFactor"] = "RADIUS",
["stagger"] = 0,
["borderOffset"] = 4,
["xOffset"] = 40,
["selfPoint"] = "TOPLEFT",
["id"] = "法系药剂",
["space"] = 2,
["alpha"] = 1,
["anchorFrameType"] = "SELECTFRAME",
["anchorFrameFrame"] = "GwPlayerUnitFrame",
["uid"] = "evbmady7W3t",
["sort"] = "none",
["stepAngle"] = 15,
["conditions"] = {
},
["information"] = {
},
["gridType"] = "RD",
},
["烤鱿鱼"] = {
["iconSource"] = -1,
["xOffset"] = 0,
["adjustedMax"] = "",
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"18192",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["itemName"] = 20452,
["use_unit"] = true,
["names"] = {
},
["count"] = "1",
["event"] = "Item Count",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["count_operator"] = ">=",
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
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_text_format_1.p_time_precision"] = 1,
["text_justify"] = "CENTER",
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_text_format_p_time_format"] = 0,
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
["text_text_format_p_time_legacy_floor"] = false,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_format"] = "timed",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_precision"] = 1,
},
},
["height"] = 32,
["useCooldownModRate"] = true,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["zoneIds"] = "",
["use_spellknown"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["ROGUE"] = true,
["WARRIOR"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
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
["useTooltip"] = false,
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["adjustedMin"] = "",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["icon"] = true,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "烤鱿鱼",
["parent"] = "近战药剂",
["frameStrata"] = 1,
["width"] = 32,
["progressSource"] = {
-1,
"",
},
["uid"] = "WjVHh)H)W9T",
["inverse"] = false,
["cooldownEdge"] = false,
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
},
["法力黄水晶"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["parent"] = "法力药剂",
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
["use_remaining"] = false,
["itemName"] = 8007,
["genericShowOn"] = "showAlways",
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["duration"] = "1",
["use_itemName"] = true,
["unit"] = "player",
["event"] = "Cooldown Progress (Item)",
["type"] = "item",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["use_unit"] = true,
["use_genericShowOn"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 8007,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["use_exact_itemName"] = false,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["use_itemName"] = true,
["use_unit"] = true,
["count"] = "0",
["unevent"] = "auto",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
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
["glow"] = false,
["glowDuration"] = 1,
["glowType"] = "Pixel",
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0.615686297416687,
0.615686297416687,
0.615686297416687,
1,
},
["glowThickness"] = 1,
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = true,
["glowScale"] = 1,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -4,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["progressSource"] = {
-1,
"",
},
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
["single"] = "MAGE",
["multi"] = {
["HUNTER"] = true,
["WARRIOR"] = true,
["ROGUE"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["SHAMAN"] = true,
},
},
["itemtypeequipped"] = {
},
["use_class"] = true,
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["useAdjustededMax"] = false,
["selfPoint"] = "CENTER",
["source"] = "import",
["cooldown"] = true,
["preferToUpdate"] = true,
["xOffset"] = 0,
["color"] = {
1,
1,
1,
1,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["authorOptions"] = {
},
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "法力黄水晶",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 36,
["internalVersion"] = 90,
["uid"] = "5DX)wDkGpOF",
["inverse"] = true,
["cooldownEdge"] = true,
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "stacks",
["op"] = "==",
["value"] = "0",
},
["changes"] = {
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
["ignoreOptionsEventErrors"] = true,
},
["desc"] = "",
},
["自由行动药剂"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["parent"] = "战斗药剂",
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
["itemName"] = 5634,
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_unit"] = true,
["names"] = {
},
["spellIds"] = {
},
["event"] = "Cooldown Progress (Item)",
["unevent"] = "auto",
["duration"] = "1",
["use_itemName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 5634,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["use_exact_itemName"] = true,
["unevent"] = "auto",
["unit"] = "player",
["spellIds"] = {
},
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["count"] = "1",
["names"] = {
},
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desc"] = "",
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
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
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowScale"] = 1,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
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
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
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
["HUNTER"] = true,
["WARRIOR"] = true,
["ROGUE"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["SHAMAN"] = true,
},
},
["itemtypeequipped"] = {
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
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
["cooldown"] = true,
["desaturate"] = false,
["internalVersion"] = 90,
["xOffset"] = 0,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["cooldownEdge"] = true,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "自由行动药剂",
["frameStrata"] = 1,
["alpha"] = 1,
["width"] = 36,
["keepAspectRatio"] = false,
["uid"] = "t9XoF2liwdm",
["inverse"] = true,
["adjustedMax"] = "",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["authorOptions"] = {
},
},
["强效自然防护药水"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["parent"] = "生命药剂",
["preferToUpdate"] = true,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://afdian.com/a/Rurutia",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["type"] = "item",
["itemName"] = 13458,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["use_unit"] = true,
["spellIds"] = {
},
["use_itemName"] = true,
["unevent"] = "auto",
["duration"] = "1",
["event"] = "Cooldown Progress (Item)",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 13458,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["use_exact_itemName"] = true,
["unevent"] = "auto",
["spellIds"] = {
},
["count"] = "1",
["event"] = "Item Count",
["unit"] = "player",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
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
["easeStrength"] = 3,
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
["glow"] = false,
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
["type"] = "subglow",
["glowScale"] = 1,
["useGlowColor"] = false,
["glowXOffset"] = 0,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["desc"] = "by 露露緹婭@Bilibili。\n\n转载请保留出处。",
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
["HUNTER"] = true,
["WARRIOR"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["ROGUE"] = true,
["PALADIN"] = true,
},
},
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["use_ignoreNameRealm"] = false,
["use_item_bonusid_equipped"] = false,
["itemtypeequipped"] = {
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
["cooldownEdge"] = true,
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "CJzz)lgFDz)",
["color"] = {
1,
1,
1,
1,
},
["width"] = 36,
["alpha"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30404,
["id"] = "强效自然防护药水",
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["authorOptions"] = {
},
["config"] = {
},
["inverse"] = true,
["adjustedMax"] = "",
["conditions"] = {
},
["cooldown"] = true,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
},
["可口的魔法点心"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
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
["itemName"] = 13724,
["auranames"] = {
"喝水",
},
["duration"] = "1",
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["type"] = "aura2",
["unevent"] = "auto",
["auraspellids"] = {
"25696",
},
["use_itemName"] = true,
["useExactSpellId"] = true,
["useName"] = false,
["names"] = {
},
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["event"] = "Cooldown Progress (Item)",
["use_genericShowOn"] = true,
["unit"] = "player",
["use_unit"] = true,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 13724,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["event"] = "Item Count",
["use_exact_itemName"] = true,
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["count"] = "1",
["subeventPrefix"] = "SPELL",
["use_itemName"] = true,
["spellIds"] = {
},
["unit"] = "player",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
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
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "",
["version"] = 1,
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
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowScale"] = 1,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -4,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 35,
["parent"] = "吃喝&其他",
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
["HUNTER"] = true,
["WARLOCK"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["PRIEST"] = true,
},
},
["itemtypeequipped"] = {
},
["raid_role"] = {
},
["use_class"] = false,
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["useAdjustededMax"] = false,
["preferToUpdate"] = true,
["source"] = "import",
["cooldown"] = true,
["desaturate"] = false,
["url"] = "",
["xOffset"] = 0,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["authorOptions"] = {
},
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "可口的魔法点心",
["frameStrata"] = 1,
["alpha"] = 1,
["width"] = 35,
["progressSource"] = {
-1,
"",
},
["uid"] = "IqTXOp(PSGL",
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
},
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["internalVersion"] = 90,
},
["冬泉火酒"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"17038",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["itemName"] = 12820,
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["count"] = "1",
["event"] = "Item Count",
["use_unit"] = true,
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_text_format_1.p_time_precision"] = 1,
["text_justify"] = "CENTER",
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_format"] = "timed",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowXOffset"] = 0,
},
},
["height"] = 32,
["frameStrata"] = 1,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["zoneIds"] = "",
["use_spellknown"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["ROGUE"] = true,
["WARRIOR"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["customText"] = "\n\n",
["useAdjustededMax"] = false,
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
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["internalVersion"] = 90,
["cooldownEdge"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["keepAspectRatio"] = false,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "冬泉火酒",
["icon"] = true,
["alpha"] = 1,
["width"] = 32,
["color"] = {
1,
1,
1,
1,
},
["uid"] = "TexjvDCkeZ9",
["inverse"] = false,
["parent"] = "近战药剂",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = false,
},
["药剂组"] = {
["controlledChildren"] = {
"生命药剂",
"法力药剂",
"吃喝&其他",
"战斗药剂",
"近战药剂",
"法系药剂",
"团本药剂",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 0,
["groupIcon"] = "Mobile-Alchemy",
["anchorPoint"] = "CENTER",
["borderColor"] = {
0,
0,
0,
1,
},
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
["uid"] = "fbuCJDM9mRL",
["alpha"] = 1,
["id"] = "药剂组",
["authorOptions"] = {
},
["frameStrata"] = 2,
["anchorFrameType"] = "SCREEN",
["parent"] = "实用功能",
["config"] = {
},
["yOffset"] = 0,
["selfPoint"] = "CENTER",
["conditions"] = {
},
["information"] = {
},
["borderInset"] = 1,
},
["法系主手"] = {
["iconSource"] = 2,
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["triggers"] = {
{
["trigger"] = {
["auranames"] = {
"猫鼬药剂",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["use_weapon"] = true,
["debuffType"] = "HELPFUL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["use_itemName"] = true,
["event"] = "Weapon Enchant",
["subeventPrefix"] = "SPELL",
["type"] = "item",
["spellIds"] = {
},
["use_enchant"] = false,
["showOn"] = "showOnActive",
["unit"] = "player",
["use_unit"] = true,
["weapon"] = "main",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 20749,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["use_includeCharges"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["names"] = {
},
["event"] = "Item Count",
["unit"] = "player",
["count"] = "1",
["unevent"] = "auto",
["use_exact_itemName"] = true,
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "item",
["use_itemTypeName"] = false,
["subeventSuffix"] = "",
["itemTypeName"] = {
["multi"] = {
[527] = true,
[519] = true,
[516] = true,
[522] = true,
},
},
["use_genericShowOn"] = true,
["event"] = "Item Type Equipped",
["unit"] = "player",
["use_itemSlot"] = true,
["use_spellName"] = true,
["itemSlot"] = 16,
["use_itemName"] = true,
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "",
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
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
["easeType"] = "none",
["duration_type"] = "seconds",
["preset"] = "pulse",
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
["anchorFrameType"] = "SCREEN",
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_justify"] = "CENTER",
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_1.p_time_precision"] = 1,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_text_format_p_format"] = "timed",
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_p_time_mod_rate"] = true,
["type"] = "subtext",
["text_visible"] = false,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_text_format_p_time_format"] = 1,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_1.p_time_legacy_floor"] = false,
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_format"] = "timed",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_mod_rate"] = true,
},
},
["height"] = 32,
["frameStrata"] = 1,
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "MAGE",
["multi"] = {
["WARLOCK"] = true,
["MAGE"] = true,
},
},
["use_class"] = false,
["use_zone"] = false,
["use_itemequiped"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["pvp"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["none"] = true,
},
},
["use_not_itemequiped"] = false,
["spec"] = {
["multi"] = {
},
},
["zoneIds"] = "",
},
["customText"] = "\n\n",
["useAdjustededMax"] = false,
["url"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["parent"] = "法系药剂",
["adjustedMax"] = "",
["uid"] = ")7qok5YUhxD",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["color"] = {
1,
1,
1,
1,
},
["customTextUpdateThrottle"] = 0.9999999999999999,
["alpha"] = 1,
["progressSource"] = {
-1,
"",
},
["auto"] = true,
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "法系主手",
["authorOptions"] = {
},
["useCooldownModRate"] = true,
["width"] = 32,
["internalVersion"] = 90,
["config"] = {
},
["inverse"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
{
["check"] = {
["trigger"] = 3,
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
["cooldown"] = false,
["selfPoint"] = "CENTER",
},
["副手磨刀石（平衡/元素）"] = {
["iconSource"] = -1,
["parent"] = "近战药剂",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["auranames"] = {
"猫鼬药剂",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["use_weapon"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["use_itemName"] = true,
["use_enchant"] = false,
["subeventPrefix"] = "SPELL",
["unit"] = "player",
["spellIds"] = {
},
["use_unit"] = true,
["showOn"] = "showOnActive",
["useName"] = true,
["event"] = "Weapon Enchant",
["weapon"] = "off",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["use_includeCharges"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["event"] = "Item Count",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["count"] = "1",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["itemName"] = 18262,
["use_itemName"] = true,
["names"] = {
},
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "item",
["use_itemTypeName"] = false,
["subeventSuffix"] = "",
["itemTypeName"] = {
["multi"] = {
[516] = true,
[525] = true,
},
},
["use_genericShowOn"] = true,
["event"] = "Item Type Equipped",
["unit"] = "player",
["use_itemSlot"] = true,
["use_spellName"] = true,
["itemSlot"] = 17,
["use_itemName"] = true,
["subeventPrefix"] = "",
["genericShowOn"] = "showOnCooldown",
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
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
["type"] = "none",
["easeType"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
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
["width"] = 32,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_text_format_p_time_format"] = 1,
["text_text"] = "%1.p",
["text_justify"] = "CENTER",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
["rotateText"] = "NONE",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_precision"] = 1,
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_p_time_mod_rate"] = true,
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_fontType"] = "OUTLINE",
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_text_format_1.p_format"] = "timed",
["text_text_format_1.p_time_legacy_floor"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["anchorYOffset"] = 0,
},
},
["height"] = 32,
["useCooldownModRate"] = true,
["load"] = {
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
["zoneIds"] = "",
["use_not_itemequiped"] = false,
["use_zone"] = false,
["use_itemequiped"] = false,
["spec"] = {
["multi"] = {
},
},
["use_class"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["none"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["use_itemtypeequipped"] = false,
["itemtypeequipped"] = {
["single"] = 512,
["multi"] = {
[525] = true,
[516] = true,
},
},
},
["progressSource"] = {
-1,
"",
},
["useAdjustededMax"] = false,
["useTooltip"] = false,
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
{
["check"] = {
["trigger"] = 3,
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
["customText"] = "\n\n",
["selfPoint"] = "CENTER",
["config"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["authorOptions"] = {
},
["customTextUpdateThrottle"] = 0.9999999999999999,
["frameStrata"] = 1,
["color"] = {
1,
1,
1,
1,
},
["semver"] = "1.0.7",
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "副手磨刀石（平衡/元素）",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["uid"] = "EglYMzVtxKD",
["inverse"] = false,
["url"] = "",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
},
["强效敏捷药剂"] = {
["iconSource"] = -1,
["parent"] = "近战药剂",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["auranames"] = {
"11334",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["itemName"] = 9187,
["use_unit"] = true,
["count"] = "1",
["spellIds"] = {
},
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
["names"] = {
},
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_shadowXOffset"] = 0,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
},
},
["height"] = 32,
["alpha"] = 1,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["ROGUE"] = true,
["WARRIOR"] = true,
},
},
["use_spellknown"] = false,
["zoneIds"] = "",
},
["icon"] = true,
["useAdjustededMax"] = false,
["keepAspectRatio"] = false,
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
["customText"] = "\n\n",
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "(ONW1JqftG4",
["internalVersion"] = 90,
["width"] = 32,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "强效敏捷药剂",
["authorOptions"] = {
},
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["cooldownEdge"] = false,
},
["诺格弗格药剂"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
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
["type"] = "item",
["itemName"] = 8529,
["subeventSuffix"] = "_CAST_START",
["genericShowOn"] = "showOnCooldown",
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Item)",
["unit"] = "player",
["duration"] = "1",
["unevent"] = "auto",
["spellIds"] = {
},
["use_itemName"] = true,
["use_unit"] = true,
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
["itemName"] = 8529,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["use_exact_itemName"] = true,
["subeventPrefix"] = "SPELL",
["use_unit"] = true,
["spellIds"] = {
},
["unit"] = "player",
["use_itemName"] = true,
["count"] = "1",
["unevent"] = "auto",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
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
["preset"] = "fade",
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
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
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
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowScale"] = 1,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -4,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 35,
["cooldownEdge"] = true,
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
["HUNTER"] = true,
["WARRIOR"] = true,
["ROGUE"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["SHAMAN"] = true,
},
},
["itemtypeequipped"] = {
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["useAdjustededMax"] = false,
["parent"] = "吃喝&其他",
["source"] = "import",
["cooldown"] = true,
["useTooltip"] = false,
["authorOptions"] = {
},
["keepAspectRatio"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["desaturate"] = false,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "诺格弗格药剂",
["frameStrata"] = 1,
["alpha"] = 1,
["width"] = 35,
["selfPoint"] = "CENTER",
["uid"] = "Zljm0TBy6MU",
["inverse"] = true,
["adjustedMax"] = "",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["xOffset"] = 0,
},
["龙息红椒"] = {
["iconSource"] = -1,
["parent"] = "近战药剂",
["preferToUpdate"] = false,
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["auranames"] = {
"15852",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["itemName"] = 12217,
["subeventPrefix"] = "SPELL",
["count"] = "1",
["spellIds"] = {
},
["use_itemName"] = true,
["use_unit"] = true,
["unevent"] = "auto",
["unit"] = "player",
["count_operator"] = ">=",
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
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_precision"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
},
},
["height"] = 32,
["frameStrata"] = 1,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["ROGUE"] = true,
["WARRIOR"] = true,
},
},
["use_spellknown"] = false,
["zoneIds"] = "",
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
["useAdjustededMax"] = false,
["icon"] = true,
["xOffset"] = 0,
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
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "5zMscDwbmW4",
["adjustedMin"] = "",
["width"] = 32,
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "龙息红椒",
["keepAspectRatio"] = false,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["useTooltip"] = false,
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
["value"] = 1,
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
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["cooldownEdge"] = false,
},
["猫鼬药剂"] = {
["iconSource"] = -1,
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["auranames"] = {
"17538",
},
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["itemName"] = 13452,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["count"] = "1",
["unit"] = "player",
["event"] = "Item Count",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
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
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_format"] = 0,
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_format"] = "timed",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_mod_rate"] = true,
},
},
["height"] = 32,
["useCooldownModRate"] = true,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["zoneIds"] = "",
["use_spellknown"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["ROGUE"] = true,
["WARRIOR"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["authorOptions"] = {
},
["useAdjustededMax"] = false,
["internalVersion"] = 90,
["selfPoint"] = "CENTER",
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["icon"] = true,
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["customText"] = "\n\n",
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "猫鼬药剂",
["parent"] = "近战药剂",
["frameStrata"] = 1,
["width"] = 32,
["keepAspectRatio"] = false,
["uid"] = "7YQvvdb2o4g",
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
["adjustedMax"] = "",
},
["法力翡翠"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["xOffset"] = 0,
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
["use_remaining"] = false,
["itemName"] = 5513,
["duration"] = "1",
["unevent"] = "auto",
["use_unit"] = true,
["use_genericShowOn"] = true,
["genericShowOn"] = "showAlways",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["type"] = "item",
["event"] = "Cooldown Progress (Item)",
["unit"] = "player",
["use_itemName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 5513,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["use_exact_itemName"] = false,
["unit"] = "player",
["spellIds"] = {
},
["count"] = "0",
["event"] = "Item Count",
["subeventPrefix"] = "SPELL",
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
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
["easeStrength"] = 3,
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
["glow"] = false,
["glowDuration"] = 1,
["glowType"] = "Pixel",
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0.615686297416687,
0.615686297416687,
0.615686297416687,
1,
},
["glowLength"] = 10,
["type"] = "subglow",
["glowScale"] = 1,
["useGlowColor"] = true,
["glowXOffset"] = 0,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["color"] = {
1,
1,
1,
1,
},
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
["single"] = "MAGE",
["multi"] = {
["HUNTER"] = true,
["WARRIOR"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["ROGUE"] = true,
["PALADIN"] = true,
},
},
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
["use_class"] = true,
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["use_ignoreNameRealm"] = false,
["use_item_bonusid_equipped"] = false,
["itemtypeequipped"] = {
},
},
["url"] = "",
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["selfPoint"] = "CENTER",
["parent"] = "法力药剂",
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "j6LCvbK3Tl2",
["internalVersion"] = 90,
["width"] = 36,
["alpha"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30404,
["id"] = "法力翡翠",
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["desc"] = "",
["config"] = {
},
["inverse"] = true,
["progressSource"] = {
-1,
"",
},
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "stacks",
["value"] = "0",
["op"] = "==",
},
["changes"] = {
{
["value"] = 0.5,
["property"] = "alpha",
},
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
},
["特效活力药水"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["parent"] = "法力药剂",
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
["itemName"] = 18253,
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_unit"] = true,
["names"] = {
},
["spellIds"] = {
},
["event"] = "Cooldown Progress (Item)",
["unevent"] = "auto",
["duration"] = "1",
["use_itemName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 18253,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["use_exact_itemName"] = true,
["unevent"] = "auto",
["unit"] = "player",
["spellIds"] = {
},
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["count"] = "1",
["names"] = {
},
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desc"] = "by 露露緹婭@Bilibili。\n\n转载请保留出处。",
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
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
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowScale"] = 1,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
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
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
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
["HUNTER"] = true,
["WARRIOR"] = true,
["ROGUE"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["SHAMAN"] = true,
},
},
["itemtypeequipped"] = {
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
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
["cooldown"] = true,
["desaturate"] = false,
["internalVersion"] = 90,
["xOffset"] = 0,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["cooldownEdge"] = true,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "特效活力药水",
["frameStrata"] = 1,
["alpha"] = 1,
["width"] = 36,
["keepAspectRatio"] = false,
["uid"] = "cHSxOPa)QpA",
["inverse"] = true,
["adjustedMax"] = "",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["authorOptions"] = {
},
},
["嫩狼肉排"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"19710",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["itemName"] = 18045,
["unit"] = "player",
["use_unit"] = true,
["spellIds"] = {
},
["event"] = "Item Count",
["count"] = "1",
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["count_operator"] = ">=",
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
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_text_format_1.p_time_precision"] = 1,
["text_justify"] = "CENTER",
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_format"] = "timed",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_format"] = 0,
},
},
["height"] = 32,
["alpha"] = 1,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 81,
["multi"] = {
[81] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_spellknown"] = false,
["zoneIds"] = "",
["use_zone"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
["DRUID"] = true,
["PRIEST"] = true,
["PALADIN"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["keepAspectRatio"] = false,
["adjustedMin"] = "",
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["parent"] = "团本药剂",
["color"] = {
1,
1,
1,
1,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["useTooltip"] = false,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "嫩狼肉排",
["xOffset"] = 0,
["useCooldownModRate"] = true,
["width"] = 32,
["icon"] = true,
["uid"] = "0JTR(tcs(tS",
["inverse"] = false,
["preferToUpdate"] = false,
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["cooldownEdge"] = false,
},
["克雷格的烈酒"] = {
["iconSource"] = -1,
["parent"] = "团本药剂",
["adjustedMax"] = "",
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"22790",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["event"] = "Item Count",
["itemName"] = 18284,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["count"] = "1",
["unit"] = "player",
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["use_unit"] = true,
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
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
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_shadowXOffset"] = 0,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
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
["frameStrata"] = 1,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 81,
["multi"] = {
[81] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
},
},
["use_spellknown"] = false,
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
["xOffset"] = 0,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["authorOptions"] = {
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "C6(2thuilBI",
["internalVersion"] = 90,
["width"] = 32,
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "克雷格的烈酒",
["cooldownEdge"] = false,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["preferToUpdate"] = false,
["config"] = {
},
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
["property"] = "sub.2.glow",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["adjustedMin"] = "",
},
["吃喝&其他"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"可口的魔法点心",
"奥特兰克魔法点心",
"魔法晶水",
"魔法肉桂面包",
"诺格弗格药剂",
"美味风蛇 ",
},
["xOffset"] = 373,
["preferToUpdate"] = true,
["yOffset"] = 267,
["anchorPoint"] = "TOPLEFT",
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
["finish"] = {
},
["init"] = {
},
},
["selfPoint"] = "TOPLEFT",
["desc"] = "",
["stagger"] = 0,
["load"] = {
["talent"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["zoneIds"] = "",
},
["animate"] = false,
["customGrow"] = "\n\n",
["scale"] = 1,
["customAnchor"] = "function()\n    if ElvUI then\n        return ElvUF_Player\n    elseif NDui then\n        return oUF_Player\n    else\n        return UIParent\n    end\nend",
["stepAngle"] = 15,
["constantFactor"] = "RADIUS",
["borderOffset"] = 4,
["tocversion"] = 30404,
["alpha"] = 1,
["borderInset"] = 1,
["grow"] = "GRID",
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "GNLFqMh9Z",
["parent"] = "药剂组",
["sortHybridTable"] = {
["法力翡翠"] = false,
["强效火焰防护药水"] = false,
["超强法力药水"] = false,
["恶魔符文"] = false,
["自由行动药剂"] = false,
["强效怒气药水"] = false,
["特效活力药水"] = false,
["菊花茶"] = false,
["强效暗影防护药水"] = false,
["强效冰霜防护药水"] = false,
["强效自然防护药水"] = false,
["有限无敌药水"] = false,
["特效治疗药水"] = false,
["黑暗符文"] = false,
["法力红宝石"] = false,
["强效石盾药水"] = false,
["特效法力药水"] = false,
["强效奥术防护药水"] = false,
["法力黄水晶"] = false,
["暴怒药水"] = false,
},
["fullCircle"] = true,
["useAnchorPerUnit"] = false,
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
["internalVersion"] = 90,
["useLimit"] = true,
["align"] = "CENTER",
["version"] = 1,
["subRegions"] = {
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["source"] = "import",
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["groupIcon"] = 236871,
["borderSize"] = 2,
["anchorPerUnit"] = "CUSTOM",
["gridType"] = "RD",
["authorOptions"] = {
},
["limit"] = 6,
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
["sort"] = "none",
["regionType"] = "dynamicgroup",
["semver"] = "1.0.0",
["config"] = {
},
["id"] = "吃喝&其他",
["gridWidth"] = 1,
["frameStrata"] = 1,
["anchorFrameType"] = "SELECTFRAME",
["anchorFrameFrame"] = "ActionButton12",
["rotation"] = 0,
["radius"] = 200,
["rowSpace"] = 1,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["uid"] = "sIa161KFTYE",
},
["沙漠肉丸子"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["preferToUpdate"] = false,
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["auranames"] = {
"24799",
},
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["itemName"] = 20452,
["unit"] = "player",
["use_unit"] = true,
["count"] = "1",
["event"] = "Item Count",
["names"] = {
},
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_text_format_1.p_time_precision"] = 1,
["text_justify"] = "CENTER",
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_format"] = "timed",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_format"] = 0,
},
},
["height"] = 32,
["alpha"] = 1,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["zoneIds"] = "",
["use_spellknown"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["ROGUE"] = true,
["WARRIOR"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["keepAspectRatio"] = false,
["useAdjustededMax"] = false,
["adjustedMin"] = "",
["internalVersion"] = 90,
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "沙漠肉丸子",
["parent"] = "近战药剂",
["useCooldownModRate"] = true,
["width"] = 32,
["icon"] = true,
["uid"] = "5)d37Co(4t2",
["inverse"] = false,
["xOffset"] = 0,
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
},
["夜龙之息"] = {
["iconSource"] = 1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["cooldownEdge"] = true,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["itemName"] = 11952,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["count"] = "1",
["names"] = {
},
["event"] = "Item Count",
["subeventPrefix"] = "SPELL",
["use_unit"] = true,
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "item",
["itemName"] = 11952,
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["duration"] = "1",
["event"] = "Cooldown Progress (Item)",
["names"] = {
},
["use_itemName"] = true,
["unit"] = "player",
["spellIds"] = {
},
["genericShowOn"] = "showOnCooldown",
["subeventSuffix"] = "_CAST_START",
["use_genericShowOn"] = true,
["use_unit"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(trigger)\n    if trigger[1] then\n        return true\n    end\n    \nend",
["activeTriggerMode"] = 2,
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
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = false,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowLength"] = 10,
["glowType"] = "buttonOverlay",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.s",
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
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_anchorYOffset"] = -4,
["text_visible"] = true,
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["load"] = {
["use_size"] = false,
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["HUNTER"] = true,
["WARRIOR"] = true,
["WARLOCK"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["PRIEST"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["pvp"] = true,
["flexible"] = true,
["twenty"] = true,
["none"] = true,
},
},
},
["preferToUpdate"] = false,
["useAdjustededMax"] = false,
["useCooldownModRate"] = true,
["url"] = "https://wago.io/y7qMWv4rn/8",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["cooldown"] = true,
["conditions"] = {
},
["progressSource"] = {
-1,
"",
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["alpha"] = 1,
["config"] = {
},
["color"] = {
1,
1,
1,
1,
},
["width"] = 36,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.7",
["zoom"] = 0,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "夜龙之息",
["selfPoint"] = "CENTER",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["uid"] = "NzBvvwRug0R",
["inverse"] = true,
["parent"] = "法力药剂",
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["useTooltip"] = false,
},
["夜鳞鱼汤"] = {
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = false,
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"18194",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["itemName"] = 13931,
["unit"] = "player",
["use_unit"] = true,
["spellIds"] = {
},
["event"] = "Item Count",
["subeventPrefix"] = "SPELL",
["count"] = "1",
["unevent"] = "auto",
["count_operator"] = ">=",
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
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_text_format_1.p_time_precision"] = 1,
["text_justify"] = "CENTER",
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_format"] = "timed",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_format"] = 0,
},
},
["height"] = 32,
["alpha"] = 1,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 81,
["multi"] = {
[81] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["zoneIds"] = "",
["use_spellknown"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["PRIEST"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["url"] = "",
["useAdjustededMax"] = false,
["useTooltip"] = false,
["adjustedMin"] = "",
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["xOffset"] = 0,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["progressSource"] = {
-1,
"",
},
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "夜鳞鱼汤",
["parent"] = "法系药剂",
["useCooldownModRate"] = true,
["width"] = 32,
["selfPoint"] = "CENTER",
["uid"] = "jOOCgXUEDjt",
["inverse"] = false,
["authorOptions"] = {
},
["displayIcon"] = "",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
},
["近战药剂"] = {
["grow"] = "GRID",
["controlledChildren"] = {
"主手磨刀石（致密/元素）",
"副手磨刀石（致密/元素）",
"主手磨刀石（平衡/元素）",
"副手磨刀石（平衡/元素）",
"猫鼬药剂",
"强效敏捷药剂",
"魂能之击",
"冬泉火酒",
"魂能之力",
"巨人药剂",
"土狼兴奋剂",
"厚甲蝎盐",
"沙漠肉丸子",
"神圣太阳果",
"烤鱿鱼",
"龙息红椒",
},
["borderBackdrop"] = "Blizzard Tooltip",
["xOffset"] = 40,
["yOffset"] = -65,
["anchorPoint"] = "BOTTOMLEFT",
["borderColor"] = {
0,
0,
0,
1,
},
["space"] = 2,
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
["radius"] = 200,
["selfPoint"] = "TOPLEFT",
["align"] = "CENTER",
["alpha"] = 1,
["stagger"] = 0,
["parent"] = "药剂组",
["authorOptions"] = {
},
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
["rotation"] = 0,
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
["arcLength"] = 360,
["backdropColor"] = {
1,
1,
1,
0.5,
},
["gridType"] = "RD",
["animate"] = false,
["useLimit"] = false,
["scale"] = 1,
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["regionType"] = "dynamicgroup",
["borderSize"] = 2,
["limit"] = 8,
["borderInset"] = 1,
["stepAngle"] = 15,
["constantFactor"] = "RADIUS",
["uid"] = "eZ8(mGHcIBx",
["borderOffset"] = 4,
["frameStrata"] = 1,
["rowSpace"] = 1,
["id"] = "近战药剂",
["sort"] = "none",
["gridWidth"] = 8,
["anchorFrameType"] = "SELECTFRAME",
["anchorFrameFrame"] = "GwPlayerUnitFrame",
["config"] = {
},
["fullCircle"] = true,
["internalVersion"] = 90,
["conditions"] = {
},
["information"] = {
},
["groupIcon"] = "236871",
},
["强效暗影防护药水"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["xOffset"] = 0,
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
["itemName"] = 13459,
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["subeventPrefix"] = "SPELL",
["use_unit"] = true,
["spellIds"] = {
},
["use_itemName"] = true,
["unevent"] = "auto",
["duration"] = "1",
["event"] = "Cooldown Progress (Item)",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 13459,
["use_count"] = true,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["use_exact_itemName"] = true,
["unevent"] = "auto",
["spellIds"] = {
},
["count"] = "1",
["event"] = "Item Count",
["names"] = {
},
["unit"] = "player",
["use_unit"] = true,
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["keepAspectRatio"] = false,
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
["easeStrength"] = 3,
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
["glow"] = false,
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
["type"] = "subglow",
["glowScale"] = 1,
["useGlowColor"] = false,
["glowXOffset"] = 0,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["selfPoint"] = "CENTER",
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
["HUNTER"] = true,
["WARRIOR"] = true,
["ROGUE"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["SHAMAN"] = true,
},
},
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["use_ignoreNameRealm"] = false,
["use_item_bonusid_equipped"] = false,
["itemtypeequipped"] = {
},
},
["useTooltip"] = false,
["useAdjustededMax"] = false,
["authorOptions"] = {
},
["source"] = "import",
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
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["parent"] = "生命药剂",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "dz9vrd6MyVs",
["desc"] = "by 露露緹婭@Bilibili。\n\n转载请保留出处。",
["width"] = 36,
["alpha"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30404,
["id"] = "强效暗影防护药水",
["frameStrata"] = 1,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["progressSource"] = {
-1,
"",
},
["config"] = {
},
["inverse"] = true,
["adjustedMax"] = "",
["conditions"] = {
},
["cooldown"] = true,
["url"] = "https://afdian.com/a/Rurutia",
},
["法力红宝石"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
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
["use_remaining"] = false,
["itemName"] = 8008,
["duration"] = "1",
["unevent"] = "auto",
["unit"] = "player",
["use_genericShowOn"] = true,
["use_itemName"] = true,
["use_unit"] = true,
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["type"] = "item",
["event"] = "Cooldown Progress (Item)",
["subeventPrefix"] = "SPELL",
["genericShowOn"] = "showAlways",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 8008,
["use_count"] = true,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["use_exact_itemName"] = false,
["use_unit"] = true,
["spellIds"] = {
},
["count"] = "0",
["event"] = "Item Count",
["names"] = {
},
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
["glowDuration"] = 1,
["glowType"] = "Pixel",
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0.615686297416687,
0.615686297416687,
0.615686297416687,
1,
},
["glowLength"] = 10,
["type"] = "subglow",
["glowScale"] = 1,
["useGlowColor"] = true,
["glowXOffset"] = 0,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["xOffset"] = 0,
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
["single"] = "MAGE",
["multi"] = {
["HUNTER"] = true,
["WARRIOR"] = true,
["PALADIN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["SHAMAN"] = true,
["ROGUE"] = true,
},
},
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
["use_class"] = true,
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["use_ignoreNameRealm"] = false,
["use_item_bonusid_equipped"] = false,
["itemtypeequipped"] = {
},
},
["authorOptions"] = {
},
["useAdjustededMax"] = false,
["cooldownEdge"] = true,
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["keepAspectRatio"] = false,
["parent"] = "法力药剂",
["internalVersion"] = 90,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "VvJ92eE3xng",
["adjustedMax"] = "",
["width"] = 36,
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30404,
["id"] = "法力红宝石",
["useCooldownModRate"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
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
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["config"] = {
},
["inverse"] = true,
["desc"] = "",
["conditions"] = {
{
["check"] = {
["trigger"] = 2,
["variable"] = "stacks",
["value"] = "0",
["op"] = "==",
},
["changes"] = {
{
["value"] = 0.5,
["property"] = "alpha",
},
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
},
["暴怒药水"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
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
["itemName"] = 5633,
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["subeventPrefix"] = "SPELL",
["use_unit"] = true,
["spellIds"] = {
},
["use_itemName"] = true,
["unevent"] = "auto",
["duration"] = "1",
["event"] = "Cooldown Progress (Item)",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 5633,
["use_count"] = true,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["use_exact_itemName"] = true,
["unevent"] = "auto",
["spellIds"] = {
},
["count"] = "1",
["event"] = "Item Count",
["names"] = {
},
["unit"] = "player",
["use_unit"] = true,
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
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
["easeStrength"] = 3,
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
["glow"] = false,
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
["type"] = "subglow",
["glowScale"] = 1,
["useGlowColor"] = false,
["glowXOffset"] = 0,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["color"] = {
1,
1,
1,
1,
},
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
["HUNTER"] = true,
["WARRIOR"] = true,
["ROGUE"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["SHAMAN"] = true,
},
},
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["use_ignoreNameRealm"] = false,
["use_item_bonusid_equipped"] = false,
["itemtypeequipped"] = {
},
},
["authorOptions"] = {
},
["useAdjustededMax"] = false,
["adjustedMax"] = "",
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["parent"] = "战斗药剂",
["cooldownEdge"] = true,
["internalVersion"] = 90,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "QXrK4ymcFFb",
["progressSource"] = {
-1,
"",
},
["width"] = 36,
["alpha"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["zoom"] = 0,
["auto"] = true,
["tocversion"] = 30404,
["id"] = "暴怒药水",
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["selfPoint"] = "CENTER",
["config"] = {
},
["inverse"] = true,
["desc"] = "",
["conditions"] = {
},
["cooldown"] = true,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
},
["治疗主手"] = {
["iconSource"] = 2,
["color"] = {
1,
1,
1,
1,
},
["preferToUpdate"] = false,
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["auranames"] = {
"猫鼬药剂",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["use_unit"] = true,
["use_weapon"] = true,
["debuffType"] = "HELPFUL",
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["use_itemName"] = true,
["unit"] = "player",
["names"] = {
},
["use_enchant"] = false,
["spellIds"] = {
},
["event"] = "Weapon Enchant",
["showOn"] = "showOnActive",
["type"] = "item",
["subeventPrefix"] = "SPELL",
["weapon"] = "main",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["use_includeCharges"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["use_unit"] = true,
["count"] = "1",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["itemName"] = 20748,
["unit"] = "player",
["event"] = "Item Count",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "item",
["use_itemTypeName"] = false,
["subeventSuffix"] = "",
["itemTypeName"] = {
["multi"] = {
[527] = true,
[522] = true,
[519] = true,
[516] = true,
},
},
["use_genericShowOn"] = true,
["event"] = "Item Type Equipped",
["unit"] = "player",
["use_itemSlot"] = true,
["use_spellName"] = true,
["itemSlot"] = 16,
["use_itemName"] = true,
["subeventPrefix"] = "",
["genericShowOn"] = "showOnCooldown",
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
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
["type"] = "none",
["easeType"] = "none",
["duration_type"] = "seconds",
["easeStrength"] = 3,
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
["width"] = 32,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_text_format_p_time_format"] = 1,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
["text_text_format_1.p_time_precision"] = 1,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text"] = "%1.p",
["text_text_format_p_time_mod_rate"] = true,
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_fontType"] = "OUTLINE",
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = false,
["text_text_format_1.p_format"] = "timed",
["text_text_format_p_time_legacy_floor"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
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
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_format"] = 0,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
},
},
["height"] = 32,
["useCooldownModRate"] = true,
["load"] = {
["use_never"] = false,
["talent"] = {
["multi"] = {
},
},
["class"] = {
["single"] = "MAGE",
["multi"] = {
["DRUID"] = true,
["PRIEST"] = true,
["PALADIN"] = true,
},
},
["use_class"] = false,
["use_zone"] = false,
["use_itemequiped"] = false,
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["use_not_itemequiped"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["none"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["useTooltip"] = false,
["useAdjustededMax"] = false,
["authorOptions"] = {
},
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
{
["check"] = {
["trigger"] = 3,
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
["xOffset"] = 0,
["selfPoint"] = "CENTER",
["config"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["url"] = "",
["semver"] = "1.0.7",
["zoom"] = 0.3,
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "治疗主手",
["adjustedMax"] = "",
["alpha"] = 1,
["customTextUpdateThrottle"] = 0.9999999999999999,
["parent"] = "法系药剂",
["uid"] = "eDLy6uEgjqe",
["inverse"] = false,
["adjustedMin"] = "",
["displayIcon"] = "",
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
["有限无敌药水"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
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
["type"] = "item",
["itemName"] = 3387,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "SPELL",
["names"] = {
},
["use_unit"] = true,
["spellIds"] = {
},
["use_itemName"] = true,
["unevent"] = "auto",
["duration"] = "1",
["event"] = "Cooldown Progress (Item)",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 3387,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["use_exact_itemName"] = true,
["unevent"] = "auto",
["spellIds"] = {
},
["count"] = "1",
["event"] = "Item Count",
["unit"] = "player",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["internalVersion"] = 90,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
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
["type"] = "subglow",
["glowScale"] = 1,
["useGlowColor"] = false,
["glowXOffset"] = 0,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["cooldownEdge"] = true,
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
["HUNTER"] = true,
["WARRIOR"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["ROGUE"] = true,
["PALADIN"] = true,
},
},
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["use_ignoreNameRealm"] = false,
["use_item_bonusid_equipped"] = false,
["itemtypeequipped"] = {
},
},
["authorOptions"] = {
},
["useAdjustededMax"] = false,
["preferToUpdate"] = true,
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["parent"] = "战斗药剂",
["useTooltip"] = false,
["xOffset"] = 0,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "UFKYfq7BLSF",
["keepAspectRatio"] = false,
["width"] = 36,
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["zoom"] = 0,
["auto"] = true,
["tocversion"] = 30404,
["id"] = "有限无敌药水",
["useCooldownModRate"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["desc"] = "",
["config"] = {
},
["inverse"] = true,
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
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["conditions"] = {
},
["cooldown"] = true,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
},
["副手磨刀石（致密/元素）"] = {
["iconSource"] = -1,
["parent"] = "近战药剂",
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["auranames"] = {
"猫鼬药剂",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "SPELL",
["use_weapon"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_showOn"] = true,
["use_itemName"] = true,
["use_unit"] = true,
["event"] = "Weapon Enchant",
["useName"] = true,
["spellIds"] = {
},
["unit"] = "player",
["showOn"] = "showOnActive",
["use_enchant"] = false,
["names"] = {
},
["weapon"] = "off",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 18262,
["use_count"] = true,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["use_includeCharges"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["unit"] = "player",
["names"] = {
},
["use_itemName"] = true,
["count"] = "1",
["unevent"] = "auto",
["use_exact_itemName"] = true,
["spellIds"] = {
},
["use_unit"] = true,
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["type"] = "item",
["use_itemTypeName"] = false,
["subeventSuffix"] = "",
["itemTypeName"] = {
["multi"] = {
[512] = true,
[519] = true,
[527] = true,
},
},
["use_genericShowOn"] = true,
["event"] = "Item Type Equipped",
["unit"] = "player",
["use_itemSlot"] = true,
["use_spellName"] = true,
["itemSlot"] = 17,
["use_itemName"] = true,
["genericShowOn"] = "showOnCooldown",
["subeventPrefix"] = "",
["use_track"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
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
["easeType"] = "none",
["duration_type"] = "seconds",
["preset"] = "pulse",
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
["customTextUpdateThrottle"] = 0.9999999999999999,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_text_format_1.p_time_mod_rate"] = true,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
["rotateText"] = "NONE",
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["text_text_format_p_time_legacy_floor"] = false,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_text_format_p_time_format"] = 1,
["type"] = "subtext",
["text_visible"] = false,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_text_format_p_time_precision"] = 1,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_text_format_p_time_mod_rate"] = true,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_legacy_floor"] = false,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_fontType"] = "OUTLINE",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_text_format_p_format"] = "timed",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_format"] = 0,
},
},
["height"] = 32,
["frameStrata"] = 1,
["load"] = {
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
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["pvp"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["none"] = true,
},
},
["use_not_itemequiped"] = false,
["use_zone"] = false,
["use_itemequiped"] = false,
["use_class"] = false,
["spec"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["use_itemtypeequipped"] = false,
["itemtypeequipped"] = {
["single"] = 517,
["multi"] = {
[512] = true,
[519] = true,
[527] = true,
},
},
},
["authorOptions"] = {
},
["useAdjustededMax"] = false,
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
["xOffset"] = 0,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["uid"] = "KTpo(USlywe",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["progressSource"] = {
-1,
"",
},
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["preferToUpdate"] = false,
["auto"] = true,
["cooldownTextDisabled"] = false,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "副手磨刀石（致密/元素）",
["customText"] = "\n\n",
["useCooldownModRate"] = true,
["width"] = 32,
["selfPoint"] = "CENTER",
["config"] = {
},
["inverse"] = false,
["cooldownEdge"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
{
["check"] = {
["trigger"] = 3,
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
["cooldown"] = false,
["internalVersion"] = 90,
},
["黑标美味朗姆酒"] = {
["iconSource"] = -1,
["xOffset"] = 0,
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["auranames"] = {
"25804",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["event"] = "Item Count",
["itemName"] = 21151,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["count"] = "1",
["unit"] = "player",
["use_itemName"] = true,
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_format"] = 0,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_format"] = "timed",
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
},
["height"] = 32,
["useCooldownModRate"] = true,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 81,
["multi"] = {
[81] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
},
},
["use_spellknown"] = false,
["zoneIds"] = "",
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["useAdjustededMax"] = false,
["customText"] = "\n\n",
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
["parent"] = "团本药剂",
["internalVersion"] = 90,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "Wwu1kRAhLqw",
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
["width"] = 32,
["alpha"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "黑标美味朗姆酒",
["url"] = "",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["adjustedMax"] = "",
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
["value"] = 1,
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
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["progressSource"] = {
-1,
"",
},
},
["赞扎之魂"] = {
["iconSource"] = -1,
["xOffset"] = 0,
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"24382",
},
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["event"] = "Item Count",
["itemName"] = 20079,
["names"] = {
},
["spellIds"] = {
},
["count"] = "1",
["use_itemName"] = true,
["use_unit"] = true,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
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
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_precision"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_text_format_p_format"] = "timed",
},
},
["height"] = 32,
["alpha"] = 1,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 81,
["multi"] = {
[81] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
["DRUID"] = true,
["PRIEST"] = true,
["PALADIN"] = true,
},
},
["use_spellknown"] = false,
["zoneIds"] = "",
},
["internalVersion"] = 90,
["useAdjustededMax"] = false,
["customText"] = "\n\n",
["parent"] = "团本药剂",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
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
["uid"] = "H043i(HTq)R",
["selfPoint"] = "CENTER",
["width"] = 32,
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "赞扎之魂",
["url"] = "",
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["preferToUpdate"] = false,
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
["value"] = 1,
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
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["progressSource"] = {
-1,
"",
},
},
["坚韧药剂"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["auranames"] = {
"3593",
},
["type"] = "aura2",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["itemName"] = 3825,
["names"] = {
},
["subeventPrefix"] = "SPELL",
["count"] = "1",
["unit"] = "player",
["event"] = "Item Count",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
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
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowLength"] = 10,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowThickness"] = 1,
["glowType"] = "Pixel",
["glow"] = false,
["glowXOffset"] = 0,
["glowDuration"] = 1,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text_format_1.p_time_legacy_floor"] = false,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_text_format_1.p_time_mod_rate"] = true,
["rotateText"] = "NONE",
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["text_text"] = "%1.p",
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["anchorXOffset"] = 0,
["text_text_format_p_time_format"] = 0,
["text_shadowXOffset"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -3,
["text_visible"] = true,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_p_format"] = "timed",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_mod_rate"] = true,
},
},
["height"] = 32,
["useCooldownModRate"] = true,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_zone"] = false,
["zoneIds"] = "",
["use_spellknown"] = false,
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
["WARLOCK"] = true,
["PRIEST"] = true,
},
},
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["party"] = true,
["flexible"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
},
["internalVersion"] = 90,
["useAdjustededMax"] = false,
["cooldownEdge"] = false,
["selfPoint"] = "CENTER",
["cooldown"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["value"] = "120",
["op"] = "<",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
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
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["parent"] = "团本药剂",
["preferToUpdate"] = false,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
["alpha"] = 1,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["cooldownTextDisabled"] = false,
["auto"] = true,
["tocversion"] = 11508,
["id"] = "坚韧药剂",
["icon"] = true,
["frameStrata"] = 1,
["width"] = 32,
["adjustedMin"] = "",
["uid"] = "wFCUiATr5it",
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
1,
},
},
["特效法力药水"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["parent"] = "法力药剂",
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
["use_remaining"] = false,
["type"] = "item",
["itemName"] = 13444,
["subeventSuffix"] = "_CAST_START",
["unit"] = "player",
["use_genericShowOn"] = true,
["event"] = "Cooldown Progress (Item)",
["subeventPrefix"] = "SPELL",
["duration"] = "1",
["unevent"] = "auto",
["spellIds"] = {
},
["use_itemName"] = true,
["use_unit"] = true,
["names"] = {
},
["genericShowOn"] = "showOnCooldown",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 13444,
["use_count"] = true,
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["use_exact_itemName"] = false,
["use_unit"] = true,
["unit"] = "player",
["spellIds"] = {
},
["use_itemName"] = true,
["names"] = {
},
["count"] = "1",
["unevent"] = "auto",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
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
["preset"] = "fade",
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
["version"] = 1,
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
["glowYOffset"] = 0,
["glowColor"] = {
0.615686297416687,
0.615686297416687,
0.615686297416687,
1,
},
["glowThickness"] = 1,
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = true,
["glowScale"] = 1,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -4,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["useTooltip"] = false,
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
["HUNTER"] = true,
["WARRIOR"] = true,
["PALADIN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["SHAMAN"] = true,
["ROGUE"] = true,
},
},
["itemtypeequipped"] = {
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["useAdjustededMax"] = false,
["desaturate"] = false,
["source"] = "import",
["cooldown"] = true,
["selfPoint"] = "CENTER",
["color"] = {
1,
1,
1,
1,
},
["authorOptions"] = {
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["xOffset"] = 0,
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "特效法力药水",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 36,
["adjustedMax"] = "",
["uid"] = "ExXeG0RqLPY",
["inverse"] = true,
["url"] = "",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["keepAspectRatio"] = false,
},
["法力药剂"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"特效法力药水",
"恶魔符文",
"黑暗符文",
"法力红宝石",
"法力黄水晶",
"法力翡翠",
"特效活力药水",
"超强法力药水",
"夜龙之息",
},
["xOffset"] = 3,
["preferToUpdate"] = true,
["groupIcon"] = 236871,
["anchorPoint"] = "BOTTOMLEFT",
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
["selfPoint"] = "TOPLEFT",
["desc"] = "",
["stagger"] = 0,
["load"] = {
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["class"] = {
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
["animate"] = false,
["customGrow"] = "\n\n",
["scale"] = 1,
["customAnchor"] = "function()\n    if ElvUI then\n        return ElvUF_Player\n    elseif NDui then\n        return oUF_Player\n    else\n        return UIParent\n    end\nend",
["regionType"] = "dynamicgroup",
["constantFactor"] = "RADIUS",
["borderOffset"] = 4,
["tocversion"] = 30404,
["alpha"] = 1,
["borderInset"] = 1,
["grow"] = "GRID",
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "GNLFqMh9Z",
["parent"] = "药剂组",
["sortHybridTable"] = {
["强效火焰防护药水"] = false,
["超强法力药水"] = false,
["有限无敌药水"] = false,
["自由行动药剂"] = false,
["强效冰霜防护药水"] = false,
["强效自然防护药水"] = false,
["菊花茶"] = false,
["强效暗影防护药水"] = false,
["暴怒药水"] = false,
["特效治疗药水"] = false,
["特效活力药水"] = false,
["强效石盾药水"] = false,
["特效法力药水"] = false,
["黑暗符文"] = false,
["强效奥术防护药水"] = false,
["恶魔符文"] = false,
["强效怒气药水"] = false,
},
["fullCircle"] = true,
["useAnchorPerUnit"] = false,
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
["useLimit"] = true,
["align"] = "CENTER",
["version"] = 1,
["subRegions"] = {
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["source"] = "import",
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["authorOptions"] = {
},
["borderSize"] = 2,
["sort"] = "none",
["anchorFrameFrame"] = "GwTargetUnitFrame",
["gridType"] = "RD",
["config"] = {
},
["anchorFrameParent"] = false,
["stepAngle"] = 15,
["yOffset"] = -70,
["uid"] = "8AUgig)vXN0",
["semver"] = "1.0.0",
["rotation"] = 0,
["id"] = "法力药剂",
["frameStrata"] = 1,
["gridWidth"] = 8,
["anchorFrameType"] = "SELECTFRAME",
["space"] = 2,
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
["anchorPerUnit"] = "CUSTOM",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["limit"] = 8,
},
["恶魔符文"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["parent"] = "法力药剂",
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
["itemName"] = 12662,
["use_remaining"] = false,
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_unit"] = true,
["use_itemName"] = true,
["spellIds"] = {
},
["unevent"] = "auto",
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["event"] = "Cooldown Progress (Item)",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 12662,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["use_itemName"] = true,
["use_exact_itemName"] = false,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["count"] = "1",
["event"] = "Item Count",
["unit"] = "player",
["subeventSuffix"] = "_CAST_START",
["use_unit"] = true,
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
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
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "",
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
["glowDuration"] = 1,
["glowType"] = "Pixel",
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0.615686297416687,
0.615686297416687,
0.615686297416687,
1,
},
["glowLength"] = 10,
["type"] = "subglow",
["glowScale"] = 1,
["useGlowColor"] = true,
["glowXOffset"] = 0,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["authorOptions"] = {
},
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
["HUNTER"] = true,
["WARRIOR"] = true,
["ROGUE"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["SHAMAN"] = true,
},
},
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["use_ignoreNameRealm"] = false,
["use_item_bonusid_equipped"] = false,
["itemtypeequipped"] = {
},
},
["progressSource"] = {
-1,
"",
},
["useAdjustededMax"] = false,
["selfPoint"] = "CENTER",
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["internalVersion"] = 90,
["adjustedMax"] = "",
["xOffset"] = 0,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "7wosvDrn)ce",
["cooldownEdge"] = true,
["width"] = 36,
["alpha"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["zoom"] = 0.3,
["auto"] = true,
["tocversion"] = 30404,
["id"] = "恶魔符文",
["useCooldownModRate"] = true,
["frameStrata"] = 1,
["anchorFrameType"] = "SCREEN",
["color"] = {
1,
1,
1,
1,
},
["config"] = {
},
["inverse"] = true,
["desaturate"] = false,
["conditions"] = {
},
["cooldown"] = true,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
},
["战斗药剂"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"自由行动药剂",
"有限无敌药水",
"强效怒气药水",
"暴怒药水",
"强效石盾药水",
"菊花茶",
"沙漏",
},
["xOffset"] = 150,
["preferToUpdate"] = true,
["yOffset"] = 0,
["gridType"] = "HV",
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
["finish"] = {
},
["init"] = {
},
},
["selfPoint"] = "CENTER",
["desc"] = "",
["stagger"] = 0,
["load"] = {
["talent"] = {
["multi"] = {
},
},
["size"] = {
["multi"] = {
},
},
["class"] = {
["multi"] = {
},
},
["spec"] = {
["multi"] = {
},
},
["zoneIds"] = "",
},
["animate"] = false,
["customGrow"] = "\n\n",
["scale"] = 1,
["customAnchor"] = "function()\n    if ElvUI then\n        return ElvUF_Player\n    elseif NDui then\n        return oUF_Player\n    else\n        return UIParent\n    end\nend",
["stepAngle"] = 15,
["constantFactor"] = "RADIUS",
["borderOffset"] = 4,
["tocversion"] = 30404,
["alpha"] = 1,
["borderInset"] = 1,
["grow"] = "GRID",
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "GNLFqMh9Z",
["parent"] = "药剂组",
["sortHybridTable"] = {
["法力翡翠"] = false,
["强效火焰防护药水"] = false,
["暴怒药水"] = false,
["有限无敌药水"] = false,
["自由行动药剂"] = false,
["强效怒气药水"] = false,
["强效石盾药水"] = false,
["菊花茶"] = false,
["强效暗影防护药水"] = false,
["强效冰霜防护药水"] = false,
["法力红宝石"] = false,
["强效自然防护药水"] = false,
["特效治疗药水"] = false,
["黑暗符文"] = false,
["超强法力药水"] = false,
["特效活力药水"] = false,
["特效法力药水"] = false,
["强效奥术防护药水"] = false,
["法力黄水晶"] = false,
["恶魔符文"] = false,
},
["fullCircle"] = true,
["useAnchorPerUnit"] = false,
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
["internalVersion"] = 90,
["useLimit"] = true,
["align"] = "CENTER",
["version"] = 1,
["subRegions"] = {
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["source"] = "import",
["centerType"] = "LR",
["border"] = false,
["anchorFrameFrame"] = "GwPlayerUnitFrame",
["limit"] = 8,
["borderSize"] = 2,
["sort"] = "none",
["regionType"] = "dynamicgroup",
["anchorPoint"] = "TOPRIGHT",
["authorOptions"] = {
},
["anchorFrameParent"] = true,
["anchorPerUnit"] = "CUSTOM",
["groupIcon"] = 236871,
["config"] = {
},
["semver"] = "1.0.0",
["borderEdge"] = "Square Full White",
["id"] = "战斗药剂",
["frameStrata"] = 1,
["gridWidth"] = 8,
["anchorFrameType"] = "SELECTFRAME",
["rowSpace"] = 1,
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
["rotation"] = 0,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["uid"] = "xTvgqumoIwP",
},
["精炼智慧合剂"] = {
["iconSource"] = -1,
["parent"] = "法系药剂",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["names"] = {
},
["spellIds"] = {
},
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["auranames"] = {
"17627",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["itemName"] = 13511,
["names"] = {
},
["count"] = "1",
["spellIds"] = {
},
["use_itemName"] = true,
["unit"] = "player",
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_shadowXOffset"] = 0,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
},
},
["height"] = 32,
["alpha"] = 1,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["DRUID"] = true,
["PRIEST"] = true,
["PALADIN"] = true,
},
},
["use_spellknown"] = false,
["zoneIds"] = "",
},
["color"] = {
1,
1,
1,
1,
},
["useAdjustededMax"] = false,
["icon"] = true,
["keepAspectRatio"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["internalVersion"] = 90,
["customText"] = "\n\n",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "9R6sRPS5Las",
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
["width"] = 32,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "精炼智慧合剂",
["adjustedMax"] = "",
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["config"] = {
},
["inverse"] = false,
["url"] = "",
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["authorOptions"] = {
},
},
["强效冰霜防护药水"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["xOffset"] = 0,
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
["type"] = "item",
["itemName"] = 13456,
["subeventSuffix"] = "_CAST_START",
["names"] = {
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_unit"] = true,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["event"] = "Cooldown Progress (Item)",
["unevent"] = "auto",
["duration"] = "1",
["use_itemName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 13456,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["use_exact_itemName"] = true,
["unevent"] = "auto",
["names"] = {
},
["spellIds"] = {
},
["use_itemName"] = true,
["use_unit"] = true,
["count"] = "1",
["subeventPrefix"] = "SPELL",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
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
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowScale"] = 1,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["url"] = "https://afdian.com/a/Rurutia",
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
["HUNTER"] = true,
["WARRIOR"] = true,
["PALADIN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["SHAMAN"] = true,
["ROGUE"] = true,
},
},
["itemtypeequipped"] = {
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
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
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["source"] = "import",
["cooldown"] = true,
["parent"] = "生命药剂",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["internalVersion"] = 90,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["authorOptions"] = {
},
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "强效冰霜防护药水",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 36,
["progressSource"] = {
-1,
"",
},
["uid"] = "hvD)VFQubqM",
["inverse"] = true,
["desc"] = "by 露露緹婭@Bilibili。\n\n转载请保留出处。",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["adjustedMax"] = "",
},
["强效奥法药剂"] = {
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
["customTextUpdate"] = "update",
["cooldownEdge"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["auranames"] = {
"17539",
},
["event"] = "Health",
["names"] = {
},
["spellIds"] = {
},
["unit"] = "player",
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["subeventSuffix"] = "_CAST_START",
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["event"] = "Item Count",
["itemName"] = 13454,
["subeventSuffix"] = "_CAST_START",
["count"] = "1",
["spellIds"] = {
},
["subeventPrefix"] = "SPELL",
["use_itemName"] = true,
["use_unit"] = true,
["names"] = {
},
["count_operator"] = ">=",
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
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_1.p_time_legacy_floor"] = false,
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_time_mod_rate"] = true,
["text_text_format_p_time_legacy_floor"] = false,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_text_format_p_time_precision"] = 1,
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_visible"] = true,
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["anchorYOffset"] = 0,
},
},
["height"] = 32,
["frameStrata"] = 1,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
["WARLOCK"] = true,
["PRIEST"] = true,
},
},
["use_spellknown"] = false,
["zoneIds"] = "",
},
["selfPoint"] = "CENTER",
["useAdjustededMax"] = false,
["customText"] = "\n\n",
["useTooltip"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["authorOptions"] = {
},
["progressSource"] = {
-1,
"",
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "k0fuEO)0RhZ",
["icon"] = true,
["width"] = 32,
["useCooldownModRate"] = true,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "强效奥法药剂",
["preferToUpdate"] = false,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["parent"] = "法系药剂",
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["url"] = "",
},
["菊花茶"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["xOffset"] = 0,
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
["itemName"] = 7676,
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_unit"] = true,
["names"] = {
},
["spellIds"] = {
},
["event"] = "Cooldown Progress (Item)",
["unevent"] = "auto",
["duration"] = "1",
["use_itemName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 7676,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["use_exact_itemName"] = true,
["unevent"] = "auto",
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["use_itemName"] = true,
["unit"] = "player",
["count"] = "1",
["use_unit"] = true,
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
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
["preset"] = "fade",
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
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
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
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = false,
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["desaturate"] = false,
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
["HUNTER"] = true,
["WARRIOR"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["ROGUE"] = true,
["PALADIN"] = true,
},
},
["itemtypeequipped"] = {
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["useAdjustededMax"] = false,
["parent"] = "战斗药剂",
["source"] = "import",
["cooldown"] = true,
["keepAspectRatio"] = false,
["url"] = "",
["color"] = {
1,
1,
1,
1,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["authorOptions"] = {
},
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "菊花茶",
["frameStrata"] = 1,
["alpha"] = 1,
["width"] = 36,
["useTooltip"] = false,
["uid"] = "P02gajzeu0k",
["inverse"] = true,
["adjustedMax"] = "",
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["selfPoint"] = "CENTER",
},
["沙漏"] = {
["iconSource"] = 2,
["wagoID"] = "GNLFqMh9Z",
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
["itemName"] = 5634,
["duration"] = "1",
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["debuffType"] = "HARMFUL",
["type"] = "aura2",
["unevent"] = "auto",
["use_unit"] = true,
["event"] = "Cooldown Progress (Item)",
["unit"] = "player",
["use_genericShowOn"] = true,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["useName"] = false,
["useExactSpellId"] = true,
["auraspellids"] = {
"23170",
},
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 19183,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["use_itemName"] = true,
["use_exact_itemName"] = true,
["subeventPrefix"] = "SPELL",
["spellIds"] = {
},
["count"] = "1",
["use_unit"] = true,
["event"] = "Item Count",
["unit"] = "player",
["unevent"] = "auto",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "all",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
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
["type"] = "none",
["easeStrength"] = 3,
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "",
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
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
["type"] = "subglow",
["glowScale"] = 1,
["useGlowColor"] = false,
["glowXOffset"] = 0,
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
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 12,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["xOffset"] = 0,
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
["HUNTER"] = true,
["WARRIOR"] = true,
["SHAMAN"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["ROGUE"] = true,
["PALADIN"] = true,
},
},
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["spec"] = {
["multi"] = {
},
},
["use_ignoreNameRealm"] = false,
["use_item_bonusid_equipped"] = false,
["itemtypeequipped"] = {
},
},
["authorOptions"] = {
},
["useAdjustededMax"] = false,
["preferToUpdate"] = true,
["source"] = "import",
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["selfPoint"] = "CENTER",
["keepAspectRatio"] = false,
["url"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "g4o9Y3tieD3",
["desaturate"] = false,
["width"] = 36,
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["zoom"] = 0,
["auto"] = true,
["tocversion"] = 30404,
["id"] = "沙漏",
["useCooldownModRate"] = true,
["alpha"] = 1,
["anchorFrameType"] = "SCREEN",
["parent"] = "战斗药剂",
["config"] = {
},
["inverse"] = false,
["internalVersion"] = 90,
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
},
},
},
["cooldown"] = true,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
},
["暗影之力药剂"] = {
["iconSource"] = -1,
["color"] = {
1,
1,
1,
1,
},
["adjustedMax"] = "",
["customText"] = "\n\n",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["auranames"] = {
"11474",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["event"] = "Item Count",
["itemName"] = 9264,
["subeventSuffix"] = "_CAST_START",
["count"] = "1",
["spellIds"] = {
},
["unit"] = "player",
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["names"] = {
},
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
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
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_p_format"] = "timed",
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowXOffset"] = 0,
["text_text_format_p_time_format"] = 0,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_text_format_p_time_mod_rate"] = true,
},
},
["height"] = 32,
["alpha"] = 1,
["load"] = {
["use_never"] = false,
["talent"] = {
["single"] = 92,
["multi"] = {
[92] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["WARLOCK"] = true,
["PRIEST"] = true,
},
},
["use_spellknown"] = false,
["use_exact_spellknown"] = true,
["spellknown"] = 12,
["zoneIds"] = "",
},
["authorOptions"] = {
},
["useAdjustededMax"] = false,
["preferToUpdate"] = false,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["cooldownEdge"] = false,
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
["uid"] = "o4qnWrekmr4",
["adjustedMin"] = "",
["width"] = 32,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "暗影之力药剂",
["progressSource"] = {
-1,
"",
},
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["xOffset"] = 0,
["config"] = {
},
["inverse"] = false,
["internalVersion"] = 90,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["parent"] = "法系药剂",
},
["魂能之击"] = {
["iconSource"] = -1,
["parent"] = "近战药剂",
["preferToUpdate"] = false,
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["auranames"] = {
"16329",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["itemName"] = 12460,
["use_unit"] = true,
["count"] = "1",
["spellIds"] = {
},
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
["names"] = {
},
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_shadowXOffset"] = 0,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
},
},
["height"] = 32,
["alpha"] = 1,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_class"] = false,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["WARRIOR"] = true,
["ROGUE"] = true,
},
},
["use_spellknown"] = false,
["zoneIds"] = "",
},
["icon"] = true,
["useAdjustededMax"] = false,
["keepAspectRatio"] = false,
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
["customText"] = "\n\n",
["adjustedMax"] = "",
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "5BMV63nCdMI",
["internalVersion"] = 90,
["width"] = 32,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "魂能之击",
["authorOptions"] = {
},
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["cooldownEdge"] = false,
},
["强效火焰防护药水"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
["authorOptions"] = {
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["url"] = "https://afdian.com/a/Rurutia",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["itemName"] = 13457,
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["unit"] = "player",
["use_unit"] = true,
["names"] = {
},
["spellIds"] = {
},
["event"] = "Cooldown Progress (Item)",
["unevent"] = "auto",
["duration"] = "1",
["use_itemName"] = true,
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 13457,
["use_count"] = true,
["duration"] = "1",
["use_unit"] = true,
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["use_exact_itemName"] = true,
["unevent"] = "auto",
["unit"] = "player",
["spellIds"] = {
},
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["count"] = "1",
["names"] = {
},
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
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
["preset"] = "fade",
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
["desc"] = "by 露露緹婭@Bilibili。\n\n转载请保留出处。",
["version"] = 1,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["glow"] = false,
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
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowScale"] = 1,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_anchorYOffset"] = -4,
["text_shadowYOffset"] = 0,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 36,
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
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
["HUNTER"] = true,
["WARRIOR"] = true,
["ROGUE"] = true,
["MAGE"] = true,
["PRIEST"] = true,
["WARLOCK"] = true,
["DRUID"] = true,
["PALADIN"] = true,
["SHAMAN"] = true,
},
},
["itemtypeequipped"] = {
},
["raid_role"] = {
},
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["zoneIds"] = "",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
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
["cooldown"] = true,
["parent"] = "生命药剂",
["cooldownEdge"] = true,
["xOffset"] = 0,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["useTooltip"] = false,
["anchorFrameType"] = "SCREEN",
["frameStrata"] = 1,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "强效火焰防护药水",
["alpha"] = 1,
["useCooldownModRate"] = true,
["width"] = 36,
["keepAspectRatio"] = false,
["uid"] = "(ZHqmjTQ5ea",
["inverse"] = true,
["desaturate"] = false,
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["preferToUpdate"] = true,
},
["魔法肉桂面包"] = {
["iconSource"] = -1,
["wagoID"] = "GNLFqMh9Z",
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
["itemName"] = 13724,
["auranames"] = {
"喝水",
},
["use_genericShowOn"] = true,
["genericShowOn"] = "showOnCooldown",
["names"] = {
},
["debuffType"] = "HELPFUL",
["useName"] = false,
["unevent"] = "auto",
["auraspellids"] = {
"29073",
},
["event"] = "Cooldown Progress (Item)",
["use_unit"] = true,
["useExactSpellId"] = true,
["subeventSuffix"] = "_CAST_START",
["spellIds"] = {
},
["type"] = "aura2",
["unit"] = "player",
["duration"] = "1",
["subeventPrefix"] = "SPELL",
["use_itemName"] = true,
},
["untrigger"] = {
},
},
{
["trigger"] = {
["itemName"] = 22895,
["use_count"] = true,
["duration"] = "1",
["names"] = {
},
["debuffType"] = "HELPFUL",
["type"] = "item",
["unevent"] = "auto",
["event"] = "Item Count",
["use_exact_itemName"] = true,
["use_unit"] = true,
["unit"] = "player",
["spellIds"] = {
},
["use_itemName"] = true,
["count"] = "1",
["subeventSuffix"] = "_CAST_START",
["subeventPrefix"] = "SPELL",
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "custom",
["customTriggerLogic"] = "function(t)\n    return t[2]\nend",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["keepAspectRatio"] = false,
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
["easeStrength"] = 3,
["type"] = "none",
["duration_type"] = "seconds",
["easeType"] = "none",
},
},
["desc"] = "",
["version"] = 1,
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
["glowYOffset"] = 0,
["glowColor"] = {
1,
1,
1,
1,
},
["glowThickness"] = 1,
["type"] = "subglow",
["glowXOffset"] = 0,
["useGlowColor"] = false,
["glowScale"] = 1,
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
["type"] = "subtext",
["text_anchorXOffset"] = 4,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "Rurutia",
["text_shadowYOffset"] = 0,
["text_anchorYOffset"] = -4,
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
},
["height"] = 35,
["authorOptions"] = {
},
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
["HUNTER"] = true,
["WARRIOR"] = true,
["WARLOCK"] = true,
["ROGUE"] = true,
["PALADIN"] = true,
["DRUID"] = true,
["SHAMAN"] = true,
["PRIEST"] = true,
},
},
["itemtypeequipped"] = {
},
["raid_role"] = {
},
["use_class"] = false,
["use_zone"] = false,
["ignoreNameRealm"] = "夏尔",
["use_ignoreNameRealm"] = false,
["spec"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["use_item_bonusid_equipped"] = false,
["size"] = {
["single"] = "fortyman",
["multi"] = {
["fortyman"] = true,
},
},
},
["desaturate"] = false,
["useAdjustededMax"] = false,
["parent"] = "吃喝&其他",
["source"] = "import",
["cooldown"] = true,
["progressSource"] = {
-1,
"",
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
},
["internalVersion"] = 90,
["useAdjustededMin"] = false,
["regionType"] = "icon",
["config"] = {
},
["adjustedMax"] = "",
["anchorFrameType"] = "SCREEN",
["useCooldownModRate"] = true,
["anchorFrameParent"] = false,
["zoom"] = 0.3,
["auto"] = true,
["cooldownTextDisabled"] = false,
["semver"] = "1.0.0",
["tocversion"] = 30404,
["id"] = "魔法肉桂面包",
["alpha"] = 1,
["frameStrata"] = 1,
["width"] = 35,
["url"] = "",
["uid"] = "WYj4)s7BYaJ",
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
["团本药剂"] = {
["arcLength"] = 360,
["controlledChildren"] = {
"泰坦合剂",
"坚韧药剂",
"超强防御药剂",
"黑标美味朗姆酒",
"戈多克绿酒",
"克雷格的烈酒",
"赞扎之魂",
"赞扎之速",
"阿尔萨斯的礼物",
"嫩狼肉排",
"魂能之寒",
"魂能之灰",
},
["xOffset"] = 40,
["preferToUpdate"] = false,
["groupIcon"] = "236871",
["gridType"] = "RD",
["borderColor"] = {
0,
0,
0,
1,
},
["space"] = 2,
["url"] = "https://wago.io/y7qMWv4rn/8",
["actions"] = {
["start"] = {
},
["init"] = {
},
["finish"] = {
},
},
["selfPoint"] = "TOPLEFT",
["desc"] = "",
["rotation"] = 0,
["load"] = {
["talent"] = {
["multi"] = {
},
},
["zoneIds"] = "",
["class"] = {
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
["animate"] = false,
["customGrow"] = "\n\n",
["scale"] = 1,
["customAnchor"] = "function()\n    if ElvUI then\n        return ElvUF_Player\n    elseif NDui then\n        return oUF_Player\n    else\n        return UIParent\n    end\nend",
["regionType"] = "dynamicgroup",
["constantFactor"] = "RADIUS",
["borderOffset"] = 4,
["tocversion"] = 11508,
["alpha"] = 1,
["borderInset"] = 1,
["grow"] = "GRID",
["borderBackdrop"] = "Blizzard Tooltip",
["wagoID"] = "GNLFqMh9Z",
["parent"] = "药剂组",
["sortHybridTable"] = {
["烤鱿鱼"] = false,
["魔血药水"] = false,
["泰坦合剂"] = false,
["附魔主手"] = false,
["特效法力药水 "] = false,
["巨人药剂 "] = false,
["暗影防护药水"] = false,
["有限无敌药水 "] = false,
["精炼智慧合剂"] = false,
["沙漠丸子 "] = false,
["强效敏捷药剂"] = false,
["强效怒气药水 "] = false,
["沙漏"] = false,
["沙漠肉丸子"] = false,
["美味风蛇 "] = false,
["魂能之击"] = false,
["冰霜之力药剂"] = false,
["绷带 "] = false,
["夜鳞鱼汤"] = false,
["元素磨刀石"] = false,
["暗影之力药剂"] = false,
["洛恩塔姆薯块"] = false,
["冬泉火酒"] = false,
["超级能量合剂"] = false,
["夜龙之息"] = false,
["爆怒药水"] = false,
["怒气药水 "] = false,
["强效奥法药剂"] = false,
["作战法力药水"] = false,
["强效敏捷药剂 "] = false,
["龙息红椒"] = false,
["神圣太阳果"] = false,
["火力药剂 "] = false,
["自由行动药水"] = false,
["黑标美味朗姆酒"] = false,
["魔法晶水"] = false,
["阿尔萨斯的礼物"] = false,
["作战治疗药水"] = false,
["特效治疗石 "] = false,
["强效火力药剂"] = false,
["迅捷药水 "] = false,
["魂能之力"] = false,
["泰坦合剂 "] = false,
["猫鼬药剂 "] = false,
["自然防护药水"] = false,
},
["fullCircle"] = true,
["useAnchorPerUnit"] = false,
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
["useLimit"] = true,
["align"] = "CENTER",
["growOn"] = "changed",
["version"] = 1,
["subRegions"] = {
},
["backdropColor"] = {
1,
1,
1,
0.5,
},
["source"] = "import",
["centerType"] = "LR",
["border"] = false,
["borderEdge"] = "Square Full White",
["limit"] = 8,
["borderSize"] = 2,
["sort"] = "none",
["config"] = {
},
["stepAngle"] = 15,
["uid"] = "IFgpBaNAR7j",
["anchorFrameParent"] = true,
["authorOptions"] = {
},
["anchorPoint"] = "BOTTOMLEFT",
["anchorFrameFrame"] = "GwPlayerUnitFrame",
["semver"] = "1.0.0",
["yOffset"] = -30,
["id"] = "团本药剂",
["gridWidth"] = 8,
["frameStrata"] = 1,
["anchorFrameType"] = "SELECTFRAME",
["stagger"] = 0,
["rowSpace"] = 1,
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
["conditions"] = {
},
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["anchorPerUnit"] = "CUSTOM",
},
["泰坦合剂"] = {
["iconSource"] = -1,
["authorOptions"] = {
},
["adjustedMax"] = "",
["adjustedMin"] = "",
["yOffset"] = 0,
["anchorPoint"] = "CENTER",
["cooldownSwipe"] = true,
["customTextUpdate"] = "update",
["url"] = "",
["icon"] = true,
["triggers"] = {
{
["trigger"] = {
["useName"] = true,
["subeventSuffix"] = "_CAST_START",
["event"] = "Health",
["unit"] = "player",
["spellIds"] = {
},
["names"] = {
},
["subeventPrefix"] = "SPELL",
["type"] = "aura2",
["auranames"] = {
"17626",
},
["debuffType"] = "HELPFUL",
},
["untrigger"] = {
},
},
{
["trigger"] = {
["use_exact_itemName"] = true,
["use_count"] = true,
["duration"] = "1",
["unit"] = "player",
["debuffType"] = "HELPFUL",
["type"] = "item",
["subeventSuffix"] = "_CAST_START",
["event"] = "Item Count",
["itemName"] = 13510,
["use_unit"] = true,
["count"] = "1",
["spellIds"] = {
},
["use_itemName"] = true,
["subeventPrefix"] = "SPELL",
["unevent"] = "auto",
["names"] = {
},
["count_operator"] = ">=",
},
["untrigger"] = {
},
},
["disjunctive"] = "any",
["customTriggerLogic"] = "",
["activeTriggerMode"] = -10,
},
["useTooltip"] = false,
["progressSource"] = {
-1,
"",
},
["selfPoint"] = "CENTER",
["desaturate"] = false,
["version"] = 8,
["subRegions"] = {
{
["type"] = "subbackground",
},
{
["glowFrequency"] = 0.25,
["type"] = "subglow",
["useGlowColor"] = true,
["glowScale"] = 1,
["glowThickness"] = 1,
["glowYOffset"] = 0,
["glowColor"] = {
0,
1,
0,
1,
},
["glowLength"] = 10,
["glowType"] = "Pixel",
["glowDuration"] = 1,
["glowXOffset"] = 0,
["glow"] = false,
["glowLines"] = 8,
["glowBorder"] = false,
},
{
["text_shadowXOffset"] = 0,
["text_text"] = "%1.p",
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_text_format_1.p_time_format"] = 1,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["text_text_format_1.p_time_precision"] = 1,
["rotateText"] = "NONE",
["text_text_format_1.p_time_mod_rate"] = true,
["text_text_format_1.p_time_legacy_floor"] = false,
["type"] = "subtext",
["text_anchorXOffset"] = 0,
["text_color"] = {
1,
0.8196079134941101,
0,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = 0,
["text_shadowYOffset"] = 0,
["text_text_format_1.p_time_dynamic_threshold"] = 0,
["text_wordWrap"] = "WordWrap",
["text_fontType"] = "OUTLINE",
["text_text_format_1.p_format"] = "timed",
["text_visible"] = false,
["anchor_point"] = "CENTER",
["text_fontSize"] = 14,
["anchorXOffset"] = 0,
["text_text_format_1.s_format"] = "none",
},
{
["text_text_format_p_time_format"] = 0,
["text_text"] = "%2.s",
["text_text_format_p_time_mod_rate"] = true,
["text_selfPoint"] = "AUTO",
["text_automaticWidth"] = "Auto",
["text_fixedWidth"] = 64,
["text_shadowXOffset"] = 0,
["anchorYOffset"] = 0,
["text_justify"] = "CENTER",
["rotateText"] = "NONE",
["text_text_format_p_time_dynamic_threshold"] = 60,
["text_shadowColor"] = {
0,
0,
0,
1,
},
["text_text_format_p_time_precision"] = 1,
["type"] = "subtext",
["text_anchorXOffset"] = 3,
["text_color"] = {
1,
1,
1,
1,
},
["text_font"] = "默认",
["text_anchorYOffset"] = -3,
["text_shadowYOffset"] = 0,
["text_text_format_p_format"] = "timed",
["text_wordWrap"] = "WordWrap",
["text_visible"] = true,
["text_fontType"] = "OUTLINE",
["text_text_format_2.s_format"] = "none",
["anchor_point"] = "INNER_BOTTOMRIGHT",
["text_fontSize"] = 13,
["anchorXOffset"] = 0,
["text_text_format_p_time_legacy_floor"] = false,
},
},
["height"] = 32,
["alpha"] = 1,
["load"] = {
["talent2"] = {
["single"] = 52,
["multi"] = {
[52] = true,
},
},
["use_never"] = false,
["talent"] = {
["single"] = 12,
["multi"] = {
[12] = true,
},
},
["spec"] = {
["multi"] = {
},
},
["talent_extraOption"] = 1,
["use_zone"] = false,
["size"] = {
["single"] = "party",
["multi"] = {
["scenario"] = true,
["ten"] = true,
["twentyfive"] = true,
["fortyman"] = true,
["flexible"] = true,
["party"] = true,
["arena"] = true,
["twenty"] = true,
["pvp"] = true,
},
},
["class"] = {
["single"] = "WARRIOR",
["multi"] = {
["MAGE"] = true,
["WARLOCK"] = true,
["PRIEST"] = true,
},
},
["use_spellknown"] = false,
["zoneIds"] = "",
},
["actions"] = {
["start"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    if not _G[e.id..\"Button\"] then
        local region = WeakAuras.GetRegion(e.id)
        if region then
            local btn = CreateFrame(\"Button\", e.id..\"Button\", region, \"SecureActionButtonTemplate\")
            btn:SetAllPoints(region)
            btn:RegisterForClicks(\"LeftButtonUp\", \"RightButtonUp\")
            btn:SetAttribute(\"type1\", \"macro\")
            btn:SetAttribute(\"type2\", \"macro\")
            btn:SetAttribute(\"macrotext1\", \"/use \"..e.id)
            btn:SetAttribute(\"macrotext2\", \"/use \"..e.id)
            btn:SetScript(\"OnEnter\", function(self)
                GameTooltip:SetOwner(self, \"ANCHOR_RIGHT\")
                GameTooltip:SetText(\"|r\"..e.id..\"\n\", 0, 1, 0, 1, 1)
            end)
            btn:SetScript(\"OnLeave\", function(self) GameTooltip:Hide() end)
        end
    end
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Show()
    end
end",
["do_custom"] = true,
},
["init"] = {
["custom"] = "",
["do_custom"] = false,
},
["finish"] = {
["custom"] = "local e = aura_env
if not InCombatLockdown() then
    local btn = _G[e.id..\"Button\"]
    if btn then
        btn:Hide()
    end
end",
["do_custom"] = true,
},
},
["useAdjustededMax"] = false,
["parent"] = "团本药剂",
["keepAspectRatio"] = false,
["information"] = {
["showNilIsFalse"] = true,
["forceEvents"] = true,
["ignoreOptionsEventErrors"] = true,
},
["displayIcon"] = "",
["xOffset"] = 0,
["color"] = {
1,
1,
1,
1,
},
["useAdjustededMin"] = false,
["regionType"] = "icon",
["uid"] = "yLr8AL(QhsW",
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
["width"] = 32,
["frameStrata"] = 1,
["cooldownTextDisabled"] = false,
["auto"] = true,
["zoom"] = 0.3,
["semver"] = "1.0.7",
["tocversion"] = 11508,
["id"] = "泰坦合剂",
["internalVersion"] = 90,
["useCooldownModRate"] = true,
["anchorFrameType"] = "SCREEN",
["customText"] = "\n\n",
["config"] = {
},
["inverse"] = false,
["preferToUpdate"] = false,
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
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "120",
},
["changes"] = {
{
["value"] = "buttonOverlay",
["property"] = "sub.2.glowType",
},
{
["value"] = {
1,
0.8196079134941101,
0,
1,
},
["property"] = "sub.2.glowColor",
},
{
["value"] = true,
["property"] = "sub.3.text_visible",
},
},
},
{
["check"] = {
["trigger"] = 1,
["variable"] = "expirationTime",
["op"] = "<",
["value"] = "60",
},
["changes"] = {
{
["value"] = {
1,
0,
0,
1,
},
["property"] = "sub.2.glowColor",
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
["cooldown"] = false,
["cooldownEdge"] = false,
},
},
}
