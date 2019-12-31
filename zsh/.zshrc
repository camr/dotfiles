# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="nord"

COMPLETION_WAITING_DOTS="true"

export EDITOR="vim"
export HISTIGNORE="&:ls:[bf]g:exit"

plugins=(git ssh-agent)

fpath+=~/.zfunc

# PATH configuration
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

# Aliases
alias brewup='brew update && brew upgrade && brew cleanup; brew doctor'
alias t='todolist'

# ssh
export SSH_KEY_PATH="~/.ssh/work"

# Postgres
alias pg="pgcli -h 127.0.0.1 -p 4444 -U postgres"
alias pgmbt="pgcli -h 127.0.0.1 -p 4444 -U mbt -d mbt"

# Golang
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/Golang
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# Haskell
export HASKELL_HOME=$HOME/haskell
export PATH=$PATH:$HASKELL_HOME/bin

# Node.js
export NVM_DIR=$HOME/.nvm
source $(brew --prefix nvm)/nvm.sh
export PATH=$PATH:$(yarn global bin)

# Ruby
export GEM_PATH=/usr/local/var/gems
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Rust
export RUST_SRC_PATH=$HOME/Source/rust/src
export CARGO_HOME=$HOME/.cargo
export PATH=$PATH:$HOME/.cargo/bin

# Android
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

# Emscripten
# export EMPATH=$HOME/Source/emsdk-portable
# source $EMPATH/emsdk_env.sh

# Fix mistyped commands
# eval "$(thefuck --alias)"

# Google Cloud
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# AWS
# source /usr/local/share/zsh/site-functions/_aws
export KUBECONFIG=$KUBECONFIG:$HOME/.kube/config

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
# [[ -f /Users/camr/.nvm/versions/node/v8.1.4/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/camr/.nvm/versions/node/v8.1.4/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh
