#!/bin/sh
set -eu

root_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$root_dir"

require_file() {
    if [ ! -f "$1" ]; then
        echo "缺少综合功能文件：$1" >&2
        exit 1
    fi
}

require_text() {
    if ! rg -Fq -- "$2" "$1"; then
        echo "综合功能回归检查失败：$1 未包含 $2" >&2
        exit 1
    fi
}

for file in \
    Modules/General/Core.lua \
    Modules/General/Automation.lua \
    Modules/General/Merchant.lua \
    Modules/General/BuyEmAllClassic.lua \
    Modules/General/BuyEmAllClassic.xml \
    Modules/General/BuyEmAllClassic.zhCN.lua \
    Modules/General/FastLoot.lua \
    Modules/General/Visual.lua \
    Modules/General/Options.lua; do
    require_file "$file"
done

require_text GW2_UI_PLUS.toc 'Modules/General/Core.lua'
require_text GW2_UI_PLUS.toc 'Modules/General/Automation.lua'
require_text GW2_UI_PLUS.toc 'Modules/General/Merchant.lua'
require_text GW2_UI_PLUS.toc 'Modules/General/BuyEmAllClassic.lua'
require_text GW2_UI_PLUS.toc 'Modules/General/BuyEmAllClassic.xml'
require_text GW2_UI_PLUS.toc 'Modules/General/FastLoot.lua'
require_text GW2_UI_PLUS.toc 'Modules/General/Visual.lua'
require_text GW2_UI_PLUS.toc 'Modules/General/Options.lua'

require_text Modules/Settings/ComponentsTab.lua 'addonTable.PlusGeneralPanel'
require_text Modules/Settings/ComponentsTab.lua 'AddMenuEntry("综合", addonTable.PlusGeneralPanel)'
general_line=$(rg -n 'AddMenuEntry\("综合", addonTable.PlusGeneralPanel\)' Modules/Settings/ComponentsTab.lua | cut -d: -f1)
native_line=$(rg -n 'if pages then' Modules/Settings/ComponentsTab.lua | head -n 1 | cut -d: -f1)
if [ "$general_line" -ge "$native_line" ]; then
    echo "综合菜单必须位于原生组件菜单之前" >&2
    exit 1
fi

require_text Modules/General/Core.lua 'function General.GetDB'
require_text Modules/General/Core.lua 'function General.SetCVar'
require_text Modules/General/Options.lua 'GW.settings.AUTO_REPAIR == "PLAYER"'
require_text Modules/General/Options.lua 'GW.settings.AUTO_REPAIR = value and "PLAYER" or "NONE"'
require_text Modules/General/Automation.lua 'QUEST_DETAIL'
require_text Modules/General/Automation.lua 'QUEST_PROGRESS'
require_text Modules/General/Automation.lua 'QUEST_COMPLETE'
require_text Modules/General/Automation.lua 'GOSSIP_SHOW'
require_text Modules/General/Merchant.lua 'TRADE_SHOW'
require_text Modules/General/Merchant.lua 'GW2PlusBuyEmAllFrame'
require_text Modules/General/BuyEmAllClassic.lua 'function GW2PlusBuyEmAll:DoPurchase(amount)'
require_text Modules/General/BuyEmAllClassic.lua 'function GW2PlusBuyEmAll:SetStackClick()'
require_text Modules/General/BuyEmAllClassic.lua 'GW2PlusBuyEmAll.onUpdate'
require_text Modules/General/BuyEmAllClassic.lua 'GW2PlusBEAConfirmToggle'
require_text Modules/General/BuyEmAllClassic.xml 'GW2PlusBuyEmAllStackButton'
require_text Modules/General/BuyEmAllClassic.xml 'GW2PLUS_BUYEMALL_STACK'
require_text Modules/General/BuyEmAllClassic.xml '<Anchor point="TOPRIGHT" relativeTo="GW2PlusBuyEmAllMaxButton" relativePoint="TOPRIGHT">'
require_text Modules/General/FastLoot.lua 'LOOT_READY'
require_text Modules/General/FastLoot.lua 'LOOT_OPENED'
require_text Modules/General/FastLoot.lua 'LOOT_CLOSED'
require_text Modules/General/FastLoot.lua 'UI_ERROR_MESSAGE'
require_text Modules/General/Visual.lua 'overrideArchive'
require_text Modules/General/Visual.lua 'weatherDensity'
require_text Modules/General/Visual.lua 'RAIDweatherDensity'
require_text Modules/General/Visual.lua 'violenceLevel'
require_text Modules/General/Visual.lua 'SetToggle("ffxGlow", db.fullScreenGlow)'
require_text Modules/General/Visual.lua 'ffxDeath'
require_text Modules/General/Visual.lua 'cameraDistanceMaxZoomFactor'
require_text Modules/General/Visual.lua 'UnitNamePlayerGuild'
require_text Modules/General/Visual.lua 'UnitNamePlayerPVPTitle'
require_text Modules/General/Visual.lua 'autoDismount'
require_text Modules/General/Visual.lua 'scriptErrors'
require_text Modules/General/Visual.lua 'SetToggle("ffxDeath", db.deathEffect)'
require_text Modules/General/Visual.lua 'TargetNearestUseNew'
require_text Modules/General/Visual.lua 'UberTooltips'
require_text Modules/General/Options.lua '自动对话'
require_text Modules/General/Options.lua '公会名显示'
require_text Modules/General/Options.lua '头衔显示'
require_text Modules/General/Options.lua '自动下马'
require_text Modules/General/Options.lua 'FULL_SCREEN_GLOW'
require_text Modules/General/Options.lua 'DEATH_EFFECT'
require_text Modules/General/Options.lua '屏蔽 Lua 错误'
require_text Modules/General/Options.lua '新版 TAB 选怪'
require_text Modules/General/Options.lua '技能详细提示'

echo "综合功能回归检查通过"
