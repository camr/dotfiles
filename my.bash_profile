# Check for an interactive session
# [ -z "$PS1" ] && return

export EDITOR="vim"

export HISTIGNORE="&:ls:[bf]g:exit"

# Light colors for a dark background
alias ls='ls -GFh'
export LSCOLORS=dxfxcxdxbxegedabagacad

# Prepend local bin
PATH=/usr/local/bin:$PATH

export PATH

# Virtualenv Wrapper
export WORKON_HOME=$HOME/envs
source /usr/bin/virtualenvwrapper.sh

export PYTHONSTARTUP=$HOME/.pythonrc

# Fix wonky terminal name
case "$TERM" in
    urxvt)
        export TERM=rxvt-unicode
        ;;
esac

source ~/.bash_aliases

source ~/.bash_prompt
