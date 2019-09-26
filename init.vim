
call plug#begin()
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-rooter'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'raimondi/delimitmate'
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'breuckelen/vim-resize'
Plug 'majutsushi/tagbar'
Plug 'mxw/vim-jsx'
Plug 'RRethy/vim-illuminate'
Plug 'luochen1990/rainbow'
Plug 'terryma/vim-smooth-scroll'

Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'




" Docker
Plug 'ekalinin/dockerfile.vim'
Plug 'kevinhui/vim-docker-tools'

" lsp
Plug 'w0rp/ale'

" Grep and fuzzyfind
Plug 'junegunn/fzf'
Plug 'mhinz/vim-grepper'

" JSON
Plug 'tpope/vim-jdaddy'

" Js
Plug 'pangloss/vim-javascript'

" CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'


" Colors
Plug 'jacoborus/tender.vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'connorholyday/vim-snazzy'
Plug 'sts10/vim-pink-moon'
Plug 'tomasr/molokai'
Plug  'dracula/vim'
Plug 'vim-scripts/moria'
Plug 'trevordmiller/nova-vim'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'

" Utility

call plug#end()


" Remove global autocomplete from buffer
setglobal complete-=i


set encoding=utf8
set guifont=DejaVu\ Sans\ Mono:14



set number relativenumber

" Automatically reload file guten for git.
set autoread

" I'm lazy and want case insensitive search.
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


" ***** Basics
"
"" Color
colorscheme onedark

syntax on




"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

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


"" ctrlp.vim
"set wildmode=list:longest,list:full
"set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
"let g:ctrlp_custom_ignore = '\v[\/](venv|node_modules|target|dist)|(\.(swp|tox|ico|git|hg|svn))$'
"let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
"let g:ctrlp_use_caching = 1
"let g:ctrlp_clear_cache_on_exit = 0
"let g:ctrlp_max_files=0
"let g:ctrlp_max_depth=40

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

" Tagbar
nmap <F4> :TagbarToggle<CR>



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



" fzf
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
nnoremap <c-p> :FZF<cr>

augroup fzf
    autocmd!
    autocmd! FileType fzf
    autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END



"*****************************************************************************
"" LANGUAGE SERVER PROTOCOLS
"*****************************************************************************

" ALE
let g:ale_set_highlights = 0  " Dont underline errors/warnings
 let g:ale_sign_error = '✘'
let g:ale_sign_warning = '--'

highlight ALEErrorSign guifg=#FF0000
highlight ALEWarningSign guifg=#F2C38F

let g:ale_completion_enabled = 0

" map <F5> to alefix eslint
" TODO Wrap in a if statement .
nnoremap <F5> :ALEFix eslint<cr>


" Autocompletion


" Stop ale on javascripts
"autocmd BufEnter *.js ALEDisable



"*****************************************************************************
"" LANGUAGE SERVER PROTOCOLS Ends
"*****************************************************************************


nnoremap <Leader>s :SemanticHighlightToggle<cr>
nnoremap <Leader>q :DockerToolsToggle<cr>
nnoremap <Leader>a :Grepper<cr>



" increase font size
let s:fontsize = 12
function! AdjustFontSize(amount)
      let s:fontsize = s:fontsize+a:amount
        :execute "GuiFont! DejaVu Sans Mono:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a



" In insert mode, pressing ctrl + numpad's+ increases the font
inoremap <C-kPlus> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-kMinus> <Esc>:call AdjustFontSize(-1)<CR>a
