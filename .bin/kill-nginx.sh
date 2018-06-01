#!/bin/bash
# purge all docker containers which have status=exited
USER="root"
SSH="ssh -i ./deploy_key $USER@$SERVER_IP_ADDRESS"
echo $SSH
GREP="ps aux | grep '[n]ginx' | awk '{print $2}'"
LIST=$SSH
echo "LIST => $LIST"
CMD="kill $LIST"
echo "CMD => $CMD"
$SSH $CMD
