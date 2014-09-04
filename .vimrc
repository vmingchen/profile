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

" make and open copen
map <leader>k :make \| copen<cr>

" open NERDTree window
map <leader>t :NERDTree .<cr>
map <leader>g :NERDTree

" spell check
map <leader>s :setlocal spell spelllang=en_us<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

map <leader>t2 :set shiftwidth=2 tabstop=2 expandtab<cr>
map <leader>t4 :set shiftwidth=4 tabstop=4 expandtab<cr>
map <leader>t8 :set shiftwidth=8 tabstop=8 noexpandtab<cr>

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

" the defaul on Mac is 0
set modelines=10

" function key
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nnoremap <F8> :setl noai nocin nosi inde=<CR>
" no autoindentation
:nnoremap <F8> :setl noai nocin nosi inde=<CR>

map <F9> :set cinoptions=>8,(0,:0

" C++: set cinoptions=g1

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.mkd set filetype=markdown

autocmd FileType c,cpp,h,java,sh,tex,html,ml setl foldmethod=syntax
autocmd FileType c set noexpandtab|set tabstop=8|set shiftwidth=8
"autocmd FileType c set cinoptions=>8,(0,:0
"autocmd FileType cc,cpp set expandtab|set tabstop=2|set shiftwidth=2
autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab|set textwidth=100
autocmd FileType tex set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType vim set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType sh set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType python set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType markdown set tabstop=2|set shiftwidth=2|set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My information
iab xdate <c-r>=strftime("%y-%m-%d %H:%M:%S")<cr>
iab xname Ming Chen
iab xchange <c-r>=strftime("%Y-%m-%d")<cr>  Ming Chen  <v.mingchen@gmail.com>

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

" Associate .proto to google protocol buffer files
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

" View RFC
if expand('%:t') =~? 'rfc\d\+'
  "set readonly nomodifiable
  setfiletype rfc
endif

" Display or remove unwanted whitespace with a script
function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

" https://github.com/ciaranm/detectindent
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 2

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>

autocmd BufRead * DetectIndent

map <C-I> :pyf ~/profile/clang-format.py<CR>
imap <C-I> <ESC>:pyf ~/profile/clang-format.py<CR>i

" use only simple char in path
set isfname=@,48-57,/,.,-,_,+,,,~

set backspace=indent,eol,start
