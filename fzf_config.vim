" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }

" Fuzzy finder that first checks if we're in a git repo.
" If so, only git-controlled files will be listed.
" nnoremap <expr> <Leader>; (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<CR>"
" Fuzzy finder on all files in the working directory.
nnoremap <Leader><space> :Files<CR>
" Fuzzy finder on all files in the buffer.
nnoremap <Leader>; :Buffers<CR>
