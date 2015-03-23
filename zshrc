######################################################################
#                     Dans Zshrc
#
######################################################################

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dsyang"
plugins=(autojump heroku golang)

source $ZSH/oh-my-zsh.sh

export DISABLE_AUTO_TITLE="true"
export COMPLETION_WAITING_DOTS="true"
export EDITOR="vim"

PATH="/Users/dsyang/bin:/usr/local/share/python:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:$PATH"
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
## tex
#########
# PATH="/usr/texbin:$PATH"


#########
## sml
#########
# PATH="/usr/local/smlnj/bin:$PATH"   #MAC
# SMLNJ_HOME="/usr/local/smlnj"       #MAC

alias smlnj='rlwrap sml'

#########
## emacsclient
#########

# Starts
alias wemacs='emacsclient -n -c'
alias emacs='emacsclient -t'
alias newemacs='/Users/dsyang/dotfiles/wemacs'

#alias startemacs='/usr/local/bin/emacs --daemon'
#alias emacs='emacsclient -t'

########
## sbcl
########
# alias sbcl='rlwrap /usr/local/bin/sbcl'

#######
## tmux
#######

alias starttmux='tmux attach-session'


#########
## golang
#########
 GOPATH='/Users/dsyang/Dropbox/Code/golang'
 PATH=/usr/local/go/bin:$PATH
 export GOPATH
 PATH=$GOPATH/bin:$PATH

# setup440() {
#   GOPATH=/Users/dsyang/Dropbox/School/Spring-2014/15-440/$1
# 	GOBIN=$GOPATH/bin/darwin_amd64/
# 	PATH=$GOBIN:$PATH
# 	export PATH
# 	export GOPATH
# }

#######
## java
#######
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export M2_HOME=/usr/share/maven


##########
## android
##########
export ANDROID_HOME=/Users/dsyang/android-sdk-macosx
export ANDROID_SDK=$ANDROID_HOME
export ANDROID_TOOLS=$ANDROID_HOME/tools
export ANDROID_PLATFORM_TOOLS=$ANDROID_HOME/platform-tools
PATH="$ANDROID_PLATFORM_TOOLS:$ANDROID_TOOLS:$PATH"

###########
## Research
###########
# export BLINKY01=/Users/dsyang/Dropbox/School/Fall-2013/Research/visiblesim/BlockSimulator-MT2/applicationsBin/blinky01
# export CLMELD=/Users/dsyang/Dropbox/School/Fall-2013/Research/cl-meld
# export MELD=/Users/dsyang/Dropbox/School/Fall-2013/Research/meld
# PATH="$BLINKY01:$CLMELD:$MELD:$PATH"

#############
## LightTable
#############
# export LT_HOME=/Users/dsyang/Sandbox/LightTable/deploy
# PATH="$LT_HOME:$PATH"

###########
## Rust
###########
# export RUSTCPATH=/Users/dsyang/Sandbox/rust/x86_64-apple-darwin/stage1/bin
# PATH="$RUSTCPATH:$PATH"

###########
## Haskell
###########
PATH="/Users/dsyang/Library/Haskell/bin:$PATH"


########### Code ##########
## - Makes sure you only start one emacs daemon
## - Starts Tmux if it wasn't started
###########################


#########
## Starting emacs only once
#########
# if [ $(ps -ef | grep -i 'emacs --daemon' | wc -l) -lt 2 ]; then
#    startemacs
# else
#     echo "An emacs server is already running"
# fi

#########
## Checking if tmux is started
#########
if [ -n "${TMUX+2}" ]; then
    echo "Inside a Tmux session";
else
    echo "TMUX NOT STARTED";
fi

# OPAM configuration
# . /Users/dsyang/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# added by setup_fb4a.sh
export ANDROID_SDK=/Users/dsyang/android-sdk-macosx
export ANDROID_NDK_REPOSITORY=/Users/dsyang/android-ndk
export ANDROID_HOME=${ANDROID_SDK}
export PATH=${PATH}:${ANDROID_SDK}/tools:${ANDROID_SDK}/platform-tools
