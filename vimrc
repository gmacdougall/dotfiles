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

call plug#end()

filetype plugin indent on

colorscheme detailed

set backupdir=~/.vim/backup
set dir=~/.vim/swap
set undodir=~/.vim/undo
set number

set shiftwidth=2
set expandtab

set viminfo=!,'100,<500,s25,h

nmap K \<noop>
vmap K \<noop>

let mapleader = "\<Space>"

function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>e :call FzyCommand("rg . -l -g ''", ":e")<cr>
nnoremap <leader>v :call FzyCommand("rg . -l -g ''", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("rg . -l -g ''", ":sp")<cr>
nnoremap <leader>f :ALEFix<cr>

let &colorcolumn=join(range(81,999),",")

let g:ale_fixers = {
\   'ruby': ['rubocop'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\}
let g:ale_linters = {
\   'typescript': ['eslint', 'prettier', 'tsserver', 'typecheck'],
\}
let g:ale_javascript_prettier_options = '--single-quote'
let g:ale_typescript_prettier_options = '--single-quote'
let g:ale_fix_on_save = 0

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
