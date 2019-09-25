" ----------------------------------------------------------------------------
" vim-startify config 
" ----------------------------------------------------------------------------

let g:startify_change_to_vcs_root = 1

let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ ]

if !isMac
    let g:startify_bookmarks = [ 
          \ '/usr/pic1/workspaces/flux/src',
          \ '/usr/pic1/workspaces/whip/cfx_whip_release_7.1.5',
          \ '/usr/pic1/workspaces/whip/cfx_whip_houdini_7.1.5',
          \ ]
end
