call plug#begin('~/Appdata/Local/nvim/plugged')
" Colorschemes
Plug 'dracula/vim'
Plug 'jnurmine/Zenburn'
Plug 'gosukiwi/vim-atom-dark'
Plug 'ciaranm/inkpot'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'ghifarit53/tokyonight-vim'
Plug 'artanikin/vim-synthwave84'
Plug 'romgrk/doom-one.vim'
Plug 'onsails/lspkind-nvim'
Plug 'edeneast/nightfox.nvim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'Pocco81/Catppuccino.nvim'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


" Utils and GUI
Plug 'ap/vim-css-color'
Plug 'airblade/vim-rooter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'raimondi/delimitmate'
Plug 'yggdroot/indentline'
Plug 'mhinz/vim-startify'
Plug 'xolox/vim-misc'
Plug 'frazrepo/vim-rainbow'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/todo-comments.nvim'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'breuckelen/vim-resize'
Plug 'RRethy/vim-illuminate'
Plug 'terryma/vim-smooth-scroll'
Plug 'lazytanuki/nvim-mapper'
Plug 'romgrk/barbar.nvim'
Plug 'camspiers/animate.vim'

" TODO comment search
Plug 'folke/todo-comments.nvim'
" Tagbar
Plug 'simrat39/symbols-outline.nvim'

" Power Line
Plug 'famiu/feline.nvim', { 'branch': 'develop' }

" Zen mode
Plug 'folke/zen-mode.nvim'

" Fuzzy find
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" commentor
Plug 'terrortylor/nvim-comment'

" Clipboard manager
Plug 'AckslD/nvim-neoclip.lua'

" Keeping my tasks and the like
Plug 'nvim-neorg/neorg'

" Awesome plugins
Plug 'tpope/vim-surround'
Plug 'ray-x/navigator.lua'

" Git
Plug 'junegunn/gv.vim'
Plug 'f-person/git-blame.nvim'
" Visual git changes, pretty decent but cba
" getting into it atm
" Plug 'tanvirtin/vgit.nvim'
Plug 'TimUntersberger/neogit'

" Treesitter
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-treesitter/playground'


" Snippets
Plug 'honza/vim-snippets'

call plug#end()



set hidden
set encoding=utf8
set nohlsearch


" Set the filetype spaces here.
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
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


"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

set clipboard+=unnamedplus

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
colorscheme snazzy
set background=dark
syntax on


" configure nvcode-color-schemes
let g:nvcode_termcolors=256

set termguicolors

" Exit terminal mode with esc
tnoremap <Esc> <C-\><C-n>

"" Fix backspace indent
set backspace=indent,eol,start



"" Map leader to ,
let mapleader=','

"" Searching
set incsearch
set ignorecase
set smartcase

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
cnoreabbrev Vsp vsp
cnoreabbrev Sp sp


set mouse=a

" Paste with middle mouse click
vmap <LeftRelease> "*ygv

" Paste with <Shift> + <Insert>
imap <S-Insert> <C-R>*

"************** Plugin settings ********************************************

" Rooter settings
let g:rooter_patterns = ['.git/']


" show dot files
let NERDTreeShowHidden=1
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


"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
noremap <F3> :NERDTreeToggle<CR>


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


"*****************************************************************************
"" font size and stuff
"*****************************************************************************
set guifont=FiraCode\ Nerd\ Font:h18


let s:fontsize = 14
function! AdjustFontSize(amount)
      let s:fontsize = s:fontsize+a:amount
        :execute "set guifont=FiraCode Nerd Font:h" . s:fontsize
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
"" COC
"*****************************************************************************
" Actions
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
xmap <leader>k  <Plug>(coc-codeaction-cursor)
nmap <leader>k  <Plug>(coc-codeaction-cursor)
xmap <leader>l  <Plug>(coc-codeaction-line)
nmap <leader>l  <Plug>(coc-codeaction-line)
xmap <leader>rr  <Plug>(coc-refactor)
nmap <leader>rr  <Plug>(coc-refactor)


" Navigations
xmap <leader>fi  <Plug>(coc-implementation)
nmap <leader>fi  <Plug>(coc-implementation)

