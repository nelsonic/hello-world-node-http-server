// https://pm2.io/doc/en/runtime/guide/easy-deploy-with-ssh
module.exports = {
  apps: [{
    name: "hellow-world-app",
    script: "server.js"
  }],
  deploy: {
    // "production" is the environment name
    production: {
      // SSH key path, default to $HOME/.ssh
      key: "~/.ssh/deploy_key",
      // SSH user
      user: "root",
      // SSH host
      host: ["206.189.26.154"],
      // SSH options with no command-line flag, see 'man ssh'
      // can be either a single string or an array of strings
      ssh_options: "StrictHostKeyChecking=no",
      // GIT remote/branch
      ref: "origin/master",
      // GIT remote
      repo: "git@github.com:nelsonic/hello-world-node-http-server.git",
      // path in the server
      path: "/root",
      // Pre-setup command or path to a script on your local machine
      "pre-setup": "ls -la",
      // Post-setup commands or path to a script on the host machine
      // eg: placing configurations in the shared dir etc
      "post-setup": "ls -la",
      // pre-deploy action
      "pre-deploy":"git pull",
      // "pre-deploy-local": "echo 'This is a local executed command'",
      // post-deploy action
      "post-deploy": "npm install"
    },
  }
}