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
"Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic'
Plug 'ctrlpvim/ctrlp.vim'

"# Initialize plugin system
call plug#end()

"# Make sure to reload .vimrc and :PlugInstall to install plugins

" NERDTree config
map <C-b> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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
