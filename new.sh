#!/bin/bash
# Create a new LeetCode problem folder.
# Usage: ./new.sh <number> "<title>" <easy|medium|hard> [language]
# Example: ./new.sh 1 "Two Sum" easy swift
set -euo pipefail
cd "$(dirname "$0")"

if [ $# -lt 3 ]; then
  echo "Usage: ./new.sh <number> \"<title>\" <easy|medium|hard> [language]"
  echo "Example: ./new.sh 1 \"Two Sum\" easy swift"
  exit 1
fi

num="$1"; title="$2"; diff_in="$3"; lang="$(echo "${4:-swift}" | tr '[:upper:]' '[:lower:]')"

case "$(echo "$diff_in" | tr '[:upper:]' '[:lower:]')" in
  easy|e) difficulty="Easy" ;;
  medium|med|m) difficulty="Medium" ;;
  hard|h) difficulty="Hard" ;;
  *) echo "Difficulty must be easy, medium or hard"; exit 1 ;;
esac

case "$lang" in
  swift) ext="swift"; c="//" ;;
  python|python3|py) ext="py"; c="#" ;;
  cpp|c++) ext="cpp"; c="//" ;;
  c) ext="c"; c="//" ;;
  java) ext="java"; c="//" ;;
  javascript|js) ext="js"; c="//" ;;
  typescript|ts) ext="ts"; c="//" ;;
  go|golang) ext="go"; c="//" ;;
  kotlin|kt) ext="kt"; c="//" ;;
  rust|rs) ext="rs"; c="//" ;;
  csharp|cs|c#) ext="cs"; c="//" ;;
  *) echo "Unknown language: $lang"; exit 1 ;;
esac

slug="$(echo "$title" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g; s/^-+//; s/-+$//')"
padded="$(printf '%04d' "$((10#$num))")"
url="https://leetcode.com/problems/$slug/"

# Reuse the existing folder if this problem was already created under any difficulty
dir="$(ls -d */"$padded"-* 2>/dev/null | head -n1 || true)"
dir="${dir%/}"
[ -z "$dir" ] && dir="$difficulty/$padded-$slug"
mkdir -p "$dir"

if [ ! -f "$dir/README.md" ]; then
  cat > "$dir/README.md" <<MD
# $((10#$num)). $title

**Difficulty:** $difficulty · **Link:** $url
**Pattern:** <!-- e.g. hash map, two pointers, sliding window -->
**Solved:** $(date +%Y-%m-%d)

## Approach

<!-- Explain your idea here -->

## Complexity

- Time: O(?)
- Space: O(?)
MD
fi

file="$dir/Solution.$ext"
if [ -f "$file" ]; then
  echo "Already exists: $file"
else
  if [ "$ext" = "go" ]; then
    printf '%s %s. %s\n%s %s\n\npackage main\n\n' "$c" "$((10#$num))" "$title" "$c" "$url" > "$file"
  else
    printf '%s %s. %s\n%s %s\n\n' "$c" "$((10#$num))" "$title" "$c" "$url" > "$file"
  fi
  printf '%s Paste the LeetCode starter code here and solve it.\n' "$c" >> "$file"
  echo "Created: $file"
fi

# Open in VS Code if its CLI is installed (set EDITOR_APP=xcode to use Xcode instead)
if [ "${EDITOR_APP:-}" = "xcode" ]; then
  open -a Xcode "$file"
elif command -v code >/dev/null 2>&1; then
  code "$file" "$dir/README.md"
fi
