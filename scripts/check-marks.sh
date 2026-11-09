#!/usr/bin/env bash
# Fails if a Grok product mark appears anywhere outside LICENSE / NOTICE.md.
# Allowed (nominative provider references only): lowercase model ids
# (grok-4.7, grok-voice-...), the upstream slug "grokbot-clone" in README
# credits, XAI_* env vars, x.ai endpoints, and the provider name "xAI".
# Anything else matching /grok/i, e.g. "Grokbot", "Grok Bot", "Grok API", fails.
set -euo pipefail
root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
cd "$root"
fail=0
while IFS= read -r -d '' f; do
  case "$f" in ./LICENSE|./NOTICE.md|./scripts/check-marks.sh|./package-lock.json) continue ;; esac
  n=0
  while IFS= read -r line || [[ -n "$line" ]]; do
    n=$((n+1))
    s=$(printf '%s' "$line" | sed -E 's/grok-[a-z0-9.-]+//g; s/XAI_[A-Z_]+//g; s/[a-z0-9.-]*x\.ai[a-z0-9/._-]*//g')
    if [[ "$f" == ./README.md ]]; then s=${s//grokbot-clone/}; fi
    # The xAI provider reference may name xAI's own models ("Grok 4.7") nominatively,
    # but never a bot/product name.
    if [[ "$f" == ./docs/model-and-app-providers.md ]]; then pat='grok[ -]?bot'; else pat='grok'; fi
    if printf '%s' "$s" | grep -qiE "$pat"; then
      echo "Forbidden product mark: ${f#./}:$n: $line" >&2; fail=1
    fi
  done <"$f"
done < <(find . -type f ! -path './.git/*' ! -path '*/node_modules/*' ! -path '*/dist/*' ! -path '*/build/*' -print0 | xargs -0 grep -li --null 'grok' || true)
exit $fail
