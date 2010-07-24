" Scheme
colorscheme desert

" This must be first, because it changes other options as a side effect.
set nocompatible

filetype on
filetype plugin on

"Turn backup off
set nobackup
set nowb
set dir=~/tmp  " swap file directory

" Font
set gfn=Monospace\ 10

" tab map
map <M-Right> :tabnext<CR>
map <M-Left> :tabprev<CR>

" Hide the toolbar
set guioptions-=T

" Maximize the window
" au GUIEnter * simalt ~x

" Show line number
set number

"No sound on errors.
set noerrorbells
set novisualbell

"Ignore case when searching
set ignorecase
set incsearch
set hlsearch
set magic " enable wildcard

" Highlight current line and column
set cul

" Folding
" enable folding, I find it very useful
set foldenable
set foldmethod=syntax
set shiftwidth=4

" Ctrl X, Ctrl V, Ctrl Y, Ctrl S
vnoremap <C-X> "+x
vnoremap <C-C> "+y
map <C-V> "+gP
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" Map Y to do the same (well, almost) as the D command
map Y y$

" Switch to current dir
let mapleader = ","
map <leader>cd :cd %:p:h<cr>

" Open history window
map <leader>h :<C-F>

" Choose buffer window
map <leader>b :ls<cr>:b 

" Open man
map <leader>m :!man 

" Open a dummy buffer for paste
map <leader>q :tabe ~/buffer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>
au FileType tex,html,python,vim,javascript setl shiftwidth=2
au FileType tex,html,python,vim,javascript setl tabstop=2
au FileType ml,java setl shiftwidth=4
au FileType ml,java setl tabstop=4

set smarttab
set lbr
set tw=500

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
