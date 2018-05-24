# hello-world

The purpose of this repo is to test deployment with the simplest possible node.js app.



      if [[ $TRAVIS_PULL_REQUEST_BRANCH =~ $reg ]]; then
        echo "This is a pull request with an issue ...................";
      fi


issue="${TRAVIS_PULL_REQUEST_BRANCH}" | awk -F "${reg}" '{print $2}';
echo $issue;