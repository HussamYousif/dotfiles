return {
  -- Copilot main plugin for autocomplete
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true, -- Enable suggestions since cmp is disabled
        auto_trigger = true, -- Auto-trigger suggestions as you type
        hide_during_completion = false, -- We're not using other completion sources
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
  },

  -- Copilot Chat for AI-powered conversations
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    build = "make tiktoken", -- Build tiktoken for better token counting
    opts = {
      auto_insert_mode = true, -- Automatically enter insert mode in chat
      show_help = true, -- Show help in chat window
      question_header = "  Daddy Long Legs ",
      answer_header = "  Copilot ",
      window = {
        layout = "vertical", -- Can be 'vertical' or 'horizontal'
        width = 0.4, -- 40% of screen width
        height = 0.5, -- 50% of screen height
        relative = "editor",
      },
      -- Mapping configuration
      mappings = {
        close = {
          normal = "q",
          insert = "<C-c>",
        },
        reset = {
          normal = "<C-r>",
          insert = "<C-r>",
        },
        submit_prompt = {
          normal = "<CR>",
          insert = "<C-CR>",
        },
      },
    },
    keys = {
      -- Chat commands with <leader>a prefix
      {
        "<leader>aa",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "Toggle Copilot Chat",
      },
      {
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end,
        desc = "Quick Chat",
      },
      {
        "<leader>ap",
        function()
          require("CopilotChat").ask(
            vim.fn.input("Prompt: "),
            { selection = require("CopilotChat.select").visual }
          )
        end,
        desc = "Prompt with Visual Selection",
        mode = "v",
      },
      {
        "<leader>ae",
        "<cmd>CopilotChatExplain<cr>",
        desc = "Explain Code",
        mode = { "n", "v" },
      },
      {
        "<leader>ar",
        "<cmd>CopilotChatReview<cr>",
        desc = "Review Code",
        mode = { "n", "v" },
      },
      {
        "<leader>af",
        "<cmd>CopilotChatFix<cr>",
        desc = "Fix Code",
        mode = { "n", "v" },
      },
      {
        "<leader>ao",
        "<cmd>CopilotChatOptimize<cr>",
        desc = "Optimize Code",
        mode = { "n", "v" },
      },
      {
        "<leader>ad",
        "<cmd>CopilotChatDocs<cr>",
        desc = "Generate Docs",
        mode = { "n", "v" },
      },
      {
        "<leader>at",
        "<cmd>CopilotChatTests<cr>",
        desc = "Generate Tests",
        mode = { "n", "v" },
      },
      {
        "<leader>ac",
        "<cmd>CopilotChatCommit<cr>",
        desc = "Generate Commit Message",
      },
      {
        "<leader>aD",
        "<cmd>CopilotChatDebugInfo<cr>",
        desc = "Debug Info",
      },
      {
        "<leader>as",
        "<cmd>CopilotChatStop<cr>",
        desc = "Stop Current Chat",
      },
      {
        "<leader>aR",
        "<cmd>CopilotChatReset<cr>",
        desc = "Reset Chat",
      },
    },
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatClose",
      "CopilotChatToggle",
      "CopilotChatReset",
      "CopilotChatStop",
      "CopilotChatDebugInfo",
      "CopilotChatExplain",
      "CopilotChatReview",
      "CopilotChatFix",
      "CopilotChatOptimize",
      "CopilotChatDocs",
      "CopilotChatTests",
      "CopilotChatCommit",
    },
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