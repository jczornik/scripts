#!/usr/bin/env bash

source ../functions.sh

readonly FILES=$(get_files_to_link $(pwd))
readonly DST="/home/$(whoami)/.local/bin"

create_path_if_doesnt_exist "$DST"

for file in $FILES; do
    ln -s "$(pwd)/$file" "$DST/$file"
done
