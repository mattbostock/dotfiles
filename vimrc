"Enable Solarized colour scheme: https://github.com/altercation/vim-colors-solarized
set background=dark
colorscheme solarized

set shiftround                                              "Indent by multiples of shiftwidth
set expandtab                                               "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=2                                            "Indent by 2 spaces when using >>, <<, == etc.
set softtabstop=2                                           "Indent by 2 spaces when pressing <TAB>

set autoindent                                              "Keep indentation from previous line
set smartindent                                             "Automatically inserts indentation in some cases
set cindent                                                 "Like smartindent, but stricter and more customisable

set hlsearch                                                "Highlight all search matches
set incsearch                                               "Start highlighting search matches as you type

set cursorline                                              "Highlight current line
set ruler                                                   "Show ruler
set number                                                  "Show line numbers

syntax on                                                   "Enable syntax highlighting
filetype on                                                 "Detect file type
match ErrorMsg '\s\+$'                                      "Highlight trailing whitespace

autocmd FileType gitcommit setlocal spell                   "Spellcheck commit messages

autocmd FileType rst setlocal linebreak                     "Soft-wrap Sphinx documentation

filetype plugin indent on

let &colorcolumn=join(range(73,999),",")                    "Highlight anything over 72 columns

au BufRead,BufNewFile *.vcl :set ft=vcl                     "VCL syntax highlighting
au! Syntax vcl source ~/.vim/syntax/vcl.vim

"Disable arrow keys and page up/down keys
nnoremap <buffer> <Left> <Esc>:echoerr "Use h"<CR>
nnoremap <buffer> <Right> <Esc>:echoerr "Use l"<CR>
nnoremap <buffer> <Up> <Esc>:echoerr "Use k"<CR>
nnoremap <buffer> <Down> <Esc>:echoerr "Use j"<CR>
nnoremap <buffer> <PageUp> <Esc>:echoerr "Use ^F"<CR>
nnoremap <buffer> <PageDown> <Esc>:echoerr "Use ^B"<CR>

inoremap <buffer> <Left> <Esc>:echoerr "Use h"<CR>
inoremap <buffer> <Right> <Esc>:echoerr "Use l"<CR>
inoremap <buffer> <Up> <Esc>:echoerr "Use k"<CR>
inoremap <buffer> <Down> <Esc>:echoerr "Use j"<CR>
inoremap <buffer> <PageUp> <Esc>:echoerr "Use ^B"<CR>
inoremap <buffer> <PageDown> <Esc>:echoerr "Use ^F"<CR>

vnoremap <buffer> <Left> <Esc>:echoerr "Use h"<CR>
vnoremap <buffer> <Right> <Esc>:echoerr "Use l"<CR>
vnoremap <buffer> <Up> <Esc>:echoerr "Use k"<CR>
vnoremap <buffer> <Down> <Esc>:echoerr "Use j"<CR>
vnoremap <buffer> <PageUp> <Esc>:echoerr "Use ^B"<CR>
vnoremap <buffer> <PageDown> <Esc>:echoerr "Use ^F"<CR>

"Vundle config
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-rails.git'
"Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

"Airline status config
set laststatus=2                                            "Always show status bar
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1
let g:airline_theme             = 'solarized'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_powerline_fonts   = 1

"CtrlP
let g:ctrlp_working_path_mode = 'ra'                        "Set current working directory to be repository root if possible
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
