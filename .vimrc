syntax on

set shiftwidth=2
set tabstop=2
set expandtab
set autoindent
filetype indent on

set relativenumber
set number
set cursorline
set cursorcolumn
set t_Co=256

highlight Comment ctermfg=033

highlight LineNr term=bold cterm=NONE ctermfg=251 ctermbg=236 gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNr cterm=bold ctermfg=Yellow ctermbg=088 gui=NONE guifg=Yellow 
highlight CursorLine   cterm=None ctermbg=234 ctermfg=NONE guibg=NONE guifg=White
highlight CursorColumn cterm=None ctermbg=234 ctermfg=NONE guibg=NONE guifg=White

" Encoding for chinese
set encoding=utf8
set fileencodings=utf8,big5,gbk,latin1
set fileencoding=big5

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
