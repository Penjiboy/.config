" cs add /home/penjani/code/ubc/courses/cpen-331/os161/src/kern/cscope.out /home/penjani/code/ubc/courses/cpen-331/os161/src/kern

call plug#begin('~/.vim/plugged')

"# Multiple ways of adding plugins:
"## Plug 'junegunn/vim-easyt-align'
"## Plug 'https://github.com/junegunn/vin-github-dashboard.git'
"## Plug '~/my-prototype-plugin'

Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'valloric/youcompleteme'
Plug 'elzr/vim-json'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'yegappan/mru'
" Might need to remove ale or ycm if they conflict
Plug 'dense-analysis/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'qpkorr/vim-bufkill'
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-easytags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-dispatch'
Plug 'udalov/kotlin-vim'
Plug 'artur-shaik/vim-javacomplete2'
Plug 'airblade/vim-rooter'
Plug 'rust-lang/rust.vim'

"# Initialize plugin system
call plug#end()

"# Make sure to reload .vimrc and :PlugInstall to install plugins

syntax enable
filetype plugin indent on

" Enable Rust auto formating
let g:rustfmt_autosave = 1

" Make leaderboard last longer
set timeoutlen=2000

" Enable mouse
set mouse=a

" Bracket completion
"inoremap { {<CR>}<Esc>ko
inoremap {<CR> {<CR>}<Esc>ko
inoremap ( ()<Esc>i

" Vim Rooter config
let g:rooter_resolve_links = 1

" Toggle TagBar
nnoremap t :TagbarToggle<CR>

" Easy tags config
"let g:easytags_async = 1
"let g:easytags_file = '~/.vim/tags'

"Split navigations
"	Explanation: The `no` part means remap the key in normal mode as
"	opposed to visual mode. The we're saying: In normal mode when I hit
"	<C-J>, do <C-W><C-J> instead
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Horizontal scrolling.. need to figure out how we want to do this

" Python formatting
au BufNewFile, BufRead *.py
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set textwidth=79
	\ set expandtab
	\ set autoindent
	\ set fileformat=unix

"" C formatting
"au BufNewFile, BufRead *.c, *.h, *.cpp
	"\ set tabstop=4
	"\ set softtabstop=4
	"\ set shiftwidth=4
	"\ set textwidth=79
	"\ set expandtab
	"\ set autoindent
	"\ set fileformat=unix

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

" Java completer config
autocmd FileType java setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_EnableDefaultMappings = 0

" Bufkill config
map <C-c> :BD<cr>

"" vim-session config
"let g:session_autosave = 'no'

" Multi-cursor config
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
"let g:multi_cursor_select_all_word_key = '<A-n>'
"let g:multi_cursor_start_key           = 'g<C-n>'
"let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" lightline.vim config
set laststatus=2

" NERDTree config
map <C-b> :NERDTreeToggle<CR>
"map <leader>nf :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" MRU config
"map <leader>f :MRU<CR>
map <C-m> :MRU<CR>
nnoremap <CR> <Nop>

" You complete me config
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" TODO: Fix this!
"map <leader>gd :YcmCompleter GetDoc
nnoremap <C-q> :YcmCompleter GetDoc<CR>

"nnoremap <SPACE> <Nop>
"let mapleader=" "
let mapleader = "\<Space>"
"let mapleader = ","
set nu

" In order to be able to see leader key activation
set showcmd

" Text wrapping
set nowrap

" Instant Markdown Plugin config
filetype plugin on
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1
