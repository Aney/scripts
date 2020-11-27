# This install script is for a debian based distro
# ideally a minimal install

# Ask what wants to be installed, then if statement each section. Test.
# Basic, GUI, 
#echo "What do you want to install??\n"
# ask for username

# Install X and sudo so other things can work
apt install sudo xorg build-essential -y

# Update baybee
apt update && upgrade -y

# Add the user to sudo?
adduser nathan sudo

# Terminal shit
apt install git zsh tmux vim neofetch wget curl -y

# Music player, rss feed
apt install cmus mpd mpc ncmpcpp newsboat  -y

# Video player and youtube-dl 
apt install mpv youtube-dl -y

# Screencap and screenshots 
apt install ffmpeg scrot -y

# Image viewer, PDF Reader (GUI)
apt install feh zathura -y

# Network Tools
#apt install net-tools wicd -y
#apt install network-manager -y

# Audio
apt install alsa-utils alsa-oss pulseaudio -y

# Pulseaudio GUI
apt install pavucontrol -y 

# Random shit
apt install gtypist -y

# Suckless pre-requisites
apt install libx11-dev libxft-dev libxinerama-dev -y
apt install libx11-xcb-dev libxcb-res0-dev -y

# Torrenting 
#apt install transmission-daemon transmission-cli transmission-remote-cli -y

# VPN
apt install openvpn

#systemctl stop transmission-daemon.service
#/lib/systemd/system/tranmission-daemon.service # Change debian-transmission to $USER
# systemctl daemon-reload
# start/restart service
# /etc/transmission-daemon/settings.json # edit whitelist, blocklist, password

# Setup the user for transmission-daemon

# Virtualisation
#apt install qemu-kvm libvirt-clients libvirt-daemon-system virt-manager -y
# Add to virtualisation groups
#adduser nathan libvirt
#adduser nathan libvirt-qemu

# brave-browser
apt install apt-transport-https -y
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser -y

# Xanmod Kernel
#echo 'deb http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list && wget -qO - https://dl.xanmod.org/gpg.key | sudo apt-key add -
#apt update && apt install linux-xanmod -y

#####

# Fake user installs
userdo() {
	sudo -H -u nathan bash -c '$1'
}

# User
#su nathan 
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
#mkdir2 ~/downloads/ ~/pictures/ ~/video/ ~/recordings/ ~/documents/ ~/music/
#touch ~/recordings/.recording_status

echo "exec dwm" > $HOME/.xinitrc

# Set location to download source code and other repos
REPO=$HOME/agitrepo
sudo -H -u nathan bash -c "mkdir $REPO"

# Suckless installs
# Not sure how to do the intsall without sudo prompt...
# dwm
sudo -H -u nathan bash -c "git clone https://git.suckless.org/dwm $REPO/adwm"
cd $REPO/adwm/
make clean install

# st terminal
sudo -H -u nathan bash -c "git clone https://git.suckless.org/st $REPO/ast"
cd $REPO/ast/
make clean install

# dmenu launcher
sudo -H -u nathan bash -c "git clone https://git.suckless.org/dmenu $REPO/admenu"
cd $REPO/admenu/
make clean install

# slstatus
sudo -H -u nathan bash -c "git clone https://git.suckless.org/slstatus $REPO/aslstatus"
cd $REPO/aslstatus/
make clean install

# Setup the bin directory for custom scripts
sudo -H -u nathan bash -c "mkdir $HOME/.local/bin"
# Vi mode terminal and local bin # This also happens in dotfiles, so kinda redundant
echo "set -o vi\nexport PATH=\$HOME/.local/bin:\$PATH" >> .zshrc
echo "export PATH=\$HOME/.local/bin/*:\$PATH" >> .zshrc
# Add to path for this session
export PATH=\$HOME/.local/bin/:$PATH
export PATH=\$HOME/.local/bin/dmenu:$PATH

# Muh scripties
sudo -H -u nathan bash -c "git clone https://github.com/aney/scripts $HOME/agit/ascripts/"
# create a sym link. Will change to cp if others start using my install.sh
ln -s $REPO/ascripts/dmenu/ $HOME/.local/bin/
ln -s $REPO/ascripts/config/ $HOME/.local/bin/
ln -s $REPO/ascripts/backup/ $HOME/.local/bin/

# lf file manager
# Download a pre-built binary
sudo -H -u nathan bash -c "curl -L
https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz | tar xzC ~/.local/bin"

# Change default shell to zsh
sudo -H -u nathan bash -c "chsh -s /bin/zsh"

# dotfiles
# This will overwrite existing dotfiles...
sudo -H -u nathan bash -c "git clone https://github.com/aney/dotfiles $REPO/adotfiles/"
cp -r $REPO/adotfiles/* $HOME/.

# Oh my Zsh
sudo -H -u nathan bash -c "sh -c '$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)'"
# Extras. Bg image, icons, etc. 
