#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
HOME_DIR=$(dirname -- "${SCRIPT_DIR}")
MODULE_NAME=$(basename ${HOME_DIR})

function pack {
    local packDir="${HOME_DIR}/source/$1"
    fvtt --id "${MODULE_NAME}" --type "Module" package pack $1 --in $packDir --out "${HOME_DIR}/packs"
}

pack "spells"
pack "classfeatures"
pack "monsterfeatures"
pack "items"
