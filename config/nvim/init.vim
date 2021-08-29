set nocompatible
filetype off

call plug#begin()

Plug 'HerringtonDarkholme/yats.vim'
Plug 'MarcWeber/vim-addon-local-vimrc'
Plug 'Raimondi/delimitMate'
Plug 'VundleVim/Vundle.vim'
Plug 'bling/vim-airline'
Plug 'bronson/vim-trailing-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx'
Plug 'nikvdp/ejs-syntax'
Plug 'pangloss/vim-javascript'
Plug 'peitalin/vim-jsx-typescript'
Plug 'prettier/vim-prettier'
Plug 'rking/ag.vim'
Plug 'rking/vim-detailed'
Plug 'rust-lang/rust.vim'
Plug 'spolu/dwm.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'
Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

filetype plugin indent on

colorscheme detailed

set number

set shiftwidth=2
set expandtab

set viminfo=!,'100,<500,s25,h

nmap K \<noop>
vmap K \<noop>

let mapleader = "\<Space>"

nnoremap <leader>e :GFiles<cr>
nnoremap <leader>f :ALEFix<cr>

let &colorcolumn=join(range(81,999),",")

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'typescript': ['tslint', 'prettier'],
\}
let g:ale_linters = {
\   'typescript': ['tslint', 'prettier', 'tsserver', 'typecheck'],
\}
let g:ale_fix_on_save = 0

lua << EOF
-- require'lspconfig'.denols.setup{}
EOF
