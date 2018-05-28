#!/bin/bash
latestPRCommit=(${TRAVIS_COMMIT_RANGE//\.\.\./ })
latestPRCommit=${latestPRCommit[1]}
echo $latestPRCommit

# via https://github.com/travis-ci/travis-ci/issues/6652#issuecomment-304426927