set runtimepath=$HOME/vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles

call plug#begin('$HOME/vim/bundle')
Plug 'flazz/vim-colorschemes'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'raimondi/delimitmate'
Plug 'yggdroot/indentline'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'breuckelen/vim-resize'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'mxw/vim-jsx'
Plug 'easymotion/vim-easymotion'
Plug 'kien/rainbow_parentheses.vim'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'RRethy/vim-illuminate'
Plug 'terryma/vim-smooth-scroll'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

" NIM
Plug 'zah/nim.vim'

" JSON
Plug 'tpope/vim-jdaddy'

" CSharp
Plug 'omnisharp/omnisharp-vim'

" Organisation
Plug 'dhruvasagar/vim-dotoo'


" Autocompletion
Plug 'SirVer/ultisnips'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'roxma/nvim-yarp'

" Js
Plug 'pangloss/vim-javascript'

" Autoformatting
Plug 'w0rp/ale'

" CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'


" Searching
Plug 'wincent/ferret'

" Haskell
Plug 'itchyny/vim-haskell-indent'
Plug 'tinco/haskell.vim'


" Elm
Plug 'ElmCast/elm-vim'

" Colors
Plug 'jacoborus/tender.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'flazz/vim-colorschemes'
Plug 'arcticicestudio/nord-vim'
Plug 'connorholyday/vim-snazzy'
Plug 'sts10/vim-pink-moon'
Plug 'tomasr/molokai'
Plug  'dracula/vim'
Plug 'vim-scripts/moria'
Plug 'trevordmiller/nova-vim'

Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()



set encoding=utf8
"set guifont=DroidSansMono\ NF\:h11
set guifont=Consolas\:h11



set number relativenumber
" Automatically reload file guten for git.
set autoread

" I'm lazy and want case insensitive search.
" Also works better for CTRLP
set ignorecase


"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>


"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

" Filetypes
filetype plugin on
filetype plugin indent on

set omnifunc=syntaxcomplete#Complete


" ***** Basics
"
"" Color
colorscheme papercolor

syntax on


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

"" Map leader to ,
let mapleader=','

"" Searching
set incsearch
set ignorecase
set smartcase
set nohlsearch

"" Directories for swp files
set nobackup
set noswapfile

" GUI
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set termguicolors

" disable folding
set nofoldenable




" Splits
set splitbelow
set splitright

noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" Grep

nnoremap <F8> :vert terminal<CR>

" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4 smartindent
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END
autocmd FileType python setlocal colorcolumn=200


"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


set mouse=a

" Paste with middle mouse click
vmap <LeftRelease> "*ygv

" Paste with <Shift> + <Insert>
imap <S-Insert> <C-R>*

"************** Plugin settings ********************************************

" Rooter settings
let g:rooter_patterns = ['.git/']



" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
endif

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
noremap <F3> :NERDTreeToggle<CR>


"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](venv|node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1



" Removes whitespace after saving
autocmd BufWritePost * FixWhitespace


" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1


" Python vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" Use deoplete.
let g:python3_host_prog= 'C:\Users\Lokal Bruker\AppData\Local\Programs\Python\Python37\python.exe'

" parenthesis completion?=



" JEDI Conf
"let g:jedi#use_tabs_not_buffers = 0  " use buffers instead of tabs
"let g:jedi#goto_command = "<localleader>tt"
"let g:jedi#goto_assignments_command = "<localleader>ta"
"let g:jedi#goto_definitions_command = "<localleader>tg"
"let g:jedi#documentation_command = "<leader>k"
"let g:jedi#usages_command = "<localleader>u"
"let g:jedi#rename_command = "<leader>r"
"let g:jedi#use_splits_not_buffers = "right"
"let g:jedi#popup_on_dot = 0
"let g:jedi#popup_select_first = 0
"let g:jedi#show_call_signatures = "0"

" ctrl+p
let g:ctrlp_clear_cache_on_exit = 0

" Tagbar
let g:tagbar_ctags_bin='C:\\Program Files\\ctags58\\ctags.exe'
nmap <F4> :TagbarToggle<CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Undotree toggle
nnoremap <F5> :UndotreeToggle<cr>

"Roslyn settings
let g:OmniSharp_server_path = 'C:\omnisharp-roslyn\bin\obj\OmniSharp.Http.Driver\Debug\net461\OmniSharp.exe'

let g:OmniSharp_selector_ui = 'ctrlp'  " Use ctrlp.vim

"ALE
let g:ale_set_highlights = 0  " Dont underline errors/warnings
let g:ale_completion_enabled = 1

" Equivalent to the above.
let b:ale_linters = {'python3': ['flake8']}
let b:ale_linters = {'python': ['flake8']}
let g:ale_linters = {
\ 'cs': ['OmniSharp']
\}


" Enable at some point in the future
"let g:ale_linters = {'python': ['pyls']}

" Uncomment to disable ale on js.
autocmd BufEnter *.js ALEDisable
autocmd BufEnter *.elm ALEDisable

" Bind F8 to fixing problems with ALE
nmap <F8> <Plug>(ale_fix)

" let g:ale_sign_error = '✘'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
highlight ALEErrorSign guifg=#FF0000
highlight ALEWarningSign guifg=#F2C38F

nmap  <C-a> <Plug>(ale_previous_wrap)
nmap <silent> <C-s> <Plug>(ale_next_wrap)
nmap <leader>d <Plug>(ale_go_to_definition)
nmap <leader>r <Plug>(ale_find_reference)
nmap <leader>h <Plug>(ale_hover)

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1



" Rainbow param
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1


" ctrlp
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" Acks settings
" Instead of <leader>a, use <leader>x.
nmap <leader>a <Plug>(FerretAck)

let g:FerretNvim=1
let g:FerretHlsearch=1
let g:FerretAutojump=1


" Elm
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1
