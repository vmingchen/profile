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

" Search tag
map <leader>f :tag 

" Open a buffer as scratch board
map <leader>q :tabe ~/buffer<CR>

" Open history window
map <leader>h :<C-F>

" List and choose buffer window
map <leader>b :ls<cr>:b 

" Tag
map <leader>f :tag 

" run Makefile and open error
map <leader>k :make \| copen<cr>

" make current window the only window
map <leader>o :only<cr>

" open Taglist window
map <leader>c :Tlist<cr>

" open NERDTree window
map <leader>t :NERDTree .<cr>
map <leader>g :NERDTree 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noexpandtab
set tabstop=4 
set shiftwidth=4
set softtabstop=4

map <leader>t2 :set shiftwidth=2 tabstop=2<cr>
map <leader>t4 :set shiftwidth=4 tabstop=4<cr>
map <leader>t8 :set shiftwidth=8 tabstop=8<cr>

set smarttab
set lbr
set tw=79

""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

"Smart indet
" set si

"C-style indenting
set cindent

"Wrap lines
set wrap

" function key
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nnoremap <F8> :setl noai nocin nosi inde=<CR>
" no autoindentation
:nnoremap <F8> :setl noai nocin nosi inde=<CR>

autocmd FileType c,cpp,h,java,sh,tex,html,ml setl foldmethod=syntax
autocmd FileType c set noexpandtab|set tabstop=8|set shiftwidth=8
autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab|set textwidth=100
autocmd FileType tex set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType sh set tabstop=4|set shiftwidth=4|set noexpandtab
autocmd FileType vim set tabstop=4|set shiftwidth=4|set noexpandtab
autocmd FileType python set tabstop=4|set shiftwidth=4|set noexpandtab|setl foldmethod=indent
autocmd FileType python set omnifunc=pythoncomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My information
iab xdate <c-r>=strftime("%y-%m-%d %H:%M:%S")<cr>
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

"au FileType markdown syn region myMkdHeaderFold
        "\ start="\v^\z(\#{1,6})"
        "\ skip="\v(\n\z1\#)\@="
        "\ end="\v\n(\#)\@="ms=s-1,me=s-1
        "\ fold contains=myMkdHeaderFold
"au FileType markdown syn sync fromstart

function MkdFoldLevel(lineNo)
    let thisline = getline(a:lineNo)
    if ( thisline =~ '^#.*' )
        let level = 0
        while strpart(thisline, level, 1) == '#'
            let level += 1
        endwhile
        let result = ">" . string(level)
        return result
    else
        return "="
    endif
endfunction
au FileType markdown set foldmethod=expr
au FileType markdown set foldexpr=MkdFoldLevel(v:lnum)

if filereadable(expand("~/.local_vimrc"))
	source ~/.local_vimrc
endif
