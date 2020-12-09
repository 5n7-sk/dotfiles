runtime! plugins/dein.rc.vim
runtime! keymap.vim

syntax enable

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
