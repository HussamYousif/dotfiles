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

-- Auto-reload buffers changed outside of Neovim and re-source config on change
local opencode_reload_grp = vim.api.nvim_create_augroup("opencode_auto_reload", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave", "CursorHold", "BufEnter" }, {
  group = opencode_reload_grp,
  command = "silent! checktime",
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
  group = opencode_reload_grp,
  pattern = "*",
  callback = function(event)
    local cfg = vim.fn.stdpath("config")
    local file = event.file or vim.api.nvim_buf_get_name(event.buf)
    if not file or file == "" then
      return
    end
    local prefix = cfg .. "/"
    if file:sub(1, #prefix) ~= prefix then
      return
    end

    if file:match("/lua/plugins/.*%.lua$") then
      pcall(function()
        require("lazy").reload()
      end)
      return
    end

    if file:match("/init%.lua$") or file:match("/.*%.vim$") then
      vim.cmd("silent! source " .. vim.fn.fnameescape(file))
      pcall(function()
        require("lazy").reload()
      end)
      return
    end

    if file:match("/lua/.*%.lua$") then
      local rel = file:match(vim.pesc(cfg .. "/lua/(.*)%.lua$") or "")
      if rel and rel ~= "" then
        local mod = rel:gsub("/", ".")
        package.loaded[mod] = nil
        local ok = pcall(require, mod)
        if not ok then
          vim.cmd("silent! luafile " .. vim.fn.fnameescape(file))
        end
      else
        vim.cmd("silent! luafile " .. vim.fn.fnameescape(file))
      end
      return
    end
  end,
})
