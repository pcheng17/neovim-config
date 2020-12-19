" ----------------------------------------------------------------------------
" Mappings
" ----------------------------------------------------------------------------

" Shortcuts for saving and quiting
nnoremap <Leader>fs :up<CR>
vnoremap <Leader>fs <ESC>:up<CR>
nnoremap <Leader>sq :up<CR>:q<CR>
vnoremap <Leader>sq <ESC>:up<CR>:q<CR>
nnoremap <Leader>qq :q<CR>
vnoremap <Leader>qq <ESC>:q<CR>
nnoremap <Leader>fq :q!<CR>
vnoremap <Leader>fq <ESC>:q!<CR>

" Shortcut to append this line with the next with a space
nnoremap U J

" Easy window navigation
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>

" Shortcuts for vertical/horizontal split
nnoremap <bar> :vsplit<CR>
nnoremap _ :split<CR>

" Easier indentation
vnoremap < <gv
vnoremap > >gv

" Easy new lines
nnoremap <silent> <M-o> :call append(line('.'), '')<CR>
nnoremap <silent> <M-O> :call append(line('.')-1, '')<CR>

" Clear highlights
nnoremap <silent> <ESC> :noh<CR>

" Fast navigation
nnoremap J 10j
nnoremap K 10k
vnoremap J 10j
vnoremap K 10k

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
