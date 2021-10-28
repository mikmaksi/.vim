"" General
set number   " Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set textwidth=100   " Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
  
set autoindent    " Auto-indent new lines
set shiftwidth=4  " Number of auto-indent spaces
set smartindent   " Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4 " Number of spaces per Tab

set foldmethod=indent " folding
set nowrap " wrapping

"" Line width
set tw=200
   
"" Advanced
set ruler	" Show row and column ruler information
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

"" Buffers
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
let g:buftabline_numbers=1 " display the buffer id in the tabline

"" Searching
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"" Quoting 
nnoremap qq bi'<ESC>ea'<ESC>

"" Indenting
nnoremap si :set foldmethod=indent<CR>
nnoremap ss :set foldmethod=syntax<CR>

"" disable plugins
"" let g:plugs_disabled = ['vim-buftabline']
let g:plugs_disabled = []

"" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'jpalardy/vim-slime',  { 'branch': 'main' }
Plug 'ap/vim-buftabline'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'will133/vim-dirdiff'
Plug 'godlygeek/tabular'
Plug 'kshenoy/vim-signature'
Plug 'elzr/vim-json'
Plug 'tomtom/tlib_vim'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'

"" R
Plug 'jalvesaq/Nvim-R'
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

"" Python
Plug 'davidhalter/jedi-vim'
Plug 'vim-python/python-syntax'
Plug 'GCBallesteros/jupytext.vim'

"" Rust
Plug 'rykka/riv.vim'
Plug 'racer-rust/vim-racer'

"" appearance
Plug 'junegunn/seoul256.vim'
Plug 'jonathanfilip/vim-lucius'

call plug_disable#commit()
call plug#end()

"" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

"" pathogen.vim
"" execute pathogen#infect()

"" Rule for custom file types
autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

"" Nvim-R settings
let R_assign = 0
let R_path = '/home/mmaksimov/miniconda3/bin'
let R_nvimcom_home = '/home/mmaksimov/miniconda3/lib/R/library/nvimcom'

"" Color theme
colo lucius
LuciusDark
"" LuciusLightHighContrast

"" rimvim rst editor options
let proj1 = { 'path': '/projects/ps-gymreklab/mikhail/genet_elem_pull_tutorial/gymreklab.github.io/doc', }
let g:riv_projects = [proj1]

"" Load NERDTree file explorer
autocmd vimenter * NERDTree

"" vim-slime
let g:slime_target = "vimterminal"
let g:slime_vimterminal_cmd = "ipython"
let g:slime_vimterminal_config = {"vertical" : 1, "term_finish": "close"}
let g:slime_python_ipython = 1
"" NOTE: this doesn't interfere with Nvim-R
let g:slime_no_mappings = 1
xmap <leader>ss <Plug>SlimeRegionSend
nmap <leader>ss <Plug>SlimeMotionSend
nmap <leader>l <Plug>SlimeLineSend
nmap <leader>rf <Plug>SlimeConfig

"" vim-pandoc options
let g:pandoc#toc#close_after_navigating=0
let g:pandoc#toc#position='bottom'

"" jedi-vim
let g:jedi#popup_on_dot=0
let g:jedi#show_call_signatures=1
let g:jedi#show_call_signatures_delay=100
let g:jedi#use_splits_not_buffers="winwidth"

"" python-syntax options
let g:python_highlight_all = 1

"" snipMate options
let g:snipMate = { 'snippet_version' : 1 }

"" file templates
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

"" this is skip a terminal containing window when using :bprev, :bnext
augroup termIgnore
  autocmd!
  autocmd TerminalOpen * set nobuflisted
augroup END

"" jupytext-vim
let g:jupytext_filetype_map = {'md': 'rmd'}
