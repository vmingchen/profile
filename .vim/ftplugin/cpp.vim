" The default key binding is <C-I>, which sometimes also means <Tab>.
" Therefore, we change it to <C-K>
map <C-K> :py3f ~/profile/clang-format.py<CR>
imap <C-K> <ESC>:py3f ~/profile/clang-format.py<CR>i
