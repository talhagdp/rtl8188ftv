#!/bin/bash

# check if the current user is root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# update package manager cache
pacman -Sy

# install RTL8188FTV drivers
pacman -S rtl8188ftv-dkms

# load the driver module
modprobe rtl8188ftv

echo "Completed installing RTL8188FTV drivers"
