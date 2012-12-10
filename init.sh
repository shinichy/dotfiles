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
ln -s $DOTFILES/.zshrc $HOME/.zshrc
ln -s $DOTFILES/.ackrc $HOME/.ackrc
if echo "`uname -s`" | grep -q "CYGWIN"; then
	cp -r $DOTFILES/.vim $HOME
	cp $DOTFILES/.vimrc $HOME
	nkf -s --overwrite $HOME/.vimrc
	ln -s $DOTFILES/.screenrc $HOME/.screenrc
	ln -s $DOTFILES/.zshenv.win $HOME/.zshenv
	cp $DOTFILES/.vrapperrc $HOME
else
	ln -s $DOTFILES/.vim $HOME/.vim
	ln -s $DOTFILES/.vimrc $HOME/.vimrc
	ln -s $DOTFILES/.tmux.conf $HOME/.tmux.conf
	if [ "`uname -s`" = "Darwin" ]; then
		ln -s $DOTFILES/.zshenv.mac $HOME/.zshenv
		ln -s $DOTFILES/.gvimrc $HOME/.gvimrc
	elif [ "`uname -s`" = "Linux" ]; then
		ln -s $DOTFILES/.zshenv.linux $HOME/.zshenv
	fi
fi

# create vimswap dir
if [ ! -d ~/.vimswap ]; then
	mkdir ~/.vimswap
fi
