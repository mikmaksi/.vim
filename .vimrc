" modelines
" vim:fdm=marker

" Plugins {{{

call plug#begin('~/.vim/plugged')

" Common utilities
Plug 'junegunn/vim-plug' " Manage itself for help docs
Plug 'jpalardy/vim-slime',  { 'branch': 'main' }
" Plug 'ap/vim-buftabline'
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
" Plug 'cjrh/vim-conda'
Plug 'AndrewRadev/linediff.vim'
Plug 'shinglyu/vim-codespell'
Plug 'rizzatti/dash.vim'
" Plug 'jceb/vim-orgmode'
" Plug 'github/copilot.vim', {'branch': 'release'}

" Searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

" Debugging
" Plug 'puremourning/vimspector'

" R
Plug 'jalvesaq/Nvim-R'
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
 
" Python
Plug 'davidhalter/jedi-vim'
Plug 'vim-python/python-syntax'
" Plug 'mdomke/python-syntax'
Plug 'fs111/pydoc.vim'
Plug 'hanschen/vim-ipython-cell'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
" Plug 'untitled-ai/jupyter_ascending.vim'
" Plug 'goerz/jupytext.vim' # jupyter_ascending.vim does a better job syncing
" Plug 'GCBallesteros/jupytext.vim'
" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Plug 'ycm-core/YouCompleteMe'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'fisadev/vim-isort'

" Rust
" Plug 'racer-rust/vim-racer'

" Terraform
Plug 'hashivim/vim-terraform'

" Color schemes
Plug 'junegunn/seoul256.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'morhetz/gruvbox'
Plug 'nordtheme/vim', {'branch': 'main'} 

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Tags
Plug 'preservim/tagbar'

call plug#end()

" Plugins }}}

" General {{{

set number         " Show line numbers
set linebreak	   " Break lines at word (requires Wrap lines)
set showbreak=+++  " Wrap-broken line prefix
set textwidth=200  " Line wrap (number of cols)
set showmatch	   " Highlight matching brace
set visualbell	   " Use visual bell (no beeping)

set autoindent    " Auto-indent new lines
set tabstop=4     " Number of spaces that a \t character is worth
set softtabstop=4 " Number of spaces per Tab
set shiftwidth=4  " Number of auto-indent spaces

set cursorcolumn
set cursorline

set foldmethod=indent
set nowrap

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally

set ruler	        " Show row and column ruler information
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

" }}}

" Mappings {{{

" avoiding Esc key
inoremap ;; <Esc>
vnoremap ;; <Esc>

" remap scrolling down
nnoremap <C-s> <C-e>

" search for visually highlighted word
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" vim-surround
nnoremap q' bi'<ESC>ea'<ESC>
nnoremap q" bi"<ESC>ea"<ESC>

" code folding
nnoremap si :set foldmethod=indent<CR>
nnoremap ss :set foldmethod=syntax<CR>

" Home and End keys
nmap <C-A> <Home>
imap <C-A> <Home>
vmap <C-A> <Home>
nmap <C-E> <End>
imap <C-E> <End>
vmap <C-E> <End>

" autocompletion
" enable C-Space to autocomplete, omnicomplete
inoremap <C-Space> <C-x><C-o>
inoremap <buffer> <Nul> <C-Space>
snoremap <buffer> <Nul> <C-Space>

" }}}

" Custom file type rules {{{

autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType rmd setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
autocmd FileType r setlocal tabstop=4 expandtab shiftwidth=2 softtabstop=2
autocmd FileType sql setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType plm setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

" }}}

" colors {{{

" Lucius
" LuciusDark
" LuciusDarkLowContrast
" LuciusLightHighContrast

" Gruvbox
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="medium"
colo gruvbox
set bg=dark

" Nord
" colorscheme nord

" }}}

" ignore terminal-type windows when using :bprev, :bnext {{{

augroup termIgnore
  autocmd!
  autocmd TerminalOpen * set nobuflisted
augroup END

" }}}

" file templates {{{

