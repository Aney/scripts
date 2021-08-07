# This install script is for a WSL install

# This install will install only tools for CLI use

# Update and Upgrade the system first
apt update && apt upgrade -y

# Install essential tools required for other installs
apt install sudo build-essential ssh -y

# Make the user a sudoer (If passed to the script)
adduser nathan sudo

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

HOME=/home/nathan/
# lf file manager
sudo -H -u nathan bash -c  "mkdir $HOME/.local $HOME/.local/bin"
sudo -H -u nathan bash -c "curl -LO https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz | tar -xf -C $HOME/.local/bin"

# Vi mode terminal and local bin
# This also happens in dotfiles, so kinda redundant
sudo -H -u nathan bash -c "mkdir $HOME/.local/bin"
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

## Audio
#TODO

# Music Player (daemon, and utilities)
apt install mpd mpc mcmpcpp -y

# RSS Reader
apt install newsboat -y

# Mail Client
apt install neomutt -y

# Download Utilities (Legallity, uncertain)
## Youtube-dl
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
chmod a+rx /usr/local/bin/youtube-dl

## Torrenting (Seperate script?)
apt install transmission-daemon transmission-cli transmission-remote-cli -y
#systemctl stop transmission-daemon.service
#/lib/systemd/system/tranmission-daemon.service # Change debian-transmission to $USER
# systemctl daemon-reload
# start/restart service
# /etc/transmission-daemon/settings.json # edit whitelist, blocklist, password
# Setup the user for transmission-daemon

HOME=/home/nathan

mkdir2() {
	for DIR
	do
		if [ ! -d $DIR ]; then
			mkdir $DIR 
		fi
	done
}

# Create directories
sudo -H -u nathan bash -c "cd ~"
mkdir2 documents/ downloads/ misc/ music/ pictures/ 

# Set location to download source code and other repos
REPO=$HOME/agitrepo
sudo -H -u nathan bash -c "mkdir $REPO"

# Muh scripties
sudo -H -u nathan bash -c "git clone https://github.com/aney/scripts $REPO/ascripts/"
# create a sym link. Will change to cp if others start using my install.sh
ln -s $REPO/ascripts/config/ $HOME/.local/bin/
ln -s $REPO/ascripts/backup/ $HOME/.local/bin/

# dotfiles
# This will overwrite existing dotfiles...
sudo -H -u nathan bash -c "git clone https://github.com/aney/dotfiles $REPO/adotfiles/"
cp $REPO/adotfiles/.[^.]* $HOME

