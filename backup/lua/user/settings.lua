-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
--local fn = vim.fn       				-- Call Vim functions
local cmd = vim.cmd     				-- Execute Vim commands
local exec = vim.api.nvim_exec 	-- Execute Vimscript
local g = vim.g         				-- Global variables
local opt = vim.opt         		-- Set options (global/buffer/windows-scoped)

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = ','               -- Change leader to a comma
opt.mouse = 'a'                 -- Enable mouse support
opt.clipboard = 'unnamedplus'   -- Copy/paste to system clipboard
opt.swapfile = false            -- Don't use swapfile

cmd [[cd ~/repos/]]

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.relativenumber = true               -- Show line number
opt.showmatch = true            -- Highlight matching parenthesis
opt.foldmethod = 'marker'       -- Enable folding (default 'foldmarker')
opt.splitright = true           -- Vertical split to the right
opt.splitbelow = true           -- Orizontal split to the bottom
opt.ignorecase = true           -- Ignore case letters when search
opt.smartcase = true            -- Ignore lowercase for the whole pattern
opt.linebreak = true            -- Wrap on word boundary

-- Remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=800}
  augroup end
]], false)


-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true               -- Enable background buffers
opt.history = 100               -- Remember N lines in history
opt.lazyredraw = true           -- Faster scrolling
opt.synmaxcol = 240             -- Max column for syntax highlight




-----------------------------------------------------------
-- Colorscheme And Font
-----------------------------------------------------------
opt.termguicolors = true        -- Enable 24-bit RGB colors
opt.guifont = 'FiraCode Nerd Font:h14'

-- Don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml setlocal shiftwidth=2 tabstop=2
]]

opt.ff = 'unix'

cmd [[
  autocmd BufWritePost * set ff=unix
]]
-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------

-- Insert mode completion options
opt.completeopt = 'menuone,noselect'

-----------------------------------------------------------
-- Terminal
-----------------------------------------------------------

-- Open a terminal pane on the right using :Term
cmd [[command Term :botright vsplit term://$SHELL]]
-- Set shell
cmd [[let &shell = has('win32') ? 'powershell' : 'pwsh']]
-- Terminal visual tweaks:
--- enter insert mode when switching to terminal
--- close terminal buffer on process exit
cmd [[
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber nocursorline
    autocmd TermOpen * startinsert
    autocmd BufLeave term://* stopinsert
]]
