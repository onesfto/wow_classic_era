#!/bin/sh
set -eu

root_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$root_dir"

utils_file="Modules/Skins/TradeSkill_Utils.lua"
layout_file="Modules/Skins/TradeSkill_Layout.lua"
skin_file="Modules/Skins/TradeSkill_Skin.lua"
entry_file="Modules/Skins/TradeSkill.lua"
toc_file="GW2_UI_PLUS.toc"

for file in "$utils_file" "$layout_file" "$skin_file" "$entry_file"; do
    test -f "$file"
    luac -p "$file"
done

require_text() {
    if ! rg -Fq -- "$2" "$1"; then
        echo "TradeSkill 模块引用错误：$1 未包含 $2" >&2
        exit 1
    fi
}

require_text "$utils_file" 'Utils.STATUS_BAR'
require_text "$utils_file" 'Utils.ClampFrameWithHeader(self)'
require_text "$utils_file" 'Utils.PANEL_WIDTH'
require_text "$layout_file" 'function Layout.LayoutTradeSkillFrame()'
require_text "$layout_file" 'function Layout.LayoutCraftFrame()'
require_text "$layout_file" 'Utils.SetProfessionFrameSize(TradeSkillFrame, "TradeSkillFrame")'
require_text "$layout_file" 'Utils.SetProfessionFrameSize(CraftFrame, "CraftFrame")'
require_text "$skin_file" 'Utils.HideRegion(TradeSkillFramePortrait)'
require_text "$skin_file" 'Layout.ExtendTradeSkillListButtons()'
require_text "$skin_file" 'Layout.ExtendCraftListButtons()'
require_text "$skin_file" 'Layout.LayoutCraftFrame()'

utils_line=$(rg -n '^Modules/Skins/TradeSkill_Utils.lua$' "$toc_file" | cut -d: -f1)
layout_line=$(rg -n '^Modules/Skins/TradeSkill_Layout.lua$' "$toc_file" | cut -d: -f1)
skin_line=$(rg -n '^Modules/Skins/TradeSkill_Skin.lua$' "$toc_file" | cut -d: -f1)
entry_line=$(rg -n '^Modules/Skins/TradeSkill.lua$' "$toc_file" | cut -d: -f1)

if [ "$utils_line" -ge "$layout_line" ] || [ "$layout_line" -ge "$skin_line" ] || [ "$skin_line" -ge "$entry_line" ]; then
    echo "TradeSkill 模块加载顺序错误" >&2
    exit 1
fi

lua - <<'LUA'
local function no_op() end

local function make_frame()
    return {
        ClearAllPoints = no_op,
        EnableMouse = no_op,
        GwSkinButton = no_op,
        GwStripTextures = no_op,
        HookScript = no_op,
        RegisterForDrag = no_op,
        SetAlpha = no_op,
        SetClampedToScreen = no_op,
        SetFrameLevel = no_op,
        SetFrameStrata = no_op,
        SetMovable = no_op,
        SetPoint = no_op,
        SetScript = no_op,
        SetSize = no_op,
        Show = no_op,
    }
end

local env = setmetatable({
    CreateFrame = function() return make_frame() end,
    GW2_ADDON = {
        CreateFrameHeaderWithBody = no_op,
    },
}, {__index = _G})
env._G = env

local addonTable = {}
assert(loadfile("Modules/Skins/TradeSkill_Utils.lua", "t", env))("GW2_UI_PLUS", addonTable)
assert(loadfile("Modules/Skins/TradeSkill_Layout.lua", "t", env))("GW2_UI_PLUS", addonTable)
assert(loadfile("Modules/Skins/TradeSkill_Skin.lua", "t", env))("GW2_UI_PLUS", addonTable)

assert(type(addonTable.TradeSkillSkinUtils) == "table")
assert(type(addonTable.TradeSkillSkinLayout.LayoutTradeSkillFrame) == "function")
assert(type(addonTable.TradeSkillSkinLayout.LayoutCraftFrame) == "function")
assert(env.LayoutTradeSkillFrame == nil, "布局函数不能泄漏到全局命名空间")

env.TradeSkillFrame = make_frame()
addonTable.TradeSkillSkin.SkinTradeSkillFrame()

env.CraftFrame = make_frame()
addonTable.TradeSkillSkin.SkinCraftFrame()

print("专业/制造面板模块回归检查通过")
LUA
