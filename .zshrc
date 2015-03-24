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
plugins=(git brew macosx kill python cvs vim fabric)

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

bindkey \^U backward-kill-line

# disable auto title that will change the pane-name of tmux
DISABLE_AUTO_TITLE=true

alias nt='netstat -vatn'
alias scp='scp -o GSSAPIAuthentication=no'
alias tree='~/profile/tree'
alias pdb='python -m pdb'

DIRSTACKSIZE=8
unsetopt autopushd
#pushdminus pushdsilent pushdtohome

export HISTIGNORE="&:[ ]*:@(?|??|???|????)"
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_ALL_DUPS

[ -f ~/profile/alias.shrc ] && source ~/profile/alias.shrc
[ -f ~/profile/functions.shrc ] && source ~/profile/functions.shrc

# OS-specific
[ -f ~/profile/$(uname -s).shrc ] && source ~/profile/$(uname -s).shrc
[ -f ~/profile/$(uname -s).zshrc ] && source ~/profile/$(uname -s).zshrc

# Host-specific
[ -f ~/profile/$(uname -n).shrc ] && source ~/profile/$(uname -n).shrc
[ -f ~/profile/$(uname -n).zshrc ] && source ~/profile/$(uname -n).zshrc
