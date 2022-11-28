
cat <<EOF >> ~/.bashrc
export TF_VAR_FILE="$HOME/jws/secret/credentials.tfvars"
export JWS_SCRIPT_DIR="$HOME/jws/shell"
export JWS_ROOT_DIR="$HOEM/jws"
EOF

# Install Docker
/bin/bash $JWS_SCRIPT_DIR/install/docker.sh

