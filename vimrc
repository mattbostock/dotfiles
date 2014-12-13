set shiftround                                                          "Indent by multiples of shiftwidth
set expandtab                                                           "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=2                                                        "Indent by 2 spaces when using >>, <<, == etc.
set softtabstop=2                                                       "Indent by 2 spaces when pressing <TAB>
set autoindent                                                          "Keep indentation from previous line

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

"Golang, as per the README in $GOROOT/misc/vim
filetype off
filetype plugin indent off
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
autocmd FileType go setlocal noexpandtab | setlocal softtabstop=8 | setlocal shiftwidth=8
autocmd FileType go autocmd BufWritePre <buffer> Fmt
let g:gofmt_command = "goimports"

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
