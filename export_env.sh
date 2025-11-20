#!/bin/bash

ENV_FILE="${1:-.env}"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "File '$ENV_FILE' not found!"
  exit 1
fi

while IFS= read -r line || [ -n "$line" ]; do
  line="$(echo "$line" | sed 's/^\s*//;s/\s*$//')"
  [[ -z "$line" ]] && continue
  [[ "$line" =~ ^# ]] && continue
  clean_line="$(echo "$line" | sed 's/#.*$//')"
  clean_line="$(echo "$clean_line" | sed 's/^\s*//;s/\s*$//')"

  if [[ "$clean_line" =~ ^[A-Za-z_][A-Za-z0-9_]*=.+$ ]]; then
    export "$clean_line"
    echo "Exported: $clean_line"
  fi

done < "$ENV_FILE"
