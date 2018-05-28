#!/bin/bash
latestPRCommit=(${TRAVIS_COMMIT_RANGE//\.\.\./ })
echo latestPRCommit[1]