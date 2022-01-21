#!/bin/sh

pushd $(dirname "$(readlink "$0")") 1>/dev/null
export DOTFILES=$(pwd)
popd 1>/dev/null
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

echo "Creating tmux symlink"
rm $HOME/.tmux.conf 2>/dev/null
ln -s $DOTFILES/tmux $HOME/.tmux.conf

if [ ! -d "$FZFDIR" ]; then
    echo "Fetching and installing FZF"
    git clone --depth 1 https://github.com/junegunn/fzf.git $FZFDIR
    $FZFDIR/install
fi

if [ ! -f "~/.vim/autoload/pathogen.vim" ]; then
  echo "Installing pathogen for vim"
  mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

if ! command -v brew &>/dev/null; then
  echo "Installing homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v tmux &>/dev/null; then
  echo "Installing tmux"
  brew install tmux
fi

if ! command -v ag &>/dev/null; then
  echo "Installing ag"
  brew install ag
fi
