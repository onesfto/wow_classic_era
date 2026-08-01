#!/usr/bin/env python3
"""WA Manager — 本地服务器启动脚本
双击或在终端运行：python3 serve.py
"""
import http.server, threading, webbrowser, socket, os, sys

def find_free_port():
    with socket.socket() as s:
        s.bind(('', 0))
        return s.getsockname()[1]

os.chdir(os.path.dirname(os.path.abspath(__file__)))
PORT = find_free_port()

class Handler(http.server.SimpleHTTPRequestHandler):
    def log_message(self, fmt, *args): pass
    def end_headers(self):
        self.send_header('Cache-Control', 'no-cache')
        self.send_header('Access-Control-Allow-Origin', '*')
        super().end_headers()

url = f'http://localhost:{PORT}/'
print(f'🎮 WA Manager 已启动: {url}')
print('   按 Ctrl+C 停止服务器')

threading.Timer(0.4, lambda: webbrowser.open(url)).start()
try:
    http.server.HTTPServer(('', PORT), Handler).serve_forever()
except KeyboardInterrupt:
    print('\n服务器已停止')
    sys.exit(0)
