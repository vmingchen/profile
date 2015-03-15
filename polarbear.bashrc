# add software installed by Erez
export PATH=/opt/local/libexec/gnubin:/opt/local/bin:$PATH

# add home brew
export PATH=$HOME/mac/homebrew/bin:$PATH

function jabref() {
  nohup java -jar /home/mchen/mac/bin/JabRef-2.10.jar 1>/dev/null 2>&1 &
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
