#!/bin/bash
T="${1:-.}"
cd "$T" || exit 1
for p in ./*; do
  n="${p##*/}"
  if [ -d "$p" ]; then
    echo "$n є директорією."
  elif [ -f "$p" ] || [ -L "$p" ]; then
    d="${n}_dir"
    mkdir -p -- "$d" && mv -- "$p" "$d/" && echo "$n переміщений."
  fi
done