xmap <leader>fd  <Plug>(coc-declaration)
nmap <leader>fd  <Plug>(coc-declaration)

xmap <leader>fr  <Plug>(coc-references)
nmap <leader>fr  <Plug>(coc-references)

" Errors handling
xmap <leader>di  <Plug>(coc-diagnostic-info)
nmap <leader>di  <Plug>(coc-diagnostic-info)

xmap <leader>dn  <Plug>(coc-diagnostic-next)
nmap <leader>dn  <Plug>(coc-diagnostic-next)

xmap <leader>dp  <Plug>(coc-diagnostic-prev)
nmap <leader>dp  <Plug>(coc-diagnostic-prev)


xmap <leader>ne  <Plug>(coc-diagnostic-next-error)
nmap <leader>ne  <Plug>(coc-diagnostic-next-error)


noremap <leader>cc :CocCommand<CR>
noremap <leader>ca :CocAction<CR>
noremap <leader>cf :CocFix<CR>
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" SNIPPETS
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
"
" " Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
"
" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
"
" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
"
" " Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
"
" " Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

"*****************************************************************************
"" Treesitter options
"*****************************************************************************
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    },
  incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-n>",
        node_incremental = "<C-n>",
        scope_incremental = "<C-s>",
        node_decremental = "<C-r>",
    },
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
  },
}
EOF

lua <<EOF
require('nvim_comment').setup()
EOF

lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
lua << EOF
    require('neorg').setup {
-- Tell Neorg what modules to load
load = {
    ["core.defaults"] = {}, -- Load all the default modules
    ["core.norg.concealer"] = {}, -- Allows for use of icons
    ["core.norg.dirman"] = { -- Manage your directories with Neorg
	config = {
	    workspaces = {
		my_workspace = "~/neorg"
	    }
	}
    }
},}
EOF

lua << EOF
require('feline').setup()
EOF

lua << EOF
  require("zen-mode").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" Enable at the plug level first
" lua << EOF
"require('vgit').setup()
"EOF

lua << EOF
require('neogit').setup()
EOF

lua << EOF
require('neoclip').setup({})
EOF

lua << EOF
require('telescope').setup{ defaults = { file_ignore_patterns = {"vendor"} } }
EOF

nnoremap <leader>cp <cmd>Telescope neoclip a extra=star,plus,b<cr>

"TELESCOPE
"Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fj <cmd>Telescope jumplist<cr>
nnoremap <leader>fc <cmd>Telescope colorscheme<cr>
nnoremap <leader>fs <cmd>Telescope spell_suggest<cr>
nnoremap <leader>fk <cmd>Telescope keymaps<cr>
nnoremap <F2> <cmd>Telescope file_browser<cr>
nnoremap <F4> <cmd>Telescope treesitter<cr>
" Search for word under cursor
nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>

augroup GoFiles
  autocmd!
  autocmd Filetype go nmap <buffer> <silent> <leader>fd :GoDef<CR>
  autocmd Filetype go nmap <buffer> <silent> <leader>tf :GoTestFunc<CR>
  autocmd Filetype go nmap <buffer> <silent> <leader>tt :GoTest<CR>
  autocmd Filetype go nmap <buffer> <silent> <leader>tc :GoCoverage<CR>
augroup END

"*****************************************************************************
"" Javascript
"*****************************************************************************
augroup ReactFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
  autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
augroup END

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal shiftwidth=2 tabstop=2

autocmd FileType javascriptreact setlocal shiftwidth=2 tabstop=2
autocmd FileType typescriptreact setlocal shiftwidth=2 tabstop=2



"*****************************************************************************
"" OSX breaks out of insert mode with option/meta key.
"*****************************************************************************
" fix meta-keys which generate <Esc>a .. <Esc>z
imap <F5> ()
imap <F6> []
imap <F7> {}
imap <F8> \|
imap <F9> \

" Need npm for coc
let g:node_host_prog='/Users/hussamyousif/.nvm/versions/node/v17.0.1/bin/node'
let g:coc_node_path='/Users/hussamyousif/.nvm/versions/node/v17.0.1/bin/node'
