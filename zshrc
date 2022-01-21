export ZSH=$HOME/.oh-my-zsh
export ZSHLOCAL=$HOME/.zshrc.local
ZSH_THEME="custom"
plugins=(git colorize github virtualenv pip python brew macos)

export DOTFILES=$HOME/dev/dotfiles
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TEMP=/tmp
export EDITOR=vim
export IDE=~/Applications/Visual\ Studio\ Code.app

# rust
export PATH=$HOME/.cargo/bin:$PATH

# haskell
export PATH=$HOME/.ghcup/bin:$PATH

# graphviz
# export PATH=$HOME/dev/graphviz-2.40.1/cmd:$PATH

# colors
export NC='\033[0m'
export COLOR_BLACK='\033[0;30m'
export COLOR_RED='\033[0;31m'
export COLOR_GREEN='\033[0;32m'
export COLOR_ORANGE='\033[0;33m'
export COLOR_BLUE='\033[0;34m'
export COLOR_PURPLE='\033[0;35m'
export COLOR_CYAN='\033[0;36m'
export COLOR_LIGHT_GRAY='\033[0;37m'
export COLOR_DARK_GRAY='\033[1;30m'
export COLOR_LIGHT_RED='\033[1;31m'
export COLOR_LIGHT_GREEN='\033[1;32m'
export COLOR_YELLOW='\033[1;33m'
export COLOR_LIGHT_BLUE='\033[1;34m'
export COLOR_LIGHT='\033[1;35m'
export COLOR_LIGHT_CYAN='\033[1;36m'
export COLOR_WHITE='\033[1;37m'

source $ZSH/oh-my-zsh.sh

alias c='clear'
alias t='tmux'
alias vimrc='vim $DOTFILES/vimrc'
alias zshrc='vim $DOTFILES/zshrc'
alias tmuxconf='vim $DOTFILES/tmux'
alias zshlocal='vim $ZSHLOCAL'
alias zshtheme='vim $DOTFILES/custom.zsh-theme'
alias srczsh='source ~/.zshrc'
alias srcvim='source ~/.vimrc'
alias clrtmp='rm $TEMP/*.sw*'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

function newpwd() {
    openssl rand -base64 ${1:-16}
}

# File-tree
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Git
alias gs='git status'
alias gb='git branch'
alias gco='git checkout'
alias gpom='git pull origin master'
alias gpod='git pull origin develop'
alias gpoom='git push origin master'
alias gpood='git push origin develop'
alias gpoh='git push origin HEAD'
alias gds='git diff --staged'
alias gac='git add $(git diff --name-only)'
function gcon () {
    git checkout $1 2> /dev/null || git checkout -b $1
}
function gfoo () {
    git fetch origin $1:$1; git checkout $1; git branch --set-upstream-to=origin/$1 $1
}

# Random stuff
alias hist='tail -n 10000 $HISTFILE | grep '

# ag
alias ag='ag --ignore-dir=build --ignore-dir=dist'

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# other
function cf () {
  echo $(git log --oneline --pretty="format:" --name-only master..) $(git status --porcelain | cut -c 4-) | awk "NF" | sort | uniq
}
function ocf () {
  open -a $IDE $(cf "$1")
}

# real gcc
# export HOMEBREW_CC=gcc-4.9
# export HOMEBREW_CXX=g++-4.9

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

export PATH=/usr/local/bin:$PATH

# Other files to source
typeset -ga sources
sources+="$ZSHLOCAL"
sources+="$HOME/.bash_functions"

# try to include all sources
foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end
