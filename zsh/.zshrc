# Path to your oh-my-zsh installation.
export ZSH=/home/camr/.oh-my-zsh

ZSH_THEME="camr"

plugins=(git)

# User configuration
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
source $ZSH/oh-my-zsh.sh

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

