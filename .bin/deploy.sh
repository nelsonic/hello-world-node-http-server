#!/bin/bash
CWD="$PWD/.bin"
echo "CWD $CWD"
ISSUE=$(sh $CWD/issue.sh)
echo "ISSUE $ISSUE"
BRANCH=$(sh $CWD/branch.sh)
echo "BRANCH $BRANCH"
echo "TRAVIS_BRANCH $TRAVIS_BRANCH"

IP="138.68.163.126"
USER="root"
SSH="ssh -i ./deploy_key $USER@$IP"
URL="$IP:$ISSUE"

CREATE="dokku apps:create $ISSUE"
echo "CREATE $CREATE"
$SSH $CREATE             # create the dokku App

# set git remote:
REMOTE="dokku dokku@$URL"
echo "REMOTE $REMOTE"
$(git remote add $REMOTE)

echo "REMOTE $(git config --get remote.dokku.url)"

PUSH="git push dokku master"
echo "PUSH $PUSH"
$($PUSH)

CERTS="sudo dokku certs:add $ISSUE < /etc/letsencrypt/live/ademo.app/certs.tar"
$SSH $CERTS

RELOAD="nginx -t && nginx -s reload &> /dev/null"
$SSH $RELOAD