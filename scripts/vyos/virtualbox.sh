#!/bin/bash

set -e
set -x

sudo aptitude -y install build-essential
sudo aptitude -y install dkms
sudo aptitude -y install linux-vyatta-kbuild
sudo aptitude -y install xserver-xorg

sudo ln -s /usr/src/linux-image/debian/build/build-amd64-none-amd64-vyatta "/lib/modules/$(uname -r)/build"

sudo mount -o loop ~/VBoxGuestAdditions.iso /mnt/
yes | sudo /mnt/VBoxLinuxAdditions.run || :
sudo umount /mnt/
rm -f ~/VBoxGuestAdditions.iso
