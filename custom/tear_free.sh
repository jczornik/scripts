#!/usr/bin/env bash

OUTPUTS=$(xrandr | grep " connected " | awk '{ print $1 }')

for OUTPUT in $OUTPUTS; do
    echo "Setting TearFree for: $OUTPUT"
    xrandr --output $OUTPUT --set TearFree on
done
