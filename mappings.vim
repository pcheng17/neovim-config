" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

" Shortcut for re-sourcing init.vim
nmap <Leader>rld :source ~/neovim-config/init.vim<CR>

" Shortcuts for saving and quiting
nmap <Leader>fs :w<CR> 
nmap <Leader>sq :wq<CR>
nmap <Leader>qq :q<CR>
nmap <Leader>fq :q!<CR>

" Shortcut for fuzzy finder
nmap <Leader>fzf :Files<CR>

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

" Easy window navigation
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l
