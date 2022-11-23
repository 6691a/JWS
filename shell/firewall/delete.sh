#!/bin/sh

# $1: port/protocal
# excample: sh delete.sh 22/tcp

# ubuntu firewall
if which ufw; then
    ufw deny $1
    ufw delete deny $1
fi