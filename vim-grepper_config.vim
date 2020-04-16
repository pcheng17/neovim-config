" ----------------------------------------------------------------------------
" vim-grepper config
" ----------------------------------------------------------------------------

" Shortcuts
nnoremap <Leader>gr :Grepper -tool git<CR>
nnoremap <Leader>wgr :Grepper -tool git -cword -noprompt<CR>

" Search for todo and fixme
command! TODO :Grepper -tool git -noprompt -query '\(TODO\|FIXME\)'
