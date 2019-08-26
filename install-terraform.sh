#!/bin/bash

# Author      : BALAJI POTHULA <balaji.pothula@techie.com>,
# Date        : 16 August 2019,
# Description : Installing Terraform on rhel.

# exits any line in the bash script fails.
set -e

# updating rhel packages.
sudo yum -y update

# installing openjdk8 unzip.
sudo yum -y install unzip

# downloading and running sonarscanner.
curl -J -L https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip -o $HOME/terraform.zip && \
unzip -q $HOME/terraform.zip -d $HOME                                                                              && \
rm -rf   $HOME/terraform.zip                                                                                       && \
export PATH=$PATH:$HOME
