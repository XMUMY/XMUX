#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 <command>"
  exit 1
fi

BASE_DIR=$(dirname "$0")

for dir in "$BASE_DIR"/*; do
  if [ -d "$dir" ]; then
    echo "Package: $dir"
    (
      cd "$dir" || exit
      eval "$@"
    )
  fi
done
