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
set mouse=a
set backupdir=$TEMP//
set directory=$TEMP//


set colorcolumn=100
highlight ColorColumn ctermbg=234

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

command! W write
command! Q quit

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
set rtp+=/usr/local/opt/fzf
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
"fun! CallIpdb()
"    r/usr/local/insightsquared/.ipdb.txt
"endfun
"nnoremap <C-f> :call CallIpdb()<cr>

filetype plugin indent on

" Default to 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2

" Specifics
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" Syntastic config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
" "let g:syntastic_javascript_checkers=['eslint']
" "let g:syntastic_javascript_eslint_exe = 'npm run lint --'
"let g:syntastic_javascript_checkers = []
"autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc', '.;') !=# '' ? ['eslint'] : []

" ALE config
let g:ale_linters = {
\  'javascript': ['eslint'],
\}
let g:ale_sign_column_always = 1
