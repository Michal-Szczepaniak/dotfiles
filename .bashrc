# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

PATH=~/.config/composer/vendor/bin/:~/bin:/sbin:$PATH
unset SSH_ASKPASS
xinput set-prop 9 315 -1

PS1="\w \$? # "
export PLATFORM_SDK_ROOT=/srv/mer
function sfossdk() {
	rm $HOME/.hadk.env
	rm -f $HOME/hadk$2/rpm
	rm -f $HOME/hadk$2/hybris/droid-configs
	ln -sf $HOME/hadk$2/rpm.$1 $HOME/hadk$2/rpm
	ln -sf $HOME/hadk$2/hybris/droid-configs.$1 $HOME/hadk$2/hybris/droid-configs
	ln -s $HOME/.hadk.$1 $HOME/.hadk.env
	$PLATFORM_SDK_ROOT/sdks/sfossdk/mer-sdk-chroot
}
# alias sfossdk=$PLATFORM_SDK_ROOT/sdks/sfossdk/mer-sdk-chroot

function ssh() { 
	/usr/bin/ssh -C "$@" 
}

function osco() { 
	osc -c $HOME/.oscrc_obs "$@" 
}

cd ~

force_color_prompt=yes
alias ls='/bin/ls -F --color=tty --show-control-chars'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gco="git checkout"
alias gl="git log"
alias gr="git reset"
alias gd="git diff"
alias gp="git push"
alias gpll="git pull"
alias gb="git branch"
alias gm="git merge"
alias ls='ls --color=auto'
alias a=aria2c

shopt -s cdspell
shopt -s nocaseglob
