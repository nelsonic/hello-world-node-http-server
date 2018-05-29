'use strict';
const { execFile } = require('child_process');
const { resolve } = require('path');
const { EOL } = require('os');

// https://nodejs.org/api/child_process.html#child_process_child_process_exec_command_options_callback
module.exports = function git_hash (callback) {
  const filepath = resolve(__dirname, '.bin/commit-hash.sh');
  if (process.env.TRAVIS) { // see: https://git.io/vh3M7 (yes, it's lame!)
    return callback(null, process.env.TRAVIS_COMMIT, null);
  }
  if (process.env.GIT_REV) { // dokku app has thi in /home/dokku/<app-name>/ENV
    console.log('process.env.GIT_REV', process.env.GIT_REV);
    return callback(null, process.env.GIT_REV, null);
  }
  return execFile('sh', [filepath], function(e, stdout, stderr) {
    return callback(e, stdout.replace(EOL, ''), stderr);
  });
}
