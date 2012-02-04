#!/bin/sh

DROPBOX_DIR="$HOME/Dropbox"
DOTFILES="$DROPBOX_DIR/dotfiles"

if [ ! -d "$DOTFILES" ]
then
echo "Please my dotfiles to $DROPBOX_DIR"
  exit
fi

cd $DOTFILES

git submodule update --init

ln -s $DOTFILES/.gitconfig $HOME/.gitconfig
ln -s $DOTFILES/.gvimrc $HOME/.gvimrc
ln -s $DOTFILES/.tmux.conf $HOME/.tmux.conf
ln -s $DOTFILES/.vim $HOME/.vim
ln -s $DOTFILES/.vimrc $HOME/.vimrc
ln -s $DOTFILES/.zshenv.mac $HOME/.zshenv
ln -s $DOTFILES/.zshrc $HOME/.zshrc

vim -c ':NeoBundleInstall!'
