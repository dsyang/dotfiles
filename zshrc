######################################################################
#                     Dans Zshrc
#
######################################################################

WORKON_HOME=~/.python-envs
VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="clean"
plugins=(virtualenvwrapper git autojump heroku)

source $ZSH/oh-my-zsh.sh

export DISABLE_AUTO_TITLE="true"

source ~/.credentials

PATH="/Users/dsyang/bin:/usr/local/share/python:/usr/local/share/npm/bin:/Users/dsyang/Library/Haskell/bin::/usr/local/bin:/usr/local/sbin:$PATH"
TZ="America/Detroit"
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
HOSTNAME="`hostname`"
PAGER='less'
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE='en_US.UTF-8'



#########
## aliases
#########
alias man='LC_ALL=C LANG=C man'
alias ll='ls -al'
alias ls='ls -G'
alias freespace='df -H'
##alias tmux='tmux attach'
alias sftp='rlwrap sftp'


#for emacs-like bindings
bindkey -e
bindkey "^[[3~" delete-char


#########
## sml
#########
PATH="/usr/local/smlnj/bin:$PATH"   #MAC
SMLNJ_HOME="/usr/local/smlnj"       #MAC

alias smlnj='rlwrap sml'

#########
## emacsclient
#########

alias startemacs='/Applications/Emacs.app/Contents/MacOS/Emacs --daemon'
alias emacs='emacsclient -t'
function wmacs () {  emacsclient -c $@ &; }



#########
## golang
#########
GOPATH=/Users/dsyang/dropbox/Code/golang
export GOPATH
PATH=$GOPATH/bin:$PATH


#########
## RVM ##
#########
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function




########### Code ##########
## - Makes sure you only start one emacs daemon
## - Starts Tmux if it wasn't started
###########################


#########
## Starting emacs only once
#########
if [ $(ps -ef | grep -i 'emacs --daemon' | wc -l) -lt 2 ]; then
    startemacs
else
    echo "An emacs server is already running"
fi

#########
## Checking if tmux is started
#########
if [ -n "${TMUX+2}" ]; then
    echo "Inside a Tmux session";
else
    echo "Starting tmux...";
    tmux;
fi


