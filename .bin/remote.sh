#!/bin/bash
CWD="$PWD/.bin"
ISSUE=$(sh $CWD/issue.sh)
# echo "ISSUE $ISSUE"
IP="138.68.163.126"
URL="$IP:$ISSUE"
REMOTE="dokku dokku@$URL"
echo "REMOTE $REMOTE"
# [ $(git config --get remote.dokku.url) ] && $(git remote set-url $REMOTE) || $(git remote add "$REMOTE" &> /dev/null )
# &> /dev/null
$(git remote add "$REMOTE")