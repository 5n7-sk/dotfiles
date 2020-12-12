let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

inoremap jj <ESC>

nnoremap <Leader-j> }
nnoremap <Leader-k> {

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" split window
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>

" tab
nnoremap <C-t>n :tabnew<CR>
nnoremap <C-t>h :tabprevious<CR>
nnoremap <C-t>l :tabnext<CR>

" clear highlights
nnoremap <Esc> :<C-u>nohlsearch<CR><Esc>
" highlight same words
nnoremap <Space><Space> :let @/ = '\<' . expand('<cword>') . '\>'<CR>: set hlsearch<CR>
" enter replace mode using the word under the cursor
nnoremap # <Space><Space> :%s/<C-r>///g<Left><Left>

nnoremap <leader>q :q!<CR>
nnoremap <Leader>w :wa<CR>
