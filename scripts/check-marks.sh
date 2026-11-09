#!/usr/bin/env bash
set -euo pipefail
root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$root"
tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT
find . -type f ! -path './.git/*' ! -path '*/node_modules/*' ! -path '*/dist/*' ! -path '*/build/*' ! -path './package-lock.json' ! -path './scripts/check-marks.sh' -print0 | xargs -0 grep -ni 'grok' >"$tmp" || true
while IFS= read -r hit; do
  path=${hit%%:*}
  path=${path#./}
  content=${hit#*:*:}
  case "$path" in
    LICENSE|NOTICE.md|docs/model-and-app-providers.md) ;;
    README.md)
      if [[ "$content" != *grokbot-clone* && ! "$content" =~ grok-[a-zA-Z0-9.-]+ ]]; then
        echo "Forbidden product mark: $hit" >&2; exit 1
      fi
      ;;
    .env.example|server/src/env.ts|server/src/agent/loop.ts|server/src/agent/memory.ts|server/src/voice.ts|server/src/types.ts|web/src/voice/call.ts|tests/e2e.mjs|docs/ARCHITECTURE.md)
      if [[ ! "$content" =~ grok-[a-zA-Z0-9.-]+ ]]; then
        echo "Forbidden product mark: $hit" >&2; exit 1
      fi
      ;;
    *) echo "Forbidden product mark: $hit" >&2; exit 1 ;;
  esac
done <"$tmp"
