#!/bin/sh
set -eu

settings_file="Modules/Settings/Settings.lua"
hide_native_file="Modules/Settings/HideNativeSettings.lua"
resources_file="Modules/UnitFrames/PlayerResources.lua"
petbar_file="../GW2_UI/Games/Shared/Units/petbar.lua"

grep -F 'local function HideNativePlayerSettings(settingsTab, embeddedPanels)' "$hide_native_file" >/dev/null
grep -F 'if data.itemData ~= playerParent and data.parent ~= playerParent then' "$hide_native_file" >/dev/null
grep -F 'HideNativePlayerSettings(settingsTab, embeddedPanels)' "$hide_native_file" >/dev/null
grep -F 'local function HideNativeRaidSettings(settingsTab, embeddedPanels, provider)' "$hide_native_file" >/dev/null
grep -F 'raid_general = true,' "$hide_native_file" >/dev/null
grep -F 'if data.itemData ~= raidParent and data.parent ~= raidParent then' "$hide_native_file" >/dev/null
grep -F 'HideNativeRaidSettings(settingsTab, embeddedPanels, provider)' "$hide_native_file" >/dev/null
if grep -F 'NATIVE_UNITFRAME_PANEL_IDS' "$hide_native_file" >/dev/null; then
    exit 1
fi
if grep -F 'HideNativeUnitFrameSettings' "$hide_native_file" >/dev/null; then
    exit 1
fi
if grep -F 'unitframes_general' "$settings_file" >/dev/null; then
    exit 1
fi
grep -F 'player_general = {header = "玩家", breadcrumb = "综合", sub = "编辑玩家设置。"}' "$settings_file" >/dev/null
grep -F 'target_general = {header = "目标", breadcrumb = "综合", sub = "编辑目标设置。"}' "$settings_file" >/dev/null
grep -F 'target_of_target_general = {' "$settings_file" >/dev/null
grep -F 'target_of_target_fader = {' "$settings_file" >/dev/null
grep -F 'pet_general = {' "$settings_file" >/dev/null
grep -F 'pet_happiness = {' "$settings_file" >/dev/null
grep -F 'pet_feed = {' "$settings_file" >/dev/null
grep -F 'pet_fader = {' "$settings_file" >/dev/null
grep -F 'pet_aura = {' "$settings_file" >/dev/null
grep -F '"宠物", "pet_general", true, "pet"' "$settings_file" >/dev/null
grep -F '{"综合", "pet_general"}' "$settings_file" >/dev/null
grep -F '{"欢乐度", "pet_happiness"}' "$settings_file" >/dev/null
grep -F '{"喂食", "pet_feed"}' "$settings_file" >/dev/null
grep -F '{"渐隐", "pet_fader"}' "$settings_file" >/dev/null
grep -F '{"光环", "pet_aura"}' "$settings_file" >/dev/null
if grep -F 'pet_skill' "$settings_file" >/dev/null; then
    exit 1
fi
grep -F 'GW2PlusPetHappinessEnabled' "$settings_file" >/dev/null
grep -F 'GW2PlusPetFeedEnabled' "$settings_file" >/dev/null
grep -F 'GW2PlusPetFramePortraitSize' "Modules/UnitFrames/PetFrame.lua" >/dev/null
grep -F 'GW2PlusPetFramePortraitOffsetX' "Modules/UnitFrames/PetFrame.lua" >/dev/null
grep -F 'GW2PlusPetFramePortraitOffsetY' "Modules/UnitFrames/PetFrame.lua" >/dev/null
grep -F 'portraitSize = 60' "Modules/Settings/PlusProfileDefaults.lua" >/dev/null
grep -F 'portraitOffsetX = 0' "Modules/Settings/PlusProfileDefaults.lua" >/dev/null
grep -F 'portraitOffsetY = 0' "Modules/Settings/PlusProfileDefaults.lua" >/dev/null
grep -F '"GwPlusPetHappiness", "PetHappiness_pos"' "Modules/Settings/HudMoverOptions.lua" >/dev/null
grep -F '"GwPlusPetFeed", "PetFeed_pos"' "Modules/Settings/HudMoverOptions.lua" >/dev/null
grep -F 'PET_AURAS_UNDER' "$settings_file" >/dev/null
grep -F 'self.auras:SetPoint("TOPRIGHT", self.Background, "BOTTOMRIGHT", -3, 40)' "$petbar_file" >/dev/null
grep -F 'self.auras:SetPoint("TOPRIGHT", self.powerbar, "BOTTOMRIGHT", 0, -5)' "$petbar_file" >/dev/null
if grep -F 'self.auras:SetPoint("TOPLEFT", self.powerbar, "BOTTOMLEFT", 0, -5)' "$petbar_file" >/dev/null; then
    echo "宠物下方光环不应继续从左下角开始排列" >&2
    exit 1
