#!/bin/bash - 
#=============================================================================
# Deploy settings
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

direction="${1:restore}"

KarabinerPrivate="${HOME}/Library/Application Support/Karabiner/private.xml"

if [[ ${direction} == 'restore' ]]; then
  cp karabiner-private.xml ${KarabinerPrivate}
elif [[ ${direction} == 'save' ]]; then
  cp "KarabinerPrivate" karabiner-private.xml
fi
