export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="custom"
plugins=(git colored-man colorize github virtualenv pip python brew osx zsh-syntax-highlighting)

export DOTFILES=$HOME/.dotfiles
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

source $ZSH/oh-my-zsh.sh

alias c='clear'
alias vimrc='vim $DOTFILES/vimrc'
alias zshrc='vim $DOTFILES/zshrc'
alias zshtheme='vim $DOTFILES/custom.zsh-theme'
alias srczsh='source ~/.zshrc'
alias srcvim='source ~/.vimrc'
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

# ag
alias ag='noglob ag --ignore=*.sql '

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

# Other files to source
typeset -ga sources
sources+="$HOME/.zshrc.local"
sources+="$HOME/.bash_functions"

# try to include all sources
foreach file (`echo $sources`)
    if [[ -a $file ]]; then
        source $file
    fi
end