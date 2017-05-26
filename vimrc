execute pathogen#infect()

set number
set smartcase
set incsearch
set hlsearch
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set cursorline
set showmatch
set encoding=utf-8

set colorcolumn=120
highlight ColorColumn ctermbg=0

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" NERDTree --------------------------------------
autocmd StdinReadPre * let s:std_in=1

" open NT when no files specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Ctrl-n to open NT
map <C-n> :NERDTreeToggle<CR>

" Close Vim if NT is only thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"------------------------------------------------

" FZF -------------------------------------------
set rtp+=~/.fzf
nnoremap <C-p> :call fzf#run({'sink': 'tabedit', 'down': '30%'})<cr>
" -----------------------------------------------

" Trim whitespace on save or ctrl-w
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
nnoremap <C-w> :call TrimWhitespace()<cr>
autocmd BufWritePre * :call TrimWhitespace()

syntax enable
syntax match nonascii "[^\x00-\x7F]"

" Insert IPDB debug line on ctrl-f
fun! CallIpdb()
    r/usr/local/insightsquared/.ipdb.txt
endfun
nnoremap <C-f> :call CallIpdb()<cr>

filetype plugin indent on
