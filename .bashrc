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

# alias
alias grep="grep $COLOR"
alias nau='nautilus'
alias l="\ls -hl $COLOR"      # show detailed info
alias la="\ls -Al $COLOR"       # show hidden files
alias lt="\ls -ltc $COLOR"     # sort by change time
alias lx="\ls -lXB $COLOR"      # sort by extension
alias lr="\ls -lR $COLOR"       # recursive ls
alias ls="\ls -lhS $COLOR"      # sort by size

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

#if type python26 >/dev/null 2>&1; then
  #alias python='python26'
#fi
if libtool --version >/dev/null 2>&1; then
  alias gdb='libtool --mode=execute gdb'
fi
alias ymd='date +%y%m%d'
alias smth='luit -encoding gbk telnet bbs.newsmth.net'

# options
#set -u  # do not expand undefined variable to null, report error instead
shopt -s cdable_vars
shopt -s extglob

# hadoop
export HADOOP_CONF_DIR=/home/chm/hadoop/conf
export HADOOP_HOME=/home/chm/hadoop

alias ghadoop='luit -encoding gbk ssh -o GSSAPIAuthentication=no ime@10.12.11.200'
alias gdev='luit -encoding gbk ssh -o GSSAPIAuthentication=no chenming@10.11.203.218'
alias gdd='luit -encoding gbk ssh -o GSSAPIAuthentication=no root@10.10.65.76'

# settings
export EDITOR=vim
export SVN_EDITOR=vim

# fix iBus issues on start
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash
export CVSROOT=mchen@cvs.fsl.cs.sunysb.edu:/scm/cvsroot/

alias chev='ssh -tt mchen@msl.cewit.stonybrook.edu ssh -tt mchen@chevron8'

export AWKPATH=$AWKPATH:~/profile/awk

export PATH=/usr/local/bin:$PATH

complete -o default -o nospace -F _man vman

if [ -f ~/profile/functions.shrc ]; then
  source ~/profile/functions.shrc
  source_files
fi

# copied from: https://stackoverflow.com/questions/342969/how-do-i-get-bash-completion-to-work-with-aliases
# wrap_alias takes three arguments:
# $1: The name of the alias
# $2: The command used in the alias
# $3: The arguments in the alias all in one string
# Generate a wrapper completion function (completer) for an alias
# based on the command and the given arguments, if there is a
# completer for the command, and set the wrapper as the completer for
# the alias.
function my_wrap_alias() {
  [[ "$#" == 3 ]] || return 1

  local alias_name="$1"
  local aliased_command="$2"
  local alias_arguments="$3"
  local num_alias_arguments=$(echo "$alias_arguments" | wc -w)

  # The completion currently being used for the aliased command.
  local completion=$(complete -p $aliased_command 2> /dev/null)

  # Only a completer based on a function can be wrapped so look for -F
  # in the current completion. This check will also catch commands
  # with no completer for which $completion will be empty.
  echo $completion | grep -q -- -F || return 0

  local namespace=alias_completion::

  # Extract the name of the completion function from a string that
  # looks like: something -F function_name something
  # First strip the beginning of the string up to the function name by
  # removing "* -F " from the front.
  local completion_function=${completion##* -F }
  # Then strip " *" from the end, leaving only the function name.
  completion_function=${completion_function%% *}

  # Try to prevent an infinite loop by not wrapping a function
  # generated by this function. This can happen when the user runs
  # this twice for an alias like ls='ls --color=auto' or alias l='ls'
  # and alias ls='l foo'
  [[ "${completion_function#$namespace}" != $completion_function ]] && return 0

  local wrapper_name="${namespace}${alias_name}"

  eval "
function ${wrapper_name}() {
  let COMP_CWORD+=$num_alias_arguments
  args=( \"${alias_arguments}\" )
  COMP_WORDS=( $aliased_command \${args[@]} \${COMP_WORDS[@]:1} )
  $completion_function
  }
"

  # To create the new completion we use the old one with two
  # replacements:
  # 1) Replace the function with the wrapper.
  local new_completion=${completion/-F * /-F $wrapper_name }
  # 2) Replace the command being completed with the alias.
  new_completion="${new_completion% *} $alias_name"

  eval "$new_completion"
}

# For each defined alias, extract the necessary elements and use them
# to call my_wrap_alias.
eval "$(alias -p | sed -e 's/alias \([^=][^=]*\)='\''\([^ ][^ ]*\) *\(.*\)'\''/my_wrap_alias \1 \2 '\''\3'\'' /')"

unset my_wrap_alias
