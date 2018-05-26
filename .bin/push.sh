#!/bin/bash
CWD="$PWD/.bin"

BRANCH=$(sh $CWD/branch.sh)
echo "BRANCH $BRANCH"

PUSH="git push dokku $BRANCH:master"
echo "PUSH $PUSH"
$($PUSH)