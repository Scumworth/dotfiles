set nocompatible              " be iMproved, required
filetype off                  " required
set modelines=0

"" Place Plugins Below
"" Non Plugins Below

set encoding=utf-8
set showcmd     " display incomplete commands
filetype plugin indent on   " load file type plugins + indentation
set autoindent					" auto-indent

"" Whitespace
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

"Set tab length
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

set ruler						" Always show info along bottom	
set number						" show line numbers
set undofile 					" creates undo file so changes persist 

syntax enable
set t_Co=256					"enable 256-color mode.
set background=dark
colorscheme gruvbox 

" launches NERDTree automatically
" autocmd VimEnter * NERDTree
" with cursor in main window
" autocmd VimEnter * wincmd p

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Auto resize splits when window size changed
:autocmd VimResized * wincmd =

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"avoids shifting into colon in normal mode=
nnoremap ; : 

" enable jsx highlighting and indenting for files with .js extension
let g:jsx_ext_required = 0

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Remap leader key
let mapleader = ","

" Fixed Directory for backup, undo, and swp
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

map <C-n> :NERDTreeToggle<CR>

"cursor highlighting
:set cursorline
:nnoremap <Leader>c :set cursorline!<CR>

" Sets Hybrid Line Numbers
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" CTRLP Fuzzy Finder
set runtimepath^=~/.vim/pack/git-plugins/start/ctrlp.vim

" Ale Linters 
let g:ale_linters = {'python': ['flake8', 'mypy', 'pylint', 'pyls']}

" Vim Markdown Shortcuts
" zr: reduces fold level throughout the buffer
" zR: opens all folds
" zm: increases fold level throughout the buffer
" zM: folds everything all the way
" za: open a fold your cursor is on
" zA: open a fold your cursor is on recursively
" zc: close a fold your cursor is on
" zC: close a fold your cursor is on recursively

" Instant Vim Markdown
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0
" launch preview with :InstantMarkdownPreview
" close preview with :InstantMarkdownStop
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