if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
    autocmd BufNewFile *.r 0r ~/.vim/templates/skeleton.R
    autocmd BufNewFile *.rmd 0r ~/.vim/templates/skeleton.Rmd
    autocmd BufNewFile *.qsub.sh 0r ~/.vim/templates/skeleton.qsub.sh
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
    autocmd BufNewFile *.argo.yaml 0r ~/.vim/templates/skeleton.argo.yaml
  augroup END
endif

" }}}

" syntax {{{

au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake
au BufNewFile,BufRead *.cls set syntax=tex

" }}}

" Airline {{{

set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#buffer_nr_show = 1

" }}}

" R {{{

" Nvim-R
let R_assign = 0
" below are not necessary on OSX, but keeping them in
" let R_path = '/home/mmaksimov/miniconda3/bin'
" let R_nvimcom_home = '/home/mmaksimov/miniconda3/lib/R/library/nvimcom'

" R language server
" note: this didn't work out of the box but worth a try
" let g:LanguageClient_serverCommands = {
"     \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
"     \ }

" need to set this variable, otherwise syntax hl can disappear after <C-L>
" share/vim/vim91/syntax/r.vim
let r_syntax_minlines=10000

" }}}

" ftdetect {{{
" TODO: move this to ftdetect?

augroup rmarkdown
	autocmd BufNewFile,BufRead *.Rmd set ft=rmd
	autocmd BufNewFile,BufRead *.rmd set ft=rmd
augroup END

" open windows .INP files as plm
augroup INP
	autocmd BufNewFile,BufRead *.INP set ft=plm
augroup END

" open windows .jsl files as sas
augroup INP
	autocmd BufNewFile,BufRead *.jsl set ft=sas
augroup END

" }}}

" NERDTree {{{

" load file explorer on startup
autocmd vimenter * NERDTree

" }}}

" vim-slime {{{

let g:slime_target = "vimterminal"
let g:slime_vimterminal_cmd = "ipython"
let g:slime_vimterminal_config = {"vertical" : 1, "term_finish": "close"}
let g:slime_python_ipython = 1
let g:slime_no_mappings = 1

" mappings; these do not interfere with Nvim-R
nnoremap <leader>rf <Plug>SlimeConfig
" nnoremap <Leader>rf :SlimeSend1 ipython --matplotlib<CR>
nnoremap <Leader>l <Plug>SlimeLineSend
xnoremap <Leader>ss <Plug>SlimeRegionSend
nnoremap <Leader>q :SlimeSend1 exit<CR>
" nnoremap <Leader>d :SlimeSend1 %debug<CR>

" send between two marks 
" not needed if using vim-ipython-cell
" nnoremap <leader>bb ['V]'<Plug>SlimeRegionSend

" }}}

" vim-ipython-cell {{{

let g:ipython_cell_tag = ['# %%'] " to avoid ambiguity with ## which is part of the default
"" let g:ipython_cell_delimit_cells_by='marks' " this can be switched to tags
let g:ipython_cell_delimit_cells_by='tags' " this can be switched to tags

" for R specifically
" note: disable this because it interfers with python
" let g:ipython_cell_cell_command = 'eval(parse(text=clipr::read_clip()))'

" run script
nnoremap <Leader>a :IPythonCellRun<CR>

" run script and time the execution
nnoremap <Leader>A :IPythonCellRunTime<CR>

" execute the current cell
nnoremap <Leader>cc :IPythonCellExecuteCell<CR>

" execute the current cell and jump to the next cell
nnoremap <Leader>CC :IPythonCellExecuteCellJump<CR>

" clear IPython screen
nnoremap <Leader>h :IPythonCellClear<CR>

" close all Matplotlib figure windows
" nnoremap <Leader>x :IPythonCellClose<CR>

" jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" restart ipython
nnoremap <Leader>Q :IPythonCellRestart<CR>

" }}}

" vim-pandoc options {{{

let g:pandoc#toc#close_after_navigating=0
let g:pandoc#toc#position='bottom'

" }}}

" jedi-vim options {{{

