return {
  "zion-off/mole.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  opts = {
    picker = "snacks",
    keys = {
      annotate = "<leader>ma",       -- visual mode
      start_session = "<leader>ms",  -- normal mode
      stop_session = "<leader>mq",   -- normal mode
      resume_session = "<leader>mr", -- normal mode
      toggle_window = "<leader>mw",  -- normal mode
    },
  },
  config = function(_, opts)
    require("mole").setup(opts)
    
    -- Register with which-key (higher priority than Clojure macro group)
    local ok, wk = pcall(require, "which-key")
    if ok then
      wk.add({
        { "<leader>m", group = "Mole (Annotate)" },
        { "<leader>ma", desc = "Annotate selection", mode = "v" },
        { "<leader>ms", desc = "Start session" },
        { "<leader>mq", desc = "Stop session" },
        { "<leader>mr", desc = "Resume session" },
        { "<leader>mw", desc = "Toggle window" },
      })
    end
  end,
}
