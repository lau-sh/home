"NeoBundle Scripts-----------------------------
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/home/elau/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/home/elau/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimshell.vim'

" Additional plugins
NeoBundle 'Valloric/YouCompleteMe'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'bling/vim-airline'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'junegunn/limelight.vim'
NeoBundle 'luochen1990/rainbow'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tmhedberg/matchit'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/a.vim'

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Theme                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme solarized
set background=dark
set t_Co=256

let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:solarized_contrast="high"
let g:solarized_termtrans=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Settings                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

set autoread
set autowrite
set backspace=indent,eol,start
set cino=N-s,+0,(0,g0
set clipboard+=unnamed
set colorcolumn=80

set display+=lastline
set expandtab
set foldenable
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldmethod=marker
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

set guifont=Monospace
set guioptions-=m
set guioptions-=T
set history=30		" keep 50 lines of command line history
set hlsearch
set incsearch		" do incremental searching
set infercase

set laststatus=2
set lazyredraw
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
set smartcase
set smartindent
set splitbelow
set splitright
set shiftwidth=4

set tabstop=4
set t_ut=
set ttyfast
set vb t_vb=
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Global Variables                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:limelight_conceal_guifg='#171717'
let g:limelight_conceal_ctermfg=238
let g:limelight_paragraph_span=1

let g:rainbow_active=1
let g:rainbow_conf = {
\   'guifgs': ['blue', 'green', 'yellow', 'red', 'lightblue', 'lightgreen', 'lightyellow', 'lightred'],
\   'ctermfgs': ['blue', 'green', 'yellow', 'red', 'lightblue', 'lightgreen', 'lightyellow', 'lightred'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\}

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Functions                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RealignCode()
    %!astyle
    FixWhitespace
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Autocommands                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FocusLost * :set norelativenumber
autocmd FocusGained * :set relativenumber

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Normal remaps
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader> <nop>
nnoremap <leader>" ci"
nnoremap <leader>' ci'
nnoremap <leader>( ci(
nnoremap <leader>) ca)
nnoremap <leader>- <Esc>:center<CR>0
nnoremap <leader>/ ms/
nnoremap <leader>0 ci)
nnoremap <leader>< ci<
nnoremap <leader>= <Esc>:call RealignCode()<CR>
nnoremap <leader>> ca>
nnoremap <leader>? ms?
nnoremap <leader>? ms?
nnoremap <leader>[ ci[
nnoremap <leader>[ ci[
nnoremap <leader>] ca]
nnoremap <leader>] ci{
nnoremap <leader>a <Esc>:A<CR>
nnoremap <leader>d d/[A-Z-_]<CR>:nohlsearch<CR>
nnoremap <leader>e <Esc>:NERDTree<CR>
nnoremap <leader>h <Esc>:nohlsearch<CR>
nnoremap <leader>l <Esc>:Limelight!!<CR>
nnoremap <leader>m <Esc>:mksession!<CR>
nnoremap <leader>n <Esc>:tabnew<CR>
nnoremap <leader>p <Esc>:set paste!<CR>
nnoremap <leader>q <Esc>:bdelete<CR>
nnoremap <leader>t <Esc>:tabedit %<CR>
nnoremap <leader>w <Esc>:set wrap!<CR>
nnoremap <leader>{ ci{
nnoremap <leader>} ca}

nnoremap }c <Esc>:cnext<CR>
nnoremap }t <Esc>:tabnext<CR>
nnoremap {c <Esc>:cprevious<CR>
nnoremap {t <Esc>:tabprevious<CR>

" Blocking out the evil keys
noremap! <Up> <NOP>
noremap! <Down> <NOP>
noremap! <Left> <NOP>
noremap! <Right> <NOP>
