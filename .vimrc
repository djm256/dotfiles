execute pathogen#infect()

filetype indent on " per-filetype config
filetype plugin on

syntax on

highlight ColorColumn ctermbg=17 guibg=#101020
highlight CursorLine cterm=NONE ctermbg=17 guibg=#101020
highlight Comment ctermfg=blue

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
set number
set scrolloff=999             " keep cursor in the middle of the screen

autocmd Filetype perl setlocal ts=4 sts=4 sw=4
autocmd Filetype eruby setlocal ts=4 sts=4 sw=4
autocmd Filetype xml setlocal ts=4 sts=4 sw=4

" vim-flavored-markdown
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" vim-ruby-xmpfilter
" Needs gem rcodetools installed
autocmd FileType ruby map <buffer> <F4> <Plug>(xmpfilter-mark)
autocmd FileType ruby map <buffer> <F5> <Plug>(xmpfilter-run)

let mapleader = ","

nmap <leader>i :w<CR>:!aspell -x check %<CR>:e %<CR>
nmap <leader>w :w<CR>:!weblint %<CR>
nmap <silent> <C-D> :NERDTreeToggle<CR>
nmap <leader>t :!rspec --colour<CR>
imap <c-l> <space>=><space>

" force vim
"map <Left> :echo "No!"<cr>
"map <Right> :echo "No!"<cr>
"map <Up> :echo "No!"<cr>
"map <Down> :echo "No!"<cr>

" evil mode
"inoremap <Left> <nop>
"inoremap <Right> <nop>
"inoremap <Up> <nop>
"inoremap <Down> <nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

