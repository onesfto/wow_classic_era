#!/bin/zsh

set -euo pipefail

plugin_dir="${0:A:h:h}"
importer="$plugin_dir/ImportMusic.command"

if [[ ! -x "$importer" ]]; then
    print -u2 "导入脚本不存在或不可执行：$importer"
    exit 1
fi

if ! command -v ffmpeg >/dev/null 2>&1; then
    print -u2 "测试需要 ffmpeg"
    exit 1
fi

temp_root="$(mktemp -d)"
trap 'rm -rf "$temp_root"' EXIT

test_plugin="$temp_root/InnGramophone"
mkdir -p "$test_plugin/Music"
cp "$importer" "$test_plugin/ImportMusic.command"

ffmpeg -loglevel error -f lavfi -i "sine=frequency=440:duration=1" \
    "$test_plugin/Music/测试歌曲.mp3"
ffmpeg -loglevel error -f lavfi -i "sine=frequency=880:duration=2" \
    "$test_plugin/Music/Second Track.ogg"

"$test_plugin/ImportMusic.command"

output="$test_plugin/LocalTracks.lua"
[[ -f "$output" ]]
luac -p "$output"

grep -Fq 'title = "Second Track"' "$output"
grep -Fq 'title = "测试歌曲"' "$output"
grep -Fq 'path = "Interface/AddOns/InnGramophone/Music/Second Track.ogg"' "$output"
grep -Fq 'path = "Interface/AddOns/InnGramophone/Music/测试歌曲.mp3"' "$output"
grep -Fq 'source = "local"' "$output"

track_count="$(grep -c 'LMP:AddTrack' "$output")"
[[ "$track_count" -eq 2 ]]

print "全部通过：本地音乐导入"
