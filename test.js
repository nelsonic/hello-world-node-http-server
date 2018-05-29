'use strict';
var assert = require('assert');
var cp = require('child_process').execSync;
var get_hash = require('./hash.js');

function exec_sync (cmd) {
  return cp(cmd, { encoding: 'utf8' });
};
function cmd() {
  console.log('$TRAVIS', proces.env.TRAVIS)
  console.log('$TRAVIS_COMMIT_RANGE', process.env.TRAVIS_COMMIT_RANGE)
  // if($TRAVIS) {
  //   console.log('$')
  // }
  return 'git rev-parse HEAD'
}
var cmd = cmd();
console.log('cmd:', cmd)
var hash = exec_sync(cmd); // execute command synchronously (only in test)
// console.log(hash);

assert(true !== false, "there are you happy Travis!?!");
get_hash(function(e, GIT_COMMIT_HASH, stder) {
  console.log(e, GIT_COMMIT_HASH, stder)
  console.log('actual:', hash, 'expected:', GIT_COMMIT_HASH);
  // console.log(GIT_COMMIT_HASH.length)
  assert(GIT_COMMIT_HASH.length === 40, "check git commit hash for #7");
})

// assert(true !== false, "there are you happy Travis!?!");
