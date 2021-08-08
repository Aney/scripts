# This install script is for a debian based distro
# It is assumed that it's a minimal install, with at least debian_base
# This will install additional utilities that make debain usable without a GUI

# Download and install debian_base?

# Better text editing IDE-esk
apt install neovim -y
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Additional filesystem utilities
## For mounting samba/cif drives, and MTP (mobile phones)
apt install cifs-utils jmtpfs -y

## Audio
apt install alsa-utils alsa-oss pulseaudio -y

# Bluetooth
apt install blueman -y

# Music Player (daemon, and utilities)
apt install mpd mpc mcmpcpp -y

# RSS Reader
apt install newsboat -y

# Mail Client
apt install neomutt -y

# Groff
apt install groff -y

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

# Xanmod Kernel (It makes desktops better, servers not so much)
echo 'deb http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-kernel.list && wget -qO - https://dl.xanmod.org/gpg.key | sudo apt-key add -
apt update && apt install linux-xanmod -y
