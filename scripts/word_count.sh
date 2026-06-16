#!/bin/bash

REPORT="word_count.txt"
CHAPTERS=(content/chapters/*.tex)

{
  echo "Word Count Report — $(date '+%Y-%m-%d %H:%M')"
  echo "============================================"
  if command -v texcount &>/dev/null; then
    texcount -brief "${CHAPTERS[@]}" 2>/dev/null
    echo ""
    echo "--- TOTAL ---"
    texcount -total "${CHAPTERS[@]}" 2>/dev/null
  else
    for f in "${CHAPTERS[@]}"; do
      count=$(detex "$f" 2>/dev/null | wc -w | tr -d ' ')
      printf "%-55s %s words\n" "$f" "$count"
    done
    echo ""
    echo "--- TOTAL ---"
    total=$(detex "${CHAPTERS[@]}" 2>/dev/null | wc -w | tr -d ' ')
    echo "$total words"
  fi
} > "$REPORT"

git add "$REPORT"
