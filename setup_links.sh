# We will need to refer to files within the directory where this script exists.
# This is one way to do that.
SCRIPT_PATH=$(readlink -f $0)
BASEDIR=$(dirname $SCRIPT_PATH)

echo $BASEDIR
echo "BASEDIR=$BASEDIR"

# Create the directory structure i need
mkdir --parents $HOME/.config/sway
mkdir --parents $HOME/.config/termite
mkdir --parents $HOME/.config/fish
mkdir --parents $HOME/.vim/autoload
mkdir --parents $HOME/.gnupg
mkdir --parents $HOME/images/wallpapers
mkdir --parents $HOME/.config/redshift
mkdir --parents $HOME/.config/nixpkgs
mkdir --parents $HOME/utils

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
ln --force --symbolic "$BASEDIR/sway/wallpaper0.png" "$HOME/images/wallpapers/wallpaper0.png"
ln --force --symbolic "$BASEDIR/sway/passmenu.sh" "$HOME/utils/passmenu.sh"

# TERMITE
echo "Creating termite-related symlinks..."
ln --force --symbolic "$BASEDIR/termite/config" "$HOME/.config/termite/config"

# REDSHIFT
echo "Creating redshift-related symlinks..."
ln --force --symbolic "$BASEDIR/redshift/redshift.conf" "$HOME/.config/redshift/redshift.conf"

# GPG
echo "Creating gpg-related symlinks..."
ln --force --symbolic "$BASEDIR/gpg/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"

# NIX
echo "Creating nixos-related symlinks..."
ln --force --symbolic "$BASEDIR/nixos/nixpkgs/config.nix" "$HOME/.config/nixpkgs/config.nix"
