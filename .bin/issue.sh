#!/bin/bash
# This Bash Script has/does One Job: Return the GitHub Issue Number of the Active Branch.
[ $TRAVIS_PULL_REQUEST_BRANCH ] && B=$TRAVIS_PULL_REQUEST_BRANCH || B=$(git rev-parse --abbrev-ref HEAD)
IFS=# read BRANCH ISSUE <<< "$B";
echo "issue >> $ISSUE";
echo "name >> $BRANCH";
echo $(($ISSUE + 0)) # typecast to int