#!/bin/bash
 #!/usr/bin/expect -f
spawn ssh-add ./deploy_key
expect "Enter passphrase for ./deploy_key:"
send "$SSH_ASKPASS\r"
interact