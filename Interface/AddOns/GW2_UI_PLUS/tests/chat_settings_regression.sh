#!/bin/sh
set -eu

chat_tab_file="Modules/Settings/ChatTab.lua"
chat_categories_file="Modules/Settings/ChatCategories.lua"
chat_window_file="Modules/ChatWindow/Options.lua"
chat_bar_file="Modules/ChatBar/Options.lua"
components_file="Modules/Settings/ComponentsTab.lua"
hide_native_file="Modules/Settings/HideNativeSettings.lua"
settings_file="Modules/Settings/Settings.lua"
core_file="core.lua"
toc_file="GW2_UI_PLUS.toc"

grep -F 'Assets/icons/tabs/tabicon_chat.png' "$chat_tab_file" >/dev/null
grep -F 'tab.name = "GwSettingsChat"' "$chat_tab_file" >/dev/null
grep -F 'tab.headerBreadcrumbText = "聊天"' "$chat_tab_file" >/dev/null
grep -F 'AddMenuEntry("聊天增强", chatPanels.enhancement)' "$chat_tab_file" >/dev/null
grep -F 'AddMenuEntry("窗口布局", chatPanels.layout)' "$chat_tab_file" >/dev/null
grep -F 'AddMenuEntry("频道按钮", chatPanels.chatBar)' "$chat_tab_file" >/dev/null
grep -F 'AddMenuEntry("消息管理", chatPanels.messages)' "$chat_tab_file" >/dev/null
grep -F 'SetPanelTitle(chatPanels.enhancement, "聊天增强")' "$chat_tab_file" >/dev/null
grep -F 'SetPanelTitle(chatPanels.layout, "窗口布局")' "$chat_tab_file" >/dev/null
grep -F 'SetPanelTitle(chatPanels.messages, "消息管理")' "$chat_tab_file" >/dev/null
grep -F 'tab.callbackOnClose = RestoreCurrent' "$chat_tab_file" >/dev/null
grep -F 'addonTable.BuildChatTab = BuildChatTab' "$chat_tab_file" >/dev/null

capture_line=$(grep -n -F 'local CaptureFrame = addonTable.CaptureFrame' "$chat_tab_file" | cut -d: -f1)
build_line=$(grep -n -F 'local chatPanels = BuildChatCategoryPanels(' "$chat_tab_file" | cut -d: -f1)
if [ "$capture_line" -ge "$build_line" ]; then
    echo "聊天分类迁移前必须先验证框体捕获依赖" >&2
    exit 1
fi

if grep -F 'AddMenuEntry("综合", pages.chat_general)' "$chat_tab_file" >/dev/null; then
    echo "聊天菜单不应继续显示综合" >&2
    exit 1
fi
if grep -F 'AddMenuEntry("聊天窗口", chatPanels.chatWindow)' "$chat_tab_file" >/dev/null; then
    echo "聊天菜单不应继续显示聊天窗口" >&2
    exit 1
fi

grep -F 'Modules/Settings/ChatTab.lua' "$toc_file" >/dev/null
grep -F 'Modules/Settings/ChatCategories.lua' "$toc_file" >/dev/null
grep -F 'addonTable.BuildChatCategoryPanels' "$chat_categories_file" >/dev/null
grep -F 'CHAT_BUTTONS_POSITION = "layout"' "$chat_categories_file" >/dev/null
grep -F 'GW2PlusChatWindow_ClassColor = "enhancement"' "$chat_categories_file" >/dev/null
grep -F 'GW2PlusChatWindow_HideJoinLeave = "messages"' "$chat_categories_file" >/dev/null
grep -F 'GW2PlusChatWindow_Blacklist = "messages"' "$chat_categories_file" >/dev/null
grep -F 'option.name = "高亮关键词"' "$chat_categories_file" >/dev/null
grep -F 'option.name = "黑名单关键词"' "$chat_categories_file" >/dev/null

grep -F 'GW2PlusChatWindow_ClassColor' "$chat_window_file" >/dev/null
grep -F 'GW2PlusChatWindow_ButtonsPosition' "$chat_window_file" >/dev/null
grep -F 'GW2PlusChatWindow_HideJoinLeave' "$chat_window_file" >/dev/null
grep -F 'GW2PlusChatWindow_Blacklist' "$chat_window_file" >/dev/null

grep -F '{header = "聊天频道"' "$chat_bar_file" >/dev/null
grep -F '{header = "快捷功能"' "$chat_bar_file" >/dev/null
grep -F '{header = "插件入口"' "$chat_bar_file" >/dev/null
grep -F 'panel:AddGroupHeader("基本设置")' "$chat_bar_file" >/dev/null
grep -F 'panel:AddGroupHeader("位置与外观")' "$chat_bar_file" >/dev/null

grep -F 'addonTable.PlusChatPanels = {' "$core_file" >/dev/null
grep -F 'addonTable.BuildChatTab(settingsTab, _G.GwSettingsWindow)' "$core_file" >/dev/null
grep -F 'GwSettingsChat' "$settings_file" >/dev/null
grep -F 'CHAT_PANEL_NAMES' "$components_file" >/dev/null
grep -F 'local function HideNativeChatSettings(settingsTab, embeddedPanels, provider)' "$hide_native_file" >/dev/null
grep -F 'frame.panelId == "chat_general"' "$hide_native_file" >/dev/null
grep -F 'provider = HideNativeChatSettings(settingsTab, embeddedPanels, provider)' "$hide_native_file" >/dev/null

printf '%s\n' '聊天设置菜单回归检查通过'
