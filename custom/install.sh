#!/usr/bin/env bash

source ../functions.sh

readonly FILES=$(get_files_to_link $(pwd))
readonly DST=/usr/local/bin/

for file in $FILES; do
    sudo ln -s "$(pwd)/$file" "$DST/$file"
    append_to_autostart_awesomewm $file
done
