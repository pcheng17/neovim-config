" ----------------------------------------------------------------------------
" vim-startify config
" ----------------------------------------------------------------------------

let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 0

let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ ]

let g:startify_custom_header_quotes =
    \ startify#fortune#predefined_quotes() +
    \ [
    \ ["No code, no time, no problems.", '', '- Andre Pradhana'],
    \ ["When I grow up, I want to be like Baptiste.", '', '- Andre Pradhana'],
    \ ["Don't do drugs, don't die, party on.", '', '- Andre Pradhana'],
    \ ["I've been known to be a party animal.", '', '- Andre Pradhana'],
    \ ]

