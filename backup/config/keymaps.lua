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
