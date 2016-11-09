#!/bin/bash -eux

sudo apt-get -y update
sudo apt-get install -y xz-utils

mkdir -p /opt/node-6
wget https://nodejs.org/dist/v6.3.1/node-v6.3.1-linux-x64.tar.xz
tar -C /opt/node-6 --strip-components 1 -xJf node-v6.3.1-linux-x64.tar.xz
