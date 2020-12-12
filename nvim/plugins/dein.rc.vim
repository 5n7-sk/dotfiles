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
