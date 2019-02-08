" ----------------------------------------------------------------------------
" Load plugins
" ----------------------------------------------------------------------------
source ~/neovim-config/plugins.vim



" ----------------------------------------------------------------------------
" Leader
" ----------------------------------------------------------------------------
let mapleader="\<SPACE>"
nnoremap <Space> <nop>



" ----------------------------------------------------------------------------
" Basic settings 
" ----------------------------------------------------------------------------
if (has("termguicolors"))
    set termguicolors
end

" Initialize theme 
let ayucolor="dark"
colorscheme ayu

" Turn on relative line numbers
set relativenumber

" Set tab indent to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Turn off highlighted search
set nohlsearch



" ----------------------------------------------------------------------------
" Load other specific settings
" ----------------------------------------------------------------------------
source ~/neovim-config/shortcuts.vim
