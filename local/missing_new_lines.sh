#!/usr/bin/env bash

source ../functions.sh

readonly BASE_PATH=$1
readonly FILES=$(get_all_files_r $BASE_PATH)

for file in $FILES; do
    tail -c1 "$BASE_PATH/$file" | read -r _ | echo >> "$BASE_PATH/$file"
done
