#!/usr/bin/sh

# We will need to refer to files within the directory where this script exists.
# This is one way to do that.
SCRIPT_PATH=$(readlink -f $0)
BASEDIR=$(dirname $SCRIPT_PATH)

echo $BASEDIR
echo "BASEDIR=$BASEDIR"

# Create the directory structure we need
mkdir --parents $HOME/.config/sway
mkdir --parents $HOME/.config/termite
mkdir --parents $HOME/.config/waybar
mkdir --parents $HOME/.config/fish
mkdir --parents $HOME/.vim/autoload
mkdir --parents $HOME/Images/Wallpapers

# BASH
echo "Creating bash-related symlinks..."
ln --force --symbolic "$BASEDIR/bash/bashrc" "$HOME/.bashrc"
ln --force --symbolic "$BASEDIR/bash/bash_profile" "$HOME/.bash_profile"

# FISH
echo "Creating fish-related-symlinks..."
ln --force --symbolic "$BASEDIR/fish/config.fish" "$HOME/.config/fish/config.fish"
ln --force --symbolic "$BASEDIR/fish/functions" "$HOME/.config/fish/functions"

# VIM
echo "Creating vim-related symlink..."
ln --force --symbolic "$BASEDIR/vim/vimrc" "$HOME/.vimrc"
ln --force --symbolic "$BASEDIR/vim/plug.vim" "$HOME/.vim/autoload/plug.vim"

# SWAY
echo "Creating sway-related symlinks..."
ln --force --symbolic "$BASEDIR/sway/config" "$HOME/.config/sway/config"
ln --force --symbolic "$BASEDIR/sway/wallpaper0.png" "$HOME/Images/Wallpapers/wallpaper0.png"

# WAYBAR
echo "Creating waybar-related symlinks..."
ln --force --symbolic "$BASEDIR/waybar/config" "$HOME/.config/waybar/config"
ln --force --symbolic "$BASEDIR/waybar/style.css" "$HOME/.config/waybar/style.css"

# TERMITE
echo "Creating termite-related symlinks..."
ln --force --symbolic "$BASEDIR/termite/config" "$HOME/.config/termite/config"

# PACMAN MIRROR LIST 
echo "Creating reflector-related symlinks..."
sudo ln --force --symbolic "$BASEDIR/reflector/generate_mirrorlist.sh" "/usr/local/bin/generate_mirrorlist.sh"
sudo ln --force --symbolic "$BASEDIR/reflector/generate_mirrorlist.service" "/etc/systemd/system/generate_mirrorlist.service"
