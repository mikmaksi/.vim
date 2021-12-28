"" Plugins using vim-plug

call plug#begin('~/.vim/plugged')

"" Common utilities
Plug 'junegunn/vim-plug' " Manage itself for help docs
Plug 'jpalardy/vim-slime',  { 'branch': 'main' }
"" Plug 'ap/vim-buftabline'
Plug 'tpope/vim-surround'
Plug 'will133/vim-dirdiff'
Plug 'godlygeek/tabular'
Plug 'kshenoy/vim-signature'
Plug 'elzr/vim-json'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rykka/riv.vim' " wiki style note taking

"" R
Plug 'jalvesaq/Nvim-R'
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
 
"" Python
Plug 'davidhalter/jedi-vim'
"" Plug 'GCBallesteros/jupytext.vim'
"" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

"" Rust
Plug 'racer-rust/vim-racer'

"" Appearance
Plug 'junegunn/seoul256.vim'
Plug 'jonathanfilip/vim-lucius'

call plug#end()

"" General
set number      " Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set textwidth=200   " Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)

"" Searching
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"" Indentation
set autoindent    " Auto-indent new lines
set tabstop=4     " NUmber of spaces that a \t character is worth
set softtabstop=4 " Number of spaces per Tab
set shiftwidth=4  " Number of auto-indent spaces

"" Folding
set foldmethod=indent " folding
set nowrap " wrapping

"" Advanced
set ruler	" Show row and column ruler information
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour
"" set listchars=space:_,tab:>~ list

"" Custom file type rules; never use \t
autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

"" Key-bind for airline/buftabline tab naviation
set hidden " for use with airline or buftabline
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

"" Key-bind for vim-surround
nnoremap q' bi'<ESC>ea'<ESC>
nnoremap q" bi"<ESC>ea"<ESC>

"" Key-bind for code folding
nnoremap si :set foldmethod=indent<CR>
nnoremap ss :set foldmethod=syntax<CR>

"" Airline options
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#buffer_nr_show = 1

"" Nvim-R options
let R_assign = 0
let R_path = '/home/mmaksimov/miniconda3/bin'
let R_nvimcom_home = '/home/mmaksimov/miniconda3/lib/R/library/nvimcom'

"" Color themes
colo lucius
LuciusDark
"" LuciusLightHighContrast

"" Load NERDTree file explorer on startup
autocmd vimenter * NERDTree

"" vim-slime options
let g:slime_target = "vimterminal"
let g:slime_vimterminal_cmd = "ipython"
let g:slime_vimterminal_config = {"vertical" : 1, "term_finish": "close"}
let g:slime_python_ipython = 1
let g:slime_no_mappings = 1
  
"" Key-bind for vim-slime; these do not interfere with Nvim-R
xmap <leader>ss <Plug>SlimeRegionSend
nmap <leader>ss <Plug>SlimeMotionSend
nmap <leader>l <Plug>SlimeLineSend
nmap <leader>rf <Plug>SlimeConfig

"" vim-pandoc options
let g:pandoc#toc#close_after_navigating=0
let g:pandoc#toc#position='bottom'

"" jedi-vim options
let g:jedi#popup_on_dot=0
let g:jedi#show_call_signatures=1
let g:jedi#show_call_signatures_delay=100
let g:jedi#use_splits_not_buffers="winwidth"

"" python-syntax options
let g:python_highlight_all = 1

"" snipMate options
let g:snipMate = { 'snippet_version' : 1 }

"" riv.vim options
let proj1 = { 'path': '/projects/ps-gymreklab/mikhail/genet_elem_pull_tutorial/gymreklab.github.io/doc', }
let g:riv_projects = [proj1]

"" Register file templates
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
    autocmd BufNewFile *.R,*.r 0r ~/.vim/templates/skeleton.R
    autocmd BufNewFile *.Rmd,*.rmd 0r ~/.vim/templates/skeleton.Rmd
    autocmd BufNewFile *.qsub.sh 0r ~/.vim/templates/skeleton.qsub.sh
  augroup END
endif

"" Rust
let g:racer_cmd = "/home/mmaksimov/.cargo/bin/racer"
augroup Racer
    autocmd!
    autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
    autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
    autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
    autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
    autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
    autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
augroup END

"" ignore terminal-type windows when using :bprev, :bnext
augroup termIgnore
  autocmd!
  autocmd TerminalOpen * set nobuflisted
augroup END
