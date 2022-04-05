local opts = { noremap = true, silent = true }

local term_opts = { noremap = true, silent = true }

vim.g.mapleader = ','               -- Change leader to a comma
-- Shorten function name
local map = vim.api.nvim_set_keymap

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Visual --
-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)
map("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Custom
map("n", "<Esc><Esc>", "<cmd>nohlsearch<cr>", opts)

-- NvimTree
map("n", "<Leader>tt", ":NvimTreeToggle<CR>", opts)
map("n", "<Leader>tr", ":NvimTreeRefresh<CR>", opts)
map("n", "<Leader>tf", ":NvimTreeFindFile<CR>", opts)

-- Telescope
map("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<Leader>fg",":Telescope live_grep<CR>", opts)
map("n", "<Leader>fb" ,":Telescope buffers<CR>", opts)
map("n", "<Leader>fh",":Telescope help_tags<CR>", opts)
map("n", "<Leader>fj",":Telescope jumplist<CR>", opts)
map("n", "<Leader>fc",":Telescope colorscheme<CR>", opts)
map("n", "<Leader>fs", ":Telescope spell_suggest<CR>", opts)
map("n", "<Leader>fk", ":Telescope keymaps<CR>", opts)
