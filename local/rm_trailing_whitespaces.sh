#!/usr/bin/env bash

source ../functions.sh

readonly BASE_PATH=$1
readonly FILES=$(get_all_files_r $BASE_PATH)

for file in $FILES; do
    sed -i 's/[ \t]*$//' "$BASE_PATH/$file"
done
