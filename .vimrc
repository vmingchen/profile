" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off

" Vundle: https://github.com/gmarik/Vundle.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'
" Plugin 'floobits/floobits-neovim'

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
" ...
call vundle#end()
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
"Glaive codefmt plugin[mappings]

" enable plugins
syntax on
filetype on
filetype plugin on
filetype plugin indent on

" Enable pathogen.vim
execute pathogen#infect()

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
set statusline=%F%m%r%h%w\ [%n]\ %{fugitive#statusline()}%=\ [%b=%B]\ [%l,%v][%p%%] 
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

" Select the content we just pasted
map <leader>vp `[v`]

" Lookup in manual
map K :Man <cword><CR>
map <leader>mm :Man <cword>
" man page of System calls
map <leader>ms :Man 2 <C-r><C-w><CR>
" man page of Library calls
map <leader>ml :Man 3 <C-r><C-w><CR>

" Lookup symbol with Ack
map <leader>a :tab split<CR>:Ack ""<Left><Left><Left>
map <leader>A :tab split<CR>:Ack <C-r><C-w><CR>

" Open a buffer as scratch board
map <leader>q :tabe ~/buffer<CR>

" Open history window
map <leader>h :<C-F>

" List and choose buffer window
map <leader>b :ls<cr>:b 
"map <leader>bs :ls<CR>:sb 
"map <leader>bh :ls<CR>:sb .h<Left><Left>

" Tag
map <leader>f :tag 

" run Makefile and open error
map <leader>k :make \| cwindow<cr>

" make current window the only window
map <leader>o :only<cr>

" open Taglist window
map <leader>c :Tlist<cr>

" show the quickfix window after executing any cmd contains grep
autocmd QuickFixCmdPost *grep* cwindow

" search using grep and show results in Quickfix
function Mygrep(word)
	let l:keyword = a:word
	if empty(l:keyword) == 1
		let l:keyword = expand("<cword>")
	endif
	echom 'grep -R --include=\*.{py,c,h,cc,cpp,sh} "' . l:keyword . '" .'
	execute('grep -R --include=\*.{py,c,h,cc,cpp,sh} "' . l:keyword . '" .')
endfunction
map <leader>g :call Mygrep("")<Left><Left>
"map <leader>g :grep -R --include=\*.{py,c,h,cc,cpp,sh} "" .<Left><Left><Left>

" open NERDTree window
map <leader>tt :NERDTreeToggle<cr>
map <leader>tf :NERDTreeFind<cr>

" spell check
map <leader>s :setlocal spell spelllang=en_us<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noexpandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

map <leader>t2 :set shiftwidth=2 tabstop=2 softtabstop=2 expandtab<cr>
map <leader>t4 :set shiftwidth=4 tabstop=4 softtabstop=4 expandtab<cr>
map <leader>t8 :set shiftwidth=8 tabstop=8 softtabstop=8 noexpandtab<cr>

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

autocmd FileType gp setl textwidth=200

au BufRead,BufNewFile *.py set filetype=python
autocmd FileType python set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType python set omnifunc=pythoncomplete#Complete

autocmd FileType c,cpp,h,java,sh,tex,html,ml setl foldmethod=syntax
autocmd FileType c,cpp,h,java,sh,tex,html,ml setl foldminlines=5
autocmd FileType c,cpp,h,java,sh,tex,html,ml setl foldlevel=3

autocmd FileType gp setl textwidth=200
autocmd FileType gp set makeprg=gnuplot\ %

autocmd FileType c set noexpandtab|set tabstop=8|set shiftwidth=8
autocmd FileType c set cinoptions=>8,(0,:0
"autocmd FileType cc,cpp set expandtab|set tabstop=2|set shiftwidth=2
autocmd FileType html set tabstop=2|set shiftwidth=2|set expandtab|set textwidth=100
autocmd FileType tex set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType vim set tabstop=2|set shiftwidth=2|set noexpandtab
autocmd FileType sh set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType sh set iskeyword-=.  " stop at . for word motions like w, e
"autocmd FileType markdown set tabstop=2|set shiftwidth=2|set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"My information
iab xdate <c-r>=strftime("%Y-%m-%d")<cr>
iab xtime <c-r>=strftime("%y-%m-%d %H:%M:%S")<cr>
iab xname Ming Chen
iab xchange <c-r>=strftime("%Y-%m-%d")<cr>  Ming Chen  <v.mingchen@gmail.com>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For Tex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor='latex'
autocmd FileType tex set makeprg=make\ pdf

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

runtime! ftplugin/man.vim

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
let g:detectindent_preferred_expandtab = 0
let g:detectindent_preferred_indent = 8

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
nnoremap <F12>     :ShowSpaces 1<CR>
nnoremap <S-F12>   m`:TrimSpaces<CR>``
vnoremap <S-F12>   :TrimSpaces<CR>

autocmd BufRead * DetectIndent

" use only simple char in path
set isfname=@,48-57,/,.,-,_,+,,,~

" make sure Ctrl-W can delete previous words not just inserted
set backspace=indent,eol,start

set clipboard=unnamed

" load OS-specific settings
let s:osvimrc = '~/profile/' . substitute(system("uname"), '\n', '.vimrc', '')
if filereadable(glob(s:osvimrc))
  execute 'source ' . s:osvimrc
endif

" load host-specific settings
let s:hostvimrc = '~/profile/' . substitute(system("uname -n"), '\n', '.vimrc', '')
if filereadable(glob(s:hostvimrc))
  execute 'source ' . s:hostvimrc
endif

if $TMUX != ''
  set clipboard="
endif

" scheme, other cool colorscheme: wombat
"colorscheme delek
colorscheme desert
highlight search ctermfg=black ctermbg=white