fi
grep -F 'PET_Buff_Filter' "$settings_file" >/dev/null
grep -F 'PET_Buff_Filter_advanced' "$settings_file" >/dev/null
grep -F 'PET_Debuff_Filter' "$settings_file" >/dev/null
grep -F 'PET_Debuff_Filter_advanced' "$settings_file" >/dev/null
grep -F 'PetBar_pos = {' "Modules/Settings/PlusProfileDefaults.lua" >/dev/null
grep -F 'PetHappiness_pos = {' "Modules/Settings/PlusProfileDefaults.lua" >/dev/null
grep -F 'PetFeed_pos = {' "Modules/Settings/PlusProfileDefaults.lua" >/dev/null
grep -F 'toggleMethod = "ToggleFaderOptions"' "$settings_file" >/dev/null
grep -F 'enabledOptionName = "GW2PlusPetFaderEnabled"' "$settings_file" >/dev/null
grep -F 'enabledDescription = "启用宠物框体渐隐。"' "$settings_file" >/dev/null
grep -F 'GW2_UI_PLUS_PetFaderSV' "$settings_file" >/dev/null
grep -F 'includePlayerTarget = true' "$settings_file" >/dev/null
grep -F 'preserveDynamicFlightVehicle = false' "$settings_file" >/dev/null
if grep -F 'preserveOriginal = true' "$settings_file" >/dev/null; then
    exit 1
fi
if grep -F 'state.views.fader = BuildPetView(panel, state, "fader")' "$settings_file" >/dev/null; then
    exit 1
fi
if grep -F 'HideEmbeddedFader(embeddedPanels.player_pet' "$hide_native_file" >/dev/null; then
    exit 1
fi
grep -F 'entry.panelId == panelId and not entry.isParent' "$settings_file" >/dev/null
grep -F 'addonTable.SetPanelTitle(panel, header, breadcrumb)' "$settings_file" >/dev/null
grep -F '"目标的目标", "target_of_target_general", true, "targettarget"' "$settings_file" >/dev/null
grep -F 'target_of_target_fader' "$settings_file" >/dev/null
grep -F 'target_TARGET_ENABLED = "启用"' "$settings_file" >/dev/null
grep -F 'value == "unittarget"' "$settings_file" >/dev/null
grep -F 'and "目标" or' "$settings_file" >/dev/null
if grep -F 'CreateMenuButton("小队", "party_general"' "$settings_file" >/dev/null; then
    exit 1
fi
grep -F '{"血球和贴图", "gw2_plus_player_globe"}' "$settings_file" >/dev/null
grep -F '{"施法条", "gw2_plus_player_castbar"}' "$settings_file" >/dev/null
grep -F '{"能量条", "gw2_plus_player_energy"}' "$settings_file" >/dev/null
grep -F '{"资源条", "gw2_plus_player_resource"}' "$settings_file" >/dev/null
grep -F '{"经验槽", "gw2_plus_player_xp"}' "$settings_file" >/dev/null
grep -F '    "gw2_plus_player_globe",' "$settings_file" >/dev/null
grep -F '    "gw2_plus_player_castbar",' "$settings_file" >/dev/null
grep -F '    "gw2_plus_player_energy",' "$settings_file" >/dev/null
grep -F '    "gw2_plus_player_resource",' "$settings_file" >/dev/null
grep -F '    "gw2_plus_player_xp",' "$settings_file" >/dev/null
if grep -F '{"状态条", "player_classpower"}' "$settings_file" >/dev/null; then
    exit 1
fi
grep -F 'settingsTab.gwPlusPlayerResourcePanels' "$settings_file" >/dev/null
grep -F 'option.forceNewLine = true' "$resources_file" >/dev/null
grep -F 'option.gwPlusColumns = nil' "$resources_file" >/dev/null
grep -F 'local function SetRow(columnCount, ...)' "$resources_file" >/dev/null
grep -F 'SetRow(3,' "$resources_file" >/dev/null
grep -F 'grouped["PLAYER_AS_TARGET_FRAME_ALT_BACKGROUND"]' "$resources_file" >/dev/null
grep -F 'grouped["player_CLASS_COLOR"]' "$resources_file" >/dev/null
grep -F 'grouped["PLAYER_SHOW_PVP_INDICATOR"]' "$resources_file" >/dev/null
if grep -F 'GENERAL_OPTION_COLUMNS' "$resources_file" >/dev/null; then
    exit 1
fi
if grep -F 'PLAYER_UNIT_HEALTH = 2,' "$resources_file" >/dev/null; then
    exit 1
fi
if grep -F 'playerFrameHealthBarTexture = 2,' "$resources_file" >/dev/null; then
    exit 1
fi
grep -F 'Utils.InitializePanel(playerGeneral)' "$resources_file" >/dev/null
if grep -F 'AddGroupHeader(panel,' "$resources_file" >/dev/null; then
    exit 1
fi

printf '%s\n' '框体设置回归检查通过'
