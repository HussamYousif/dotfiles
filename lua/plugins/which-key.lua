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
      -- Copilot AI keybindings
      { "<leader>a", group = "AI (Copilot)" },
      { "<leader>aa", desc = "Toggle Copilot Chat" },
      { "<leader>aq", desc = "Quick Chat" },
      { "<leader>ap", desc = "Prompt with Selection" },
      { "<leader>ae", desc = "Explain Code" },
      { "<leader>ar", desc = "Review Code" },
      { "<leader>af", desc = "Fix Code" },
      { "<leader>ao", desc = "Optimize Code" },
      { "<leader>ad", desc = "Generate Docs" },
      { "<leader>at", desc = "Generate Tests" },
      { "<leader>ac", desc = "Generate Commit" },
      { "<leader>aD", desc = "Debug Info" },
      { "<leader>as", desc = "Stop Chat" },
      { "<leader>aR", desc = "Reset Chat" },
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
          
          -- Documentation
          { "<leader>d", group = "Docs" },
          { "<leader>dd", desc = "Show documentation" },
          { "<leader>ds", desc = "Show source" },
          
          -- Macroexpansion
          { "<leader>m", group = "Macro" },
          { "<leader>mm", desc = "Macroexpand-1" },
          { "<leader>mM", desc = "Macroexpand-all" },
          
          -- Structural editing
          { "<leader>s", group = "Structure" },
          { "<leader>ss", desc = "Slurp right" },
          { "<leader>sb", desc = "Barf right" },
          { "<leader>sS", desc = "Slurp left" },
          { "<leader>sB", desc = "Barf left" },
          { "<leader>sj", desc = "Splice" },
          { "<leader>sk", desc = "Kill & splice" },
          { "<leader>su", desc = "Raise form" },
          { "<leader>st", desc = "Transpose forms" },
          
          -- Go to
          { "<leader>g", group = "Go to" },
          { "<leader>gd", desc = "Go to definition" },
          { "<leader>gr", desc = "Find references" },
          { "<leader>gi", desc = "Go to implementation" },
          
          -- Tests (using capital T to avoid conflict with Telekasten)
          { "<leader>T", group = "Tests" },
          { "<leader>Tt", desc = "Test nearest" },
          { "<leader>Tf", desc = "Test file" },
          { "<leader>Ts", desc = "Test suite" },
          { "<leader>Tl", desc = "Test last" },
          { "<leader>Tv", desc = "Visit test file" },
          { "<leader>Tn", desc = "Run namespace tests" },
          
          -- Workspace
          { "<leader>w", group = "Workspace" },
          { "<leader>wa", desc = "Add workspace folder" },
          { "<leader>wr", desc = "Remove workspace folder" },
        })
      end,
    })
  end,
}

