-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Disable formatting for SCSS and CSS files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "BufWritePre" }, {
  pattern = { "*.scss", "*.css" },
  callback = function()
    vim.b.disable_autoformat = true
    vim.b.autoformat = false
  end,
})

-- Additional safeguard to prevent LazyVim's conform.nvim from formatting
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyVimStarted",
  callback = function()
    -- Disable conform.nvim for CSS/SCSS if it exists
    local ok, conform = pcall(require, "conform")
    if ok then
      local original_format = conform.format
      conform.format = function(opts)
        opts = opts or {}
        local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
        local ft = vim.bo[bufnr].filetype
        if ft == "scss" or ft == "css" then
          return
        end
        return original_format(opts)
      end
    end
  end,
})
