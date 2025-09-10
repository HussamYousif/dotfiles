return {
  -- Enhanced structural editing for Clojure
  {
    "PaterJason/nvim-treesitter-sexp",
    ft = { "clojure", "fennel", "scheme" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      -- Additional keymaps for structural editing
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "clojure", "fennel", "scheme" },
        callback = function()
          local opts = { buffer = true, silent = true }
          
          -- Slurp/barf operations (essential for Lisp editing)
          vim.keymap.set("n", "<leader>ss", "<cmd>TSSexp slurp_right<CR>", vim.tbl_extend("force", opts, { desc = "Slurp right" }))
          vim.keymap.set("n", "<leader>sb", "<cmd>TSSexp barf_right<CR>", vim.tbl_extend("force", opts, { desc = "Barf right" }))
          vim.keymap.set("n", "<leader>sS", "<cmd>TSSexp slurp_left<CR>", vim.tbl_extend("force", opts, { desc = "Slurp left" }))
          vim.keymap.set("n", "<leader>sB", "<cmd>TSSexp barf_left<CR>", vim.tbl_extend("force", opts, { desc = "Barf left" }))
          
          -- Splice operations
          vim.keymap.set("n", "<leader>sj", "<cmd>TSSexp splice<CR>", vim.tbl_extend("force", opts, { desc = "Splice" }))
          vim.keymap.set("n", "<leader>sk", "<cmd>TSSexp kill_splice<CR>", vim.tbl_extend("force", opts, { desc = "Kill & splice" }))
          
          -- Raise/promote operations
          vim.keymap.set("n", "<leader>su", "<cmd>TSSexp raise<CR>", vim.tbl_extend("force", opts, { desc = "Raise form" }))
          
          -- Transpose operations
          vim.keymap.set("n", "<leader>st", "<cmd>TSSexp transpose<CR>", vim.tbl_extend("force", opts, { desc = "Transpose forms" }))
        end,
      })
    end,
  },
}
