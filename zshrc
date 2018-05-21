export ZSH=$HOME/.oh-my-zsh
export ZSHLOCAL=$HOME/.zshrc.local
ZSH_THEME="custom"
plugins=(git colored-man colorize github virtualenv pip python brew osx zsh-syntax-highlighting)

export DOTFILES=$HOME/dev/dotfiles
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TEMP=/tmp

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

# real gcc
# export HOMEBREW_CC=gcc-4.9
# export HOMEBREW_CXX=g++-4.9

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

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

export PATH=/usr/local/bin:$PATH
