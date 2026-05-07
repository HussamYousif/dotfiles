return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 500,
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Global keybinding groups (not Clojure-specific)
    wk.add({
      { "<leader>c", group = "Code" },
      { "<leader>ca", desc = "Code Actions" },
      -- Multi-cursor keybindings
      { "<leader>h", group = "Multi-cursor" },
      { "<leader>hm", desc = "Select all occurrences" },
      { "<leader>ha", desc = "Add cursor up" },
      { "<leader>hs", desc = "Add cursor down" },
      { "<leader>ht", desc = "Toggle VM mappings" },
      { "<leader>hq", desc = "Quit multi-cursor" },
      -- CodeCompanion AI keybindings
      { "<leader>a", group = "AI (CodeCompanion)", mode = { "n", "v" } },
      { "<leader>aa", desc = "Toggle Chat", mode = { "n", "v" } },
      { "<leader>an", desc = "New Chat" },
      { "<leader>ap", desc = "Actions / Prompts", mode = { "n", "v" } },
      { "<leader>ai", desc = "Inline Assistant", mode = { "n", "v" } },
      { "<leader>ax", desc = "Cmd Prompt" },
      { "<leader>aA", desc = "Add Selection to Chat", mode = "v" },
      { "<leader>ab", desc = "Buffer Context", mode = { "n", "v" } },
      { "<leader>ae", desc = "Explain Code", mode = "v" },
      { "<leader>af", desc = "Fix Code", mode = "v" },
      { "<leader>al", desc = "Explain LSP Diagnostics", mode = { "n", "v" } },
      { "<leader>at", desc = "Generate Tests", mode = "v" },
      { "<leader>ag", desc = "Generate Commit Message" },
      -- Spelunk bookmarks
      { "<leader>B", group = "Bookmarks" },
      { "<leader>Bt", desc = "Toggle UI" },
      { "<leader>Ba", desc = "Add bookmark" },
      { "<leader>Bd", desc = "Delete bookmark" },
      { "<leader>Bn", desc = "Next bookmark" },
      { "<leader>Bp", desc = "Previous bookmark" },
      { "<leader>Bf", desc = "Find bookmarks" },
      { "<leader>Bc", desc = "Find stack bookmarks" },
      { "<leader>Bs", desc = "Find stacks" },
      { "<leader>Bl", desc = "Change line" },
    })

    -- Register comma prefix for Conjure commands (only in Clojure files)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "clojure",
      callback = function()
        wk.add({
          { ",", group = "Conjure REPL" },
          { ",p", desc = "Connect to REPL" },
          { ",r", desc = "Reset REPL log" },
          { ",l", desc = "Toggle REPL log" },
          { ",i", desc = "REPL log in vsplit" },
          { ",n", desc = "Evaluate namespace" },
          { ",N", desc = "Refresh namespace" },
          { ",e", desc = "Evaluate current form" },
          { ",E", desc = "Eval with comment" },
          { ",c", desc = "REPL interaction buffer" },
          { ",v", desc = "Start Portal viewer" },
          { ",V", desc = "Clear Portal viewer" },
          { ",d", desc = "Tap> to Portal" },
          { ",g", group = "Go/Goto" },
          { ",x", group = "Macroexpand" },
          { ",t", group = "Tests" },
          { ",s", group = "Repl Session" },
        })

        -- Add Clojure keybinding groups
        wk.add({
          -- REPL operations
          { "<leader>r", group = "REPL" },
          { "<leader>rp", desc = "Connect to REPL" },
          { "<leader>rr", desc = "Reset REPL log" },
          { "<leader>rl", desc = "Toggle REPL log" },
          { "<leader>ri", desc = "REPL log in vsplit" },
          { "<leader>rb", desc = "REPL interaction buffer" },
          { "<leader>rh", desc = "REPL help" },
          { "<leader>rn", desc = "Rename symbol" },
          { "<leader>rf", desc = "Format code" },
          { "<leader>ra", desc = "Code actions" },

          -- Namespace operations
          { "<leader>n", group = "Namespace" },
          { "<leader>nn", desc = "Evaluate namespace" },
          { "<leader>nr", desc = "Refresh namespace" },

          -- Evaluation
          { "<leader>e", group = "Eval" },
          { "<leader>ee", desc = "Evaluate current form" },
          { "<leader>eE", desc = "Eval with comment" },

          -- Portal data viewer
          { "<leader>p", group = "Portal" },
          { "<leader>pv", desc = "Start Portal viewer" },
          { "<leader>pc", desc = "Clear Portal viewer" },
          { "<leader>pt", desc = "Tap> to Portal" },

          -- Structural editing
          { "<leader>S", group = "Structure" },
          { "<leader>Ss", desc = "Slurp right" },
          { "<leader>Sb", desc = "Barf right" },
          { "<leader>SS", desc = "Slurp left" },
          { "<leader>SB", desc = "Barf left" },
          { "<leader>Sj", desc = "Splice" },
          { "<leader>Sk", desc = "Kill & splice" },
          { "<leader>Su", desc = "Raise form" },
          { "<leader>St", desc = "Transpose forms" },

          -- Go to
          { "<leader>g", group = "Go to" },
          { "<leader>gd", desc = "Go to definition" },
          { "<leader>gr", desc = "Find references" },
          { "<leader>gi", desc = "Go to implementation" },
        })
      end,
    })
  end,
}
