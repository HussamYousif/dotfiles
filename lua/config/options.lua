-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.maplocalleader = ","
vim.o.exrc = true
vim.opt.foldenable = false
--
-- Always use UTF-8
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = { "utf-8" }

-- Disable swap files
vim.o.swapfile = false

-- Auto-reload file when changed externally
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  command = "checktime",
})

-- Disable autocompletion
vim.g.cmp_enabled = false
-- Native inline completions don't support being shown as regular completions
vim.g.ai_cmp = false
