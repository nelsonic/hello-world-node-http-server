var http = require('http');
var fs = require('fs');
var index = fs.readFileSync(__dirname + '/index.html', 'utf8');
var favicon = fs.readFileSync(__dirname + '/favicon.ico');
const get_hash = require('./hash.js');
console.log('cwd', __dirname);
require('env2')('./ENV');

http.createServer(function (req, res) {
  console.log("URL:", req.url);
  if (req.url.indexOf('favicon') > -1) {
    res.writeHead(200, {'Content-Type': 'image/x-icon'});
    res.end(favicon);
  }
  else {
    res.writeHead(200, {'Content-Type': 'text/html'});
    get_hash(function(e, GIT_COMMIT_HASH, stder) {
      console.log(e, GIT_COMMIT_HASH, stder);
      res.end(index.replace('{GIT_COMMIT_HASH}', GIT_COMMIT_HASH));
    })

  }
}).listen(process.env.PORT || 3000);
