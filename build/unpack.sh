#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
HOME_DIR=$(dirname -- "${SCRIPT_DIR}")
MODULE_NAME=$(basename ${HOME_DIR})

function unpack {
    local packDir="${HOME_DIR}/source/$1"
    fvtt --id "${MODULE_NAME}" --type "Module" package unpack $1 --in packs --out $packDir
    for file in $packDir/*.json; do
        jq -S 'del(.effects[].flags.dae) | del(.flags.itemacro) | del(.flags.favtab) | del(.effects[].flags.core) | del(.flags.core) | del(.sort) | del(._stats)' "$file" > "$file.tmp"
        mv "$file.tmp" "$file"
    done
}

unpack "spells"
unpack "classfeatures"
unpack "monsterfeatures"
unpack "items"
