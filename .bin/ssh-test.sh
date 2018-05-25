#!/bin/bash
CWD="$PWD/.bin"
echo "CWD $CWD"
ISSUE=$(sh $CWD/issue.sh)
echo "ISSUE $ISSUE"
BRANCH=$(sh $CWD/branch.sh)
echo "BRANCH $BRANCH"
IP="138.68.163.126"
USER="root"
SSH="ssh $USER@$IP"

# CMD="touch $BRANCH"
CMD="pwd exit"
echo "CMD $CMD"
$SSH $CMD