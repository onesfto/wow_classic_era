#!/bin/sh
set -eu

magebar_file="Modules/ActionBar/MageBar.lua"

create_line=$(rg -n 'popupBar = CreateFrame\("Frame"' "$magebar_file" | cut -d: -f1)
enable_line=$(rg -n 'popupBar:EnableMouse\(true\)' "$magebar_file" | cut -d: -f1)

if [ -z "$create_line" ] || [ -z "$enable_line" ] || [ "$enable_line" -le "$create_line" ]; then
    echo "法师弹出栏必须在创建后启用鼠标，以拦截空白区域" >&2
    exit 1
fi

printf '%s\n' '法师弹出栏鼠标拦截回归检查通过'
