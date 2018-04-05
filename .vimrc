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

" My plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree'

call vundle#end()            
filetype plugin indent on
" End Vundle



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
map <F4> : set nu!<BAR>set nonu?<CR>

" syntax highlight for .ejs as .html
au BufNewFile,BufRead *.ejs set filetype=html


" ========== Nerdtree setting ==========

" Auto startup Nerdtree
"autocmd vimenter * NERDTree

" key
map <C-n> :NERDTreeToggle<CR>

" Close vim if all other window closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


