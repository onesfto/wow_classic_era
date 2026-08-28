#!/bin/sh
set -eu

lua - <<'LUA'
local addonTable = {
    PlusActionBar = {
        InitDB = function() return {} end,
        MULTIBARS = {},
    },
}

_G.GW2_ADDON = {
    settings = {},
    CreateTotemBar = function()
        error("已有图腾条时不应再次执行底层创建")
    end,
}

CreateFrame = function()
    return {
        SetScript = function() end,
    }
end
UIParent = {}

assert(loadfile("Modules/ActionBar/ActionBar_Layout.lua"))(
    "GW2_UI_PLUS", addonTable)

local existingTotemBar = {}
_G.GwTotemBar = existingTotemBar

addonTable.PlusActionBar.InstallTotemBarSingletonGuard()
local result = _G.GW2_ADDON.CreateTotemBar()

assert(result == existingTotemBar, "重复创建时应返回现有图腾条")
LUA

printf '%s\n' '图腾条单例回归检查通过'
