" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

" Shortcuts for saving and quiting
map <Leader>fs :up<CR>
map <Leader>qq :q<CR>
map <Leader>fq :q!<CR>

" Shortcut to append this line with the next with a space
nnoremap U J

" Split mappings
map <bar> :vsplit<CR>
map _ :split<CR>
map <Leader>h :wincmd h<CR>
map <Leader>j :wincmd j<CR>
map <Leader>k :wincmd k<CR>
map <Leader>l :wincmd l<CR>
nnoremap <silent> ++ :vertical resize +5<CR>
nnoremap <silent> -- :vertical resize -5<CR>

" Easier indentation
vnoremap < <gv
vnoremap > >gv

" Easy new lines
nnoremap <silent> <M-o> :call append(line('.'), '')<CR>
nnoremap <silent> <M-O> :call append(line('.')-1, '')<CR>

" Clear highlights
nnoremap <silent> <ESC> :noh<CR>

" Fast navigation
noremap J 10j
noremap K 10k

" Copy to clipboard
nnoremap <Leader>yy "+yy
nnoremap <Leader>y$ "+y$
vnoremap <Leader>y "+y

" Paste from clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

" Nerd tree
nnoremap <Leader>fd :NERDTreeToggle<CR>
nnoremap <Leader>ff :NERDTreeFind<CR>

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
