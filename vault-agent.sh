#!/bin/bash
#create vault user
sudo useradd -m -s /bin/bash -u 2000004 vault

#create vault folder
sudo mkdir -p /apps/vault
sudo mkdir -p /apps/vault/sercret

#give access to the vault user
sudo chown vault:vault /apps/vault
sudo chown vault:vault /apps/vault/secret

#install vault binary
# sudo curl "the/path/to/artifactory"
# sudo upzip ""
sudo wget "https://releases.hashicorp.com/vault/1.15.5/vault_1.15.5_linux_amd64.zip"
sudo unzip vault_1.15.5_linux_amd64.zip
sudo mv vault /apps/vault/vault
#create symlink to the vault binary
sudo ln -s /apps/vault/vault /usr/bin/vault

#give access to the vault user
sudo chown vault:vault /apps/vault/vault

#create/move vault agent configuration file
sudo cp vault-agent.hcl /apps/vault/vault-agent.hcl 

#create/move vault service configuration file
sudo cp vault.service /etc/systemd/system/vault.service

#start the vault 
sudo systemctl daemon-reload
sudo systemctl enable vault
sudo systemctl start vault

