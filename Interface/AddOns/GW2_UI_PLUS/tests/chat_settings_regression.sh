#!/bin/sh
set -eu

chat_tab_file="Modules/Settings/ChatTab.lua"
components_file="Modules/Settings/ComponentsTab.lua"
hide_native_file="Modules/Settings/HideNativeSettings.lua"
settings_file="Modules/Settings/Settings.lua"
core_file="core.lua"
toc_file="GW2_UI_PLUS.toc"

grep -F 'Assets/icons/tabs/tabicon_chat.png' "$chat_tab_file" >/dev/null
grep -F 'tab.name = "GwSettingsChat"' "$chat_tab_file" >/dev/null
grep -F 'tab.headerBreadcrumbText = "聊天"' "$chat_tab_file" >/dev/null
grep -F 'AddMenuEntry("综合", pages.chat_general)' "$chat_tab_file" >/dev/null
grep -F 'AddMenuEntry("频道按钮", chatPanels.chatBar)' "$chat_tab_file" >/dev/null
grep -F 'AddMenuEntry("聊天窗口", chatPanels.chatWindow)' "$chat_tab_file" >/dev/null
grep -F 'tab.callbackOnClose = RestoreCurrent' "$chat_tab_file" >/dev/null
grep -F 'addonTable.BuildChatTab = BuildChatTab' "$chat_tab_file" >/dev/null

grep -F 'Modules/Settings/ChatTab.lua' "$toc_file" >/dev/null
grep -F 'addonTable.PlusChatPanels = {' "$core_file" >/dev/null
grep -F 'addonTable.BuildChatTab(settingsTab, _G.GwSettingsWindow)' "$core_file" >/dev/null
grep -F 'GwSettingsChat' "$settings_file" >/dev/null
grep -F 'CHAT_PANEL_NAMES' "$components_file" >/dev/null
grep -F 'local function HideNativeChatSettings(settingsTab, embeddedPanels, provider)' "$hide_native_file" >/dev/null
grep -F 'frame.panelId == "chat_general"' "$hide_native_file" >/dev/null
grep -F 'provider = HideNativeChatSettings(settingsTab, embeddedPanels, provider)' "$hide_native_file" >/dev/null

printf '%s\n' '聊天设置菜单回归检查通过'