let g:jedi#popup_on_dot=0
let g:jedi#show_call_signatures=1
let g:jedi#show_call_signatures_delay=100
let g:jedi#use_splits_not_buffers="winwidth"

" }}}

" python-syntax options {{{

let g:python_highlight_all = 1

" }}}

" snipMate options {{{
"
let g:snipMate = { 'snippet_version' : 1 }

" }}}

" vim-conda options {{{

" let g:conda_startup_wrn_suppress = 1
" let g:conda_startup_msg_suppress = 1

" }}}

" vimspector {{{

let g:vimspector_enable_mappings = 'HUMAN'

" }}}

" tagbar {{{

nnoremap <silent> <F8> :TagbarToggle<CR>

" tagbar for R configuration
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

" tagbar for Rmd configuration
" https://gist.github.com/MaximeWack/cdbdcd373d68d1fe5b3aca22e3dcfe46
let g:tagbar_type_rmd = {
          \   'ctagstype':'rmd'
          \ , 'kinds':['h:header', 'c:chunk', 'f:function', 'v:variable']
          \ , 'sro':'&&&'
          \ , 'kind2scope':{'h':'header', 'c':'chunk'}
          \ , 'sort':0
          \ , 'ctagsbin':'/Users/mmaksimov/.vim/rmdtags.py'
          \ , 'ctagsargs': ''
          \ }

" }}}

" ALE {{{

" ALE will enable lintr by default if no specified here
" lintr was causing issues with many hiddern buffer cache files being open; had to uninstall it
" let g:ale_linters = {'python': ['flake8', 'ruff'], 'rust': ['analyzer', 'cargo', 'rls'], 'rmd': ["languageserver"], 'r': ["languageserver"]}
let g:ale_linters = {'python': ['flake8', 'ruff'], 'rust': ['analyzer', 'cargo', 'rls'], 'rmd': [], 'r': []}
let g:ale_fixers = {'python': ['black', 'isort'], 'yaml': ['yamlfix'], 'rust': ['rustfmt', 'trim_whitespace', 'remove_trailing_lines'], 'rmd': ['styler'], 'r': ['styler']}

" python
let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_python_black_options = '-l 120'
let g:ale_python_ruff_options = '-l 120'
let g:ale_python_isort_options = '--profile black -l 100'
let g:ale_virtualtext_cursor = 'disabled'
" let g:ale_fix_on_save = 1

" Rust
set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 1
let g:ale_rust_rustfmt_options = '--config max_width=120,use_small_heuristics=Max'

" }}}

" vim-fugitive and vim-rhubarb {{{

nnoremap <Leader>gB :Gblame<CR> " git blame
nnoremap <Leader>gb :Gblame<CR> " open current line in the browser
nnoremap <Leader>gb :Gblame<CR> " open visual selection in the browser

" }}}

" Pydoc {{{

let g:pydocstring_formatter = 'google'
let g:pydocstring_enable_mapping = 0

" }}}

" copilot {{{

" imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
" let g:copilot_no_tab_map = v:true
" imap <C-K> <Plug>(copilot-next)

" }}}

" Rust {{{

" let g:racer_cmd = "/home/mmaksimov/.cargo/bin/racer"
" augroup Racer
"     autocmd!
"     autocmd FileType rust nmap <buffer> gd         <Plug>(rust-def)
"     autocmd FileType rust nmap <buffer> gs         <Plug>(rust-def-split)
"     autocmd FileType rust nmap <buffer> gx         <Plug>(rust-def-vertical)
"     autocmd FileType rust nmap <buffer> gt         <Plug>(rust-def-tab)
"     autocmd FileType rust nmap <buffer> <leader>gd <Plug>(rust-doc)
"     autocmd FileType rust nmap <buffer> <leader>gD <Plug>(rust-doc-tab)
" augroup END

" }}}

" deprecated {{{

" jupytext
" let g:jupytext_fmt = 'Rmd'
" let g:jupytext_fmt = 'py:percent'


" jupyter_ascending
" nmap <space><space>x <Plug>JupyterExecute
" nmap <space><space>X <Plug>JupyterExecuteAll

" }}}
