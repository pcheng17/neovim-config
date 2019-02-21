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
" Only set termguicolors if not on Mac (colors look terrible)
if !has('macunix')
	if (has("termguicolors"))
    	set termguicolors
	end
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

" More natural window-splitting behavior
set splitright
set splitbelow

" Allow mouse usage
set mouse=a

" Yank to clipboard
set clipboard+=unnamedplus



" ----------------------------------------------------------------------------
" Load other specific settings
" ----------------------------------------------------------------------------
source ~/neovim-config/a.vim
source ~/neovim-config/mappings.vim
source ~/neovim-config/tex.vim
