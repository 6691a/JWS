#!/bin/bash

readarray TF_VARS < $TF_VAR_FILE
for (( i = 0; i < ${#TF_VARS[@]}; i++ )); do
    echo ${TF_VARS[i]}
    TF_VARS[$i]=-var=${TF_VARS[i]}
done

echo terraform apply ${TF_VARS[@]}
terraform apply ${TF_VARS[@]}
