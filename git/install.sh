#!/usr/bin/env bash

source ../functions.sh

readonly DST="$HOME"
readonly FILES=$(get_all_files_r "$(pwd)")

for file in $FILES; do
    chmod +x "$file"
done

ln -s "$(pwd)/.git-templates" "$DST/.git-templates"
git config --global init.templatedir "$DST/.git-templates"
