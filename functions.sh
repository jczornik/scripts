#!/usr/bin/env bash

get_all_files_r() {
    local base_path=$1

    find $base_path -not -type d | awk -F"$base_path/" '{print $2}'
}

get_files_to_link () {
    local base_path=$1

    get_all_files_r $base_path | sed 's/^.*install.sh$//g'
}

append_to_autostart_awesomewm () {
    local command=$1

    echo $command >> "$HOME/.config/awesome/autostart.sh"
}
