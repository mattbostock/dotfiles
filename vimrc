autocmd FileType php setlocal shiftwidth=4 | setlocal softtabstop=4     "Use 4 spaces for PHP as per PSR standards

set hlsearch                                                            "Highlight all search matches
set incsearch                                                           "Start highlighting search matches as you type

set cursorline                                                          "Highlight current line
set ruler                                                               "Show ruler
set number                                                              "Show current line number

" Faster redraws
" (cursorline, syntax highlighting can be slow)
set lazyredraw
set ttyfast

syntax on                                                               "Enable syntax highlighting
filetype on                                                             "Detect file type
match ErrorMsg '\s\+$'                                                  "Highlight trailing whitespace

filetype plugin indent on

let &colorcolumn=join(map(copy(range(1,999)), "'+'.v:val"), ",")        "Highlight columns over value of &textwidth

autocmd FileType rst,gitcommit,markdown setlocal spell                  "Spellcheck
autocmd BufNewFile,BufRead *.vcl,*.vtc :set ft=vcl                      "VCL syntax highlighting
autocmd BufNewFile,BufRead *.json set filetype=javascript               "JSON syntax highlighting
autocmd BufNewFile,BufRead *.md set filetype=markdown                   "Markdown, not modular2 for .md files

"Vundle config
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"Let Vundle manage Vundle
Plugin 'gmarik/vundle'

Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-rails.git'
Plugin 'smerrill/vcl-vim-plugin.git'
"Plugin 'scrooloose/syntastic'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive.git'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/goyo.vim'
Plugin 'ConradIrwin/vim-bracketed-paste.git'

"Golang settings for vim-go plugin
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

"Tagbar config
autocmd FileType * nested :call tagbar#autoopen(0)                      "Always open Tagbar for supported files
let g:tagbar_show_linenumbers = 1                                       "Show absolute line numbers

"Airline status config
set laststatus=2                                                        "Always show status bar
set noshowmode                                                          "Don't show default mode indicator, Airline does that
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_theme             = 'solarized'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_powerline_fonts   = 1

"CtrlP
let g:ctrlp_working_path_mode = 'ra'                                    "Set current working directory to be repository root if possible
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"Enable Solarized colour scheme: https://github.com/altercation/vim-colors-solarized
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
