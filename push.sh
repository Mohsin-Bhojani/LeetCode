#!/bin/bash
# Rebuild the solved list in README.md, commit everything, and push.
# Usage: ./push.sh ["optional commit message"]
set -euo pipefail
cd "$(dirname "$0")"

# ---- Build the solutions table ----
rows=""
count=0
for dir in Easy/[0-9]*-* Medium/[0-9]*-* Hard/[0-9]*-*; do
  [ -d "$dir" ] || continue
  difficulty="${dir%%/*}"
  base="${dir#*/}"
  num="$((10#${base%%-*}))"
  slug="${base#*-}"
  title="$(head -n1 "$dir/README.md" 2>/dev/null | sed -E 's/^# *[0-9]+\. *//')"
  [ -z "$title" ] && title="$slug"
  pattern="$(grep -m1 '^\*\*Pattern:\*\*' "$dir/README.md" 2>/dev/null | sed -E 's/^\*\*Pattern:\*\* *//; s/<!--.*-->//; s/ *$//' || true)"
  solved="$(grep -m1 '^\*\*Solved:\*\*' "$dir/README.md" 2>/dev/null | sed -E 's/^\*\*Solved:\*\* *//; s/ *$//' || true)"
  links=""
  for f in "$dir"/Solution.*; do
    [ -f "$f" ] || continue
    ext="${f##*.}"
    links="$links [$ext]($f)"
  done
  rows="$rows$(printf '%05d' "$num")|| $num | [$title]($dir/) | $difficulty | $pattern |$links | $solved |"$'\n'
  count=$((count + 1))
done

table_file="$(mktemp)"
if [ "$count" -eq 0 ]; then
  echo "_No problems solved yet._" > "$table_file"
else
  easy=$( (ls -d Easy/[0-9]*-* 2>/dev/null || true) | wc -l | tr -d ' ')
  med=$( (ls -d Medium/[0-9]*-* 2>/dev/null || true) | wc -l | tr -d ' ')
  hard=$( (ls -d Hard/[0-9]*-* 2>/dev/null || true) | wc -l | tr -d ' ')
  {
    echo "**Total: $count** — Easy: $easy · Medium: $med · Hard: $hard"
    echo
    echo "| # | Problem | Difficulty | Pattern | Solutions | Solved |"
    echo "|---|---------|------------|---------|-----------|--------|"
    printf '%s' "$rows" | sort | sed 's/^[0-9]*|//'
  } > "$table_file"
fi

awk -v tf="$table_file" '
  /<!-- SOLUTIONS:START -->/ { print; while ((getline line < tf) > 0) print line; skip=1; next }
  /<!-- SOLUTIONS:END -->/ { skip=0 }
  !skip { print }
' README.md > README.md.tmp && mv README.md.tmp README.md
rm -f "$table_file"

# ---- Commit & push ----
git add -A
if git diff --cached --quiet; then
  echo "Nothing to commit."
  exit 0
fi

if [ $# -ge 1 ]; then
  msg="$1"
else
  added=$(git diff --cached --name-only --diff-filter=A | { grep -E '/Solution\.' || true; } | sed -E 's#^[^/]+/0*([0-9]+)-([^/]+)/Solution\.(.*)$#\1. \2 (\3)#' | paste -sd ',' - | sed 's/,/, /g')
  if [ -n "$added" ]; then msg="Add $added"; else msg="Update solutions"; fi
fi

git commit -m "$msg"

if git remote get-url origin >/dev/null 2>&1; then
  git push -u origin "$(git branch --show-current)"
else
  echo "No GitHub remote yet — committed locally only. Add one with: git remote add origin <repo-url>"
fi
