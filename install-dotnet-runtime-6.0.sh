#!/bin/sh

# https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-1804

sudo -v

wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install -y dotnet-runtime-6.0
