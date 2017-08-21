syntax on

set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
filetype indent on

set relativenumber
set number
set cursorline
set cursorcolumn
set t_Co=256
highlight LineNr term=bold cterm=NONE ctermfg=251 ctermbg=236 gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNr cterm=bold ctermfg=Yellow ctermbg=088 gui=NONE guifg=Yellow 
highlight CursorLine   cterm=bold ctermbg=234 ctermfg=NONE guibg=NONE guifg=white
highlight CursorColumn cterm=bold ctermbg=234 ctermfg=NONE guibg=NONE guifg=white 

" Encoding for chinese
set encoding=utf8
set fileencodings=utf8,big5,gbk,latin1
set fileencoding=big5

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
