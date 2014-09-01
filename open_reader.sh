#!/bin/bash - 
#=============================================================================
# open adobe reader
# 
# by Ming Chen, v.mingchen@gmail.com
#=============================================================================

set -o nounset                          # treat unset variables as an error
set -o errexit                          # stop script if command fail
IFS=$' \t\n'                            # reset IFS
unset -f unalias                        # make sure unalias is not a function
\unalias -a                             # unset all aliases
ulimit -H -c 0 --                       # disable core dump
hash -r                                 # clear the command path hash


env WINEPREFIX="$HOME/.wine" \
  wine "C:\\Program Files\\Adobe\\Reader 11.0\\Reader\\AcroRd32.exe" "Z:\\$1"
