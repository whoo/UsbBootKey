Create USB key with common ISO.

Debian mini-netboot 	> http://ftp.nl.debian.org/debian/dists/wheezy/main/installer-i386/current/images/netboot
DamnSmallLinux 		> http://distro.ibiblio.org/damnsmall
DBAN			> http://www.dban.org/download
Gentoo minimal-install 	> http://distfiles.gentoo.org/releases/x86/autobuilds/current-install-x86-minimal

512Mo is needed

You need to format your usbKey.

echo "np1\n\n\n\n\nw" | fdisk /dev/sdX
mkfs.vfat -F32 -n NAMEKEY /dev/sdX1

./Generate.sh NAMEKEY (or basename mountpoint)

