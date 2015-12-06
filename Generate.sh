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


pushd tmp
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

