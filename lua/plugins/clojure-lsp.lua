return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clojure_lsp = {
          -- Enhanced Clojure LSP settings
          init_options = {
            ["semantic-tokens?"] = false,
            ["document-formatting?"] = true,
            ["document-range-formatting?"] = true,
            ["hover-documentation?"] = true,
            ["completion-analysis?"] = true,
            ["code-lens?"] = true,
            ["java-support?"] = false, -- Set to true if using Java interop
          },
          settings = {
            ["clojure-lsp"] = {
              ["semantic-tokens?"] = false,
              ["clean-ns?"] = true,
              ["auto-add-ns-to-new-files?"] = true,
              ["document-formatting?"] = true,
              ["document-range-formatting?"] = true,
              ["keep-require-at-start?"] = true,
            },
          },
          on_attach = function(client, bufnr)
            -- Enhanced Clojure-specific LSP keybindings
            local opts = { buffer = bufnr, silent = true }
            
            -- Go to definition/references
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Find references" }))
            vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, vim.tbl_extend("force", opts, { desc = "Go to implementation" }))
            
            -- Refactoring
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
            vim.keymap.set("n", "<leader>rf", vim.lsp.buf.format, vim.tbl_extend("force", opts, { desc = "Format code" }))
            vim.keymap.set("n", "<leader>ra", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code actions" }))
            
            -- Hover and signature help
            vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, vim.tbl_extend("force", opts, { desc = "Signature help" }))
            
            -- Workspace management
            vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, vim.tbl_extend("force", opts, { desc = "Add workspace folder" }))
            vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, vim.tbl_extend("force", opts, { desc = "Remove workspace folder" }))
          end,
        },
      },
    },
  },
}
