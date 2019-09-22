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

# BASH
echo "Creating bash-related symlinks..."
ln --force --symbolic "$BASEDIR/bash/bashrc" "$HOME/.bashrc"

# VIM
echo "Creating vim-related symlink..."
ln --force --symbolic "$BASEDIR/vim/vimrc" "$HOME/.vimrc"

# SWAY
echo "Creating sway-related symlinks..."
ln --force --symbolic "$BASEDIR/sway/config" "$HOME/.config/sway/config"

# WAYBAR
echo "Creating waybar-related symlinks..."
ln --force --symbolic "$BASEDIR/waybar/config" "$HOME/.config/waybar/config"

# TERMITE
echo "Creating termite-related symlinks..."
ln --force --symbolic "$BASEDIR/termite/config" "$HOME/.config/termite/config"

# PACMAN MIRROR LIST 
echo "Creating reflector-related symlinks. You may be prompted for a password to sudo..."
sudo ln --force --symbolic "$BASEDIR/reflector/generate_mirrorlist.sh" "/usr/local/bin/generate_mirrorlist.sh"
sudo ln --force --symbolic "$BASEDIR/reflector/generate_mirrorlist.service" "/etc/systemd/system/generate_mirrorlist.service"
