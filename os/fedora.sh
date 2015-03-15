#!/bin/bash - 
#=============================================================================
# Install essential packages needed for fedora
# 
# by Ming Chen, v.mingchen@gmail.com
#=============================================================================

set -o nounset                          # treat unset variables as an error
set -o errexit                          # stop script if command fail
export PATH="/bin:/usr/bin:/sbin"             
IFS=$' \t\n'                            # reset IFS
unset -f unalias                        # make sure unalias is not a function
\unalias -a                             # unset all aliases
ulimit -H -c 0 --                       # disable core dump
hash -r                                 # clear the command path hash

yum -y zsh tmux vim ctags cscope wget gcc gdb clang

wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh
