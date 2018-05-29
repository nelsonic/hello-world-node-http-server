'use strict';
const { execFile } = require('child_process');
// https://nodejs.org/api/child_process.html#child_process_child_process_exec_command_options_callback
module.exports = function git_hash (callback) {
  return execFile('sh', ['.bin/commit-hash.sh'], callback);
}
