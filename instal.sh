!/bin/bash

echo "inicio formatear unidad"
mkfs.ext4 /dev/sda2
echo "termino de formatear unidad"
mount /dev/sda2 /mnt
pacstrap /mnt linux-lts linux-firmware base nano os-prober ntfs-3g dhcpcd xorg-server xorg-xinit mesa mesa-demos
genfstab /mnt >> /mnt/etc/fstab
arch-chroot /mnt echo taboarch-pc2 > /mnt/etc/hostname
arch-chroot /mnt ln -sf /usr/share/zoneinfo/America/Santiago /etc/localtime
echo "INSTALAR IDIOMA SISTEMA"
arch-chroot /mnt sed -i 's/#es_CL.UTF-8 UTF-8/es_CL.UTF-8 UTF-8/' /etc/locale.gen
arch-chroot /mnt locale-gen
arch-chroot /mnt hwclock -w
arch-chroot /mnt echo KEYMAP=la-latin1 > /mnt/etc/vconsole.conf
arch-chroot /mnt echo LANG=es_CL.UTF8 > /etc/locale.conf

arch-chroot /mnt pacman -Syu --noconfirm --needed xf86-video-nouveau
arch-chroot /mnt pacman -Syu --noconfirm --needed opera opera-ffmpeg-codecs leafpad epdfview firefox firefox-i18n-es-cl file-roller
arch-chroot /mnt pacman -Syu --noconfirm --needed gnome-themes-extra sudo gnome-disk-utility xdg-user-dirs
arch-chroot /mnt pacman -Syu --noconfirm --needed lxterminal openbox pcmanfm lxpanel xterm lxdm
arch-chroot /mnt systemctl enable lxdm.service

#echo "INGRESE PASSWORD ROOT"
#arch-chroot /mnt passwd

#arch-chroot /mnt useradd -m aaalinux
#echo "INGRESE PASSWORD USUARIO"
#arch-chroot /mnt passwd aaalinux

#arch-chroot /mnt sed -i 's/# %wheel ALL=(ALL) ALL/aaalinux ALL=(ALL) ALL/' /etc/sudoers
