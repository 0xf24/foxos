#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# repos
rpm --import https://downloads.1password.com/linux/keys/1password.asc
rpm --import https://pkgs.tailscale.com/stable/fedora/repo.gpg

# this installs a package from fedora repos
dnf5 install -y tmux 

# desktop
dnf5 -y install niri gdm xwayland-satellite

# desktop portals
dnf5 -y install xdg-desktop-portal-gtk xdg-desktop-portal-gnome gnome-keyring

# utils
dnf5 -y distrobox micro tailscale fuzzel podman

# apps
dnf5 -y install firefox nautilus kitty mpv 1password

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

systemctl enable podman.socket
