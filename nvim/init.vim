set number
set autoindent
set clipboard+=unnamedplus

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable
