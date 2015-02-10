# add software installed by Erez
export PATH=/opt/local/libexec/gnubin:/opt/local/bin:$PATH

# add home brew
export PATH=$HOME/mac/homebrew/bin:$PATH

# add rvm
export PATH=/home/mchen/.rvm/bin:$PATH

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# ignore .DS_Store file
export FIGNORE=DS_Store

export CVS_RSH=ssh
export CLICOLOR=1
