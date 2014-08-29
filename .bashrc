# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:=}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "${TERM:=}" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
if [ -n "${force_color_prompt:=}" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

[ -f ~/.local_bashrc ] && source ~/.local_bashrc

if [ "${color_prompt:=}" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
PS1='\$'

# If this is an xterm set the title to user@host:dir
case "${TERM:=}" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support
COLOR=
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    COLOR=' --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth
HISTSIZE=1000
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTIGNORE="&:[ ]*:@(?|??|???|????)"
# [ \t]* ignores commands begin with !
shopt -s cmdhist
# append to the history file, don't overwrite it
shopt -s histappend

# default mode
umask 002

# mkdir and cd 
function calc() { awk "BEGIN {print $* }"; }
function gcd() { mkdir -p "$@" && eval cd "\"\$$#\"";}
function mx() { awk 'BEGIN{getline; mx=$1;} { if($1>mx){mx=$1;} } END{ print mx; }' -; }
function mn() { awk 'BEGIN{getline; mn=$1;} { if($1<mn){mn=$1;} } END{ print mn; }' -; }
function sm() { awk 'BEGIN{sm=0;} {sm+=$1;} END {print sm;}' -; }
function max() { if [ $# -eq 0 ]; then mx; else echo "$@" | tr ' ' '\n' | mx; fi }
function min() { if [ $# -eq 0 ]; then mn; else echo "$@" | tr ' ' '\n' | mn; fi }
function sum() { if [ $# -eq 0 ]; then sm; else echo "$@" | tr ' ' '\n' | sm; fi }
function errno() { grep -w $1 /usr/include/asm-generic/errno*.h ; }

# include extract script
[ -f ~/profile/e ] && source ~/profile/e

# Select several lines from a file. 
# e.g., sel /etc/passwd 2 4 6
function sel() {
    local target="$1"
    local cmdexpr="-n"
    local lastline=0
    shift
    for i in "$@"; do
        cmdexpr="$cmdexpr -e '${i}p'"
        if [ "$i" -gt "$lastline" ]; then
            lastline="$i"
        fi
    done
    local cmdexpr="$cmdexpr -e '${lastline}q'"
    eval "cat -n $target | sed $cmdexpr"
}

function crm() {
  for f in "$@"; do
    rm "$f"
    cvs remove "$f"
  done
}

function ref() {
	ctags -R .
	cscope -b -R
}

function opennote() {
    vim ~/notes/`date +%y%m%d`.mkd
}

function ro() {
  local dt=${1/.eps/.dat}
  local gp=${1/.eps/.gp}
  scp cross:$1 ~/tmp
  scp cross:$dt ~/tmp
  scp cross:$gp ~/tmp
  xdg-open ~/tmp/`basename $1` &
}

# alias
alias grep="grep $COLOR"
alias nau='nautilus'
alias l="\ls -hl $COLOR"      # show detailed info
alias la="\ls -Al $COLOR"       # show hidden files
alias lt="\ls -ltc $COLOR"     # sort by change time
alias lx="\ls -lXB $COLOR"      # sort by extension
alias lr="\ls -lR $COLOR"       # recursive ls
alias ls="\ls -lhS $COLOR"      # sort by size
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# tmux preferred if exist
if type tmux >/dev/null 2>&1; then
	alias s='tmux'
	alias r='tmux attach -d'
else
	# http://askubuntu.com/questions/9920/x11-forwarding-over-gnu-screen-is-it-possible
	alias screen='env DISPLAY=$DISPLAY screen'
	alias s='screen'
	alias r='screen -D -R'
fi

alias h='history' 
alias p='ps -ef'
alias f='pushd'
alias b='popd'
alias v='dirs -v'
alias x='exit'
alias j='jobs'
alias n="opennote"
alias i="ipython"
alias o="xdg-open"
alias fa='pushd +1 > /dev/null; dirs -v'
alias fb='pushd +2 > /dev/null; dirs -v'
alias fc='pushd +3 > /dev/null; dirs -v'
alias fd='pushd +4 > /dev/null; dirs -v'

# get full path of a file
alias y='readlink -f'
alias z='echo -e "`uname -n`\n`dirs -v`"'

if type python26 >/dev/null 2>&1; then
    alias python='python26'
fi
if libtool --version >/dev/null 2>&1; then
    alias gdb='libtool --mode=execute gdb'
fi
alias pdb='python -m pdb'
alias ymd='date +%y%m%d'
alias smth='luit -encoding gbk telnet bbs.newsmth.net'
alias open='xdg-open'
alias tree='~/profile/tree'

# names
poj=/media/Documents/Programming/algo/poj/
stl=/media/Documents/Programming/cpp/stl/
ac=/media/Documents/Active
doc=/media/Documents/Document

# options
#set -u  # do not expand undefined variable to null, report error instead
shopt -s cdable_vars
shopt -s extglob

# path
JAVA_PATH=/usr/lib/jvm/java-6-sun

# hadoop
export HADOOP_CONF_DIR=/home/chm/hadoop/conf
export HADOOP_HOME=/home/chm/hadoop

alias ghadoop='luit -encoding gbk ssh -o GSSAPIAuthentication=no ime@10.12.11.200'
alias gdev='luit -encoding gbk ssh -o GSSAPIAuthentication=no chenming@10.11.203.218'
alias gdd='luit -encoding gbk ssh -o GSSAPIAuthentication=no root@10.10.65.76'
alias scp='scp -o GSSAPIAuthentication=no'

# settings
export SVN_EDITOR=vim

# fix iBus issues on start
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash
export CVSROOT=mchen@cvs.fsl.cs.sunysb.edu:/scm/cvsroot/

alias vm1='ssh -Y mchen@vm1.fsl.cs.sunysb.edu'
alias dolphin='ssh mchen@dolphin.fsl.cs.sunysb.edu'
alias cross='ssh mchen@crossroads.fsl.cs.sunysb.edu'
alias chev='ssh -tt mchen@msl.cewit.stonybrook.edu ssh -tt mchen@chevron8'

export AWKPATH=$AWKPATH:~/profile/awk
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/mchen/software/lib

export PATH=$HOME/software/epd/bin:$HOME/software/bin:/usr/local/bin:$PATH
