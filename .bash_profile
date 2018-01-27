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

# change 
export NVM_DIR="/Users/{{USER}}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
