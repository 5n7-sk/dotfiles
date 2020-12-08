set autochdir
set autoindent
set clipboard+=unnamedplus
set cursorline
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set nobackup
set noswapfile
set number
set shiftwidth=4
set showcmd
set showmatch matchtime=1
set smartcase
set smartindent
set smarttab
set tabstop=4
set title
set virtualedit=onemore
set visualbell
set whichwrap=b,s,h,l,<,>,[,],~
set wildmenu
set wrapscan

" remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//ge

inoremap jj <ESC>

nnoremap <C-j> }
nnoremap <C-k> {
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>

" clear highlights
nnoremap <Esc> :<C-u>nohlsearch<CR><Esc>
" highlight same words
nnoremap <Space><Space> :let @/ = '\<' . expand('<cword>') . '\>'<CR>: set hlsearch<CR>
" enter replace mode using the word under the cursor
nnoremap # <Space><Space> :%s/<C-r>///g<Left><Left>

" move line(s)
nnoremap <M-j> "zdd"zp
nnoremap <M-k> "zdd<Up>"zP
vnoremap <M-j> "zx"zp`[V`]
vnoremap <M-k> "zx<Up>"zP`[V`]

let mapleader = "\<Space>"
nnoremap <leader>q :q!<CR>
nnoremap <Leader>w :wa<CR>

" plugins
let s:nvim_root = expand('~/.config/nvim')
let g:plug_root = s:nvim_root . '/plugins'
let s:dein_toml = g:plug_root . '/config/dein.toml'
let s:dein_lazy_toml = g:plug_root . '/config/dein_lazy.toml'

let s:dein_root = expand('~/.cache/dein')
let s:dein_repo = s:dein_root . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo, ':p')
endif

if dein#load_state(s:dein_root)
  call dein#begin(s:dein_root)

  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" install plugins
if dein#check_install()
  call dein#install()
endif

" remove unused plugins
let s:unused_plugins = dein#check_clean()
if len(s:unused_plugins) > 0
  call map(s:unused_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

