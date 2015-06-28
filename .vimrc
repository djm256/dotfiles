execute pathogen#infect()

filetype indent on " per-filetype config
filetype plugin on

syntax on

if has("gui_running")
  colorscheme darkblue
endif

highlight ColorColumn ctermbg=17 guibg=#101020
highlight CursorLine cterm=NONE ctermbg=17 guibg=#101020
highlight Comment ctermfg=blue

set runtimepath^=~/.vim/bundle/ctrlp
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
set guifont="Lucida Console 9"
"set guioptions -=m            " remove menubar
"set guioptions -=T            " remove toolbar

autocmd Filetype perl setlocal ts=4 sts=4 sw=4
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
autocmd Filetype xml setlocal ts=4 sts=4 sw=4
autocmd BufNewFile,BufRead *.ejs set filetype=html

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

function! Ctags()
  execute ':!ctags-exuberant --exclude=public --exclude=log --exclude=config --extra=+f -R * '
endfunction

" https://robots.thoughtbot.com/faster-grepping-in-vim
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
