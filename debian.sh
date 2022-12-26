#!/bin/bash

# check if the current user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# update package manager cache
apt update

# install build dependencies
apt install -y build-essential dkms

# download RTL8188FTV driver source
wget https://github.com/lwfinger/rtl8188ftv/archive/master.zip

# extract driver source
unzip master.zip

# build and install driver
cd rtl8188ftv-master
make
make install

# load the driver module
modprobe rtl8188ftv

echo "Completed installing RTL8188FTV drivers"
