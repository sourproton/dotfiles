# Arch installation

June 2023

With systemd-boot full KDE Plasma

Based on the Arch Wiki's [install guide](https://wiki.archlinux.org/title/Installation_guide)

## 1 Pre-installation

### 1.1 Verify the boot mode

```
$ ls /sys/firmware/efi/efivars
```

### 1.2 Connect to the internet

Use ethernet cable, or phone tethering, or iwctl:

```
$ iwctl

[iwd]# device list

[iwd]# device {device} set-property Powered on

[iwd]# adapter {adapter} set-property Powered on

[iwd]# station {device} scan

[iwd]# station {device} get-networks

[iwd]# station {device} connect {SSID}

$ ping google.com
```

### 1.3 Update the system clock

```
$ timedatectl
```

### 1.4 Partition the disks

GPT. Create 3 partitions:

- 2G EFI (type 1)
- 8G swap (type 19)
- root (type 23)

```
$ fdisk -l

$ fdisk /dev/{the_disk_to_be_partitioned}

# g

# p

# w
```

### 1.5 Format the partitions

```
$ mkfs.ext4 /dev/{root_partition}

$ mkswap /dev/{swap_partition}

$ mkfs.fat -F 32 /dev/{efi_system_partition}
```

### 1.6 Re-label the root partiton

```
$ e2label /dev/{root_partition} {label}
```

### 1.7 Mount the file systems

```
$ mount /dev/{root_partition} /mnt

$ mount --mkdir /dev/{efi_system_partition} /mnt/boot

$ swapon /dev/{swap_partition}
```

## 2 Installation

### 2.1 Install essential packages

```
$ pacstrap -K /mnt base linux linux-firmware linux-lts linux-headers linux-lts-headers intel-ucode networkmanager sof-firmware base-devel git nano vim helix alacritty man-db zsh
```

## 3 System configuration

### 3.1 Fstab

```
$ genfstab -U /mnt >> /mnt/etc/fstab
```

### 3.2 Chroot

```
$ arch-chroot /mnt
```

### 3.3 Time zone

```
$ ln -sf /usr/share/zoneinfo/{Region}/{City} /etc/localtime

$ hwclock --systohc
```

### 3.4 Localization

**Edit** `/etc/locale.gen` and uncomment `en_US.UTF-8 UTF-8` and `fr_FR.UTF-8`

```
$ locale-gen
```

**Create** `/etc/locale.conf`

```
LANG=en_US.UTF-8
LC_TIME=fr_FR.UTF-8
LC_MONETARY=fr_FR.UTF-8
LC_PAPER=fr_FR.UTF-8
LC_MEASUREMENT=fr_FR.UTF-8
```

### 3.5 Network configuration

```
$ echo "{myhostname}" > /etc/hostname
```

### 3.6 Root password

```
$ passwd
```

### 3.7 Bootloader

```
$ bootctl install
```

**Create** `/boot/loader/entries/arch.conf`

```
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /initramfs-linux.img
options root="LABEL={label}" rw
```

**Create** `/boot/loader/entries/arch-lts.conf`

```
title   Arch Linux LTS
linux   /vmlinuz-linux-lts
initrd  /intel-ucode.img
initrd  /initramfs-linux-lts.img
options root="LABEL={label}" rw
```

**Edit** `boot/loader/loader.conf`

```
default      arch-lts.conf
timeout      3
console-mode max
editor       no
```

Update

```
$ bootctl update
```

### 3.8 Sudo user

```
$ useradd -m -g users -G wheel {username}

$ passwd {username}
```

**Uncomment** `%wheel ALL=(ALL) ALL`

```
$ EDITOR={editor} visudo
```

### 3.9 Desktop environment

```
$ pacman -S xorg plasma plasma-wayland-session kde-applications
```

```
$ pacman -S firefox thunderbird libreoffice-still tmux neofetch discord qbittorrent htop
```

### 3.10 Activate services

```
$ systemctl enable NetworkManager

$ systemctl enable bluetooth

$ systemctl enable sddm

$ systemctl enable systemd-boot-update
```

### 3.11 Finish

```
$ exit

$ umount -R /mnt

$ reboot
```

## 4 Post configuration

### 4.1 dotfiles

```
$ cd .config

$ git init

$ git remote add origin {PATH/TO/REPO}

$ git fetch

$ git switch master
```

### To-dos

- steam
- zsh + ohmyzsh
- rustup
- juliaup
- deafault applications
- shortcuts
- wallpaper
- docker + statusbar
- theme
