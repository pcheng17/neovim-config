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
          \ { 'bb': '/usr/pic1/workspaces/whip/cfx_whip_release_7.1.5' },
          \ { 'cc': '/usr/pic1/workspaces/whip/cfx_whip_houdini_7.1.5' },
          \ ]
end
