# This install script is for a debian based distro
# ideally a minimal install

# Install X and sudo so other things can work
apt install sudo xorg build-essential -y

# Update baybee
apt update && upgrade -y

# Add the user to sudo?
adduser nathan sudo

# Terminal shit
apt install git zsh tmux vim neofetch wget -y

# Image viewer, music player, rss feed, etc
apt install cmus newsboat youtube-dl mpv scrot -y

# Image viewer, PDF Reader (GUI)
apt install feh zathura -y

# Hewwo
echo 'deb http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list && wget -qO - https://dl.xanmod.org/gpg.key | sudo apt-key add -
apt update && apt install linux-xanmod -y

# Network Tools
#apt install net-tools wicd -y

# Audio
apt install alsa-utils alsa-oss pulseaudio -y

# Pulseaudio GUI
apt install pavucontrol -y 

# Random shit
apt install gtypist -y

# Torrenting 
apt install transmission-daemon transmission-cli transmission-remote-cli -y

#systemctl stop transmission-daemon.service
#/lib/systemd/system/tranmission-daemon.service # Change username to user
# systemctl daemon-reload
# start service

# Setup the user for transmission-daemon

# brave-browser
# https://brave-browser.readthedocs.io/en/latest/installing-brave.html#linux
# Can be built from source, but takes a long while
apt install apt-transport-https
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser -y

# Suckless pre-requisites
apt install libx11-dev libxft-dev libxinerama-dev -y

# User
su nathan 

# dwm Window manager
mkdir ~/git
cd ~/git
git clone https://git.suckless.org/dwm
cd dwm
make clean install

# st terminal

# dmenu launcher

#	gruvbox, hotkeys
#	actualfullscreen, bottomstack, centeredwindowname, fullgaps, swallow

# Setup the bin directory for custom scripts
mkdir ~/.local/bin
# Vi mode terminal and local bin
echo "set -o vi\nexport PATH=~/.local/bin:\$PATH" >> .zshrc
echo "export PATH=~/.local/bin/*:\$PATH" >> .zshrc
# Add to path for this session
export PATH=~/.local/bin:$PATH
export PATH=~/.local/bin/*:$PATH

# lf file manager
# Download a pre-built binary
curl -L https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz | tar xzC ~/.local/bin

# Change default shell to zsh
chsh -s /bin/zsh
