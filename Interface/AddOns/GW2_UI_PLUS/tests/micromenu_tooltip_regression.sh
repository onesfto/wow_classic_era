#!/bin/sh
set -eu

fixes_file="Core/Fixes.lua"

grep -F 'local function RefreshCustomMicroButtonTooltip(self)' "$fixes_file" >/dev/null
grep -F 'self == _G.GwPlayerSpellsMicroButton' "$fixes_file" >/dev/null
grep -F 'SPELLBOOK_ABILITIES_BUTTON, "TOGGLESPELLBOOK")' "$fixes_file" >/dev/null
grep -F 'self == _G.GwTalentMicroButton' "$fixes_file" >/dev/null
grep -F 'TALENTS, "TOGGLETALENTS")' "$fixes_file" >/dev/null
grep -F 'RefreshCustomMicroButtonTooltip(self)' "$fixes_file" >/dev/null
grep -F 'local function ShowNativeMicroButtonTooltip(self)' "$fixes_file" >/dev/null
grep -F 'if type(_G.MicroButton_OnEnter) == "function" then' "$fixes_file" >/dev/null
grep -F '_G.MicroButton_OnEnter(self)' "$fixes_file" >/dev/null
grep -F 'local function HookNativeMicroButtonTooltip(button)' "$fixes_file" >/dev/null
grep -F 'HookNativeMicroButtonTooltip(_G.GwPlayerSpellsMicroButton)' "$fixes_file" >/dev/null
grep -F 'HookNativeMicroButtonTooltip(_G.GwTalentMicroButton)' "$fixes_file" >/dev/null
grep -F 'button:HookScript("OnEnter", ShowNativeMicroButtonTooltip)' "$fixes_file" >/dev/null
grep -F 'local function HideOwnedMicroButtonTooltip(self)' "$fixes_file" >/dev/null
grep -F 'if GameTooltip and GameTooltip:IsOwned(self) then' "$fixes_file" >/dev/null
grep -F 'GameTooltip:Hide()' "$fixes_file" >/dev/null
grep -F 'local function ApplyMicroButtonTooltipFix()' "$fixes_file" >/dev/null
grep -F 'local microbar = _G.Gw2MicroBarFrame and _G.Gw2MicroBarFrame.cf' "$fixes_file" >/dev/null
grep -F 'button:HookScript("OnLeave", HideOwnedMicroButtonTooltip)' "$fixes_file" >/dev/null
grep -F 'ApplyMicroButtonTooltipFix()' "$fixes_file" >/dev/null

printf '%s\n' '微型系统菜单提示显示与隐藏回归检查通过'
