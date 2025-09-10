return {
  {
    "vim-test/vim-test",
    ft = { "clojure" },
    config = function()
      -- Clojure test configuration
      vim.g["test#clojure#runner"] = "conjure"
      vim.g["test#strategy"] = "neovim"
      
      -- Enhanced test keybindings for Clojure
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "clojure",
        callback = function()
          local opts = { buffer = true, silent = true }
          
          -- Test running (using <leader>T for tests to avoid conflict with Telekasten)
          vim.keymap.set("n", "<leader>Tt", "<cmd>TestNearest<CR>", vim.tbl_extend("force", opts, { desc = "Test nearest" }))
          vim.keymap.set("n", "<leader>Tf", "<cmd>TestFile<CR>", vim.tbl_extend("force", opts, { desc = "Test file" }))
          vim.keymap.set("n", "<leader>Ts", "<cmd>TestSuite<CR>", vim.tbl_extend("force", opts, { desc = "Test suite" }))
          vim.keymap.set("n", "<leader>Tl", "<cmd>TestLast<CR>", vim.tbl_extend("force", opts, { desc = "Test last" }))
          vim.keymap.set("n", "<leader>Tv", "<cmd>TestVisit<CR>", vim.tbl_extend("force", opts, { desc = "Visit test file" }))
          
          -- Quick test namespace evaluation
          vim.keymap.set("n", "<leader>Tn", function()
            -- Load current test namespace and run all tests in it
            vim.cmd("ConjureEvalNs")
            vim.defer_fn(function()
              vim.cmd("ConjureEval (clojure.test/run-tests)")
            end, 100)
          end, vim.tbl_extend("force", opts, { desc = "Run namespace tests" }))
        end,
      })
    end,
  },
}
