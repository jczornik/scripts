#!/usr/bin/env bash

commit_msg="$1"

function get_jira_ticket () {
    git branch --show-current | awk -F_ '{ print $1 }'
}

commit_msg="[$(get_jira_ticket)] $commit_msg"

git commit -m "$commit_msg"
