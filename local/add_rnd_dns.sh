#!/usr/bin/env bash

readonly RESOLV=/etc/resolv.conf
readonly RND_DNS="10.57.237.91"
readonly RND_DOMAIN="cardio.rnd"
readonly CONTENT="$(cat $RESOLV)"

echo -e "search $RND_DOMAIN\nnameserver $RND_DNS\n$CONTENT" > $RESOLV
