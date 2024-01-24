# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Source my bashrc
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# nvm dir
# export NVM_DIR="/Users/{{USER}}/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# mac os catalina
# export BASH_SILENCE_DEPRECATION_WARNING=1
# export EDITOR=nvim
