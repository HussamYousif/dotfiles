-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.del("n", "<leader>e")
vim.keymap.del("n", "<leader>E")
vim.keymap.del("n", "<leader>K")
vim.keymap.del("n", "<leader>S")
vim.keymap.del("n", "<leader>,")
vim.keymap.del("n", "<leader>-")
vim.keymap.del("n", "<leader>|")

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil", remap = true })

-- Jumping
vim.keymap.set("n", "<BS>", "<C-o>", { desc = "Jump back" })
vim.keymap.set("n", "<S-BS>", "<C-i>", { desc = "Jump forward" })

-- Terminal mode keymaps
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to down window" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to up window" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })

-- Jump to matching bracket/paren/brace
vim.keymap.set("n", "<leader>fP", "%", { desc = "Jump to matching pair" })

-- LSP Code Actions (ensure this takes precedence over any plugin conflicts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })

-- Load Clojure-specific keymaps
require("config.keymaps-clojure").setup()
