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
match ErrorMsg '[^\u0000-\u007F]'                                       "Highlight non-ASCII characters

filetype plugin indent on

let &colorcolumn=join(map(copy(range(1,999)), "'+'.v:val"), ",")        "Highlight columns over value of &textwidth

autocmd Filetype go setlocal noexpandtab shiftwidth=8 softtabstop=8     "Use hard tabs for Go
autocmd FileType rst,gitcommit,markdown,slide setlocal spell            "Spellcheck
autocmd BufNewFile,BufRead *.vcl,*.vtc :set filetype=vcl                "VCL syntax highlighting
autocmd BufNewFile,BufRead *.pp set filetype=puppet
autocmd BufNewFile,BufRead *.md set filetype=markdown                   "Markdown, not modular2 for .md files
autocmd BufNewFile,BufRead *.slide set filetype=slide                   "Go present slide format
autocmd Syntax slide source ~/.vim/syntax/*.vim

"Vundle config
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

"Let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

Plugin 'ConradIrwin/vim-bracketed-paste.git'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'fatih/vim-go'
Plugin 'garbas/vim-snipmate'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/goyo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'smerrill/vcl-vim-plugin.git'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-rails.git'
Plugin 'rodjek/vim-puppet.git'
Plugin 'scrooloose/syntastic'

"Golang settings for vim-go plugin
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

"Tagbar config
"autocmd FileType * nested :call tagbar#autoopen(0)                      "Always open Tagbar for supported files
let g:tagbar_show_linenumbers = 1                                       "Show absolute line numbers

"Airline status config
set laststatus=2                                                        "Always show status bar
set noshowmode                                                          "Don't show default mode indicator, Airline does that
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_theme             = 'solarized'
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep          = ''
let g:airline_right_sep         = ''

"CtrlP
let g:ctrlp_working_path_mode = 'ra'                                    "Set current working directory to be repository root if possible
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"Enable Solarized colour scheme: https://github.com/altercation/vim-colors-solarized
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
