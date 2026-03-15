#!/bin/sh

# https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-install?tabs=dotnet10&pivots=os-linux-ubuntu-2404#ubuntu-2404

sudo -v

wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install -y dotnet-runtime-8.0 dotnet-sdk-8.0
