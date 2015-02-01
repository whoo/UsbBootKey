#!/bin/bash

# fdisk to create one partition
# mkfs.vfat -F32 -n BOOTER /dev/sdX1

if [  "x$1" = "x" ]
then
echo "Need a key name"
exit
fi

NAME=$1
DEST=$(mount |grep $NAME | awk  	 '{print $3}')
DISK=$(mount |grep $NAME | awk -F'[0-9]' '{print $1}')
echo "Please check !"
mount | grep vfat
echo "Transform $DISK $NAME en clef bootable $DEST" 
read

##########################
# Get distrib
########
mkdir -p tmp
pushd tmp
#Debian 
wget -c 'http://ftp.ca.debian.org/debian/dists/testing/main/installer-i386/current/images/netboot/mini.iso' -O mini.iso
##DamnSmall Linux
wget -c 'http://distro.ibiblio.org/damnsmall/current/dsl-4.4.10-initrd.iso' -O dsl.iso
##DBAN
wget -c 'http://downloads.sourceforge.net/project/dban/dban/dban-2.2.8/dban-2.2.8_i586.iso?r=http%3A%2F%2Fwww.dban.org%2Fdownload&ts=1399148236&use_mirror=hivelocity' -O dban.iso
##TinyCore
wget -c 'http://distro.ibiblio.org/tinycorelinux/5.x/x86/release/TinyCore-current.iso' -O tinycore.iso
##Gentoo
wget -c 'http://distfiles.gentoo.org/releases/x86/autobuilds/current-install-x86-minimal/install-x86-minimal-20141209.iso' -O gentoo.iso
wget -c 'http://www.memtest.org/download/5.01/memtest86+-5.01.bin.gz' -O memtest86.bin.gz
zcat memtest86.bin.gz > memtest86.bin
wget -c "http://distro.ibiblio.org/tinycorelinux/6.x/x86_64/release/CorePure64-6.0.iso" -O tinycore64.iso
cp -v *.iso *.bin ${DEST}
popd

# Grub
########
if [ `which grub2-install`  ]
then
	grub2-install --boot-directory=${DEST} ${DISK}
	cp grub.cfg ${DEST}/grub
else
	echo "Grub not found :'"
fi
