return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "CodeCompanion",
    "CodeCompanionChat",
    "CodeCompanionActions",
    "CodeCompanionCmd",
  },
  opts = {
    adapters = {
      claude_code = function()
        return require("codecompanion.adapters").extend("claude_code", {
          env = {
            cmd = "/Users/hussamyousif/.nvm/versions/node/v22.20.0/bin/claude-agent-acp",
          },
        })
      end,
    },

    strategies = {
      chat = { adapter = "claude_code" },
      inline = { adapter = "claude_code" },
      cmd = { adapter = "claude_code" },
    },

    display = {
      chat = {
        window = {
          position = "right",
          width = 0.35,
        },
      },
      diff = {
        provider = "default",
      },
    },
    opts = {
      log_level = "ERROR",
    },
  },
  keys = {
    { "<leader>a", "", desc = "AI (CodeCompanion)", mode = { "n", "v" } },
    { "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle Chat", mode = { "n", "v" } },
    { "<leader>an", "<cmd>CodeCompanionChat<cr>", desc = "New Chat" },
    { "<leader>ap", "<cmd>CodeCompanionActions<cr>", desc = "Actions / Prompts", mode = { "n", "v" } },
    { "<leader>ai", "<cmd>CodeCompanion<cr>", desc = "Inline Assistant", mode = { "n", "v" } },
    { "<leader>ax", ":CodeCompanionCmd ", desc = "Cmd Prompt" },
    { "<leader>aA", "<cmd>CodeCompanionChat Add<cr>", desc = "Add Selection to Chat", mode = "v" },
    { "<leader>ab", "<cmd>CodeCompanion /buffer<cr>", desc = "Buffer Context", mode = { "n", "v" } },
    { "<leader>ae", "<cmd>CodeCompanion /explain<cr>", desc = "Explain Code", mode = "v" },
    { "<leader>af", "<cmd>CodeCompanion /fix<cr>", desc = "Fix Code", mode = "v" },
    { "<leader>al", "<cmd>CodeCompanion /lsp<cr>", desc = "Explain LSP Diagnostics", mode = { "n", "v" } },
    { "<leader>at", "<cmd>CodeCompanion /tests<cr>", desc = "Generate Tests", mode = "v" },
    { "<leader>ag", "<cmd>CodeCompanion /commit<cr>", desc = "Generate Commit Message" },
  },
  init = function()
    vim.cmd([[cab cc CodeCompanion]])
  end,
}
