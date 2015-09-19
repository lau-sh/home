""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             NeoBundle Scripts                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

let $BASH_ENV="~/.bash_aliases"

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
set history=50
set hlsearch
set incsearch
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
set ruler
set shiftround
set showcmd
set showmatch
set smartcase
set smartindent
set splitbelow
set splitright
set shiftwidth=4

set tabstop=4
set tags=./tags, ~/.vim/etc/tags
set textwidth=0
set t_ut=
set ttyfast
set vb t_vb=
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Global Variables                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 1

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

set statusline+=%1*\ %n\ %*
set statusline+=%4*\ %<%F%*
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Command remaps                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cmap w!! w !sudo tee > /dev/null %
cmap Q<CR> q<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Normal remaps                                "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do not remap the following keys: c

inoremap <Leader> <NOP>
nnoremap <Leader> <NOP>
nnoremap <Leader>- <Esc>:center<CR>0
nnoremap <Leader>= <Esc>:call RealignCode()<CR>
nnoremap <Leader>a <Esc>:A<CR>
nnoremap <Leader>c <Esc>:set relativenumber! \| set nonumber!<CR>
nnoremap <Leader>e <Esc>:NERDTree<CR>
nnoremap <Leader>h <Esc>:nohlsearch<CR>
nnoremap <Leader>l <Esc>:Limelight!!<CR>
nnoremap <Leader>m <Esc>:mksession!<CR>
nnoremap <Leader>n <Esc>:tabnew<CR>
nnoremap <Leader>p <Esc>:set paste!<CR>
nnoremap <Leader>q <Esc>:bdelete<CR>
nnoremap <Leader>s <Esc>:SyntasticCheck<CR>
nnoremap <Leader>t <Esc>:tabedit %<CR>
nnoremap <Leader>w <Esc>:set wrap!<CR>

nnoremap <Leader>gb <Esc>:Gblame<CR>
nnoremap <Leader>gd <Esc>:Gdiff<CR>
nnoremap <Leader>ge <Esc>:Gedit<CR>
nnoremap <Leader>gs <Esc>:Gstatus<CR>

nnoremap <Space> <NOP>
nnoremap <Space>" ci"
nnoremap <Space>' ci'
nnoremap <Space>( ci(
nnoremap <Space>) ci)
nnoremap <Space>/ ms/
nnoremap <Space>< ci<
nnoremap <Space>> ci>
nnoremap <Space>? ms?
nnoremap <Space>[ ci[
nnoremap <Space>] ci]
nnoremap <Space>{ ci{
nnoremap <Space>} ci}

nnoremap <Space>c d/[A-Z-_]<CR>:nohlsearch<CR>i
nnoremap <Space>d d/[A-Z-_]<CR>:nohlsearch<CR>

nmap <Space> <Plug>(easymotion-prefix)
nmap <Space>s <Plug>(easymotion-s)
nmap <Space>f <Plug>(easymotion-f)
nmap <Space>F <Plug>(easymotion-F)
nmap <Space>w <Plug>(easymotion-w)
nmap <Space>b <Plug>(easymotion-b)
nmap <Space>e <Plug>(easymotion-e)

nnoremap ]b <Esc>:bnext<CR>
nnoremap [b <Esc>:bprevious<CR>
nnoremap ]c <Esc>:cnext<CR>
nnoremap [c <Esc>:cprevious<CR>

nnoremap ]]t <Esc>:tabnext<CR>
nnoremap [[t <Esc>:tabprevious<CR>

" Blocking out the evil keys
noremap! <Up> <NOP>
noremap! <Down> <NOP>
noremap! <Left> <NOP>
noremap! <Right> <NOP>
