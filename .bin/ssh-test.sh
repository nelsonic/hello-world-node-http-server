#!/bin/bash
# sshpass -e uses the $SSHPASS Environment Variable:
sshpass -e ssh -i ./deploy_key root@138.68.163.126 pwd