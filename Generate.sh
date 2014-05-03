#!/bin/bash

####################

DISK=disk
MOUNT=/mnt/disk

DISK=/dev/sdg
MOUNT=/run/media/domi/3A75-9CA6

# Get distrib
########

mkdir tmp
pushd tmp
wget -c http://ftp.nl.debian.org/debian/dists/testing/main/installer-i386/current/images/netboot/mini.iso -O mini.iso
wget -c http://distro.ibiblio.org/damnsmall/current/dsl-4.4.10-initrd.iso -O dsl.iso
wget -c 'http://downloads.sourceforge.net/project/dban/dban/dban-2.2.8/dban-2.2.8_i586.iso?r=http%3A%2F%2Fwww.dban.org%2Fdownload&ts=1399148236&use_mirror=hivelocity' -O dban.iso
wget -c 'http://distro.ibiblio.org/tinycorelinux/5.x/x86/release/TinyCore-current.iso' -O tinycore.iso
wget -c http://distfiles.gentoo.org/releases/x86/autobuilds/current-install-x86-minimal/install-x86-minimal-20140415.iso -O gentoo.iso
cp *iso ${MOUNT}
popd


# Create
########



# Grub
########
grub2-install --boot-directory=${MOUNT} ${DISK}
cp grub.cfg ${MOUNT}/grub
