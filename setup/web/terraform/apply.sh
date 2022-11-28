#!/bin/bash

COMMAND="terraform apply"

while [[ $# -gt 0 ]];
do
    case $1 in
        -d|--debug) 
            DEBUG=1;;

        -p|--password)
            if [ $2 ];
            then
                PASSWORD_KEY=$2 shift
            else
                PASSWORD_KEY=proxmox_root_password
            fi
    esac
    shift
done


TF_VARS=()

while read -r line;
do
    KEY=$(echo $line | cut -d '=' -f1)
    VALUE=$(echo $line | cut -d '=' -f2)
    if [ "$KEY" = "$PASSWORD_KEY" ];
    then
        continue;
    fi
    TF_VARS+=("-var=$KEY=$VALUE")
done <$TF_VAR_FILE
echo ${TF_VARS[@]}

if [ "$DEBUG" = 1 ];
then
    echo $COMMAND ${TF_VARS[@]}
fi

$COMMAND ${TF_VARS[@]}
