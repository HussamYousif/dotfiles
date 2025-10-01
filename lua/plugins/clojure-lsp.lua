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
          keys = {
            { "<leader>gd", vim.lsp.buf.definition, desc = "Go to definition" },
            { "<leader>gr", vim.lsp.buf.references, desc = "Find references" },
            { "<leader>gi", vim.lsp.buf.implementation, desc = "Go to implementation" },
            { "<leader>rn", vim.lsp.buf.rename, desc = "Rename symbol" },
            { "<leader>rf", vim.lsp.buf.format, desc = "Format code" },
            { "<leader>ra", vim.lsp.buf.code_action, desc = "Code actions" },
            { "K", vim.lsp.buf.hover, desc = "Hover documentation" },
            { "<C-k>", vim.lsp.buf.signature_help, desc = "Signature help", mode = "i" },
            { "<leader>wa", vim.lsp.buf.add_workspace_folder, desc = "Add workspace folder" },
            { "<leader>wr", vim.lsp.buf.remove_workspace_folder, desc = "Remove workspace folder" },
          },
        },
      },
    },
  },
}
