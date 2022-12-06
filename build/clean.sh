#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BACKUP_DIR="${SCRIPT_DIR}/../backup"

function performClean {
    local source="${SCRIPT_DIR}/../packs/$1"
    local temp="${SCRIPT_DIR}/../packs/$1.tmp"
    mkdir -p "${BACKUP_DIR}" && cp "$source" "${BACKUP_DIR}"
    jq -c 'del(.effects[].flags.dae) | del(.effects[].flags.core) | del(.flags.core)' "$source" > "$temp"
    mv "$temp" "$source"
}

performClean "spells.db"
performClean "classfeatures.db"
performClean "monsterfeatures.db"
performClean "items.db"
