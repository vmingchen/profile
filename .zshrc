# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew macosx kill python cvs)

# User configuration

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# emacs key shortcuts
# use "set -o vi" to switch to vim, or just Ctrl-X Ctrl-E for editing in vim
bindkey -e

# disable auto title that will change the pane-name of tmux
DISABLE_AUTO_TITLE=true

function calc() { awk "BEGIN {print $* }"; }
function gcd() { mkdir -p "$@" && eval cd "\"\$$#\"";}
function mx() { awk 'BEGIN{getline; mx=$1;} { if($1>mx){mx=$1;} } END{ print mx; }' -; }
function mn() { awk 'BEGIN{getline; mn=$1;} { if($1<mn){mn=$1;} } END{ print mn; }' -; }
function sm() { awk 'BEGIN{sm=0;} {sm+=$1;} END {print sm;}' -; }
function max() { if [ $# -eq 0 ]; then mx; else echo "$@" | tr ' ' '\n' | mx; fi }
function min() { if [ $# -eq 0 ]; then mn; else echo "$@" | tr ' ' '\n' | mn; fi }
function sum() { if [ $# -eq 0 ]; then sm; else echo "$@" | tr ' ' '\n' | sm; fi }
function errno() { grep -w $1 /usr/include/asm-generic/errno*.h ; }

[ -f ~/profile/e ] && source ~/profile/e

alias h='history' 
alias p='ps -ef'
alias f='pushd'
alias b='popd'
alias v='dirs -v'
alias x='exit'
alias j='jobs'
alias n="opennote"
alias i="ipython"
alias o="open"
alias fa='pushd +1 > /dev/null; dirs -v'
alias fb='pushd +2 > /dev/null; dirs -v'
alias z='echo -e "`uname -n`\n`dirs -v`"'
alias nt='netstat -vatn'
# we do not further define fc to avoid conflict with bash builtin "fc"
# use "f +3" instead.

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

function ref() {
  ctags -R .
  cscope -b -R
}

alias nt='netstat -vatn'
alias scp='scp -o GSSAPIAuthentication=no'
alias tree='~/profile/tree'
alias pdb='python -m pdb'

alias la="\ls -GAl $COLOR"       # show hidden files
alias lt="\ls -Gltc $COLOR"      # sort by change time
alias lr="\ls -GlR $COLOR"       # recursive ls
alias ls="\ls -GlhS $COLOR"      # sort by size

[ -f ~/profile/$(uname -n).zshrc ] && source ~/profile/$(uname -n).zshrc
