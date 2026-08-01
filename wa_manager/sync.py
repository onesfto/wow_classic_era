#!/usr/bin/env python3
"""
WA Manager — 数据同步脚本
每次退出游戏后运行此脚本，将最新 WeakAuras.lua 转换为 wa_data.js。

用法：
  python3 sync.py           # 自动查找并同步
  python3 sync.py --open    # 同步后打开浏览器
"""
import os, sys, json, time, glob, webbrowser

BASE = os.path.dirname(os.path.abspath(__file__))
WOW_DIR = os.path.join(BASE, '..', 'WTF', 'Account')
DST = os.path.join(BASE, 'wa_data.js')

def find_wa_lua():
    pattern = os.path.join(WOW_DIR, '**', 'SavedVariables', 'WeakAuras.lua')
    files = glob.glob(pattern, recursive=True)
    if not files:
        return None
    # Return the most recently modified
    return max(files, key=os.path.getmtime)

def sync(src_path=None):
    if src_path is None:
        src_path = find_wa_lua()
    if src_path is None:
        print('❌  未找到 WeakAuras.lua，请手动指定路径')
        sys.exit(1)

    print(f'📂  来源: {src_path}')
    sz = os.path.getsize(src_path)
    print(f'    大小: {sz/1024/1024:.2f} MB')

    t0 = time.time()
    print('📖  读取文件…')
    with open(src_path, 'r', encoding='utf-8', errors='replace') as f:
        content = f.read()

    print('🔧  生成 wa_data.js…')
    js = f'window.__WA_DATA__ = {json.dumps(content)};\n'
    with open(DST, 'w', encoding='utf-8') as f:
        f.write(js)

    out_sz = os.path.getsize(DST)
    elapsed = time.time() - t0
    print(f'✅  完成！wa_data.js = {out_sz/1024/1024:.2f} MB  ({elapsed:.1f}s)')
    return DST

if __name__ == '__main__':
    sync()
    if '--open' in sys.argv or len(sys.argv) == 1:
        idx = os.path.join(BASE, 'index.html')
        url = 'file://' + idx
        print(f'🌐  打开浏览器: {url}')
        webbrowser.open(url)
