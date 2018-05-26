#!/bin/bash
CWD="$PWD/.bin"
echo "CWD $CWD"
ISSUE=$(sh $CWD/issue.sh)
echo "ISSUE $ISSUE"
BRANCH=$(sh $CWD/branch.sh)
echo "BRANCH $BRANCH"
IP="138.68.163.126"
USER="root"
SSH="ssh -i ./deploy_key $USER@$IP"

CREATE="dokku apps:create $ISSUE"
echo "CREATE $CREATE"
$SSH $CREATE             # create the dokku App

$(sh $CWD/remote.sh &> /dev/null) # Set Git Remote URL
echo "REMOTE $(git config --get remote.dokku.url)"

PUSH="git push dokku $BRANCH:master"
echo "PUSH $PUSH"
$($PUSH)

CERTS="sudo dokku certs:add $ISSUE < /etc/letsencrypt/live/ademo.app/certs.tar"
$SSH $CERTS

RELOAD="nginx -t && nginx -s reload &> /dev/null"
$SSH $RELOAD