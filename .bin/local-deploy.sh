#!/bin/bash
# First DELETE the dokku git remote (before re-creating it below):
$(git remote rm dokku)
CWD="$PWD/.bin"
$(sh $CWD/deploy.sh)