#!/bin/sh
set -eu

pulse_file="Modules/CooldownPulse/CooldownPulse.lua"
options_file="Modules/CooldownPulse/Options.lua"

grep -F 'spellNamePosition = "TOP"' "$pulse_file" >/dev/null
grep -F 'local function UpdateSpellNamePosition()' "$pulse_file" >/dev/null
grep -F 'DCP.TextFrame:SetPoint("BOTTOM", DCP, "TOP", 0, 4)' "$pulse_file" >/dev/null
grep -F 'DCP.TextFrame:SetPoint("CENTER", DCP, "CENTER")' "$pulse_file" >/dev/null
grep -F 'DCP.TextFrame:SetPoint("TOP", DCP, "BOTTOM", 0, -4)' "$pulse_file" >/dev/null
grep -F 'DCPT:SetPoint("TOPLEFT", DCP, "TOPLEFT", 3, -3)' "$pulse_file" >/dev/null
grep -F 'DCP:GwCreateBackdrop(GW.BackdropTemplates.DefaultWithSmallBorder)' "$pulse_file" >/dev/null
grep -F 'panel:AddOptionDropdown("技能名称位置"' "$options_file" >/dev/null
grep -F 'optionsList = {"TOP", "CENTER", "BOTTOM"}' "$options_file" >/dev/null
grep -F 'optShowSpellName.optionName = "GW2PlusCooldownPulse_ShowSpellName"' "$options_file" >/dev/null

printf '%s\n' '冷却闪烁 GWUI 样式回归检查通过'
