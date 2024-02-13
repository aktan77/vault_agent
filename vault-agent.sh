#!/bin/bash
#create vault user
sudo useradd -m -s /bin/bash -u 2000004 vault

#create vault folder
sudo mkdir /apps/vault

#give access to the vault user
sudo chown vault:vault /apps/vault

#install vault binary
# sudo curl "the/path/to/artifactory"
# sudo upzip ""
sudo wget "https://releases.hashicorp.com/vault/1.15.5/vault_1.15.5_linux_amd64.zip"
sudo unzip vault_1.15.5_linux_amd64.zip
sudo mv vault /apps/vault/vault
#create symlink to the vault binary
ln -s /apps/vault/vault /usr/bin/vault

#give access to the vault user
sudo chown vault:vault /apps/vault/vault

#create/move vault agent configuration file
sudo mv vault-agent.hcl /apps/vault/vault-agent.hcl 

#create/move vault service configuration file
sudo mv vault.hcl /apps/vault/vault.hcl

#start the vault 
sudo systemctl enable vault
sudo systemctl start vault

