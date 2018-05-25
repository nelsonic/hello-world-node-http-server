#!/bin/bash
CWD="$PWD/.bin"
echo "CWD $CWD"
ISSUE=$(sh $CWD/issue.sh)
echo "ISSUE $ISSUE"
BRANCH=$(sh $CWD/branch.sh)
echo "BRANCH $BRANCH"
IP="138.68.163.126"
USER="root"

PASS=$(which sshpass)
# echo "$PASS"
# NOCHECK="-o StrictHostKeyChecking=no"
SSH="$PASS -e ssh -i ./deploy_key $USER@$IP"
echo "SSH $SSH"
# CMD="touch $BRANCH"
CMD="pwd; ~."
echo "CMD $CMD"
$SSH "$CMD"
exit