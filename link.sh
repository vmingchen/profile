#!/bin/bash - 
#===============================================================================
#
#         USAGE:  ./link.sh 
# 
#   DESCRIPTION:  Link
# 
#        AUTHOR: Ming Chen (chenming), v.mingchen@gmail.com
#       CREATED: 07/20/2010 10:30:23 AM CST
#      REVISION:  
#               1.1, 12/05/11 11:17:34, use ls to list link files
#===============================================================================

set -o nounset                          # Treat unset variables as an error
set -o errexit                          # Stop script if command fail
IFS=$' \t\n'                            # Reset IFS
unset -f unalias                        # Make sure unalias is not a function
\unalias -a                             # Unset all aliases

prof="$HOME/profile"

function link_files()
{
	for i in "$@"; do
        if [ "$i" = "link.sh" ]; then
            continue
        fi
		if [ -f "$HOME/$i" ]; then
			mv "$HOME/$i" "$HOME/$i.bak"
		fi
    if [ -L "$HOME/$i" ]; then
      rm "$HOME/$i"
    fi
		ln -s "$prof/$i" "$HOME/$i"
	done
}

link_files .vimrc .vim .bashrc .emacs .gdb .gdbinit \
	.gitconfig .git-completion.bash .gitignore .gitaliases \
	.screenrc .tmux.conf .zshrc .zshenv \

ln -s "$prof/.vimrc" ~/.nvimrc
ln -s "$prof/.vim" ~/.nvim

# install ssh config
if [ -d ~/.ssh ]; then
	cp ssh-config ~/.ssh/config
	chmod 644 ~/.ssh/config
fi

# use google style for defalt code style
[ -f .clang-format ] || ln -s "$prof/google.clang-format" .clang-format
