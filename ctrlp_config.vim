" ----------------------------------------------------------------------------
" CtrlP config
" ----------------------------------------------------------------------------

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 1

" Seems like I don't need ag because it's already fast enough
" if executable('/rel/third_party/the_silver_searcher/2.2.0/bin/ag')
"     let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" endif

nmap <Leader>; :CtrlP<CR>
nmap ; :CtrlPBuffer<CR>
