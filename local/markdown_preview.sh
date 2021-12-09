#!/usr/bin/env bash

timeout=$1
readonly FILE=$2
readonly TMP_FILE="$FILE.tmp.html"
lynx_pid=
sum=""

function cleanup {
    rm $TMP_FILE
}

function calc_sum {
    sha1sum $FILE
}

trap cleanup EXIT

if [[ $timeout -le 0 ]]; then
    echo "Timeout must be set to 1 or more."
    exit 1
fi

if [[ "$FILE" == "" ]]; then
    echo "You must provide valid path to markdown file."
    exit 2
fi

while [[ 1 ]]
do
    if [[ "$sum" != "$(calc_sum)" ]]; then
        if [[ -n "$lynx_pid" ]]; then
            kill $lynx_pid
            lynx_pid=
        fi

        sum=$(calc_sum)
        pandoc $FILE > $TMP_FILE
        lynx $TMP_FILE &
        lynx_pid=$!
    fi
    sleep $timeout
done
