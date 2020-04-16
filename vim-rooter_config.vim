" ----------------------------------------------------------------------------
" vim-rooter config
" ----------------------------------------------------------------------------

" :Rooter sets the working directory to the git root of the current file

let g:rooter_patterns = ['.git/']
let g:rooter_manual_only = 1
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1
