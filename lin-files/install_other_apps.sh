#!/bin/bash
set -x


TERRAFORM_VERSION="0.12.24"
PACKER_VERSION="1.5.4"

# Installing bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
echo "y" |~/.bash_it/install.sh

# Install ansible unzip
sudo apt-get update
sudo apt-get -y install ansible unzip


sudo apt -y install python-pip

# install awscli and ebcli
sudo apt -y install awscli

#terraform
T_VERSION=$(/usr/local/bin/terraform -v | head -1 | cut -d ' ' -f 2 | tail -c +2)
T_RETVAL=${PIPESTATUS[0]}

[[ $T_VERSION != $TERRAFORM_VERSION ]] || [[ $T_RETVAL != 0 ]] \
&& wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
&& sudo unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
&& rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# packer
P_VERSION=$(/usr/local/bin/packer -v)
P_RETVAL=$?

[[ $P_VERSION != $PACKER_VERSION ]] || [[ $P_RETVAL != 1 ]] \
&& wget -q https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
&& sudo unzip -o packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin \
&& rm packer_${PACKER_VERSION}_linux_amd64.zip

# install Azure CLI

# Install prerequisite packages
sudo apt-get -y install apt-transport-https lsb-release software-properties-common dirmngr -y

# Modify sources list
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    sudo tee /etc/apt/sources.list.d/azure-cli.list

# Get the Microsoft signing key
sudo apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv \
     --keyserver packages.microsoft.com \
     --recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF

# Install Azure CLI
sudo apt-get update
sudo apt-get -y install azure-cli


# Install AliCloud Cli

wget -q "https://aliyuncli.alicdn.com/aliyun-cli-linux-3.0.2-amd64.tgz" \
&& gunzip aliyun-cli-linux-3.0.2-amd64.tgz \
&& tar xf aliyun-cli-linux-3.0.2-amd64.tar \
&& sudo mv aliyun /usr/local/bin \
&& sudo rm aliyun-cli*


# Install Google Cloud CLI

export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get -y install google-cloud-sdk

# Install Kubectl
sudo apt-get -y install kubectl


sudo apt-get clean