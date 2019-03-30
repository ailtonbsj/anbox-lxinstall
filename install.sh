#!/bin/bash

if [ "$(id -u)" != "0" ]; then
	echo "need root"
	exit
fi

apt install aapt -y
apt install snapd -y

add-apt-repository ppa:morphis/anbox-support -y
apt update
apt install linux-headers-generic anbox-modules-dkms -y
modprobe ashmem_linux
modprobe binder_linux
snap install --devmode --beta anbox

#gtk-common-themes
#sudo snap remove gnome-3-28-1804
cp -f anbox-lxinstall /usr/bin
