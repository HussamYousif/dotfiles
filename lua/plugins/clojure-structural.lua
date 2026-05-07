return {
  -- Disable nvim-treesitter-sexp due to compatibility issues with latest nvim-treesitter
  -- Using nvim-paredit instead (already installed via LazyVim Clojure extra)
  {
    "PaterJason/nvim-treesitter-sexp",
    enabled = false, -- Disabled due to ts_utils API incompatibility
  },

  -- Enhanced keymaps for nvim-paredit (structural editing for Clojure)
  {
    "julienvincent/nvim-paredit",
    ft = { "clojure", "fennel", "scheme" },
    config = function(_, opts)
      local paredit = require("nvim-paredit")
      paredit.setup(opts)

      -- Set up custom keymaps for structural editing
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "clojure", "fennel", "scheme" },
        callback = function()
          local api = require("nvim-paredit.api")
          local map = vim.keymap.set
          local opts = { buffer = true, silent = true }

          -- Slurp/barf operations
          map("n", "<leader>Ss", function()
            api.slurp_forwards()
          end, vim.tbl_extend("force", opts, { desc = "Slurp forwards" }))
          map("n", "<leader>Sb", function()
            api.barf_forwards()
          end, vim.tbl_extend("force", opts, { desc = "Barf forwards" }))
          map("n", "<leader>SS", function()
            api.slurp_backwards()
          end, vim.tbl_extend("force", opts, { desc = "Slurp backwards" }))
          map("n", "<leader>SB", function()
            api.barf_backwards()
          end, vim.tbl_extend("force", opts, { desc = "Barf backwards" }))

          -- Splice operations (unwrap)
          map("n", "<leader>Sj", function()
            api.splice()
          end, vim.tbl_extend("force", opts, { desc = "Splice (unwrap)" }))
          map("n", "<leader>Sk", function()
            api.splice_killing_backwards()
          end, vim.tbl_extend("force", opts, { desc = "Splice killing backwards" }))

          -- Raise operations
          map("n", "<leader>Su", function()
            api.raise_form()
          end, vim.tbl_extend("force", opts, { desc = "Raise form" }))
          map("n", "<leader>Sr", function()
            api.raise_element()
          end, vim.tbl_extend("force", opts, { desc = "Raise element" }))

          -- Movement and transposing
          map("n", "<leader>St", function()
            api.transpose()
          end, vim.tbl_extend("force", opts, { desc = "Transpose forms" }))
        end,
      })
    end,
  },
}
