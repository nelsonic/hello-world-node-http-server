#!/bin/bash
latestPRCommit=(${TRAVIS_COMMIT_RANGE//\.\.\./ })
latestPRCommit=${latestPRCommit[1]}
echo $latestPRCommit