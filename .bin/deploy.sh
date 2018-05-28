#!/bin/bash
CWD="$PWD/.bin"
echo "CWD $CWD"
BRANCH=$(sh $CWD/branch.sh)
echo "BRANCH=> $BRANCH"
DOKKU_APP=$(sh $CWD/issue.sh)
echo "ISSUE=> $DOKKU_APP"
COMMIT_HASH=$(sh $CWD/commit-hash.sh)
echo "COMMIT_HASH=> $COMMIT_HASH"

# these could all be environment variables:
USER="root"
SSH="ssh -i ./deploy_key $USER@$SERVER_IP_ADDRESS"
URL="$SERVER_IP_ADDRESS:$DOKKU_APP"
echo "URL => $URL"

# create the dokku App
CREATE="dokku apps:create $DOKKU_APP"
echo "CREATE => $CREATE"
$SSH $CREATE

# set git remote for the "review" dokku app:
REMOTE="dokku dokku@$URL"
echo "REMOTE $REMOTE"
$(git remote add $REMOTE)

# Travis does a "shallow" git clone so we need to "unshallow" it:
$(git fetch --unshallow) # see: https://github.com/dwyl/learn-devops/issues/33
$(git config --global push.default simple)
PUSH="git push dokku $COMMIT_HASH:refs/heads/master" # this should work *everywhere*
echo "PUSH $PUSH"
$($PUSH)

# Apply the Letsencrypt Wildcard SSL/TLS Certificate to the app
CERTS="sudo dokku certs:add $DOKKU_APP < /etc/letsencrypt/live/ademo.app/certs.tar"
$SSH $CERTS

# Reload (restart) nginx so the new app is served:
RELOAD="nginx -t && nginx -s reload &> /dev/null"
$SSH $RELOAD