#!/usr/bin/env bash

# ISO metadata
iso_name="archlinux"
iso_label="ARCH_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_version="latest"
install_dir="arch"

# Architecture and build modes
arch="x86_64"
bootmodes=(
  'bios.syslinux.mbr' 'bios.syslinux.eltorito'
  'uefi-x64.grub.esp' 'uefi-x64.grub.eltorito'
)

# pacman configuration
pacman_conf="pacman.conf"

# file permissions
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:0750"
  ["/root/.ssh"]="0:0:0700"
  ["/root/.ssh/authorized_keys"]="0:0:0600"
  ["/usr/local/bin/lolcow"]="0:0:755"
)

# airootfs image configuration
airootfs_image_type="squashfs"
airootfs_image_tool_options=(
  '-comp' 'xz'
  '-Xbcj' 'x86'
  '-b' '1M'
  '-Xdict-size' '1M'
)
