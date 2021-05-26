#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 16 August 2019,
# Description : Installing Terraform on Ubuntu.

# Exit immediately if a command exits with a non-zero exit status.
set -e

# Debugging shell script.
set -x

# Update package repositories.
sudo apt -y update

# Upgrading packages.
sudo apt -y upgrade

# installing unzip.
sudo apt -y install unzip

# downloading and extracting terraform.
curl -J -L https://releases.hashicorp.com/terraform/0.15.4/terraform_0.15.4_linux_amd64.zip -o $HOME/terraform.zip && \
unzip -q $HOME/terraform.zip -d $HOME                                                                              && \
rm -rf   $HOME/terraform.zip

# setting terraform path.
echo "export PATH=$PATH:$HOME" | tee -a $HOME/.bashrc $HOME/.profile
source $HOME/.bashrc $HOME/.profile
