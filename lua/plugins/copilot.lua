return {
  -- Copilot main plugin for autocomplete
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 50, -- Lower debounce for faster suggestions
        keymap = {
          accept = "<Tab>", -- Accept suggestion with Tab
          accept_word = "<M-w>", -- Accept word with Meta+w
          accept_line = "<M-l>", -- Accept line with Meta+l
          next = "<M-]>", -- Next suggestion with Meta+]
          prev = "<M-[>", -- Previous suggestion with Meta+[
          dismiss = "<C-]>", -- Dismiss suggestion with Control+]
        },
      },
      panel = { enabled = false }, -- Disable the panel, we'll use chat instead
      filetypes = {
        markdown = true,
        help = true,
        ["*"] = true, -- Enable for all file types
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)
      
      vim.g.copilot_enabled = true
      
      local function toggle_copilot()
        vim.g.copilot_enabled = not vim.g.copilot_enabled
        
        if vim.g.copilot_enabled then
          vim.cmd("Copilot enable")
          Snacks.notify("✓ Copilot enabled", { title = "Copilot" })
        else
          vim.cmd("Copilot disable")
          Snacks.notify("✗ Copilot disabled", { title = "Copilot" })
        end
      end
      
      vim.keymap.set("n", "<leader>uB", toggle_copilot, { desc = "Toggle Copilot autocomplete" })
      
      _G.get_copilot_status = function()
        return vim.g.copilot_enabled and "✓ Copilot" or "✗ Copilot"
      end
    end,
  },

  -- Disable Copilot's built-in LSP server (we're using the plugin instead)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        copilot = { enabled = false },
      },
    },
  },
}
