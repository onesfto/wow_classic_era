#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import sys
import re
import shutil

def main():
    print("======================================")
    print("    GW2_UI 一键汉化脚本 (by Onesfto)    ")
    print("======================================\n")

    print("!! 本脚本已于 2026-07-27 停用，不需要再跑了。\n")
    print("汉化已经搬进 GW2_UI_PLUS 插件，改成游戏内运行时注入：")
    print("  GW2_UI_PLUS/locale/zhCN.lua       380 条补充词条")
    print("  GW2_UI_PLUS/locale/Hardcoded.lua  三处硬编码文本")
    print("\n跑这个脚本会改写 GW2_UI 源码，让本体重新偏离上游，")
    print("下次更新插件时又要手工合并——正是我们要摆脱的事。\n")
    if input("确定还要继续吗？（输入 yes 继续，回车退出）: ").strip().lower() != "yes":
        print("已取消。")
        return

    # 获取脚本所在目录
    script_dir = os.path.dirname(os.path.abspath(__file__))
    
    # 源文件和目标目录
    source_file = os.path.join(script_dir, "gw2_zhCN.lua")
    gw2_ui_dir = os.path.abspath(os.path.join(script_dir, "..", "..", "..", "..", "GW2_UI"))
    target_dir = os.path.join(gw2_ui_dir, "locales")
    target_file = os.path.join(target_dir, "zhCN.lua")

    if not os.path.exists(source_file):
        print(f"[错误] 未找到源汉化文件: {source_file}")
        print("请确认 gw2_zhCN.lua 文件是否存在。")
        input("\n按回车键退出...")
        sys.exit(1)

    if not os.path.exists(target_dir):
        print(f"[错误] 未找到目标 GW2_UI/locales 文件夹！")
        print("请确认是否已安装 GW2_UI 插件。")
        input("\n按回车键退出...")
        sys.exit(1)

    print("正在将汉化文件复制到 GW2_UI...")
    try:
        shutil.copy2(source_file, target_file)
    except Exception as e:
        print(f"[错误] 复制文件失败: {e}")
        input("\n按回车键退出...")
        sys.exit(1)

    print("正在修复硬编码的未汉化文本...")

    # 1. Fix 'Talent Preview' in Classic/TBC/Wrath
    for exp in ["Classic", "TBC", "Wrath"]:
        talents_xml = os.path.join(gw2_ui_dir, "Games", exp, "Character", "talents.xml")
        if os.path.exists(talents_xml):
            try:
                with open(talents_xml, 'r', encoding='utf-8') as f:
                    content = f.read()
                content = content.replace('text="Talent Preview"', 'text="天赋预览"')
                with open(talents_xml, 'w', encoding='utf-8') as f:
                    f.write(content)
            except Exception as e:
                print(f"[警告] 处理 {exp} talents.xml 时出错: {e}")

    # 2. Fix "OBJECTIVES_TRACKER_LABEL" in panel_objectives.lua
    panel_objectives = os.path.join(gw2_ui_dir, "settings", "panels", "panel_objectives.lua")
    if os.path.exists(panel_objectives):
        try:
            with open(panel_objectives, 'r', encoding='utf-8') as f:
                content = f.read()
            old_str = 'sWindow:AddSettingsPanel(p, OBJECTIVES_TRACKER_LABEL, L["Edit objectives settings."])'
            new_str = 'sWindow:AddSettingsPanel(p, "任务目标", L["Edit objectives settings."])'
            content = content.replace(old_str, new_str)
            with open(panel_objectives, 'w', encoding='utf-8') as f:
                f.write(content)
        except Exception as e:
            print(f"[警告] 处理 panel_objectives.lua 时出错: {e}")

    # 3. Fix 'Miss-Chance' and 'Crit' in advanced_stats.lua
    stats_lua = os.path.join(gw2_ui_dir, "Games", "Classic", "Character", "advanced_stats.lua")
    if os.path.exists(stats_lua):
        try:
            with open(stats_lua, 'r', encoding='utf-8') as f:
                content = f.read()
            
            # Inject 'local L = GW.L' if not exists
            if 'local L = GW.L' not in content:
                content = content.replace('local GW = select(2, ...)', 'local GW = select(2, ...)\nlocal L = GW.L')
            
            # Replace Miss-Chance and Crit
            if 'L["Miss-Chance:"]' not in content:
                content = content.replace('Miss-Chance:', '" .. (L["Miss-Chance:"] or "Miss-Chance:") .. "')
            if 'L["Miss-Chance (Level + 3):"]' not in content:
                content = content.replace('Miss-Chance (Level + 3):', '" .. (L["Miss-Chance (Level + 3):"] or "Miss-Chance (Level + 3):") .. "')
            if 'L["Crit"]' not in content:
                content = content.replace('.. CRIT_ABBR', '.. (L["Crit"] or CRIT_ABBR)')
            
            with open(stats_lua, 'w', encoding='utf-8') as f:
                f.write(content)
        except Exception as e:
            print(f"[警告] 处理 advanced_stats.lua 时出错: {e}")

    print("[成功] 汉化文件替换成功！")
    print("重启游戏或在游戏内输入 /reload 重载界面即可生效。")
    print("\n======================================")
    input("按回车键退出...")

if __name__ == "__main__":
    main()
