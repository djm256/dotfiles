execute pathogen#infect()

filetype indent on " per-filetype config

set dictionary=/usr/share/dict/words
"set ignorecase
set nocp
set ruler
set showmatch
"set softtabstop=3
set tabstop=4
"set tabstop=8
set shiftwidth=4
set expandtab
"set noexpandtab
set list listchars=tab:»·,trail:·
"set list listchars=tab:··,trail:·
set ttyfast
set wildmenu
set bg=dark
set cinoptions=>2s,e-s,{s,^-s,(s,n-s,(0
set viminfo='20,\"1000
set smarttab
set autoindent
"256 colour mode
set t_Co=256
"Swap directory path (// means use full pathname to file)
set directory=~/.vim/tmp//,~/tmp,/tmp

autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

"cnoremap <ESC>b <S-Left>
"cnoremap <ESC>f <S-Right>

iab teh the
iab Teh The
iab shoudl should

map ,L mz1G/Last update: */e+1<CR>D:r!date<CR>kJ
map ,i :w<CR>:!aspell -x check %<CR>:e %<CR>
map ,w :w<CR>:!weblint %<CR>
nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <leader>t :!rspec --colour<CR>

syntax on

set colorcolumn=80
highlight ColorColumn ctermbg=17 guibg=#101020

set cursorline
highlight CursorLine cterm=NONE ctermbg=17 guibg=#101020

highlight Comment ctermfg=blue
"highlight StatusLine ctermfg=red ctermbg=green

