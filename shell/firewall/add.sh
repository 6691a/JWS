#!/bin/sh

# $1: port/protocal
# excample: sh add.sh 22/tcp

# ubuntu firewall
if which ufw; then
    ufw allow from ${} to any port ${} proto ${}
fi