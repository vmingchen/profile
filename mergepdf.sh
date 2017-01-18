#!/bin/bash - 
#=============================================================================
# Merge PDF files. Usage "mergepdf.sh in1.pdf in2.pdf ... out.pdf".
#
# To combine multiple image files into a single pdf, simply use "convert" in
# the imagemagick tool.
# 
# by Ming Chen, v.mingchen@gmail.com
#=============================================================================

set -o nounset                          # treat unset variables as an error
set -o errexit                          # stop script if command fail
export PATH="/bin:/usr/bin:/sbin:/usr/local/bin"             
IFS=$' \t\n'                            # reset IFS
unset -f unalias                        # make sure unalias is not a function
\unalias -a                             # unset all aliases
ulimit -H -c 0 --                       # disable core dump
hash -r                                 # clear the command path hash

if [[ "$#" < 2 ]]; then
  echo -e "usage: \"mergepdf.sh in1.pdf in2.pdf ... out.pdf\"\n"
  echo "To combine multiple image files into a single pdf, simply "
  echo "use \"convert\" in  the imagemagick tool."
  exit 0
fi

ninputs="$(( $# - 1 ))"
inputs="${@:1:$ninputs}"
output="${@: -1}"

echo "Combining $inputs -----to-----> $output"

if [[ "${1##*.}" = "pdf" ]]; then
  gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile="${output}" "${inputs}"
else
  convert "$@"
fi
