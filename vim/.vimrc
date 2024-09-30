"set relative number
set relativenumber
"Disable combability with vi
set nocompatible
" Enable type file detection
filetype on
" Enable plugins and load plugins for the detected file type
filetype plugin on
" Turn syntax highlighting on
syntax enable
" Set incremental search while typing
set incsearch 
" Ignore capital letters during search
set ignorecase
" Use highlighting when doing a search
set hlsearch
" Autocomplete commands
set showcmd
" If the current file type is HTML, set indentation to 2 spaces
 autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab
 " Set jj to act as Escape
inoremap jj <Esc>
 " Set colorscheme
 
 " call vim-plug
 call plug#begin('~/.vim/plugged')
 Plug 'dense-analysis/ale'
 Plug 'preservim/nerdtree'
 call plug#end()

 " Leader key
let mapleader = " "
" For node
nnoremap <f5> :w <CR>:!clear <CR>:!node %<CR>

" SPlit Screem
" navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
"Resize split windows using arrow keys
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><


" Nerd Tree
nnoremap <leader>e :NERDTreeToggle<cr>

" select until the end of the line only
vnoremap $ $h


" STATUS LINE
" -----------------------------------------------{{
"Clear the status line 
set statusline=

"Status line left side
set statusline+=\ %F\ %M\ %Y\ %R

"set divider
set statusline+=%=

"status line right side
set statusline+=\ row:\ %l\col:\ %c\ percent:\ %p%%

"set the status on second to last line.
set laststatus=2

"Solarized
if(has("termguicolors"))
	set termguicolors
endif
set background=dark
colorscheme solarized
