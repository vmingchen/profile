#!/bin/bash - 
#===============================================================================
#
#          FILE:  link.sh
# 
#         USAGE:  ./link.sh 
# 
#   DESCRIPTION:  Link
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: Ming Chen (chenming), chenming@sohu-rd.com
#       COMPANY: imeresearch@sogou
#       CREATED: 07/20/2010 10:30:23 AM CST
#      REVISION:  ---
#===============================================================================

set -o nounset                          # Treat unset variables as an error
set -o errexit                          # Stop script if command fail
IFS=$' \t\n'                            # Reset IFS
unset -f unalias                        # Make sure unalias is not a function
\unalias -a                             # Unset all aliases

home=~
prof="$home/profile"

function link_files ()
{
	for i in "$@"; do
		if [ -e "$home/$i" ]; then
			mv "$home/$i" "$home/$i.bak"
		fi
		ln -s "$prof/$i" "$home/$i"
	done
}

link_files .vimrc .vim .bashrc .emacs .gdb .gdbinit

