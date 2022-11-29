#!/bin/bash

HOME_DIR=$(echo $HOME)

cat <<EOF >> $HOME_DIR/.bash_profile
export JWS_ROOT_DIR=$HOME_DIR/jws
export TF_VAR_FILE=$JWS_ROOT_DIR/secret/credentials.tfvars
export JWS_SCRIPT_DIR=$JWS_ROOT_DIR/shell
EOF


source $HOME_DIR/.bash_profile

# Install Docker
bash $JWS_SCRIPT_DIR/install/docker.sh



