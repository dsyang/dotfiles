######################################################################
#                     Dans Zshrc
#
######################################################################

WORKON_HOME=~/.python-envs
VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="clean"
plugins=(virtualenvwrapper archlinux git autojump heroku)

source $ZSH/oh-my-zsh.sh

export DISABLE_AUTO_TITLE="true"



PATH="/Users/dsyang/Library/Haskell/bin:/Users/dsyang/Dropbox/School/Fall-2012/15-411/git/cc0/bin:/afs/andrew.cmu.edu/usr13/dsyang/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$PATH"
TZ="America/Detroit"
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000
HOSTNAME="`hostname`"
PAGER='less'
#LANGUAGE=
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE='en_US.UTF-8'



# # --------------------------------------------------------------------
# # aliases
# # --------------------------------------------------------------------
alias man='LC_ALL=C LANG=C man'
alias ll='ls -al'
alias ls='ls -G'
alias freespace='df -H'
alias startdropbox='su -c "dropbox start" dsyang'
##alias tmux='tmux attach'
alias sftp='rlwrap sftp'


#alias	=clear

#for emacs-like bindings
bindkey -e
bindkey "^[[3~" delete-char


#########
## sml
#########
#PATH="/usr/lib32/smlnj/bin:$PATH"  #LINUX (ixidor)
#SMLNJ_HOME="/usr/lib32/smlnj"      #LINUX (ixidor)
PATH="/usr/local/smlnj/bin:$PATH"   #MAC
SMLNJ_HOME="/usr/local/smlnj"       #MAC

alias smlnj='rlwrap sml'

#########
## emacsclient
#########

alias startemacs='/usr/local/bin/emacs --daemon'  #MAC
#alias startemacs='/usr/bin/emacs --daemon' #LINUX (ixidor)
alias emacs='emacsclient -t'
alias wmacs='emacsclient -c & '


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

########## MAC only code ###########

source ~/.credentials

#########
## python
#########
PATH=/usr/local/share/python:$PATH

#########
## golang
#########
GOPATH=/Users/dsyang/dropbox/Code/golang
export GOPATH
PATH=$GOPATH/bin:$PATH

#########
## py-project
#########

alias newpy='/Users/dsyang/dropbox/School/Projects/py-project/new-py.sh'

#########
## Local binaries
#########

PATH=/Users/dsyang/bin:$PATH


#########
## RVM ##
#########
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
