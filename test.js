'use strict';
var assert = require('assert');
var cp = require('child_process').execSync;
var get_hash = require('./hash.js');

function exec_sync (cmd) {
  return cp(cmd, { encoding: 'utf8' });
};
function commit_hash() {
  console.log('$TRAVIS', process.env.TRAVIS)
  console.log('$TRAVIS_COMMIT_RANGE', process.env.TRAVIS_COMMIT_RANGE)
  console.log('$TRAVIS_COMMIT',  process.env.TRAVIS_COMMIT)
  // if($TRAVIS) {
  //   console.log('$')
  // }
  return exec_sync('git rev-parse HEAD');
}
const hash = commit_hash();
// console.log(hash);

assert(true !== false, "there are you happy Travis!?!");
get_hash(function(e, GIT_COMMIT_HASH, stder) {
  console.log(e, GIT_COMMIT_HASH, stder)
  console.log('actual:', hash, 'expected:', GIT_COMMIT_HASH);
  // console.log(GIT_COMMIT_HASH.length)
  assert(GIT_COMMIT_HASH.length === 40, "check git commit hash for #7");
})

assert(true !== false, "there are you happy Travis!?!");
