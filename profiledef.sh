#!/usr/bin/env bash

# ISO metadata
iso_name="archlinux"
iso_label="ARCH_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_version="latest"
install_dir="arch"

# Architecture and build modes
arch="x86_64"
bootmodes=('uefi-x64.systemd-boot.esp')

# pacman configuration
pacman_conf="pacman.conf"
file_permissions=(
  ["/etc/shadow"]="0:0:400"
)

# airootfs image configuration
airootfs_image_type="squashfs"
airootfs_image_tool_options=(
  '-comp' 'xz'
  '-Xbcj' 'x86'
  '-b' '1M'
  '-Xdict-size' '1M'
)
