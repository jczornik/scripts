#!/usr/bin/env bash

source ../functions.sh

readonly FILES=$(get_files_to_link $(pwd))
readonly DST="/home/$(whoami)/.local/bin"

for file in $FILES; do
    ln -s "$(pwd)/$file" "$DST/$file"
done
