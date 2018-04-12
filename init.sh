#!/bin/sh

export DOTFILES=$(dirname "$(readlink "$0")")
echo "Dotfiles are at $DOTFILES"

export ZSHDIR=$HOME/.oh-my-zsh
export FZFDIR=$HOME/.fzf

echo "Creating vimrc symlink"
rm $HOME/.vimrc 2> /dev/null
ln -s $DOTFILES/vimrc $HOME/.vimrc

if [ ! -d "$ZSHDIR" ]; then
    echo "Installing ZSH"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

echo "Creating zshrc symlink"
rm $HOME/.zshrc 2> /dev/null
ln -s $DOTFILES/zshrc $HOME/.zshrc

echo "Creating ZSH theme symlink"
rm $ZSH/themes/custom.zsh-theme 2> /dev/null
ln -s $DOTFILES/custom.zsh-theme $ZSH/themes/custom.zsh-theme

if [ ! -d "$FZFDIR" ]; then
    echo "Fetching and installing FZF"
    git clone --depth 1 https://github.com/junegunn/fzf.git $FZFDIR
    $FZFDIR/install
fi
