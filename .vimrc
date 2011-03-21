" This must be first, because it changes other options as a side effect.
set nocompatible

" scheme, other cool colorscheme: wombat
colorscheme desert

" enable plugins
syntax on
filetype on
filetype plugin on
filetype plugin indent on

" turn backup off
set nobackup
set nowb
set dir=~/tmp  " swap file directory

" font
set gfn=Monospace\ 10

" tab map
map <M-Right> :tabnext<CR>
map <M-Left> :tabprev<CR>

" set GUI
set guioptions-=T
set laststatus=2
set statusline=%F%m%r%h%w\ [%n]\ [%{&ff}]%=\ dec:%b\ hex:%B\ [%l,%v][%p%%] 
" Maximize the window
" au GUIEnter * simalt ~x

" show line number
set number

"No sound on errors.
set noerrorbells
set novisualbell

"Ignore case when searching
set ignorecase
set smartcase
set incsearch
set hlsearch
set magic " enable wildcard

" Highlight current line and column
set cul

" Folding
set foldenable
set shiftwidth=4

" Ctrl X, Ctrl V, Ctrl Y, Ctrl S
vnoremap <C-X> "+x
vnoremap <C-C> "+y
map <C-V> "+gP
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" Map Y to do the same (well, almost) as the D command
map Y y$

" set <Leader>
let mapleader = ","

" Switch to current dir
map <leader>cd :cd %:p:h<cr>

" Lookup in manual
map <leader>m :!man 

" Open a buffer as scratch board
map <leader>q :tabe ~/buffer<CR>

" Open history window
map <leader>h :<C-F>

" List and choose buffer window
map <leader>b :ls<cr>:b 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set tabstop=4 
set shiftwidth=4
set softtabstop=4

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>

au FileType c,cpp,h,java,sh,tex,html,python,ml setl foldmethod=syntax
au FileType tex setl shiftwidth=2
autocmd FileType python set omnifunc=pythoncomplete#Complete

" au FileType tex,html,python,vim,javascript setl tabstop=2
" au FileType ml,java setl shiftwidth=4
" au FileType ml,java setl tabstop=4

set smarttab
set lbr
set textwidth=100

""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

"Smart indet
" set si

"C-style indeting
set cindent

"Wrap lines
set wrap

" function key
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My information
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab xname Ming Chen

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Tex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor='latex'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For XML
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:xml_syntax_folding=1

" Taglist
let g:Tlist_Use_Right_Window=1

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
