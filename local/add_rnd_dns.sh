#!/usr/bin/env bash

readonly RESOLV=/etc/resolv.conf
readonly RND_DNS="10.57.237.48"
readonly RND_DOMAIN="toolkit.rnd"
readonly CONTENT="$(cat $RESOLV)"

echo -e "search $RND_DOMAIN\nnameserver $RND_DNS\n$CONTENT" > $RESOLV
