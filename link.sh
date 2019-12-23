#
#         USAGE:  ./link.sh 
# 
#   DESCRIPTION:  Link all profile files
# 
#        AUTHOR: Ming Chen, v.mingchen@gmail.com
#       CREATED: 07/20/2010 10:30:23 AM CST
#===============================================================================

set -o nounset                          # Treat unset variables as an error
set -o errexit                          # Stop script if command fail
IFS=$' \t\n'                            # Reset IFS
unset -f unalias                        # Make sure unalias is not a function
\unalias -a                             # Unset all aliases

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
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

link_files .vimrc .vim .bash_profile .bashrc .spacemacs .gdb .gdbinit \
	.gitconfig .git-completion.bash .gitignore .gitaliases \
	.screenrc .tmux.conf .zshrc .zshenv .ackrc .pylintrc .style.yapf \
	.tmux

ln -s "$prof/.vimrc" ~/.nvimrc
ln -s "$prof/.vim" ~/.nvim
ln -s "$prof/i3" ~/.i3

# install ssh config
if [ -d ~/.ssh ]; then
	cp ssh-config ~/.ssh/config
	chmod 644 ~/.ssh/config
fi

# use google style for the default code style
[ -f .clang-format ] || ln -s "$prof/google.clang-format" ~/.clang-format

# install YouCompleteMe
#cd $prof
#git submodule update --init --recursive
#cd .vim/bundle/YouCompleteMe
#./install.sh
