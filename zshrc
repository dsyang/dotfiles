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
export EDITOR="emacs"
export ALTERNATE_EDITOR="vim"

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
## brew
#########
eval "$(/opt/homebrew/bin/brew shellenv)"

#########
## aliases
#########
alias man='LC_ALL=C LANG=C man'
alias ll='ls -al'
alias ls='ls -G'
alias freespace='df -H'
##alias tmux='tmux attach'
alias sftp='rlwrap sftp'

dash() {
  open dash://$*;
}

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

alias startemacs='/usr/local/bin/emacs --daemon'
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
export PATH="${JAVA_HOME}/bin:${PATH}"


##########
## android
##########
export ANDROID_SDK=/opt/android_sdk
export ANDROID_NDK_REPOSITORY=/opt/android_ndk
export ANDROID_HOME=${ANDROID_SDK}
export PATH=${PATH}:${ANDROID_SDK}/tools:${ANDROID_SDK}/platform-tools
export PATH="/Users/dsyang/bin/build-tools:${PATH}"

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
PATH="/Users/dsyang/.cargo/bin:$PATH"
export RUST_SRC_PATH="/Users/dsyang/Sandbox/rustc-1.8.0/src"

###########
## Ocaml
###########
# eval `opam config env`

###########
## Groovy
###########
export GROOVY_HOME=/usr/local/opt/groovy/libexec


###########
## Haskell
###########
# PATH="/Users/dsyang/Library/Haskell/bin:$PATH"

###########
## Anaconda/Jupyter
###########

# added by Anaconda2 4.1.1 installer
export PATH="$PATH:/Users/dsyang/anaconda2/bin"

###########
## Google Cloud Platform
###########

export PATH="$PATH:/Users/dsyang/bin/google-cloud-sdk/bin"
export GOOGLE_APPLICATION_CREDENTIALS="/Users/dsyang/Sandbox/keys/gmail-amazon-forwarding-9acad2a973c8.json"


###########
## Work
###########

PATH="/Users/dsyang/devtools/arcanist/bin:$PATH"
alias nanoc='arc nano-check'
alias bifb='buck install fb4a'
alias nbifb='nanoc && bifb'
alias bifbx='bifb -x'
export S6W="03157df332350d08"
export S6B="04157df465570322"
export GM="192.168.56.101:5555"
export GM2="192.168.56.102:5555"
alias bigm='bifb -s $GM'
alias bigm2='bifb -s $GM2'
alias bifbs6w='bifb -s $S6W'
alias bifbs6b='bifb -s $S6B'

alias pullios='arc pull -b //Libraries/FIGUIKit:FIGUIKitServerSnapshotTestsUITestBed'
alias focusios='arc focus -b //Libraries/FIGUIKit:FIGUIKitServerSnapshotTestsUITestBed FBUITestBedApp FBUITestBedSupport FBLog'
#alias xhdpi='/Users/dsyang/Sandbox/start_xhdpi_emulator&'
alias xhdpi='/opt/android_sdk/emulator/emulator @Galaxy_Nexus_API_26 &'
alias jfs='arc lint --take GOOGLEJAVAFORMAT,BUCKFORMAT --apply-patches && jf s'

########### Code ##########
## - Makes sure you only start one emacs daemon
## - Starts Tmux if it wasn't started
###########################

#########
## Changing the prompt if in fbsource2
#########
# precmd() {
#     MY_PREFIX="_fbsource2_ "
#     if [[ $PWD == /Users/dsyang/fbsource2* ]] ; then
#         if [[ $PROMPT =~ $MY_PREFIX* ]] ; then
#
#         else
#             PROMPT="$MY_PREFIX $PROMPT"
#         fi
#     else
#         PROMPT="$OPROMPT"
#     fi
#     if [[ $PWD == /Users/dsyang/buck* ]] ; then
#         export NO_BUCKD=1
#     else
#         unset NO_BUCKD
#     fi
#
# }


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
# if [ -n "${TMUX+2}" ]; then
#     echo "Inside a Tmux session";
# else
#     echo "TMUX NOT STARTED";
# fi

# OPAM configuration
# . /Users/dsyang/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
export FBANDROID_DIR=/Users/dsyang/fbsource/fbandroid
alias quicklog_update=/Users/dsyang/fbsource/fbandroid/scripts/quicklog/quicklog_update.sh
alias qlu=quicklog_update

# Make t work from fbandroid root
alias t=scripts/test_runner/test_runner.py

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# added by setup_fb4a.sh
export ANDROID_SDK=/opt/android_sdk
export ANDROID_NDK_REPOSITORY=/opt/android_ndk
export ANDROID_HOME=${ANDROID_SDK}
export PATH=${PATH}:${ANDROID_SDK}/tools:${ANDROID_SDK}/platform-tools

# setup launchctl to be able to focus every day
launchctl setenv PATH $PATH
