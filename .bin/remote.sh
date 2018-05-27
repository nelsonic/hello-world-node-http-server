#!/bin/bash
CWD="$PWD/.bin"
ISSUE=$(sh $CWD/issue.sh)
# echo "$ISSUE"
IP="138.68.163.126"
URL="$IP:$ISSUE"
echo "$URL"
REMOTE="dokku dokku@$URL"
echo "$REMOTE"
# [ $(git config --get remote.dokku.url) ] && $(git remote set-url $REMOTE) || $(git remote add "$REMOTE" &> /dev/null )
# &> /dev/null
$(git remote add "$REMOTE")