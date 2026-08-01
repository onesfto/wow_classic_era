#!/bin/zsh

set -euo pipefail

plugin_dir="${0:A:h}"
music_dir="$plugin_dir/Music"
output="$plugin_dir/LocalTracks.lua"

if ! command -v ffprobe >/dev/null 2>&1; then
    print -u2 -- "未找到 ffprobe。请先安装 ffmpeg：brew install ffmpeg"
    if [[ -t 0 ]]; then
        read -r "?按回车键退出..."
    fi
    exit 1
fi

mkdir -p "$music_dir"

typeset -a audio_files
while IFS= read -r -d $'\0' audio_file; do
    audio_files+=("$audio_file")
done < <(find "$music_dir" -type f \( -iname '*.mp3' -o -iname '*.ogg' \) -print0)
audio_files=("${(@on)audio_files}")

escape_lua()
{
    local value="$1"
    value="${value//\\/\\\\}"
    value="${value//\"/\\\"}"
    value="${value//$'\r'/\\r}"
    value="${value//$'\n'/\\n}"
    print -rn -- "$value"
}

temp_output="$(mktemp "$plugin_dir/.LocalTracks.lua.XXXXXX")"
trap 'rm -f "$temp_output"' EXIT

{
    print -r -- 'local _, LMP = ...'
    print
    print -r -- '-- 此文件由 ImportMusic.command 自动生成。'
    print
} > "$temp_output"

for audio_file in "${audio_files[@]}"; do
    duration_raw="$(ffprobe -v error -show_entries format=duration \
        -of default=noprint_wrappers=1:nokey=1 "$audio_file")"
    if [[ -z "$duration_raw" ]]; then
        print -u2 -- "无法读取音频时长：$audio_file"
        exit 1
    fi

    duration="$(awk -v value="$duration_raw" 'BEGIN {
        rounded = int(value + 0.5)
        print (rounded < 1 ? 1 : rounded)
    }')"
    filename="${audio_file:t}"
    meta_title="$(ffprobe -v error -show_entries format_tags=title:stream_tags=title -of default=noprint_wrappers=1:nokey=1 "$audio_file" | head -n1)"
    meta_artist="$(ffprobe -v error -show_entries format_tags=artist:stream_tags=artist -of default=noprint_wrappers=1:nokey=1 "$audio_file" | head -n1)"

    filename_noext="${filename:r}"
    if [[ -n "$meta_title" ]]; then
        title="$meta_title"
    elif [[ "$filename_noext" == *-* ]]; then
        title="${filename_noext#*-}"
        title="${title## }"
        title="${title%% }"
    else
        title="$filename_noext"
    fi

    if [[ -n "$meta_artist" ]]; then
        artist="$meta_artist"
    elif [[ "$filename_noext" == *-* ]]; then
        artist="${filename_noext%%-*}"
        artist="${artist## }"
        artist="${artist%% }"
    else
        artist="未知艺术家"
    fi
    relative_path="${audio_file#$plugin_dir/}"
    wow_path="Interface/AddOns/InnGramophone/$relative_path"

    {
        print -r -- 'LMP:AddTrack({'
        print -rn -- '    title = "'
        escape_lua "$title"
        print -r -- '",'
        print -rn -- '    artist = "'
        escape_lua "$artist"
        print -r -- '",'
        print -rn -- '    path = "'
        escape_lua "$wow_path"
        print -r -- '",'
        print -r -- "    duration = $duration,"
        print -r -- '    source = "local",'
        print -r -- '})'
        print
    } >> "$temp_output"
done

luac -p "$temp_output"
mv "$temp_output" "$output"
trap - EXIT

print -r -- "已导入 ${#audio_files} 首本地音乐。"
print -r -- "请进入游戏后输入 /reload；如果游戏在复制音乐前已经启动，请重新启动客户端。"
if [[ -t 0 ]]; then
    read -r "?按回车键退出..."
fi
