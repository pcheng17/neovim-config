" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

" Shortcuts for saving and quiting
nmap <Leader>fs :up<CR>
vmap <Leader>fs <ESC>:up<CR>
nmap <Leader>sq :up<CR>:q<CR>
vmap <Leader>sq <ESC>:up<CR>:q<CR>
nmap <Leader>qq :q<CR>
vmap <Leader>qq <ESC>:q<CR>
nmap <Leader>fq :q!<CR>
vmap <Leader>fq <ESC>:q!<CR>

" Shortcut to append this line with the next with a space
nnoremap U J

" Easy window navigation
if has('nvim')
    " Fix <C-h> in neovim
    nmap <BS> <C-w>h
    vmap <BS> <C-w>h
endif
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcut for closing buffers using bufkill
nmap <Leader>kb :BD<CR>
vmap <Leader>kb <ESC>:BD<CR>

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

" Save
imap <C-s> <C-o>:up<CR>
nmap <C-s> :up<CR>
vmap <C-s> <ESC>:up<CR>

" Copy to clipboard
nnoremap <Leader>yy "+yy
nnoremap <Leader>y$ "+y$
vnoremap <Leader>y "+y

" Paste from clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" Turn off highlighting
noremap <Leader>noh :noh<CR>

" Nerd tree
noremap <Leader>nt :NERDTreeToggle<CR>

" Menu navigation enhancement (for completeopt)
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-p> pumvisible() ? '<C-p>' :
  \ '<C-p><C-r>=pumvisible() ? "\<lt>Up>" : ""<CR>'

" Iterative word replace via .
nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

" Repeat last macro used
nnoremap Q @@

" Execute the current line as if it's a command
nnoremap <Leader>e :exe getline(line('.'))<CR>
