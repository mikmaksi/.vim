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
"" Plug 'cjrh/vim-conda'
Plug 'AndrewRadev/linediff.vim'
Plug 'shinglyu/vim-codespell'
Plug 'rizzatti/dash.vim'
"" Plug 'jceb/vim-orgmode'
Plug 'github/copilot.vim', {'branch': 'release'}

"" searching
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"" Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

"" debugging
"" Plug 'puremourning/vimspector'

"" R
Plug 'jalvesaq/Nvim-R'
Plug 'plasticboy/vim-markdown'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
 
"" Python
Plug 'davidhalter/jedi-vim'
Plug 'vim-python/python-syntax'
Plug 'fs111/pydoc.vim'
Plug 'hanschen/vim-ipython-cell'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
"" Plug 'untitled-ai/jupyter_ascending.vim'
"" Plug 'goerz/jupytext.vim' # jupyter_ascending.vim does a better job syncing
"" Plug 'GCBallesteros/jupytext.vim'
"" Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
"" Plug 'ycm-core/YouCompleteMe'
"" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'fisadev/vim-isort'

"" Rust
Plug 'racer-rust/vim-racer'

"" Terraform
Plug 'hashivim/vim-terraform'

"" Appearance
Plug 'junegunn/seoul256.vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'morhetz/gruvbox'

"" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"" tags
Plug 'preservim/tagbar'

call plug#end()

"" General
set number      " Show line numbers
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++   " Wrap-broken line prefix
set textwidth=200   " Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
inoremap ;; <Esc>
vnoremap ;; <Esc>
nnoremap <C-s> <C-e>

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

"" Cursor
set cursorcolumn
set cursorline

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
autocmd FileType rmd setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType sql setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType plm setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

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

"" Key-bind for HOME and END keys
nmap <C-A> <Home>
imap <C-A> <Home>
vmap <C-A> <Home>
nmap <C-E> <End>
imap <C-E> <End>
vmap <C-E> <End>

"" Key-bind for avoiding the Esc key
"" imap jj <ESC>

"" Airline options
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#buffer_nr_show = 1

"" R options
let R_assign = 0
"" below are not necessary on OSX
"" let R_path = '/home/mmaksimov/miniconda3/bin'
"" let R_nvimcom_home = '/home/mmaksimov/miniconda3/lib/R/library/nvimcom'

"" R reset files types (overwrite what vim-rmarkdown ftdetect does)
augroup rmarkdown
	autocmd BufNewFile,BufRead *.Rmd set ft=rmd
	autocmd BufNewFile,BufRead *.rmd set ft=rmd
augroup END

"" open windows .INP files as plm
augroup INP
	autocmd BufNewFile,BufRead *.INP set ft=plm
augroup END

"" open windows .jsl files as sas
augroup INP
	autocmd BufNewFile,BufRead *.jsl set ft=sas
augroup END

"" Color theme lucius
"" colo lucius
"" LuciusDark
"" LuciusDarkLowContrast
"" LuciusLightHighContrast

"" Color theme gruvbox
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="medium"
colo gruvbox
set bg=dark

"" Load NERDTree file explorer on startup
autocmd vimenter * NERDTree

"" vim-slime options
let g:slime_target = "vimterminal"
let g:slime_vimterminal_cmd = "ipython"
let g:slime_vimterminal_config = {"vertical" : 1, "term_finish": "close"}
let g:slime_python_ipython = 1
let g:slime_no_mappings = 1
"" Key-bind for vim-slime; these do not interfere with Nvim-R
"" xmap <leader>ss <Plug>SlimeRegionSend
"" nmap <leader>l <Plug>SlimeLineSend
"" send between two marks (this is not needed if using vim-ipython-cell
"" nmap <leader>bb ['V]'<Plug>SlimeRegionSend
nmap <leader>rf <Plug>SlimeConfig

"" vim-ipython-cell options
let g:ipython_cell_tag = ['# %%'] " to avoid ambiguity with ## which is part of the default
"" let g:ipython_cell_delimit_cells_by='marks' " this can be switched to tags
let g:ipython_cell_delimit_cells_by='tags' " this can be switched to tags
" map <Leader>rf to start IPython
" nnoremap <Leader>rf :SlimeSend1 ipython --matplotlib<CR>

" map <Leader>a to run script
nnoremap <Leader>a :IPythonCellRun<CR>

" map <Leader>A to run script and time the execution
nnoremap <Leader>A :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
nnoremap <Leader>cc :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>CC :IPythonCellExecuteCellJump<CR>

" map <Leader>h to clear IPython screen
nnoremap <Leader>h :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
" nnoremap <Leader>x :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>l <Plug>SlimeLineSend
xmap <Leader>ss <Plug>SlimeRegionSend

" map <Leader>p to run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
nnoremap <Leader>Q :IPythonCellRestart<CR>

" map <Leader>d to start debug mode
" nnoremap <Leader>d :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
nnoremap <Leader>q :SlimeSend1 exit<CR>

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

"" vim-conda options
"" let g:conda_startup_wrn_suppress = 1
"" let g:conda_startup_msg_suppress = 1

"" vimspector
let g:vimspector_enable_mappings = 'HUMAN'

"" tagbar
nnoremap <silent> <F8> :TagbarToggle<CR>

"" tagbar for R configuration
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }

"" jupytext
"" let g:jupytext_fmt = 'Rmd'
"" let g:jupytext_fmt = 'py:percent'

"" jupyter_ascending (not sure I want this plugin anymore)
"" nmap <space><space>x <Plug>JupyterExecute
"" nmap <space><space>X <Plug>JupyterExecuteAll

"" vim-fugitive and vim-rhubarb
nnoremap <Leader>gB :Gblame<CR> " git blame
nnoremap <Leader>gb :Gblame<CR> " open current line in the browser
nnoremap <Leader>gb :Gblame<CR> " open visual selection in the browser

"" Pydoc
let g:pydocstring_formatter = 'google'
let g:pydocstring_enable_mapping = 0

"" copilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
imap <C-K> <Plug>(copilot-next)

"" Register file templates
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/skeleton.sh
    autocmd BufNewFile *.R,*.r 0r ~/.vim/templates/skeleton.R
    autocmd BufNewFile *.Rmd,*.rmd 0r ~/.vim/templates/skeleton.Rmd
    autocmd BufNewFile *.qsub.sh 0r ~/.vim/templates/skeleton.qsub.sh
    autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
    autocmd BufNewFile *.argo.yaml 0r ~/.vim/templates/skeleton.argo.yaml
  augroup END
endif

"" Snakefile syntax
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake

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

"" ALE
let g:ale_linters = {'python': ['flake8', 'ruff']}
let g:ale_fixers = {'python': ['black'], 'yaml': ['yamlfix']}
let g:ale_python_flake8_options = '--max-line-length=120'
let g:ale_python_black_options = '-l 120'
let g:ale_python_ruff_options = '-l 120'
"" let g:ale_fix_on_save = 1
let g:ale_virtualtext_cursor = 'disabled'

"" ignore terminal-type windows when using :bprev, :bnext
augroup termIgnore
  autocmd!
  autocmd TerminalOpen * set nobuflisted
augroup END
