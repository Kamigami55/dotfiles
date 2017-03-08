syntax on

colorscheme elflord

set relativenumber
set number
set cursorline
set cursorcolumn

set expandtab
set autoindent
filetype indent on

highlight LineNr cterm=bold ctermfg=DarkGrey ctermbg=NONE
highlight CursorLineNr cterm=bold ctermfg=Green ctermbg=NONE

inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap [ []<Esc>i
inoremap {<CR> {<CR>}<Esc>ko
inoremap {{ {}<ESC>i

