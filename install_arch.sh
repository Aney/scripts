pacman -Sy xorg base-devel
pacman -Sy libx11 libxft libxinerama
pacman -Sy git zsh tmux vim neofetch wget curl
pacman -Sy pamixer pulseaudio-alsa alsa-utils
pacman -Sy groff
git clone https://aur.archlinux.org/yay-git.git
#makepkg -si
yay -S brave-bin # brave-git
