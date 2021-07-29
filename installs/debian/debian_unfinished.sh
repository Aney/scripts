# Fake user installs
userdo() {
	sudo -H -u nathan bash -c "$1"
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
sudo -H -u nathan bash -c "cd ~"
mkdir2 books/ documents/ downloads/ misc/ music/ pictures/ recordings/ video/
touch recordings/.recording_status

# Temp, so startx works
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
sudo -H -u nathan bash -c "git clone https://github.com/aney/scripts $REPO/ascripts/"
# create a sym link. Will change to cp if others start using my install.sh
ln -s $REPO/ascripts/dmenu/ $HOME/.local/bin/
ln -s $REPO/ascripts/config/ $HOME/.local/bin/
ln -s $REPO/ascripts/backup/ $HOME/.local/bin/

# dotfiles
# This will overwrite existing dotfiles...
sudo -H -u nathan bash -c "git clone https://github.com/aney/dotfiles $REPO/adotfiles/"
ln -s $REPO/adotfiles/.[^.]* $HOME

# Extras. Bg image, icons, etc. Put an image in the git repo/server when done
#sudo -H -u nathan bash -c "$(curl 'https://pixabay.com/get/57e8d7414c51aa14f6d1867dda3536781539dbe35552754b_1920.jpg' $HOME/pictures/wallpapers/barren.jpg)"

