" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

" Shortcut for re-sourcing init.vim
nmap <Leader>rld :source ~/.vimrc<CR>

" Shortcuts for saving and quiting
nmap <Leader>fs :w<CR> 
vmap <Leader>fs <ESC>:w<CR>
nmap <Leader>sq :wq<CR>
vmap <Leader>sq <ESC>:wq<CR>
nmap <Leader>qq :q<CR>
vmap <Leader>qq <ESC>:q<CR>
nmap <Leader>fq :q!<CR>
vmap <Leader>fq <ESC>:q!<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcut for closing buffers using bufkill
" nmap <Leader>bd :BD<CR>
" vmap <Leader>bd <ESC>:BD<CR>
nmap <Leader>kb :BD<CR>
vmap <Leader>kb <ESC>:BD<CR>

" Shortcut for fuzzy finder
nmap <Leader>; :Files<CR>
nmap ; :Buffers<CR>

" Shortcuts for vertical/horizontal split
nmap <Leader>vs :vsplit
nmap <Leader>hs :split

" Fast navigation
nnoremap H 10h
nnoremap J 10j
nnoremap K 10k
nnoremap L 10l
vnoremap H 10h
vnoremap J 10j
vnoremap K 10k
vnoremap L 10l

" Save"
imap <C-s> <ESC>:w<CR>
nmap <C-s> :w<CR>
vmap <C-s> <ESC>:w<CR>

" grep
" nmap <Leader>gr :Grepper<CR>
" vmap <Leader>gr :Grepper<CR>

" Turn off highlighting
nmap <Leader>noh :noh<CR>
