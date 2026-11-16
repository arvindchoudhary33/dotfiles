#!/bin/bash
# Claude Code status line: model │ context bar used/size (pct) │ 5h limit │ dir
# Colours: Rosé Pine. Bar turns gold at 50%, red at 75% (time to /clear or /compact).
input=$(cat)

model=$(jq -r '.model.display_name // "Claude"' <<<"$input")
dir=$(jq -r '.workspace.current_dir // .cwd // ""' <<<"$input")
dir=${dir/#$HOME/\~}
pct=$(jq -r '.context_window.used_percentage // 0 | floor' <<<"$input")
size=$(jq -r '.context_window.context_window_size // 0' <<<"$input")
used=$(jq -r '.context_window.current_usage // {} | ((.input_tokens // 0) + (.cache_creation_input_tokens // 0) + (.cache_read_input_tokens // 0))' <<<"$input")
five=$(jq -r '.rate_limits.five_hour.used_percentage // empty | floor' <<<"$input")

human() { # 220118 -> 220k, 1000000 -> 1M
  local n=$1
  if (( n >= 1000000 )); then
    awk -v n="$n" 'BEGIN { v = n/1000000; if (v == int(v)) printf "%dM", v; else printf "%.1fM", v }'
  elif (( n >= 1000 )); then printf "%dk" $(( (n + 500) / 1000 ))
  else printf "%d" "$n"; fi
}

rgb() { printf '\033[38;2;%d;%d;%dm' "0x${1:1:2}" "0x${1:3:2}" "0x${1:5:2}"; }
R=$'\033[0m'; MUTED=$(rgb "#6e6a86"); TEXT=$(rgb "#e0def4"); IRIS=$(rgb "#c4a7e7"); FOAM=$(rgb "#9ccfd8")

if   (( pct >= 75 )); then C=$(rgb "#eb6f92")   # love: clear soon
elif (( pct >= 50 )); then C=$(rgb "#f6c177")   # gold: getting full
else                       C=$(rgb "#31748f"); fi # pine: fine

width=10; filled=$(( (pct * width + 50) / 100 )); (( filled > width )) && filled=$width
bar="${C}$(printf '%*s' "$filled" '' | tr ' ' '█')${MUTED}$(printf '%*s' $(( width - filled )) '' | tr ' ' '░')${R}"

sep=" ${MUTED}│${R} "
out="${IRIS}${model}${R}${sep}${bar} ${C}${pct}%${R} ${MUTED}($(human "$used")/$(human "$size"))${R}"
[[ -n "$five" ]] && out+="${sep}${MUTED}5h${R} ${TEXT}${five}%${R}"
[[ -n "$dir" ]] && out+="${sep}${FOAM}${dir}${R}"
printf '%s' "$out"
