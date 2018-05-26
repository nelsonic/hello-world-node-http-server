#!/usr/bin/expect -f
expect "Enter passphrase for ./deploy_key:"
send "$SSH_ASKPASS\r"