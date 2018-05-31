set nocompatible              " be iMproved, required
filetype off                  " required

" Auto install Vundle
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

" Init Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" =============== My plugins ===============

" Use airline theme
Plugin 'vim-airline/vim-airline'
" More airline theme
Plugin 'vim-airline/vim-airline-themes'

" Common vim settings
Plugin 'tpope/vim-sensible'

" File system navigation
Plugin 'scrooloose/nerdtree'

" Rename file
Plugin 'danro/rename.vim'

" Comment out code
Plugin 'scrooloose/nerdcommenter'

" Show indent level
Plugin 'Yggdroot/indentLine'

" Auto insert parens pair
Plugin 'jiangmiao/auto-pairs'

" Tab auto complete
Plugin 'ervandew/supertab'

" Python awesome plugin
Plugin 'python-mode/python-mode'

" Dash API browser integration (only for MAC)
Plugin 'rizzatti/dash.vim'

" Display tags of current file code strucure
" Need universal-ctags
Plugin 'majutsushi/tagbar'

" Pair parentheses with the same color
Plugin 'kien/rainbow_parentheses.vim'

" Quick navigation
Plugin 'easymotion/vim-easymotion'

" Auto remove tailing whitespace
Plugin 'ntpeters/vim-better-whitespace'

" Show git status on nerdtree pane
Plugin 'Xuyuanp/nerdtree-git-plugin'


call vundle#end()
filetype plugin indent on
" End Vundle


" =============== Common settings ===============

" ---------- General settings ----------

" ---------- Code organize ----------

" Indent & Unindent code in visual mode
vnoremap < <gv
vnoremap > >gv

" Use spaces as indent
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent

" ---------- Display ----------

" Syntax highlight
syntax on

" Set color format
set t_Co=256

" Show tab character (notice there is a space at the end)
set list lcs=tab:\|\

" Set comment color to light blue
highlight Comment ctermfg=033

" Show line number
set relativenumber
set number
highlight LineNr term=bold cterm=NONE ctermfg=251 ctermbg=236 gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNr cterm=bold ctermfg=Yellow ctermbg=088 gui=NONE guifg=Yellow

" Show cursor line and column
set cursorline
set cursorcolumn
highlight CursorLine   cterm=None ctermbg=234 ctermfg=NONE guibg=NONE guifg=White
highlight CursorColumn cterm=None ctermbg=234 ctermfg=NONE guibg=NONE guifg=White

" Show ruler at column 80, and every line after 120
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=234 guibg=lightgrey

" ---------- File encoding ----------

" Encoding for chinese
set encoding=utf8
set fileencodings=utf8,big5,gbk,latin1
set fileencoding=big5

" ---------- Useful hotkeys ----------

" <F9>: Run this file as python executable
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

" <F4>: Toggle line number display
map <F4> : set nu!<BAR>set nonu?<CR>

" ---------- File format ----------

" syntax highlight for .ejs as .html
au BufNewFile,BufRead *.ejs set filetype=html


" =============== Plugin settings ===============

" ---------- Nerdcommenter settings ----------

" Set leader key to <,>
let mapleader=","

" ---------- IndentLine settings ----------

" Set indent color to gray
let g:indentLine_color_term = 239


" ---------- Nerdtree settings ----------

" Auto startup Nerdtree
"autocmd vimenter * NERDTree

" <Ctrl-N>: Toggle Nerdtree panel
nmap <C-n> :NERDTreeToggle<CR>

" Close vim if all other window closed except nerdtree panel
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---------- Tagbar settings ----------

" <Ctrl-,>: Toggle Tabgbar panel
nmap <C-m> :TagbarToggle<CR>
" Set pane width to 30 characters (Default: 40)
let g:tagbar_width = 30

" ---------- Ranbow_parentheses settings ----------

" Enable ranbow_parentheses when start vim
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ---------- Easy_motion settings ----------

" Disable default mappings
let g:EasyMotion_do_mapping = 0

" Jump to anywhere you want
" `s{char}{char}{label}`
map s <Plug>(easymotion-overwin-f2)

" Turn on Case Insensitive feature
let g:EasyMotion_smartcase = 1

" Enable JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Enable WB motions: Word motions
map <Leader>w <Plug>(easymotion-w)
map <Leader>b <Plug>(easymotion-b)

" ---------- vim-better-whitespace settings ----------

" Enable whitespace highlighting
let g:better_whitespace_enabled=1

" Auto strip whitespace when save
let g:strip_whitespace_on_save=1
