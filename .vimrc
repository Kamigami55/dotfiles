set nocompatible              " be iMproved, required
filetype off                  " required


" Init vim-plug plugin manager
call plug#begin('~/.vim/plugged')

" =============== My plugins ===============

" Use airline theme
Plug 'vim-airline/vim-airline'
" More airline theme
Plug 'vim-airline/vim-airline-themes'

" Common vim settings
Plug 'tpope/vim-sensible'

" File system navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Show git status on nerdtree pane
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" Rename file
Plug 'danro/rename.vim'

" Comment out code
Plug 'scrooloose/nerdcommenter'

" Show indent level
Plug 'Yggdroot/indentLine'

" Auto insert parens pair
Plug 'jiangmiao/auto-pairs'

" Tab auto complete
Plug 'ervandew/supertab'

" Python awesome plugin
Plug 'python-mode/python-mode', { 'branch': 'develop' }

" Dash API browser integration (only for MAC)
Plug 'rizzatti/dash.vim'

" Display tags of current file code strucure
" Need universal-ctags
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" Pair parentheses with the same color
Plug 'kien/rainbow_parentheses.vim'

" Quick navigation
Plug 'easymotion/vim-easymotion'

" Auto remove tailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Show git status of current file
Plug 'airblade/vim-gitgutter'

" Undo branch tree
Plug 'mbbill/undotree'

" End vim-plug
call plug#end()

filetype plugin indent on


" =============== Common settings ===============

" ---------- General settings ----------

" Share clipboard with Mac
set clipboard=unnamed

" search as characters are entered
set incsearch
" highlight search matches
set hlsearch

" Auto set paste when pasting something
" also work with tmux
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()



" ---------- Code organize ----------

" Indent & Unindent code in visual mode
vnoremap < <gv
vnoremap > >gv

" Use spaces as indent
set shiftwidth=2
set tabstop=2
set expandtab
set autoindent

" Disable folding function
set nofoldenable

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
highlight LineNr term=bold cterm=NONE ctermfg=251 ctermbg=234 gui=NONE guifg=DarkGrey guibg=NONE
highlight CursorLineNr cterm=bold ctermfg=Yellow ctermbg=088 gui=NONE guifg=Yellow

" Show cursor line and column
set cursorline
set cursorcolumn
highlight CursorLine   cterm=None ctermbg=235 ctermfg=NONE guibg=NONE guifg=White
highlight CursorColumn cterm=None ctermbg=235 ctermfg=NONE guibg=NONE guifg=White

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

" <esc><esc>: clear search highlight after search
nmap <esc><esc> :noh<return>

" ---------- File format ----------

" syntax highlight for .ejs as .html
au BufNewFile,BufRead *.ejs set filetype=html


" =============== Plugin settings ===============

" ---------- Nerdcommenter settings ----------

" Set leader key to <,>
let mapleader=","

" ---------- IndentLine settings ----------

" Set indent marker color to gray
let g:indentLine_color_term = 239

" ---------- Nerdtree settings ----------

" Auto startup Nerdtree
"autocmd vimenter * NERDTree

" <Ctrl-N>: Toggle Nerdtree panel
nmap <C-n> :NERDTreeToggle<CR>

" Close vim if all other window closed except nerdtree panel
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---------- Tagbar settings ----------

" <Ctrl-k>: Toggle Tabgbar panel
nmap <C-k> :TagbarToggle<CR>
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

" ---------- vim-airline settings ----------
" Enable powerline font patch
let g:airline_powerline_fonts = 1

" ---------- vim-gitgutter settings ----------

" Set sign column color
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=235

" ---------- python-mode settings ----------

" Disable rope
let g:pymode_rope = 0

" Disable completion
let g:pymode_rope_completion = 0

" <Ctrl-p>: Perform pylint check
nmap <C-p> :PymodeLint<CR>

" Do not auto open pylint window (default: enabled)
let g:pymode_lint_cwindow = 0

" Set python checker to python3
let g:pymode_python = 'python3'

" Auto close pylint pane when vim close
autocmd WinEnter * if winnr('$') == 1 && ! empty(&buftype) && ! &modified | quit | endif

" ---------- Undotree settings ----------

" <Ctrl-u>: Toggle undotree pane
nnoremap <C-u> :UndotreeToggle<cr>

" Enable persistent undo
" Dir at ~/.vim-undodir/
if has("persistent_undo")
  set undodir=~/.vim-undodir/
  set undofile
endif
