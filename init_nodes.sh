#!/bin/bash
# Reset known hosts
rm ~/.ssh/known_hosts
touch ~/.ssh/known_hosts


SUDOERS_ENTRY="ubuntu ALL=(ALL) NOPASSWD: ALL"
DIR_PATH="/mnt/config/radarr"
USER_ID=568
GROUP_ID=568
SSH_USER="ubuntu"
SERVERS=(
  "192.168.0.201"
  "192.168.0.202"
  "192.168.0.203"
  "192.168.0.204"
  "192.168.0.205"
  "192.168.0.206"
  "192.168.0.207"
)

setup_server() {
    SERVER_IP=$1
    echo "Connecting to $SERVER"
    ssh ${SSH_USER}@${SERVER_IP} "sudo apt-get update"
    ssh ${SSH_USER}@${SERVER_IP} "sudo apt-get install -y nfs-common"
    ssh ${SSH_USER}@${SERVER_IP} "echo '$SUDOERS_ENTRY' | sudo tee /etc/sudoers.d/99_ubuntu_nopasswd"
    ssh ${SSH_USER}@${SERVER_IP} "sudo mkdir -p ${DIR_PATH} && sudo chown -R ${USER_ID}:${GROUP_ID} ${DIR_PATH}"
    if [ $? -eq 0 ]; then
        echo "Successfully set up $SERVER_IP"
    else
        echo "Failed to set up $SERVER_IP"
    fi
}

for SERVER in "${SERVERS[@]}"; do
    setup_server ${SERVER}
done
