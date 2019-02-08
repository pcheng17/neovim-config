" ----------------------------------------------------------------------------
" Shortucuts
" ----------------------------------------------------------------------------

" Shortcut for re-sourcing init.vim
map <Leader>rld :source ~/neovim-config/init.vim<CR>

" Shortcuts for saving and quiting
map <Leader>fs :w<CR> 
map <Leader>sq :wq<CR>
map <Leader>qq :q<CR>
map <Leader>fq :q!<CR>

" Shortcut for fuzzy finder
map <Leader>fzf :Files<CR>

" Shortcuts for vertical/horizontal split
map <Leader>vs :vsplit<CR>
map <Leader>hs :split<CR>

" Shortcuts to move windows 
map <Leader>;w <C-w>k
map <Leader>;a <C-w>h
map <Leader>;s <C-w>j
map <Leader>;d <C-w>l
