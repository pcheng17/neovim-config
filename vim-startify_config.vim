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

if !isMac
    let g:startify_bookmarks = [
          \ { 'aa': '/usr/pic1/workspaces/flux/src' },
          \ { 'bb': '/usr/pic1/workspaces/whip' },
          \ { 'cc': '/usr/pic1/workspaces/whip/cfx_whip' },
          \ { 'dd': '/usr/pic1/workspaces/whip/cfx_whip_houdini' },
          \ { 'ee': '/usr/pic1/workspaces/mpm' },
          \ ]
end

let g:startify_custom_header_quotes =
    \ startify#fortune#predefined_quotes() +
    \ [
    \ ["No code, no time, no problems.", '', '- Andre Pradhana'],
    \ ["When I grow up, I want to be like Baptiste.", '', '- Andre Pradhana'],
    \ ["Don't do drugs, don't die, party on.", '', '- Andre Pradhana'],
    \ ["I've been known to be a party animal.", '', '- Andre Pradhana'],
    \ ]

