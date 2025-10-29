#!/bin/bash
T="${1:-.}"
cd "$T" || exit 1
shopt -s nullglob
for p in ./*; do
  n="${p##*/}"
  if [ -d "$p" ]; then
    echo "$n є директорією."
  elif [ -f "$p" ] || [ -L "$p" ]; then
    d="${n}_dir"
    [ -e "$d" ] && [ ! -d "$d" ] && { echo "Пропускаю $n (ціль $d зайнятий)"; continue; }
    mkdir -p -- "$d" && mv -- "$p" "$d/" && echo "$n переміщений."
  fi
done
