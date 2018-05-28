#!/bin/bash
if [[ "${TRAVIS_EVENT_TYPE}" == "pull_request" ]]; then
    # We have to do some shinanigans to figure out what the source
    # branch is for this pull request.  Travis is not kindly giving
    # us an env var when it's a push to an already existing PR.
    echo "Running pull request build on Travis"
    repo_url=$(git config --get remote.origin.url)
    latestPRCommit=(${TRAVIS_COMMIT_RANGE//\.\.\./ })
    latestPRCommit=${latestPRCommit[1]}
    echo "latestPRCommit=$latestPRCommit"
    git clone ${repo_url} ${latestPRCommit}
    cd ${latestPRCommit}
    SOURCE_BRANCH=($(git branch -r --contains ${latestPRCommit}))
    export SOURCE_BRANCH=${SOURCE_BRANCH/origin\//}
    echo "SOURCE_BRANCH=$SOURCE_BRANCH"
    cd -
fi

# https://github.com/travis-ci/travis-ci/issues/6652#issuecomment-304426927