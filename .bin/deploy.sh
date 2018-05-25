#!/bin/bash
CWD="$PWD/.bin"
echo "CWD $CWD"
ISSUE=$(sh $CWD/issue.sh)
echo "ISSUE $ISSUE"
BRANCH=$(sh $CWD/branch.sh)
IP="138.68.163.126"
echo "ISSUE $ISSUE"
CMD="dokku apps:create $ISSUE"
echo "CMD $CMD"
ssh root@138.68.163.126 $CMD # create the dokku App
$(sh $CWD/remote.sh)         # Set Git Remote URL