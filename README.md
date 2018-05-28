# hello-world

The purpose of this repo is to test deployment with the simplest possible node.js app.



# Automated Continuous Integration Deployment (ACID) Steps

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

## 3. Add Git Remote

```
git remote add dokku dokku@138.68.163.126:$(sh ./issue.sh)
```
### 3.b

Delete the remote
```
git remote rm dokku
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

>> https://github.com/dwyl/learn-devops/issues/34