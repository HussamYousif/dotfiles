call plug#begin('~/Appdata/Local/nvim/plugged')
" Colorschemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'sonph/onehalf'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'
Plug 'trevordmiller/nova-vim'
Plug 'jacoborus/tender.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'sts10/vim-pink-moon'
Plug 'tomasr/molokai'
Plug 'dracula/vim'
Plug 'vim-scripts/moria'
Plug 'joshdick/onedark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jnurmine/Zenburn'
Plug 'gosukiwi/vim-atom-dark'
Plug 'rakr/vim-one'
Plug 'ciaranm/inkpot'
Plug 'kyoz/purify'
Plug 'vimcolorschemes/vimcolorschemes'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ghifarit53/tokyonight-vim'
Plug 'artanikin/vim-synthwave84'
Plug 'romgrk/doom-one.vim'
Plug 'onsails/lspkind-nvim'

" Syntax
Plug 'stephpy/vim-yaml'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Utils and GUI
Plug 'ap/vim-css-color'
Plug 'airblade/vim-rooter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'raimondi/delimitmate'
Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'habamax/vim-sendtoterm'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'frazrepo/vim-rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'kshenoy/vim-signature'

Plug 'jeetsukumaran/vim-buffergator'
Plug 'breuckelen/vim-resize'
Plug 'RRethy/vim-illuminate'

Plug 'terryma/vim-smooth-scroll'
Plug 'tyru/restart.vim'
" Fuzzy find
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Awesome plugins
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'

" Autocompletion and LSP

" Snippets
Plug 'shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
Plug 'cedarbaum/fugitive-azure-devops.vim'

"Nvim 5
" TODO Treesitter, telescope and stuff
" Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()

filetype indent plugin on



set hidden
set encoding=utf8

set tabstop=4
set shiftwidth=4
set expandtab


" Set the filetype spaces here.
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType php setlocal ts=2 sts=2 sw=2


set number relativenumber

" Disable all sounds
set belloff=all

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

nnoremap <leader>gt :GV<CR>


"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

set clipboard=unnamed

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
colorscheme palenight
set background=dark
syntax on

"" Fix backspace indent
set backspace=indent,eol,start



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

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" GUI
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guioptions+=a  "Clipboard is now windows default


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
  let g:airline_left_sep          = '?'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '?'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '?' "?, ?, ?
  let g:airline#extensions#readonly#symbol   = '?'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = '?'
  let g:airline_symbols.linenr    = '?'
  let g:airline_symbols.branch    = '?'
  let g:airline_symbols.paste     = '?'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '?'
  let g:airline_symbols.whitespace = '?'
else
endif


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



" Fuzzy find
" fzf
"let g:fzf_nvim_statusline = 0 " disable statusline overwriting
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }


nnoremap <c-p> :FZF <cr>
nnoremap <C-p> :Files<CR>
nnoremap <C-o> :Buffers<CR>
nnoremap <C-g> :GFiles<CR>
nnoremap <C-a> :Rg<CR>


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
 let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

highlight ALEErrorSign guifg=#FF0000
highlight ALEWarningSign guifg=#F2C38F
nnoremap <Leader>d :ALEFix<cr>





let g:coc_node_path = '/home/huski/.nvm/versions/node/v16.9.0/bin/node'

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>p  <Plug>(coc-codeaction-selected)


"*****************************************************************************
"" snippets
"*****************************************************************************

let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
imap <C-k> <Plug>(neosnippet_expand_or_jump)

"*****************************************************************************
"" font size and stuff
"*****************************************************************************
set guifont=Fira\ Code\ Nerd\ Font:h14

function! AdjustFontSize(amount)
      let s:fontsize = s:fontsize+a:amount
        :execute "set guifont=Consolas:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a



" In insert mode, pressing ctrl + numpad's+ increases the font
inoremap <C-kPlus> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-kMinus> <Esc>:call AdjustFontSize(-1)<CR>a

let g:rainbow_active = 1



"*****************************************************************************
"" OMNISHARP
"*****************************************************************************
" Omnisharp settings
let g:OmniSharp_server_stdio = 1

augroup omnisharp_commands
    autocmd!
    " When Syntastic is available but not ALE, automatic syntax check on events
    " (TextChanged requires Vim 7.4)
    " autocmd BufEnter,TextChanged,InsertLeave *.cs SyntasticCheck
    " Show type information automatically when the cursor stops moving
    " Removed as it blocks error messasges.
    "autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
    " Update the highlighting whenever leaving insert mode
    autocmd InsertLeave *.cs call OmniSharp#HighlightBuffer()
    " Alternatively, use a mapping to refresh highlighting for the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>th :OmniSharpHighlightTypes<CR>
    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>
    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>
 augroup END

" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nnoremap <Leader><Space> :OmniSharpGetCodeActions<CR>
" Run code actions with text selected in visual mode to extract method
xnoremap <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>
" Rename with dialog
nnoremap <Leader>nm :OmniSharpRename<CR>
nnoremap <F2> :OmniSharpRename<CR>
" Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")
nnoremap <Leader>cf :OmniSharpCodeFormat<CR>



"*****************************************************************************
"" GO
"*****************************************************************************

augroup go
    autocmd!
    " Finds members in the current buffer
    autocmd FileType go nnoremap <buffer> <Leader>fd :GoDef<CR>
      " :GoCoverageToggle
    autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)autocmd FileType go nmap <Leader>d <Plug>(go-doc)

    " :GoInfo
    autocmd FileType go nmap <Leader>i <Plug>(go-info)

    " :GoMetaLinter
    autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)
   " :GoDef but opens in a vertical split
    autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
    " :GoDef but opens in a horizontal split
    autocmd FileType go nmap <Leader>s <Plug>(go-def-split)
 augroup END


"*****************************************************************************
"" Typescript
"*****************************************************************************
