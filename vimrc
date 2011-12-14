set t_Co=256

set nocompatible
set background=dark
call pathogen#infect()
let g:solarized_termcolors=256
let g:solarized_termtrans=10

syntax enable
set encoding=utf-8
set nowrap
set smarttab
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set nofoldenable
set hlsearch
set incsearch
set backspace=indent,eol,start

filetype plugin indent on
set number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
set colorcolumn=79
set cursorline
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

nnoremap <silent> <F9> :TagbarToggle<CR>

if filereadable("/usr/local/bin/ctags")
  let g:tagbar_ctags_bin='/usr/local/bin/ctags'
endif

nnoremap ; :

if has('gui_running')
  colorscheme slate
else
  colorscheme solarized
  set background=dark
endif
