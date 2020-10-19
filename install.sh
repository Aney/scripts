# This install script is for a debian based distro
# ideally a minimal install

# Install X and sudo so other things can work
apt install sudo xorg -y

# Update baybee
apt update && upgrade -y

# Terminal shit
apt install git zsh tmux vim neofetch wget curl gdebi parted -y

# Image viewer, music player, rss feed, etc
apt install feh cmus newsboat youtube-dl -y

# Network Tools
#apt install net-tools wicd -y

# Audio
apt install alsa-utils alsa-oss pulseaudio pavucontrol -y

# Random shit
apt install gtypist -y

# Torrenting 
apt install transmission-daemon transmission-cli -y

# brave-browser
# https://brave-browser.readthedocs.io/en/latest/installing-brave.html#linux
# Can be built from source, but takes a long while
apt install apt-transport-https

curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -

echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

apt update

apt install brave-browser -y

# lf file manager
mkdir ~/.local/bin
# Add to path for this session
export PATH=~/.local/bin:$PATH
# Add to bash, this will be switched to zsh when I figure that out 
echo "export PATH=~/.local/bin:\$PATH" >> .bashrc
# Download a pre-built binary
curl -L https://github.com/gokcehan/lf/releases/latest/download/lf-linux-amd64.tar.gz | tar xzC ~/.local/bin

# Window Manager

# Suckless pre-requisites
apt install libx11-dev libxft-dev libxinerama-dev -y

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

# Oh my zsh
#sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
# Change default shell to zsh
#chsh -s /bin/zsh
#echo "export PATH=~/.local/bin:\$PATH" >> .zshrc
