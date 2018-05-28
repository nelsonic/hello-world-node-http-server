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
$(git fetch --unshallow) # https://github.com/dwyl/learn-devops/issues/33
$(git config --global push.default simple)
$(git pull origin $BRANCH)
PUSH="git push dokku $COMMIT_HASH:master" # branch is always master ...?
echo "PUSH $PUSH"
$($PUSH)

CERTS="sudo dokku certs:add $ISSUE < /etc/letsencrypt/live/ademo.app/certs.tar"
$SSH $CERTS

RELOAD="nginx -t && nginx -s reload"
$SSH $RELOAD