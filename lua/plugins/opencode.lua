return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Required for toggle(); recommended for ask()/select().
    "folke/snacks.nvim",
  },
  init = function()
    -- Configure plugin (see lua/opencode/config.lua in the repo for all options)
    vim.g.opencode_opts = vim.g.opencode_opts or {}

    -- Enable auto-reload of files that opencode edits
    vim.g.opencode_opts.auto_reload = true

    -- Enable buffer auto-reload so edits applied by opencode are reflected
    -- (needed when using opencode_opts.auto_reload).
    vim.o.autoread = true
  end,
  keys = {
    { "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, mode = { "n", "x" }, desc = "Ask about this" },
    { "<leader>os", function() require("opencode").select() end, mode = { "n", "x" }, desc = "Select prompt" },
    { "<leader>o+", function() require("opencode").prompt("@this") end, mode = { "n", "x" }, desc = "Add this" },
    { "<leader>ot", function() require("opencode").toggle() end, desc = "Toggle embedded" },
    { "<leader>oc", function() require("opencode").command() end, desc = "Select command" },
    { "<leader>on", function() require("opencode").command("session_new") end, desc = "New session" },
    { "<leader>oi", function() require("opencode").command("session_interrupt") end, desc = "Interrupt session" },
    { "<leader>oA", function() require("opencode").command("agent_cycle") end, desc = "Cycle selected agent" },
    { "<S-C-u>", function() require("opencode").command("messages_half_page_up") end, desc = "Messages half page up" },
    { "<S-C-d>", function() require("opencode").command("messages_half_page_down") end, desc = "Messages half page down" },
  },
}
