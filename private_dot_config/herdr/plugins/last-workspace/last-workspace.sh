#!/usr/bin/env bash
set -euo pipefail

herdr="${HERDR_BIN_PATH:-herdr}"
state="${HERDR_PLUGIN_STATE_DIR:?}"
current_file="$state/current"
previous_file="$state/previous"

focused_workspace() {
    "$herdr" workspace list | jq -r '.result.workspaces[] | select(.focused) | .workspace_id'
}

case "${1:-}" in
    track)
        new="$(focused_workspace)"
        [[ -n "$new" ]] || exit 0
        old="$(cat "$current_file" 2>/dev/null || true)"
        if [[ "$new" != "$old" ]]; then
            [[ -n "$old" ]] && printf '%s\n' "$old" > "$previous_file"
            printf '%s\n' "$new" > "$current_file"
        fi
        ;;
    toggle)
        previous="$(cat "$previous_file" 2>/dev/null || true)"
        [[ -n "$previous" ]] || exit 0
        "$herdr" workspace focus "$previous" > /dev/null
        ;;
esac
