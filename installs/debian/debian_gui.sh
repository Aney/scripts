# This install script is for a debian based distro
# It is assumed that it's a minimal install, with no GUI

# This install will install a GUI, and graphical programs
# It is to be called from a 'master' script, to install what you need

# Install essentials that may not have been installed prior
apt install sudo xorg build-essential -y

# Pulseaudio GUI
apt install pavucontrol -y

# Email
apt install thunderbird -y 

# File Manager
apt install nemo -y

# Video Player
apt install mpv -y

# Screencap and screenshots
apt install ffmpeg maim slop -y

## Keypress capture
apt install screenkey -y

# Image viewer, PDF Reader
apt install feh zathura -y

# Web Browsers
apt install firefox-esr -y
## Brave (Potentiall removing)
apt install apt-transport-https -y
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser -y

# Media tools
apt install gimp -y

# Multimonitor
apt install arandr -y

# Suckless pre-requisites
apt install libx11-dev libxft-dev libxinerama-dev -y
apt install libx11-xcb-dev libxcb-res0-dev -y

# Notifications
apt install dunst libnotify-bin -y

# Virtualisation
apt install qemu-kvm libvirt-clients libvirt-daemon-system virt-manager -y
# Add to virtualisation groups
adduser nathan libvirt
adduser nathan libvirt-qemu

