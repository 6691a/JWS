#!/bin/sh
# $1: username

# not variable -> make ssh key
# $2: ssh-key 

HOME_DIR=/home/$1

sudo groupadd $1
sudo useradd -m $1 -g $1

cd ${HOME_DIR}

mkdir .ssh
chmod 700 .ssh

if [-n "$2"];
then
 echo $2 > .ssh/authorized_keys
else
ssh-keygen -f ${HOME_DIR}/.ssh/id_rsa -t rsa -m pem -N ""
 mv ${HOME_DIR}/.ssh/id_rsa ${HOME_DIR}/.ssh/$1.pem
 mv ${HOME_DIR}/.ssh/id_rsa.pub ${HOME_DIR}/ssh/authorized_keys
fi
