" The default key binding is <C-I>, which sometimes also means <Tab>.
" Therefore, we change it to <C-K>
map <C-K> :pyf ~/profile/clang-format.py<CR>
imap <C-K> <ESC>:pyf ~/profile/clang-format.py<CR>i
