#!/bin/bash
 
mkdir student_distro
cd student_distro
 
sudo lb config -d bullseye --debian-installer live --debian-installer-distribution bullseye --debian-installer-gui true --archive-areas "main contrib non-free" --debootstrap-options "--variant=minbase" 

cd config

mkdir bootloaders/boot
mkdir bootloaders/boot/grub
mkdir bootloaders/isolinux

mkdir includes.chroot_after_packages/etc
mkdir includes.chroot_after_packages/etc/init.d
  
cd ..
cd ..
 
cp pkgs.list.chroot student_distro/config/package-lists 

cp os-release student_distro/config/includes.chroot_after_packages/etc/

cp set_wallpapers student_distro/config/includes.chroot_after_packages/etc/init.d

cp 0600-set-wallpaper.hook.chroot student_distro/config/hooks/normal/

cp -r usr student_distro/config/includes.chroot_after_packages

cp splash.png student_distro/config/bootloaders/boot/grub
cp splash.png student_distro/config/bootloaders/isolinux

cd student_distro

sudo lb build
