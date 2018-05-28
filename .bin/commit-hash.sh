#!/bin/bash
C=$(git rev-parse --verify HEAD)
if [ "$TRAVIS_PULL_REQUEST" == "true" ]; then 
    latestPRCommit=(${TRAVIS_COMMIT_RANGE//\.\.\./ })
    C=${latestPRCommit[1]}
fi
echo $C