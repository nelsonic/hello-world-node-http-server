# Hello World!

[![Build Status](https://travis-ci.org/nelsonic/hello-world-node-http-server.svg?branch=master)](https://travis-ci.org/nelsonic/hello-world-node-http-server)
[![dependencies Status](https://david-dm.org/nelsonic/hello-world-node-http-server/status.svg)](https://david-dm.org/nelsonic/hello-world-node-http-server)


The purpose of this repo is to test deployment
with the simplest possible node.js app.

## Run it:

```sh
git clone git@github.com:nelsonic/hello-world-node-http-server.git && cd hello-world-node-http-server
npm start
```
Visit: http://localhost:3000 in your web browser.

You should see:
![hello-world-localhost](https://user-images.githubusercontent.com/194400/40722414-2d239d5a-6414-11e8-98a2-31c1a307c2c3.png)


_That's it!_

<br />


## Why?

This app was/is used to test our "ACID" deployment process.
see: https://github.com/dwyl/learn-devops/issues/24




# Automated Continuous Integration Deployment (ACID) _MVP_

## 1. Get Branch Issue Number

See: `branch.sh`
e.g: 42

## 2. Create Dokku App

create the Dokku app for the issue number:
```
ssh root@138.68.163.126 dokku apps:create <appname>
```
e.g:
```
ssh root@138.68.163.126 dokku apps:create $(sh ./issue.sh)
```
Or for the `master`:
```
ssh root@138.68.163.126 dokku apps:create hello-world-node
```


## 3. Add Git Remote

```
git remote add dokku dokku@138.68.163.126:$(sh ./issue.sh)
```
### 3.b

Delete the remote
```
git remote rm dokku
```
Master:
```
git remote add dokku dokku@138.68.163.126:hello-world-node
```

## 4. Git PUSH Branch to Remote

```
git push dokku $(sh ./branch.sh):master
```

## 5. Add SSL Cert to App

Add the wildcard Cert to the Newly Created App

```
ssh root@138.68.163.126 "sudo dokku certs:add $(sh ./issue.sh) < /etc/letsencrypt/live/ademo.app/certs.tar"
```

```
ssh root@138.68.163.126 "sudo dokku certs:add hello-world-node < /etc/letsencrypt/live/ademo.app/certs.tar"
```

## 6. Reload `nginx`

```sh
ssh root@138.68.163.126 "nginx -t && nginx -s reload"
```

## Add Dokku User on Server:

If you are using Dokku to deploy your app,
run the following command on your _server_ instance:
```
ssh root@138.68.163.126
cat ~/.ssh/id_rsa.pub | sudo sshcommand acl-add dokku root
```
