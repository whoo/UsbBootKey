#!/bin/bash

#DISK=
#MOUNT=/mnt/disk

NAME=BOOTER
DEST=$(mount |grep $NAME | awk  	 '{print $3}')
DISK=$(mount |grep $NAME | awk -F'[0-9]' '{print $1}')
echo "Transform $DISK $NAME en clef bootable $DEST" 
read

# Get distrib
########
mkdir -p tmp
pushd tmp
#Debian 
wget -c 'http://ftp.nl.debian.org/debian/dists/testing/main/installer-i386/current/images/netboot/mini.iso' -O mini.iso
#DamnSmall Linux
wget -c 'http://distro.ibiblio.org/damnsmall/current/dsl-4.4.10-initrd.iso' -O dsl.iso
#DBAN
wget -c 'http://downloads.sourceforge.net/project/dban/dban/dban-2.2.8/dban-2.2.8_i586.iso?r=http%3A%2F%2Fwww.dban.org%2Fdownload&ts=1399148236&use_mirror=hivelocity' -O dban.iso
#TinyCore
wget -c 'http://distro.ibiblio.org/tinycorelinux/5.x/x86/release/TinyCore-current.iso' -O tinycore.iso
#Gentoo
wget -c 'http://distfiles.gentoo.org/releases/x86/autobuilds/current-install-x86-minimal/install-x86-minimal-20140415.iso' -O gentoo.iso
cp *.iso ${DEST}
popd

# Grub
########
grub2-install --boot-directory=${DEST} ${DISK}
cp grub.cfg ${DEST}/grub
