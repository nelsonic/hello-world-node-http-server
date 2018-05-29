'use strict';
const assert = require('assert');
const { EOL } = require('os');
const cp = require('child_process').execSync;
const get_hash = require('./hash.js');

function exec_sync (cmd) {
  return cp(cmd, { encoding: 'utf8' });
};
function commit_hash() {
  if (process.env.TRAVIS) { // travis does a "shallow git clone"... git.io/vh3M7
    console.log('$TRAVIS', process.env.TRAVIS)
    console.log('$TRAVIS_COMMIT_RANGE', process.env.TRAVIS_COMMIT_RANGE)
    console.log('$TRAVIS_COMMIT',  process.env.TRAVIS_COMMIT)
    return process.env.TRAVIS_COMMIT;
  }
  return exec_sync('git rev-parse HEAD').replace(EOL, '');
}

get_hash(function(e, GIT_COMMIT_HASH, stder) {
  const ACTUAL_HASH = commit_hash();
  console.log(e, GIT_COMMIT_HASH, stder)
  console.log('actual:', ACTUAL_HASH, ACTUAL_HASH.length,
  'expected:', GIT_COMMIT_HASH, GIT_COMMIT_HASH.length);
  // console.log(GIT_COMMIT_HASH.length)
  assert(ACTUAL_HASH === GIT_COMMIT_HASH, "git commit hash is consistent");
  assert(GIT_COMMIT_HASH.length === 40, "check git commit hash for #7");
})

assert(true !== false, "there are you happy Travis!?!");
