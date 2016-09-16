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
set tags=./tags,~/.vim/etc/tags
set textwidth=0
set t_ut=
set ttyfast
set vb t_vb=
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Functions                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RealignCode()
    %!astyle
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

let mapleader = '\'

inoremap <Leader> <NOP>
nnoremap <Leader> <NOP>
nnoremap <Leader>- <Esc>:center<CR>0
nnoremap <Leader>= <Esc>:call RealignCode()<CR>
nnoremap <Leader>h <Esc>:nohlsearch<CR>
nnoremap <Leader>m <Esc>:mksession!<CR>
nnoremap <Leader>n <Esc>:tabnew<CR>
nnoremap <Leader>p <Esc>:set paste!<CR>
nnoremap <Leader>q <Esc>:bdelete<CR>
nnoremap <Leader>t <Esc>:tabedit %<CR>
nnoremap <Leader>w <Esc>:set wrap!<CR>

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

nnoremap ]b <Esc>:bnext<CR>
nnoremap [b <Esc>:bprevious<CR>
nnoremap ]c <Esc>:cnext<CR>
nnoremap [c <Esc>:cprevious<CR>

nnoremap ]]t <Esc>:tabnext<CR>
nnoremap [[t <Esc>:tabprevious<CR>
