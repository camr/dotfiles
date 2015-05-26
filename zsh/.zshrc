# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="camr"

COMPLETION_WAITING_DOTS="true"

export EDITOR="vim"
export HISTIGNORE="&:ls:[bf]g:exit"

plugins=(git)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

# ssh
export SSH_KEY_PATH="~/.ssh/work"

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Haskell
export HASKELL_HOME=$HOME/haskell
export PATH=$PATH:$HASKELL_HOME/bin

