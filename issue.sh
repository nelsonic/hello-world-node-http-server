#!/bin/bash
# This Bash Script has/does One Job: Return the name of the active Git branch.
TRAVIS_PULL_REQUEST_BRANCH=$(git rev-parse --abbrev-ref HEAD)
IFS=# read BRANCH ISSUE <<< "$TRAVIS_PULL_REQUEST_BRANCH";
# echo "issue >> $ISSUE";
# echo "name >> $BRANCH";
echo $(($ISSUE + 0)) # typecast to int