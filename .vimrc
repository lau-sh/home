set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
let path='~/.vim/bundle'

call vundle#begin(path)

  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'
  Plugin 'Valloric/YouCompleteMe'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'bling/vim-airline'
  Plugin 'scrooloose/nerdtree'
  Plugin 'tpope/vim-fugitive'

  Bundle "MarcWeber/vim-addon-mw-utils"
  Bundle "tomtom/tlib_vim"
  Bundle 'Lokaltog/vim-easymotion'
  Bundle 'bronson/vim-trailing-whitespace'
  Bundle 'kien/ctrlp.vim'
  Bundle 'kien/rainbow_parentheses.vim'
  Bundle 'scrooloose/nerdcommenter'
  Bundle 'scrooloose/syntastic'

call vundle#end()
  filetype plugin on

  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax * RainbowParenthesesLoadRound
  autocmd Syntax * RainbowParenthesesLoadSquare
  autocmd Syntax * RainbowParenthesesLoadBraces

set autochdir
set autoread
set autowrite
set backspace=indent,eol,start
set cino=N-s,+0
set clipboard+=unnamed
set display+=lastline
set expandtab

set guioptions-=m
set guioptions-=T

set foldenable
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldmethod=marker
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
set history=50		" keep 50 lines of command line history
set hlsearch
set incsearch		" do incremental searching
set laststatus=2
set matchtime=5
set modeline
set modelines=5
set nolist
set nrformats-=octal
set number
set pastetoggle=<F10>
set relativenumber
set ruler		" show the cursor position all the time
set shiftround

set showcmd		" display incomplete commands
set showmatch
set splitbelow
set splitright
set smartindent
set vb t_vb=
set wildmenu

set shiftwidth=2
set tabstop=2

if (has("unix"))
  set tags+=tags,~/.vim/tags
  let g:ycm_collect_identifiers_from_tags_files=1
  let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set backup/swap directories
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has("unix"))
  set backupdir=~/.vim/backup,.
  set directory=~/.vim/swap,.
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

if (!has("gui_running"))
  let g:solarized_termcolors=256
  set t_Co=256
endif

set background=dark
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader> <nop>
nnoremap <leader>" ci"
nnoremap <leader>' ci'
nnoremap <leader>, ci<
nnoremap <leader>. ci>
nnoremap <leader>/ ms/
nnoremap <leader>0 ci)
nnoremap <leader>9 ci(
nnoremap <leader>? ms?
nnoremap <leader>[ ci[
nnoremap <leader>] ci]
nnoremap <leader>c d/[A-Z-_]<CR>:nohlsearch<CR>i
nnoremap <leader>d :%d<CR>
nnoremap <leader>d d/[A-Z-_]<CR>:nohlsearch<CR>
nnoremap <leader>f cf<Space>
nnoremap <leader>j 10j
nnoremap <leader>k 10k
nnoremap <leader>p viw"0p
nnoremap <leader>t ct<Space>
nnoremap <leader>w :set wrap!<CR>
nnoremap <leader>y :%y<CR>
nnoremap <leader>y yiw
nnoremap <leader>z <Esc>:call FlipAutoclose()<CR>
nnoremap <leader>{ ci{
nnoremap <leader>} ci}
nnoremap <leader>= <Esc>:call RealignCode()<CR>
nnoremap <silent> <leader>l :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Command remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cmap w!! w !sudo tee > /dev/null %
autocmd CursorHold * checktime
autocmd FileType sh :inoremap { {}<Esc>:call BC_AddChar("}")<CR>i
autocmd FileType cmake :inoremap { {}<Esc>:call BC_AddChar("}")<CR>i
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FlipAutoclose()
  if exists("b:ac")
    unlet b:ac
    iunmap (
    iunmap [
    iunmap "
    iunmap {
    iunmap <leader>j
  else
    let b:ac = 1
    inoremap ( ()<Esc>:call BC_AddChar(")")<CR>i
    inoremap [ []<Esc>:call BC_AddChar("]")<CR>i
    inoremap " ""<Esc>:call BC_AddChar("\"")<CR>i
    inoremap { {}<Esc>:call BC_AddChar("}")<CR>i
    inoremap <leader>j <Esc>:call search(BC_GetChar(), "W")<CR>a
  endif
endfunction

function! BC_AddChar(schar)
  if exists("b:robstack")
    let b:robstack = b:robstack . a:schar
  else
    let b:robstack = a:schar
  endif
endfunction

function! BC_GetChar()
  let l:char = b:robstack[strlen(b:robstack)-1]
  let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
  return l:char
endfunction

function! RealignCode()
  %!astyle
  FixWhitespace
endfunction
