# This install script is for a debian based distro
# Ideally a minimal install (No GUI, or tools installed)

# This install will install only tools for CLI use
# The idea is to have GUI, etc. seperated then called in one 'master' script

# Update and Upgrade the system first
apt update && apt upgrade -y

# Install essential tools required for other installs
apt install sudo build-essential ssh -y

# Make the user a sudoer (If passed to the script)
adduser nathan sudo

# Network Installs
apt install network-manager -y

# System Utilities
apt install perl wget curl man -y

# Make the terminal usable*
apt install tmux zsh -y

## Text Editors
apt install vim neovim -y 
apt install groff -y

## Git 
apt install git tig -y

# Compression Utilities
apt install gzip zip tar bzip2 unrar -y

# Install terminal system utilities
apt install neofetch htop -y

# Backups
apt install rsync rdiff-backup -y

# VPN
apt install openvpn -y

HOME=/home/nathan/
# lf file manager
sudo -H -u nathan bash -c  "mkdir $HOME/.local $HOME/.local/bin"
sudo -H -u nathan bash -c "curl -LO https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz | tar -xf -C $HOME/.local/bin"

# Vi mode terminal and local bin
# This also happens in dotfiles, so kinda redundant
echo "set -o vi\nexport PATH=\$HOME/.local/bin:\$PATH" >> .zshrc
echo "export PATH=\$HOME/.local/bin/*:\$PATH" >> .zshrc
# Add to path for this session
export PATH=\$HOME/.local/bin/:$PATH
export PATH=\$HOME/.local/bin/dmenu:$PATH

# *Make the terminal usable
## Change default shell to zsh
chsh nathan -s /bin/zsh

## Oh my Zsh
sudo -H -u nathan bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Firewall
apt install ufw -y
systemctl --now enable ufw
ufw enable
ufw default deny incoming
ufw default allow incoming
ufw allow 22 # Allow SSH

