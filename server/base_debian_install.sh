#!/bin/bash

# Download Debian
# Do an install, selecting only the ssh option within tasksel
# Execute this scripts as root ($ su -)

apt update && upgrade -y
apt install perl sudo tmux vim htop neofetch build-essential openssh-server ufw -y
apt install wget curl -y  # zsh

# Firewall
systemctl --now enable ufw # Should be automatic, but in case
ufw enable
ufw default deny incoming
ufw default allow outgoing

# SSH
ufw allow 22 # Allow SSH port

# Filesystems
apt install cifs-utils -y

# Tools
apt install gzip zip tar -y
apt install rsync -y

# For laptops
# Prevent the laptop from shutting down when the lid is down
sudo sh -c 'echo "HandleLidSwitch=ignore" >> /etc/systemd/logind.conf' && sudo shutdown -r now

