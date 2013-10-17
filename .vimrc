execute pathogen#infect()

filetype indent on " per-filetype config
filetype plugin on

set nocp
set showmatch
set tabstop=2
set shiftwidth=2
set expandtab
set list listchars=tab:»·,trail:·
set ttyfast
set wildmenu
set bg=dark
set cinoptions=>2s,e-s,{s,^-s,(s,n-s,(0
set viminfo='20,\"1000
set smarttab
set autoindent
"Swap directory path (// means use full pathname to file)
set directory=~/.vim/tmp//,~/tmp,/tmp
set laststatus=2
set t_Co=256
set colorcolumn=80
set cursorline

autocmd Filetype perl setlocal ts=4 sts=4 sw=4

let mapleader = ","

nmap <leader>i :w<CR>:!aspell -x check %<CR>:e %<CR>
nmap <leader>w :w<CR>:!weblint %<CR>
nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <leader>t :!rspec --colour<CR>

syntax on

highlight ColorColumn ctermbg=17 guibg=#101020
highlight CursorLine cterm=NONE ctermbg=17 guibg=#101020
highlight Comment ctermfg=blue

