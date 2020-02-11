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

"# Initialize plugin system
call plug#end()

"# Make sure to reload .vimrc and :PlugInstall to install plugins

" Make leaderboard last longer
set timeoutlen=2000

"Split navigations
"	Explanation: The `no` part means remap the key in normal mode as
"	opposed to visual mode. The we're saying: In normal mode when I hit
"	<C-J>, do <C-W><C-J> instead
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Python formatting
au BufNewFile, BufRead *.py
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set textwidth=79
	\ set expandtab
	\ set autoindent
	\ set fileformat=unix

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

nnoremap <SPACE> <Nop>
"let mapleader=" "
let mapleader = "\<Space>"
"let mapleader = ","
set nu

" In order to be able to see leader key activation
set showcmd

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
